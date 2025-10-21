use comercio;

/*1. Obtén todos los datos de todos los productos registrados*/
select p.id, p.nombre, p.precio
from productos p;

/*2. Obtén el identificador, nombre y correo de todos los usuarios registrados. */
select c.id, c.nombre, c.mail
from clientes c;

/*3. Obtén todos los pedidos realizados con posterioridad al 3 de Agosto de 2025*/
select pd.id, pd.fecha, (select c.nombre from clientes c where c.id = pd.id_cliente) nombre_cliente
from pedidos pd
where pd.fecha > '2025-08-03'
order by pd.fecha;

/*4. Obtén los tres productos registrados con precios más altos*/
select p.id, p.nombre, p.precio
from productos p
order by p.precio desc
limit 3;

/*5. Obtén el nombre del cliente, el identificador de pedido y la fecha de todos los pedidos registrados.*/
select c.nombre, p.id, p.fecha
from clientes c, pedidos p
where c.id = p.id_cliente
order by 1, 2;

/*6. Obtén un listado de los productos solicitados por cada pedido indicando el identificador de pedido, 
	 la fecha, el nombre de producto, las unidades requeridas y el precio por unidad. */
select p.id, p.fecha, pd.nombre, dp.cantidad, pd.precio
from detalle_pedidos dp, pedidos p, productos pd
where dp.id_pedido = p.id
and dp.id_producto = pd.id
order by 1, 3;

/*7. Modifica la consulta anterior añadiendo una columna "precio_venta" 
     que indique por cada producto su importe multiplicando el precio por las unidades solicitadas*/
select p.id, p.fecha, pd.nombre, dp.cantidad, pd.precio, (dp.cantidad * pd.precio) as precio_venta
from detalle_pedidos dp, pedidos p, productos pd
where dp.id_pedido = p.id
and dp.id_producto = pd.id
order by 1, 3;

/*8. Obtén un listado indicando por cada pedido registrado su identificador como una columna "identificador_pedido" 
     y el importe final del mismo en una columna "total_pedido".*/
select p.id identificador_pedido, sum(dp.cantidad * pd.precio) "total_pedido"
from detalle_pedidos dp
inner join pedidos p on p.id = dp.id_pedido
inner join productos pd on pd.id = dp.id_producto
group by p.id;

/*9. Obtén un listado indicando el nombre de cada cliente registrado junto con el total de pedidos realizados como una columna "total_pedidos" 
     ordenados de menor a mayor.*/
select c.id, c.nombre, count(*) "total_pedidos"
from pedidos p
inner join clientes c on c.id = p.id_cliente
group by c.id, c.nombre
order by 3 asc;

/*10. Obtén un listado que muestre el recuento de pedidos registrados por cada fecha como una columna "pedidos_del_dia" junto con las propias fechas.*/
select fecha, count(*) as "pedidos_del_dia"
from pedidos
group by fecha;

/*11. Obtén un listado con el nombre de aquellos clientes que han solicitado dos o más pedidos incluyendo 
      la cantidad de pedidos realizada ordenados por orden alfabético.*/
select c.id, c.nombre, count(*) "total_pedidos"
from pedidos p
inner join clientes c on c.id = p.id_cliente
group by c.id, c.nombre
having count(*) >= 2
order by c.nombre;

/*12. Obtén el nombre y el número de solicitudes del producto más vendidoo.*/
select pd.nombre, sum(dp.cantidad) as "unidades_pedidas"
from detalle_pedidos dp
inner join pedidos p on p.id = dp.id_pedido
inner join productos pd on pd.id = dp.id_producto
group by pd.nombre
order by sum(dp.cantidad) desc;

/*13. Obtén un listado con los datos de los productos solicitados por cada cliente incluyendo 
      su nombre mail, localidad, fecha del pedido, nombre del producto, precio y unidades pedidas.*/
select c.nombre, c.localidad, p.id, p.fecha, pd.nombre, pd.precio, dp.cantidad
from detalle_pedidos dp
inner join pedidos p on p.id = dp.id_pedido
inner join productos pd on pd.id = dp.id_producto
inner join clientes c on c.id = p.id_cliente
order by c.nombre, p.id;

/*14. Obtén un listado indicando el identificador y nombre de aquellos clientes registrados que no han realizado ningún pedido.*/
select c.id, c.nombre
from clientes c
where not exists (select 1 from pedidos p where p.id_cliente = c.id);

/*15. Obtén un listado con el nombre de aquellos clientes que han pedido alguna vez "Zapatos" y el número de unidades solicitadas en cada ocasión.*/
select c.nombre, c.localidad, p.id "id_pedido", p.fecha, pd.nombre, pd.precio, dp.cantidad
from detalle_pedidos dp
inner join pedidos p on p.id = dp.id_pedido
inner join productos pd on pd.id = dp.id_producto
inner join clientes c on c.id = p.id_cliente
where pd.nombre like '%Zapatos%'
order by c.nombre, p.id;
