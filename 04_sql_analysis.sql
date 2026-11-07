4. Identify Purchase Orders Without Items

SELECT
    po.po_id,
    po.amount,
    pi.item_name
FROM purchase_orders po
LEFT JOIN po_items pi
    ON po.po_id = pi.po_id
WHERE pi.item_id IS NULL;

5. Purchase Order Amount Reconciliation

Compare recorded purchase order amounts with calculated item totals.

SELECT
    po.po_id,
    po.amount AS purchase_order_amount,
    SUM(pi.quantity * pi.unit_price) AS calculated_amount,
    po.amount - SUM(pi.quantity * pi.unit_price) AS difference,
    CASE
        WHEN po.amount = SUM(pi.quantity * pi.unit_price)
            THEN 'MATCHED'
        ELSE 'MISMATCHED'
    END AS validation_status
FROM purchase_orders po
JOIN po_items pi
    ON po.po_id = pi.po_id
GROUP BY
    po.po_id,
    po.amount
ORDER BY po.po_id;

6. Investigate Mismatched Purchase Orders

Investigate PO 103 and PO 114 to identify the source of discrepancies.

SELECT
    po.po_id,
    s.supplier_name,
    pi.item_name,
    pi.quantity,
    pi.unit_price,
    (pi.quantity * pi.unit_price) AS item_total
FROM purchase_orders po
JOIN suppliers s
    ON po.supplier_id = s.supplier_id
JOIN po_items pi
    ON po.po_id = pi.po_id
WHERE po.po_id IN (103, 114)
ORDER BY po.po_id;

7. Classify Overstated and Understated Amounts

SELECT
    po.po_id,
    po.amount AS po_amount,

    SUM(pi.quantity * pi.unit_price)
        AS calculated_amount,

    po.amount -
    SUM(pi.quantity * pi.unit_price)
        AS difference,

    CASE
        WHEN po.amount = SUM(pi.quantity * pi.unit_price)
            THEN 'MATCHED'

        WHEN po.amount > SUM(pi.quantity * pi.unit_price)
            THEN 'OVERSTATED'

        ELSE 'UNDERSTATED'
    END AS investigation_status

FROM purchase_orders po

JOIN po_items pi
    ON po.po_id = pi.po_id

GROUP BY
    po.po_id,
    po.amount

HAVING po.po_id IN (103, 114);

8. Duplicate Purchase Order Item Check

Identify repeated item names within the same purchase order.

SELECT
    po_id,
    item_name,
    COUNT(*) AS duplicate_count
FROM po_items
GROUP BY
    po_id,
    item_name
HAVING COUNT(*) > 1;

9. Duplicate Purchase Order ID Check

SELECT
    po_id,
    COUNT(*) AS occurrence_count
FROM purchase_orders
GROUP BY po_id
HAVING COUNT(*) > 1;

10. Supplier Reference Validation

Identify purchase orders that do not have a matching supplier.

SELECT
    po.po_id,
    po.supplier_id,
    s.supplier_name,

    CASE
        WHEN s.supplier_id IS NULL
            THEN 'INVALID SUPPLIER'
        ELSE 'VALID SUPPLIER'
    END AS supplier_status

FROM purchase_orders po

LEFT JOIN suppliers s
    ON po.supplier_id = s.supplier_id;

11. Missing Data Validation

Check for missing supplier IDs, order dates and purchase order amounts.

SELECT
    COUNT(*) AS total_records,

    SUM(CASE
        WHEN supplier_id IS NULL THEN 1
        ELSE 0
    END) AS missing_supplier,

    SUM(CASE
        WHEN order_date IS NULL THEN 1
        ELSE 0
    END) AS missing_order_date,

    SUM(CASE
        WHEN amount IS NULL THEN 1
        ELSE 0
    END) AS missing_amount

FROM purchase_orders;

12. Final Purchase Order Reconciliation Report

Generate a consolidated report that includes purchase orders with and without item records.

SELECT
    po.po_id,
    s.supplier_name,
    po.amount AS po_amount,

    COALESCE(
        SUM(pi.quantity * pi.unit_price), 0
    ) AS calculated_amount,

    po.amount -
    COALESCE(
        SUM(pi.quantity * pi.unit_price), 0
    ) AS difference,

    CASE
        WHEN COUNT(pi.item_id) = 0
            THEN 'NO ITEMS'

        WHEN po.amount =
             SUM(pi.quantity * pi.unit_price)
            THEN 'MATCHED'

        WHEN po.amount >
             SUM(pi.quantity * pi.unit_price)
            THEN 'OVERSTATED'

        ELSE 'UNDERSTATED'
    END AS validation_status

FROM purchase_orders po

LEFT JOIN suppliers s
    ON po.supplier_id = s.supplier_id

LEFT JOIN po_items pi
    ON po.po_id = pi.po_id

GROUP BY
    po.po_id,
    s.supplier_name,
    po.amount

ORDER BY po.po_id;