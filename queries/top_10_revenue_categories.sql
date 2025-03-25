-- TODO: Esta consulta devolverá una tabla con las 10 categorías con mayores ingresos
-- (en inglés), el número de pedidos y sus ingresos totales. La primera columna será
-- Category, que contendrá las 10 categorías con mayores ingresos; la segunda será
-- Num_order, con el total de pedidos de cada categoría; y la última será Revenue,
-- con el ingreso total de cada categoría.
-- PISTA: Todos los pedidos deben tener un estado 'delivered' y tanto la categoría
-- como la fecha real de entrega no deben ser nulas.

SELECT
	PCNT.product_category_name_english AS Category,
	COUNT(DISTINCT OO.order_id) AS Num_order,
	SUM(OOP.payment_value) AS Revenue
FROM
	OLIST_ORDERS OO
JOIN OLIST_ORDER_ITEMS OOI
    ON
	OO.order_id = OOI.order_id
JOIN OLIST_ORDER_PAYMENTS OOP
    ON
	OO.order_id = OOP.order_id
JOIN OLIST_PRODUCTS OP
    ON
	OOI.product_id = OP.product_id
JOIN PRODUCT_CATEGORY_NAME_TRANSLATION PCNT
    ON
	OP.product_category_name = PCNT.product_category_name
WHERE
	OO.order_status = 'delivered'
	AND OO.order_delivered_customer_date IS NOT NULL
    AND PCNT.product_category_name_english IS NOT NULL
GROUP BY
	PCNT.product_category_name_english
ORDER BY
	Revenue DESC
LIMIT 10;

