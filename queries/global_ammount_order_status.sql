-- TODO: Esta consulta devolverá una tabla con dos columnas: estado_pedido y
-- Cantidad. La primera contendrá las diferentes clases de estado de los pedidos,
-- y la segunda mostrará el total de cada uno.

SELECT
 order_status AS order_status,
 COUNT(order_status) AS Ammount
FROM olist_orders
GROUP BY order_status;

