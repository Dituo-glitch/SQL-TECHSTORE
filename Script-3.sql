create table estado (
ID SERIAL primary key, 
NOMBRE varchar(50) not null,
decription varchar(255) null
);

insert into estado (nombre)
values 
('Baja California'),
('Baja California Sur'),
('Campeche'),
('Chiapas'),
('Colima'),
('Guerrero'),
('Jalisco'),
('Michoacán'),
('Nayarit'),
('Oaxaca'),
('Quintana Roo'),
('Sinaloa'),
('Sonora'),
('Tabasco'),
('Tamaulipas'),
('Veracruz'),
('Yucatán');

create table ciudad (
ID SERIAL primary key, 
NOMBRE varchar(50) not null,
decription varchar(255) null
);

insert into ciudad (nombre)
values 
('Leon'),
('San Luis Potosi'),
('Tijuana'),
('Culiacan'),
('Mexicali'),
('Morelia'),
('Saltillo'),
('Monterrey'),
('Veracruz'),
('Juarez'),
('Chihuahua'),
('Acapulco'),
('Zopopan'),
('Merida'),
('Queretaro'),
('Aguascaliente'),
('Hermosillo'),
('Guadalajara'),
('Ciudad de Mexico'),
('Puebla');



alter table ciudad 
add constraint fk_ciudad_estado
foreign key (estado_id) references estado(id);

alter table ciudad 
add column if not exists estado_id int;

alter table clientes 
add column if not exists ciudad_id int;

alter table clientes 
add constraint fk_clientes_ciudad
foreign key (ciudad_id) references ciudad(id);



select distinct(estado) from clientes;

update clientes set ciudad_id = 1 where ciudad = 'León';
update ciudad set estado_id = 2 where ciudad = 'Leon';