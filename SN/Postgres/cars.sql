-- ...DEFINICION BASE DE DATOS...
-- Creacion de tablas.
 create table coche (
    id_coche integer not null,
    marca varchar(30),
    modelo Varchar(30),
    color varchar(30),
    primary key( id_coche)
);
create table venta (
    id_venta integer not null,
    id_coche integer,
    precio integer,
    fecha_venta varchar(30),
    primary key (id_venta)
);
create table stock (
    id_coche integer not null,
    disponible integer,
    primary key(id_coche)
);
-- Inserccion de datos de prueba.
insert into coche (id_coche, marca, modelo, color)
     values (0001, 'Citroen', 'Picaso', 'Blanco');
insert into coche (id_coche, marca, modelo, color)
    values (0002, 'Citroen', 'Picaso', 'Negro');
insert into coche (id_coche, marca, modelo, color)
    values (0003, 'Citroen', 'Picaso', 'Rojo');
insert into coche (id_coche, marca, modelo, color)
    values (0004, 'Citroen', 'Picaso', 'Azul');
insert into coche (id_coche, marca, modelo, color)
    values (0005, 'Citroen', 'Picasa', 'Rojo');
insert into stock (id_coche, disponible)
    values (0001, 8);
insert into venta (id_venta, id_coche, precio, fecha_venta)
    values (1,0001,8000,'03/10/2012');
insert into venta (id_venta, id_coche, precio, fecha_venta)
    values (2,0001,8000,'07/10/2012');
insert into venta (id_venta, id_coche, precio, fecha_venta)
    values (3,0002,8000,'03/10/2015');

-- ...SELECTS_BASICOS...
-- Seleccionar todos los coches rojos.
select *
from coche
where color = 'Rojo';
-- Seleccionar el id de todos los cocoches vendidos el año pasado.
select coche.id_coche
from coche
left join venta on coche.id_coche = venta.id_coche
where fecha_venta like '%2015';

-- ...TRIGGER...
-- DEFINICION TRIGGER.
-- Funcion a lanzar por el trigger.
CREATE OR REPLACE FUNCTION venta_menos_stock()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE stock
    SET disponible = disponible - 1
    WHERE stock.id_coche = new.id_coche;
    RETURN new;
END;
$$ language plpgsql;

-- Trigger a lanzar cuando se registra una nueva venta.
CREATE TRIGGER nueva_venta
AFTER INSERT ON venta
FOR EACH ROW
EXECUTE PROCEDURE venta_menos_stock();

-- COMPROBACION.
-- Comprobamos el estado actual de ambas tablas.
select * from stock;
select * from venta;

-- Hacemos una inserccion en venta para activar el trigger.
insert into venta (id_venta, id_coche, precio, fecha_venta) values (5,0001,8000,'07/10/2012');

-- Comprobamos ambas tablas tras la inserccion, comprando el trigger.
select * from stock;
select * from venta;
