--
-- PostgreSQL database dump
--

\restrict TcyDEO2cleu3YFKblakyHtC2TUo4kfOM9UdFctldmfcSqrDQnTArdN329FocyPQ

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-10-27 09:26:45

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 24578)
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    categoria_id integer NOT NULL,
    nombre character varying(80) NOT NULL,
    descripcion text,
    activa boolean DEFAULT true
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 24714)
-- Name: ciudad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ciudad (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    estado_id integer
);


ALTER TABLE public.ciudad OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 24713)
-- Name: ciudad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ciudad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ciudad_id_seq OWNER TO postgres;

--
-- TOC entry 5105 (class 0 OID 0)
-- Dependencies: 229
-- Name: ciudad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ciudad_id_seq OWNED BY public.ciudad.id;


--
-- TOC entry 220 (class 1259 OID 24586)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    cliente_id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(60) NOT NULL,
    email character varying(100),
    telefono character varying(20),
    region_id integer,
    fecha_registro date,
    tipo_cliente character varying(20) DEFAULT 'regular'::character varying,
    ciudad_id integer
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24593)
-- Name: departamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamentos (
    departamento_id integer NOT NULL,
    nombre character varying(80) NOT NULL,
    presupuesto numeric(12,2),
    region_id integer
);


ALTER TABLE public.departamentos OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24598)
-- Name: detalle_pedidos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalle_pedidos (
    detalle_id integer NOT NULL,
    pedido_id integer,
    producto_id integer,
    cantidad integer DEFAULT 1 NOT NULL,
    precio_unitario numeric(10,2) NOT NULL,
    descuento_linea numeric(5,2) DEFAULT 0
);


ALTER TABLE public.detalle_pedidos OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24606)
-- Name: empleados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleados (
    empleado_id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    email character varying(100),
    puesto character varying(60),
    salario numeric(10,2),
    fecha_contrato date,
    departamento_id integer,
    jefe_id integer
);


ALTER TABLE public.empleados OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 24705)
-- Name: estado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estado (
    id integer NOT NULL,
    nombre character varying(50)
);


ALTER TABLE public.estado OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 24704)
-- Name: estado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estado_id_seq OWNER TO postgres;

--
-- TOC entry 5106 (class 0 OID 0)
-- Dependencies: 227
-- Name: estado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estado_id_seq OWNED BY public.estado.id;


--
-- TOC entry 224 (class 1259 OID 24612)
-- Name: pedidos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos (
    pedido_id integer NOT NULL,
    cliente_id integer,
    empleado_id integer,
    fecha_pedido date NOT NULL,
    fecha_entrega date,
    estado character varying(20) DEFAULT 'pendiente'::character varying,
    total numeric(12,2),
    descuento numeric(5,2) DEFAULT 0,
    metodo_pago character varying(30),
    region_id integer
);


ALTER TABLE public.pedidos OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24619)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    producto_id integer NOT NULL,
    nombre character varying(120) NOT NULL,
    marca character varying(50),
    modelo character varying(60),
    categoria_id integer,
    precio_compra numeric(10,2),
    precio_venta numeric(10,2),
    stock integer DEFAULT 0,
    stock_minimo integer DEFAULT 5,
    activo boolean DEFAULT true
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 24627)
-- Name: regiones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regiones (
    region_id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    pais character varying(50) DEFAULT 'México'::character varying NOT NULL
);


ALTER TABLE public.regiones OWNER TO postgres;

--
-- TOC entry 4904 (class 2604 OID 24717)
-- Name: ciudad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudad ALTER COLUMN id SET DEFAULT nextval('public.ciudad_id_seq'::regclass);


--
-- TOC entry 4903 (class 2604 OID 24708)
-- Name: estado id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado ALTER COLUMN id SET DEFAULT nextval('public.estado_id_seq'::regclass);


--
-- TOC entry 5088 (class 0 OID 24578)
-- Dependencies: 219
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categorias VALUES (1, 'Smartphones', 'Teléfonos inteligentes y accesorios', true);
INSERT INTO public.categorias VALUES (2, 'Laptops', 'Computadoras portátiles de todas las marcas', true);
INSERT INTO public.categorias VALUES (3, 'Tablets', 'Tabletas electrónicas', true);
INSERT INTO public.categorias VALUES (4, 'Televisores', 'Pantallas y televisores', true);
INSERT INTO public.categorias VALUES (5, 'Audio', 'Audífonos, bocinas y equipos de sonido', true);
INSERT INTO public.categorias VALUES (6, 'Gaming', 'Consolas, videojuegos y accesorios', true);
INSERT INTO public.categorias VALUES (7, 'Cámaras', 'Cámaras fotográficas y de video', true);
INSERT INTO public.categorias VALUES (8, 'Wearables', 'Relojes inteligentes y pulseras fitness', true);
INSERT INTO public.categorias VALUES (9, 'Hogar Inteligente', 'Dispositivos para el hogar conectado', true);
INSERT INTO public.categorias VALUES (10, 'Accesorios', 'Cables, cargadores y periféricos', true);
INSERT INTO public.categorias VALUES (11, 'Impresoras', 'Impresoras y escáneres', true);
INSERT INTO public.categorias VALUES (12, 'Componentes PC', 'Procesadores, RAM, almacenamiento', true);
INSERT INTO public.categorias VALUES (13, 'Redes', 'Routers, switches y equipos de red', true);
INSERT INTO public.categorias VALUES (14, 'Energía', 'Baterías, cargadores y UPS', true);
INSERT INTO public.categorias VALUES (15, 'Software', 'Licencias y suscripciones de software', false);


--
-- TOC entry 5099 (class 0 OID 24714)
-- Dependencies: 230
-- Data for Name: ciudad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ciudad VALUES (1, 'Léon', 2);
INSERT INTO public.ciudad VALUES (2, 'San Luis Potosí', 25);
INSERT INTO public.ciudad VALUES (3, 'Tijuana', 1);
INSERT INTO public.ciudad VALUES (4, 'Culiacán', 12);
INSERT INTO public.ciudad VALUES (5, 'Mexicali', 1);
INSERT INTO public.ciudad VALUES (6, 'Morelia', 8);
INSERT INTO public.ciudad VALUES (7, 'Saltillo', 18);
INSERT INTO public.ciudad VALUES (8, 'Monterrey', 19);
INSERT INTO public.ciudad VALUES (9, 'Veracruz', 16);
INSERT INTO public.ciudad VALUES (10, 'Juárez', 20);
INSERT INTO public.ciudad VALUES (11, 'Chihuahua', 20);
INSERT INTO public.ciudad VALUES (12, 'Acapulco', 6);
INSERT INTO public.ciudad VALUES (13, 'Zapopan', 7);
INSERT INTO public.ciudad VALUES (14, 'Merida', 17);
INSERT INTO public.ciudad VALUES (15, 'Querétaro', 21);
INSERT INTO public.ciudad VALUES (16, 'Aguascalientes', 22);
INSERT INTO public.ciudad VALUES (17, 'Hermosillo', 22);
INSERT INTO public.ciudad VALUES (18, 'Guadalajara', 7);
INSERT INTO public.ciudad VALUES (19, 'Ciudad de México', 23);
INSERT INTO public.ciudad VALUES (20, 'Puebla', 24);


--
-- TOC entry 5089 (class 0 OID 24586)
-- Dependencies: 220
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.clientes VALUES (2, 'Fernanda', 'Jiménez Ortega', 'fernanda2@gmail.com', '5598817918', 5, '2025-12-18', 'regular', 2);
INSERT INTO public.clientes VALUES (13, 'Carmen', 'Rivera Gutiérrez', 'carmen13@gmail.com', '5544061458', 5, '2023-03-16', 'regular', 2);
INSERT INTO public.clientes VALUES (131, 'Miguel', 'Díaz Torres', 'miguel131@hotmail.com', '5569895766', 5, '2022-12-07', 'regular', 2);
INSERT INTO public.clientes VALUES (130, 'Roberto', 'Núñez Flores', 'roberto130@gmail.com', '5598520663', 7, '2025-07-14', 'mayorista', 3);
INSERT INTO public.clientes VALUES (147, 'Claudia', 'Mendoza Hernández', 'claudia147@gmail.com', '5574625235', 7, '2022-12-05', 'regular', 3);
INSERT INTO public.clientes VALUES (184, 'Laura', 'Moreno Vargas', 'laura184@gmail.com', '5587796412', 5, '2023-01-03', 'regular', 2);
INSERT INTO public.clientes VALUES (194, 'Alejandro', 'González Reyes', 'alejandro194@gmail.com', '5511592230', 5, '2021-12-22', 'regular', 2);
INSERT INTO public.clientes VALUES (211, 'Rosa', 'Rodríguez Gutiérrez', 'rosa211@yahoo.com', '5535636010', 5, '2022-07-17', 'regular', 2);
INSERT INTO public.clientes VALUES (277, 'Luis', 'Jiménez Herrera', 'luis277@yahoo.com', '5552441045', 5, '2024-12-03', 'premium', 2);
INSERT INTO public.clientes VALUES (251, 'María', 'Torres Díaz', 'maría251@gmail.com', '5582670169', 7, '2023-10-15', 'regular', 3);
INSERT INTO public.clientes VALUES (269, 'Isabel', 'Díaz Rodríguez', 'isabel269@gmail.com', '5586224438', 7, '2025-04-29', 'regular', 3);
INSERT INTO public.clientes VALUES (362, 'Liliana', 'González Pérez', 'liliana362@gmail.com', '5596388439', 5, '2024-08-19', 'premium', 2);
INSERT INTO public.clientes VALUES (443, 'Eduardo', 'Pérez López', 'eduardo443@gmail.com', '5593917830', 5, '2021-11-29', 'premium', 2);
INSERT INTO public.clientes VALUES (489, 'Valeria', 'Sánchez Díaz', 'valeria489@hotmail.com', '5582155988', 5, '2024-08-13', 'regular', 2);
INSERT INTO public.clientes VALUES (492, 'Luis', 'Flores Ortega', 'luis492@gmail.com', '5595765571', 5, '2025-12-03', 'regular', 2);
INSERT INTO public.clientes VALUES (569, 'Diego', 'Rivera Herrera', 'diego569@yahoo.com', '5547988968', 5, '2022-07-16', 'vip', 2);
INSERT INTO public.clientes VALUES (598, 'Carmen', 'Cruz Rivera', 'carmen598@gmail.com', '5577408068', 5, '2024-11-24', 'nuevo', 2);
INSERT INTO public.clientes VALUES (605, 'Valeria', 'Núñez Moreno', 'valeria605@hotmail.com', '5525819626', 5, '2024-10-07', 'regular', 2);
INSERT INTO public.clientes VALUES (632, 'María', 'Castro Núñez', 'maría632@gmail.com', '5571128254', 2, '2022-06-23', 'premium', 6);
INSERT INTO public.clientes VALUES (701, 'Manuel', 'Jiménez Rodríguez', 'manuel701@gmail.com', '5561212562', 5, '2021-09-15', 'premium', 2);
INSERT INTO public.clientes VALUES (681, 'Diego', 'Ramírez Herrera', 'diego681@gmail.com', '5597280725', 7, '2025-10-01', 'nuevo', 3);
INSERT INTO public.clientes VALUES (724, 'Isabel', 'Gómez Martínez', 'isabel724@gmail.com', '5588863503', 5, '2025-07-07', 'premium', 2);
INSERT INTO public.clientes VALUES (811, 'Miguel', 'Morales Reyes', 'miguel811@yahoo.com', '5574101392', 5, '2022-01-23', 'mayorista', 2);
INSERT INTO public.clientes VALUES (854, 'Alejandra', 'Vargas Cruz', 'alejandra854@gmail.com', '5568477341', 5, '2022-03-13', 'regular', 2);
INSERT INTO public.clientes VALUES (863, 'Alejandra', 'Ramos Cruz', 'alejandra863@gmail.com', '5570914632', 5, '2025-10-30', 'premium', 2);
INSERT INTO public.clientes VALUES (871, 'Eduardo', 'Morales Reyes', 'eduardo871@gmail.com', '5534167825', 5, '2021-09-24', 'regular', 2);
INSERT INTO public.clientes VALUES (883, 'Sandra', 'Martínez Reyes', 'sandra883@yahoo.com', '5531064869', 5, '2024-10-02', 'regular', 2);
INSERT INTO public.clientes VALUES (922, 'Fernando', 'Castillo Reyes', 'fernando922@hotmail.com', '5510432769', 5, '2024-11-28', 'regular', 2);
INSERT INTO public.clientes VALUES (925, 'Mónica', 'López Castro', 'mónica925@gmail.com', '5543115824', 5, '2021-10-01', 'premium', 2);
INSERT INTO public.clientes VALUES (940, 'Andrés', 'García Moreno', 'andrés940@hotmail.com', '5550437430', 5, '2025-12-29', 'regular', 2);
INSERT INTO public.clientes VALUES (907, 'Rosa', 'López Núñez', 'rosa907@gmail.com', '5529661777', 7, '2025-07-09', 'regular', 3);
INSERT INTO public.clientes VALUES (971, 'Liliana', 'Díaz Díaz', 'liliana971@gmail.com', '5513141814', 5, '2023-04-29', 'premium', 2);
INSERT INTO public.clientes VALUES (976, 'Andrés', 'Rodríguez Núñez', 'andrés976@gmail.com', '5563694387', 5, '2026-06-05', 'regular', 2);
INSERT INTO public.clientes VALUES (986, 'Verónica', 'Castillo García', 'verónica986@hotmail.com', '5518024377', 5, '2021-11-22', 'regular', 2);
INSERT INTO public.clientes VALUES (1007, 'Valeria', 'Reyes Morales', 'valeria1007@gmail.com', '5596607967', 5, '2024-12-17', 'mayorista', 2);
INSERT INTO public.clientes VALUES (1034, 'David', 'Núñez Sánchez', 'david1034@gmail.com', '5537071907', 5, '2025-07-12', 'regular', 2);
INSERT INTO public.clientes VALUES (1118, 'Carlos', 'Morales Martínez', 'carlos1118@yahoo.com', '5562185014', 5, '2023-08-27', 'nuevo', 2);
INSERT INTO public.clientes VALUES (1120, 'Valeria', 'Ramos Hernández', 'valeria1120@gmail.com', '5516336089', 5, '2024-04-14', 'regular', 2);
INSERT INTO public.clientes VALUES (1119, 'Ana', 'Reyes Aguilar', 'ana1119@hotmail.com', '5551220925', 3, '2022-04-02', 'vip', 9);
INSERT INTO public.clientes VALUES (1168, 'Carlos', 'Ramos Mendoza', 'carlos1168@hotmail.com', '5519446616', 7, '2023-03-06', 'premium', 3);
INSERT INTO public.clientes VALUES (1202, 'Fernanda', 'Rodríguez Flores', 'fernanda1202@gmail.com', '5514635073', 5, '2024-08-17', 'regular', 2);
INSERT INTO public.clientes VALUES (1231, 'Alberto', 'Ramírez Castro', 'alberto1231@hotmail.com', '5596632730', 7, '2023-12-01', 'premium', 4);
INSERT INTO public.clientes VALUES (1259, 'Francisco', 'Moreno Ramírez', 'francisco1259@gmail.com', '5511188832', 5, '2021-07-04', 'mayorista', 2);
INSERT INTO public.clientes VALUES (1273, 'Fernando', 'Herrera Jiménez', 'fernando1273@gmail.com', '5528693532', 5, '2025-05-18', 'premium', 2);
INSERT INTO public.clientes VALUES (1282, 'María', 'Martínez Flores', 'maría1282@gmail.com', '5547201638', 5, '2024-01-13', 'regular', 2);
INSERT INTO public.clientes VALUES (1261, 'Pablo', 'Gutiérrez Vargas', 'pablo1261@gmail.com', '5519518525', 7, '2022-09-14', 'regular', 3);
INSERT INTO public.clientes VALUES (1374, 'Verónica', 'Núñez Ortega', 'verónica1374@gmail.com', '5583291553', 5, '2023-05-07', 'premium', 2);
INSERT INTO public.clientes VALUES (1318, 'Pablo', 'Ramírez Gómez', 'pablo1318@yahoo.com', '5511626011', 7, '2025-05-09', 'regular', 3);
INSERT INTO public.clientes VALUES (1384, 'Elena', 'Sánchez Ramos', 'elena1384@yahoo.com', '5562978256', 7, '2025-03-22', 'regular', 3);
INSERT INTO public.clientes VALUES (1416, 'Mónica', 'Núñez López', 'mónica1416@gmail.com', '5525481681', 7, '2026-02-21', 'regular', 3);
INSERT INTO public.clientes VALUES (1401, 'Patricia', 'Sánchez Díaz', 'patricia1401@gmail.com', '5537509178', 7, '2024-02-18', 'regular', 4);
INSERT INTO public.clientes VALUES (1407, 'Ramón', 'Ramírez García', 'ramón1407@yahoo.com', '5557902263', 7, '2023-04-29', 'premium', 4);
INSERT INTO public.clientes VALUES (1439, 'Isabel', 'López Cruz', 'isabel1439@gmail.com', '5562369622', 5, '2022-11-26', 'regular', 2);
INSERT INTO public.clientes VALUES (1445, 'Valeria', 'Hernández Torres', 'valeria1445@gmail.com', '5517720663', 5, '2025-02-07', 'regular', 2);
INSERT INTO public.clientes VALUES (1483, 'Sofía', 'Ramírez Aguilar', 'sofía1483@yahoo.com', '5582674616', 7, '2025-02-04', 'regular', 3);
INSERT INTO public.clientes VALUES (1512, 'Isabel', 'Sánchez Díaz', 'isabel1512@gmail.com', '5582726901', 5, '2022-01-19', 'regular', 2);
INSERT INTO public.clientes VALUES (1531, 'Manuel', 'Flores García', 'manuel1531@gmail.com', '5575467163', 5, '2021-10-26', 'regular', 2);
INSERT INTO public.clientes VALUES (1514, 'Manuel', 'Díaz Ramos', 'manuel1514@gmail.com', '5543657954', 2, '2024-10-22', 'premium', 6);
INSERT INTO public.clientes VALUES (1601, 'Sergio', 'Rivera Reyes', 'sergio1601@gmail.com', '5576039568', 5, '2025-04-29', 'mayorista', 2);
INSERT INTO public.clientes VALUES (1567, 'Luis', 'Pérez Morales', 'luis1567@gmail.com', '5553872657', 7, '2023-03-13', 'nuevo', 3);
INSERT INTO public.clientes VALUES (1632, 'Alejandro', 'Núñez Jiménez', 'alejandro1632@yahoo.com', '5578679294', 5, '2025-08-05', 'regular', 2);
INSERT INTO public.clientes VALUES (1652, 'Miguel', 'García Jiménez', 'miguel1652@gmail.com', '5586826207', 5, '2021-12-02', 'regular', 2);
INSERT INTO public.clientes VALUES (1700, 'José', 'Castillo Aguilar', 'josé1700@gmail.com', '5540171534', 5, '2026-06-08', 'mayorista', 2);
INSERT INTO public.clientes VALUES (1788, 'Eduardo', 'Hernández Torres', 'eduardo1788@gmail.com', '5544190049', 5, '2022-10-07', 'regular', 2);
INSERT INTO public.clientes VALUES (1740, 'Laura', 'Moreno Rodríguez', 'laura1740@gmail.com', '5521098866', 7, '2025-06-03', 'regular', 3);
INSERT INTO public.clientes VALUES (1785, 'Juan', 'Ortega López', 'juan1785@gmail.com', '5537249427', 3, '2024-02-03', 'regular', 20);
INSERT INTO public.clientes VALUES (1816, 'Ana', 'Hernández García', 'ana1816@gmail.com', '5574940567', 5, '2022-05-10', 'regular', 1);
INSERT INTO public.clientes VALUES (1848, 'Alberto', 'López Vargas', 'alberto1848@gmail.com', '5554132892', 5, '2025-05-22', 'regular', 2);
INSERT INTO public.clientes VALUES (1852, 'Alejandra', 'Morales Gómez', 'alejandra1852@yahoo.com', '5570416623', 5, '2021-06-25', 'vip', 2);
INSERT INTO public.clientes VALUES (1801, 'Sandra', 'Gómez Mendoza', 'sandra1801@yahoo.com', '5547628906', 7, '2026-01-01', 'regular', 3);
INSERT INTO public.clientes VALUES (1809, 'Luis', 'Morales Reyes', 'luis1809@gmail.com', '5532415998', 7, '2025-10-08', 'regular', 3);
INSERT INTO public.clientes VALUES (1860, 'Mario', 'Sánchez Torres', 'mario1860@gmail.com', '5545128164', 5, '2022-04-07', 'regular', 2);
INSERT INTO public.clientes VALUES (1894, 'Liliana', 'Mendoza Castillo', 'liliana1894@yahoo.com', '5581642266', 5, '2022-06-13', 'regular', 2);
INSERT INTO public.clientes VALUES (1904, 'Gabriela', 'Torres Cruz', 'gabriela1904@gmail.com', '5512485938', 5, '2023-08-18', 'mayorista', 2);
INSERT INTO public.clientes VALUES (1869, 'Patricia', 'Castro Ramos', 'patricia1869@gmail.com', '5524312453', 7, '2022-01-29', 'regular', 3);
INSERT INTO public.clientes VALUES (1879, 'Alejandro', 'Pérez Hernández', 'alejandro1879@hotmail.com', '5517844402', 7, '2025-03-01', 'regular', 3);
INSERT INTO public.clientes VALUES (1892, 'Manuel', 'Sánchez Gutiérrez', 'manuel1892@gmail.com', '5569150591', 7, '2022-01-08', 'premium', 3);
INSERT INTO public.clientes VALUES (1942, 'Daniela', 'Ortega Aguilar', 'daniela1942@yahoo.com', '5537399209', 5, '2022-12-26', 'regular', 2);
INSERT INTO public.clientes VALUES (1946, 'Claudia', 'García Gutiérrez', 'claudia1946@hotmail.com', '5571375663', 5, '2022-08-07', 'premium', 2);
INSERT INTO public.clientes VALUES (1921, 'Sergio', 'Moreno Rodríguez', 'sergio1921@yahoo.com', '5568534862', 7, '2025-06-10', 'regular', 3);
INSERT INTO public.clientes VALUES (1934, 'Manuel', 'Torres Herrera', 'manuel1934@hotmail.com', '5535484177', 7, '2022-09-21', 'regular', 3);
INSERT INTO public.clientes VALUES (1955, 'Luis', 'Gutiérrez Rivera', 'luis1955@hotmail.com', '5511955403', 7, '2023-12-09', 'premium', 3);
INSERT INTO public.clientes VALUES (1, 'Patricia', 'Vargas Reyes', 'patricia1@hotmail.com', '5517504382', 5, '2024-12-30', 'vip', 1);
INSERT INTO public.clientes VALUES (36, 'Alejandro', 'Sánchez Ramírez', 'alejandro36@hotmail.com', '5559113508', 5, '2023-08-25', 'regular', 1);
INSERT INTO public.clientes VALUES (126, 'Mónica', 'Aguilar Vargas', 'mónica126@hotmail.com', '5525189633', 5, '2022-01-29', 'regular', 1);
INSERT INTO public.clientes VALUES (136, 'Valeria', 'Núñez López', 'valeria136@yahoo.com', '5533924094', 5, '2022-09-04', 'regular', 1);
INSERT INTO public.clientes VALUES (176, 'Fernanda', 'Gómez Díaz', 'fernanda176@gmail.com', '5598917575', 5, '2023-10-13', 'regular', 1);
INSERT INTO public.clientes VALUES (229, 'Luis', 'Ramos Hernández', 'luis229@gmail.com', '5533607235', 5, '2022-01-15', 'regular', 1);
INSERT INTO public.clientes VALUES (234, 'Ana', 'Ramírez González', 'ana234@yahoo.com', '5566133052', 5, '2022-03-07', 'regular', 1);
INSERT INTO public.clientes VALUES (235, 'Adriana', 'Rodríguez Mendoza', 'adriana235@gmail.com', '5592077910', 5, '2023-03-16', 'nuevo', 1);
INSERT INTO public.clientes VALUES (255, 'Roberto', 'Jiménez Núñez', 'roberto255@hotmail.com', '5534465275', 5, '2021-09-27', 'premium', 1);
INSERT INTO public.clientes VALUES (266, 'Andrés', 'Ramos Díaz', 'andrés266@gmail.com', '5548739802', 5, '2021-12-04', 'premium', 1);
INSERT INTO public.clientes VALUES (282, 'Andrés', 'Castro Jiménez', 'andrés282@gmail.com', '5555908520', 5, '2022-06-19', 'regular', 1);
INSERT INTO public.clientes VALUES (404, 'José', 'Reyes Gutiérrez', 'josé404@yahoo.com', '5595320264', 5, '2026-04-25', 'regular', 1);
INSERT INTO public.clientes VALUES (412, 'Andrés', 'Castillo Núñez', 'andrés412@gmail.com', '5565958370', 5, '2025-08-20', 'regular', 1);
INSERT INTO public.clientes VALUES (426, 'Valeria', 'Gómez Ramírez', 'valeria426@hotmail.com', '5582716383', 5, '2024-11-04', 'regular', 1);
INSERT INTO public.clientes VALUES (507, 'Mónica', 'González Morales', 'mónica507@gmail.com', '5531658249', 5, '2021-09-28', 'regular', 1);
INSERT INTO public.clientes VALUES (537, 'Patricia', 'Ramírez Sánchez', 'patricia537@gmail.com', '5598933292', 5, '2026-05-17', 'regular', 1);
INSERT INTO public.clientes VALUES (579, 'Alejandra', 'Torres Ortega', 'alejandra579@yahoo.com', '5582143514', 5, '2024-03-03', 'mayorista', 1);
INSERT INTO public.clientes VALUES (581, 'Sofía', 'Herrera Herrera', 'sofía581@hotmail.com', '5525747238', 5, '2021-08-11', 'regular', 1);
INSERT INTO public.clientes VALUES (610, 'Isabel', 'Sánchez Morales', 'isabel610@yahoo.com', '5567491018', 5, '2023-06-09', 'mayorista', 1);
INSERT INTO public.clientes VALUES (646, 'Laura', 'Pérez González', 'laura646@hotmail.com', '5569636452', 5, '2024-09-20', 'regular', 1);
INSERT INTO public.clientes VALUES (708, 'Francisco', 'Aguilar Ramos', 'francisco708@gmail.com', '5554975010', 5, '2023-03-28', 'nuevo', 1);
INSERT INTO public.clientes VALUES (718, 'Mario', 'Gómez Castro', 'mario718@hotmail.com', '5531622965', 5, '2024-10-08', 'regular', 1);
INSERT INTO public.clientes VALUES (756, 'Elena', 'Rodríguez Flores', 'elena756@gmail.com', '5532366774', 5, '2024-07-31', 'mayorista', 1);
INSERT INTO public.clientes VALUES (786, 'Carmen', 'González Aguilar', 'carmen786@gmail.com', '5542303777', 5, '2023-07-30', 'premium', 1);
INSERT INTO public.clientes VALUES (851, 'Patricia', 'Vega Hernández', 'patricia851@gmail.com', '5513212026', 5, '2026-01-13', 'regular', 1);
INSERT INTO public.clientes VALUES (896, 'Sofía', 'Díaz Castillo', 'sofía896@yahoo.com', '5511828652', 5, '2023-07-13', 'premium', 1);
INSERT INTO public.clientes VALUES (900, 'Claudia', 'Cruz Pérez', 'claudia900@gmail.com', '5528164926', 5, '2023-07-04', 'premium', 1);
INSERT INTO public.clientes VALUES (902, 'Verónica', 'Cruz Flores', 'verónica902@hotmail.com', '5589786327', 5, '2026-01-26', 'regular', 1);
INSERT INTO public.clientes VALUES (917, 'Verónica', 'Mendoza Martínez', 'verónica917@yahoo.com', '5530561048', 5, '2021-07-24', 'mayorista', 1);
INSERT INTO public.clientes VALUES (924, 'José', 'Rodríguez Flores', 'josé924@gmail.com', '5512698765', 5, '2022-01-08', 'regular', 1);
INSERT INTO public.clientes VALUES (933, 'Ana', 'Flores Castillo', 'ana933@yahoo.com', '5511060092', 5, '2024-01-30', 'regular', 1);
INSERT INTO public.clientes VALUES (934, 'Luis', 'Rodríguez Núñez', 'luis934@yahoo.com', '5583387315', 5, '2022-03-24', 'regular', 1);
INSERT INTO public.clientes VALUES (948, 'Claudia', 'Hernández Ramírez', 'claudia948@gmail.com', '5566604567', 5, '2025-07-12', 'regular', 1);
INSERT INTO public.clientes VALUES (981, 'Roberto', 'Cruz Rivera', 'roberto981@gmail.com', '5542120359', 5, '2023-10-18', 'vip', 1);
INSERT INTO public.clientes VALUES (988, 'Alejandro', 'Herrera Aguilar', 'alejandro988@gmail.com', '5525003358', 5, '2024-05-22', 'regular', 1);
INSERT INTO public.clientes VALUES (996, 'Claudia', 'Vargas Rodríguez', 'claudia996@gmail.com', '5574699989', 5, '2023-09-24', 'mayorista', 1);
INSERT INTO public.clientes VALUES (1994, 'Carlos', 'Núñez Flores', 'carlos1994@gmail.com', '5581017405', 5, '2024-12-21', 'vip', 2);
INSERT INTO public.clientes VALUES (1975, 'Ricardo', 'Herrera Rivera', 'ricardo1975@gmail.com', '5557864995', 7, '2024-10-10', 'regular', 3);
INSERT INTO public.clientes VALUES (1991, 'Diego', 'Flores Vargas', 'diego1991@gmail.com', '5556778834', 2, '2025-09-26', 'vip', 6);
INSERT INTO public.clientes VALUES (1012, 'Alberto', 'Pérez Ortega', 'alberto1012@gmail.com', '5553455060', 5, '2025-05-14', 'premium', 1);
INSERT INTO public.clientes VALUES (1044, 'Alejandra', 'Rodríguez Rodríguez', 'alejandra1044@gmail.com', '5530317946', 5, '2024-05-25', 'mayorista', 1);
INSERT INTO public.clientes VALUES (1105, 'Pablo', 'Mendoza Díaz', 'pablo1105@yahoo.com', '5556076320', 5, '2025-11-27', 'regular', 1);
INSERT INTO public.clientes VALUES (1112, 'Sofía', 'Mendoza Núñez', 'sofía1112@yahoo.com', '5556849237', 5, '2023-02-19', 'regular', 1);
INSERT INTO public.clientes VALUES (1134, 'Valeria', 'Hernández Ortega', 'valeria1134@yahoo.com', '5543662096', 5, '2024-06-24', 'regular', 1);
INSERT INTO public.clientes VALUES (1154, 'Sergio', 'Martínez Mendoza', 'sergio1154@gmail.com', '5530403362', 5, '2024-02-12', 'regular', 1);
INSERT INTO public.clientes VALUES (1229, 'Verónica', 'Gutiérrez González', 'verónica1229@hotmail.com', '5564626836', 5, '2023-03-11', 'regular', 1);
INSERT INTO public.clientes VALUES (1251, 'Rosa', 'Morales Morales', 'rosa1251@yahoo.com', '5597761151', 5, '2022-02-10', 'regular', 1);
INSERT INTO public.clientes VALUES (1274, 'Manuel', 'Gutiérrez Flores', 'manuel1274@yahoo.com', '5579808342', 5, '2025-10-14', 'premium', 1);
INSERT INTO public.clientes VALUES (1275, 'Elena', 'Pérez Jiménez', 'elena1275@gmail.com', '5555281312', 5, '2021-06-20', 'premium', 1);
INSERT INTO public.clientes VALUES (1297, 'Juan', 'Torres González', 'juan1297@gmail.com', '5547381443', 5, '2025-02-27', 'regular', 1);
INSERT INTO public.clientes VALUES (1298, 'José', 'Sánchez Vega', 'josé1298@yahoo.com', '5597861865', 5, '2024-10-29', 'regular', 1);
INSERT INTO public.clientes VALUES (1303, 'Alejandro', 'Cruz Sánchez', 'alejandro1303@hotmail.com', '5543314826', 5, '2022-11-09', 'premium', 1);
INSERT INTO public.clientes VALUES (1358, 'María', 'Sánchez López', 'maría1358@gmail.com', '5546245645', 5, '2025-10-22', 'premium', 1);
INSERT INTO public.clientes VALUES (1361, 'Adriana', 'Mendoza Mendoza', 'adriana1361@gmail.com', '5518513830', 5, '2025-08-17', 'regular', 1);
INSERT INTO public.clientes VALUES (1405, 'Elena', 'Hernández Morales', 'elena1405@gmail.com', '5582621876', 5, '2022-10-04', 'premium', 1);
INSERT INTO public.clientes VALUES (1408, 'Luis', 'Vargas Ortega', 'luis1408@yahoo.com', '5533094606', 5, '2025-02-17', 'premium', 1);
INSERT INTO public.clientes VALUES (1411, 'Carmen', 'Morales Gómez', 'carmen1411@yahoo.com', '5581542030', 5, '2022-08-10', 'mayorista', 1);
INSERT INTO public.clientes VALUES (1419, 'Francisco', 'Gutiérrez López', 'francisco1419@yahoo.com', '5528277763', 5, '2026-03-13', 'regular', 1);
INSERT INTO public.clientes VALUES (1440, 'Eduardo', 'Herrera Torres', 'eduardo1440@gmail.com', '5515679986', 5, '2024-03-08', 'premium', 1);
INSERT INTO public.clientes VALUES (1469, 'Liliana', 'Ortega Castillo', 'liliana1469@yahoo.com', '5587052719', 5, '2026-05-10', 'premium', 1);
INSERT INTO public.clientes VALUES (1484, 'Sandra', 'Ramírez Vargas', 'sandra1484@gmail.com', '5513953262', 5, '2023-10-06', 'premium', 1);
INSERT INTO public.clientes VALUES (1523, 'Alberto', 'Flores Moreno', 'alberto1523@yahoo.com', '5526753792', 5, '2024-11-16', 'mayorista', 1);
INSERT INTO public.clientes VALUES (1527, 'Sofía', 'Flores Gómez', 'sofía1527@yahoo.com', '5554007398', 5, '2023-06-16', 'premium', 1);
INSERT INTO public.clientes VALUES (1528, 'Claudia', 'Rodríguez Núñez', 'claudia1528@gmail.com', '5562220968', 5, '2023-03-21', 'regular', 1);
INSERT INTO public.clientes VALUES (1616, 'Carlos', 'López Castillo', 'carlos1616@gmail.com', '5545448743', 5, '2021-06-28', 'regular', 1);
INSERT INTO public.clientes VALUES (1617, 'Patricia', 'García Pérez', 'patricia1617@hotmail.com', '5582551437', 5, '2025-11-07', 'regular', 1);
INSERT INTO public.clientes VALUES (1625, 'Pablo', 'López Herrera', 'pablo1625@gmail.com', '5521278653', 5, '2023-07-31', 'mayorista', 1);
INSERT INTO public.clientes VALUES (1648, 'Ana', 'Martínez Martínez', 'ana1648@gmail.com', '5590410932', 5, '2026-02-12', 'mayorista', 1);
INSERT INTO public.clientes VALUES (1718, 'Isabel', 'García Hernández', 'isabel1718@hotmail.com', '5579351663', 5, '2025-07-17', 'premium', 1);
INSERT INTO public.clientes VALUES (1741, 'Ramón', 'Rivera Vega', 'ramón1741@gmail.com', '5511419443', 5, '2021-08-15', 'regular', 1);
INSERT INTO public.clientes VALUES (1764, 'Carlos', 'Castro Castillo', 'carlos1764@yahoo.com', '5579881903', 5, '2026-01-03', 'regular', 1);
INSERT INTO public.clientes VALUES (1773, 'Ana', 'Moreno Martínez', 'ana1773@gmail.com', '5528535751', 5, '2022-05-24', 'premium', 1);
INSERT INTO public.clientes VALUES (1820, 'Fernanda', 'Rodríguez Núñez', 'fernanda1820@gmail.com', '5590655868', 5, '2023-03-21', 'premium', 1);
INSERT INTO public.clientes VALUES (1827, 'Verónica', 'Sánchez Castro', 'verónica1827@gmail.com', '5585191544', 5, '2022-06-26', 'regular', 1);
INSERT INTO public.clientes VALUES (1831, 'Liliana', 'González Castillo', 'liliana1831@gmail.com', '5594736386', 5, '2025-06-11', 'premium', 1);
INSERT INTO public.clientes VALUES (1849, 'Liliana', 'Vargas Flores', 'liliana1849@yahoo.com', '5516131158', 5, '2025-10-07', 'regular', 1);
INSERT INTO public.clientes VALUES (1874, 'Patricia', 'Hernández Vega', 'patricia1874@yahoo.com', '5549292923', 5, '2024-12-16', 'regular', 1);
INSERT INTO public.clientes VALUES (1885, 'Daniela', 'Herrera Aguilar', 'daniela1885@hotmail.com', '5517605519', 5, '2024-11-19', 'premium', 1);
INSERT INTO public.clientes VALUES (1891, 'Alejandro', 'Díaz Martínez', 'alejandro1891@gmail.com', '5590627301', 5, '2024-12-18', 'regular', 1);
INSERT INTO public.clientes VALUES (1901, 'Diego', 'Gómez Ramos', 'diego1901@yahoo.com', '5570989006', 5, '2025-07-12', 'regular', 1);
INSERT INTO public.clientes VALUES (1905, 'Alberto', 'Ortega Núñez', 'alberto1905@yahoo.com', '5512793011', 5, '2026-05-21', 'mayorista', 1);
INSERT INTO public.clientes VALUES (1912, 'Juan', 'Vargas Díaz', 'juan1912@hotmail.com', '5549816893', 5, '2026-03-16', 'regular', 1);
INSERT INTO public.clientes VALUES (1929, 'Roberto', 'Núñez Díaz', 'roberto1929@gmail.com', '5592670664', 5, '2022-09-29', 'premium', 1);
INSERT INTO public.clientes VALUES (1933, 'Verónica', 'Núñez Mendoza', 'verónica1933@gmail.com', '5564021354', 5, '2024-03-19', 'regular', 1);
INSERT INTO public.clientes VALUES (1950, 'Ramón', 'Gutiérrez García', 'ramón1950@yahoo.com', '5591192063', 5, '2022-09-23', 'premium', 1);
INSERT INTO public.clientes VALUES (1951, 'María', 'Flores Rodríguez', 'maría1951@hotmail.com', '5514214307', 5, '2024-03-17', 'regular', 1);
INSERT INTO public.clientes VALUES (1964, 'David', 'Núñez Díaz', 'david1964@gmail.com', '5534727844', 5, '2025-09-29', 'premium', 1);
INSERT INTO public.clientes VALUES (1968, 'José', 'González Torres', 'josé1968@yahoo.com', '5523640196', 5, '2022-07-06', 'mayorista', 1);
INSERT INTO public.clientes VALUES (1979, 'Elena', 'Aguilar Vargas', 'elena1979@gmail.com', '5590648127', 5, '2024-01-19', 'vip', 1);
INSERT INTO public.clientes VALUES (1981, 'Rosa', 'García Torres', 'rosa1981@gmail.com', '5568357188', 5, '2024-09-02', 'premium', 1);
INSERT INTO public.clientes VALUES (1990, 'Adriana', 'Ramos Cruz', 'adriana1990@gmail.com', '5568792790', 5, '2023-04-19', 'vip', 1);
INSERT INTO public.clientes VALUES (45, 'Laura', 'López Rodríguez', 'laura45@yahoo.com', '5597645934', 5, '2022-06-18', 'regular', 2);
INSERT INTO public.clientes VALUES (49, 'Alberto', 'González López', 'alberto49@gmail.com', '5562324272', 5, '2025-02-27', 'regular', 2);
INSERT INTO public.clientes VALUES (71, 'Juan', 'Ramírez Castro', 'juan71@hotmail.com', '5585031037', 5, '2023-05-27', 'premium', 2);
INSERT INTO public.clientes VALUES (99, 'Eduardo', 'Rivera Pérez', 'eduardo99@hotmail.com', '5513248985', 5, '2025-06-30', 'nuevo', 2);
INSERT INTO public.clientes VALUES (101, 'Laura', 'Martínez Ramos', 'laura101@hotmail.com', '5529820881', 5, '2026-05-14', 'regular', 2);
INSERT INTO public.clientes VALUES (213, 'Ramón', 'Sánchez Morales', 'ramón213@hotmail.com', '5596356711', 5, '2023-08-23', 'regular', 2);
INSERT INTO public.clientes VALUES (309, 'Eduardo', 'Díaz Rivera', 'eduardo309@yahoo.com', '5541490443', 5, '2023-02-14', 'regular', 2);
INSERT INTO public.clientes VALUES (321, 'Laura', 'Vargas Pérez', 'laura321@gmail.com', '5545827376', 5, '2022-10-27', 'regular', 2);
INSERT INTO public.clientes VALUES (322, 'Elena', 'Gómez Sánchez', 'elena322@yahoo.com', '5542962076', 5, '2023-11-04', 'regular', 2);
INSERT INTO public.clientes VALUES (334, 'Pablo', 'Núñez Núñez', 'pablo334@yahoo.com', '5541602967', 5, '2025-04-07', 'mayorista', 2);
INSERT INTO public.clientes VALUES (376, 'Daniela', 'Castillo Moreno', 'daniela376@gmail.com', '5563015631', 5, '2025-12-14', 'regular', 2);
INSERT INTO public.clientes VALUES (381, 'Alejandra', 'Díaz Vega', 'alejandra381@hotmail.com', '5584397493', 5, '2026-03-28', 'regular', 2);
INSERT INTO public.clientes VALUES (400, 'Sandra', 'Torres Díaz', 'sandra400@hotmail.com', '5584304333', 5, '2022-05-26', 'premium', 2);
INSERT INTO public.clientes VALUES (502, 'Elena', 'Castro Vega', 'elena502@hotmail.com', '5582173911', 5, '2022-09-15', 'vip', 2);
INSERT INTO public.clientes VALUES (606, 'Carlos', 'Ramos Vargas', 'carlos606@gmail.com', '5539187415', 5, '2022-11-03', 'regular', 2);
INSERT INTO public.clientes VALUES (623, 'Sofía', 'Díaz Rodríguez', 'sofía623@yahoo.com', '5554866590', 5, '2025-10-26', 'regular', 2);
INSERT INTO public.clientes VALUES (629, 'Sandra', 'Mendoza García', 'sandra629@yahoo.com', '5527305260', 5, '2026-03-10', 'nuevo', 2);
INSERT INTO public.clientes VALUES (641, 'Carmen', 'Pérez Ortega', 'carmen641@hotmail.com', '5596914605', 5, '2026-04-29', 'regular', 2);
INSERT INTO public.clientes VALUES (651, 'Francisco', 'Flores Jiménez', 'francisco651@yahoo.com', '5599559917', 5, '2022-12-10', 'mayorista', 2);
INSERT INTO public.clientes VALUES (706, 'Fernanda', 'García Rivera', 'fernanda706@gmail.com', '5578123659', 5, '2024-12-10', 'mayorista', 2);
INSERT INTO public.clientes VALUES (819, 'Ricardo', 'Cruz Castillo', 'ricardo819@yahoo.com', '5584008439', 5, '2021-07-28', 'premium', 2);
INSERT INTO public.clientes VALUES (901, 'David', 'Díaz Rodríguez', 'david901@yahoo.com', '5510751945', 5, '2022-07-06', 'regular', 2);
INSERT INTO public.clientes VALUES (1043, 'Miguel', 'Hernández Jiménez', 'miguel1043@gmail.com', '5598711501', 5, '2024-05-11', 'premium', 2);
INSERT INTO public.clientes VALUES (1051, 'Juan', 'Sánchez Moreno', 'juan1051@yahoo.com', '5564202290', 5, '2021-06-21', 'premium', 2);
INSERT INTO public.clientes VALUES (1072, 'Sofía', 'Vargas Cruz', 'sofía1072@yahoo.com', '5575404850', 5, '2025-03-08', 'regular', 2);
INSERT INTO public.clientes VALUES (1174, 'David', 'Herrera Sánchez', 'david1174@hotmail.com', '5589498261', 5, '2023-01-27', 'regular', 2);
INSERT INTO public.clientes VALUES (1213, 'Isabel', 'Flores Pérez', 'isabel1213@yahoo.com', '5525994412', 5, '2023-11-30', 'regular', 2);
INSERT INTO public.clientes VALUES (1465, 'Patricia', 'Jiménez Pérez', 'patricia1465@gmail.com', '5545404362', 5, '2022-03-29', 'nuevo', 2);
INSERT INTO public.clientes VALUES (1474, 'Rosa', 'Rodríguez Castro', 'rosa1474@yahoo.com', '5539934299', 5, '2022-01-25', 'regular', 2);
INSERT INTO public.clientes VALUES (1543, 'Alejandra', 'Rivera Mendoza', 'alejandra1543@gmail.com', '5592362416', 5, '2025-06-12', 'regular', 2);
INSERT INTO public.clientes VALUES (1673, 'Andrés', 'Castro Herrera', 'andrés1673@yahoo.com', '5599187418', 5, '2022-10-29', 'premium', 2);
INSERT INTO public.clientes VALUES (1733, 'Ricardo', 'Gómez Núñez', 'ricardo1733@gmail.com', '5594640648', 5, '2024-03-02', 'vip', 2);
INSERT INTO public.clientes VALUES (3, 'Claudia', 'Vega Morales', 'claudia3@hotmail.com', '5590643207', 7, '2021-12-27', 'regular', 3);
INSERT INTO public.clientes VALUES (37, 'Eduardo', 'Rivera Vega', 'eduardo37@yahoo.com', '5586693314', 7, '2023-03-20', 'premium', 3);
INSERT INTO public.clientes VALUES (58, 'Manuel', 'Mendoza Ramírez', 'manuel58@hotmail.com', '5534482277', 7, '2024-10-26', 'regular', 3);
INSERT INTO public.clientes VALUES (75, 'Manuel', 'Aguilar Gómez', 'manuel75@hotmail.com', '5584016756', 7, '2023-01-03', 'regular', 3);
INSERT INTO public.clientes VALUES (110, 'María', 'Gutiérrez Ramírez', 'maría110@yahoo.com', '5562726977', 7, '2025-12-14', 'premium', 3);
INSERT INTO public.clientes VALUES (112, 'Adriana', 'Flores Cruz', 'adriana112@gmail.com', '5537750491', 7, '2023-03-10', 'regular', 3);
INSERT INTO public.clientes VALUES (113, 'Patricia', 'Torres Castillo', 'patricia113@gmail.com', '5580303981', 7, '2024-01-13', 'nuevo', 3);
INSERT INTO public.clientes VALUES (118, 'Ricardo', 'Sánchez Moreno', 'ricardo118@yahoo.com', '5573968467', 7, '2023-08-18', 'mayorista', 3);
INSERT INTO public.clientes VALUES (177, 'Daniela', 'Aguilar Díaz', 'daniela177@hotmail.com', '5599934747', 7, '2025-09-09', 'regular', 3);
INSERT INTO public.clientes VALUES (188, 'Francisco', 'López Vega', 'francisco188@gmail.com', '5543829709', 7, '2022-12-28', 'regular', 3);
INSERT INTO public.clientes VALUES (189, 'María', 'Ramos Martínez', 'maría189@gmail.com', '5589426041', 7, '2022-10-01', 'regular', 3);
INSERT INTO public.clientes VALUES (206, 'José', 'Ortega Ramos', 'josé206@yahoo.com', '5576800348', 7, '2022-10-13', 'premium', 3);
INSERT INTO public.clientes VALUES (215, 'Sandra', 'Cruz Moreno', 'sandra215@gmail.com', '5582016051', 7, '2022-04-16', 'regular', 3);
INSERT INTO public.clientes VALUES (223, 'Ramón', 'Castro Torres', 'ramón223@hotmail.com', '5573889312', 7, '2025-04-15', 'regular', 3);
INSERT INTO public.clientes VALUES (256, 'Patricia', 'Rodríguez Sánchez', 'patricia256@hotmail.com', '5587111463', 7, '2023-12-22', 'regular', 3);
INSERT INTO public.clientes VALUES (257, 'Manuel', 'Castillo Hernández', 'manuel257@gmail.com', '5556150365', 7, '2024-05-09', 'regular', 3);
INSERT INTO public.clientes VALUES (267, 'Alejandra', 'González Aguilar', 'alejandra267@gmail.com', '5521553190', 7, '2025-04-12', 'regular', 3);
INSERT INTO public.clientes VALUES (330, 'Manuel', 'Díaz Morales', 'manuel330@gmail.com', '5547276794', 7, '2024-05-29', 'regular', 3);
INSERT INTO public.clientes VALUES (339, 'Ramón', 'López Martínez', 'ramón339@hotmail.com', '5597131540', 7, '2021-09-11', 'regular', 3);
INSERT INTO public.clientes VALUES (350, 'Alejandro', 'Reyes Jiménez', 'alejandro350@hotmail.com', '5559781518', 7, '2023-04-23', 'regular', 3);
INSERT INTO public.clientes VALUES (351, 'Roberto', 'Reyes Morales', 'roberto351@gmail.com', '5572825287', 7, '2025-12-10', 'regular', 3);
INSERT INTO public.clientes VALUES (364, 'Pablo', 'Herrera Gómez', 'pablo364@hotmail.com', '5597787024', 7, '2025-10-08', 'regular', 3);
INSERT INTO public.clientes VALUES (399, 'Roberto', 'Díaz Hernández', 'roberto399@yahoo.com', '5596096076', 7, '2023-03-23', 'regular', 3);
INSERT INTO public.clientes VALUES (401, 'María', 'Aguilar Ramírez', 'maría401@gmail.com', '5591926643', 7, '2022-07-08', 'regular', 3);
INSERT INTO public.clientes VALUES (403, 'Rosa', 'Castro Torres', 'rosa403@hotmail.com', '5562344046', 7, '2023-07-12', 'nuevo', 3);
INSERT INTO public.clientes VALUES (438, 'David', 'Flores Pérez', 'david438@hotmail.com', '5512130654', 7, '2022-10-27', 'vip', 3);
INSERT INTO public.clientes VALUES (446, 'Adriana', 'Ortega Rodríguez', 'adriana446@yahoo.com', '5518730772', 7, '2024-12-27', 'vip', 3);
INSERT INTO public.clientes VALUES (455, 'Ana', 'Gómez Flores', 'ana455@gmail.com', '5518727939', 7, '2026-02-05', 'vip', 3);
INSERT INTO public.clientes VALUES (495, 'David', 'Vega Núñez', 'david495@yahoo.com', '5524863801', 7, '2023-06-09', 'regular', 3);
INSERT INTO public.clientes VALUES (536, 'Miguel', 'Núñez Aguilar', 'miguel536@hotmail.com', '5513792466', 7, '2024-12-23', 'premium', 3);
INSERT INTO public.clientes VALUES (540, 'José', 'Martínez Vargas', 'josé540@gmail.com', '5556223620', 7, '2024-12-08', 'premium', 3);
INSERT INTO public.clientes VALUES (564, 'Pablo', 'García Gutiérrez', 'pablo564@gmail.com', '5552402900', 7, '2021-11-13', 'vip', 3);
INSERT INTO public.clientes VALUES (572, 'Carlos', 'Rivera Ramos', 'carlos572@gmail.com', '5523683207', 7, '2024-05-01', 'nuevo', 3);
INSERT INTO public.clientes VALUES (586, 'Ana', 'Sánchez Hernández', 'ana586@yahoo.com', '5538885391', 7, '2023-01-25', 'regular', 3);
INSERT INTO public.clientes VALUES (588, 'Carmen', 'Gómez Cruz', 'carmen588@yahoo.com', '5567088619', 7, '2023-06-10', 'regular', 3);
INSERT INTO public.clientes VALUES (596, 'Ramón', 'González Ramírez', 'ramón596@hotmail.com', '5530869686', 7, '2025-08-23', 'regular', 3);
INSERT INTO public.clientes VALUES (601, 'Claudia', 'Mendoza Vega', 'claudia601@hotmail.com', '5578274190', 7, '2023-10-03', 'regular', 3);
INSERT INTO public.clientes VALUES (614, 'Sandra', 'Ramos Núñez', 'sandra614@gmail.com', '5562190363', 7, '2025-10-30', 'nuevo', 3);
INSERT INTO public.clientes VALUES (619, 'Elena', 'Martínez González', 'elena619@yahoo.com', '5535793612', 7, '2024-01-20', 'regular', 3);
INSERT INTO public.clientes VALUES (644, 'Carlos', 'Herrera Aguilar', 'carlos644@gmail.com', '5515870689', 7, '2025-01-19', 'premium', 3);
INSERT INTO public.clientes VALUES (662, 'José', 'García Ortega', 'josé662@gmail.com', '5565900995', 7, '2022-02-25', 'regular', 3);
INSERT INTO public.clientes VALUES (688, 'Claudia', 'Martínez Ramírez', 'claudia688@hotmail.com', '5573077976', 7, '2022-11-08', 'regular', 3);
INSERT INTO public.clientes VALUES (690, 'Alejandra', 'Ramírez Ramírez', 'alejandra690@gmail.com', '5521219432', 7, '2026-01-21', 'regular', 3);
INSERT INTO public.clientes VALUES (696, 'Alejandra', 'Ramírez Reyes', 'alejandra696@gmail.com', '5570473000', 7, '2022-11-20', 'regular', 3);
INSERT INTO public.clientes VALUES (712, 'Rosa', 'López López', 'rosa712@yahoo.com', '5589629793', 7, '2026-04-16', 'premium', 3);
INSERT INTO public.clientes VALUES (746, 'Mónica', 'Vargas González', 'mónica746@gmail.com', '5524181508', 7, '2025-03-20', 'vip', 3);
INSERT INTO public.clientes VALUES (767, 'Eduardo', 'Torres Martínez', 'eduardo767@gmail.com', '5576964850', 7, '2023-10-30', 'premium', 3);
INSERT INTO public.clientes VALUES (781, 'Sandra', 'González Gutiérrez', 'sandra781@gmail.com', '5576478665', 7, '2025-03-11', 'mayorista', 3);
INSERT INTO public.clientes VALUES (792, 'Daniela', 'Vargas Ramos', 'daniela792@gmail.com', '5571670595', 7, '2024-11-18', 'premium', 3);
INSERT INTO public.clientes VALUES (798, 'María', 'Núñez Rodríguez', 'maría798@hotmail.com', '5560684499', 7, '2022-11-14', 'regular', 3);
INSERT INTO public.clientes VALUES (848, 'Patricia', 'Núñez Gutiérrez', 'patricia848@hotmail.com', '5588484532', 7, '2023-01-18', 'regular', 3);
INSERT INTO public.clientes VALUES (893, 'Ana', 'Herrera Morales', 'ana893@yahoo.com', '5555347939', 7, '2026-03-29', 'regular', 3);
INSERT INTO public.clientes VALUES (939, 'David', 'Mendoza Hernández', 'david939@gmail.com', '5551509991', 7, '2021-12-13', 'regular', 3);
INSERT INTO public.clientes VALUES (947, 'José', 'Flores Gómez', 'josé947@gmail.com', '5567138006', 7, '2024-11-05', 'regular', 3);
INSERT INTO public.clientes VALUES (957, 'Elena', 'Rodríguez López', 'elena957@gmail.com', '5526918765', 7, '2022-11-23', 'regular', 3);
INSERT INTO public.clientes VALUES (967, 'Manuel', 'García Flores', 'manuel967@yahoo.com', '5569644085', 7, '2023-11-08', 'mayorista', 3);
INSERT INTO public.clientes VALUES (970, 'Gabriela', 'Torres Herrera', 'gabriela970@hotmail.com', '5513968089', 7, '2022-12-10', 'regular', 3);
INSERT INTO public.clientes VALUES (992, 'Roberto', 'Ortega Vargas', 'roberto992@hotmail.com', '5549578072', 7, '2022-04-10', 'mayorista', 3);
INSERT INTO public.clientes VALUES (1002, 'Alberto', 'Ramírez Gutiérrez', 'alberto1002@hotmail.com', '5518545499', 7, '2023-07-07', 'regular', 3);
INSERT INTO public.clientes VALUES (1021, 'Juan', 'Castro Ramos', 'juan1021@hotmail.com', '5565536259', 7, '2021-07-18', 'regular', 3);
INSERT INTO public.clientes VALUES (1029, 'Laura', 'Herrera Moreno', 'laura1029@yahoo.com', '5570570928', 7, '2022-10-18', 'regular', 3);
INSERT INTO public.clientes VALUES (1033, 'Sergio', 'Rodríguez Martínez', 'sergio1033@hotmail.com', '5515295236', 7, '2023-06-01', 'regular', 3);
INSERT INTO public.clientes VALUES (1053, 'Isabel', 'Herrera Castro', 'isabel1053@yahoo.com', '5598745007', 7, '2023-03-13', 'premium', 3);
INSERT INTO public.clientes VALUES (1100, 'Alejandro', 'Castro Ramos', 'alejandro1100@hotmail.com', '5567825027', 7, '2024-03-22', 'regular', 3);
INSERT INTO public.clientes VALUES (1181, 'Fernanda', 'Cruz Vega', 'fernanda1181@gmail.com', '5570690090', 7, '2025-08-25', 'premium', 3);
INSERT INTO public.clientes VALUES (1182, 'Carlos', 'Vega González', 'carlos1182@gmail.com', '5561198338', 7, '2024-03-15', 'regular', 3);
INSERT INTO public.clientes VALUES (1192, 'Diego', 'Castro García', 'diego1192@hotmail.com', '5561558846', 7, '2022-12-12', 'regular', 3);
INSERT INTO public.clientes VALUES (1208, 'Miguel', 'Hernández Sánchez', 'miguel1208@gmail.com', '5530485751', 7, '2023-08-21', 'regular', 3);
INSERT INTO public.clientes VALUES (1221, 'Gabriela', 'Herrera Hernández', 'gabriela1221@gmail.com', '5550540480', 7, '2024-12-20', 'regular', 3);
INSERT INTO public.clientes VALUES (1232, 'Carmen', 'Castro Hernández', 'carmen1232@hotmail.com', '5593894510', 7, '2023-02-01', 'regular', 3);
INSERT INTO public.clientes VALUES (1283, 'Alberto', 'Ortega Herrera', 'alberto1283@hotmail.com', '5541724015', 7, '2026-04-25', 'regular', 3);
INSERT INTO public.clientes VALUES (1306, 'Isabel', 'Reyes Núñez', 'isabel1306@hotmail.com', '5577072182', 7, '2021-12-06', 'regular', 3);
INSERT INTO public.clientes VALUES (1316, 'Manuel', 'Ramos Ramos', 'manuel1316@gmail.com', '5519031400', 7, '2021-10-26', 'regular', 3);
INSERT INTO public.clientes VALUES (1317, 'Mónica', 'Ramos Ramos', 'mónica1317@gmail.com', '5529320840', 7, '2022-03-04', 'vip', 3);
INSERT INTO public.clientes VALUES (1324, 'Fernanda', 'Hernández Ortega', 'fernanda1324@hotmail.com', '5524293758', 7, '2023-05-02', 'regular', 3);
INSERT INTO public.clientes VALUES (1330, 'Carlos', 'González Gutiérrez', 'carlos1330@hotmail.com', '5596969029', 7, '2026-02-26', 'regular', 3);
INSERT INTO public.clientes VALUES (1369, 'Gabriela', 'Hernández Vega', 'gabriela1369@hotmail.com', '5599231121', 7, '2022-07-17', 'regular', 3);
INSERT INTO public.clientes VALUES (1478, 'Adriana', 'Núñez Rivera', 'adriana1478@gmail.com', '5579821206', 7, '2022-10-04', 'mayorista', 3);
INSERT INTO public.clientes VALUES (1490, 'Andrés', 'Jiménez Torres', 'andrés1490@yahoo.com', '5570267126', 7, '2022-05-17', 'regular', 3);
INSERT INTO public.clientes VALUES (1520, 'Alejandra', 'Reyes Morales', 'alejandra1520@gmail.com', '5530658164', 7, '2024-08-25', 'regular', 3);
INSERT INTO public.clientes VALUES (1568, 'Sandra', 'Sánchez González', 'sandra1568@hotmail.com', '5523228017', 7, '2021-12-30', 'regular', 3);
INSERT INTO public.clientes VALUES (1695, 'Isabel', 'Díaz Mendoza', 'isabel1695@gmail.com', '5583864238', 7, '2025-05-08', 'regular', 3);
INSERT INTO public.clientes VALUES (1725, 'Verónica', 'Castillo Flores', 'verónica1725@gmail.com', '5540467872', 7, '2021-12-21', 'regular', 3);
INSERT INTO public.clientes VALUES (1726, 'Ramón', 'Gutiérrez Ortega', 'ramón1726@hotmail.com', '5556253278', 7, '2023-02-09', 'regular', 3);
INSERT INTO public.clientes VALUES (1779, 'Sofía', 'Sánchez Rivera', 'sofía1779@gmail.com', '5515560483', 7, '2023-08-16', 'regular', 3);
INSERT INTO public.clientes VALUES (1791, 'Laura', 'Torres González', 'laura1791@hotmail.com', '5599317146', 7, '2021-10-18', 'premium', 3);
INSERT INTO public.clientes VALUES (1829, 'Andrés', 'Herrera Ramírez', 'andrés1829@yahoo.com', '5539083765', 7, '2025-08-25', 'nuevo', 3);
INSERT INTO public.clientes VALUES (1830, 'Sandra', 'García Vargas', 'sandra1830@hotmail.com', '5544058594', 7, '2024-07-03', 'regular', 3);
INSERT INTO public.clientes VALUES (1845, 'Diego', 'Sánchez López', 'diego1845@gmail.com', '5534880515', 7, '2023-12-28', 'premium', 3);
INSERT INTO public.clientes VALUES (1893, 'Valeria', 'Reyes Vega', 'valeria1893@gmail.com', '5534142912', 7, '2024-09-01', 'regular', 3);
INSERT INTO public.clientes VALUES (1910, 'Patricia', 'García Vargas', 'patricia1910@hotmail.com', '5531161829', 7, '2023-02-14', 'regular', 3);
INSERT INTO public.clientes VALUES (1961, 'Ricardo', 'Ramírez Núñez', 'ricardo1961@hotmail.com', '5543831592', 7, '2023-01-27', 'regular', 3);
INSERT INTO public.clientes VALUES (4, 'Adriana', 'Moreno Reyes', 'adriana4@hotmail.com', '5555992559', 7, '2023-02-06', 'regular', 4);
INSERT INTO public.clientes VALUES (14, 'Patricia', 'Vega Vega', 'patricia14@gmail.com', '5540839382', 7, '2022-01-20', 'premium', 4);
INSERT INTO public.clientes VALUES (25, 'Liliana', 'Morales Herrera', 'liliana25@yahoo.com', '5571585593', 7, '2023-02-26', 'mayorista', 4);
INSERT INTO public.clientes VALUES (34, 'Manuel', 'Hernández Reyes', 'manuel34@hotmail.com', '5533461307', 7, '2025-10-08', 'premium', 4);
INSERT INTO public.clientes VALUES (43, 'Carmen', 'Herrera Torres', 'carmen43@hotmail.com', '5575430302', 7, '2021-06-16', 'regular', 4);
INSERT INTO public.clientes VALUES (53, 'Gabriela', 'Núñez Rivera', 'gabriela53@yahoo.com', '5522019737', 7, '2024-09-19', 'regular', 4);
INSERT INTO public.clientes VALUES (61, 'Fernando', 'Flores Díaz', 'fernando61@hotmail.com', '5559848072', 7, '2022-07-15', 'premium', 4);
INSERT INTO public.clientes VALUES (127, 'Verónica', 'González Gómez', 'verónica127@yahoo.com', '5534008676', 7, '2023-02-19', 'mayorista', 4);
INSERT INTO public.clientes VALUES (132, 'Rosa', 'García Jiménez', 'rosa132@gmail.com', '5511638498', 7, '2023-08-27', 'mayorista', 4);
INSERT INTO public.clientes VALUES (202, 'Carmen', 'Ramírez Torres', 'carmen202@hotmail.com', '5595735668', 7, '2024-11-22', 'premium', 4);
INSERT INTO public.clientes VALUES (205, 'Juan', 'Gutiérrez Herrera', 'juan205@hotmail.com', '5524260594', 7, '2022-06-07', 'regular', 4);
INSERT INTO public.clientes VALUES (217, 'Roberto', 'Vargas Hernández', 'roberto217@gmail.com', '5523058343', 7, '2023-01-07', 'regular', 4);
INSERT INTO public.clientes VALUES (240, 'José', 'García Morales', 'josé240@gmail.com', '5531716808', 7, '2021-08-19', 'regular', 4);
INSERT INTO public.clientes VALUES (260, 'Sergio', 'Herrera Ortega', 'sergio260@gmail.com', '5585864089', 7, '2024-07-18', 'premium', 4);
INSERT INTO public.clientes VALUES (265, 'Daniela', 'Gómez Rivera', 'daniela265@yahoo.com', '5551350514', 7, '2021-07-17', 'regular', 4);
INSERT INTO public.clientes VALUES (290, 'Francisco', 'Vega Castillo', 'francisco290@hotmail.com', '5534847161', 7, '2022-09-01', 'nuevo', 4);
INSERT INTO public.clientes VALUES (310, 'Gabriela', 'Martínez Flores', 'gabriela310@hotmail.com', '5515016739', 7, '2022-10-03', 'mayorista', 4);
INSERT INTO public.clientes VALUES (318, 'Sandra', 'Vega Rodríguez', 'sandra318@gmail.com', '5538582041', 7, '2024-12-10', 'vip', 4);
INSERT INTO public.clientes VALUES (342, 'Manuel', 'Vargas Jiménez', 'manuel342@gmail.com', '5521942232', 7, '2025-05-01', 'regular', 4);
INSERT INTO public.clientes VALUES (354, 'Diego', 'Herrera González', 'diego354@gmail.com', '5598237348', 7, '2026-02-23', 'regular', 4);
INSERT INTO public.clientes VALUES (367, 'Roberto', 'Díaz Vargas', 'roberto367@yahoo.com', '5555868216', 7, '2022-08-26', 'regular', 4);
INSERT INTO public.clientes VALUES (385, 'Liliana', 'Núñez Moreno', 'liliana385@hotmail.com', '5598175428', 7, '2025-09-16', 'mayorista', 4);
INSERT INTO public.clientes VALUES (424, 'María', 'Ramírez Mendoza', 'maría424@hotmail.com', '5587786253', 7, '2025-12-20', 'mayorista', 4);
INSERT INTO public.clientes VALUES (450, 'Ricardo', 'Hernández Ramírez', 'ricardo450@gmail.com', '5581458898', 7, '2024-09-02', 'regular', 4);
INSERT INTO public.clientes VALUES (454, 'Laura', 'Herrera Jiménez', 'laura454@gmail.com', '5522840710', 7, '2023-03-14', 'regular', 4);
INSERT INTO public.clientes VALUES (460, 'Patricia', 'Vargas Reyes', 'patricia460@yahoo.com', '5593329195', 7, '2025-05-27', 'regular', 4);
INSERT INTO public.clientes VALUES (486, 'Claudia', 'Sánchez Reyes', 'claudia486@gmail.com', '5584170763', 7, '2022-05-24', 'mayorista', 4);
INSERT INTO public.clientes VALUES (494, 'Fernanda', 'Torres Pérez', 'fernanda494@hotmail.com', '5519392480', 7, '2026-02-14', 'regular', 4);
INSERT INTO public.clientes VALUES (497, 'Alberto', 'Ortega Torres', 'alberto497@gmail.com', '5577441055', 7, '2024-11-24', 'regular', 4);
INSERT INTO public.clientes VALUES (504, 'Valeria', 'Díaz Cruz', 'valeria504@yahoo.com', '5515990830', 7, '2026-04-18', 'regular', 4);
INSERT INTO public.clientes VALUES (506, 'Juan', 'Flores Moreno', 'juan506@gmail.com', '5575063283', 7, '2026-01-23', 'regular', 4);
INSERT INTO public.clientes VALUES (682, 'Eduardo', 'Vega Torres', 'eduardo682@hotmail.com', '5527311971', 7, '2024-05-21', 'regular', 4);
INSERT INTO public.clientes VALUES (683, 'Valeria', 'Rivera López', 'valeria683@gmail.com', '5577906443', 7, '2024-12-20', 'mayorista', 4);
INSERT INTO public.clientes VALUES (699, 'Sergio', 'Reyes Aguilar', 'sergio699@gmail.com', '5576992183', 7, '2024-02-15', 'regular', 4);
INSERT INTO public.clientes VALUES (705, 'Fernando', 'Vega Morales', 'fernando705@gmail.com', '5557058571', 7, '2024-02-17', 'vip', 4);
INSERT INTO public.clientes VALUES (726, 'Fernando', 'Ortega Rivera', 'fernando726@hotmail.com', '5518625670', 7, '2025-07-04', 'mayorista', 4);
INSERT INTO public.clientes VALUES (736, 'Manuel', 'Herrera Flores', 'manuel736@yahoo.com', '5550056450', 7, '2023-09-05', 'mayorista', 4);
INSERT INTO public.clientes VALUES (748, 'Sergio', 'Vega Ortega', 'sergio748@gmail.com', '5529768893', 7, '2021-07-13', 'regular', 4);
INSERT INTO public.clientes VALUES (774, 'Sergio', 'López Torres', 'sergio774@gmail.com', '5594331525', 7, '2023-05-21', 'regular', 4);
INSERT INTO public.clientes VALUES (832, 'Isabel', 'Vega Rodríguez', 'isabel832@yahoo.com', '5511190605', 7, '2026-03-28', 'nuevo', 4);
INSERT INTO public.clientes VALUES (844, 'Ana', 'Jiménez Morales', 'ana844@gmail.com', '5579838315', 7, '2024-08-31', 'regular', 4);
INSERT INTO public.clientes VALUES (878, 'Ricardo', 'Flores Vargas', 'ricardo878@gmail.com', '5551407598', 7, '2024-02-23', 'regular', 4);
INSERT INTO public.clientes VALUES (916, 'María', 'Vega Castillo', 'maría916@gmail.com', '5591543479', 7, '2023-09-11', 'regular', 4);
INSERT INTO public.clientes VALUES (923, 'Andrés', 'Ortega Aguilar', 'andrés923@gmail.com', '5585992639', 7, '2025-12-13', 'regular', 4);
INSERT INTO public.clientes VALUES (954, 'Mónica', 'Díaz Hernández', 'mónica954@yahoo.com', '5575715873', 7, '2024-05-21', 'regular', 4);
INSERT INTO public.clientes VALUES (982, 'Valeria', 'González Torres', 'valeria982@yahoo.com', '5587524461', 7, '2023-11-14', 'regular', 4);
INSERT INTO public.clientes VALUES (987, 'Ana', 'Rivera Gómez', 'ana987@gmail.com', '5578660380', 7, '2024-01-16', 'premium', 4);
INSERT INTO public.clientes VALUES (990, 'Ricardo', 'Herrera Ramírez', 'ricardo990@hotmail.com', '5554380596', 7, '2022-07-10', 'regular', 4);
INSERT INTO public.clientes VALUES (1000, 'Verónica', 'Vega López', 'verónica1000@gmail.com', '5517512810', 7, '2023-04-08', 'regular', 4);
INSERT INTO public.clientes VALUES (1005, 'Gabriela', 'Ortega García', 'gabriela1005@gmail.com', '5524968484', 7, '2022-01-31', 'premium', 4);
INSERT INTO public.clientes VALUES (1008, 'Alejandro', 'Moreno Gutiérrez', 'alejandro1008@gmail.com', '5594009791', 7, '2025-10-26', 'nuevo', 4);
INSERT INTO public.clientes VALUES (1048, 'Diego', 'Cruz Díaz', 'diego1048@gmail.com', '5582038305', 7, '2025-09-09', 'mayorista', 4);
INSERT INTO public.clientes VALUES (1052, 'Alejandro', 'Rodríguez Ramos', 'alejandro1052@gmail.com', '5554107402', 7, '2022-09-12', 'regular', 4);
INSERT INTO public.clientes VALUES (1079, 'Fernanda', 'Castillo Ramos', 'fernanda1079@hotmail.com', '5569088694', 7, '2023-03-25', 'mayorista', 4);
INSERT INTO public.clientes VALUES (1081, 'David', 'Martínez Torres', 'david1081@gmail.com', '5513808371', 7, '2021-09-06', 'mayorista', 4);
INSERT INTO public.clientes VALUES (1082, 'Eduardo', 'Rivera Sánchez', 'eduardo1082@hotmail.com', '5553555317', 7, '2022-07-11', 'nuevo', 4);
INSERT INTO public.clientes VALUES (1113, 'Claudia', 'Pérez Jiménez', 'claudia1113@hotmail.com', '5555284617', 7, '2022-10-02', 'regular', 4);
INSERT INTO public.clientes VALUES (1144, 'Eduardo', 'Pérez Gómez', 'eduardo1144@yahoo.com', '5570708263', 7, '2024-04-07', 'regular', 4);
INSERT INTO public.clientes VALUES (1153, 'José', 'Rivera Jiménez', 'josé1153@gmail.com', '5588309134', 7, '2023-10-13', 'regular', 4);
INSERT INTO public.clientes VALUES (1157, 'Diego', 'Rodríguez Herrera', 'diego1157@hotmail.com', '5558638387', 7, '2023-03-02', 'regular', 4);
INSERT INTO public.clientes VALUES (1180, 'Ramón', 'Rodríguez Hernández', 'ramón1180@gmail.com', '5564993351', 7, '2021-07-05', 'regular', 4);
INSERT INTO public.clientes VALUES (1264, 'Fernando', 'Moreno Ramos', 'fernando1264@gmail.com', '5562449097', 7, '2023-01-17', 'mayorista', 4);
INSERT INTO public.clientes VALUES (1267, 'Patricia', 'Herrera Vargas', 'patricia1267@yahoo.com', '5547692831', 7, '2022-10-19', 'mayorista', 4);
INSERT INTO public.clientes VALUES (1276, 'Ricardo', 'Gómez Morales', 'ricardo1276@gmail.com', '5586261088', 7, '2023-06-07', 'regular', 4);
INSERT INTO public.clientes VALUES (1287, 'Sergio', 'Díaz Ortega', 'sergio1287@gmail.com', '5561902437', 7, '2025-03-31', 'regular', 4);
INSERT INTO public.clientes VALUES (1308, 'Fernando', 'Herrera García', 'fernando1308@hotmail.com', '5529752845', 7, '2021-08-05', 'regular', 4);
INSERT INTO public.clientes VALUES (1314, 'Sandra', 'Rivera García', 'sandra1314@yahoo.com', '5592265540', 7, '2024-07-01', 'premium', 4);
INSERT INTO public.clientes VALUES (1366, 'Daniela', 'Vargas Flores', 'daniela1366@hotmail.com', '5552301424', 7, '2025-12-19', 'regular', 4);
INSERT INTO public.clientes VALUES (1409, 'Rosa', 'Aguilar Pérez', 'rosa1409@yahoo.com', '5518224212', 7, '2025-03-06', 'premium', 4);
INSERT INTO public.clientes VALUES (1421, 'Mario', 'Ramos Vargas', 'mario1421@gmail.com', '5553196957', 7, '2025-07-09', 'premium', 4);
INSERT INTO public.clientes VALUES (1495, 'Pablo', 'Martínez Cruz', 'pablo1495@gmail.com', '5520623444', 7, '2026-05-21', 'regular', 4);
INSERT INTO public.clientes VALUES (1506, 'Alejandra', 'Gómez Moreno', 'alejandra1506@gmail.com', '5525971233', 7, '2023-10-06', 'premium', 4);
INSERT INTO public.clientes VALUES (1555, 'Carmen', 'Mendoza Rodríguez', 'carmen1555@gmail.com', '5574435190', 7, '2024-08-23', 'regular', 4);
INSERT INTO public.clientes VALUES (1565, 'Andrés', 'Jiménez Aguilar', 'andrés1565@gmail.com', '5588150391', 7, '2026-06-06', 'regular', 4);
INSERT INTO public.clientes VALUES (1566, 'José', 'Rodríguez Hernández', 'josé1566@hotmail.com', '5589979778', 7, '2022-03-09', 'regular', 4);
INSERT INTO public.clientes VALUES (1570, 'Mónica', 'Reyes Reyes', 'mónica1570@gmail.com', '5586359325', 7, '2024-06-26', 'premium', 4);
INSERT INTO public.clientes VALUES (1580, 'Juan', 'Ramos Flores', 'juan1580@gmail.com', '5581022010', 7, '2025-01-18', 'regular', 4);
INSERT INTO public.clientes VALUES (1655, 'Gabriela', 'Flores Díaz', 'gabriela1655@gmail.com', '5575770619', 7, '2024-07-15', 'regular', 4);
INSERT INTO public.clientes VALUES (1706, 'Ramón', 'Díaz Rodríguez', 'ramón1706@hotmail.com', '5586416822', 7, '2024-04-30', 'regular', 4);
INSERT INTO public.clientes VALUES (1707, 'Patricia', 'García López', 'patricia1707@hotmail.com', '5558117953', 7, '2021-09-06', 'nuevo', 4);
INSERT INTO public.clientes VALUES (1729, 'Manuel', 'Moreno Jiménez', 'manuel1729@hotmail.com', '5519223541', 7, '2024-10-12', 'regular', 4);
INSERT INTO public.clientes VALUES (1738, 'Sofía', 'Jiménez Moreno', 'sofía1738@yahoo.com', '5549585094', 7, '2022-08-15', 'regular', 4);
INSERT INTO public.clientes VALUES (1744, 'Claudia', 'Martínez Herrera', 'claudia1744@yahoo.com', '5527332224', 7, '2023-02-09', 'regular', 4);
INSERT INTO public.clientes VALUES (1795, 'Ricardo', 'Castro González', 'ricardo1795@gmail.com', '5547813626', 7, '2025-05-25', 'mayorista', 4);
INSERT INTO public.clientes VALUES (1811, 'Isabel', 'Ramos Castro', 'isabel1811@hotmail.com', '5577845175', 7, '2024-12-27', 'regular', 4);
INSERT INTO public.clientes VALUES (1851, 'Claudia', 'García Castillo', 'claudia1851@yahoo.com', '5585331364', 7, '2024-03-23', 'regular', 4);
INSERT INTO public.clientes VALUES (1855, 'Alejandro', 'Ortega Díaz', 'alejandro1855@gmail.com', '5572331124', 7, '2026-01-01', 'regular', 4);
INSERT INTO public.clientes VALUES (1865, 'Ricardo', 'Rodríguez Martínez', 'ricardo1865@gmail.com', '5586639255', 7, '2025-09-20', 'regular', 4);
INSERT INTO public.clientes VALUES (1883, 'Carlos', 'Sánchez García', 'carlos1883@yahoo.com', '5572873761', 7, '2026-01-24', 'premium', 4);
INSERT INTO public.clientes VALUES (1889, 'Patricia', 'Torres Hernández', 'patricia1889@gmail.com', '5517850353', 7, '2021-11-17', 'mayorista', 4);
INSERT INTO public.clientes VALUES (1930, 'Ana', 'Hernández Cruz', 'ana1930@hotmail.com', '5532013599', 7, '2022-03-16', 'regular', 4);
INSERT INTO public.clientes VALUES (1965, 'Fernando', 'Núñez Vargas', 'fernando1965@gmail.com', '5549580165', 7, '2021-12-30', 'regular', 4);
INSERT INTO public.clientes VALUES (1970, 'Claudia', 'Sánchez Núñez', 'claudia1970@gmail.com', '5529218151', 7, '2023-09-02', 'regular', 4);
INSERT INTO public.clientes VALUES (1973, 'Pablo', 'Martínez Reyes', 'pablo1973@yahoo.com', '5521278771', 7, '2026-01-26', 'regular', 4);
INSERT INTO public.clientes VALUES (1992, 'Liliana', 'Hernández Rodríguez', 'liliana1992@yahoo.com', '5588357247', 7, '2022-05-06', 'regular', 4);
INSERT INTO public.clientes VALUES (5, 'Pablo', 'González Martínez', 'pablo5@hotmail.com', '5577693989', 7, '2021-10-23', 'regular', 5);
INSERT INTO public.clientes VALUES (7, 'Juan', 'Castro Jiménez', 'juan7@gmail.com', '5510161088', 7, '2023-07-08', 'regular', 5);
INSERT INTO public.clientes VALUES (11, 'Fernando', 'Castillo Mendoza', 'fernando11@yahoo.com', '5530774029', 7, '2022-10-16', 'regular', 5);
INSERT INTO public.clientes VALUES (138, 'Sergio', 'Flores Rivera', 'sergio138@gmail.com', '5519082067', 7, '2021-09-18', 'regular', 5);
INSERT INTO public.clientes VALUES (195, 'Sandra', 'Moreno Hernández', 'sandra195@hotmail.com', '5557490002', 7, '2023-01-08', 'vip', 5);
INSERT INTO public.clientes VALUES (225, 'José', 'Vargas Aguilar', 'josé225@gmail.com', '5556688115', 7, '2026-06-02', 'regular', 5);
INSERT INTO public.clientes VALUES (231, 'Valeria', 'Sánchez Herrera', 'valeria231@yahoo.com', '5541825487', 7, '2021-07-26', 'regular', 5);
INSERT INTO public.clientes VALUES (239, 'Luis', 'Cruz Morales', 'luis239@hotmail.com', '5511667385', 7, '2025-03-22', 'regular', 5);
INSERT INTO public.clientes VALUES (303, 'Verónica', 'Gutiérrez García', 'verónica303@gmail.com', '5514241081', 7, '2021-07-05', 'vip', 5);
INSERT INTO public.clientes VALUES (320, 'Ricardo', 'González Ramos', 'ricardo320@gmail.com', '5550302318', 7, '2024-02-22', 'regular', 5);
INSERT INTO public.clientes VALUES (328, 'Ramón', 'Ramos Gómez', 'ramón328@gmail.com', '5541667072', 7, '2025-03-22', 'regular', 5);
INSERT INTO public.clientes VALUES (335, 'Andrés', 'Vargas Flores', 'andrés335@gmail.com', '5596493863', 7, '2022-01-07', 'regular', 5);
INSERT INTO public.clientes VALUES (370, 'Verónica', 'López Núñez', 'verónica370@yahoo.com', '5567030927', 7, '2025-11-30', 'regular', 5);
INSERT INTO public.clientes VALUES (397, 'Francisco', 'Díaz Mendoza', 'francisco397@hotmail.com', '5565486872', 7, '2023-11-15', 'nuevo', 5);
INSERT INTO public.clientes VALUES (405, 'Liliana', 'Ramírez Sánchez', 'liliana405@gmail.com', '5550794416', 7, '2023-08-12', 'regular', 5);
INSERT INTO public.clientes VALUES (425, 'Fernanda', 'Ortega Hernández', 'fernanda425@hotmail.com', '5555628196', 7, '2025-06-07', 'regular', 5);
INSERT INTO public.clientes VALUES (451, 'José', 'Castro Ortega', 'josé451@gmail.com', '5540283277', 7, '2026-01-10', 'vip', 5);
INSERT INTO public.clientes VALUES (496, 'Fernanda', 'Castro Vega', 'fernanda496@hotmail.com', '5551574904', 7, '2021-11-09', 'premium', 5);
INSERT INTO public.clientes VALUES (500, 'Fernanda', 'Jiménez Aguilar', 'fernanda500@gmail.com', '5533505052', 7, '2025-01-17', 'regular', 5);
INSERT INTO public.clientes VALUES (534, 'Sofía', 'Gómez Núñez', 'sofía534@gmail.com', '5536068867', 7, '2025-01-05', 'premium', 5);
INSERT INTO public.clientes VALUES (556, 'Roberto', 'Herrera Moreno', 'roberto556@gmail.com', '5524155900', 7, '2022-06-07', 'regular', 5);
INSERT INTO public.clientes VALUES (599, 'Elena', 'Torres Vargas', 'elena599@gmail.com', '5551025192', 7, '2022-02-14', 'regular', 5);
INSERT INTO public.clientes VALUES (602, 'Verónica', 'Castillo Martínez', 'verónica602@hotmail.com', '5510978481', 7, '2022-07-04', 'regular', 5);
INSERT INTO public.clientes VALUES (628, 'Verónica', 'Rivera Castro', 'verónica628@hotmail.com', '5525761044', 7, '2026-01-24', 'regular', 5);
INSERT INTO public.clientes VALUES (664, 'Miguel', 'Jiménez Herrera', 'miguel664@yahoo.com', '5563202657', 7, '2022-08-19', 'vip', 5);
INSERT INTO public.clientes VALUES (665, 'Alejandro', 'Núñez Ortega', 'alejandro665@gmail.com', '5540509683', 7, '2025-07-25', 'regular', 5);
INSERT INTO public.clientes VALUES (668, 'Pablo', 'Rodríguez Hernández', 'pablo668@gmail.com', '5596791517', 7, '2025-05-09', 'regular', 5);
INSERT INTO public.clientes VALUES (697, 'Sofía', 'Hernández Pérez', 'sofía697@gmail.com', '5535186888', 7, '2022-07-16', 'regular', 5);
INSERT INTO public.clientes VALUES (741, 'Andrés', 'Martínez González', 'andrés741@yahoo.com', '5588400641', 7, '2022-11-15', 'regular', 5);
INSERT INTO public.clientes VALUES (750, 'Manuel', 'López Rivera', 'manuel750@yahoo.com', '5577402853', 7, '2023-08-06', 'regular', 5);
INSERT INTO public.clientes VALUES (803, 'Verónica', 'Vega González', 'verónica803@gmail.com', '5568905216', 7, '2022-12-09', 'regular', 5);
INSERT INTO public.clientes VALUES (813, 'María', 'Gutiérrez Morales', 'maría813@hotmail.com', '5526809078', 7, '2022-07-06', 'regular', 5);
INSERT INTO public.clientes VALUES (815, 'Elena', 'Sánchez López', 'elena815@gmail.com', '5540484320', 7, '2022-04-03', 'premium', 5);
INSERT INTO public.clientes VALUES (827, 'Carlos', 'Flores Ramos', 'carlos827@gmail.com', '5568260695', 7, '2022-01-21', 'premium', 5);
INSERT INTO public.clientes VALUES (839, 'Carlos', 'Flores Jiménez', 'carlos839@gmail.com', '5554961030', 7, '2022-10-15', 'regular', 5);
INSERT INTO public.clientes VALUES (847, 'Daniela', 'Vargas Morales', 'daniela847@gmail.com', '5570259467', 7, '2025-02-26', 'regular', 5);
INSERT INTO public.clientes VALUES (866, 'Sandra', 'Moreno Herrera', 'sandra866@hotmail.com', '5515148168', 7, '2025-11-18', 'vip', 5);
INSERT INTO public.clientes VALUES (873, 'Luis', 'Castro Castro', 'luis873@gmail.com', '5548556908', 7, '2023-12-09', 'regular', 5);
INSERT INTO public.clientes VALUES (875, 'Claudia', 'Aguilar Mendoza', 'claudia875@gmail.com', '5590672745', 7, '2022-08-04', 'regular', 5);
INSERT INTO public.clientes VALUES (903, 'Elena', 'Rivera Vargas', 'elena903@yahoo.com', '5548143010', 7, '2023-03-03', 'premium', 5);
INSERT INTO public.clientes VALUES (912, 'Eduardo', 'Vega Cruz', 'eduardo912@gmail.com', '5556438200', 7, '2025-03-31', 'premium', 5);
INSERT INTO public.clientes VALUES (920, 'Daniela', 'Reyes García', 'daniela920@gmail.com', '5564112975', 7, '2021-09-30', 'premium', 5);
INSERT INTO public.clientes VALUES (964, 'Roberto', 'Moreno Torres', 'roberto964@yahoo.com', '5512512414', 7, '2022-10-05', 'regular', 5);
INSERT INTO public.clientes VALUES (1006, 'Adriana', 'Herrera Cruz', 'adriana1006@gmail.com', '5543789014', 7, '2023-01-27', 'regular', 5);
INSERT INTO public.clientes VALUES (1040, 'Luis', 'Rivera Rivera', 'luis1040@gmail.com', '5518765169', 7, '2021-09-09', 'premium', 5);
INSERT INTO public.clientes VALUES (1046, 'Valeria', 'García Castro', 'valeria1046@hotmail.com', '5529373095', 7, '2026-03-08', 'regular', 5);
INSERT INTO public.clientes VALUES (1094, 'Alejandro', 'Castillo Mendoza', 'alejandro1094@gmail.com', '5545374067', 7, '2024-05-14', 'regular', 5);
INSERT INTO public.clientes VALUES (1101, 'Manuel', 'Castillo Moreno', 'manuel1101@yahoo.com', '5578176556', 7, '2025-08-20', 'premium', 5);
INSERT INTO public.clientes VALUES (1117, 'Gabriela', 'Flores González', 'gabriela1117@yahoo.com', '5594065834', 7, '2024-03-06', 'regular', 5);
INSERT INTO public.clientes VALUES (1126, 'Rosa', 'Castro Vargas', 'rosa1126@gmail.com', '5546589757', 7, '2022-07-29', 'regular', 5);
INSERT INTO public.clientes VALUES (1148, 'Manuel', 'Castro Rodríguez', 'manuel1148@gmail.com', '5579457789', 7, '2025-06-07', 'vip', 5);
INSERT INTO public.clientes VALUES (1187, 'Carlos', 'Torres Vargas', 'carlos1187@hotmail.com', '5593011005', 7, '2023-01-06', 'regular', 5);
INSERT INTO public.clientes VALUES (1265, 'Juan', 'Morales Jiménez', 'juan1265@gmail.com', '5578390278', 7, '2022-10-27', 'mayorista', 5);
INSERT INTO public.clientes VALUES (1272, 'Daniela', 'Torres Pérez', 'daniela1272@gmail.com', '5579480727', 7, '2024-11-18', 'regular', 5);
INSERT INTO public.clientes VALUES (1293, 'Carlos', 'Gómez Ortega', 'carlos1293@yahoo.com', '5575895196', 7, '2022-05-20', 'regular', 5);
INSERT INTO public.clientes VALUES (1311, 'Gabriela', 'Rivera Hernández', 'gabriela1311@hotmail.com', '5597702160', 7, '2026-01-03', 'regular', 5);
INSERT INTO public.clientes VALUES (1328, 'Diego', 'Núñez Gómez', 'diego1328@gmail.com', '5564400820', 7, '2021-09-06', 'regular', 5);
INSERT INTO public.clientes VALUES (1348, 'Gabriela', 'Gutiérrez Herrera', 'gabriela1348@yahoo.com', '5512404497', 7, '2023-02-21', 'premium', 5);
INSERT INTO public.clientes VALUES (1352, 'José', 'Mendoza Mendoza', 'josé1352@hotmail.com', '5583356152', 7, '2026-05-09', 'regular', 5);
INSERT INTO public.clientes VALUES (1356, 'Isabel', 'Rodríguez Moreno', 'isabel1356@yahoo.com', '5531724678', 7, '2025-04-20', 'premium', 5);
INSERT INTO public.clientes VALUES (1385, 'Carlos', 'Vargas Pérez', 'carlos1385@gmail.com', '5511846825', 7, '2025-11-04', 'regular', 5);
INSERT INTO public.clientes VALUES (1410, 'Fernando', 'Rivera Vargas', 'fernando1410@gmail.com', '5550210777', 7, '2025-07-31', 'premium', 5);
INSERT INTO public.clientes VALUES (1412, 'José', 'Herrera Rodríguez', 'josé1412@yahoo.com', '5524554533', 7, '2025-02-27', 'premium', 5);
INSERT INTO public.clientes VALUES (1437, 'Sandra', 'Ortega Vargas', 'sandra1437@gmail.com', '5551271494', 7, '2024-10-10', 'regular', 5);
INSERT INTO public.clientes VALUES (1438, 'Mario', 'Herrera Castillo', 'mario1438@hotmail.com', '5580910050', 7, '2025-03-30', 'regular', 5);
INSERT INTO public.clientes VALUES (1452, 'Carlos', 'Mendoza García', 'carlos1452@gmail.com', '5554907705', 7, '2025-10-25', 'regular', 5);
INSERT INTO public.clientes VALUES (1475, 'Fernanda', 'Ortega Gutiérrez', 'fernanda1475@gmail.com', '5517351443', 7, '2022-12-15', 'premium', 5);
INSERT INTO public.clientes VALUES (1476, 'Claudia', 'González Gómez', 'claudia1476@gmail.com', '5571361861', 7, '2026-04-10', 'premium', 5);
INSERT INTO public.clientes VALUES (1540, 'Roberto', 'Castro González', 'roberto1540@gmail.com', '5584813845', 7, '2024-02-10', 'regular', 5);
INSERT INTO public.clientes VALUES (1547, 'David', 'Flores Morales', 'david1547@yahoo.com', '5594960511', 7, '2023-05-01', 'premium', 5);
INSERT INTO public.clientes VALUES (1549, 'Claudia', 'González Morales', 'claudia1549@gmail.com', '5539807813', 7, '2023-12-05', 'mayorista', 5);
INSERT INTO public.clientes VALUES (1589, 'Patricia', 'García González', 'patricia1589@gmail.com', '5517222980', 7, '2025-10-02', 'regular', 5);
INSERT INTO public.clientes VALUES (1606, 'María', 'Hernández Hernández', 'maría1606@gmail.com', '5564087642', 7, '2024-01-22', 'regular', 5);
INSERT INTO public.clientes VALUES (1612, 'Laura', 'Pérez Cruz', 'laura1612@gmail.com', '5526143430', 7, '2024-04-20', 'premium', 5);
INSERT INTO public.clientes VALUES (1614, 'Ramón', 'Ramírez Sánchez', 'ramón1614@yahoo.com', '5553260996', 7, '2025-06-02', 'regular', 5);
INSERT INTO public.clientes VALUES (1628, 'Luis', 'Ramírez Castro', 'luis1628@gmail.com', '5587977109', 7, '2025-10-24', 'regular', 5);
INSERT INTO public.clientes VALUES (1659, 'Alberto', 'Rivera Sánchez', 'alberto1659@gmail.com', '5511228910', 7, '2025-07-18', 'mayorista', 5);
INSERT INTO public.clientes VALUES (1660, 'Juan', 'Torres Rodríguez', 'juan1660@gmail.com', '5570656527', 7, '2021-07-02', 'regular', 5);
INSERT INTO public.clientes VALUES (1702, 'Alberto', 'García Rivera', 'alberto1702@gmail.com', '5536125123', 7, '2024-02-03', 'regular', 5);
INSERT INTO public.clientes VALUES (1716, 'Ana', 'López Vargas', 'ana1716@hotmail.com', '5555925432', 7, '2024-11-25', 'nuevo', 5);
INSERT INTO public.clientes VALUES (1731, 'Miguel', 'Gómez Vega', 'miguel1731@hotmail.com', '5515223457', 7, '2023-12-07', 'regular', 5);
INSERT INTO public.clientes VALUES (1747, 'Alejandro', 'Rivera González', 'alejandro1747@gmail.com', '5538791442', 7, '2026-03-10', 'regular', 5);
INSERT INTO public.clientes VALUES (1763, 'Alejandra', 'Torres Rodríguez', 'alejandra1763@yahoo.com', '5542248411', 7, '2022-09-06', 'mayorista', 5);
INSERT INTO public.clientes VALUES (1782, 'María', 'Vargas Rodríguez', 'maría1782@gmail.com', '5522033806', 7, '2022-08-13', 'mayorista', 5);
INSERT INTO public.clientes VALUES (1793, 'Diego', 'Jiménez Moreno', 'diego1793@gmail.com', '5593587401', 7, '2025-08-13', 'premium', 5);
INSERT INTO public.clientes VALUES (1813, 'Patricia', 'Sánchez Castro', 'patricia1813@yahoo.com', '5587484527', 7, '2024-03-14', 'premium', 5);
INSERT INTO public.clientes VALUES (1862, 'Isabel', 'Ramírez Ortega', 'isabel1862@yahoo.com', '5546190360', 7, '2024-12-18', 'regular', 5);
INSERT INTO public.clientes VALUES (1863, 'Verónica', 'Rodríguez González', 'verónica1863@hotmail.com', '5577176544', 7, '2025-09-22', 'premium', 5);
INSERT INTO public.clientes VALUES (1875, 'María', 'Torres Sánchez', 'maría1875@gmail.com', '5587771867', 7, '2023-08-13', 'premium', 5);
INSERT INTO public.clientes VALUES (1880, 'Daniela', 'Hernández Rodríguez', 'daniela1880@hotmail.com', '5547625379', 7, '2024-04-02', 'regular', 5);
INSERT INTO public.clientes VALUES (1884, 'Mario', 'Mendoza Cruz', 'mario1884@hotmail.com', '5568725569', 7, '2025-08-25', 'premium', 5);
INSERT INTO public.clientes VALUES (1948, 'Adriana', 'Mendoza Reyes', 'adriana1948@gmail.com', '5525105475', 7, '2023-11-08', 'regular', 5);
INSERT INTO public.clientes VALUES (1958, 'Ramón', 'Pérez Aguilar', 'ramón1958@hotmail.com', '5549485474', 7, '2023-12-05', 'regular', 5);
INSERT INTO public.clientes VALUES (1960, 'Miguel', 'García Martínez', 'miguel1960@gmail.com', '5537386444', 7, '2024-05-10', 'mayorista', 5);
INSERT INTO public.clientes VALUES (1999, 'Mónica', 'Cruz Ortega', 'mónica1999@yahoo.com', '5585198705', 7, '2024-01-27', 'regular', 5);
INSERT INTO public.clientes VALUES (6, 'Diego', 'Castro Jiménez', 'diego6@gmail.com', '5581327320', 2, '2022-03-24', 'regular', 6);
INSERT INTO public.clientes VALUES (39, 'Claudia', 'Mendoza García', 'claudia39@yahoo.com', '5594644676', 2, '2023-06-14', 'premium', 6);
INSERT INTO public.clientes VALUES (48, 'José', 'Núñez Castro', 'josé48@yahoo.com', '5563286118', 2, '2022-02-26', 'nuevo', 6);
INSERT INTO public.clientes VALUES (64, 'Miguel', 'Pérez Cruz', 'miguel64@gmail.com', '5522611138', 2, '2022-09-17', 'nuevo', 6);
INSERT INTO public.clientes VALUES (65, 'Sergio', 'Núñez Flores', 'sergio65@hotmail.com', '5583763371', 2, '2025-10-04', 'regular', 6);
INSERT INTO public.clientes VALUES (83, 'Alejandra', 'Castro Martínez', 'alejandra83@yahoo.com', '5563896091', 2, '2024-07-20', 'premium', 6);
INSERT INTO public.clientes VALUES (139, 'Juan', 'Martínez Castillo', 'juan139@gmail.com', '5554185620', 2, '2024-02-15', 'regular', 6);
INSERT INTO public.clientes VALUES (140, 'Adriana', 'Hernández Martínez', 'adriana140@gmail.com', '5594420078', 2, '2025-12-14', 'regular', 6);
INSERT INTO public.clientes VALUES (141, 'Gabriela', 'Díaz Jiménez', 'gabriela141@gmail.com', '5544850980', 2, '2023-03-22', 'nuevo', 6);
INSERT INTO public.clientes VALUES (148, 'Valeria', 'Cruz Mendoza', 'valeria148@gmail.com', '5517519183', 2, '2024-10-06', 'regular', 6);
INSERT INTO public.clientes VALUES (153, 'Diego', 'Castro Reyes', 'diego153@yahoo.com', '5574890505', 2, '2024-09-14', 'premium', 6);
INSERT INTO public.clientes VALUES (182, 'Daniela', 'Martínez Ortega', 'daniela182@hotmail.com', '5529070658', 2, '2021-08-17', 'nuevo', 6);
INSERT INTO public.clientes VALUES (197, 'Elena', 'Ramos Moreno', 'elena197@gmail.com', '5536162482', 2, '2024-07-20', 'premium', 6);
INSERT INTO public.clientes VALUES (226, 'Francisco', 'Martínez Jiménez', 'francisco226@hotmail.com', '5582440371', 2, '2025-03-19', 'regular', 6);
INSERT INTO public.clientes VALUES (252, 'Carlos', 'Torres Pérez', 'carlos252@hotmail.com', '5541182544', 2, '2022-10-30', 'regular', 6);
INSERT INTO public.clientes VALUES (259, 'David', 'González García', 'david259@gmail.com', '5583302419', 2, '2024-08-02', 'premium', 6);
INSERT INTO public.clientes VALUES (262, 'Eduardo', 'López Flores', 'eduardo262@hotmail.com', '5588306842', 2, '2025-03-14', 'premium', 6);
INSERT INTO public.clientes VALUES (276, 'Ana', 'Torres Torres', 'ana276@gmail.com', '5520311502', 2, '2025-05-11', 'premium', 6);
INSERT INTO public.clientes VALUES (278, 'Sofía', 'Gutiérrez Ortega', 'sofía278@yahoo.com', '5528381043', 2, '2024-11-12', 'regular', 6);
INSERT INTO public.clientes VALUES (302, 'Mónica', 'Pérez Torres', 'mónica302@gmail.com', '5575800289', 2, '2024-12-23', 'regular', 6);
INSERT INTO public.clientes VALUES (316, 'Claudia', 'Díaz Pérez', 'claudia316@yahoo.com', '5550513220', 2, '2021-12-08', 'regular', 6);
INSERT INTO public.clientes VALUES (353, 'Alejandro', 'Jiménez Aguilar', 'alejandro353@gmail.com', '5545400991', 2, '2024-09-08', 'regular', 6);
INSERT INTO public.clientes VALUES (368, 'Patricia', 'Núñez Morales', 'patricia368@gmail.com', '5596869121', 2, '2025-12-22', 'regular', 6);
INSERT INTO public.clientes VALUES (435, 'Pablo', 'Rivera Aguilar', 'pablo435@gmail.com', '5588538733', 2, '2024-11-12', 'regular', 6);
INSERT INTO public.clientes VALUES (474, 'Juan', 'Flores Sánchez', 'juan474@hotmail.com', '5526972976', 2, '2023-03-03', 'mayorista', 6);
INSERT INTO public.clientes VALUES (479, 'Isabel', 'Gutiérrez López', 'isabel479@yahoo.com', '5569660493', 2, '2024-06-21', 'regular', 6);
INSERT INTO public.clientes VALUES (519, 'Liliana', 'Cruz Gómez', 'liliana519@gmail.com', '5541195619', 2, '2023-02-24', 'premium', 6);
INSERT INTO public.clientes VALUES (538, 'Pablo', 'Gómez Castillo', 'pablo538@gmail.com', '5520784168', 2, '2025-05-21', 'mayorista', 6);
INSERT INTO public.clientes VALUES (563, 'Eduardo', 'Mendoza Moreno', 'eduardo563@gmail.com', '5526952687', 2, '2022-09-21', 'premium', 6);
INSERT INTO public.clientes VALUES (577, 'Carlos', 'Martínez Martínez', 'carlos577@yahoo.com', '5599763770', 2, '2025-03-08', 'regular', 6);
INSERT INTO public.clientes VALUES (593, 'Fernanda', 'Martínez Mendoza', 'fernanda593@gmail.com', '5533586265', 2, '2022-05-12', 'mayorista', 6);
INSERT INTO public.clientes VALUES (603, 'Francisco', 'Moreno Jiménez', 'francisco603@yahoo.com', '5532620027', 2, '2025-03-08', 'regular', 6);
INSERT INTO public.clientes VALUES (727, 'Isabel', 'Ortega Díaz', 'isabel727@hotmail.com', '5596583583', 2, '2024-06-20', 'regular', 6);
INSERT INTO public.clientes VALUES (745, 'Rosa', 'Morales Martínez', 'rosa745@hotmail.com', '5580819264', 2, '2021-08-18', 'regular', 6);
INSERT INTO public.clientes VALUES (749, 'Carlos', 'Castro Cruz', 'carlos749@yahoo.com', '5598836768', 2, '2023-11-27', 'regular', 6);
INSERT INTO public.clientes VALUES (755, 'Sergio', 'Castillo Jiménez', 'sergio755@yahoo.com', '5534840859', 2, '2022-07-08', 'premium', 6);
INSERT INTO public.clientes VALUES (759, 'Liliana', 'Moreno Torres', 'liliana759@gmail.com', '5580500436', 2, '2025-07-04', 'premium', 6);
INSERT INTO public.clientes VALUES (775, 'Alejandra', 'Martínez González', 'alejandra775@gmail.com', '5552045107', 2, '2022-08-08', 'premium', 6);
INSERT INTO public.clientes VALUES (780, 'Liliana', 'Morales Castillo', 'liliana780@yahoo.com', '5588466030', 2, '2022-04-19', 'premium', 6);
INSERT INTO public.clientes VALUES (806, 'Roberto', 'Torres López', 'roberto806@gmail.com', '5542399944', 2, '2023-01-07', 'regular', 6);
INSERT INTO public.clientes VALUES (835, 'Alberto', 'Vargas Hernández', 'alberto835@hotmail.com', '5534730353', 2, '2021-08-14', 'regular', 6);
INSERT INTO public.clientes VALUES (856, 'Daniela', 'Moreno Vargas', 'daniela856@yahoo.com', '5533719260', 2, '2022-05-24', 'regular', 6);
INSERT INTO public.clientes VALUES (857, 'Sofía', 'Sánchez Torres', 'sofía857@yahoo.com', '5579481516', 2, '2023-03-12', 'regular', 6);
INSERT INTO public.clientes VALUES (865, 'Laura', 'Ramos Mendoza', 'laura865@yahoo.com', '5531035567', 2, '2024-07-25', 'regular', 6);
INSERT INTO public.clientes VALUES (892, 'Liliana', 'Sánchez López', 'liliana892@hotmail.com', '5573554061', 2, '2022-05-23', 'mayorista', 6);
INSERT INTO public.clientes VALUES (897, 'Andrés', 'Vega Martínez', 'andrés897@yahoo.com', '5532913930', 2, '2023-09-18', 'regular', 6);
INSERT INTO public.clientes VALUES (914, 'Ramón', 'Torres Flores', 'ramón914@yahoo.com', '5544059134', 2, '2026-05-16', 'premium', 6);
INSERT INTO public.clientes VALUES (928, 'Andrés', 'Ramírez López', 'andrés928@hotmail.com', '5556823088', 2, '2023-12-04', 'mayorista', 6);
INSERT INTO public.clientes VALUES (951, 'Alejandro', 'Ramos Vargas', 'alejandro951@hotmail.com', '5570434208', 2, '2024-05-09', 'premium', 6);
INSERT INTO public.clientes VALUES (963, 'Isabel', 'Ramos Castillo', 'isabel963@gmail.com', '5547158689', 2, '2022-09-05', 'regular', 6);
INSERT INTO public.clientes VALUES (998, 'Fernando', 'Rivera Morales', 'fernando998@hotmail.com', '5511637561', 2, '2025-03-01', 'premium', 6);
INSERT INTO public.clientes VALUES (1011, 'Elena', 'Pérez Torres', 'elena1011@gmail.com', '5552951801', 2, '2023-10-19', 'regular', 6);
INSERT INTO public.clientes VALUES (1026, 'Sandra', 'Rivera García', 'sandra1026@gmail.com', '5514306243', 2, '2021-07-19', 'premium', 6);
INSERT INTO public.clientes VALUES (1042, 'Ana', 'González Vega', 'ana1042@hotmail.com', '5527172930', 2, '2025-07-28', 'regular', 6);
INSERT INTO public.clientes VALUES (1058, 'Claudia', 'Herrera Gutiérrez', 'claudia1058@yahoo.com', '5555952797', 2, '2024-12-20', 'regular', 6);
INSERT INTO public.clientes VALUES (1060, 'Eduardo', 'Torres Cruz', 'eduardo1060@hotmail.com', '5521135674', 2, '2025-06-03', 'regular', 6);
INSERT INTO public.clientes VALUES (1062, 'Alberto', 'Herrera González', 'alberto1062@gmail.com', '5581210764', 2, '2026-03-07', 'mayorista', 6);
INSERT INTO public.clientes VALUES (1087, 'Carmen', 'Rodríguez Flores', 'carmen1087@yahoo.com', '5551678306', 2, '2022-07-08', 'premium', 6);
INSERT INTO public.clientes VALUES (1116, 'David', 'Núñez Reyes', 'david1116@gmail.com', '5581393856', 2, '2024-03-26', 'premium', 6);
INSERT INTO public.clientes VALUES (1121, 'Ana', 'Aguilar Aguilar', 'ana1121@gmail.com', '5568224195', 2, '2023-07-04', 'mayorista', 6);
INSERT INTO public.clientes VALUES (1133, 'Juan', 'Cruz Jiménez', 'juan1133@gmail.com', '5598969812', 2, '2022-02-22', 'nuevo', 6);
INSERT INTO public.clientes VALUES (1136, 'Andrés', 'García Vega', 'andrés1136@hotmail.com', '5590753445', 2, '2024-10-30', 'regular', 6);
INSERT INTO public.clientes VALUES (1137, 'David', 'Hernández Martínez', 'david1137@gmail.com', '5565019090', 2, '2023-06-13', 'regular', 6);
INSERT INTO public.clientes VALUES (1166, 'Andrés', 'Núñez Moreno', 'andrés1166@hotmail.com', '5552763636', 2, '2025-10-22', 'regular', 6);
INSERT INTO public.clientes VALUES (1175, 'Rosa', 'Díaz Ramírez', 'rosa1175@gmail.com', '5542315695', 2, '2026-05-28', 'premium', 6);
INSERT INTO public.clientes VALUES (1186, 'Laura', 'Flores Castillo', 'laura1186@yahoo.com', '5541561623', 2, '2023-09-03', 'mayorista', 6);
INSERT INTO public.clientes VALUES (1289, 'Isabel', 'Pérez Castro', 'isabel1289@gmail.com', '5568606209', 2, '2024-07-10', 'regular', 6);
INSERT INTO public.clientes VALUES (1322, 'Valeria', 'Vargas Moreno', 'valeria1322@yahoo.com', '5589158875', 2, '2022-08-14', 'regular', 6);
INSERT INTO public.clientes VALUES (1323, 'Elena', 'Sánchez Aguilar', 'elena1323@yahoo.com', '5554044033', 2, '2024-10-04', 'regular', 6);
INSERT INTO public.clientes VALUES (1325, 'Elena', 'Cruz Castro', 'elena1325@yahoo.com', '5582774096', 2, '2024-05-29', 'regular', 6);
INSERT INTO public.clientes VALUES (1359, 'Francisco', 'Herrera Aguilar', 'francisco1359@gmail.com', '5572451136', 2, '2025-10-04', 'regular', 6);
INSERT INTO public.clientes VALUES (1370, 'Juan', 'Ramírez Flores', 'juan1370@gmail.com', '5519985429', 2, '2024-05-27', 'regular', 6);
INSERT INTO public.clientes VALUES (1389, 'Miguel', 'Mendoza Castro', 'miguel1389@gmail.com', '5571572062', 2, '2024-10-27', 'regular', 6);
INSERT INTO public.clientes VALUES (1427, 'José', 'González Rodríguez', 'josé1427@gmail.com', '5548785862', 2, '2022-12-16', 'premium', 6);
INSERT INTO public.clientes VALUES (1442, 'José', 'Morales Gómez', 'josé1442@hotmail.com', '5549003774', 2, '2023-03-20', 'nuevo', 6);
INSERT INTO public.clientes VALUES (1451, 'Sofía', 'Cruz Reyes', 'sofía1451@gmail.com', '5584161981', 2, '2026-05-25', 'regular', 6);
INSERT INTO public.clientes VALUES (1460, 'Elena', 'Morales Núñez', 'elena1460@yahoo.com', '5516222119', 2, '2022-07-22', 'regular', 6);
INSERT INTO public.clientes VALUES (1473, 'Ramón', 'Sánchez González', 'ramón1473@yahoo.com', '5512855262', 2, '2021-06-20', 'regular', 6);
INSERT INTO public.clientes VALUES (1477, 'Fernando', 'Torres Gutiérrez', 'fernando1477@gmail.com', '5540616453', 2, '2023-01-16', 'regular', 6);
INSERT INTO public.clientes VALUES (1488, 'Valeria', 'Hernández Cruz', 'valeria1488@yahoo.com', '5594495057', 2, '2025-05-06', 'mayorista', 6);
INSERT INTO public.clientes VALUES (1504, 'Ricardo', 'Vega Aguilar', 'ricardo1504@gmail.com', '5525433087', 2, '2025-06-14', 'regular', 6);
INSERT INTO public.clientes VALUES (1510, 'Sofía', 'Moreno Ramírez', 'sofía1510@yahoo.com', '5519779395', 2, '2022-10-17', 'premium', 6);
INSERT INTO public.clientes VALUES (1539, 'Diego', 'García Ramírez', 'diego1539@yahoo.com', '5579022241', 2, '2023-04-26', 'mayorista', 6);
INSERT INTO public.clientes VALUES (1550, 'Gabriela', 'Vargas Díaz', 'gabriela1550@yahoo.com', '5559163162', 2, '2022-04-21', 'premium', 6);
INSERT INTO public.clientes VALUES (1582, 'Roberto', 'Cruz Vargas', 'roberto1582@gmail.com', '5550461969', 2, '2025-11-11', 'regular', 6);
INSERT INTO public.clientes VALUES (1583, 'Carmen', 'Martínez López', 'carmen1583@hotmail.com', '5562986971', 2, '2025-08-28', 'vip', 6);
INSERT INTO public.clientes VALUES (1598, 'José', 'Morales Rodríguez', 'josé1598@yahoo.com', '5511762146', 2, '2025-11-24', 'mayorista', 6);
INSERT INTO public.clientes VALUES (1610, 'José', 'Flores Mendoza', 'josé1610@yahoo.com', '5591718358', 2, '2026-03-26', 'mayorista', 6);
INSERT INTO public.clientes VALUES (1622, 'Gabriela', 'Gutiérrez González', 'gabriela1622@yahoo.com', '5557788337', 2, '2023-07-27', 'premium', 6);
INSERT INTO public.clientes VALUES (1626, 'Liliana', 'Ramírez Mendoza', 'liliana1626@hotmail.com', '5585120173', 2, '2025-08-07', 'regular', 6);
INSERT INTO public.clientes VALUES (1639, 'Valeria', 'Rodríguez Sánchez', 'valeria1639@yahoo.com', '5584664486', 2, '2025-11-30', 'regular', 6);
INSERT INTO public.clientes VALUES (1642, 'José', 'Morales Herrera', 'josé1642@gmail.com', '5518768924', 2, '2025-09-25', 'premium', 6);
INSERT INTO public.clientes VALUES (1644, 'Manuel', 'González Martínez', 'manuel1644@yahoo.com', '5565525803', 2, '2021-09-09', 'nuevo', 6);
INSERT INTO public.clientes VALUES (1691, 'Francisco', 'Gómez Cruz', 'francisco1691@yahoo.com', '5513999753', 2, '2021-09-23', 'premium', 6);
INSERT INTO public.clientes VALUES (1717, 'Fernando', 'Aguilar González', 'fernando1717@hotmail.com', '5533840467', 2, '2025-07-13', 'vip', 6);
INSERT INTO public.clientes VALUES (1727, 'Sofía', 'Díaz Aguilar', 'sofía1727@gmail.com', '5593806250', 2, '2025-08-26', 'nuevo', 6);
INSERT INTO public.clientes VALUES (1772, 'Juan', 'Reyes Núñez', 'juan1772@gmail.com', '5533136216', 2, '2024-11-23', 'regular', 6);
INSERT INTO public.clientes VALUES (1792, 'Verónica', 'Castillo Flores', 'verónica1792@yahoo.com', '5579080131', 2, '2022-11-16', 'mayorista', 6);
INSERT INTO public.clientes VALUES (1818, 'Ramón', 'Castillo Mendoza', 'ramón1818@hotmail.com', '5563418120', 2, '2021-12-04', 'premium', 6);
INSERT INTO public.clientes VALUES (1825, 'Andrés', 'Hernández Reyes', 'andrés1825@hotmail.com', '5526212584', 2, '2021-12-02', 'regular', 6);
INSERT INTO public.clientes VALUES (1836, 'José', 'Sánchez Herrera', 'josé1836@yahoo.com', '5517694960', 2, '2022-01-17', 'regular', 6);
INSERT INTO public.clientes VALUES (1857, 'Andrés', 'Ramos García', 'andrés1857@yahoo.com', '5531677773', 2, '2025-07-17', 'regular', 6);
INSERT INTO public.clientes VALUES (1864, 'Fernando', 'Ortega Moreno', 'fernando1864@gmail.com', '5596240962', 2, '2023-03-06', 'mayorista', 6);
INSERT INTO public.clientes VALUES (1931, 'Ricardo', 'Rodríguez Vega', 'ricardo1931@gmail.com', '5537757450', 2, '2023-01-10', 'mayorista', 6);
INSERT INTO public.clientes VALUES (1932, 'Rosa', 'Pérez Aguilar', 'rosa1932@hotmail.com', '5521180576', 2, '2024-07-23', 'premium', 6);
INSERT INTO public.clientes VALUES (1989, 'Sergio', 'Rodríguez Vargas', 'sergio1989@yahoo.com', '5579068413', 2, '2024-10-10', 'premium', 6);
INSERT INTO public.clientes VALUES (1995, 'Isabel', 'Mendoza Núñez', 'isabel1995@yahoo.com', '5531458188', 2, '2024-04-01', 'nuevo', 6);
INSERT INTO public.clientes VALUES (1996, 'Roberto', 'Ramos Pérez', 'roberto1996@gmail.com', '5538174991', 2, '2023-08-17', 'regular', 6);
INSERT INTO public.clientes VALUES (2000, 'Eduardo', 'López Vargas', 'eduardo2000@gmail.com', '5552021016', 2, '2023-06-05', 'premium', 6);
INSERT INTO public.clientes VALUES (8, 'Sandra', 'Díaz Sánchez', 'sandra8@gmail.com', '5574709513', 6, '2024-06-24', 'regular', 7);
INSERT INTO public.clientes VALUES (17, 'Ricardo', 'Rivera López', 'ricardo17@gmail.com', '5561583363', 6, '2023-01-01', 'premium', 7);
INSERT INTO public.clientes VALUES (40, 'Gabriela', 'Ramírez Gutiérrez', 'gabriela40@gmail.com', '5516403434', 6, '2025-11-21', 'premium', 7);
INSERT INTO public.clientes VALUES (77, 'Miguel', 'Pérez Martínez', 'miguel77@yahoo.com', '5586639957', 6, '2022-10-03', 'regular', 7);
INSERT INTO public.clientes VALUES (85, 'David', 'Jiménez Sánchez', 'david85@gmail.com', '5538712948', 6, '2022-02-24', 'regular', 7);
INSERT INTO public.clientes VALUES (93, 'Adriana', 'Núñez García', 'adriana93@gmail.com', '5594851591', 6, '2026-02-21', 'regular', 7);
INSERT INTO public.clientes VALUES (96, 'Juan', 'Flores López', 'juan96@hotmail.com', '5583571770', 6, '2024-12-21', 'regular', 7);
INSERT INTO public.clientes VALUES (191, 'Adriana', 'Núñez Aguilar', 'adriana191@yahoo.com', '5565424925', 6, '2025-02-09', 'premium', 7);
INSERT INTO public.clientes VALUES (214, 'Mónica', 'García Hernández', 'mónica214@yahoo.com', '5515746469', 6, '2025-10-12', 'regular', 7);
INSERT INTO public.clientes VALUES (268, 'Sandra', 'Flores López', 'sandra268@gmail.com', '5589279578', 6, '2025-12-12', 'regular', 7);
INSERT INTO public.clientes VALUES (314, 'Verónica', 'Pérez Torres', 'verónica314@yahoo.com', '5586976644', 6, '2021-12-07', 'regular', 7);
INSERT INTO public.clientes VALUES (359, 'Valeria', 'García Torres', 'valeria359@gmail.com', '5526373347', 6, '2024-05-07', 'regular', 7);
INSERT INTO public.clientes VALUES (363, 'Verónica', 'Jiménez Gómez', 'verónica363@yahoo.com', '5542223009', 6, '2025-12-11', 'regular', 7);
INSERT INTO public.clientes VALUES (374, 'Isabel', 'Vega Moreno', 'isabel374@hotmail.com', '5510784780', 6, '2025-10-16', 'regular', 7);
INSERT INTO public.clientes VALUES (478, 'Fernando', 'Cruz Vega', 'fernando478@yahoo.com', '5567045601', 6, '2023-03-29', 'regular', 7);
INSERT INTO public.clientes VALUES (484, 'Manuel', 'Núñez Ramírez', 'manuel484@yahoo.com', '5556524207', 6, '2024-03-03', 'mayorista', 7);
INSERT INTO public.clientes VALUES (485, 'María', 'Morales Vargas', 'maría485@gmail.com', '5530036175', 6, '2025-03-02', 'regular', 7);
INSERT INTO public.clientes VALUES (491, 'Liliana', 'Vega Gómez', 'liliana491@gmail.com', '5537407879', 6, '2026-02-01', 'regular', 7);
INSERT INTO public.clientes VALUES (505, 'Mónica', 'Gómez Flores', 'mónica505@gmail.com', '5536092407', 6, '2026-03-26', 'regular', 7);
INSERT INTO public.clientes VALUES (510, 'Sandra', 'Vargas Moreno', 'sandra510@gmail.com', '5523796681', 6, '2022-07-29', 'regular', 7);
INSERT INTO public.clientes VALUES (517, 'Carmen', 'Ramírez Martínez', 'carmen517@gmail.com', '5594674464', 6, '2022-08-23', 'vip', 7);
INSERT INTO public.clientes VALUES (521, 'José', 'Hernández González', 'josé521@yahoo.com', '5530356881', 6, '2025-04-19', 'premium', 7);
INSERT INTO public.clientes VALUES (535, 'Daniela', 'Reyes Castillo', 'daniela535@hotmail.com', '5517744982', 6, '2024-01-25', 'premium', 7);
INSERT INTO public.clientes VALUES (539, 'Mario', 'Ramírez Castillo', 'mario539@hotmail.com', '5598380502', 6, '2023-02-27', 'regular', 7);
INSERT INTO public.clientes VALUES (549, 'Miguel', 'Rivera Vega', 'miguel549@yahoo.com', '5571326664', 6, '2022-05-18', 'mayorista', 7);
INSERT INTO public.clientes VALUES (553, 'Claudia', 'Moreno Vega', 'claudia553@gmail.com', '5523482938', 6, '2024-10-18', 'premium', 7);
INSERT INTO public.clientes VALUES (575, 'Sergio', 'Castillo Jiménez', 'sergio575@gmail.com', '5597616925', 6, '2022-02-04', 'premium', 7);
INSERT INTO public.clientes VALUES (576, 'Laura', 'Herrera Cruz', 'laura576@gmail.com', '5597283256', 6, '2024-11-25', 'premium', 7);
INSERT INTO public.clientes VALUES (590, 'Carmen', 'Díaz Aguilar', 'carmen590@hotmail.com', '5568200448', 6, '2026-04-19', 'nuevo', 7);
INSERT INTO public.clientes VALUES (639, 'Rosa', 'Aguilar Cruz', 'rosa639@yahoo.com', '5588069593', 6, '2025-07-28', 'regular', 7);
INSERT INTO public.clientes VALUES (656, 'Manuel', 'Morales Gutiérrez', 'manuel656@gmail.com', '5540885447', 6, '2025-12-22', 'regular', 7);
INSERT INTO public.clientes VALUES (666, 'Pablo', 'González Ramos', 'pablo666@hotmail.com', '5539381121', 6, '2025-05-31', 'mayorista', 7);
INSERT INTO public.clientes VALUES (685, 'Roberto', 'Ortega Gómez', 'roberto685@gmail.com', '5539937437', 6, '2021-07-17', 'regular', 7);
INSERT INTO public.clientes VALUES (765, 'Carmen', 'Ramírez Núñez', 'carmen765@gmail.com', '5554452330', 6, '2023-02-21', 'regular', 7);
INSERT INTO public.clientes VALUES (778, 'Manuel', 'Castro Ortega', 'manuel778@gmail.com', '5517185483', 6, '2025-09-27', 'regular', 7);
INSERT INTO public.clientes VALUES (791, 'Sandra', 'Pérez Rivera', 'sandra791@gmail.com', '5580471776', 6, '2023-07-27', 'regular', 7);
INSERT INTO public.clientes VALUES (793, 'Fernanda', 'López Núñez', 'fernanda793@gmail.com', '5574927109', 6, '2023-10-19', 'premium', 7);
INSERT INTO public.clientes VALUES (877, 'David', 'Díaz Gómez', 'david877@gmail.com', '5567069281', 6, '2024-12-25', 'vip', 7);
INSERT INTO public.clientes VALUES (881, 'Daniela', 'Gutiérrez Pérez', 'daniela881@gmail.com', '5581900277', 6, '2021-08-16', 'premium', 7);
INSERT INTO public.clientes VALUES (884, 'Elena', 'Hernández Ramírez', 'elena884@gmail.com', '5560715072', 6, '2025-09-16', 'mayorista', 7);
INSERT INTO public.clientes VALUES (937, 'Sandra', 'Martínez Díaz', 'sandra937@yahoo.com', '5587509126', 6, '2023-02-13', 'regular', 7);
INSERT INTO public.clientes VALUES (942, 'Manuel', 'Moreno Gómez', 'manuel942@gmail.com', '5573391831', 6, '2021-10-13', 'regular', 7);
INSERT INTO public.clientes VALUES (949, 'Sofía', 'Cruz Mendoza', 'sofía949@hotmail.com', '5523610361', 6, '2021-12-09', 'mayorista', 7);
INSERT INTO public.clientes VALUES (950, 'Juan', 'Ortega Reyes', 'juan950@yahoo.com', '5575248523', 6, '2024-01-28', 'premium', 7);
INSERT INTO public.clientes VALUES (960, 'Valeria', 'Núñez Vargas', 'valeria960@gmail.com', '5566711004', 6, '2026-04-27', 'regular', 7);
INSERT INTO public.clientes VALUES (968, 'Manuel', 'Castillo Rodríguez', 'manuel968@gmail.com', '5544318479', 6, '2026-04-06', 'premium', 7);
INSERT INTO public.clientes VALUES (975, 'Valeria', 'Reyes Gutiérrez', 'valeria975@gmail.com', '5540212304', 6, '2023-09-02', 'premium', 7);
INSERT INTO public.clientes VALUES (977, 'Andrés', 'Vargas Rodríguez', 'andrés977@gmail.com', '5523196701', 6, '2023-03-11', 'premium', 7);
INSERT INTO public.clientes VALUES (980, 'Eduardo', 'García Ramos', 'eduardo980@gmail.com', '5597793969', 6, '2023-05-08', 'regular', 7);
INSERT INTO public.clientes VALUES (994, 'Isabel', 'Rivera Ramos', 'isabel994@gmail.com', '5579366132', 6, '2023-10-09', 'premium', 7);
INSERT INTO public.clientes VALUES (1036, 'Fernando', 'Gómez Hernández', 'fernando1036@yahoo.com', '5537599495', 6, '2023-02-19', 'mayorista', 7);
INSERT INTO public.clientes VALUES (1064, 'Patricia', 'Gutiérrez Jiménez', 'patricia1064@yahoo.com', '5516564881', 6, '2024-10-12', 'regular', 7);
INSERT INTO public.clientes VALUES (1067, 'Diego', 'Aguilar Rodríguez', 'diego1067@gmail.com', '5542542841', 6, '2022-01-13', 'regular', 7);
INSERT INTO public.clientes VALUES (1085, 'Elena', 'Flores Aguilar', 'elena1085@hotmail.com', '5522137642', 6, '2024-09-09', 'premium', 7);
INSERT INTO public.clientes VALUES (1089, 'Fernanda', 'Vega Ramírez', 'fernanda1089@yahoo.com', '5557486185', 6, '2025-09-12', 'vip', 7);
INSERT INTO public.clientes VALUES (1124, 'David', 'Rodríguez Gómez', 'david1124@gmail.com', '5559899973', 6, '2026-03-12', 'regular', 7);
INSERT INTO public.clientes VALUES (1142, 'Elena', 'González Torres', 'elena1142@gmail.com', '5533401284', 6, '2025-01-01', 'mayorista', 7);
INSERT INTO public.clientes VALUES (1164, 'Fernando', 'Castro Morales', 'fernando1164@yahoo.com', '5546276862', 6, '2024-07-24', 'regular', 7);
INSERT INTO public.clientes VALUES (1205, 'José', 'Díaz Flores', 'josé1205@gmail.com', '5576096285', 6, '2023-05-22', 'regular', 7);
INSERT INTO public.clientes VALUES (1211, 'José', 'Ortega Castro', 'josé1211@hotmail.com', '5532035756', 6, '2025-04-02', 'regular', 7);
INSERT INTO public.clientes VALUES (1212, 'Alberto', 'Torres Ramírez', 'alberto1212@gmail.com', '5578569102', 6, '2025-07-19', 'mayorista', 7);
INSERT INTO public.clientes VALUES (1233, 'Carmen', 'Vega Mendoza', 'carmen1233@gmail.com', '5537623724', 6, '2025-12-26', 'mayorista', 7);
INSERT INTO public.clientes VALUES (1241, 'Eduardo', 'Moreno Gómez', 'eduardo1241@hotmail.com', '5556059442', 6, '2024-05-05', 'regular', 7);
INSERT INTO public.clientes VALUES (1277, 'José', 'Ramírez Martínez', 'josé1277@gmail.com', '5583911477', 6, '2026-06-05', 'regular', 7);
INSERT INTO public.clientes VALUES (1295, 'Sandra', 'Jiménez Reyes', 'sandra1295@gmail.com', '5514871204', 6, '2024-05-26', 'regular', 7);
INSERT INTO public.clientes VALUES (1304, 'Pablo', 'González García', 'pablo1304@hotmail.com', '5575760850', 6, '2023-05-11', 'regular', 7);
INSERT INTO public.clientes VALUES (1307, 'Eduardo', 'Aguilar Torres', 'eduardo1307@hotmail.com', '5561347982', 6, '2024-10-06', 'regular', 7);
INSERT INTO public.clientes VALUES (1329, 'Roberto', 'Flores Rodríguez', 'roberto1329@gmail.com', '5589650979', 6, '2021-08-29', 'regular', 7);
INSERT INTO public.clientes VALUES (1336, 'Claudia', 'Mendoza Cruz', 'claudia1336@hotmail.com', '5549413474', 6, '2024-02-06', 'mayorista', 7);
INSERT INTO public.clientes VALUES (1341, 'Isabel', 'Gómez Rodríguez', 'isabel1341@gmail.com', '5572210446', 6, '2022-01-18', 'premium', 7);
INSERT INTO public.clientes VALUES (1380, 'Claudia', 'Gutiérrez Sánchez', 'claudia1380@yahoo.com', '5599507425', 6, '2025-05-13', 'mayorista', 7);
INSERT INTO public.clientes VALUES (1387, 'Isabel', 'Cruz Moreno', 'isabel1387@hotmail.com', '5537753738', 6, '2024-06-18', 'regular', 7);
INSERT INTO public.clientes VALUES (1394, 'Sofía', 'Ramírez Vega', 'sofía1394@gmail.com', '5551636644', 6, '2026-05-01', 'regular', 7);
INSERT INTO public.clientes VALUES (1436, 'José', 'Gómez Ramírez', 'josé1436@hotmail.com', '5528991936', 6, '2022-12-22', 'premium', 7);
INSERT INTO public.clientes VALUES (1462, 'Pablo', 'Castro Jiménez', 'pablo1462@hotmail.com', '5513660053', 6, '2025-07-31', 'premium', 7);
INSERT INTO public.clientes VALUES (1480, 'Alejandra', 'Flores García', 'alejandra1480@gmail.com', '5529762536', 6, '2023-02-18', 'premium', 7);
INSERT INTO public.clientes VALUES (1500, 'Miguel', 'Sánchez Cruz', 'miguel1500@yahoo.com', '5523638593', 6, '2023-10-22', 'regular', 7);
INSERT INTO public.clientes VALUES (1517, 'Roberto', 'Sánchez Castro', 'roberto1517@gmail.com', '5570073059', 6, '2023-10-07', 'regular', 7);
INSERT INTO public.clientes VALUES (1518, 'Carmen', 'García Núñez', 'carmen1518@gmail.com', '5546896459', 6, '2022-01-26', 'regular', 7);
INSERT INTO public.clientes VALUES (1524, 'David', 'Vega Rivera', 'david1524@yahoo.com', '5580274372', 6, '2023-11-11', 'regular', 7);
INSERT INTO public.clientes VALUES (1554, 'Manuel', 'Cruz Rivera', 'manuel1554@yahoo.com', '5573305233', 6, '2023-07-15', 'premium', 7);
INSERT INTO public.clientes VALUES (1571, 'Daniela', 'Moreno Reyes', 'daniela1571@yahoo.com', '5581805084', 6, '2026-02-07', 'premium', 7);
INSERT INTO public.clientes VALUES (1581, 'Rosa', 'Hernández Torres', 'rosa1581@gmail.com', '5567908044', 6, '2024-07-21', 'regular', 7);
INSERT INTO public.clientes VALUES (1585, 'Ramón', 'Pérez Castillo', 'ramón1585@gmail.com', '5556972893', 6, '2021-09-26', 'premium', 7);
INSERT INTO public.clientes VALUES (1630, 'Luis', 'Herrera Núñez', 'luis1630@hotmail.com', '5598399977', 6, '2025-06-04', 'regular', 7);
INSERT INTO public.clientes VALUES (1635, 'Sandra', 'Sánchez Jiménez', 'sandra1635@yahoo.com', '5544699521', 6, '2023-10-03', 'regular', 7);
INSERT INTO public.clientes VALUES (1645, 'Valeria', 'Jiménez Rodríguez', 'valeria1645@gmail.com', '5594099499', 6, '2024-12-16', 'regular', 7);
INSERT INTO public.clientes VALUES (1646, 'Verónica', 'Jiménez Mendoza', 'verónica1646@gmail.com', '5588083792', 6, '2022-07-16', 'premium', 7);
INSERT INTO public.clientes VALUES (1650, 'Miguel', 'Sánchez Aguilar', 'miguel1650@gmail.com', '5584522968', 6, '2025-04-13', 'regular', 7);
INSERT INTO public.clientes VALUES (1674, 'Claudia', 'Rodríguez García', 'claudia1674@hotmail.com', '5582329391', 6, '2022-08-08', 'regular', 7);
INSERT INTO public.clientes VALUES (1699, 'Pablo', 'Díaz Ramírez', 'pablo1699@yahoo.com', '5596879784', 6, '2024-05-13', 'regular', 7);
INSERT INTO public.clientes VALUES (1719, 'Elena', 'López González', 'elena1719@gmail.com', '5519729173', 6, '2023-05-28', 'vip', 7);
INSERT INTO public.clientes VALUES (1754, 'Eduardo', 'Vega Sánchez', 'eduardo1754@yahoo.com', '5571535643', 6, '2022-03-11', 'mayorista', 7);
INSERT INTO public.clientes VALUES (1786, 'Daniela', 'Gómez Gutiérrez', 'daniela1786@gmail.com', '5566060603', 6, '2023-11-11', 'nuevo', 7);
INSERT INTO public.clientes VALUES (1790, 'Alberto', 'Gómez Rodríguez', 'alberto1790@yahoo.com', '5532675186', 6, '2025-09-09', 'regular', 7);
INSERT INTO public.clientes VALUES (1800, 'Eduardo', 'Ortega Morales', 'eduardo1800@gmail.com', '5546353477', 6, '2024-04-11', 'vip', 7);
INSERT INTO public.clientes VALUES (1803, 'Gabriela', 'Reyes López', 'gabriela1803@gmail.com', '5534879238', 6, '2023-02-07', 'regular', 7);
INSERT INTO public.clientes VALUES (1859, 'Verónica', 'Aguilar Ortega', 'verónica1859@gmail.com', '5592104213', 6, '2024-06-27', 'vip', 7);
INSERT INTO public.clientes VALUES (1870, 'Mónica', 'Flores Vega', 'mónica1870@yahoo.com', '5589846877', 6, '2025-05-18', 'regular', 7);
INSERT INTO public.clientes VALUES (1872, 'Eduardo', 'Gutiérrez Torres', 'eduardo1872@hotmail.com', '5563223875', 6, '2025-03-15', 'regular', 7);
INSERT INTO public.clientes VALUES (1882, 'Adriana', 'Mendoza Sánchez', 'adriana1882@yahoo.com', '5554317225', 6, '2023-03-25', 'nuevo', 7);
INSERT INTO public.clientes VALUES (1907, 'Andrés', 'Morales Ramírez', 'andrés1907@gmail.com', '5534381903', 6, '2024-01-19', 'premium', 7);
INSERT INTO public.clientes VALUES (1936, 'Alberto', 'Ramos Vega', 'alberto1936@yahoo.com', '5512655477', 6, '2023-09-28', 'regular', 7);
INSERT INTO public.clientes VALUES (1947, 'Eduardo', 'Moreno Jiménez', 'eduardo1947@gmail.com', '5548148252', 6, '2024-11-24', 'regular', 7);
INSERT INTO public.clientes VALUES (1956, 'Ana', 'García Pérez', 'ana1956@yahoo.com', '5562395558', 6, '2025-11-15', 'regular', 7);
INSERT INTO public.clientes VALUES (1957, 'Adriana', 'Rivera Vargas', 'adriana1957@hotmail.com', '5557974300', 6, '2024-10-20', 'regular', 7);
INSERT INTO public.clientes VALUES (1984, 'Alejandro', 'Vega Gómez', 'alejandro1984@hotmail.com', '5569417259', 6, '2025-07-14', 'regular', 7);
INSERT INTO public.clientes VALUES (9, 'Liliana', 'Martínez Díaz', 'liliana9@yahoo.com', '5541207351', 6, '2024-11-08', 'regular', 8);
INSERT INTO public.clientes VALUES (21, 'Fernanda', 'Ortega Pérez', 'fernanda21@gmail.com', '5519209640', 6, '2023-05-13', 'regular', 8);
INSERT INTO public.clientes VALUES (47, 'Roberto', 'Vega García', 'roberto47@yahoo.com', '5543775489', 6, '2025-04-06', 'regular', 8);
INSERT INTO public.clientes VALUES (149, 'Verónica', 'Gutiérrez García', 'verónica149@hotmail.com', '5557458790', 6, '2025-08-10', 'regular', 8);
INSERT INTO public.clientes VALUES (151, 'Sergio', 'Castillo Vega', 'sergio151@yahoo.com', '5565548633', 6, '2023-08-29', 'mayorista', 8);
INSERT INTO public.clientes VALUES (155, 'Francisco', 'Martínez García', 'francisco155@yahoo.com', '5589763928', 6, '2024-07-29', 'regular', 8);
INSERT INTO public.clientes VALUES (161, 'Mónica', 'Jiménez Rivera', 'mónica161@hotmail.com', '5581603135', 6, '2022-03-17', 'premium', 8);
INSERT INTO public.clientes VALUES (168, 'Alejandra', 'Ortega Mendoza', 'alejandra168@hotmail.com', '5533231136', 6, '2022-04-19', 'vip', 8);
INSERT INTO public.clientes VALUES (178, 'Patricia', 'Ramos Castro', 'patricia178@yahoo.com', '5528223512', 6, '2025-09-03', 'premium', 8);
INSERT INTO public.clientes VALUES (183, 'Mónica', 'Reyes López', 'mónica183@gmail.com', '5591882291', 6, '2025-01-25', 'regular', 8);
INSERT INTO public.clientes VALUES (210, 'José', 'Rivera Gutiérrez', 'josé210@gmail.com', '5555642455', 6, '2021-09-23', 'regular', 8);
INSERT INTO public.clientes VALUES (220, 'Rosa', 'Herrera Hernández', 'rosa220@gmail.com', '5555030548', 6, '2025-10-07', 'regular', 8);
INSERT INTO public.clientes VALUES (263, 'Rosa', 'García López', 'rosa263@gmail.com', '5569788371', 6, '2023-07-29', 'regular', 8);
INSERT INTO public.clientes VALUES (284, 'José', 'Díaz Castillo', 'josé284@gmail.com', '5524995099', 6, '2026-05-04', 'premium', 8);
INSERT INTO public.clientes VALUES (296, 'Sofía', 'Ramos Núñez', 'sofía296@gmail.com', '5532645646', 6, '2024-05-28', 'nuevo', 8);
INSERT INTO public.clientes VALUES (301, 'Alberto', 'Moreno Flores', 'alberto301@hotmail.com', '5522929680', 6, '2022-09-27', 'premium', 8);
INSERT INTO public.clientes VALUES (325, 'Alberto', 'Torres Vega', 'alberto325@hotmail.com', '5558779318', 6, '2024-03-21', 'vip', 8);
INSERT INTO public.clientes VALUES (358, 'Carlos', 'Reyes Herrera', 'carlos358@gmail.com', '5565890810', 6, '2025-01-23', 'premium', 8);
INSERT INTO public.clientes VALUES (366, 'Andrés', 'Castro Gómez', 'andrés366@hotmail.com', '5566783572', 6, '2022-03-15', 'regular', 8);
INSERT INTO public.clientes VALUES (398, 'Daniela', 'García Cruz', 'daniela398@yahoo.com', '5579437366', 6, '2025-12-20', 'regular', 8);
INSERT INTO public.clientes VALUES (440, 'Verónica', 'López Mendoza', 'verónica440@gmail.com', '5597411506', 6, '2023-06-04', 'regular', 8);
INSERT INTO public.clientes VALUES (475, 'José', 'Mendoza Morales', 'josé475@gmail.com', '5592528662', 6, '2025-07-04', 'regular', 8);
INSERT INTO public.clientes VALUES (481, 'Carlos', 'Rodríguez Cruz', 'carlos481@hotmail.com', '5558196637', 6, '2024-10-16', 'mayorista', 8);
INSERT INTO public.clientes VALUES (508, 'Sergio', 'Martínez Gutiérrez', 'sergio508@gmail.com', '5532609429', 6, '2022-09-05', 'premium', 8);
INSERT INTO public.clientes VALUES (512, 'Carlos', 'García Flores', 'carlos512@gmail.com', '5599784876', 6, '2025-03-17', 'nuevo', 8);
INSERT INTO public.clientes VALUES (533, 'Pablo', 'Ramos Rivera', 'pablo533@yahoo.com', '5588961498', 6, '2024-02-25', 'mayorista', 8);
INSERT INTO public.clientes VALUES (552, 'Valeria', 'Moreno Cruz', 'valeria552@yahoo.com', '5592220752', 6, '2024-06-28', 'regular', 8);
INSERT INTO public.clientes VALUES (559, 'Ricardo', 'Núñez Ortega', 'ricardo559@gmail.com', '5590621827', 6, '2022-11-01', 'regular', 8);
INSERT INTO public.clientes VALUES (616, 'Alberto', 'Ramos García', 'alberto616@yahoo.com', '5575220319', 6, '2022-03-06', 'regular', 8);
INSERT INTO public.clientes VALUES (630, 'Fernando', 'Ramos Aguilar', 'fernando630@hotmail.com', '5578919151', 6, '2025-07-08', 'regular', 8);
INSERT INTO public.clientes VALUES (650, 'Luis', 'Torres Rivera', 'luis650@yahoo.com', '5558384619', 6, '2026-03-15', 'premium', 8);
INSERT INTO public.clientes VALUES (652, 'Luis', 'Ramírez Núñez', 'luis652@yahoo.com', '5545621515', 6, '2022-01-08', 'regular', 8);
INSERT INTO public.clientes VALUES (657, 'Ramón', 'Herrera Castillo', 'ramón657@gmail.com', '5539438509', 6, '2025-02-15', 'regular', 8);
INSERT INTO public.clientes VALUES (675, 'Ana', 'Torres Rodríguez', 'ana675@yahoo.com', '5594013952', 6, '2022-06-01', 'regular', 8);
INSERT INTO public.clientes VALUES (679, 'Carlos', 'González Herrera', 'carlos679@gmail.com', '5583435357', 6, '2023-08-25', 'regular', 8);
INSERT INTO public.clientes VALUES (680, 'Sergio', 'Rodríguez López', 'sergio680@yahoo.com', '5521976146', 6, '2025-06-10', 'premium', 8);
INSERT INTO public.clientes VALUES (702, 'Gabriela', 'Castillo Jiménez', 'gabriela702@gmail.com', '5523317762', 6, '2021-12-04', 'mayorista', 8);
INSERT INTO public.clientes VALUES (717, 'Fernanda', 'Martínez Morales', 'fernanda717@gmail.com', '5565531931', 6, '2023-09-19', 'nuevo', 8);
INSERT INTO public.clientes VALUES (757, 'Carlos', 'Moreno Morales', 'carlos757@yahoo.com', '5545410956', 6, '2025-06-27', 'premium', 8);
INSERT INTO public.clientes VALUES (797, 'Alejandra', 'Núñez López', 'alejandra797@yahoo.com', '5515022195', 6, '2023-12-20', 'premium', 8);
INSERT INTO public.clientes VALUES (837, 'Daniela', 'Gutiérrez Castillo', 'daniela837@yahoo.com', '5524651674', 6, '2023-08-08', 'regular', 8);
INSERT INTO public.clientes VALUES (838, 'Elena', 'Pérez Flores', 'elena838@gmail.com', '5565830504', 6, '2022-11-05', 'regular', 8);
INSERT INTO public.clientes VALUES (842, 'Ramón', 'Hernández Moreno', 'ramón842@gmail.com', '5561148988', 6, '2026-01-04', 'nuevo', 8);
INSERT INTO public.clientes VALUES (853, 'David', 'Ortega Jiménez', 'david853@gmail.com', '5516071701', 6, '2022-04-21', 'vip', 8);
INSERT INTO public.clientes VALUES (855, 'Roberto', 'Ramos Herrera', 'roberto855@gmail.com', '5578367019', 6, '2025-08-04', 'mayorista', 8);
INSERT INTO public.clientes VALUES (921, 'Fernando', 'Aguilar Herrera', 'fernando921@gmail.com', '5545787268', 6, '2025-06-23', 'regular', 8);
INSERT INTO public.clientes VALUES (969, 'Laura', 'Vargas Morales', 'laura969@gmail.com', '5556345273', 6, '2025-04-12', 'premium', 8);
INSERT INTO public.clientes VALUES (989, 'Ricardo', 'Mendoza Morales', 'ricardo989@yahoo.com', '5596172555', 6, '2023-11-16', 'mayorista', 8);
INSERT INTO public.clientes VALUES (1047, 'Sandra', 'Rodríguez Rodríguez', 'sandra1047@yahoo.com', '5539890245', 6, '2024-02-03', 'nuevo', 8);
INSERT INTO public.clientes VALUES (1066, 'Gabriela', 'Pérez Núñez', 'gabriela1066@gmail.com', '5589723307', 6, '2026-02-10', 'premium', 8);
INSERT INTO public.clientes VALUES (1088, 'Manuel', 'Gutiérrez Rodríguez', 'manuel1088@hotmail.com', '5536658273', 6, '2025-12-08', 'premium', 8);
INSERT INTO public.clientes VALUES (1128, 'Ana', 'Castillo Herrera', 'ana1128@hotmail.com', '5539927143', 6, '2022-11-14', 'regular', 8);
INSERT INTO public.clientes VALUES (1151, 'Sandra', 'Ramos Vargas', 'sandra1151@gmail.com', '5523027791', 6, '2025-12-18', 'regular', 8);
INSERT INTO public.clientes VALUES (1158, 'Carlos', 'Morales Moreno', 'carlos1158@gmail.com', '5555604049', 6, '2021-06-22', 'regular', 8);
INSERT INTO public.clientes VALUES (1193, 'Mónica', 'Jiménez Castro', 'mónica1193@gmail.com', '5545702898', 6, '2023-12-04', 'regular', 8);
INSERT INTO public.clientes VALUES (1198, 'Carlos', 'García Vargas', 'carlos1198@gmail.com', '5566562468', 6, '2024-05-18', 'regular', 8);
INSERT INTO public.clientes VALUES (1204, 'Luis', 'Reyes Rodríguez', 'luis1204@gmail.com', '5541542991', 6, '2022-03-19', 'regular', 8);
INSERT INTO public.clientes VALUES (1225, 'Alejandra', 'Rodríguez García', 'alejandra1225@gmail.com', '5515910104', 6, '2022-02-16', 'mayorista', 8);
INSERT INTO public.clientes VALUES (1290, 'Alberto', 'Gómez Aguilar', 'alberto1290@yahoo.com', '5529396573', 6, '2023-01-28', 'mayorista', 8);
INSERT INTO public.clientes VALUES (1312, 'Francisco', 'Gutiérrez Morales', 'francisco1312@hotmail.com', '5574351832', 6, '2024-06-20', 'regular', 8);
INSERT INTO public.clientes VALUES (1326, 'Ramón', 'Flores Torres', 'ramón1326@yahoo.com', '5574582036', 6, '2022-02-05', 'regular', 8);
INSERT INTO public.clientes VALUES (1334, 'Sandra', 'López Aguilar', 'sandra1334@gmail.com', '5528604725', 6, '2023-11-08', 'premium', 8);
INSERT INTO public.clientes VALUES (1340, 'Diego', 'Vargas Hernández', 'diego1340@yahoo.com', '5556316611', 6, '2026-03-03', 'regular', 8);
INSERT INTO public.clientes VALUES (1357, 'Sergio', 'Torres Gutiérrez', 'sergio1357@gmail.com', '5595768162', 6, '2026-01-06', 'nuevo', 8);
INSERT INTO public.clientes VALUES (1371, 'Sergio', 'Díaz García', 'sergio1371@yahoo.com', '5534800234', 6, '2021-07-27', 'regular', 8);
INSERT INTO public.clientes VALUES (1375, 'Pablo', 'Herrera Núñez', 'pablo1375@hotmail.com', '5566394418', 6, '2022-10-03', 'regular', 8);
INSERT INTO public.clientes VALUES (1418, 'Patricia', 'Sánchez Núñez', 'patricia1418@hotmail.com', '5582970220', 6, '2025-02-02', 'regular', 8);
INSERT INTO public.clientes VALUES (1420, 'Rosa', 'González Mendoza', 'rosa1420@gmail.com', '5595395947', 6, '2023-07-17', 'regular', 8);
INSERT INTO public.clientes VALUES (1493, 'Pablo', 'Núñez Reyes', 'pablo1493@gmail.com', '5545272295', 6, '2025-05-08', 'regular', 8);
INSERT INTO public.clientes VALUES (1501, 'Mónica', 'Ramos Mendoza', 'mónica1501@hotmail.com', '5535051514', 6, '2026-05-14', 'mayorista', 8);
INSERT INTO public.clientes VALUES (1572, 'Ana', 'Pérez García', 'ana1572@yahoo.com', '5562056495', 6, '2021-11-16', 'regular', 8);
INSERT INTO public.clientes VALUES (1594, 'Daniela', 'Díaz Castro', 'daniela1594@gmail.com', '5593605083', 6, '2024-05-13', 'regular', 8);
INSERT INTO public.clientes VALUES (1621, 'Liliana', 'Torres Núñez', 'liliana1621@gmail.com', '5514098443', 6, '2023-05-19', 'vip', 8);
INSERT INTO public.clientes VALUES (1661, 'Gabriela', 'Gómez González', 'gabriela1661@gmail.com', '5592312126', 6, '2024-04-03', 'regular', 8);
INSERT INTO public.clientes VALUES (1664, 'Fernanda', 'Morales Castillo', 'fernanda1664@hotmail.com', '5536291079', 6, '2025-06-22', 'regular', 8);
INSERT INTO public.clientes VALUES (1666, 'Isabel', 'Vega Rodríguez', 'isabel1666@gmail.com', '5567040947', 6, '2025-08-14', 'premium', 8);
INSERT INTO public.clientes VALUES (1721, 'Carlos', 'Jiménez Rodríguez', 'carlos1721@gmail.com', '5524657555', 6, '2024-09-04', 'regular', 8);
INSERT INTO public.clientes VALUES (1724, 'Isabel', 'Castro Castillo', 'isabel1724@gmail.com', '5597730855', 6, '2021-07-11', 'regular', 8);
INSERT INTO public.clientes VALUES (1745, 'Liliana', 'Moreno Rivera', 'liliana1745@gmail.com', '5540950556', 6, '2026-03-05', 'regular', 8);
INSERT INTO public.clientes VALUES (1750, 'Daniela', 'Moreno Ortega', 'daniela1750@yahoo.com', '5562066056', 6, '2026-04-04', 'regular', 8);
INSERT INTO public.clientes VALUES (1755, 'David', 'García Pérez', 'david1755@yahoo.com', '5511483668', 6, '2023-09-05', 'regular', 8);
INSERT INTO public.clientes VALUES (1762, 'Verónica', 'Cruz Flores', 'verónica1762@gmail.com', '5534973630', 6, '2025-06-26', 'regular', 8);
INSERT INTO public.clientes VALUES (1765, 'María', 'Castillo Jiménez', 'maría1765@hotmail.com', '5525372552', 6, '2021-12-14', 'regular', 8);
INSERT INTO public.clientes VALUES (1787, 'Ana', 'Gómez Sánchez', 'ana1787@gmail.com', '5530531509', 6, '2023-03-31', 'regular', 8);
INSERT INTO public.clientes VALUES (1838, 'Eduardo', 'Flores Ramírez', 'eduardo1838@gmail.com', '5533391451', 6, '2024-05-18', 'regular', 8);
INSERT INTO public.clientes VALUES (1888, 'Ramón', 'Mendoza Ramos', 'ramón1888@gmail.com', '5512199227', 6, '2023-11-24', 'premium', 8);
INSERT INTO public.clientes VALUES (1895, 'Patricia', 'Sánchez Morales', 'patricia1895@yahoo.com', '5586960904', 6, '2021-12-28', 'regular', 8);
INSERT INTO public.clientes VALUES (1915, 'José', 'Rodríguez Vega', 'josé1915@hotmail.com', '5533205676', 6, '2024-05-10', 'premium', 8);
INSERT INTO public.clientes VALUES (1923, 'Diego', 'Reyes Núñez', 'diego1923@gmail.com', '5525021199', 6, '2023-10-21', 'mayorista', 8);
INSERT INTO public.clientes VALUES (1945, 'Alejandra', 'Díaz Ortega', 'alejandra1945@gmail.com', '5550871016', 6, '2022-02-27', 'regular', 8);
INSERT INTO public.clientes VALUES (1969, 'Ana', 'García Ramos', 'ana1969@yahoo.com', '5534808116', 6, '2021-07-28', 'regular', 8);
INSERT INTO public.clientes VALUES (1978, 'Manuel', 'García Sánchez', 'manuel1978@hotmail.com', '5566543954', 6, '2021-07-18', 'premium', 8);
INSERT INTO public.clientes VALUES (10, 'Isabel', 'Pérez García', 'isabel10@gmail.com', '5510954835', 3, '2023-07-07', 'regular', 9);
INSERT INTO public.clientes VALUES (24, 'Luis', 'Mendoza Reyes', 'luis24@gmail.com', '5582196170', 3, '2025-01-15', 'premium', 9);
INSERT INTO public.clientes VALUES (46, 'Isabel', 'Castro Cruz', 'isabel46@gmail.com', '5558743159', 3, '2023-07-11', 'nuevo', 9);
INSERT INTO public.clientes VALUES (52, 'Verónica', 'Rodríguez Ortega', 'verónica52@gmail.com', '5594697764', 3, '2024-01-03', 'regular', 9);
INSERT INTO public.clientes VALUES (67, 'Alejandro', 'Ortega Martínez', 'alejandro67@yahoo.com', '5515636254', 3, '2022-01-19', 'premium', 9);
INSERT INTO public.clientes VALUES (82, 'Roberto', 'Gutiérrez Ramos', 'roberto82@gmail.com', '5524161873', 3, '2024-06-08', 'premium', 9);
INSERT INTO public.clientes VALUES (88, 'Isabel', 'Núñez Gutiérrez', 'isabel88@gmail.com', '5586593789', 3, '2025-07-30', 'regular', 9);
INSERT INTO public.clientes VALUES (91, 'Liliana', 'Aguilar Núñez', 'liliana91@hotmail.com', '5515015930', 3, '2024-04-21', 'regular', 9);
INSERT INTO public.clientes VALUES (97, 'Patricia', 'Herrera González', 'patricia97@yahoo.com', '5563058791', 3, '2025-05-06', 'regular', 9);
INSERT INTO public.clientes VALUES (98, 'Sandra', 'Sánchez Sánchez', 'sandra98@hotmail.com', '5553407575', 3, '2025-12-10', 'regular', 9);
INSERT INTO public.clientes VALUES (137, 'Adriana', 'Ortega Mendoza', 'adriana137@gmail.com', '5571114408', 3, '2024-06-04', 'vip', 9);
INSERT INTO public.clientes VALUES (156, 'Francisco', 'Herrera Moreno', 'francisco156@gmail.com', '5513017249', 3, '2022-03-11', 'regular', 9);
INSERT INTO public.clientes VALUES (165, 'Diego', 'Cruz Vega', 'diego165@hotmail.com', '5591126594', 3, '2025-09-24', 'regular', 9);
INSERT INTO public.clientes VALUES (175, 'Daniela', 'Martínez Vega', 'daniela175@yahoo.com', '5567943873', 3, '2024-03-26', 'premium', 9);
INSERT INTO public.clientes VALUES (180, 'Andrés', 'Gómez Rivera', 'andrés180@yahoo.com', '5510997236', 3, '2023-08-26', 'mayorista', 9);
INSERT INTO public.clientes VALUES (185, 'Carlos', 'Morales Cruz', 'carlos185@gmail.com', '5572979305', 3, '2022-05-01', 'regular', 9);
INSERT INTO public.clientes VALUES (186, 'Sergio', 'Torres Rodríguez', 'sergio186@hotmail.com', '5550811697', 3, '2024-12-25', 'regular', 9);
INSERT INTO public.clientes VALUES (196, 'Valeria', 'Ramírez Ramírez', 'valeria196@gmail.com', '5544271680', 3, '2024-04-01', 'regular', 9);
INSERT INTO public.clientes VALUES (201, 'Alberto', 'González Gómez', 'alberto201@gmail.com', '5596960449', 3, '2021-12-10', 'nuevo', 9);
INSERT INTO public.clientes VALUES (207, 'Fernanda', 'Ramírez González', 'fernanda207@gmail.com', '5562523472', 3, '2026-06-04', 'regular', 9);
INSERT INTO public.clientes VALUES (230, 'Laura', 'Castro Sánchez', 'laura230@gmail.com', '5589551741', 3, '2024-08-13', 'regular', 9);
INSERT INTO public.clientes VALUES (236, 'Laura', 'Díaz Vega', 'laura236@gmail.com', '5539050434', 3, '2023-10-16', 'mayorista', 9);
INSERT INTO public.clientes VALUES (270, 'Manuel', 'Morales Hernández', 'manuel270@gmail.com', '5550532800', 3, '2024-09-27', 'regular', 9);
INSERT INTO public.clientes VALUES (287, 'Eduardo', 'García López', 'eduardo287@hotmail.com', '5547228730', 3, '2024-06-29', 'regular', 9);
INSERT INTO public.clientes VALUES (288, 'Adriana', 'Sánchez Reyes', 'adriana288@gmail.com', '5523301739', 3, '2022-03-01', 'regular', 9);
INSERT INTO public.clientes VALUES (341, 'Gabriela', 'Pérez López', 'gabriela341@yahoo.com', '5560643036', 3, '2025-03-09', 'regular', 9);
INSERT INTO public.clientes VALUES (357, 'Carmen', 'Aguilar Rodríguez', 'carmen357@gmail.com', '5546613462', 3, '2021-06-13', 'premium', 9);
INSERT INTO public.clientes VALUES (407, 'Sergio', 'Ortega Ramos', 'sergio407@yahoo.com', '5541688446', 3, '2023-04-10', 'premium', 9);
INSERT INTO public.clientes VALUES (408, 'Verónica', 'Vega Jiménez', 'verónica408@yahoo.com', '5599512805', 3, '2022-09-03', 'regular', 9);
INSERT INTO public.clientes VALUES (421, 'Isabel', 'Vargas López', 'isabel421@gmail.com', '5513329148', 3, '2022-11-29', 'premium', 9);
INSERT INTO public.clientes VALUES (459, 'Sofía', 'Martínez García', 'sofía459@gmail.com', '5519065665', 3, '2022-01-07', 'mayorista', 9);
INSERT INTO public.clientes VALUES (473, 'Alberto', 'Díaz Vargas', 'alberto473@yahoo.com', '5592681879', 3, '2025-05-20', 'mayorista', 9);
INSERT INTO public.clientes VALUES (477, 'Claudia', 'Morales Ramírez', 'claudia477@gmail.com', '5595645083', 3, '2022-10-20', 'regular', 9);
INSERT INTO public.clientes VALUES (490, 'Ana', 'Núñez González', 'ana490@hotmail.com', '5554325475', 3, '2022-11-30', 'premium', 9);
INSERT INTO public.clientes VALUES (501, 'Alejandra', 'Cruz Gómez', 'alejandra501@gmail.com', '5534621479', 3, '2025-11-28', 'regular', 9);
INSERT INTO public.clientes VALUES (545, 'Sergio', 'López Gómez', 'sergio545@yahoo.com', '5513981790', 3, '2025-02-16', 'regular', 9);
INSERT INTO public.clientes VALUES (546, 'Sofía', 'García Hernández', 'sofía546@hotmail.com', '5599298044', 3, '2022-01-07', 'nuevo', 9);
INSERT INTO public.clientes VALUES (578, 'Liliana', 'Morales Ramírez', 'liliana578@gmail.com', '5522690720', 3, '2025-06-06', 'regular', 9);
INSERT INTO public.clientes VALUES (589, 'Isabel', 'Vargas Castillo', 'isabel589@gmail.com', '5559948088', 3, '2022-10-04', 'premium', 9);
INSERT INTO public.clientes VALUES (624, 'Manuel', 'Herrera Vega', 'manuel624@yahoo.com', '5558504268', 3, '2023-06-24', 'premium', 9);
INSERT INTO public.clientes VALUES (674, 'Sofía', 'Reyes Mendoza', 'sofía674@gmail.com', '5513178988', 3, '2021-12-24', 'regular', 9);
INSERT INTO public.clientes VALUES (678, 'Elena', 'Pérez Jiménez', 'elena678@gmail.com', '5530454970', 3, '2022-12-04', 'nuevo', 9);
INSERT INTO public.clientes VALUES (709, 'Pablo', 'Pérez Jiménez', 'pablo709@gmail.com', '5516923083', 3, '2024-01-15', 'regular', 9);
INSERT INTO public.clientes VALUES (729, 'Carlos', 'Flores Castillo', 'carlos729@yahoo.com', '5572461793', 3, '2021-12-26', 'regular', 9);
INSERT INTO public.clientes VALUES (840, 'Gabriela', 'Jiménez García', 'gabriela840@yahoo.com', '5530141148', 3, '2026-04-20', 'regular', 9);
INSERT INTO public.clientes VALUES (841, 'David', 'Reyes Castillo', 'david841@gmail.com', '5578207069', 3, '2022-06-13', 'regular', 9);
INSERT INTO public.clientes VALUES (849, 'David', 'Martínez López', 'david849@hotmail.com', '5529917719', 3, '2023-09-03', 'premium', 9);
INSERT INTO public.clientes VALUES (905, 'Fernando', 'Ramírez Rodríguez', 'fernando905@yahoo.com', '5580104308', 3, '2022-10-30', 'premium', 9);
INSERT INTO public.clientes VALUES (958, 'Daniela', 'Cruz Castillo', 'daniela958@gmail.com', '5580270865', 3, '2023-11-16', 'regular', 9);
INSERT INTO public.clientes VALUES (961, 'Laura', 'Aguilar Núñez', 'laura961@yahoo.com', '5535721973', 3, '2024-12-24', 'nuevo', 9);
INSERT INTO public.clientes VALUES (962, 'Verónica', 'Vega Mendoza', 'verónica962@hotmail.com', '5560229157', 3, '2023-10-17', 'regular', 9);
INSERT INTO public.clientes VALUES (979, 'Alejandra', 'García Flores', 'alejandra979@gmail.com', '5532341731', 3, '2022-12-08', 'regular', 9);
INSERT INTO public.clientes VALUES (1027, 'Claudia', 'Torres Ortega', 'claudia1027@yahoo.com', '5520140494', 3, '2025-12-05', 'nuevo', 9);
INSERT INTO public.clientes VALUES (1028, 'Verónica', 'Rodríguez Mendoza', 'verónica1028@gmail.com', '5521774955', 3, '2023-10-26', 'premium', 9);
INSERT INTO public.clientes VALUES (1032, 'Andrés', 'Vargas Moreno', 'andrés1032@hotmail.com', '5557599687', 3, '2025-08-03', 'regular', 9);
INSERT INTO public.clientes VALUES (1078, 'Sofía', 'Ortega Martínez', 'sofía1078@hotmail.com', '5558412445', 3, '2022-09-03', 'premium', 9);
INSERT INTO public.clientes VALUES (1093, 'Liliana', 'Pérez Díaz', 'liliana1093@hotmail.com', '5563635663', 3, '2021-06-18', 'vip', 9);
INSERT INTO public.clientes VALUES (1102, 'Liliana', 'Flores Vega', 'liliana1102@hotmail.com', '5558096857', 3, '2025-10-09', 'premium', 9);
INSERT INTO public.clientes VALUES (1115, 'Claudia', 'Pérez Mendoza', 'claudia1115@yahoo.com', '5574481336', 3, '2025-11-21', 'mayorista', 9);
INSERT INTO public.clientes VALUES (1125, 'Adriana', 'Moreno Ramírez', 'adriana1125@gmail.com', '5566752704', 3, '2022-06-18', 'mayorista', 9);
INSERT INTO public.clientes VALUES (1149, 'Fernando', 'Gómez Ortega', 'fernando1149@gmail.com', '5546684386', 3, '2022-02-17', 'regular', 9);
INSERT INTO public.clientes VALUES (1178, 'Eduardo', 'Castillo Moreno', 'eduardo1178@gmail.com', '5518842104', 3, '2024-12-21', 'premium', 9);
INSERT INTO public.clientes VALUES (1215, 'Ramón', 'Ramos Ramos', 'ramón1215@hotmail.com', '5538768553', 3, '2021-11-10', 'regular', 9);
INSERT INTO public.clientes VALUES (1247, 'Andrés', 'Pérez Jiménez', 'andrés1247@yahoo.com', '5527231429', 3, '2021-08-10', 'premium', 9);
INSERT INTO public.clientes VALUES (1253, 'Sofía', 'Martínez Rodríguez', 'sofía1253@hotmail.com', '5591229370', 3, '2026-04-24', 'regular', 9);
INSERT INTO public.clientes VALUES (1257, 'Verónica', 'Ramírez Morales', 'verónica1257@hotmail.com', '5534898755', 3, '2024-02-16', 'regular', 9);
INSERT INTO public.clientes VALUES (1262, 'Laura', 'Morales Reyes', 'laura1262@gmail.com', '5519742877', 3, '2025-07-09', 'regular', 9);
INSERT INTO public.clientes VALUES (1331, 'Juan', 'Torres Aguilar', 'juan1331@hotmail.com', '5557949350', 3, '2025-12-14', 'regular', 9);
INSERT INTO public.clientes VALUES (1339, 'Diego', 'Díaz Díaz', 'diego1339@hotmail.com', '5584104323', 3, '2024-09-30', 'vip', 9);
INSERT INTO public.clientes VALUES (1349, 'Claudia', 'Aguilar Castro', 'claudia1349@yahoo.com', '5591706445', 3, '2025-02-24', 'vip', 9);
INSERT INTO public.clientes VALUES (1353, 'Gabriela', 'Herrera Jiménez', 'gabriela1353@gmail.com', '5576657301', 3, '2025-03-31', 'regular', 9);
INSERT INTO public.clientes VALUES (1365, 'Eduardo', 'Pérez Castro', 'eduardo1365@yahoo.com', '5510499523', 3, '2024-06-14', 'regular', 9);
INSERT INTO public.clientes VALUES (1379, 'Francisco', 'Sánchez Díaz', 'francisco1379@hotmail.com', '5546683639', 3, '2021-12-27', 'premium', 9);
INSERT INTO public.clientes VALUES (1403, 'Ramón', 'Díaz Martínez', 'ramón1403@gmail.com', '5596304579', 3, '2021-06-15', 'regular', 9);
INSERT INTO public.clientes VALUES (1413, 'Francisco', 'Castillo Gutiérrez', 'francisco1413@gmail.com', '5581251601', 3, '2023-02-28', 'nuevo', 9);
INSERT INTO public.clientes VALUES (1423, 'David', 'Rodríguez Herrera', 'david1423@gmail.com', '5595501953', 3, '2025-12-27', 'regular', 9);
INSERT INTO public.clientes VALUES (1426, 'Gabriela', 'Ramírez Rodríguez', 'gabriela1426@hotmail.com', '5590577383', 3, '2023-06-02', 'regular', 9);
INSERT INTO public.clientes VALUES (1481, 'Patricia', 'Díaz Moreno', 'patricia1481@hotmail.com', '5561329407', 3, '2024-04-28', 'regular', 9);
INSERT INTO public.clientes VALUES (1532, 'Sergio', 'Vargas Jiménez', 'sergio1532@hotmail.com', '5578761110', 3, '2026-01-10', 'vip', 9);
INSERT INTO public.clientes VALUES (1533, 'Diego', 'Jiménez Morales', 'diego1533@yahoo.com', '5554777065', 3, '2025-02-13', 'regular', 9);
INSERT INTO public.clientes VALUES (1607, 'Liliana', 'García Herrera', 'liliana1607@yahoo.com', '5569986114', 3, '2023-09-21', 'premium', 9);
INSERT INTO public.clientes VALUES (1608, 'Alejandro', 'Hernández García', 'alejandro1608@gmail.com', '5545258217', 3, '2025-02-13', 'regular', 9);
INSERT INTO public.clientes VALUES (1615, 'Sandra', 'Moreno Ortega', 'sandra1615@gmail.com', '5588230673', 3, '2025-10-21', 'nuevo', 9);
INSERT INTO public.clientes VALUES (1619, 'Verónica', 'Mendoza López', 'verónica1619@hotmail.com', '5592572018', 3, '2023-07-27', 'regular', 9);
INSERT INTO public.clientes VALUES (1633, 'Manuel', 'Flores Martínez', 'manuel1633@yahoo.com', '5557723980', 3, '2022-03-08', 'regular', 9);
INSERT INTO public.clientes VALUES (1683, 'Isabel', 'Vega Gutiérrez', 'isabel1683@gmail.com', '5593496702', 3, '2023-03-13', 'regular', 9);
INSERT INTO public.clientes VALUES (1694, 'Valeria', 'Vargas Sánchez', 'valeria1694@gmail.com', '5521415537', 3, '2023-08-01', 'premium', 9);
INSERT INTO public.clientes VALUES (1751, 'Liliana', 'Ortega García', 'liliana1751@gmail.com', '5563389592', 3, '2024-01-16', 'vip', 9);
INSERT INTO public.clientes VALUES (1758, 'Luis', 'López García', 'luis1758@gmail.com', '5514288027', 3, '2026-03-22', 'premium', 9);
INSERT INTO public.clientes VALUES (1769, 'Manuel', 'Rivera Flores', 'manuel1769@gmail.com', '5520945862', 3, '2021-07-04', 'regular', 9);
INSERT INTO public.clientes VALUES (1776, 'Sandra', 'Ramos Martínez', 'sandra1776@hotmail.com', '5558305167', 3, '2023-01-25', 'premium', 9);
INSERT INTO public.clientes VALUES (1783, 'Laura', 'Morales Torres', 'laura1783@hotmail.com', '5531356906', 3, '2022-03-30', 'nuevo', 9);
INSERT INTO public.clientes VALUES (1789, 'Fernanda', 'Pérez Moreno', 'fernanda1789@hotmail.com', '5540161371', 3, '2024-02-09', 'regular', 9);
INSERT INTO public.clientes VALUES (1847, 'Daniela', 'Sánchez Aguilar', 'daniela1847@gmail.com', '5537917940', 3, '2022-07-12', 'premium', 9);
INSERT INTO public.clientes VALUES (1850, 'Carlos', 'Herrera Rivera', 'carlos1850@yahoo.com', '5547955201', 3, '2022-11-09', 'regular', 9);
INSERT INTO public.clientes VALUES (1871, 'Diego', 'García Gutiérrez', 'diego1871@gmail.com', '5520587268', 3, '2023-01-10', 'regular', 9);
INSERT INTO public.clientes VALUES (1911, 'Mario', 'Pérez Hernández', 'mario1911@yahoo.com', '5599233384', 3, '2024-03-10', 'regular', 9);
INSERT INTO public.clientes VALUES (1937, 'Miguel', 'Díaz Herrera', 'miguel1937@gmail.com', '5559691975', 3, '2025-07-04', 'regular', 9);
INSERT INTO public.clientes VALUES (1986, 'Mario', 'Ramírez Castro', 'mario1986@hotmail.com', '5587190704', 3, '2022-01-05', 'regular', 9);
INSERT INTO public.clientes VALUES (1998, 'Liliana', 'García Castro', 'liliana1998@gmail.com', '5592838528', 3, '2022-11-29', 'mayorista', 9);
INSERT INTO public.clientes VALUES (12, 'Manuel', 'Díaz Ortega', 'manuel12@yahoo.com', '5563345392', 1, '2024-02-16', 'regular', 10);
INSERT INTO public.clientes VALUES (38, 'Isabel', 'Mendoza Sánchez', 'isabel38@gmail.com', '5561121302', 1, '2025-08-17', 'mayorista', 10);
INSERT INTO public.clientes VALUES (42, 'Isabel', 'Rivera García', 'isabel42@yahoo.com', '5591279039', 1, '2023-03-18', 'regular', 10);
INSERT INTO public.clientes VALUES (70, 'Manuel', 'Mendoza Vargas', 'manuel70@gmail.com', '5568883853', 1, '2026-04-29', 'premium', 10);
INSERT INTO public.clientes VALUES (81, 'Fernando', 'Reyes Martínez', 'fernando81@yahoo.com', '5561718263', 1, '2025-05-12', 'regular', 10);
INSERT INTO public.clientes VALUES (100, 'Mónica', 'Jiménez González', 'mónica100@hotmail.com', '5541338443', 1, '2022-08-08', 'regular', 10);
INSERT INTO public.clientes VALUES (102, 'Gabriela', 'Cruz Morales', 'gabriela102@yahoo.com', '5582209870', 1, '2025-04-20', 'regular', 10);
INSERT INTO public.clientes VALUES (119, 'Eduardo', 'Rodríguez Vega', 'eduardo119@yahoo.com', '5531983035', 1, '2025-03-05', 'regular', 10);
INSERT INTO public.clientes VALUES (120, 'María', 'Núñez Ramírez', 'maría120@gmail.com', '5539870720', 1, '2022-03-13', 'regular', 10);
INSERT INTO public.clientes VALUES (143, 'Gabriela', 'Pérez García', 'gabriela143@yahoo.com', '5525827722', 1, '2021-12-17', 'premium', 10);
INSERT INTO public.clientes VALUES (144, 'Miguel', 'Flores Rivera', 'miguel144@gmail.com', '5595564277', 1, '2026-05-19', 'premium', 10);
INSERT INTO public.clientes VALUES (152, 'Sergio', 'Pérez Reyes', 'sergio152@yahoo.com', '5515019076', 1, '2025-12-04', 'regular', 10);
INSERT INTO public.clientes VALUES (154, 'Luis', 'Aguilar Reyes', 'luis154@gmail.com', '5527812995', 1, '2022-05-20', 'regular', 10);
INSERT INTO public.clientes VALUES (172, 'Manuel', 'Torres Gómez', 'manuel172@gmail.com', '5570016768', 1, '2025-04-16', 'premium', 10);
INSERT INTO public.clientes VALUES (199, 'Andrés', 'Rivera Sánchez', 'andrés199@gmail.com', '5543808923', 1, '2026-04-03', 'regular', 10);
INSERT INTO public.clientes VALUES (212, 'Eduardo', 'Morales López', 'eduardo212@gmail.com', '5568785183', 1, '2025-08-29', 'regular', 10);
INSERT INTO public.clientes VALUES (232, 'Laura', 'Morales Ortega', 'laura232@hotmail.com', '5529453688', 1, '2023-01-10', 'regular', 10);
INSERT INTO public.clientes VALUES (233, 'Juan', 'Cruz Ramos', 'juan233@yahoo.com', '5546197787', 1, '2024-07-24', 'regular', 10);
INSERT INTO public.clientes VALUES (245, 'Roberto', 'Vargas Gutiérrez', 'roberto245@gmail.com', '5585263692', 1, '2025-09-01', 'nuevo', 10);
INSERT INTO public.clientes VALUES (246, 'Luis', 'Vargas Morales', 'luis246@gmail.com', '5587862305', 1, '2022-03-22', 'premium', 10);
INSERT INTO public.clientes VALUES (249, 'Mónica', 'Jiménez Rivera', 'mónica249@gmail.com', '5518808386', 1, '2021-06-27', 'regular', 10);
INSERT INTO public.clientes VALUES (373, 'Mónica', 'Jiménez Mendoza', 'mónica373@hotmail.com', '5535124449', 1, '2025-05-28', 'regular', 10);
INSERT INTO public.clientes VALUES (378, 'Ricardo', 'Díaz Aguilar', 'ricardo378@gmail.com', '5582287324', 1, '2025-12-17', 'regular', 10);
INSERT INTO public.clientes VALUES (410, 'Alejandra', 'López López', 'alejandra410@hotmail.com', '5573921605', 1, '2023-12-11', 'regular', 10);
INSERT INTO public.clientes VALUES (422, 'Verónica', 'Vargas Martínez', 'verónica422@gmail.com', '5521428912', 1, '2022-12-22', 'regular', 10);
INSERT INTO public.clientes VALUES (432, 'Gabriela', 'Ortega Díaz', 'gabriela432@hotmail.com', '5577166896', 1, '2022-01-20', 'nuevo', 10);
INSERT INTO public.clientes VALUES (444, 'Diego', 'Rivera Hernández', 'diego444@hotmail.com', '5591339562', 1, '2026-05-28', 'regular', 10);
INSERT INTO public.clientes VALUES (468, 'Ramón', 'Núñez Herrera', 'ramón468@hotmail.com', '5536725819', 1, '2024-11-07', 'regular', 10);
INSERT INTO public.clientes VALUES (469, 'Carmen', 'Flores Vega', 'carmen469@gmail.com', '5533963425', 1, '2026-04-28', 'regular', 10);
INSERT INTO public.clientes VALUES (472, 'Sofía', 'González Castro', 'sofía472@gmail.com', '5535453201', 1, '2023-06-17', 'regular', 10);
INSERT INTO public.clientes VALUES (483, 'Valeria', 'Pérez Moreno', 'valeria483@yahoo.com', '5546838009', 1, '2022-06-27', 'premium', 10);
INSERT INTO public.clientes VALUES (487, 'José', 'Flores Vega', 'josé487@hotmail.com', '5566061116', 1, '2023-12-26', 'regular', 10);
INSERT INTO public.clientes VALUES (509, 'Patricia', 'Cruz Rivera', 'patricia509@hotmail.com', '5581443936', 1, '2023-12-19', 'premium', 10);
INSERT INTO public.clientes VALUES (525, 'Carmen', 'Cruz Vargas', 'carmen525@hotmail.com', '5519393216', 1, '2026-02-25', 'premium', 10);
INSERT INTO public.clientes VALUES (543, 'Roberto', 'Reyes Martínez', 'roberto543@hotmail.com', '5534915916', 1, '2026-02-11', 'premium', 10);
INSERT INTO public.clientes VALUES (562, 'Fernanda', 'Ortega Ramos', 'fernanda562@yahoo.com', '5581887423', 1, '2021-09-11', 'regular', 10);
INSERT INTO public.clientes VALUES (566, 'Sofía', 'Ramírez Vega', 'sofía566@gmail.com', '5574194023', 1, '2023-09-02', 'regular', 10);
INSERT INTO public.clientes VALUES (571, 'Roberto', 'Ortega González', 'roberto571@yahoo.com', '5529437798', 1, '2025-03-22', 'mayorista', 10);
INSERT INTO public.clientes VALUES (582, 'Manuel', 'Cruz Mendoza', 'manuel582@yahoo.com', '5587186069', 1, '2022-10-14', 'regular', 10);
INSERT INTO public.clientes VALUES (618, 'Luis', 'Castillo Ramos', 'luis618@gmail.com', '5534318675', 1, '2021-08-26', 'regular', 10);
INSERT INTO public.clientes VALUES (622, 'Miguel', 'Rodríguez Hernández', 'miguel622@hotmail.com', '5553169737', 1, '2024-11-04', 'regular', 10);
INSERT INTO public.clientes VALUES (670, 'Fernando', 'Jiménez García', 'fernando670@gmail.com', '5551489399', 1, '2023-05-09', 'regular', 10);
INSERT INTO public.clientes VALUES (721, 'Sandra', 'Reyes Herrera', 'sandra721@hotmail.com', '5525406645', 1, '2026-04-12', 'regular', 10);
INSERT INTO public.clientes VALUES (730, 'José', 'Gómez Torres', 'josé730@gmail.com', '5580767956', 1, '2025-11-13', 'regular', 10);
INSERT INTO public.clientes VALUES (747, 'Andrés', 'Vega Jiménez', 'andrés747@gmail.com', '5563714593', 1, '2026-01-22', 'regular', 10);
INSERT INTO public.clientes VALUES (751, 'Eduardo', 'Martínez Hernández', 'eduardo751@gmail.com', '5566718851', 1, '2024-10-17', 'regular', 10);
INSERT INTO public.clientes VALUES (799, 'Alejandro', 'Morales Cruz', 'alejandro799@gmail.com', '5540265633', 1, '2022-04-14', 'regular', 10);
INSERT INTO public.clientes VALUES (800, 'Rosa', 'López Ortega', 'rosa800@hotmail.com', '5522912566', 1, '2026-04-04', 'mayorista', 10);
INSERT INTO public.clientes VALUES (808, 'Mario', 'Ramírez Pérez', 'mario808@hotmail.com', '5528695003', 1, '2023-05-18', 'mayorista', 10);
INSERT INTO public.clientes VALUES (869, 'Claudia', 'Torres González', 'claudia869@hotmail.com', '5579297448', 1, '2026-06-05', 'regular', 10);
INSERT INTO public.clientes VALUES (886, 'Patricia', 'Martínez Ramos', 'patricia886@gmail.com', '5562495761', 1, '2021-10-13', 'premium', 10);
INSERT INTO public.clientes VALUES (904, 'Pablo', 'Núñez Ramírez', 'pablo904@gmail.com', '5596114007', 1, '2026-01-04', 'regular', 10);
INSERT INTO public.clientes VALUES (913, 'Rosa', 'Gómez Rivera', 'rosa913@hotmail.com', '5511432428', 1, '2023-12-19', 'regular', 10);
INSERT INTO public.clientes VALUES (927, 'Juan', 'Ortega Flores', 'juan927@hotmail.com', '5546614518', 1, '2025-06-14', 'nuevo', 10);
INSERT INTO public.clientes VALUES (930, 'Daniela', 'Vargas Mendoza', 'daniela930@gmail.com', '5548747182', 1, '2024-07-11', 'premium', 10);
INSERT INTO public.clientes VALUES (931, 'Isabel', 'López Reyes', 'isabel931@gmail.com', '5544656876', 1, '2023-10-28', 'regular', 10);
INSERT INTO public.clientes VALUES (938, 'Gabriela', 'Castro Jiménez', 'gabriela938@gmail.com', '5580341559', 1, '2023-04-05', 'premium', 10);
INSERT INTO public.clientes VALUES (993, 'Alberto', 'Torres Vega', 'alberto993@hotmail.com', '5513758727', 1, '2023-03-05', 'regular', 10);
INSERT INTO public.clientes VALUES (1038, 'Diego', 'Ramos Jiménez', 'diego1038@hotmail.com', '5565717519', 1, '2025-04-07', 'nuevo', 10);
INSERT INTO public.clientes VALUES (1050, 'Sofía', 'Morales Morales', 'sofía1050@gmail.com', '5586670472', 1, '2025-09-27', 'regular', 10);
INSERT INTO public.clientes VALUES (1106, 'Mario', 'Castro Ramírez', 'mario1106@yahoo.com', '5563878721', 1, '2025-03-04', 'regular', 10);
INSERT INTO public.clientes VALUES (1109, 'Ramón', 'Ortega Rivera', 'ramón1109@gmail.com', '5533138191', 1, '2022-11-16', 'premium', 10);
INSERT INTO public.clientes VALUES (1145, 'Pablo', 'González Ramos', 'pablo1145@gmail.com', '5543018516', 1, '2022-06-13', 'regular', 10);
INSERT INTO public.clientes VALUES (1152, 'Ana', 'Flores Vega', 'ana1152@hotmail.com', '5557874974', 1, '2022-04-11', 'regular', 10);
INSERT INTO public.clientes VALUES (1159, 'Alberto', 'Torres Moreno', 'alberto1159@yahoo.com', '5599778757', 1, '2022-11-21', 'regular', 10);
INSERT INTO public.clientes VALUES (1190, 'Isabel', 'Gutiérrez Flores', 'isabel1190@gmail.com', '5554434217', 1, '2025-09-24', 'nuevo', 10);
INSERT INTO public.clientes VALUES (1206, 'Pablo', 'Castillo González', 'pablo1206@gmail.com', '5522008959', 1, '2023-12-06', 'regular', 10);
INSERT INTO public.clientes VALUES (1216, 'Ricardo', 'Ortega Castro', 'ricardo1216@gmail.com', '5543867505', 1, '2023-07-31', 'regular', 10);
INSERT INTO public.clientes VALUES (1237, 'Luis', 'Sánchez Vargas', 'luis1237@gmail.com', '5530897858', 1, '2022-06-06', 'regular', 10);
INSERT INTO public.clientes VALUES (1256, 'Patricia', 'Martínez García', 'patricia1256@hotmail.com', '5599206598', 1, '2023-12-11', 'premium', 10);
INSERT INTO public.clientes VALUES (1378, 'Ramón', 'Castillo Vega', 'ramón1378@hotmail.com', '5573124701', 1, '2022-05-11', 'premium', 10);
INSERT INTO public.clientes VALUES (1281, 'Manuel', 'Ramírez González', 'manuel1281@gmail.com', '5566809516', 1, '2026-03-22', 'mayorista', 10);
INSERT INTO public.clientes VALUES (1284, 'Ricardo', 'Rodríguez Mendoza', 'ricardo1284@gmail.com', '5561441896', 1, '2023-05-29', 'premium', 10);
INSERT INTO public.clientes VALUES (1344, 'Juan', 'Sánchez Reyes', 'juan1344@gmail.com', '5547294047', 1, '2022-05-27', 'regular', 10);
INSERT INTO public.clientes VALUES (1363, 'Mario', 'Martínez Mendoza', 'mario1363@gmail.com', '5564017185', 1, '2025-07-03', 'regular', 10);
INSERT INTO public.clientes VALUES (1391, 'Andrés', 'Rivera Torres', 'andrés1391@gmail.com', '5570309806', 1, '2022-08-02', 'mayorista', 10);
INSERT INTO public.clientes VALUES (1402, 'Sofía', 'Moreno Gutiérrez', 'sofía1402@yahoo.com', '5538794231', 1, '2024-05-13', 'regular', 10);
INSERT INTO public.clientes VALUES (1414, 'Carmen', 'Aguilar Jiménez', 'carmen1414@gmail.com', '5586140861', 1, '2023-12-05', 'regular', 10);
INSERT INTO public.clientes VALUES (1415, 'Mónica', 'Ramírez Flores', 'mónica1415@yahoo.com', '5512688078', 1, '2024-03-02', 'regular', 10);
INSERT INTO public.clientes VALUES (1435, 'Carmen', 'Gutiérrez Morales', 'carmen1435@hotmail.com', '5579211163', 1, '2024-04-28', 'premium', 10);
INSERT INTO public.clientes VALUES (1441, 'Daniela', 'Flores Gutiérrez', 'daniela1441@gmail.com', '5549437611', 1, '2021-08-04', 'vip', 10);
INSERT INTO public.clientes VALUES (1457, 'Alejandra', 'Pérez Rodríguez', 'alejandra1457@gmail.com', '5531163196', 1, '2023-01-16', 'premium', 10);
INSERT INTO public.clientes VALUES (1466, 'Sergio', 'Castro Gutiérrez', 'sergio1466@hotmail.com', '5570053039', 1, '2024-07-10', 'regular', 10);
INSERT INTO public.clientes VALUES (1482, 'Rosa', 'García Gutiérrez', 'rosa1482@yahoo.com', '5529557879', 1, '2021-12-01', 'regular', 10);
INSERT INTO public.clientes VALUES (1526, 'Liliana', 'Vega Ramírez', 'liliana1526@gmail.com', '5539822796', 1, '2023-05-20', 'nuevo', 10);
INSERT INTO public.clientes VALUES (1558, 'Mónica', 'Martínez Vargas', 'mónica1558@yahoo.com', '5538866008', 1, '2023-12-17', 'premium', 10);
INSERT INTO public.clientes VALUES (1562, 'Ricardo', 'Mendoza Ortega', 'ricardo1562@gmail.com', '5582499525', 1, '2024-08-25', 'regular', 10);
INSERT INTO public.clientes VALUES (1573, 'Valeria', 'Martínez Cruz', 'valeria1573@hotmail.com', '5531878126', 1, '2021-07-22', 'premium', 10);
INSERT INTO public.clientes VALUES (1575, 'Diego', 'Ramírez Vargas', 'diego1575@gmail.com', '5578636393', 1, '2026-02-15', 'premium', 10);
INSERT INTO public.clientes VALUES (1576, 'Carlos', 'Ortega Díaz', 'carlos1576@gmail.com', '5521092802', 1, '2022-08-05', 'regular', 10);
INSERT INTO public.clientes VALUES (1588, 'David', 'Gutiérrez Rivera', 'david1588@hotmail.com', '5527493080', 1, '2021-09-12', 'regular', 10);
INSERT INTO public.clientes VALUES (1603, 'Mónica', 'Díaz Castillo', 'mónica1603@yahoo.com', '5513984125', 1, '2025-10-08', 'regular', 10);
INSERT INTO public.clientes VALUES (1624, 'Alejandra', 'Morales Flores', 'alejandra1624@yahoo.com', '5534136369', 1, '2024-04-24', 'regular', 10);
INSERT INTO public.clientes VALUES (1638, 'Carmen', 'Aguilar Vega', 'carmen1638@yahoo.com', '5541225607', 1, '2023-10-12', 'premium', 10);
INSERT INTO public.clientes VALUES (1656, 'Andrés', 'Mendoza Torres', 'andrés1656@gmail.com', '5539626238', 1, '2022-01-23', 'regular', 10);
INSERT INTO public.clientes VALUES (1732, 'Isabel', 'Castro Torres', 'isabel1732@gmail.com', '5577562496', 1, '2023-05-18', 'regular', 10);
INSERT INTO public.clientes VALUES (1735, 'Daniela', 'López Rivera', 'daniela1735@gmail.com', '5531401790', 1, '2023-04-12', 'regular', 10);
INSERT INTO public.clientes VALUES (1746, 'Alberto', 'Pérez Torres', 'alberto1746@gmail.com', '5511638103', 1, '2022-07-29', 'mayorista', 10);
INSERT INTO public.clientes VALUES (1753, 'Elena', 'Morales Reyes', 'elena1753@hotmail.com', '5539233152', 1, '2023-04-01', 'mayorista', 10);
INSERT INTO public.clientes VALUES (1771, 'David', 'Núñez Sánchez', 'david1771@hotmail.com', '5591050580', 1, '2026-01-25', 'regular', 10);
INSERT INTO public.clientes VALUES (1775, 'Alejandro', 'López Ramírez', 'alejandro1775@hotmail.com', '5597890289', 1, '2022-05-06', 'regular', 10);
INSERT INTO public.clientes VALUES (1807, 'Carmen', 'Díaz Aguilar', 'carmen1807@hotmail.com', '5551466066', 1, '2022-06-01', 'mayorista', 10);
INSERT INTO public.clientes VALUES (1854, 'Ricardo', 'Rivera Flores', 'ricardo1854@gmail.com', '5573117198', 1, '2026-03-26', 'regular', 10);
INSERT INTO public.clientes VALUES (1873, 'Manuel', 'Gutiérrez Rivera', 'manuel1873@yahoo.com', '5534637969', 1, '2021-10-18', 'regular', 10);
INSERT INTO public.clientes VALUES (1881, 'David', 'Ramos Vega', 'david1881@gmail.com', '5531405453', 1, '2025-04-26', 'regular', 10);
INSERT INTO public.clientes VALUES (1977, 'Liliana', 'Cruz Pérez', 'liliana1977@hotmail.com', '5590937930', 1, '2026-03-28', 'regular', 10);
INSERT INTO public.clientes VALUES (1982, 'Luis', 'Cruz Castillo', 'luis1982@yahoo.com', '5598703668', 1, '2024-08-10', 'premium', 10);
INSERT INTO public.clientes VALUES (15, 'Fernando', 'Reyes Gómez', 'fernando15@gmail.com', '5583897088', 1, '2022-07-15', 'premium', 11);
INSERT INTO public.clientes VALUES (55, 'Diego', 'Herrera Morales', 'diego55@hotmail.com', '5549315407', 1, '2025-02-23', 'premium', 11);
INSERT INTO public.clientes VALUES (57, 'Fernanda', 'Sánchez Ramírez', 'fernanda57@hotmail.com', '5579338228', 1, '2021-12-01', 'premium', 11);
INSERT INTO public.clientes VALUES (68, 'Patricia', 'Rivera Herrera', 'patricia68@yahoo.com', '5522267708', 1, '2024-07-18', 'vip', 11);
INSERT INTO public.clientes VALUES (74, 'Roberto', 'Castro García', 'roberto74@gmail.com', '5558865345', 1, '2025-02-07', 'regular', 11);
INSERT INTO public.clientes VALUES (122, 'Pablo', 'Ramos Flores', 'pablo122@hotmail.com', '5586763742', 1, '2023-06-09', 'regular', 11);
INSERT INTO public.clientes VALUES (125, 'Sergio', 'Herrera Aguilar', 'sergio125@yahoo.com', '5549516346', 1, '2026-02-20', 'premium', 11);
INSERT INTO public.clientes VALUES (129, 'Eduardo', 'López Reyes', 'eduardo129@gmail.com', '5578674708', 1, '2025-07-19', 'regular', 11);
INSERT INTO public.clientes VALUES (134, 'Alberto', 'García Sánchez', 'alberto134@gmail.com', '5547327686', 1, '2022-12-02', 'regular', 11);
INSERT INTO public.clientes VALUES (150, 'Pablo', 'Vargas Gutiérrez', 'pablo150@gmail.com', '5586635858', 1, '2024-04-05', 'regular', 11);
INSERT INTO public.clientes VALUES (160, 'Miguel', 'Martínez Gómez', 'miguel160@yahoo.com', '5534022690', 1, '2023-02-14', 'premium', 11);
INSERT INTO public.clientes VALUES (163, 'Mónica', 'Morales Sánchez', 'mónica163@gmail.com', '5529289997', 1, '2024-12-30', 'vip', 11);
INSERT INTO public.clientes VALUES (179, 'Andrés', 'Castro Mendoza', 'andrés179@gmail.com', '5567137046', 1, '2025-06-08', 'regular', 11);
INSERT INTO public.clientes VALUES (187, 'Roberto', 'Ortega Hernández', 'roberto187@gmail.com', '5549158452', 1, '2026-04-17', 'regular', 11);
INSERT INTO public.clientes VALUES (204, 'Isabel', 'Aguilar Ramírez', 'isabel204@yahoo.com', '5536933352', 1, '2024-03-29', 'regular', 11);
INSERT INTO public.clientes VALUES (228, 'Ana', 'Vargas Rivera', 'ana228@yahoo.com', '5554868265', 1, '2021-12-06', 'mayorista', 11);
INSERT INTO public.clientes VALUES (243, 'Alberto', 'Gutiérrez Ortega', 'alberto243@gmail.com', '5520866138', 1, '2021-07-04', 'regular', 11);
INSERT INTO public.clientes VALUES (286, 'José', 'Torres Moreno', 'josé286@yahoo.com', '5526615289', 1, '2025-04-17', 'regular', 11);
INSERT INTO public.clientes VALUES (327, 'Sandra', 'Ramírez Morales', 'sandra327@gmail.com', '5541954134', 1, '2025-10-04', 'premium', 11);
INSERT INTO public.clientes VALUES (345, 'Alejandro', 'Torres Ramos', 'alejandro345@yahoo.com', '5537730181', 1, '2025-03-27', 'nuevo', 11);
INSERT INTO public.clientes VALUES (348, 'Pablo', 'Moreno Pérez', 'pablo348@gmail.com', '5566813149', 1, '2025-01-03', 'regular', 11);
INSERT INTO public.clientes VALUES (349, 'Ana', 'Flores Núñez', 'ana349@hotmail.com', '5591386202', 1, '2022-06-19', 'premium', 11);
INSERT INTO public.clientes VALUES (391, 'Verónica', 'Ramírez Castro', 'verónica391@hotmail.com', '5579174131', 1, '2022-09-09', 'regular', 11);
INSERT INTO public.clientes VALUES (414, 'Roberto', 'Gutiérrez Rivera', 'roberto414@gmail.com', '5525940510', 1, '2021-08-31', 'regular', 11);
INSERT INTO public.clientes VALUES (418, 'Andrés', 'Castro Flores', 'andrés418@gmail.com', '5573783961', 1, '2025-09-13', 'premium', 11);
INSERT INTO public.clientes VALUES (457, 'Luis', 'Jiménez Herrera', 'luis457@hotmail.com', '5598546660', 1, '2026-05-21', 'regular', 11);
INSERT INTO public.clientes VALUES (464, 'Rosa', 'Mendoza López', 'rosa464@hotmail.com', '5572733686', 1, '2022-07-24', 'regular', 11);
INSERT INTO public.clientes VALUES (471, 'Ricardo', 'Rivera Mendoza', 'ricardo471@yahoo.com', '5580722909', 1, '2021-07-02', 'regular', 11);
INSERT INTO public.clientes VALUES (515, 'María', 'Gómez Pérez', 'maría515@yahoo.com', '5547373949', 1, '2024-05-17', 'regular', 11);
INSERT INTO public.clientes VALUES (544, 'Rosa', 'Ramírez Castro', 'rosa544@gmail.com', '5569153839', 1, '2025-10-31', 'mayorista', 11);
INSERT INTO public.clientes VALUES (585, 'David', 'Reyes Núñez', 'david585@gmail.com', '5557260360', 1, '2023-06-05', 'regular', 11);
INSERT INTO public.clientes VALUES (625, 'Alejandro', 'Pérez Ortega', 'alejandro625@hotmail.com', '5527513454', 1, '2025-10-08', 'regular', 11);
INSERT INTO public.clientes VALUES (626, 'Rosa', 'Pérez Castillo', 'rosa626@yahoo.com', '5583360594', 1, '2024-07-09', 'regular', 11);
INSERT INTO public.clientes VALUES (643, 'Sofía', 'Ramos Reyes', 'sofía643@hotmail.com', '5511582229', 1, '2025-11-19', 'regular', 11);
INSERT INTO public.clientes VALUES (676, 'Juan', 'Herrera Castillo', 'juan676@hotmail.com', '5579296719', 1, '2022-10-16', 'regular', 11);
INSERT INTO public.clientes VALUES (766, 'Gabriela', 'Pérez Hernández', 'gabriela766@gmail.com', '5556073515', 1, '2025-10-03', 'regular', 11);
INSERT INTO public.clientes VALUES (785, 'Verónica', 'Ramírez Aguilar', 'verónica785@gmail.com', '5568939010', 1, '2025-10-02', 'regular', 11);
INSERT INTO public.clientes VALUES (789, 'María', 'Ortega Torres', 'maría789@hotmail.com', '5598206742', 1, '2023-12-14', 'regular', 11);
INSERT INTO public.clientes VALUES (833, 'Manuel', 'Pérez Díaz', 'manuel833@hotmail.com', '5547103909', 1, '2023-05-09', 'regular', 11);
INSERT INTO public.clientes VALUES (860, 'Alejandro', 'Morales Cruz', 'alejandro860@yahoo.com', '5544819972', 1, '2022-03-21', 'regular', 11);
INSERT INTO public.clientes VALUES (870, 'Alberto', 'Pérez Castillo', 'alberto870@yahoo.com', '5545309169', 1, '2024-04-24', 'premium', 11);
INSERT INTO public.clientes VALUES (879, 'Verónica', 'Pérez Herrera', 'verónica879@gmail.com', '5592316265', 1, '2024-08-05', 'regular', 11);
INSERT INTO public.clientes VALUES (899, 'Liliana', 'Vargas Rodríguez', 'liliana899@hotmail.com', '5537442403', 1, '2022-06-09', 'regular', 11);
INSERT INTO public.clientes VALUES (966, 'Alberto', 'Aguilar Cruz', 'alberto966@gmail.com', '5595197744', 1, '2024-08-07', 'regular', 11);
INSERT INTO public.clientes VALUES (978, 'Alejandra', 'Pérez Vargas', 'alejandra978@yahoo.com', '5591833362', 1, '2023-08-16', 'nuevo', 11);
INSERT INTO public.clientes VALUES (997, 'José', 'Flores Sánchez', 'josé997@yahoo.com', '5547354880', 1, '2022-01-30', 'premium', 11);
INSERT INTO public.clientes VALUES (1013, 'Carmen', 'Jiménez Moreno', 'carmen1013@hotmail.com', '5573589030', 1, '2022-01-08', 'regular', 11);
INSERT INTO public.clientes VALUES (1056, 'Liliana', 'Gómez Cruz', 'liliana1056@gmail.com', '5570826614', 1, '2024-12-20', 'regular', 11);
INSERT INTO public.clientes VALUES (1063, 'Ricardo', 'Castillo Reyes', 'ricardo1063@yahoo.com', '5532231222', 1, '2025-03-05', 'mayorista', 11);
INSERT INTO public.clientes VALUES (1077, 'Francisco', 'Vega Núñez', 'francisco1077@gmail.com', '5515650731', 1, '2025-11-03', 'regular', 11);
INSERT INTO public.clientes VALUES (1110, 'Fernando', 'Rivera Martínez', 'fernando1110@gmail.com', '5530759612', 1, '2024-05-06', 'regular', 11);
INSERT INTO public.clientes VALUES (1140, 'Diego', 'Núñez Ortega', 'diego1140@gmail.com', '5547912273', 1, '2024-04-10', 'regular', 11);
INSERT INTO public.clientes VALUES (1147, 'Diego', 'Martínez Gutiérrez', 'diego1147@gmail.com', '5550308304', 1, '2024-02-18', 'regular', 11);
INSERT INTO public.clientes VALUES (1246, 'Sofía', 'Cruz Gómez', 'sofía1246@gmail.com', '5542397292', 1, '2023-10-24', 'regular', 11);
INSERT INTO public.clientes VALUES (1266, 'Elena', 'Jiménez Reyes', 'elena1266@hotmail.com', '5568081584', 1, '2026-04-09', 'regular', 11);
INSERT INTO public.clientes VALUES (1269, 'Liliana', 'Castillo Gutiérrez', 'liliana1269@gmail.com', '5591229215', 1, '2022-09-27', 'premium', 11);
INSERT INTO public.clientes VALUES (1270, 'David', 'López Castillo', 'david1270@yahoo.com', '5579390240', 1, '2022-11-26', 'regular', 11);
INSERT INTO public.clientes VALUES (1288, 'Alejandra', 'Castillo Cruz', 'alejandra1288@hotmail.com', '5561603430', 1, '2022-03-27', 'regular', 11);
INSERT INTO public.clientes VALUES (1299, 'Carmen', 'Sánchez García', 'carmen1299@gmail.com', '5536224131', 1, '2022-06-13', 'regular', 11);
INSERT INTO public.clientes VALUES (1305, 'Francisco', 'Cruz Vargas', 'francisco1305@gmail.com', '5557504416', 1, '2023-03-17', 'premium', 11);
INSERT INTO public.clientes VALUES (1398, 'Isabel', 'Castillo Mendoza', 'isabel1398@yahoo.com', '5563949308', 1, '2023-04-11', 'regular', 11);
INSERT INTO public.clientes VALUES (1444, 'Isabel', 'Flores Ramos', 'isabel1444@gmail.com', '5572502873', 1, '2021-10-12', 'premium', 11);
INSERT INTO public.clientes VALUES (1454, 'Adriana', 'Martínez Ramos', 'adriana1454@gmail.com', '5510412599', 1, '2022-08-19', 'regular', 11);
INSERT INTO public.clientes VALUES (1470, 'Alejandro', 'Ortega Mendoza', 'alejandro1470@hotmail.com', '5586878220', 1, '2022-12-08', 'regular', 11);
INSERT INTO public.clientes VALUES (1471, 'Fernanda', 'Vega Herrera', 'fernanda1471@gmail.com', '5584181946', 1, '2022-03-09', 'premium', 11);
INSERT INTO public.clientes VALUES (1492, 'Pablo', 'Núñez Hernández', 'pablo1492@gmail.com', '5585889571', 1, '2026-01-26', 'premium', 11);
INSERT INTO public.clientes VALUES (1503, 'Alejandra', 'Rodríguez Ortega', 'alejandra1503@gmail.com', '5575941954', 1, '2023-12-28', 'regular', 11);
INSERT INTO public.clientes VALUES (1511, 'Ramón', 'González Flores', 'ramón1511@gmail.com', '5571300688', 1, '2026-03-23', 'regular', 11);
INSERT INTO public.clientes VALUES (1536, 'Elena', 'Mendoza Díaz', 'elena1536@yahoo.com', '5512155101', 1, '2024-12-14', 'nuevo', 11);
INSERT INTO public.clientes VALUES (1548, 'Gabriela', 'Torres Torres', 'gabriela1548@gmail.com', '5580436375', 1, '2024-04-18', 'regular', 11);
INSERT INTO public.clientes VALUES (1584, 'Liliana', 'Moreno Flores', 'liliana1584@gmail.com', '5530149849', 1, '2024-11-01', 'regular', 11);
INSERT INTO public.clientes VALUES (1611, 'Alberto', 'Aguilar Morales', 'alberto1611@gmail.com', '5563016030', 1, '2023-06-24', 'nuevo', 11);
INSERT INTO public.clientes VALUES (1631, 'Alberto', 'Núñez Díaz', 'alberto1631@gmail.com', '5547988983', 1, '2024-05-02', 'regular', 11);
INSERT INTO public.clientes VALUES (1672, 'Andrés', 'Torres Herrera', 'andrés1672@gmail.com', '5575934922', 1, '2022-05-01', 'mayorista', 11);
INSERT INTO public.clientes VALUES (1675, 'Diego', 'Rivera Castillo', 'diego1675@hotmail.com', '5519029034', 1, '2022-01-18', 'regular', 11);
INSERT INTO public.clientes VALUES (1703, 'Juan', 'Gómez Gutiérrez', 'juan1703@gmail.com', '5585779559', 1, '2024-03-04', 'regular', 11);
INSERT INTO public.clientes VALUES (1705, 'Claudia', 'Reyes Moreno', 'claudia1705@gmail.com', '5575135201', 1, '2026-01-14', 'regular', 11);
INSERT INTO public.clientes VALUES (1712, 'Liliana', 'Gómez González', 'liliana1712@yahoo.com', '5528913059', 1, '2023-10-08', 'regular', 11);
INSERT INTO public.clientes VALUES (1748, 'Gabriela', 'López López', 'gabriela1748@gmail.com', '5594135858', 1, '2025-12-01', 'nuevo', 11);
INSERT INTO public.clientes VALUES (1781, 'Andrés', 'Cruz Cruz', 'andrés1781@hotmail.com', '5522878701', 1, '2023-06-07', 'regular', 11);
INSERT INTO public.clientes VALUES (1843, 'Sergio', 'López Pérez', 'sergio1843@gmail.com', '5567713148', 1, '2024-03-07', 'regular', 11);
INSERT INTO public.clientes VALUES (1858, 'Alejandra', 'Torres Sánchez', 'alejandra1858@gmail.com', '5552146187', 1, '2024-10-26', 'vip', 11);
INSERT INTO public.clientes VALUES (1861, 'Laura', 'Mendoza Castro', 'laura1861@yahoo.com', '5586421624', 1, '2023-02-21', 'regular', 11);
INSERT INTO public.clientes VALUES (1868, 'Ramón', 'Díaz Vega', 'ramón1868@hotmail.com', '5529915454', 1, '2025-03-11', 'regular', 11);
INSERT INTO public.clientes VALUES (1899, 'Juan', 'Rivera Martínez', 'juan1899@gmail.com', '5593137998', 1, '2025-01-12', 'premium', 11);
INSERT INTO public.clientes VALUES (1906, 'Fernanda', 'Herrera Reyes', 'fernanda1906@gmail.com', '5519579312', 1, '2022-02-24', 'mayorista', 11);
INSERT INTO public.clientes VALUES (1963, 'Juan', 'Mendoza Herrera', 'juan1963@yahoo.com', '5556196801', 1, '2023-02-04', 'regular', 11);
INSERT INTO public.clientes VALUES (1985, 'José', 'Torres Sánchez', 'josé1985@yahoo.com', '5588874493', 1, '2023-03-21', 'regular', 11);
INSERT INTO public.clientes VALUES (1988, 'Valeria', 'Rodríguez Martínez', 'valeria1988@gmail.com', '5582518184', 1, '2024-02-24', 'premium', 11);
INSERT INTO public.clientes VALUES (1993, 'Laura', 'Aguilar González', 'laura1993@hotmail.com', '5595805091', 1, '2021-08-15', 'regular', 11);
INSERT INTO public.clientes VALUES (16, 'Pablo', 'Vargas García', 'pablo16@gmail.com', '5529505652', 2, '2023-01-29', 'regular', 12);
INSERT INTO public.clientes VALUES (18, 'Alberto', 'Hernández Herrera', 'alberto18@gmail.com', '5595938445', 2, '2023-12-25', 'regular', 12);
INSERT INTO public.clientes VALUES (29, 'Carmen', 'Ramos Moreno', 'carmen29@gmail.com', '5535523849', 2, '2022-04-24', 'regular', 12);
INSERT INTO public.clientes VALUES (32, 'Claudia', 'Castro Castro', 'claudia32@gmail.com', '5546874043', 2, '2025-06-02', 'nuevo', 12);
INSERT INTO public.clientes VALUES (90, 'Liliana', 'Núñez Pérez', 'liliana90@gmail.com', '5553579429', 2, '2025-06-22', 'regular', 12);
INSERT INTO public.clientes VALUES (133, 'María', 'Jiménez Castro', 'maría133@yahoo.com', '5598512648', 2, '2023-11-25', 'regular', 12);
INSERT INTO public.clientes VALUES (142, 'Juan', 'Jiménez Ortega', 'juan142@hotmail.com', '5576805681', 2, '2021-11-30', 'regular', 12);
INSERT INTO public.clientes VALUES (164, 'David', 'Mendoza Vega', 'david164@gmail.com', '5570838623', 2, '2026-04-11', 'regular', 12);
INSERT INTO public.clientes VALUES (227, 'Rosa', 'Ramírez Hernández', 'rosa227@hotmail.com', '5573674613', 2, '2025-06-15', 'regular', 12);
INSERT INTO public.clientes VALUES (250, 'Roberto', 'Torres López', 'roberto250@yahoo.com', '5529858055', 2, '2025-08-07', 'mayorista', 12);
INSERT INTO public.clientes VALUES (258, 'Verónica', 'Torres Martínez', 'verónica258@gmail.com', '5564299436', 2, '2022-02-19', 'regular', 12);
INSERT INTO public.clientes VALUES (271, 'Elena', 'García Mendoza', 'elena271@yahoo.com', '5595973864', 2, '2025-09-30', 'premium', 12);
INSERT INTO public.clientes VALUES (281, 'Andrés', 'Núñez López', 'andrés281@yahoo.com', '5512332623', 2, '2024-06-28', 'regular', 12);
INSERT INTO public.clientes VALUES (300, 'Patricia', 'García Martínez', 'patricia300@gmail.com', '5519157497', 2, '2022-08-23', 'regular', 12);
INSERT INTO public.clientes VALUES (313, 'Valeria', 'Rodríguez Jiménez', 'valeria313@hotmail.com', '5537079584', 2, '2022-11-18', 'mayorista', 12);
INSERT INTO public.clientes VALUES (344, 'Francisco', 'Díaz Herrera', 'francisco344@gmail.com', '5570895638', 2, '2025-10-12', 'regular', 12);
INSERT INTO public.clientes VALUES (360, 'Valeria', 'González García', 'valeria360@hotmail.com', '5598521869', 2, '2023-11-25', 'premium', 12);
INSERT INTO public.clientes VALUES (375, 'Mónica', 'Castillo Gómez', 'mónica375@gmail.com', '5590783964', 2, '2024-09-29', 'premium', 12);
INSERT INTO public.clientes VALUES (379, 'Diego', 'Díaz García', 'diego379@hotmail.com', '5569762583', 2, '2023-10-20', 'regular', 12);
INSERT INTO public.clientes VALUES (383, 'Ramón', 'Flores Gutiérrez', 'ramón383@hotmail.com', '5565987241', 2, '2025-10-15', 'regular', 12);
INSERT INTO public.clientes VALUES (384, 'Daniela', 'Cruz Castillo', 'daniela384@yahoo.com', '5535796821', 2, '2024-07-07', 'regular', 12);
INSERT INTO public.clientes VALUES (387, 'Carmen', 'Jiménez Pérez', 'carmen387@hotmail.com', '5599530801', 2, '2025-09-20', 'regular', 12);
INSERT INTO public.clientes VALUES (430, 'Sofía', 'Ramírez Hernández', 'sofía430@hotmail.com', '5518785652', 2, '2026-04-13', 'regular', 12);
INSERT INTO public.clientes VALUES (449, 'Mario', 'Ramírez Martínez', 'mario449@gmail.com', '5572624210', 2, '2024-06-01', 'regular', 12);
INSERT INTO public.clientes VALUES (518, 'Patricia', 'Flores Rodríguez', 'patricia518@gmail.com', '5552676804', 2, '2026-01-24', 'regular', 12);
INSERT INTO public.clientes VALUES (529, 'Mario', 'Reyes Jiménez', 'mario529@gmail.com', '5530921653', 2, '2026-05-02', 'premium', 12);
INSERT INTO public.clientes VALUES (531, 'Pablo', 'Cruz Torres', 'pablo531@yahoo.com', '5591339346', 2, '2026-01-15', 'regular', 12);
INSERT INTO public.clientes VALUES (547, 'Francisco', 'Mendoza García', 'francisco547@hotmail.com', '5545679876', 2, '2023-10-16', 'premium', 12);
INSERT INTO public.clientes VALUES (555, 'Manuel', 'Vega Cruz', 'manuel555@yahoo.com', '5525526124', 2, '2022-09-23', 'regular', 12);
INSERT INTO public.clientes VALUES (558, 'Sofía', 'Moreno González', 'sofía558@gmail.com', '5595033398', 2, '2025-12-08', 'premium', 12);
INSERT INTO public.clientes VALUES (580, 'Manuel', 'Aguilar Gutiérrez', 'manuel580@gmail.com', '5581147161', 2, '2026-02-01', 'regular', 12);
INSERT INTO public.clientes VALUES (604, 'Juan', 'Reyes Rivera', 'juan604@gmail.com', '5566736822', 2, '2024-04-26', 'regular', 12);
INSERT INTO public.clientes VALUES (640, 'Alejandra', 'Rivera González', 'alejandra640@gmail.com', '5522575001', 2, '2025-06-05', 'regular', 12);
INSERT INTO public.clientes VALUES (653, 'Patricia', 'Herrera Vargas', 'patricia653@yahoo.com', '5569954440', 2, '2021-11-16', 'regular', 12);
INSERT INTO public.clientes VALUES (667, 'Adriana', 'Aguilar López', 'adriana667@gmail.com', '5572872428', 2, '2024-09-08', 'premium', 12);
INSERT INTO public.clientes VALUES (689, 'Adriana', 'Herrera Gómez', 'adriana689@hotmail.com', '5567728351', 2, '2025-03-31', 'regular', 12);
INSERT INTO public.clientes VALUES (692, 'Mario', 'Flores Herrera', 'mario692@yahoo.com', '5566250794', 2, '2023-10-12', 'regular', 12);
INSERT INTO public.clientes VALUES (695, 'Valeria', 'García González', 'valeria695@gmail.com', '5529795314', 2, '2021-08-06', 'regular', 12);
INSERT INTO public.clientes VALUES (716, 'Sofía', 'González Torres', 'sofía716@yahoo.com', '5520385959', 2, '2021-09-16', 'regular', 12);
INSERT INTO public.clientes VALUES (754, 'Fernanda', 'Gómez Martínez', 'fernanda754@hotmail.com', '5546006180', 2, '2025-04-16', 'regular', 12);
INSERT INTO public.clientes VALUES (760, 'Sofía', 'Torres Mendoza', 'sofía760@gmail.com', '5570749138', 2, '2022-04-29', 'regular', 12);
INSERT INTO public.clientes VALUES (768, 'Gabriela', 'Jiménez Gutiérrez', 'gabriela768@gmail.com', '5550754622', 2, '2024-10-29', 'regular', 12);
INSERT INTO public.clientes VALUES (769, 'Andrés', 'Hernández Pérez', 'andrés769@hotmail.com', '5517139481', 2, '2024-09-23', 'regular', 12);
INSERT INTO public.clientes VALUES (782, 'Patricia', 'Torres Vargas', 'patricia782@hotmail.com', '5510865811', 2, '2022-12-12', 'premium', 12);
INSERT INTO public.clientes VALUES (784, 'Francisco', 'Cruz Gómez', 'francisco784@yahoo.com', '5564298766', 2, '2025-05-31', 'mayorista', 12);
INSERT INTO public.clientes VALUES (787, 'Claudia', 'Morales Torres', 'claudia787@yahoo.com', '5589022539', 2, '2024-05-20', 'premium', 12);
INSERT INTO public.clientes VALUES (802, 'Sandra', 'Morales Pérez', 'sandra802@gmail.com', '5586553774', 2, '2023-08-21', 'regular', 12);
INSERT INTO public.clientes VALUES (807, 'Miguel', 'Gutiérrez Castillo', 'miguel807@gmail.com', '5588218402', 2, '2024-12-20', 'premium', 12);
INSERT INTO public.clientes VALUES (810, 'Adriana', 'Ramos Jiménez', 'adriana810@gmail.com', '5584011044', 2, '2025-09-19', 'regular', 12);
INSERT INTO public.clientes VALUES (818, 'Luis', 'Moreno López', 'luis818@hotmail.com', '5537630190', 2, '2022-06-28', 'premium', 12);
INSERT INTO public.clientes VALUES (824, 'Laura', 'Hernández Ramírez', 'laura824@gmail.com', '5561531052', 2, '2026-05-04', 'mayorista', 12);
INSERT INTO public.clientes VALUES (834, 'Roberto', 'Ramírez Herrera', 'roberto834@gmail.com', '5544834976', 2, '2025-09-24', 'regular', 12);
INSERT INTO public.clientes VALUES (890, 'Ricardo', 'Ortega García', 'ricardo890@yahoo.com', '5559636618', 2, '2023-04-15', 'regular', 12);
INSERT INTO public.clientes VALUES (894, 'Alejandra', 'Vega García', 'alejandra894@yahoo.com', '5585485324', 2, '2023-05-21', 'regular', 12);
INSERT INTO public.clientes VALUES (906, 'Ramón', 'Jiménez Ramírez', 'ramón906@gmail.com', '5592662979', 2, '2025-04-09', 'regular', 12);
INSERT INTO public.clientes VALUES (908, 'José', 'Castro Hernández', 'josé908@hotmail.com', '5567096991', 2, '2024-08-11', 'regular', 12);
INSERT INTO public.clientes VALUES (935, 'Mónica', 'Ortega Ortega', 'mónica935@gmail.com', '5563597632', 2, '2021-10-07', 'regular', 12);
INSERT INTO public.clientes VALUES (944, 'Alejandra', 'Jiménez Gómez', 'alejandra944@gmail.com', '5556555725', 2, '2022-09-09', 'premium', 12);
INSERT INTO public.clientes VALUES (946, 'Fernanda', 'Núñez López', 'fernanda946@gmail.com', '5528532770', 2, '2025-05-23', 'regular', 12);
INSERT INTO public.clientes VALUES (1009, 'Claudia', 'García Flores', 'claudia1009@gmail.com', '5578390365', 2, '2023-08-31', 'regular', 12);
INSERT INTO public.clientes VALUES (1019, 'Ramón', 'Morales Hernández', 'ramón1019@gmail.com', '5562353371', 2, '2025-01-16', 'regular', 12);
INSERT INTO public.clientes VALUES (1073, 'Alberto', 'Jiménez Vega', 'alberto1073@hotmail.com', '5599242791', 2, '2021-10-02', 'premium', 12);
INSERT INTO public.clientes VALUES (1092, 'Rosa', 'González García', 'rosa1092@hotmail.com', '5592170846', 2, '2021-09-29', 'regular', 12);
INSERT INTO public.clientes VALUES (1096, 'Verónica', 'Ortega González', 'verónica1096@hotmail.com', '5578109300', 2, '2023-06-11', 'regular', 12);
INSERT INTO public.clientes VALUES (1131, 'Laura', 'Gutiérrez Vega', 'laura1131@yahoo.com', '5514790926', 2, '2023-10-05', 'regular', 12);
INSERT INTO public.clientes VALUES (1141, 'Claudia', 'Jiménez Ramírez', 'claudia1141@hotmail.com', '5571066956', 2, '2025-08-02', 'regular', 12);
INSERT INTO public.clientes VALUES (1150, 'Fernando', 'González Díaz', 'fernando1150@yahoo.com', '5527522806', 2, '2024-09-02', 'premium', 12);
INSERT INTO public.clientes VALUES (1171, 'Miguel', 'Castillo López', 'miguel1171@hotmail.com', '5535855513', 2, '2021-11-10', 'regular', 12);
INSERT INTO public.clientes VALUES (1185, 'Claudia', 'Díaz Díaz', 'claudia1185@gmail.com', '5531450764', 2, '2022-09-17', 'regular', 12);
INSERT INTO public.clientes VALUES (1195, 'Alberto', 'Morales Gutiérrez', 'alberto1195@yahoo.com', '5552954460', 2, '2024-09-06', 'premium', 12);
INSERT INTO public.clientes VALUES (1203, 'Sandra', 'Hernández Ramos', 'sandra1203@gmail.com', '5527698856', 2, '2026-02-01', 'vip', 12);
INSERT INTO public.clientes VALUES (1222, 'Rosa', 'Martínez Núñez', 'rosa1222@gmail.com', '5514075870', 2, '2025-06-19', 'regular', 12);
INSERT INTO public.clientes VALUES (1235, 'Carmen', 'Ramos Sánchez', 'carmen1235@gmail.com', '5554949481', 2, '2025-10-15', 'regular', 12);
INSERT INTO public.clientes VALUES (1249, 'Verónica', 'Vargas Ramos', 'verónica1249@hotmail.com', '5579355175', 2, '2025-06-20', 'vip', 12);
INSERT INTO public.clientes VALUES (1260, 'Ricardo', 'Vega Morales', 'ricardo1260@gmail.com', '5535322457', 2, '2023-10-06', 'regular', 12);
INSERT INTO public.clientes VALUES (1268, 'Gabriela', 'Aguilar Gutiérrez', 'gabriela1268@gmail.com', '5551358100', 2, '2023-07-30', 'regular', 12);
INSERT INTO public.clientes VALUES (1285, 'Laura', 'Ortega Ramos', 'laura1285@gmail.com', '5546202434', 2, '2025-09-29', 'regular', 12);
INSERT INTO public.clientes VALUES (1294, 'Mario', 'Ramírez Rivera', 'mario1294@yahoo.com', '5544877696', 2, '2025-07-23', 'regular', 12);
INSERT INTO public.clientes VALUES (1315, 'Miguel', 'Mendoza Reyes', 'miguel1315@gmail.com', '5568840762', 2, '2024-01-06', 'premium', 12);
INSERT INTO public.clientes VALUES (1320, 'Diego', 'Mendoza López', 'diego1320@hotmail.com', '5532226983', 2, '2025-10-21', 'regular', 12);
INSERT INTO public.clientes VALUES (1343, 'María', 'Vega Mendoza', 'maría1343@yahoo.com', '5522511284', 2, '2021-07-14', 'nuevo', 12);
INSERT INTO public.clientes VALUES (1355, 'Rosa', 'García Moreno', 'rosa1355@yahoo.com', '5542963378', 2, '2026-04-30', 'regular', 12);
INSERT INTO public.clientes VALUES (1364, 'Liliana', 'Ramos Castillo', 'liliana1364@hotmail.com', '5540434030', 2, '2023-04-27', 'premium', 12);
INSERT INTO public.clientes VALUES (1390, 'Sergio', 'González Torres', 'sergio1390@yahoo.com', '5511847858', 2, '2022-01-14', 'premium', 12);
INSERT INTO public.clientes VALUES (1431, 'Roberto', 'Mendoza Ortega', 'roberto1431@yahoo.com', '5515284956', 2, '2026-02-23', 'regular', 12);
INSERT INTO public.clientes VALUES (1450, 'José', 'López Núñez', 'josé1450@gmail.com', '5577764711', 2, '2022-03-11', 'nuevo', 12);
INSERT INTO public.clientes VALUES (1453, 'Sandra', 'Núñez García', 'sandra1453@yahoo.com', '5573387410', 2, '2024-12-18', 'premium', 12);
INSERT INTO public.clientes VALUES (1456, 'Gabriela', 'Martínez Gutiérrez', 'gabriela1456@yahoo.com', '5581120433', 2, '2024-07-09', 'mayorista', 12);
INSERT INTO public.clientes VALUES (1464, 'Manuel', 'Rodríguez Díaz', 'manuel1464@gmail.com', '5575147422', 2, '2024-01-24', 'premium', 12);
INSERT INTO public.clientes VALUES (1491, 'Patricia', 'Jiménez González', 'patricia1491@hotmail.com', '5522357361', 2, '2022-05-19', 'premium', 12);
INSERT INTO public.clientes VALUES (1505, 'Alejandra', 'García Flores', 'alejandra1505@hotmail.com', '5513076093', 2, '2022-01-15', 'premium', 12);
INSERT INTO public.clientes VALUES (1530, 'Sofía', 'Gutiérrez Castillo', 'sofía1530@yahoo.com', '5596680604', 2, '2023-07-15', 'regular', 12);
INSERT INTO public.clientes VALUES (1535, 'Fernando', 'Ramos Rodríguez', 'fernando1535@hotmail.com', '5566302151', 2, '2022-05-13', 'mayorista', 12);
INSERT INTO public.clientes VALUES (1563, 'Mario', 'Martínez Morales', 'mario1563@gmail.com', '5572146491', 2, '2025-03-20', 'regular', 12);
INSERT INTO public.clientes VALUES (1564, 'Ricardo', 'García Ortega', 'ricardo1564@hotmail.com', '5587525357', 2, '2023-01-07', 'premium', 12);
INSERT INTO public.clientes VALUES (1593, 'Ana', 'Sánchez Hernández', 'ana1593@hotmail.com', '5564430657', 2, '2023-04-13', 'vip', 12);
INSERT INTO public.clientes VALUES (1613, 'Sofía', 'Díaz Núñez', 'sofía1613@yahoo.com', '5539029091', 2, '2024-11-01', 'nuevo', 12);
INSERT INTO public.clientes VALUES (1640, 'María', 'Núñez Rodríguez', 'maría1640@hotmail.com', '5550545587', 2, '2025-08-19', 'regular', 12);
INSERT INTO public.clientes VALUES (1710, 'Sofía', 'Cruz Morales', 'sofía1710@hotmail.com', '5528517985', 2, '2024-10-12', 'regular', 12);
INSERT INTO public.clientes VALUES (1715, 'Ramón', 'González González', 'ramón1715@gmail.com', '5559280571', 2, '2021-10-15', 'regular', 12);
INSERT INTO public.clientes VALUES (1752, 'Verónica', 'Hernández López', 'verónica1752@gmail.com', '5568952764', 2, '2024-12-20', 'regular', 12);
INSERT INTO public.clientes VALUES (1798, 'Andrés', 'Herrera Ramos', 'andrés1798@hotmail.com', '5546045914', 2, '2024-08-03', 'premium', 12);
INSERT INTO public.clientes VALUES (1824, 'Mario', 'Díaz López', 'mario1824@gmail.com', '5514665196', 2, '2024-03-20', 'regular', 12);
INSERT INTO public.clientes VALUES (1844, 'Mónica', 'Gómez Hernández', 'mónica1844@gmail.com', '5580225378', 2, '2025-03-27', 'regular', 12);
INSERT INTO public.clientes VALUES (1878, 'Patricia', 'Castro Mendoza', 'patricia1878@gmail.com', '5596789632', 2, '2023-12-27', 'mayorista', 12);
INSERT INTO public.clientes VALUES (1890, 'Alejandro', 'Moreno Castro', 'alejandro1890@gmail.com', '5523635217', 2, '2022-11-04', 'premium', 12);
INSERT INTO public.clientes VALUES (1900, 'David', 'Ramos Castro', 'david1900@gmail.com', '5524682341', 2, '2025-11-15', 'regular', 12);
INSERT INTO public.clientes VALUES (1908, 'Alberto', 'Ramos Flores', 'alberto1908@yahoo.com', '5570713460', 2, '2023-10-14', 'regular', 12);
INSERT INTO public.clientes VALUES (19, 'Sandra', 'Torres Pérez', 'sandra19@hotmail.com', '5579231333', 4, '2022-12-30', 'regular', 13);
INSERT INTO public.clientes VALUES (22, 'Liliana', 'Rivera Rivera', 'liliana22@gmail.com', '5547112255', 4, '2023-01-17', 'nuevo', 13);
INSERT INTO public.clientes VALUES (26, 'Alejandro', 'López Gómez', 'alejandro26@gmail.com', '5539579214', 4, '2021-12-16', 'regular', 13);
INSERT INTO public.clientes VALUES (27, 'Sandra', 'Gutiérrez García', 'sandra27@gmail.com', '5545346197', 4, '2024-10-31', 'regular', 13);
INSERT INTO public.clientes VALUES (56, 'Rosa', 'Díaz Castro', 'rosa56@gmail.com', '5562982727', 4, '2025-07-12', 'premium', 13);
INSERT INTO public.clientes VALUES (63, 'Isabel', 'Aguilar Gómez', 'isabel63@gmail.com', '5526369402', 4, '2024-04-14', 'premium', 13);
INSERT INTO public.clientes VALUES (66, 'Rosa', 'Rivera Castro', 'rosa66@hotmail.com', '5525157001', 4, '2022-11-23', 'regular', 13);
INSERT INTO public.clientes VALUES (95, 'Andrés', 'Herrera Jiménez', 'andrés95@gmail.com', '5522090729', 4, '2024-01-09', 'regular', 13);
INSERT INTO public.clientes VALUES (111, 'Adriana', 'Vega Vargas', 'adriana111@gmail.com', '5566013532', 4, '2023-03-26', 'regular', 13);
INSERT INTO public.clientes VALUES (121, 'Andrés', 'Vega Jiménez', 'andrés121@yahoo.com', '5571410640', 4, '2024-01-18', 'regular', 13);
INSERT INTO public.clientes VALUES (123, 'Ana', 'Reyes Martínez', 'ana123@hotmail.com', '5515692967', 4, '2023-07-15', 'regular', 13);
INSERT INTO public.clientes VALUES (193, 'Ana', 'Rodríguez Cruz', 'ana193@yahoo.com', '5581473736', 4, '2024-04-25', 'premium', 13);
INSERT INTO public.clientes VALUES (218, 'Sofía', 'Martínez Morales', 'sofía218@gmail.com', '5592628262', 4, '2026-02-02', 'mayorista', 13);
INSERT INTO public.clientes VALUES (221, 'Carmen', 'Castillo Rivera', 'carmen221@gmail.com', '5568876111', 4, '2023-03-08', 'regular', 13);
INSERT INTO public.clientes VALUES (237, 'Mario', 'Ramos Vega', 'mario237@yahoo.com', '5587774748', 4, '2023-02-16', 'vip', 13);
INSERT INTO public.clientes VALUES (272, 'Alejandra', 'Rodríguez Morales', 'alejandra272@gmail.com', '5596541691', 4, '2026-04-14', 'regular', 13);
INSERT INTO public.clientes VALUES (279, 'David', 'Núñez Núñez', 'david279@yahoo.com', '5577562908', 4, '2021-10-12', 'regular', 13);
INSERT INTO public.clientes VALUES (283, 'Sofía', 'Sánchez González', 'sofía283@gmail.com', '5529107146', 4, '2024-09-20', 'regular', 13);
INSERT INTO public.clientes VALUES (293, 'Sergio', 'Cruz Jiménez', 'sergio293@gmail.com', '5569586748', 4, '2023-05-04', 'regular', 13);
INSERT INTO public.clientes VALUES (333, 'Daniela', 'Castro Mendoza', 'daniela333@gmail.com', '5581794497', 4, '2021-08-20', 'regular', 13);
INSERT INTO public.clientes VALUES (369, 'Diego', 'Torres González', 'diego369@gmail.com', '5550320166', 4, '2023-07-06', 'regular', 13);
INSERT INTO public.clientes VALUES (382, 'Ramón', 'Ramos Jiménez', 'ramón382@gmail.com', '5575485030', 4, '2022-06-10', 'regular', 13);
INSERT INTO public.clientes VALUES (388, 'Diego', 'Martínez Mendoza', 'diego388@hotmail.com', '5550755467', 4, '2025-04-09', 'regular', 13);
INSERT INTO public.clientes VALUES (395, 'Juan', 'Martínez Vega', 'juan395@hotmail.com', '5510884169', 4, '2021-10-06', 'mayorista', 13);
INSERT INTO public.clientes VALUES (429, 'Ana', 'Pérez Sánchez', 'ana429@gmail.com', '5588655491', 4, '2023-09-06', 'regular', 13);
INSERT INTO public.clientes VALUES (431, 'Carlos', 'Ramírez Gutiérrez', 'carlos431@gmail.com', '5523624363', 4, '2022-03-02', 'regular', 13);
INSERT INTO public.clientes VALUES (442, 'María', 'Martínez Cruz', 'maría442@yahoo.com', '5511256721', 4, '2022-04-12', 'regular', 13);
INSERT INTO public.clientes VALUES (520, 'Carlos', 'Jiménez Herrera', 'carlos520@gmail.com', '5551452961', 4, '2022-04-22', 'regular', 13);
INSERT INTO public.clientes VALUES (524, 'Ricardo', 'Pérez Gutiérrez', 'ricardo524@hotmail.com', '5543331368', 4, '2023-01-13', 'mayorista', 13);
INSERT INTO public.clientes VALUES (526, 'Fernando', 'González López', 'fernando526@hotmail.com', '5537430524', 4, '2023-08-07', 'regular', 13);
INSERT INTO public.clientes VALUES (527, 'Gabriela', 'Rodríguez Ramos', 'gabriela527@yahoo.com', '5591315976', 4, '2024-09-29', 'regular', 13);
INSERT INTO public.clientes VALUES (548, 'Valeria', 'Rivera Moreno', 'valeria548@gmail.com', '5552308622', 4, '2024-06-02', 'premium', 13);
INSERT INTO public.clientes VALUES (550, 'María', 'Jiménez Martínez', 'maría550@gmail.com', '5547509496', 4, '2024-05-18', 'regular', 13);
INSERT INTO public.clientes VALUES (560, 'Fernanda', 'Vargas Vargas', 'fernanda560@gmail.com', '5568648080', 4, '2025-03-11', 'regular', 13);
INSERT INTO public.clientes VALUES (574, 'Liliana', 'Díaz González', 'liliana574@gmail.com', '5564223156', 4, '2026-04-03', 'regular', 13);
INSERT INTO public.clientes VALUES (597, 'Ana', 'Núñez Ramos', 'ana597@gmail.com', '5559680785', 4, '2022-08-23', 'premium', 13);
INSERT INTO public.clientes VALUES (617, 'Sandra', 'Rodríguez Sánchez', 'sandra617@yahoo.com', '5545370495', 4, '2022-09-16', 'mayorista', 13);
INSERT INTO public.clientes VALUES (620, 'Miguel', 'Gómez Díaz', 'miguel620@gmail.com', '5595001425', 4, '2025-03-14', 'regular', 13);
INSERT INTO public.clientes VALUES (642, 'Fernanda', 'Moreno Jiménez', 'fernanda642@yahoo.com', '5567229772', 4, '2023-11-23', 'vip', 13);
INSERT INTO public.clientes VALUES (648, 'Mario', 'González García', 'mario648@gmail.com', '5513221342', 4, '2024-01-19', 'regular', 13);
INSERT INTO public.clientes VALUES (655, 'Mario', 'Jiménez Mendoza', 'mario655@gmail.com', '5528551745', 4, '2024-04-18', 'regular', 13);
INSERT INTO public.clientes VALUES (659, 'Patricia', 'Torres Cruz', 'patricia659@hotmail.com', '5566515994', 4, '2025-04-06', 'mayorista', 13);
INSERT INTO public.clientes VALUES (669, 'Eduardo', 'Jiménez Herrera', 'eduardo669@gmail.com', '5513764654', 4, '2024-11-11', 'regular', 13);
INSERT INTO public.clientes VALUES (704, 'Ana', 'Moreno Torres', 'ana704@gmail.com', '5538436861', 4, '2022-02-01', 'regular', 13);
INSERT INTO public.clientes VALUES (738, 'Luis', 'Flores Vega', 'luis738@gmail.com', '5568476310', 4, '2025-06-28', 'regular', 13);
INSERT INTO public.clientes VALUES (752, 'Alejandro', 'Reyes Jiménez', 'alejandro752@yahoo.com', '5516693632', 4, '2025-10-27', 'regular', 13);
INSERT INTO public.clientes VALUES (753, 'Miguel', 'Ortega Ramírez', 'miguel753@hotmail.com', '5546971545', 4, '2021-06-30', 'premium', 13);
INSERT INTO public.clientes VALUES (758, 'Adriana', 'Rivera Morales', 'adriana758@gmail.com', '5575539501', 4, '2023-10-18', 'regular', 13);
INSERT INTO public.clientes VALUES (771, 'Patricia', 'Ramos Pérez', 'patricia771@hotmail.com', '5549030787', 4, '2026-04-07', 'regular', 13);
INSERT INTO public.clientes VALUES (777, 'Laura', 'Herrera González', 'laura777@gmail.com', '5550586096', 4, '2023-03-11', 'regular', 13);
INSERT INTO public.clientes VALUES (795, 'Alberto', 'Aguilar Gómez', 'alberto795@yahoo.com', '5531364734', 4, '2025-11-26', 'premium', 13);
INSERT INTO public.clientes VALUES (816, 'Verónica', 'Ortega Hernández', 'verónica816@gmail.com', '5511999650', 4, '2021-11-20', 'regular', 13);
INSERT INTO public.clientes VALUES (817, 'Andrés', 'Rodríguez Torres', 'andrés817@yahoo.com', '5597940656', 4, '2024-10-21', 'regular', 13);
INSERT INTO public.clientes VALUES (821, 'Adriana', 'Morales Ramírez', 'adriana821@hotmail.com', '5579926758', 4, '2024-09-25', 'premium', 13);
INSERT INTO public.clientes VALUES (822, 'Eduardo', 'Ramos Aguilar', 'eduardo822@gmail.com', '5514814077', 4, '2022-07-12', 'regular', 13);
INSERT INTO public.clientes VALUES (829, 'Sandra', 'Ramírez Rodríguez', 'sandra829@gmail.com', '5572724302', 4, '2025-09-14', 'vip', 13);
INSERT INTO public.clientes VALUES (845, 'Gabriela', 'Núñez Sánchez', 'gabriela845@hotmail.com', '5558582114', 4, '2023-11-21', 'regular', 13);
INSERT INTO public.clientes VALUES (852, 'Fernanda', 'Castro Díaz', 'fernanda852@yahoo.com', '5584751326', 4, '2022-06-14', 'regular', 13);
INSERT INTO public.clientes VALUES (1001, 'Roberto', 'Castillo Núñez', 'roberto1001@gmail.com', '5542895027', 4, '2022-07-30', 'premium', 13);
INSERT INTO public.clientes VALUES (1018, 'Fernando', 'Jiménez Reyes', 'fernando1018@yahoo.com', '5519989411', 4, '2025-07-18', 'regular', 13);
INSERT INTO public.clientes VALUES (1031, 'Pablo', 'García García', 'pablo1031@yahoo.com', '5544742654', 4, '2023-03-03', 'premium', 13);
INSERT INTO public.clientes VALUES (1068, 'Ramón', 'Pérez Sánchez', 'ramón1068@gmail.com', '5519466596', 4, '2024-11-23', 'regular', 13);
INSERT INTO public.clientes VALUES (1070, 'Sandra', 'Martínez Herrera', 'sandra1070@gmail.com', '5573231224', 4, '2022-09-28', 'regular', 13);
INSERT INTO public.clientes VALUES (1075, 'Alejandro', 'Rivera López', 'alejandro1075@hotmail.com', '5575169251', 4, '2023-02-28', 'regular', 13);
INSERT INTO public.clientes VALUES (1090, 'Sergio', 'Jiménez Ortega', 'sergio1090@gmail.com', '5553464571', 4, '2023-12-18', 'mayorista', 13);
INSERT INTO public.clientes VALUES (1091, 'Juan', 'Moreno Ramírez', 'juan1091@yahoo.com', '5539390348', 4, '2021-07-15', 'regular', 13);
INSERT INTO public.clientes VALUES (1097, 'Adriana', 'Sánchez Ramos', 'adriana1097@hotmail.com', '5584366395', 4, '2023-11-02', 'regular', 13);
INSERT INTO public.clientes VALUES (1103, 'José', 'Reyes Díaz', 'josé1103@gmail.com', '5536121315', 4, '2023-01-27', 'premium', 13);
INSERT INTO public.clientes VALUES (1114, 'Andrés', 'Martínez Moreno', 'andrés1114@gmail.com', '5555411755', 4, '2024-05-24', 'regular', 13);
INSERT INTO public.clientes VALUES (1132, 'Pablo', 'Rodríguez López', 'pablo1132@gmail.com', '5519046325', 4, '2024-01-01', 'premium', 13);
INSERT INTO public.clientes VALUES (1135, 'Ana', 'Gómez Gómez', 'ana1135@yahoo.com', '5518542875', 4, '2025-05-31', 'premium', 13);
INSERT INTO public.clientes VALUES (1167, 'Luis', 'Sánchez López', 'luis1167@yahoo.com', '5586760300', 4, '2022-01-28', 'regular', 13);
INSERT INTO public.clientes VALUES (1191, 'Liliana', 'Núñez Sánchez', 'liliana1191@gmail.com', '5591790554', 4, '2021-11-19', 'mayorista', 13);
INSERT INTO public.clientes VALUES (1194, 'Alejandro', 'Castillo González', 'alejandro1194@hotmail.com', '5573585237', 4, '2025-03-11', 'premium', 13);
INSERT INTO public.clientes VALUES (1377, 'Eduardo', 'Gómez Gutiérrez', 'eduardo1377@yahoo.com', '5585321709', 4, '2025-12-26', 'regular', 13);
INSERT INTO public.clientes VALUES (1210, 'José', 'Hernández Pérez', 'josé1210@gmail.com', '5538029575', 4, '2023-03-06', 'regular', 13);
INSERT INTO public.clientes VALUES (1218, 'Carmen', 'Núñez Morales', 'carmen1218@hotmail.com', '5599526487', 4, '2026-01-03', 'premium', 13);
INSERT INTO public.clientes VALUES (1226, 'Claudia', 'Pérez Mendoza', 'claudia1226@hotmail.com', '5535242303', 4, '2022-07-30', 'regular', 13);
INSERT INTO public.clientes VALUES (1236, 'Daniela', 'Gutiérrez Núñez', 'daniela1236@hotmail.com', '5562720687', 4, '2023-03-18', 'regular', 13);
INSERT INTO public.clientes VALUES (1238, 'Sandra', 'Mendoza Martínez', 'sandra1238@hotmail.com', '5551145240', 4, '2022-03-17', 'regular', 13);
INSERT INTO public.clientes VALUES (1245, 'José', 'Morales Ramírez', 'josé1245@gmail.com', '5521135331', 4, '2022-05-20', 'mayorista', 13);
INSERT INTO public.clientes VALUES (1252, 'Ricardo', 'Flores Vega', 'ricardo1252@gmail.com', '5576216456', 4, '2022-06-11', 'regular', 13);
INSERT INTO public.clientes VALUES (1286, 'Elena', 'Sánchez Cruz', 'elena1286@gmail.com', '5533292561', 4, '2024-11-16', 'regular', 13);
INSERT INTO public.clientes VALUES (1292, 'Fernanda', 'Jiménez Castro', 'fernanda1292@yahoo.com', '5585606069', 4, '2022-10-29', 'premium', 13);
INSERT INTO public.clientes VALUES (1302, 'Ana', 'Gómez González', 'ana1302@yahoo.com', '5527755795', 4, '2021-08-12', 'premium', 13);
INSERT INTO public.clientes VALUES (1309, 'Patricia', 'Vargas Mendoza', 'patricia1309@yahoo.com', '5512198223', 4, '2023-12-25', 'regular', 13);
INSERT INTO public.clientes VALUES (1310, 'Andrés', 'Rivera Castro', 'andrés1310@yahoo.com', '5516891577', 4, '2025-08-17', 'mayorista', 13);
INSERT INTO public.clientes VALUES (1350, 'Elena', 'Cruz Ramírez', 'elena1350@hotmail.com', '5515195631', 4, '2022-09-12', 'vip', 13);
INSERT INTO public.clientes VALUES (1351, 'Alejandro', 'García Reyes', 'alejandro1351@yahoo.com', '5570297305', 4, '2024-03-20', 'regular', 13);
INSERT INTO public.clientes VALUES (1381, 'Juan', 'Gómez Ortega', 'juan1381@hotmail.com', '5546152919', 4, '2022-12-27', 'mayorista', 13);
INSERT INTO public.clientes VALUES (1443, 'María', 'Herrera Sánchez', 'maría1443@gmail.com', '5559442025', 4, '2023-04-30', 'premium', 13);
INSERT INTO public.clientes VALUES (1448, 'Sofía', 'Gutiérrez Hernández', 'sofía1448@gmail.com', '5536658175', 4, '2023-02-12', 'regular', 13);
INSERT INTO public.clientes VALUES (1508, 'Juan', 'López Moreno', 'juan1508@gmail.com', '5534219451', 4, '2022-12-01', 'regular', 13);
INSERT INTO public.clientes VALUES (1525, 'Eduardo', 'Aguilar Aguilar', 'eduardo1525@gmail.com', '5534922740', 4, '2022-11-21', 'nuevo', 13);
INSERT INTO public.clientes VALUES (1545, 'Ana', 'Hernández González', 'ana1545@gmail.com', '5559996586', 4, '2023-02-27', 'premium', 13);
INSERT INTO public.clientes VALUES (1553, 'Pablo', 'Ramos García', 'pablo1553@gmail.com', '5579738269', 4, '2024-02-12', 'regular', 13);
INSERT INTO public.clientes VALUES (1561, 'Ramón', 'López Vargas', 'ramón1561@hotmail.com', '5529310301', 4, '2025-07-05', 'regular', 13);
INSERT INTO public.clientes VALUES (1591, 'Alejandra', 'Díaz Vega', 'alejandra1591@gmail.com', '5565343491', 4, '2025-09-18', 'regular', 13);
INSERT INTO public.clientes VALUES (1600, 'Francisco', 'Hernández Díaz', 'francisco1600@yahoo.com', '5572001364', 4, '2024-07-31', 'regular', 13);
INSERT INTO public.clientes VALUES (1605, 'Juan', 'López Rivera', 'juan1605@gmail.com', '5580412756', 4, '2021-10-14', 'regular', 13);
INSERT INTO public.clientes VALUES (1634, 'Isabel', 'Gutiérrez Gutiérrez', 'isabel1634@hotmail.com', '5587023573', 4, '2024-12-14', 'regular', 13);
INSERT INTO public.clientes VALUES (1669, 'Daniela', 'Ramírez Reyes', 'daniela1669@yahoo.com', '5584825320', 4, '2023-08-15', 'regular', 13);
INSERT INTO public.clientes VALUES (1687, 'Carmen', 'Ramírez González', 'carmen1687@gmail.com', '5584725325', 4, '2023-02-14', 'regular', 13);
INSERT INTO public.clientes VALUES (1690, 'Carmen', 'González Martínez', 'carmen1690@yahoo.com', '5534845617', 4, '2025-06-17', 'mayorista', 13);
INSERT INTO public.clientes VALUES (1739, 'Carmen', 'Rodríguez Vargas', 'carmen1739@hotmail.com', '5559787936', 4, '2024-09-04', 'mayorista', 13);
INSERT INTO public.clientes VALUES (1757, 'Roberto', 'Moreno Ortega', 'roberto1757@gmail.com', '5530059058', 4, '2022-01-07', 'regular', 13);
INSERT INTO public.clientes VALUES (1760, 'Juan', 'Castro Castro', 'juan1760@yahoo.com', '5569602309', 4, '2021-12-27', 'regular', 13);
INSERT INTO public.clientes VALUES (1774, 'Miguel', 'Rodríguez Gutiérrez', 'miguel1774@yahoo.com', '5527107502', 4, '2025-09-07', 'premium', 13);
INSERT INTO public.clientes VALUES (1822, 'Rosa', 'Núñez Sánchez', 'rosa1822@yahoo.com', '5569417375', 4, '2022-07-10', 'premium', 13);
INSERT INTO public.clientes VALUES (1823, 'Adriana', 'Jiménez Rodríguez', 'adriana1823@yahoo.com', '5573576443', 4, '2022-01-22', 'regular', 13);
INSERT INTO public.clientes VALUES (1833, 'Pablo', 'Sánchez Aguilar', 'pablo1833@gmail.com', '5574261898', 4, '2026-01-26', 'mayorista', 13);
INSERT INTO public.clientes VALUES (1914, 'Manuel', 'Herrera Vega', 'manuel1914@yahoo.com', '5581730341', 4, '2022-06-30', 'mayorista', 13);
INSERT INTO public.clientes VALUES (1919, 'Sandra', 'Núñez Núñez', 'sandra1919@hotmail.com', '5574483772', 4, '2021-10-12', 'regular', 13);
INSERT INTO public.clientes VALUES (1935, 'Ricardo', 'Castillo Jiménez', 'ricardo1935@hotmail.com', '5578196270', 4, '2024-06-26', 'mayorista', 13);
INSERT INTO public.clientes VALUES (1938, 'Verónica', 'Reyes Martínez', 'verónica1938@gmail.com', '5545755742', 4, '2022-02-15', 'regular', 13);
INSERT INTO public.clientes VALUES (1954, 'Ana', 'Flores Morales', 'ana1954@hotmail.com', '5583962723', 4, '2022-12-22', 'regular', 13);
INSERT INTO public.clientes VALUES (1987, 'Miguel', 'Gutiérrez Jiménez', 'miguel1987@gmail.com', '5574382977', 4, '2023-03-17', 'regular', 13);
INSERT INTO public.clientes VALUES (20, 'Ricardo', 'Vargas García', 'ricardo20@gmail.com', '5521655844', 8, '2022-01-27', 'regular', 14);
INSERT INTO public.clientes VALUES (89, 'Juan', 'González Ramírez', 'juan89@hotmail.com', '5541271945', 8, '2021-11-23', 'regular', 14);
INSERT INTO public.clientes VALUES (104, 'Ana', 'Ramírez Rodríguez', 'ana104@yahoo.com', '5592941828', 8, '2026-02-23', 'regular', 14);
INSERT INTO public.clientes VALUES (109, 'Elena', 'Reyes Ramírez', 'elena109@gmail.com', '5593992429', 8, '2021-07-08', 'regular', 14);
INSERT INTO public.clientes VALUES (116, 'Alejandra', 'Torres Cruz', 'alejandra116@gmail.com', '5595476210', 8, '2025-08-04', 'premium', 14);
INSERT INTO public.clientes VALUES (117, 'Roberto', 'García Herrera', 'roberto117@gmail.com', '5592805158', 8, '2023-01-18', 'regular', 14);
INSERT INTO public.clientes VALUES (247, 'Eduardo', 'Castro Ramírez', 'eduardo247@gmail.com', '5566764586', 8, '2026-02-20', 'regular', 14);
INSERT INTO public.clientes VALUES (273, 'José', 'Jiménez Ramos', 'josé273@yahoo.com', '5568528124', 8, '2022-12-03', 'premium', 14);
INSERT INTO public.clientes VALUES (274, 'Sofía', 'Rivera Reyes', 'sofía274@gmail.com', '5512354860', 8, '2025-07-13', 'regular', 14);
INSERT INTO public.clientes VALUES (297, 'Alberto', 'Vega Gómez', 'alberto297@hotmail.com', '5576989425', 8, '2022-02-26', 'premium', 14);
INSERT INTO public.clientes VALUES (299, 'Claudia', 'Reyes Ramírez', 'claudia299@yahoo.com', '5526400072', 8, '2023-09-13', 'regular', 14);
INSERT INTO public.clientes VALUES (332, 'Ana', 'Castillo Núñez', 'ana332@gmail.com', '5542168745', 8, '2023-05-07', 'regular', 14);
INSERT INTO public.clientes VALUES (340, 'David', 'Cruz Morales', 'david340@gmail.com', '5527919382', 8, '2025-06-21', 'premium', 14);
INSERT INTO public.clientes VALUES (346, 'Fernando', 'Díaz Rodríguez', 'fernando346@yahoo.com', '5548949039', 8, '2025-02-14', 'premium', 14);
INSERT INTO public.clientes VALUES (352, 'Patricia', 'Ramírez Martínez', 'patricia352@hotmail.com', '5577002914', 8, '2022-04-02', 'regular', 14);
INSERT INTO public.clientes VALUES (390, 'Alberto', 'Sánchez Martínez', 'alberto390@gmail.com', '5575278845', 8, '2024-07-15', 'premium', 14);
INSERT INTO public.clientes VALUES (411, 'Fernanda', 'Ortega Gutiérrez', 'fernanda411@gmail.com', '5562986806', 8, '2023-03-03', 'regular', 14);
INSERT INTO public.clientes VALUES (428, 'Miguel', 'Torres Gómez', 'miguel428@yahoo.com', '5553515775', 8, '2024-05-03', 'vip', 14);
INSERT INTO public.clientes VALUES (437, 'Francisco', 'Mendoza Flores', 'francisco437@gmail.com', '5555987725', 8, '2022-03-23', 'premium', 14);
INSERT INTO public.clientes VALUES (522, 'Alberto', 'Cruz Ramos', 'alberto522@gmail.com', '5528021013', 8, '2024-08-30', 'premium', 14);
INSERT INTO public.clientes VALUES (557, 'Valeria', 'Castro Gómez', 'valeria557@gmail.com', '5539578370', 8, '2022-09-17', 'regular', 14);
INSERT INTO public.clientes VALUES (621, 'Francisco', 'Díaz Vargas', 'francisco621@yahoo.com', '5558798364', 8, '2024-06-23', 'premium', 14);
INSERT INTO public.clientes VALUES (637, 'Eduardo', 'Sánchez Ramos', 'eduardo637@gmail.com', '5533721002', 8, '2026-05-10', 'regular', 14);
INSERT INTO public.clientes VALUES (638, 'Liliana', 'Martínez Ramos', 'liliana638@gmail.com', '5561268618', 8, '2021-07-26', 'premium', 14);
INSERT INTO public.clientes VALUES (691, 'Andrés', 'Vega Díaz', 'andrés691@gmail.com', '5599878149', 8, '2025-05-31', 'mayorista', 14);
INSERT INTO public.clientes VALUES (711, 'Liliana', 'Mendoza Gómez', 'liliana711@gmail.com', '5594197247', 8, '2021-10-01', 'regular', 14);
INSERT INTO public.clientes VALUES (714, 'Gabriela', 'Pérez Gutiérrez', 'gabriela714@gmail.com', '5560748656', 8, '2022-09-30', 'regular', 14);
INSERT INTO public.clientes VALUES (723, 'Claudia', 'Díaz Reyes', 'claudia723@gmail.com', '5535911301', 8, '2025-06-22', 'regular', 14);
INSERT INTO public.clientes VALUES (735, 'Carlos', 'López Morales', 'carlos735@hotmail.com', '5550399304', 8, '2024-08-31', 'premium', 14);
INSERT INTO public.clientes VALUES (740, 'Miguel', 'Torres López', 'miguel740@hotmail.com', '5560943206', 8, '2022-07-12', 'regular', 14);
INSERT INTO public.clientes VALUES (772, 'Pablo', 'Díaz Gómez', 'pablo772@gmail.com', '5523171952', 8, '2024-10-01', 'regular', 14);
INSERT INTO public.clientes VALUES (773, 'Mario', 'Moreno Castro', 'mario773@hotmail.com', '5536777331', 8, '2025-09-07', 'regular', 14);
INSERT INTO public.clientes VALUES (805, 'Valeria', 'García Sánchez', 'valeria805@gmail.com', '5548909246', 8, '2024-04-03', 'premium', 14);
INSERT INTO public.clientes VALUES (823, 'Sofía', 'García Morales', 'sofía823@gmail.com', '5546278860', 8, '2023-02-23', 'regular', 14);
INSERT INTO public.clientes VALUES (826, 'Daniela', 'Núñez García', 'daniela826@gmail.com', '5555126455', 8, '2021-11-25', 'premium', 14);
INSERT INTO public.clientes VALUES (836, 'Manuel', 'Castillo Sánchez', 'manuel836@hotmail.com', '5544769739', 8, '2026-05-09', 'premium', 14);
INSERT INTO public.clientes VALUES (864, 'Sofía', 'Cruz Castro', 'sofía864@yahoo.com', '5528363405', 8, '2022-05-05', 'premium', 14);
INSERT INTO public.clientes VALUES (868, 'Ramón', 'Gómez Vega', 'ramón868@gmail.com', '5536263497', 8, '2023-10-23', 'regular', 14);
INSERT INTO public.clientes VALUES (887, 'David', 'Díaz Reyes', 'david887@gmail.com', '5550554420', 8, '2023-11-15', 'regular', 14);
INSERT INTO public.clientes VALUES (898, 'Alejandra', 'Gómez García', 'alejandra898@yahoo.com', '5549490030', 8, '2023-07-07', 'regular', 14);
INSERT INTO public.clientes VALUES (910, 'José', 'Castro Jiménez', 'josé910@gmail.com', '5532295753', 8, '2022-06-16', 'regular', 14);
INSERT INTO public.clientes VALUES (915, 'Alejandro', 'Vargas Morales', 'alejandro915@hotmail.com', '5543962179', 8, '2022-12-09', 'regular', 14);
INSERT INTO public.clientes VALUES (953, 'Patricia', 'García Flores', 'patricia953@gmail.com', '5589208997', 8, '2025-05-03', 'regular', 14);
INSERT INTO public.clientes VALUES (999, 'Miguel', 'Gómez Vargas', 'miguel999@yahoo.com', '5519019126', 8, '2023-05-05', 'nuevo', 14);
INSERT INTO public.clientes VALUES (1016, 'Mario', 'Rivera Vargas', 'mario1016@gmail.com', '5571322699', 8, '2026-05-03', 'mayorista', 14);
INSERT INTO public.clientes VALUES (1022, 'Fernando', 'Gutiérrez López', 'fernando1022@yahoo.com', '5583361416', 8, '2023-04-28', 'regular', 14);
INSERT INTO public.clientes VALUES (1024, 'Carmen', 'Flores Cruz', 'carmen1024@yahoo.com', '5536707338', 8, '2025-01-05', 'premium', 14);
INSERT INTO public.clientes VALUES (1045, 'Roberto', 'García Morales', 'roberto1045@yahoo.com', '5560087924', 8, '2022-12-16', 'regular', 14);
INSERT INTO public.clientes VALUES (1071, 'Verónica', 'Ramos Jiménez', 'verónica1071@yahoo.com', '5555818870', 8, '2026-03-20', 'regular', 14);
INSERT INTO public.clientes VALUES (1074, 'Miguel', 'Vargas Martínez', 'miguel1074@gmail.com', '5547608285', 8, '2025-01-12', 'premium', 14);
INSERT INTO public.clientes VALUES (1107, 'Laura', 'Flores Cruz', 'laura1107@gmail.com', '5580312275', 8, '2026-05-01', 'mayorista', 14);
INSERT INTO public.clientes VALUES (1127, 'Fernanda', 'Ramírez Aguilar', 'fernanda1127@gmail.com', '5575527308', 8, '2023-01-29', 'regular', 14);
INSERT INTO public.clientes VALUES (1129, 'Diego', 'López Rodríguez', 'diego1129@gmail.com', '5532463582', 8, '2022-08-17', 'premium', 14);
INSERT INTO public.clientes VALUES (1155, 'Alejandra', 'Rodríguez Gutiérrez', 'alejandra1155@gmail.com', '5573024306', 8, '2022-07-29', 'mayorista', 14);
INSERT INTO public.clientes VALUES (1184, 'David', 'Pérez García', 'david1184@yahoo.com', '5583729641', 8, '2025-03-02', 'regular', 14);
INSERT INTO public.clientes VALUES (1223, 'Ricardo', 'Cruz Vega', 'ricardo1223@gmail.com', '5584818976', 8, '2024-12-05', 'regular', 14);
INSERT INTO public.clientes VALUES (1240, 'Roberto', 'Aguilar Herrera', 'roberto1240@gmail.com', '5518995520', 8, '2023-11-28', 'nuevo', 14);
INSERT INTO public.clientes VALUES (1248, 'Francisco', 'Cruz López', 'francisco1248@gmail.com', '5572166964', 8, '2022-07-15', 'regular', 14);
INSERT INTO public.clientes VALUES (1278, 'Isabel', 'Núñez Morales', 'isabel1278@hotmail.com', '5588327265', 8, '2023-07-31', 'regular', 14);
INSERT INTO public.clientes VALUES (1291, 'Carmen', 'Mendoza Gómez', 'carmen1291@yahoo.com', '5564371908', 8, '2025-01-18', 'premium', 14);
INSERT INTO public.clientes VALUES (1296, 'Roberto', 'López Jiménez', 'roberto1296@gmail.com', '5516719620', 8, '2025-12-31', 'regular', 14);
INSERT INTO public.clientes VALUES (1301, 'Manuel', 'Núñez Rodríguez', 'manuel1301@yahoo.com', '5533057873', 8, '2023-07-26', 'mayorista', 14);
INSERT INTO public.clientes VALUES (1498, 'José', 'Castro Moreno', 'josé1498@gmail.com', '5551218029', 8, '2023-02-14', 'regular', 14);
INSERT INTO public.clientes VALUES (1321, 'David', 'Jiménez Ramos', 'david1321@gmail.com', '5572938222', 8, '2023-03-18', 'regular', 14);
INSERT INTO public.clientes VALUES (1346, 'Francisco', 'Pérez Pérez', 'francisco1346@hotmail.com', '5577777421', 8, '2023-06-20', 'regular', 14);
INSERT INTO public.clientes VALUES (1404, 'David', 'Núñez Sánchez', 'david1404@gmail.com', '5522550720', 8, '2022-01-03', 'regular', 14);
INSERT INTO public.clientes VALUES (1429, 'Fernanda', 'Rivera Vargas', 'fernanda1429@yahoo.com', '5579241678', 8, '2023-06-22', 'regular', 14);
INSERT INTO public.clientes VALUES (1434, 'Sofía', 'Castro Gutiérrez', 'sofía1434@gmail.com', '5510667294', 8, '2022-12-08', 'premium', 14);
INSERT INTO public.clientes VALUES (1458, 'Ricardo', 'Cruz Ramírez', 'ricardo1458@yahoo.com', '5522378195', 8, '2026-03-29', 'premium', 14);
INSERT INTO public.clientes VALUES (1487, 'Ana', 'López Gómez', 'ana1487@gmail.com', '5592150325', 8, '2025-12-29', 'regular', 14);
INSERT INTO public.clientes VALUES (1489, 'Alejandra', 'Vargas González', 'alejandra1489@yahoo.com', '5595564188', 8, '2024-12-05', 'regular', 14);
INSERT INTO public.clientes VALUES (1542, 'Patricia', 'Morales Castillo', 'patricia1542@yahoo.com', '5599833906', 8, '2023-05-30', 'premium', 14);
INSERT INTO public.clientes VALUES (1587, 'María', 'Herrera Martínez', 'maría1587@yahoo.com', '5529042679', 8, '2025-05-17', 'regular', 14);
INSERT INTO public.clientes VALUES (1595, 'Daniela', 'Rivera Torres', 'daniela1595@yahoo.com', '5543030652', 8, '2023-10-03', 'mayorista', 14);
INSERT INTO public.clientes VALUES (1604, 'Fernando', 'Jiménez Gómez', 'fernando1604@hotmail.com', '5568985501', 8, '2021-09-29', 'regular', 14);
INSERT INTO public.clientes VALUES (1609, 'Laura', 'Aguilar Castillo', 'laura1609@gmail.com', '5594701395', 8, '2023-03-24', 'regular', 14);
INSERT INTO public.clientes VALUES (1618, 'Roberto', 'Moreno Moreno', 'roberto1618@gmail.com', '5594667848', 8, '2025-11-29', 'mayorista', 14);
INSERT INTO public.clientes VALUES (1641, 'Alejandra', 'Flores Vargas', 'alejandra1641@yahoo.com', '5548809347', 8, '2026-04-15', 'premium', 14);
INSERT INTO public.clientes VALUES (1653, 'Liliana', 'Ramírez Rodríguez', 'liliana1653@hotmail.com', '5560337643', 8, '2022-01-15', 'vip', 14);
INSERT INTO public.clientes VALUES (1654, 'Adriana', 'Díaz Díaz', 'adriana1654@yahoo.com', '5568492621', 8, '2025-07-15', 'regular', 14);
INSERT INTO public.clientes VALUES (1657, 'Alejandra', 'González Sánchez', 'alejandra1657@gmail.com', '5559597432', 8, '2021-12-18', 'regular', 14);
INSERT INTO public.clientes VALUES (1662, 'Alejandro', 'Castillo Martínez', 'alejandro1662@hotmail.com', '5577559901', 8, '2023-06-15', 'premium', 14);
INSERT INTO public.clientes VALUES (1665, 'Daniela', 'Cruz Núñez', 'daniela1665@gmail.com', '5511828041', 8, '2023-12-11', 'regular', 14);
INSERT INTO public.clientes VALUES (1670, 'Alejandro', 'Hernández Hernández', 'alejandro1670@gmail.com', '5567611249', 8, '2024-09-24', 'premium', 14);
INSERT INTO public.clientes VALUES (1677, 'Elena', 'Flores Ramos', 'elena1677@gmail.com', '5529438263', 8, '2022-12-11', 'mayorista', 14);
INSERT INTO public.clientes VALUES (1685, 'Ramón', 'Castillo González', 'ramón1685@gmail.com', '5524046439', 8, '2021-09-26', 'regular', 14);
INSERT INTO public.clientes VALUES (1701, 'Sofía', 'Gómez Jiménez', 'sofía1701@gmail.com', '5589387274', 8, '2022-02-11', 'premium', 14);
INSERT INTO public.clientes VALUES (1784, 'Carlos', 'Ramírez Sánchez', 'carlos1784@gmail.com', '5582640278', 8, '2026-01-26', 'premium', 14);
INSERT INTO public.clientes VALUES (1794, 'Laura', 'Moreno Jiménez', 'laura1794@gmail.com', '5561038473', 8, '2025-03-17', 'regular', 14);
INSERT INTO public.clientes VALUES (1805, 'Alejandro', 'González Sánchez', 'alejandro1805@hotmail.com', '5525926737', 8, '2025-06-05', 'regular', 14);
INSERT INTO public.clientes VALUES (1828, 'Alejandra', 'Núñez Castillo', 'alejandra1828@gmail.com', '5581690032', 8, '2022-01-27', 'regular', 14);
INSERT INTO public.clientes VALUES (1834, 'Miguel', 'Ramírez Gómez', 'miguel1834@gmail.com', '5576005098', 8, '2025-11-09', 'mayorista', 14);
INSERT INTO public.clientes VALUES (1853, 'Fernando', 'Gómez Castro', 'fernando1853@hotmail.com', '5514533166', 8, '2021-08-20', 'regular', 14);
INSERT INTO public.clientes VALUES (1877, 'Valeria', 'Castillo Castillo', 'valeria1877@gmail.com', '5586380740', 8, '2024-04-21', 'premium', 14);
INSERT INTO public.clientes VALUES (1902, 'Patricia', 'González Martínez', 'patricia1902@yahoo.com', '5553017146', 8, '2023-02-17', 'mayorista', 14);
INSERT INTO public.clientes VALUES (1924, 'Mario', 'Ortega Jiménez', 'mario1924@gmail.com', '5592270938', 8, '2023-03-21', 'premium', 14);
INSERT INTO public.clientes VALUES (1944, 'Juan', 'Ortega Vega', 'juan1944@gmail.com', '5569733842', 8, '2022-12-05', 'regular', 14);
INSERT INTO public.clientes VALUES (1974, 'Sandra', 'Vega Vargas', 'sandra1974@yahoo.com', '5522448176', 8, '2023-12-07', 'regular', 14);
INSERT INTO public.clientes VALUES (23, 'Pablo', 'Ortega García', 'pablo23@yahoo.com', '5524289484', 5, '2026-01-14', 'regular', 15);
INSERT INTO public.clientes VALUES (51, 'Claudia', 'Cruz Vega', 'claudia51@gmail.com', '5546562845', 5, '2023-12-13', 'regular', 15);
INSERT INTO public.clientes VALUES (62, 'Juan', 'Hernández Ramírez', 'juan62@gmail.com', '5519581091', 5, '2023-10-23', 'regular', 15);
INSERT INTO public.clientes VALUES (72, 'Roberto', 'Gutiérrez Rivera', 'roberto72@yahoo.com', '5590353461', 5, '2025-07-18', 'regular', 15);
INSERT INTO public.clientes VALUES (79, 'Laura', 'Cruz Mendoza', 'laura79@gmail.com', '5558442674', 5, '2022-04-11', 'vip', 15);
INSERT INTO public.clientes VALUES (158, 'Carlos', 'Jiménez Gutiérrez', 'carlos158@gmail.com', '5537726346', 5, '2024-06-24', 'regular', 15);
INSERT INTO public.clientes VALUES (159, 'Sergio', 'Ortega Sánchez', 'sergio159@yahoo.com', '5555464764', 5, '2023-12-16', 'regular', 15);
INSERT INTO public.clientes VALUES (166, 'Luis', 'Flores Gutiérrez', 'luis166@gmail.com', '5550549608', 5, '2023-11-10', 'regular', 15);
INSERT INTO public.clientes VALUES (169, 'Claudia', 'Martínez Ortega', 'claudia169@gmail.com', '5553671508', 5, '2025-11-24', 'mayorista', 15);
INSERT INTO public.clientes VALUES (174, 'Sandra', 'Gómez Vega', 'sandra174@yahoo.com', '5559556257', 5, '2026-02-23', 'regular', 15);
INSERT INTO public.clientes VALUES (208, 'Claudia', 'Morales Díaz', 'claudia208@hotmail.com', '5519408620', 5, '2025-03-06', 'regular', 15);
INSERT INTO public.clientes VALUES (219, 'Pablo', 'Flores Martínez', 'pablo219@gmail.com', '5587304983', 5, '2025-09-03', 'regular', 15);
INSERT INTO public.clientes VALUES (248, 'Diego', 'Reyes Reyes', 'diego248@gmail.com', '5573104323', 5, '2022-08-22', 'mayorista', 15);
INSERT INTO public.clientes VALUES (253, 'Valeria', 'Morales Ortega', 'valeria253@gmail.com', '5581157706', 5, '2023-12-13', 'regular', 15);
INSERT INTO public.clientes VALUES (280, 'Adriana', 'Castillo Aguilar', 'adriana280@gmail.com', '5581416669', 5, '2022-07-04', 'premium', 15);
INSERT INTO public.clientes VALUES (304, 'David', 'Vega Gómez', 'david304@yahoo.com', '5533738978', 5, '2022-09-30', 'mayorista', 15);
INSERT INTO public.clientes VALUES (317, 'Valeria', 'Pérez Díaz', 'valeria317@hotmail.com', '5570831313', 5, '2025-06-07', 'mayorista', 15);
INSERT INTO public.clientes VALUES (329, 'Alejandro', 'Cruz Díaz', 'alejandro329@hotmail.com', '5575814814', 5, '2024-05-05', 'premium', 15);
INSERT INTO public.clientes VALUES (420, 'Alejandra', 'Gómez Sánchez', 'alejandra420@gmail.com', '5555499525', 5, '2026-03-10', 'nuevo', 15);
INSERT INTO public.clientes VALUES (433, 'Roberto', 'Mendoza Sánchez', 'roberto433@gmail.com', '5566875091', 5, '2023-11-29', 'regular', 15);
INSERT INTO public.clientes VALUES (436, 'Liliana', 'López Torres', 'liliana436@hotmail.com', '5528743541', 5, '2024-11-16', 'mayorista', 15);
INSERT INTO public.clientes VALUES (439, 'María', 'Castro García', 'maría439@gmail.com', '5565453803', 5, '2022-07-16', 'premium', 15);
INSERT INTO public.clientes VALUES (445, 'Fernanda', 'Martínez Vega', 'fernanda445@hotmail.com', '5532881048', 5, '2025-05-11', 'premium', 15);
INSERT INTO public.clientes VALUES (447, 'Sandra', 'Ramos Mendoza', 'sandra447@hotmail.com', '5513102778', 5, '2022-12-31', 'regular', 15);
INSERT INTO public.clientes VALUES (456, 'Sergio', 'Jiménez Vargas', 'sergio456@yahoo.com', '5517488001', 5, '2026-02-25', 'regular', 15);
INSERT INTO public.clientes VALUES (467, 'Roberto', 'Aguilar García', 'roberto467@yahoo.com', '5514028892', 5, '2025-10-19', 'regular', 15);
INSERT INTO public.clientes VALUES (516, 'Alejandra', 'Torres Herrera', 'alejandra516@gmail.com', '5523665188', 5, '2022-01-03', 'nuevo', 15);
INSERT INTO public.clientes VALUES (530, 'José', 'Herrera Núñez', 'josé530@gmail.com', '5589884158', 5, '2025-08-03', 'regular', 15);
INSERT INTO public.clientes VALUES (583, 'Ana', 'López Martínez', 'ana583@gmail.com', '5558796148', 5, '2025-06-25', 'regular', 15);
INSERT INTO public.clientes VALUES (584, 'María', 'Sánchez Torres', 'maría584@hotmail.com', '5549379055', 5, '2023-12-13', 'regular', 15);
INSERT INTO public.clientes VALUES (587, 'Isabel', 'González Ramos', 'isabel587@gmail.com', '5519980384', 5, '2025-01-05', 'regular', 15);
INSERT INTO public.clientes VALUES (594, 'Claudia', 'Martínez Reyes', 'claudia594@hotmail.com', '5547848959', 5, '2024-12-03', 'premium', 15);
INSERT INTO public.clientes VALUES (595, 'Carmen', 'Flores Herrera', 'carmen595@yahoo.com', '5581361168', 5, '2023-02-10', 'mayorista', 15);
INSERT INTO public.clientes VALUES (627, 'Fernando', 'Gutiérrez Ramos', 'fernando627@yahoo.com', '5566131539', 5, '2022-06-15', 'regular', 15);
INSERT INTO public.clientes VALUES (645, 'Alberto', 'García Mendoza', 'alberto645@gmail.com', '5524272571', 5, '2022-04-26', 'mayorista', 15);
INSERT INTO public.clientes VALUES (703, 'Carlos', 'Jiménez Núñez', 'carlos703@yahoo.com', '5593728466', 5, '2025-11-19', 'premium', 15);
INSERT INTO public.clientes VALUES (722, 'Juan', 'Ramírez Ramírez', 'juan722@hotmail.com', '5556782042', 5, '2022-10-15', 'regular', 15);
INSERT INTO public.clientes VALUES (743, 'Alejandro', 'Herrera Torres', 'alejandro743@gmail.com', '5557380159', 5, '2021-10-04', 'mayorista', 15);
INSERT INTO public.clientes VALUES (764, 'Pablo', 'Vargas Martínez', 'pablo764@gmail.com', '5594139980', 5, '2023-12-04', 'nuevo', 15);
INSERT INTO public.clientes VALUES (770, 'Carlos', 'Hernández Ramírez', 'carlos770@hotmail.com', '5577376391', 5, '2025-07-29', 'nuevo', 15);
INSERT INTO public.clientes VALUES (812, 'María', 'Núñez Hernández', 'maría812@hotmail.com', '5536330066', 5, '2023-01-13', 'mayorista', 15);
INSERT INTO public.clientes VALUES (828, 'Ana', 'Mendoza Martínez', 'ana828@gmail.com', '5548576654', 5, '2023-11-05', 'regular', 15);
INSERT INTO public.clientes VALUES (843, 'Liliana', 'Reyes Ortega', 'liliana843@gmail.com', '5566113763', 5, '2022-05-02', 'regular', 15);
INSERT INTO public.clientes VALUES (850, 'Carmen', 'Castro Cruz', 'carmen850@yahoo.com', '5545349744', 5, '2022-06-16', 'vip', 15);
INSERT INTO public.clientes VALUES (880, 'María', 'Mendoza Gómez', 'maría880@hotmail.com', '5557338677', 5, '2026-02-02', 'premium', 15);
INSERT INTO public.clientes VALUES (888, 'Ramón', 'Morales Gómez', 'ramón888@yahoo.com', '5564536785', 5, '2024-11-18', 'regular', 15);
INSERT INTO public.clientes VALUES (891, 'Juan', 'Mendoza Vargas', 'juan891@gmail.com', '5522802899', 5, '2025-06-30', 'regular', 15);
INSERT INTO public.clientes VALUES (895, 'Elena', 'Flores Cruz', 'elena895@gmail.com', '5579045775', 5, '2021-08-18', 'premium', 15);
INSERT INTO public.clientes VALUES (911, 'Andrés', 'Morales Castillo', 'andrés911@gmail.com', '5526138312', 5, '2024-01-02', 'premium', 15);
INSERT INTO public.clientes VALUES (929, 'Carmen', 'Hernández Aguilar', 'carmen929@gmail.com', '5530898267', 5, '2023-04-04', 'regular', 15);
INSERT INTO public.clientes VALUES (952, 'Verónica', 'Rivera Martínez', 'verónica952@gmail.com', '5566917057', 5, '2022-03-09', 'regular', 15);
INSERT INTO public.clientes VALUES (955, 'Daniela', 'Ramírez Díaz', 'daniela955@yahoo.com', '5513158189', 5, '2024-12-11', 'regular', 15);
INSERT INTO public.clientes VALUES (973, 'Liliana', 'Torres Rodríguez', 'liliana973@gmail.com', '5563836946', 5, '2024-02-26', 'regular', 15);
INSERT INTO public.clientes VALUES (985, 'Sandra', 'Morales Vega', 'sandra985@hotmail.com', '5544900534', 5, '2025-10-07', 'premium', 15);
INSERT INTO public.clientes VALUES (1010, 'Mario', 'Moreno Torres', 'mario1010@hotmail.com', '5555960407', 5, '2021-10-31', 'regular', 15);
INSERT INTO public.clientes VALUES (1076, 'Isabel', 'Martínez Herrera', 'isabel1076@gmail.com', '5575479724', 5, '2023-01-16', 'mayorista', 15);
INSERT INTO public.clientes VALUES (1143, 'Carlos', 'Díaz Mendoza', 'carlos1143@yahoo.com', '5565079123', 5, '2021-09-01', 'regular', 15);
INSERT INTO public.clientes VALUES (1165, 'Alejandra', 'Díaz Castillo', 'alejandra1165@hotmail.com', '5545109738', 5, '2025-05-12', 'regular', 15);
INSERT INTO public.clientes VALUES (1201, 'Verónica', 'Morales Rivera', 'verónica1201@hotmail.com', '5560335546', 5, '2026-04-20', 'premium', 15);
INSERT INTO public.clientes VALUES (1227, 'Miguel', 'Vega Ortega', 'miguel1227@gmail.com', '5568430949', 5, '2022-07-03', 'regular', 15);
INSERT INTO public.clientes VALUES (1228, 'Miguel', 'Torres Rivera', 'miguel1228@yahoo.com', '5573414545', 5, '2025-07-11', 'regular', 15);
INSERT INTO public.clientes VALUES (1230, 'Eduardo', 'Herrera Torres', 'eduardo1230@hotmail.com', '5576372099', 5, '2024-02-27', 'regular', 15);
INSERT INTO public.clientes VALUES (1243, 'David', 'Rivera García', 'david1243@yahoo.com', '5561506760', 5, '2022-02-16', 'regular', 15);
INSERT INTO public.clientes VALUES (1254, 'Mario', 'García Castillo', 'mario1254@gmail.com', '5559430818', 5, '2025-11-06', 'regular', 15);
INSERT INTO public.clientes VALUES (1300, 'Isabel', 'Aguilar Mendoza', 'isabel1300@yahoo.com', '5572080682', 5, '2022-03-06', 'regular', 15);
INSERT INTO public.clientes VALUES (1313, 'Francisco', 'Rodríguez García', 'francisco1313@gmail.com', '5529587604', 5, '2024-12-06', 'regular', 15);
INSERT INTO public.clientes VALUES (1354, 'Sofía', 'Vega Sánchez', 'sofía1354@gmail.com', '5562214255', 5, '2022-05-17', 'regular', 15);
INSERT INTO public.clientes VALUES (1360, 'Laura', 'Rivera Mendoza', 'laura1360@yahoo.com', '5535407437', 5, '2025-01-15', 'premium', 15);
INSERT INTO public.clientes VALUES (1367, 'Francisco', 'Gutiérrez Herrera', 'francisco1367@yahoo.com', '5576349917', 5, '2023-05-09', 'premium', 15);
INSERT INTO public.clientes VALUES (1373, 'Fernando', 'Ortega Mendoza', 'fernando1373@yahoo.com', '5551807281', 5, '2022-03-19', 'regular', 15);
INSERT INTO public.clientes VALUES (1395, 'Sofía', 'Sánchez Castro', 'sofía1395@hotmail.com', '5599717427', 5, '2021-08-24', 'premium', 15);
INSERT INTO public.clientes VALUES (1472, 'Mónica', 'López Castro', 'mónica1472@gmail.com', '5529485870', 5, '2022-01-19', 'regular', 15);
INSERT INTO public.clientes VALUES (1515, 'Alberto', 'Flores Vega', 'alberto1515@gmail.com', '5578747076', 5, '2022-11-30', 'regular', 15);
INSERT INTO public.clientes VALUES (1519, 'Mónica', 'Morales Jiménez', 'mónica1519@gmail.com', '5561603280', 5, '2025-08-08', 'mayorista', 15);
INSERT INTO public.clientes VALUES (1541, 'Ramón', 'Reyes Díaz', 'ramón1541@gmail.com', '5570368405', 5, '2023-12-19', 'regular', 15);
INSERT INTO public.clientes VALUES (1551, 'Gabriela', 'Pérez López', 'gabriela1551@gmail.com', '5533202743', 5, '2021-11-30', 'mayorista', 15);
INSERT INTO public.clientes VALUES (1569, 'Ana', 'Gutiérrez Pérez', 'ana1569@hotmail.com', '5545609515', 5, '2023-09-14', 'premium', 15);
INSERT INTO public.clientes VALUES (1597, 'Fernando', 'García Mendoza', 'fernando1597@gmail.com', '5565374574', 5, '2025-02-26', 'regular', 15);
INSERT INTO public.clientes VALUES (1629, 'Manuel', 'Vargas Sánchez', 'manuel1629@yahoo.com', '5584250773', 5, '2025-03-09', 'regular', 15);
INSERT INTO public.clientes VALUES (1643, 'Liliana', 'Herrera Gutiérrez', 'liliana1643@gmail.com', '5583377419', 5, '2022-05-10', 'regular', 15);
INSERT INTO public.clientes VALUES (1668, 'Fernanda', 'Vega Herrera', 'fernanda1668@gmail.com', '5571901789', 5, '2024-06-24', 'nuevo', 15);
INSERT INTO public.clientes VALUES (1680, 'Eduardo', 'Ramírez Ramírez', 'eduardo1680@hotmail.com', '5538221426', 5, '2021-07-07', 'regular', 15);
INSERT INTO public.clientes VALUES (1682, 'Valeria', 'Sánchez Vargas', 'valeria1682@gmail.com', '5529741221', 5, '2023-11-20', 'nuevo', 15);
INSERT INTO public.clientes VALUES (1686, 'Pablo', 'Sánchez Hernández', 'pablo1686@gmail.com', '5590291375', 5, '2022-04-02', 'nuevo', 15);
INSERT INTO public.clientes VALUES (1688, 'Elena', 'Ortega Mendoza', 'elena1688@hotmail.com', '5596714228', 5, '2023-08-23', 'regular', 15);
INSERT INTO public.clientes VALUES (1704, 'María', 'Reyes Sánchez', 'maría1704@gmail.com', '5584897527', 5, '2023-07-12', 'mayorista', 15);
INSERT INTO public.clientes VALUES (1708, 'Verónica', 'Aguilar Vega', 'verónica1708@yahoo.com', '5520557472', 5, '2021-08-26', 'regular', 15);
INSERT INTO public.clientes VALUES (1711, 'José', 'Martínez Gutiérrez', 'josé1711@gmail.com', '5596567889', 5, '2025-08-19', 'regular', 15);
INSERT INTO public.clientes VALUES (1749, 'Valeria', 'Castro Jiménez', 'valeria1749@gmail.com', '5533389105', 5, '2024-06-06', 'regular', 15);
INSERT INTO public.clientes VALUES (1756, 'Alejandro', 'González Castro', 'alejandro1756@yahoo.com', '5571656739', 5, '2025-01-06', 'regular', 15);
INSERT INTO public.clientes VALUES (1759, 'Ana', 'Rivera Sánchez', 'ana1759@hotmail.com', '5582613651', 5, '2024-02-15', 'regular', 15);
INSERT INTO public.clientes VALUES (1770, 'Claudia', 'Rodríguez Castillo', 'claudia1770@gmail.com', '5561233557', 5, '2023-07-19', 'regular', 15);
INSERT INTO public.clientes VALUES (1806, 'Gabriela', 'Hernández Moreno', 'gabriela1806@gmail.com', '5597330798', 5, '2023-03-04', 'regular', 15);
INSERT INTO public.clientes VALUES (1846, 'María', 'Cruz Flores', 'maría1846@gmail.com', '5581191483', 5, '2022-12-16', 'regular', 15);
INSERT INTO public.clientes VALUES (1886, 'José', 'Castro Rodríguez', 'josé1886@gmail.com', '5588077298', 5, '2022-02-16', 'regular', 15);
INSERT INTO public.clientes VALUES (1903, 'Fernando', 'Núñez Pérez', 'fernando1903@gmail.com', '5510202363', 5, '2021-11-12', 'regular', 15);
INSERT INTO public.clientes VALUES (1916, 'Sofía', 'Castillo Rivera', 'sofía1916@gmail.com', '5568443796', 5, '2024-02-08', 'regular', 15);
INSERT INTO public.clientes VALUES (1922, 'Sergio', 'Castillo López', 'sergio1922@yahoo.com', '5543948447', 5, '2025-03-24', 'premium', 15);
INSERT INTO public.clientes VALUES (1928, 'Roberto', 'Ramírez Sánchez', 'roberto1928@gmail.com', '5541533557', 5, '2022-06-19', 'regular', 15);
INSERT INTO public.clientes VALUES (1941, 'Pablo', 'Gómez Rivera', 'pablo1941@gmail.com', '5563586934', 5, '2024-04-15', 'premium', 15);
INSERT INTO public.clientes VALUES (1949, 'Sandra', 'Vargas Flores', 'sandra1949@hotmail.com', '5581999061', 5, '2025-11-05', 'nuevo', 15);
INSERT INTO public.clientes VALUES (1953, 'Alejandro', 'Rivera Reyes', 'alejandro1953@yahoo.com', '5584662900', 5, '2023-03-26', 'regular', 15);
INSERT INTO public.clientes VALUES (1967, 'Roberto', 'Martínez Vega', 'roberto1967@gmail.com', '5541106335', 5, '2025-03-07', 'regular', 15);
INSERT INTO public.clientes VALUES (1997, 'Manuel', 'Martínez Herrera', 'manuel1997@yahoo.com', '5575992723', 5, '2025-12-30', 'regular', 15);
INSERT INTO public.clientes VALUES (28, 'Valeria', 'López Gutiérrez', 'valeria28@gmail.com', '5573962190', 5, '2024-06-17', 'regular', 16);
INSERT INTO public.clientes VALUES (41, 'Alejandro', 'Morales Aguilar', 'alejandro41@gmail.com', '5570378491', 5, '2024-12-26', 'regular', 16);
INSERT INTO public.clientes VALUES (44, 'Mónica', 'Vargas González', 'mónica44@gmail.com', '5595977279', 5, '2024-01-30', 'premium', 16);
INSERT INTO public.clientes VALUES (59, 'Andrés', 'Ramírez Castillo', 'andrés59@gmail.com', '5535204672', 5, '2026-05-03', 'regular', 16);
INSERT INTO public.clientes VALUES (87, 'Gabriela', 'García Torres', 'gabriela87@gmail.com', '5538833029', 5, '2026-04-28', 'premium', 16);
INSERT INTO public.clientes VALUES (106, 'Pablo', 'Sánchez Gómez', 'pablo106@gmail.com', '5523368583', 5, '2023-09-23', 'mayorista', 16);
INSERT INTO public.clientes VALUES (114, 'Patricia', 'Vargas Núñez', 'patricia114@gmail.com', '5531212832', 5, '2026-01-24', 'regular', 16);
INSERT INTO public.clientes VALUES (146, 'Ramón', 'Jiménez García', 'ramón146@gmail.com', '5536040330', 5, '2021-10-08', 'regular', 16);
INSERT INTO public.clientes VALUES (167, 'Alberto', 'Sánchez Gutiérrez', 'alberto167@yahoo.com', '5518866414', 5, '2025-04-11', 'mayorista', 16);
INSERT INTO public.clientes VALUES (170, 'Pablo', 'López Jiménez', 'pablo170@hotmail.com', '5560856575', 5, '2023-09-03', 'premium', 16);
INSERT INTO public.clientes VALUES (209, 'Claudia', 'Martínez Ortega', 'claudia209@gmail.com', '5558173202', 5, '2022-08-15', 'regular', 16);
INSERT INTO public.clientes VALUES (291, 'Eduardo', 'Gómez Díaz', 'eduardo291@yahoo.com', '5525145863', 5, '2025-10-01', 'regular', 16);
INSERT INTO public.clientes VALUES (308, 'Eduardo', 'Rivera Mendoza', 'eduardo308@gmail.com', '5513610435', 5, '2024-04-23', 'regular', 16);
INSERT INTO public.clientes VALUES (312, 'Ramón', 'Martínez Mendoza', 'ramón312@hotmail.com', '5537636546', 5, '2023-08-29', 'regular', 16);
INSERT INTO public.clientes VALUES (315, 'Laura', 'Castillo Vega', 'laura315@gmail.com', '5589438729', 5, '2024-11-29', 'regular', 16);
INSERT INTO public.clientes VALUES (337, 'José', 'Rivera Díaz', 'josé337@gmail.com', '5583514771', 5, '2023-11-26', 'premium', 16);
INSERT INTO public.clientes VALUES (361, 'Carlos', 'Flores Hernández', 'carlos361@gmail.com', '5570814320', 5, '2022-05-05', 'nuevo', 16);
INSERT INTO public.clientes VALUES (372, 'Roberto', 'Aguilar Gómez', 'roberto372@yahoo.com', '5549949573', 5, '2023-02-25', 'premium', 16);
INSERT INTO public.clientes VALUES (419, 'Mónica', 'Herrera Cruz', 'mónica419@gmail.com', '5529996104', 5, '2025-12-11', 'premium', 16);
INSERT INTO public.clientes VALUES (466, 'Ricardo', 'Castillo Sánchez', 'ricardo466@yahoo.com', '5574524663', 5, '2021-12-01', 'premium', 16);
INSERT INTO public.clientes VALUES (476, 'Sandra', 'Rivera Morales', 'sandra476@gmail.com', '5534024774', 5, '2022-06-13', 'regular', 16);
INSERT INTO public.clientes VALUES (498, 'Mónica', 'López Aguilar', 'mónica498@hotmail.com', '5580579265', 5, '2023-04-03', 'mayorista', 16);
INSERT INTO public.clientes VALUES (513, 'Roberto', 'Ramos Rodríguez', 'roberto513@hotmail.com', '5553908184', 5, '2023-04-17', 'premium', 16);
INSERT INTO public.clientes VALUES (514, 'Verónica', 'Gómez Díaz', 'verónica514@yahoo.com', '5557858864', 5, '2025-06-21', 'regular', 16);
INSERT INTO public.clientes VALUES (551, 'Claudia', 'Reyes Díaz', 'claudia551@gmail.com', '5510419981', 5, '2026-05-08', 'premium', 16);
INSERT INTO public.clientes VALUES (591, 'Alejandro', 'Martínez Gutiérrez', 'alejandro591@hotmail.com', '5518852915', 5, '2022-11-08', 'regular', 16);
INSERT INTO public.clientes VALUES (613, 'Isabel', 'Martínez Díaz', 'isabel613@yahoo.com', '5527103900', 5, '2022-03-26', 'premium', 16);
INSERT INTO public.clientes VALUES (636, 'Verónica', 'Ramírez Ramos', 'verónica636@hotmail.com', '5549580182', 5, '2026-02-14', 'premium', 16);
INSERT INTO public.clientes VALUES (687, 'Pablo', 'Herrera Díaz', 'pablo687@yahoo.com', '5552585253', 5, '2023-01-21', 'regular', 16);
INSERT INTO public.clientes VALUES (694, 'Laura', 'Ramos Moreno', 'laura694@gmail.com', '5529410197', 5, '2022-09-20', 'nuevo', 16);
INSERT INTO public.clientes VALUES (719, 'Ramón', 'Vargas Jiménez', 'ramón719@gmail.com', '5525731275', 5, '2024-07-01', 'regular', 16);
INSERT INTO public.clientes VALUES (725, 'Claudia', 'Díaz Castro', 'claudia725@hotmail.com', '5546463456', 5, '2022-12-14', 'regular', 16);
INSERT INTO public.clientes VALUES (731, 'Laura', 'Ortega Castro', 'laura731@gmail.com', '5568412302', 5, '2021-11-19', 'regular', 16);
INSERT INTO public.clientes VALUES (742, 'Francisco', 'Sánchez Ortega', 'francisco742@yahoo.com', '5547653656', 5, '2022-02-10', 'premium', 16);
INSERT INTO public.clientes VALUES (761, 'Claudia', 'Ramírez Rivera', 'claudia761@hotmail.com', '5550417525', 5, '2023-07-17', 'premium', 16);
INSERT INTO public.clientes VALUES (794, 'Francisco', 'Herrera Moreno', 'francisco794@gmail.com', '5527370722', 5, '2023-02-22', 'nuevo', 16);
INSERT INTO public.clientes VALUES (801, 'Daniela', 'Herrera Díaz', 'daniela801@gmail.com', '5519658994', 5, '2025-05-28', 'premium', 16);
INSERT INTO public.clientes VALUES (830, 'Alejandro', 'López Sánchez', 'alejandro830@gmail.com', '5549704948', 5, '2023-03-30', 'regular', 16);
INSERT INTO public.clientes VALUES (918, 'Luis', 'Hernández Cruz', 'luis918@gmail.com', '5518365183', 5, '2025-11-24', 'mayorista', 16);
INSERT INTO public.clientes VALUES (919, 'Fernando', 'Vargas Jiménez', 'fernando919@gmail.com', '5554649538', 5, '2022-06-20', 'regular', 16);
INSERT INTO public.clientes VALUES (932, 'Sandra', 'Moreno Vargas', 'sandra932@yahoo.com', '5588761749', 5, '2024-05-10', 'regular', 16);
INSERT INTO public.clientes VALUES (943, 'Luis', 'Gómez González', 'luis943@hotmail.com', '5563671462', 5, '2024-11-09', 'mayorista', 16);
INSERT INTO public.clientes VALUES (945, 'Elena', 'Castro Jiménez', 'elena945@yahoo.com', '5558624457', 5, '2023-08-20', 'mayorista', 16);
INSERT INTO public.clientes VALUES (965, 'Alberto', 'Mendoza Vargas', 'alberto965@yahoo.com', '5512425706', 5, '2025-03-16', 'regular', 16);
INSERT INTO public.clientes VALUES (995, 'Eduardo', 'Vargas González', 'eduardo995@gmail.com', '5577255871', 5, '2023-07-06', 'regular', 16);
INSERT INTO public.clientes VALUES (1017, 'Alejandro', 'Torres Aguilar', 'alejandro1017@yahoo.com', '5561325709', 5, '2023-04-26', 'regular', 16);
INSERT INTO public.clientes VALUES (1049, 'María', 'Torres Morales', 'maría1049@hotmail.com', '5527206526', 5, '2022-10-06', 'regular', 16);
INSERT INTO public.clientes VALUES (1057, 'Alejandro', 'Vargas Herrera', 'alejandro1057@gmail.com', '5555278396', 5, '2025-05-26', 'regular', 16);
INSERT INTO public.clientes VALUES (1069, 'Ramón', 'Moreno González', 'ramón1069@yahoo.com', '5546972997', 5, '2026-05-20', 'premium', 16);
INSERT INTO public.clientes VALUES (1083, 'Roberto', 'Pérez Gutiérrez', 'roberto1083@gmail.com', '5583454371', 5, '2022-04-17', 'regular', 16);
INSERT INTO public.clientes VALUES (1095, 'Elena', 'Flores Gutiérrez', 'elena1095@hotmail.com', '5528051318', 5, '2021-08-15', 'mayorista', 16);
INSERT INTO public.clientes VALUES (1104, 'Carmen', 'García Vargas', 'carmen1104@gmail.com', '5526039031', 5, '2025-12-11', 'regular', 16);
INSERT INTO public.clientes VALUES (1122, 'Ana', 'Núñez Pérez', 'ana1122@hotmail.com', '5539738238', 5, '2026-01-13', 'premium', 16);
INSERT INTO public.clientes VALUES (1179, 'Eduardo', 'Ramos Mendoza', 'eduardo1179@yahoo.com', '5575644207', 5, '2023-05-20', 'nuevo', 16);
INSERT INTO public.clientes VALUES (1189, 'Andrés', 'Rivera Díaz', 'andrés1189@hotmail.com', '5541331564', 5, '2022-11-21', 'vip', 16);
INSERT INTO public.clientes VALUES (1199, 'Patricia', 'Cruz Vargas', 'patricia1199@yahoo.com', '5569611364', 5, '2025-11-03', 'vip', 16);
INSERT INTO public.clientes VALUES (1200, 'Fernando', 'Castillo Jiménez', 'fernando1200@yahoo.com', '5527251767', 5, '2026-05-08', 'regular', 16);
INSERT INTO public.clientes VALUES (1217, 'Roberto', 'Vega Flores', 'roberto1217@hotmail.com', '5562153213', 5, '2023-11-17', 'nuevo', 16);
INSERT INTO public.clientes VALUES (1271, 'Isabel', 'Vega Torres', 'isabel1271@gmail.com', '5540580466', 5, '2024-08-17', 'vip', 16);
INSERT INTO public.clientes VALUES (1327, 'Alejandra', 'Gómez Aguilar', 'alejandra1327@yahoo.com', '5514106460', 5, '2024-05-14', 'regular', 16);
INSERT INTO public.clientes VALUES (1338, 'Patricia', 'Martínez Cruz', 'patricia1338@hotmail.com', '5547913187', 5, '2022-08-03', 'regular', 16);
INSERT INTO public.clientes VALUES (1342, 'Juan', 'Aguilar Flores', 'juan1342@gmail.com', '5566686642', 5, '2022-03-25', 'regular', 16);
INSERT INTO public.clientes VALUES (1368, 'Alberto', 'Mendoza Hernández', 'alberto1368@gmail.com', '5595641687', 5, '2025-01-24', 'regular', 16);
INSERT INTO public.clientes VALUES (1372, 'Adriana', 'Vega Martínez', 'adriana1372@yahoo.com', '5545460303', 5, '2024-08-29', 'mayorista', 16);
INSERT INTO public.clientes VALUES (1386, 'Juan', 'Ramos Vargas', 'juan1386@gmail.com', '5559493703', 5, '2024-02-21', 'regular', 16);
INSERT INTO public.clientes VALUES (1430, 'Luis', 'Sánchez Díaz', 'luis1430@yahoo.com', '5540580804', 5, '2024-05-16', 'premium', 16);
INSERT INTO public.clientes VALUES (1446, 'Eduardo', 'Pérez Aguilar', 'eduardo1446@gmail.com', '5588802121', 5, '2021-06-28', 'premium', 16);
INSERT INTO public.clientes VALUES (1463, 'Fernando', 'Martínez Rodríguez', 'fernando1463@gmail.com', '5544094915', 5, '2024-06-13', 'regular', 16);
INSERT INTO public.clientes VALUES (1486, 'Sandra', 'Pérez López', 'sandra1486@yahoo.com', '5592126467', 5, '2021-10-29', 'nuevo', 16);
INSERT INTO public.clientes VALUES (1544, 'Alberto', 'Núñez Martínez', 'alberto1544@gmail.com', '5567459585', 5, '2026-04-20', 'regular', 16);
INSERT INTO public.clientes VALUES (1546, 'Ricardo', 'González Vargas', 'ricardo1546@gmail.com', '5525533493', 5, '2021-07-29', 'regular', 16);
INSERT INTO public.clientes VALUES (1559, 'Liliana', 'Vargas Ortega', 'liliana1559@gmail.com', '5513928091', 5, '2025-06-04', 'regular', 16);
INSERT INTO public.clientes VALUES (1599, 'Mónica', 'Martínez González', 'mónica1599@gmail.com', '5524519890', 5, '2022-06-30', 'regular', 16);
INSERT INTO public.clientes VALUES (1647, 'Francisco', 'Gómez Ortega', 'francisco1647@hotmail.com', '5522119306', 5, '2024-07-15', 'regular', 16);
INSERT INTO public.clientes VALUES (1667, 'Ana', 'Pérez Reyes', 'ana1667@hotmail.com', '5574252953', 5, '2025-03-02', 'regular', 16);
INSERT INTO public.clientes VALUES (1714, 'Manuel', 'Rivera Moreno', 'manuel1714@yahoo.com', '5516089650', 5, '2024-01-02', 'premium', 16);
INSERT INTO public.clientes VALUES (1723, 'Miguel', 'Cruz López', 'miguel1723@gmail.com', '5589678144', 5, '2022-08-18', 'regular', 16);
INSERT INTO public.clientes VALUES (1730, 'Daniela', 'Cruz Ramírez', 'daniela1730@gmail.com', '5542474862', 5, '2021-07-23', 'vip', 16);
INSERT INTO public.clientes VALUES (1761, 'Gabriela', 'Castro Moreno', 'gabriela1761@hotmail.com', '5571275566', 5, '2022-03-20', 'mayorista', 16);
INSERT INTO public.clientes VALUES (1799, 'Alejandro', 'Ramos Herrera', 'alejandro1799@gmail.com', '5595325945', 5, '2025-04-29', 'regular', 16);
INSERT INTO public.clientes VALUES (1802, 'Carlos', 'Gutiérrez Castillo', 'carlos1802@gmail.com', '5586864684', 5, '2021-09-28', 'vip', 16);
INSERT INTO public.clientes VALUES (1810, 'Mónica', 'López Núñez', 'mónica1810@gmail.com', '5547695226', 5, '2025-07-26', 'regular', 16);
INSERT INTO public.clientes VALUES (1832, 'Miguel', 'Gómez Rodríguez', 'miguel1832@gmail.com', '5592937486', 5, '2025-04-05', 'regular', 16);
INSERT INTO public.clientes VALUES (1837, 'Ramón', 'Aguilar Ramos', 'ramón1837@yahoo.com', '5518490284', 5, '2022-05-07', 'regular', 16);
INSERT INTO public.clientes VALUES (1839, 'Isabel', 'López López', 'isabel1839@gmail.com', '5555932113', 5, '2024-01-16', 'regular', 16);
INSERT INTO public.clientes VALUES (1840, 'Laura', 'Ortega Ramos', 'laura1840@hotmail.com', '5589313901', 5, '2023-12-01', 'regular', 16);
INSERT INTO public.clientes VALUES (1856, 'Daniela', 'González Ortega', 'daniela1856@gmail.com', '5539895678', 5, '2025-04-16', 'regular', 16);
INSERT INTO public.clientes VALUES (1917, 'Gabriela', 'Castro García', 'gabriela1917@hotmail.com', '5581247910', 5, '2024-12-22', 'regular', 16);
INSERT INTO public.clientes VALUES (30, 'Isabel', 'Pérez Sánchez', 'isabel30@yahoo.com', '5593026670', 7, '2025-07-27', 'premium', 17);
INSERT INTO public.clientes VALUES (35, 'Carlos', 'García Moreno', 'carlos35@hotmail.com', '5553679307', 7, '2023-01-04', 'mayorista', 17);
INSERT INTO public.clientes VALUES (54, 'Sergio', 'García García', 'sergio54@gmail.com', '5528293937', 7, '2024-11-01', 'regular', 17);
INSERT INTO public.clientes VALUES (84, 'Adriana', 'Cruz Núñez', 'adriana84@yahoo.com', '5553574336', 7, '2024-02-18', 'premium', 17);
INSERT INTO public.clientes VALUES (105, 'Laura', 'Gómez Moreno', 'laura105@hotmail.com', '5598597172', 7, '2021-08-06', 'regular', 17);
INSERT INTO public.clientes VALUES (108, 'Valeria', 'Morales Gómez', 'valeria108@gmail.com', '5512465878', 7, '2022-08-10', 'regular', 17);
INSERT INTO public.clientes VALUES (173, 'Ramón', 'Mendoza Núñez', 'ramón173@gmail.com', '5568348074', 7, '2025-12-11', 'regular', 17);
INSERT INTO public.clientes VALUES (181, 'Francisco', 'Ramírez Díaz', 'francisco181@gmail.com', '5587356703', 7, '2026-04-04', 'nuevo', 17);
INSERT INTO public.clientes VALUES (241, 'Mónica', 'Cruz Herrera', 'mónica241@hotmail.com', '5534822996', 7, '2022-12-06', 'regular', 17);
INSERT INTO public.clientes VALUES (244, 'Sandra', 'Núñez Moreno', 'sandra244@yahoo.com', '5561399349', 7, '2023-11-01', 'premium', 17);
INSERT INTO public.clientes VALUES (264, 'Alberto', 'Jiménez Reyes', 'alberto264@gmail.com', '5599491869', 7, '2024-03-19', 'regular', 17);
INSERT INTO public.clientes VALUES (275, 'Andrés', 'Castro Castillo', 'andrés275@yahoo.com', '5546597195', 7, '2024-02-03', 'premium', 17);
INSERT INTO public.clientes VALUES (294, 'Alejandra', 'Pérez Vega', 'alejandra294@hotmail.com', '5573844258', 7, '2025-06-09', 'regular', 17);
INSERT INTO public.clientes VALUES (298, 'Isabel', 'Herrera Mendoza', 'isabel298@gmail.com', '5563718703', 7, '2023-10-11', 'premium', 17);
INSERT INTO public.clientes VALUES (343, 'Ana', 'Gómez Jiménez', 'ana343@yahoo.com', '5521953600', 7, '2025-06-28', 'vip', 17);
INSERT INTO public.clientes VALUES (386, 'Fernanda', 'Díaz Aguilar', 'fernanda386@gmail.com', '5597577092', 7, '2021-12-24', 'regular', 17);
INSERT INTO public.clientes VALUES (396, 'Francisco', 'Rodríguez López', 'francisco396@hotmail.com', '5565701512', 7, '2022-11-30', 'premium', 17);
INSERT INTO public.clientes VALUES (402, 'Verónica', 'Jiménez Mendoza', 'verónica402@gmail.com', '5569343538', 7, '2021-06-20', 'mayorista', 17);
INSERT INTO public.clientes VALUES (409, 'Ricardo', 'Martínez Flores', 'ricardo409@gmail.com', '5535844329', 7, '2023-11-24', 'regular', 17);
INSERT INTO public.clientes VALUES (415, 'Ramón', 'Torres Hernández', 'ramón415@gmail.com', '5525803092', 7, '2024-09-25', 'nuevo', 17);
INSERT INTO public.clientes VALUES (441, 'Mónica', 'Moreno Martínez', 'mónica441@hotmail.com', '5590706579', 7, '2024-04-10', 'regular', 17);
INSERT INTO public.clientes VALUES (461, 'Ana', 'González Torres', 'ana461@gmail.com', '5578870570', 7, '2024-09-12', 'regular', 17);
INSERT INTO public.clientes VALUES (480, 'Francisco', 'Jiménez Flores', 'francisco480@yahoo.com', '5564888712', 7, '2021-12-07', 'regular', 17);
INSERT INTO public.clientes VALUES (499, 'Ramón', 'Hernández Ramos', 'ramón499@hotmail.com', '5571244438', 7, '2022-07-08', 'mayorista', 17);
INSERT INTO public.clientes VALUES (503, 'Rosa', 'Núñez Morales', 'rosa503@hotmail.com', '5526271298', 7, '2026-01-06', 'premium', 17);
INSERT INTO public.clientes VALUES (511, 'Carlos', 'Hernández Herrera', 'carlos511@yahoo.com', '5543514137', 7, '2025-02-08', 'regular', 17);
INSERT INTO public.clientes VALUES (528, 'Fernando', 'Ramírez Vega', 'fernando528@gmail.com', '5520739561', 7, '2024-03-18', 'regular', 17);
INSERT INTO public.clientes VALUES (532, 'Rosa', 'González Núñez', 'rosa532@yahoo.com', '5577202790', 7, '2023-09-09', 'regular', 17);
INSERT INTO public.clientes VALUES (542, 'Sandra', 'Díaz Vargas', 'sandra542@yahoo.com', '5533676181', 7, '2025-05-26', 'premium', 17);
INSERT INTO public.clientes VALUES (607, 'Mónica', 'Castro Jiménez', 'mónica607@gmail.com', '5517717080', 7, '2026-05-30', 'premium', 17);
INSERT INTO public.clientes VALUES (608, 'Eduardo', 'Martínez García', 'eduardo608@hotmail.com', '5563964665', 7, '2026-05-24', 'regular', 17);
INSERT INTO public.clientes VALUES (635, 'Rosa', 'Gutiérrez Martínez', 'rosa635@yahoo.com', '5591223137', 7, '2024-08-16', 'regular', 17);
INSERT INTO public.clientes VALUES (654, 'Isabel', 'González López', 'isabel654@yahoo.com', '5561676160', 7, '2024-08-27', 'regular', 17);
INSERT INTO public.clientes VALUES (672, 'Miguel', 'Flores López', 'miguel672@gmail.com', '5511137995', 7, '2022-03-25', 'regular', 17);
INSERT INTO public.clientes VALUES (713, 'Laura', 'Ortega Gómez', 'laura713@hotmail.com', '5570895423', 7, '2025-05-25', 'regular', 17);
INSERT INTO public.clientes VALUES (728, 'David', 'Díaz Mendoza', 'david728@yahoo.com', '5538881529', 7, '2024-05-11', 'regular', 17);
INSERT INTO public.clientes VALUES (763, 'Patricia', 'Rivera Morales', 'patricia763@hotmail.com', '5567810328', 7, '2025-04-15', 'premium', 17);
INSERT INTO public.clientes VALUES (814, 'Andrés', 'Martínez Castro', 'andrés814@gmail.com', '5559353022', 7, '2025-05-11', 'regular', 17);
INSERT INTO public.clientes VALUES (846, 'Elena', 'Cruz Ramos', 'elena846@gmail.com', '5565019311', 7, '2025-12-30', 'regular', 17);
INSERT INTO public.clientes VALUES (862, 'Verónica', 'Gutiérrez Mendoza', 'verónica862@yahoo.com', '5513459771', 7, '2025-04-21', 'regular', 17);
INSERT INTO public.clientes VALUES (872, 'Diego', 'Morales Mendoza', 'diego872@gmail.com', '5590241009', 7, '2023-05-26', 'regular', 17);
INSERT INTO public.clientes VALUES (889, 'Verónica', 'Reyes Sánchez', 'verónica889@hotmail.com', '5562834161', 7, '2022-03-02', 'regular', 17);
INSERT INTO public.clientes VALUES (909, 'Elena', 'Gutiérrez Gómez', 'elena909@yahoo.com', '5573683359', 7, '2024-09-11', 'mayorista', 17);
INSERT INTO public.clientes VALUES (956, 'Carlos', 'Cruz Flores', 'carlos956@yahoo.com', '5524989876', 7, '2022-05-05', 'regular', 17);
INSERT INTO public.clientes VALUES (991, 'Miguel', 'Herrera González', 'miguel991@yahoo.com', '5539665008', 7, '2023-04-14', 'regular', 17);
INSERT INTO public.clientes VALUES (1014, 'Elena', 'Núñez Ramírez', 'elena1014@hotmail.com', '5550750934', 7, '2025-08-19', 'regular', 17);
INSERT INTO public.clientes VALUES (1020, 'Fernanda', 'Hernández Martínez', 'fernanda1020@yahoo.com', '5582195140', 7, '2023-12-27', 'vip', 17);
INSERT INTO public.clientes VALUES (1023, 'Carlos', 'González Herrera', 'carlos1023@gmail.com', '5552139163', 7, '2022-02-10', 'regular', 17);
INSERT INTO public.clientes VALUES (1055, 'Elena', 'Rodríguez Gómez', 'elena1055@hotmail.com', '5574940557', 7, '2025-05-23', 'premium', 17);
INSERT INTO public.clientes VALUES (1084, 'Roberto', 'Vega Morales', 'roberto1084@gmail.com', '5554796947', 7, '2022-12-27', 'regular', 17);
INSERT INTO public.clientes VALUES (1086, 'Fernanda', 'Pérez Ramírez', 'fernanda1086@gmail.com', '5575154738', 7, '2024-07-21', 'mayorista', 17);
INSERT INTO public.clientes VALUES (1099, 'Daniela', 'Morales Vega', 'daniela1099@gmail.com', '5518559981', 7, '2026-01-29', 'nuevo', 17);
INSERT INTO public.clientes VALUES (1146, 'Alberto', 'Rivera Castro', 'alberto1146@hotmail.com', '5564788762', 7, '2022-11-01', 'regular', 17);
INSERT INTO public.clientes VALUES (1176, 'Isabel', 'Torres Herrera', 'isabel1176@yahoo.com', '5576293229', 7, '2022-05-02', 'regular', 17);
INSERT INTO public.clientes VALUES (1188, 'Sergio', 'Flores Ramos', 'sergio1188@hotmail.com', '5527197789', 7, '2023-04-11', 'nuevo', 17);
INSERT INTO public.clientes VALUES (1220, 'Carmen', 'Martínez Hernández', 'carmen1220@hotmail.com', '5566796333', 7, '2026-01-07', 'regular', 17);
INSERT INTO public.clientes VALUES (1255, 'Mario', 'Gutiérrez Castillo', 'mario1255@yahoo.com', '5545269140', 7, '2023-10-13', 'regular', 17);
INSERT INTO public.clientes VALUES (1258, 'Fernando', 'González Torres', 'fernando1258@hotmail.com', '5511502382', 7, '2026-02-09', 'regular', 17);
INSERT INTO public.clientes VALUES (1345, 'Carlos', 'Vargas Rivera', 'carlos1345@gmail.com', '5592527384', 7, '2024-07-21', 'regular', 17);
INSERT INTO public.clientes VALUES (1362, 'Verónica', 'Pérez Morales', 'verónica1362@gmail.com', '5594767925', 7, '2026-04-11', 'regular', 17);
INSERT INTO public.clientes VALUES (1424, 'Luis', 'Cruz Mendoza', 'luis1424@gmail.com', '5596912383', 7, '2026-02-14', 'premium', 17);
INSERT INTO public.clientes VALUES (1432, 'Alberto', 'Vega Jiménez', 'alberto1432@gmail.com', '5592958783', 7, '2022-01-13', 'nuevo', 17);
INSERT INTO public.clientes VALUES (1459, 'Gabriela', 'González Reyes', 'gabriela1459@gmail.com', '5515751690', 7, '2022-11-28', 'regular', 17);
INSERT INTO public.clientes VALUES (1494, 'José', 'Núñez González', 'josé1494@gmail.com', '5552171230', 7, '2022-06-08', 'vip', 17);
INSERT INTO public.clientes VALUES (1497, 'Francisco', 'Moreno Flores', 'francisco1497@yahoo.com', '5586965229', 7, '2024-05-02', 'regular', 17);
INSERT INTO public.clientes VALUES (1522, 'Elena', 'Rivera Hernández', 'elena1522@gmail.com', '5514012808', 7, '2022-03-17', 'nuevo', 17);
INSERT INTO public.clientes VALUES (1537, 'Luis', 'Torres Herrera', 'luis1537@gmail.com', '5514723415', 7, '2025-06-13', 'regular', 17);
INSERT INTO public.clientes VALUES (1574, 'Laura', 'García Herrera', 'laura1574@hotmail.com', '5588769634', 7, '2022-09-21', 'regular', 17);
INSERT INTO public.clientes VALUES (1586, 'María', 'Mendoza Núñez', 'maría1586@hotmail.com', '5590020978', 7, '2025-09-22', 'premium', 17);
INSERT INTO public.clientes VALUES (1602, 'Fernando', 'García García', 'fernando1602@gmail.com', '5534390832', 7, '2023-06-19', 'mayorista', 17);
INSERT INTO public.clientes VALUES (1637, 'José', 'Pérez Aguilar', 'josé1637@hotmail.com', '5543324269', 7, '2022-09-26', 'premium', 17);
INSERT INTO public.clientes VALUES (1649, 'Daniela', 'Sánchez Castillo', 'daniela1649@gmail.com', '5515971136', 7, '2025-10-22', 'regular', 17);
INSERT INTO public.clientes VALUES (1651, 'Juan', 'Martínez Reyes', 'juan1651@gmail.com', '5553976954', 7, '2023-01-31', 'regular', 17);
INSERT INTO public.clientes VALUES (1679, 'Mónica', 'Morales Reyes', 'mónica1679@hotmail.com', '5567040474', 7, '2025-06-24', 'regular', 17);
INSERT INTO public.clientes VALUES (1709, 'Liliana', 'Rivera Núñez', 'liliana1709@yahoo.com', '5571872428', 7, '2024-07-24', 'regular', 17);
INSERT INTO public.clientes VALUES (1713, 'Mónica', 'Hernández Mendoza', 'mónica1713@gmail.com', '5545478283', 7, '2024-12-13', 'vip', 17);
INSERT INTO public.clientes VALUES (1742, 'Ana', 'López Flores', 'ana1742@yahoo.com', '5534574296', 7, '2021-12-20', 'premium', 17);
INSERT INTO public.clientes VALUES (1778, 'Juan', 'Sánchez Vega', 'juan1778@hotmail.com', '5576844055', 7, '2021-09-04', 'vip', 17);
INSERT INTO public.clientes VALUES (1780, 'Miguel', 'Díaz Ramírez', 'miguel1780@yahoo.com', '5517709617', 7, '2022-06-08', 'premium', 17);
INSERT INTO public.clientes VALUES (1819, 'Roberto', 'Núñez Hernández', 'roberto1819@yahoo.com', '5593541727', 7, '2024-06-23', 'premium', 17);
INSERT INTO public.clientes VALUES (1821, 'Elena', 'Rivera González', 'elena1821@gmail.com', '5592593597', 7, '2021-10-21', 'mayorista', 17);
INSERT INTO public.clientes VALUES (1866, 'Diego', 'Herrera Hernández', 'diego1866@yahoo.com', '5579601571', 7, '2025-05-13', 'regular', 17);
INSERT INTO public.clientes VALUES (1909, 'Eduardo', 'Ortega González', 'eduardo1909@yahoo.com', '5563602194', 7, '2023-05-27', 'regular', 17);
INSERT INTO public.clientes VALUES (1939, 'Alberto', 'Cruz Díaz', 'alberto1939@hotmail.com', '5524853741', 7, '2023-02-12', 'regular', 17);
INSERT INTO public.clientes VALUES (1962, 'Diego', 'Ramírez Moreno', 'diego1962@yahoo.com', '5563803762', 7, '2025-07-09', 'regular', 17);
INSERT INTO public.clientes VALUES (1966, 'Diego', 'Castro Gómez', 'diego1966@yahoo.com', '5553712070', 7, '2023-02-04', 'regular', 17);
INSERT INTO public.clientes VALUES (1971, 'Verónica', 'Vargas Gutiérrez', 'verónica1971@gmail.com', '5592877501', 7, '2023-04-30', 'regular', 17);
INSERT INTO public.clientes VALUES (1972, 'Verónica', 'Flores Rodríguez', 'verónica1972@hotmail.com', '5532858779', 7, '2025-08-29', 'premium', 17);
INSERT INTO public.clientes VALUES (1980, 'Sandra', 'Gutiérrez Castro', 'sandra1980@hotmail.com', '5519169403', 7, '2021-12-28', 'regular', 17);
INSERT INTO public.clientes VALUES (1983, 'Francisco', 'Hernández Martínez', 'francisco1983@gmail.com', '5524412290', 7, '2024-01-23', 'premium', 17);
INSERT INTO public.clientes VALUES (31, 'José', 'Moreno Moreno', 'josé31@yahoo.com', '5582675403', 4, '2021-09-09', 'regular', 18);
INSERT INTO public.clientes VALUES (33, 'Isabel', 'Gómez Sánchez', 'isabel33@gmail.com', '5527212880', 4, '2023-07-01', 'premium', 18);
INSERT INTO public.clientes VALUES (50, 'Juan', 'González Reyes', 'juan50@gmail.com', '5513834774', 4, '2022-09-22', 'regular', 18);
INSERT INTO public.clientes VALUES (76, 'David', 'Martínez Martínez', 'david76@gmail.com', '5518949617', 4, '2021-10-05', 'vip', 18);
INSERT INTO public.clientes VALUES (80, 'Eduardo', 'Mendoza Castillo', 'eduardo80@hotmail.com', '5581003974', 4, '2022-04-30', 'regular', 18);
INSERT INTO public.clientes VALUES (86, 'Daniela', 'Cruz Cruz', 'daniela86@gmail.com', '5510026256', 4, '2024-11-06', 'regular', 18);
INSERT INTO public.clientes VALUES (94, 'Manuel', 'Ortega González', 'manuel94@hotmail.com', '5530561818', 4, '2022-09-01', 'premium', 18);
INSERT INTO public.clientes VALUES (124, 'Ana', 'Gutiérrez Gómez', 'ana124@gmail.com', '5594644215', 4, '2025-05-19', 'regular', 18);
INSERT INTO public.clientes VALUES (135, 'Ana', 'Rodríguez González', 'ana135@yahoo.com', '5529511823', 4, '2022-09-14', 'regular', 18);
INSERT INTO public.clientes VALUES (190, 'Isabel', 'Mendoza Castillo', 'isabel190@yahoo.com', '5580784933', 4, '2024-07-09', 'nuevo', 18);
INSERT INTO public.clientes VALUES (192, 'Carmen', 'Pérez Ortega', 'carmen192@gmail.com', '5556315279', 4, '2022-11-04', 'regular', 18);
INSERT INTO public.clientes VALUES (203, 'Valeria', 'Ramírez Rodríguez', 'valeria203@gmail.com', '5547216895', 4, '2024-04-19', 'regular', 18);
INSERT INTO public.clientes VALUES (216, 'Ana', 'Ramos González', 'ana216@yahoo.com', '5592996496', 4, '2025-01-30', 'premium', 18);
INSERT INTO public.clientes VALUES (224, 'Andrés', 'Díaz Sánchez', 'andrés224@gmail.com', '5591945021', 4, '2023-02-06', 'regular', 18);
INSERT INTO public.clientes VALUES (238, 'María', 'Díaz Hernández', 'maría238@yahoo.com', '5577674770', 4, '2024-01-22', 'regular', 18);
INSERT INTO public.clientes VALUES (242, 'Laura', 'Gómez Castro', 'laura242@gmail.com', '5581258920', 4, '2024-10-12', 'regular', 18);
INSERT INTO public.clientes VALUES (254, 'Gabriela', 'Rodríguez Mendoza', 'gabriela254@yahoo.com', '5548674340', 4, '2025-08-12', 'regular', 18);
INSERT INTO public.clientes VALUES (285, 'Ana', 'Pérez Martínez', 'ana285@hotmail.com', '5589614758', 4, '2023-10-25', 'regular', 18);
INSERT INTO public.clientes VALUES (292, 'Claudia', 'Herrera Rivera', 'claudia292@gmail.com', '5584777007', 4, '2025-12-25', 'regular', 18);
INSERT INTO public.clientes VALUES (306, 'Verónica', 'Ortega Morales', 'verónica306@hotmail.com', '5578006116', 4, '2024-04-01', 'regular', 18);
INSERT INTO public.clientes VALUES (307, 'Fernanda', 'Jiménez Moreno', 'fernanda307@hotmail.com', '5553014471', 4, '2026-04-15', 'regular', 18);
INSERT INTO public.clientes VALUES (319, 'Adriana', 'Vega Herrera', 'adriana319@gmail.com', '5585982862', 4, '2023-07-08', 'regular', 18);
INSERT INTO public.clientes VALUES (331, 'Sergio', 'García Vargas', 'sergio331@gmail.com', '5591311077', 4, '2021-09-22', 'premium', 18);
INSERT INTO public.clientes VALUES (380, 'Ricardo', 'Pérez Torres', 'ricardo380@gmail.com', '5562577566', 4, '2024-07-28', 'regular', 18);
INSERT INTO public.clientes VALUES (389, 'Daniela', 'Castro Ramírez', 'daniela389@yahoo.com', '5577575794', 4, '2021-12-02', 'regular', 18);
INSERT INTO public.clientes VALUES (406, 'Eduardo', 'Ramírez Vargas', 'eduardo406@gmail.com', '5526617902', 4, '2022-03-15', 'premium', 18);
INSERT INTO public.clientes VALUES (416, 'Diego', 'García Mendoza', 'diego416@hotmail.com', '5566607262', 4, '2024-09-25', 'mayorista', 18);
INSERT INTO public.clientes VALUES (417, 'Diego', 'García Martínez', 'diego417@gmail.com', '5519068358', 4, '2024-02-07', 'regular', 18);
INSERT INTO public.clientes VALUES (427, 'José', 'González Torres', 'josé427@gmail.com', '5532708438', 4, '2022-12-31', 'nuevo', 18);
INSERT INTO public.clientes VALUES (434, 'Adriana', 'Torres Vargas', 'adriana434@gmail.com', '5510072871', 4, '2023-09-28', 'regular', 18);
INSERT INTO public.clientes VALUES (448, 'Mónica', 'García Díaz', 'mónica448@gmail.com', '5597245556', 4, '2021-08-28', 'vip', 18);
INSERT INTO public.clientes VALUES (453, 'David', 'Aguilar Ramírez', 'david453@yahoo.com', '5555741665', 4, '2021-11-02', 'regular', 18);
INSERT INTO public.clientes VALUES (463, 'Ana', 'Sánchez Reyes', 'ana463@gmail.com', '5585088096', 4, '2024-01-29', 'regular', 18);
INSERT INTO public.clientes VALUES (465, 'Valeria', 'Jiménez Torres', 'valeria465@yahoo.com', '5570975394', 4, '2023-08-31', 'regular', 18);
INSERT INTO public.clientes VALUES (554, 'Sandra', 'Castro Ortega', 'sandra554@gmail.com', '5577731180', 4, '2025-09-23', 'regular', 18);
INSERT INTO public.clientes VALUES (565, 'Claudia', 'Moreno Cruz', 'claudia565@yahoo.com', '5599301859', 4, '2023-02-01', 'regular', 18);
INSERT INTO public.clientes VALUES (567, 'Ana', 'Mendoza Flores', 'ana567@hotmail.com', '5540208616', 4, '2021-08-04', 'premium', 18);
INSERT INTO public.clientes VALUES (570, 'Verónica', 'Gómez Martínez', 'verónica570@hotmail.com', '5587897778', 4, '2021-09-05', 'vip', 18);
INSERT INTO public.clientes VALUES (573, 'Roberto', 'Núñez Hernández', 'roberto573@hotmail.com', '5534109916', 4, '2025-10-14', 'nuevo', 18);
INSERT INTO public.clientes VALUES (600, 'José', 'López Ramos', 'josé600@yahoo.com', '5587217700', 4, '2025-12-20', 'premium', 18);
INSERT INTO public.clientes VALUES (612, 'Sofía', 'Pérez Torres', 'sofía612@yahoo.com', '5554454724', 4, '2025-07-18', 'premium', 18);
INSERT INTO public.clientes VALUES (615, 'Patricia', 'González Rivera', 'patricia615@gmail.com', '5541743155', 4, '2022-08-22', 'mayorista', 18);
INSERT INTO public.clientes VALUES (633, 'Ricardo', 'Torres Castillo', 'ricardo633@yahoo.com', '5540055302', 4, '2023-06-15', 'regular', 18);
INSERT INTO public.clientes VALUES (634, 'Juan', 'Castro Ramírez', 'juan634@gmail.com', '5546297151', 4, '2022-11-04', 'nuevo', 18);
INSERT INTO public.clientes VALUES (647, 'Miguel', 'Gutiérrez Castillo', 'miguel647@hotmail.com', '5512846476', 4, '2025-11-13', 'regular', 18);
INSERT INTO public.clientes VALUES (658, 'Carlos', 'Rivera Gutiérrez', 'carlos658@yahoo.com', '5524784930', 4, '2024-06-26', 'regular', 18);
INSERT INTO public.clientes VALUES (671, 'Elena', 'Ramírez López', 'elena671@gmail.com', '5585805745', 4, '2023-04-14', 'nuevo', 18);
INSERT INTO public.clientes VALUES (677, 'Mónica', 'Mendoza González', 'mónica677@yahoo.com', '5567834613', 4, '2021-06-13', 'premium', 18);
INSERT INTO public.clientes VALUES (734, 'María', 'Núñez Cruz', 'maría734@hotmail.com', '5564064349', 4, '2023-06-15', 'vip', 18);
INSERT INTO public.clientes VALUES (739, 'Daniela', 'Aguilar Castro', 'daniela739@gmail.com', '5510663217', 4, '2024-12-27', 'mayorista', 18);
INSERT INTO public.clientes VALUES (809, 'Miguel', 'Sánchez Morales', 'miguel809@hotmail.com', '5591873043', 4, '2024-07-03', 'nuevo', 18);
INSERT INTO public.clientes VALUES (820, 'Isabel', 'Flores Castillo', 'isabel820@gmail.com', '5524009401', 4, '2024-07-02', 'vip', 18);
INSERT INTO public.clientes VALUES (825, 'Miguel', 'Sánchez Pérez', 'miguel825@hotmail.com', '5581469858', 4, '2022-09-28', 'regular', 18);
INSERT INTO public.clientes VALUES (858, 'Gabriela', 'Flores Gómez', 'gabriela858@yahoo.com', '5529219517', 4, '2021-11-17', 'vip', 18);
INSERT INTO public.clientes VALUES (867, 'Valeria', 'Pérez Aguilar', 'valeria867@gmail.com', '5594031142', 4, '2022-11-20', 'premium', 18);
INSERT INTO public.clientes VALUES (876, 'Francisco', 'Pérez Castro', 'francisco876@gmail.com', '5564895832', 4, '2023-04-17', 'premium', 18);
INSERT INTO public.clientes VALUES (926, 'Rosa', 'Ramos Herrera', 'rosa926@gmail.com', '5551672868', 4, '2024-04-26', 'premium', 18);
INSERT INTO public.clientes VALUES (936, 'Adriana', 'Flores Morales', 'adriana936@gmail.com', '5550288578', 4, '2021-07-11', 'regular', 18);
INSERT INTO public.clientes VALUES (1025, 'Patricia', 'Martínez Vargas', 'patricia1025@yahoo.com', '5575277802', 4, '2021-10-12', 'regular', 18);
INSERT INTO public.clientes VALUES (1139, 'Pablo', 'Herrera Ortega', 'pablo1139@yahoo.com', '5594327199', 4, '2023-04-14', 'regular', 18);
INSERT INTO public.clientes VALUES (1156, 'Luis', 'Moreno González', 'luis1156@gmail.com', '5523028371', 4, '2025-09-07', 'mayorista', 18);
INSERT INTO public.clientes VALUES (1162, 'Ricardo', 'Castillo Torres', 'ricardo1162@hotmail.com', '5555300876', 4, '2024-11-30', 'premium', 18);
INSERT INTO public.clientes VALUES (1172, 'Adriana', 'Castillo Rodríguez', 'adriana1172@hotmail.com', '5589431668', 4, '2023-12-18', 'regular', 18);
INSERT INTO public.clientes VALUES (1196, 'Rosa', 'Núñez Jiménez', 'rosa1196@gmail.com', '5549677387', 4, '2022-04-27', 'mayorista', 18);
INSERT INTO public.clientes VALUES (1207, 'Isabel', 'Sánchez Sánchez', 'isabel1207@hotmail.com', '5513251451', 4, '2022-11-03', 'mayorista', 18);
INSERT INTO public.clientes VALUES (1242, 'Ramón', 'Núñez Morales', 'ramón1242@gmail.com', '5589636235', 4, '2022-08-21', 'regular', 18);
INSERT INTO public.clientes VALUES (1263, 'Daniela', 'Sánchez Aguilar', 'daniela1263@yahoo.com', '5567964749', 4, '2021-07-24', 'regular', 18);
INSERT INTO public.clientes VALUES (1280, 'Juan', 'Rodríguez Martínez', 'juan1280@hotmail.com', '5517315154', 4, '2021-09-10', 'regular', 18);
INSERT INTO public.clientes VALUES (1332, 'Valeria', 'Martínez Hernández', 'valeria1332@gmail.com', '5521052264', 4, '2022-12-31', 'regular', 18);
INSERT INTO public.clientes VALUES (1335, 'Francisco', 'Martínez Morales', 'francisco1335@gmail.com', '5548077170', 4, '2024-03-28', 'mayorista', 18);
INSERT INTO public.clientes VALUES (1337, 'Sergio', 'Moreno Flores', 'sergio1337@yahoo.com', '5530833152', 4, '2025-12-31', 'regular', 18);
INSERT INTO public.clientes VALUES (1347, 'Liliana', 'Jiménez Núñez', 'liliana1347@gmail.com', '5568376344', 4, '2023-11-23', 'nuevo', 18);
INSERT INTO public.clientes VALUES (1388, 'Elena', 'Morales Morales', 'elena1388@gmail.com', '5568713655', 4, '2025-01-11', 'regular', 18);
INSERT INTO public.clientes VALUES (1399, 'Diego', 'Jiménez Pérez', 'diego1399@gmail.com', '5553582517', 4, '2021-08-20', 'regular', 18);
INSERT INTO public.clientes VALUES (1417, 'Sofía', 'Gutiérrez Morales', 'sofía1417@hotmail.com', '5528148672', 4, '2023-07-17', 'regular', 18);
INSERT INTO public.clientes VALUES (1428, 'Diego', 'Hernández Reyes', 'diego1428@yahoo.com', '5590424826', 4, '2026-06-06', 'premium', 18);
INSERT INTO public.clientes VALUES (1449, 'Claudia', 'Pérez González', 'claudia1449@yahoo.com', '5540295304', 4, '2021-06-30', 'regular', 18);
INSERT INTO public.clientes VALUES (1461, 'Alejandra', 'Herrera Vega', 'alejandra1461@yahoo.com', '5535895776', 4, '2023-07-12', 'mayorista', 18);
INSERT INTO public.clientes VALUES (1467, 'Manuel', 'Ramos Castro', 'manuel1467@gmail.com', '5564687986', 4, '2025-04-03', 'regular', 18);
INSERT INTO public.clientes VALUES (1485, 'Francisco', 'Díaz Jiménez', 'francisco1485@hotmail.com', '5518402695', 4, '2025-10-15', 'mayorista', 18);
INSERT INTO public.clientes VALUES (1499, 'Liliana', 'Flores Hernández', 'liliana1499@yahoo.com', '5578487095', 4, '2021-11-10', 'regular', 18);
INSERT INTO public.clientes VALUES (1513, 'Roberto', 'González Castro', 'roberto1513@gmail.com', '5554410181', 4, '2023-01-19', 'premium', 18);
INSERT INTO public.clientes VALUES (1516, 'Eduardo', 'Cruz Vargas', 'eduardo1516@gmail.com', '5571456344', 4, '2022-07-19', 'premium', 18);
INSERT INTO public.clientes VALUES (1538, 'Sofía', 'Castillo Ortega', 'sofía1538@gmail.com', '5585361321', 4, '2023-01-19', 'premium', 18);
INSERT INTO public.clientes VALUES (1556, 'Verónica', 'Vargas Ramírez', 'verónica1556@yahoo.com', '5586667691', 4, '2024-08-14', 'regular', 18);
INSERT INTO public.clientes VALUES (1578, 'Mónica', 'Díaz Cruz', 'mónica1578@gmail.com', '5528741499', 4, '2025-10-19', 'premium', 18);
INSERT INTO public.clientes VALUES (1579, 'Laura', 'Martínez Martínez', 'laura1579@yahoo.com', '5534254080', 4, '2025-10-07', 'premium', 18);
INSERT INTO public.clientes VALUES (1590, 'Ricardo', 'Gutiérrez Morales', 'ricardo1590@yahoo.com', '5593137786', 4, '2023-12-17', 'premium', 18);
INSERT INTO public.clientes VALUES (1623, 'Andrés', 'Reyes Rivera', 'andrés1623@yahoo.com', '5533162629', 4, '2021-11-22', 'regular', 18);
INSERT INTO public.clientes VALUES (1627, 'Liliana', 'Moreno Núñez', 'liliana1627@gmail.com', '5599198877', 4, '2024-12-11', 'regular', 18);
INSERT INTO public.clientes VALUES (1658, 'Juan', 'Vega Vargas', 'juan1658@yahoo.com', '5548814484', 4, '2025-11-01', 'regular', 18);
INSERT INTO public.clientes VALUES (1676, 'Miguel', 'Ramírez Flores', 'miguel1676@gmail.com', '5536086815', 4, '2024-04-11', 'premium', 18);
INSERT INTO public.clientes VALUES (1684, 'Sandra', 'Herrera González', 'sandra1684@gmail.com', '5590376344', 4, '2024-09-23', 'nuevo', 18);
INSERT INTO public.clientes VALUES (1689, 'Carmen', 'Castro Ortega', 'carmen1689@yahoo.com', '5579079708', 4, '2022-06-15', 'regular', 18);
INSERT INTO public.clientes VALUES (1693, 'Rosa', 'Rivera Gómez', 'rosa1693@gmail.com', '5548757233', 4, '2022-05-20', 'regular', 18);
INSERT INTO public.clientes VALUES (1696, 'Ramón', 'Flores Aguilar', 'ramón1696@gmail.com', '5523107454', 4, '2026-06-04', 'regular', 18);
INSERT INTO public.clientes VALUES (1720, 'Daniela', 'García Morales', 'daniela1720@hotmail.com', '5585491870', 4, '2025-12-06', 'regular', 18);
INSERT INTO public.clientes VALUES (1722, 'Miguel', 'Ramos Rivera', 'miguel1722@hotmail.com', '5569134843', 4, '2021-11-03', 'regular', 18);
INSERT INTO public.clientes VALUES (1728, 'Sergio', 'Mendoza Gutiérrez', 'sergio1728@hotmail.com', '5519492312', 4, '2024-12-30', 'regular', 18);
INSERT INTO public.clientes VALUES (1734, 'Valeria', 'Flores Hernández', 'valeria1734@yahoo.com', '5547138074', 4, '2024-03-28', 'regular', 18);
INSERT INTO public.clientes VALUES (1743, 'Isabel', 'Cruz Vargas', 'isabel1743@gmail.com', '5555605075', 4, '2023-12-27', 'regular', 18);
INSERT INTO public.clientes VALUES (1777, 'Patricia', 'Ramos Vargas', 'patricia1777@gmail.com', '5527123588', 4, '2022-11-21', 'regular', 18);
INSERT INTO public.clientes VALUES (1796, 'Daniela', 'Gutiérrez Sánchez', 'daniela1796@yahoo.com', '5537153169', 4, '2021-11-28', 'premium', 18);
INSERT INTO public.clientes VALUES (1814, 'Fernando', 'Cruz García', 'fernando1814@hotmail.com', '5596665124', 4, '2022-03-01', 'premium', 18);
INSERT INTO public.clientes VALUES (1867, 'Alejandra', 'Rivera Flores', 'alejandra1867@hotmail.com', '5526865926', 4, '2025-01-27', 'regular', 18);
INSERT INTO public.clientes VALUES (1876, 'Fernanda', 'Mendoza Aguilar', 'fernanda1876@gmail.com', '5513760835', 4, '2023-05-08', 'premium', 18);
INSERT INTO public.clientes VALUES (1887, 'Ricardo', 'García Pérez', 'ricardo1887@hotmail.com', '5527691237', 4, '2025-09-24', 'regular', 18);
INSERT INTO public.clientes VALUES (1896, 'José', 'Hernández Martínez', 'josé1896@gmail.com', '5578922513', 4, '2025-02-14', 'premium', 18);
INSERT INTO public.clientes VALUES (1897, 'Verónica', 'Díaz Mendoza', 'verónica1897@gmail.com', '5592435286', 4, '2022-09-09', 'vip', 18);
INSERT INTO public.clientes VALUES (1898, 'Laura', 'Cruz Vega', 'laura1898@hotmail.com', '5549104072', 4, '2021-12-20', 'premium', 18);
INSERT INTO public.clientes VALUES (1918, 'Sergio', 'Torres Herrera', 'sergio1918@hotmail.com', '5510128848', 4, '2021-12-27', 'regular', 18);
INSERT INTO public.clientes VALUES (1925, 'Roberto', 'Reyes Castillo', 'roberto1925@hotmail.com', '5512671254', 4, '2025-03-19', 'mayorista', 18);
INSERT INTO public.clientes VALUES (1926, 'Carlos', 'Ramos Castillo', 'carlos1926@gmail.com', '5510286011', 4, '2026-05-31', 'regular', 18);
INSERT INTO public.clientes VALUES (60, 'María', 'Rodríguez Martínez', 'maría60@yahoo.com', '5568843284', 5, '2025-02-20', 'regular', 19);
INSERT INTO public.clientes VALUES (73, 'Sergio', 'Aguilar Ramírez', 'sergio73@gmail.com', '5570945449', 5, '2022-02-03', 'premium', 19);
INSERT INTO public.clientes VALUES (78, 'Liliana', 'Ramírez Hernández', 'liliana78@hotmail.com', '5519512542', 5, '2025-04-10', 'premium', 19);
INSERT INTO public.clientes VALUES (103, 'Verónica', 'Morales Jiménez', 'verónica103@gmail.com', '5528971329', 5, '2024-05-01', 'regular', 19);
INSERT INTO public.clientes VALUES (107, 'Carmen', 'Pérez Reyes', 'carmen107@gmail.com', '5585254207', 5, '2026-03-22', 'regular', 19);
INSERT INTO public.clientes VALUES (115, 'Sofía', 'Rodríguez Flores', 'sofía115@gmail.com', '5529531743', 5, '2022-02-25', 'regular', 19);
INSERT INTO public.clientes VALUES (145, 'Isabel', 'Mendoza López', 'isabel145@hotmail.com', '5553476321', 5, '2025-10-21', 'premium', 19);
INSERT INTO public.clientes VALUES (171, 'Fernando', 'Aguilar González', 'fernando171@gmail.com', '5595380301', 5, '2022-03-14', 'regular', 19);
INSERT INTO public.clientes VALUES (198, 'Valeria', 'Gutiérrez García', 'valeria198@gmail.com', '5519120357', 5, '2024-02-20', 'regular', 19);
INSERT INTO public.clientes VALUES (222, 'Alberto', 'Gómez Herrera', 'alberto222@hotmail.com', '5520834405', 5, '2026-05-28', 'regular', 19);
INSERT INTO public.clientes VALUES (261, 'Ana', 'González Moreno', 'ana261@gmail.com', '5551350093', 5, '2024-03-11', 'premium', 19);
INSERT INTO public.clientes VALUES (289, 'Fernando', 'Torres Rodríguez', 'fernando289@gmail.com', '5582091897', 5, '2022-05-18', 'regular', 19);
INSERT INTO public.clientes VALUES (311, 'Alejandra', 'Ramírez García', 'alejandra311@gmail.com', '5588918579', 5, '2024-09-01', 'regular', 19);
INSERT INTO public.clientes VALUES (323, 'Alejandra', 'Vargas Castro', 'alejandra323@yahoo.com', '5528311409', 5, '2024-12-29', 'premium', 19);
INSERT INTO public.clientes VALUES (324, 'Manuel', 'Rodríguez Vargas', 'manuel324@gmail.com', '5575208604', 5, '2026-02-18', 'mayorista', 19);
INSERT INTO public.clientes VALUES (338, 'Carmen', 'Vargas Cruz', 'carmen338@gmail.com', '5528265989', 5, '2024-03-13', 'regular', 19);
INSERT INTO public.clientes VALUES (347, 'Daniela', 'Ortega Moreno', 'daniela347@gmail.com', '5521507650', 5, '2023-10-25', 'regular', 19);
INSERT INTO public.clientes VALUES (371, 'Isabel', 'Rivera Ramírez', 'isabel371@gmail.com', '5577571186', 5, '2025-10-21', 'premium', 19);
INSERT INTO public.clientes VALUES (377, 'Luis', 'Aguilar García', 'luis377@gmail.com', '5535262608', 5, '2025-04-09', 'regular', 19);
INSERT INTO public.clientes VALUES (423, 'Liliana', 'Reyes Pérez', 'liliana423@gmail.com', '5577463037', 5, '2025-10-08', 'premium', 19);
INSERT INTO public.clientes VALUES (452, 'David', 'Torres López', 'david452@gmail.com', '5522982357', 5, '2023-10-03', 'regular', 19);
INSERT INTO public.clientes VALUES (458, 'Mario', 'Castro Jiménez', 'mario458@gmail.com', '5555582551', 5, '2023-11-25', 'regular', 19);
INSERT INTO public.clientes VALUES (462, 'Patricia', 'González Morales', 'patricia462@yahoo.com', '5559503523', 5, '2023-07-17', 'regular', 19);
INSERT INTO public.clientes VALUES (488, 'Daniela', 'González Ortega', 'daniela488@gmail.com', '5551013170', 5, '2023-08-23', 'mayorista', 19);
INSERT INTO public.clientes VALUES (493, 'Carmen', 'Hernández Aguilar', 'carmen493@gmail.com', '5575580570', 5, '2025-05-25', 'regular', 19);
INSERT INTO public.clientes VALUES (523, 'Sandra', 'Mendoza Díaz', 'sandra523@gmail.com', '5548715788', 5, '2025-02-27', 'mayorista', 19);
INSERT INTO public.clientes VALUES (541, 'Fernanda', 'Castillo Torres', 'fernanda541@yahoo.com', '5575997979', 5, '2025-11-25', 'regular', 19);
INSERT INTO public.clientes VALUES (568, 'Fernanda', 'Torres Aguilar', 'fernanda568@gmail.com', '5531366552', 5, '2023-05-16', 'regular', 19);
INSERT INTO public.clientes VALUES (592, 'Isabel', 'González Vega', 'isabel592@gmail.com', '5546728250', 5, '2025-11-23', 'regular', 19);
INSERT INTO public.clientes VALUES (611, 'Andrés', 'Moreno Aguilar', 'andrés611@yahoo.com', '5568245146', 5, '2024-06-06', 'mayorista', 19);
INSERT INTO public.clientes VALUES (631, 'Verónica', 'Herrera Gómez', 'verónica631@yahoo.com', '5534704966', 5, '2025-07-19', 'regular', 19);
INSERT INTO public.clientes VALUES (660, 'Juan', 'Martínez Castillo', 'juan660@gmail.com', '5560661928', 5, '2022-07-17', 'nuevo', 19);
INSERT INTO public.clientes VALUES (661, 'Luis', 'Moreno Ortega', 'luis661@hotmail.com', '5531229647', 5, '2025-08-15', 'regular', 19);
INSERT INTO public.clientes VALUES (663, 'Sandra', 'Castillo Torres', 'sandra663@hotmail.com', '5569589132', 5, '2024-11-01', 'regular', 19);
INSERT INTO public.clientes VALUES (684, 'Ana', 'Jiménez Vargas', 'ana684@hotmail.com', '5585269356', 5, '2025-07-30', 'mayorista', 19);
INSERT INTO public.clientes VALUES (693, 'Alejandra', 'Rivera Núñez', 'alejandra693@gmail.com', '5562229213', 5, '2023-04-20', 'premium', 19);
INSERT INTO public.clientes VALUES (698, 'Pablo', 'Pérez Rivera', 'pablo698@yahoo.com', '5587421674', 5, '2024-05-14', 'mayorista', 19);
INSERT INTO public.clientes VALUES (707, 'Mario', 'Moreno Sánchez', 'mario707@hotmail.com', '5514385512', 5, '2026-04-19', 'regular', 19);
INSERT INTO public.clientes VALUES (733, 'Liliana', 'Gómez Sánchez', 'liliana733@gmail.com', '5548257007', 5, '2022-11-01', 'premium', 19);
INSERT INTO public.clientes VALUES (737, 'Sofía', 'Aguilar Rivera', 'sofía737@gmail.com', '5523790014', 5, '2025-03-10', 'regular', 19);
INSERT INTO public.clientes VALUES (744, 'Rosa', 'Castillo López', 'rosa744@yahoo.com', '5538517975', 5, '2022-09-07', 'regular', 19);
INSERT INTO public.clientes VALUES (762, 'Adriana', 'Morales Martínez', 'adriana762@hotmail.com', '5595872544', 5, '2025-08-13', 'nuevo', 19);
INSERT INTO public.clientes VALUES (776, 'Mario', 'Cruz Díaz', 'mario776@gmail.com', '5571912488', 5, '2023-04-24', 'regular', 19);
INSERT INTO public.clientes VALUES (788, 'Luis', 'Cruz Díaz', 'luis788@gmail.com', '5529886575', 5, '2024-11-08', 'regular', 19);
INSERT INTO public.clientes VALUES (790, 'Patricia', 'Cruz Castro', 'patricia790@gmail.com', '5547165431', 5, '2025-07-22', 'regular', 19);
INSERT INTO public.clientes VALUES (831, 'Daniela', 'Ramírez Moreno', 'daniela831@hotmail.com', '5591604268', 5, '2025-09-30', 'regular', 19);
INSERT INTO public.clientes VALUES (861, 'Alejandro', 'González Martínez', 'alejandro861@hotmail.com', '5532662988', 5, '2023-02-02', 'vip', 19);
INSERT INTO public.clientes VALUES (882, 'Roberto', 'Núñez Rivera', 'roberto882@yahoo.com', '5543380451', 5, '2026-03-30', 'mayorista', 19);
INSERT INTO public.clientes VALUES (885, 'Laura', 'López López', 'laura885@gmail.com', '5565751363', 5, '2026-05-12', 'premium', 19);
INSERT INTO public.clientes VALUES (941, 'Alejandra', 'López Ramos', 'alejandra941@hotmail.com', '5560232033', 5, '2023-10-08', 'regular', 19);
INSERT INTO public.clientes VALUES (984, 'Roberto', 'Sánchez Cruz', 'roberto984@gmail.com', '5519374071', 5, '2022-03-31', 'regular', 19);
INSERT INTO public.clientes VALUES (1015, 'Valeria', 'Cruz Torres', 'valeria1015@yahoo.com', '5565985387', 5, '2022-03-03', 'vip', 19);
INSERT INTO public.clientes VALUES (1030, 'Ramón', 'Flores Cruz', 'ramón1030@gmail.com', '5568035365', 5, '2024-03-11', 'regular', 19);
INSERT INTO public.clientes VALUES (1039, 'Daniela', 'Morales Ramírez', 'daniela1039@gmail.com', '5571331294', 5, '2026-05-28', 'regular', 19);
INSERT INTO public.clientes VALUES (1041, 'José', 'Vargas Vargas', 'josé1041@gmail.com', '5573265064', 5, '2024-11-26', 'premium', 19);
INSERT INTO public.clientes VALUES (1054, 'Fernanda', 'Vargas Hernández', 'fernanda1054@gmail.com', '5534450775', 5, '2025-08-23', 'premium', 19);
INSERT INTO public.clientes VALUES (1061, 'Sandra', 'Pérez González', 'sandra1061@gmail.com', '5539777154', 5, '2025-05-01', 'premium', 19);
INSERT INTO public.clientes VALUES (1065, 'Alejandra', 'Castro Morales', 'alejandra1065@yahoo.com', '5550264407', 5, '2026-01-09', 'regular', 19);
INSERT INTO public.clientes VALUES (1080, 'Pablo', 'Aguilar Mendoza', 'pablo1080@gmail.com', '5567954859', 5, '2025-03-26', 'regular', 19);
INSERT INTO public.clientes VALUES (1098, 'Mónica', 'Jiménez Cruz', 'mónica1098@yahoo.com', '5532997024', 5, '2023-04-22', 'regular', 19);
INSERT INTO public.clientes VALUES (1108, 'Manuel', 'Hernández Moreno', 'manuel1108@yahoo.com', '5581017414', 5, '2026-06-02', 'regular', 19);
INSERT INTO public.clientes VALUES (1111, 'Carmen', 'Reyes González', 'carmen1111@gmail.com', '5569741176', 5, '2022-12-15', 'regular', 19);
INSERT INTO public.clientes VALUES (1138, 'Valeria', 'Rivera Hernández', 'valeria1138@yahoo.com', '5541361578', 5, '2024-04-22', 'regular', 19);
INSERT INTO public.clientes VALUES (1160, 'Laura', 'Rivera Jiménez', 'laura1160@gmail.com', '5576404207', 5, '2022-12-16', 'mayorista', 19);
INSERT INTO public.clientes VALUES (1161, 'Roberto', 'Rivera Vega', 'roberto1161@hotmail.com', '5579851147', 5, '2023-09-13', 'regular', 19);
INSERT INTO public.clientes VALUES (1163, 'Mónica', 'Moreno López', 'mónica1163@yahoo.com', '5593774633', 5, '2022-04-29', 'regular', 19);
INSERT INTO public.clientes VALUES (1170, 'José', 'Rodríguez López', 'josé1170@gmail.com', '5522292455', 5, '2024-01-07', 'premium', 19);
INSERT INTO public.clientes VALUES (1177, 'Alejandra', 'López Moreno', 'alejandra1177@gmail.com', '5569851981', 5, '2022-04-09', 'premium', 19);
INSERT INTO public.clientes VALUES (1197, 'Sandra', 'Torres Sánchez', 'sandra1197@gmail.com', '5566772934', 5, '2024-10-09', 'regular', 19);
INSERT INTO public.clientes VALUES (1209, 'Pablo', 'García Reyes', 'pablo1209@gmail.com', '5576065625', 5, '2022-09-09', 'premium', 19);
INSERT INTO public.clientes VALUES (1219, 'María', 'Jiménez Hernández', 'maría1219@gmail.com', '5546806704', 5, '2024-09-28', 'regular', 19);
INSERT INTO public.clientes VALUES (1224, 'Laura', 'Ramos Castillo', 'laura1224@yahoo.com', '5560657129', 5, '2026-03-27', 'regular', 19);
INSERT INTO public.clientes VALUES (1234, 'Sandra', 'Gutiérrez Hernández', 'sandra1234@gmail.com', '5587237550', 5, '2025-01-06', 'vip', 19);
INSERT INTO public.clientes VALUES (1239, 'Verónica', 'Vargas Martínez', 'verónica1239@gmail.com', '5535636468', 5, '2026-05-09', 'regular', 19);
INSERT INTO public.clientes VALUES (1244, 'Adriana', 'Castro Rivera', 'adriana1244@gmail.com', '5575808087', 5, '2024-04-24', 'regular', 19);
INSERT INTO public.clientes VALUES (1319, 'Juan', 'Díaz Gutiérrez', 'juan1319@gmail.com', '5538268399', 5, '2026-01-27', 'regular', 19);
INSERT INTO public.clientes VALUES (1376, 'Patricia', 'López Martínez', 'patricia1376@gmail.com', '5588960861', 5, '2025-11-05', 'mayorista', 19);
INSERT INTO public.clientes VALUES (1392, 'Fernanda', 'Ramírez Rodríguez', 'fernanda1392@yahoo.com', '5527916286', 5, '2022-01-24', 'regular', 19);
INSERT INTO public.clientes VALUES (1396, 'Sandra', 'Núñez Rodríguez', 'sandra1396@gmail.com', '5580910956', 5, '2025-08-10', 'nuevo', 19);
INSERT INTO public.clientes VALUES (1400, 'Ricardo', 'Gutiérrez Flores', 'ricardo1400@yahoo.com', '5585488785', 5, '2022-07-30', 'regular', 19);
INSERT INTO public.clientes VALUES (1422, 'Valeria', 'García Hernández', 'valeria1422@gmail.com', '5513667070', 5, '2021-08-09', 'mayorista', 19);
INSERT INTO public.clientes VALUES (1468, 'Luis', 'Hernández Martínez', 'luis1468@gmail.com', '5570603852', 5, '2023-01-18', 'mayorista', 19);
INSERT INTO public.clientes VALUES (1507, 'Diego', 'Sánchez Castro', 'diego1507@hotmail.com', '5529668825', 5, '2024-05-25', 'premium', 19);
INSERT INTO public.clientes VALUES (1509, 'Laura', 'Gómez Moreno', 'laura1509@gmail.com', '5559129124', 5, '2022-02-01', 'regular', 19);
INSERT INTO public.clientes VALUES (1521, 'Miguel', 'Mendoza Vargas', 'miguel1521@gmail.com', '5580382000', 5, '2024-03-17', 'premium', 19);
INSERT INTO public.clientes VALUES (1552, 'Rosa', 'Aguilar López', 'rosa1552@hotmail.com', '5596590284', 5, '2022-12-06', 'regular', 19);
INSERT INTO public.clientes VALUES (1592, 'Luis', 'Flores Flores', 'luis1592@hotmail.com', '5594790000', 5, '2025-03-14', 'premium', 19);
INSERT INTO public.clientes VALUES (1620, 'Liliana', 'Cruz Castro', 'liliana1620@yahoo.com', '5569653983', 5, '2022-05-07', 'mayorista', 19);
INSERT INTO public.clientes VALUES (1636, 'Sandra', 'Cruz Jiménez', 'sandra1636@gmail.com', '5567031050', 5, '2022-12-13', 'mayorista', 19);
INSERT INTO public.clientes VALUES (1663, 'Ana', 'García Herrera', 'ana1663@gmail.com', '5582054847', 5, '2025-11-02', 'regular', 19);
INSERT INTO public.clientes VALUES (1681, 'Alberto', 'Jiménez Pérez', 'alberto1681@hotmail.com', '5524381850', 5, '2022-11-05', 'premium', 19);
INSERT INTO public.clientes VALUES (1697, 'María', 'Cruz Aguilar', 'maría1697@gmail.com', '5534478552', 5, '2024-05-15', 'mayorista', 19);
INSERT INTO public.clientes VALUES (1698, 'David', 'Ramos Ortega', 'david1698@hotmail.com', '5554480754', 5, '2022-07-31', 'regular', 19);
INSERT INTO public.clientes VALUES (1797, 'Eduardo', 'Vega Moreno', 'eduardo1797@gmail.com', '5564447809', 5, '2024-05-07', 'nuevo', 19);
INSERT INTO public.clientes VALUES (1812, 'Claudia', 'Hernández Martínez', 'claudia1812@hotmail.com', '5531958106', 5, '2022-07-26', 'regular', 19);
INSERT INTO public.clientes VALUES (1815, 'Juan', 'Aguilar Cruz', 'juan1815@gmail.com', '5518439853', 5, '2024-05-20', 'regular', 19);
INSERT INTO public.clientes VALUES (1841, 'Roberto', 'Hernández Morales', 'roberto1841@gmail.com', '5528399621', 5, '2025-01-08', 'regular', 19);
INSERT INTO public.clientes VALUES (1927, 'Roberto', 'Gutiérrez Flores', 'roberto1927@yahoo.com', '5522933377', 5, '2024-08-22', 'premium', 19);
INSERT INTO public.clientes VALUES (1940, 'Elena', 'Gutiérrez Castillo', 'elena1940@hotmail.com', '5533916938', 5, '2022-06-06', 'mayorista', 19);
INSERT INTO public.clientes VALUES (1943, 'Carmen', 'Flores Flores', 'carmen1943@yahoo.com', '5568405557', 5, '2022-02-28', 'regular', 19);
INSERT INTO public.clientes VALUES (1952, 'Pablo', 'Gómez Torres', 'pablo1952@gmail.com', '5518215004', 5, '2021-09-25', 'regular', 19);
INSERT INTO public.clientes VALUES (69, 'Ana', 'Hernández Rivera', 'ana69@gmail.com', '5581988124', 3, '2025-09-27', 'regular', 20);
INSERT INTO public.clientes VALUES (92, 'David', 'Rivera Castro', 'david92@gmail.com', '5565904597', 3, '2021-07-26', 'premium', 20);
INSERT INTO public.clientes VALUES (128, 'Mónica', 'López Ramírez', 'mónica128@hotmail.com', '5532010905', 3, '2025-12-07', 'regular', 20);
INSERT INTO public.clientes VALUES (157, 'Valeria', 'Pérez Pérez', 'valeria157@hotmail.com', '5569205536', 3, '2024-11-30', 'regular', 20);
INSERT INTO public.clientes VALUES (162, 'Laura', 'Aguilar Mendoza', 'laura162@gmail.com', '5572850928', 3, '2023-11-21', 'regular', 20);
INSERT INTO public.clientes VALUES (200, 'Alberto', 'Moreno Castro', 'alberto200@gmail.com', '5590448089', 3, '2022-06-22', 'nuevo', 20);
INSERT INTO public.clientes VALUES (295, 'Sofía', 'Gómez Cruz', 'sofía295@gmail.com', '5521409300', 3, '2025-08-22', 'regular', 20);
INSERT INTO public.clientes VALUES (305, 'Roberto', 'Morales Díaz', 'roberto305@hotmail.com', '5575425092', 3, '2023-04-03', 'premium', 20);
INSERT INTO public.clientes VALUES (326, 'Patricia', 'Sánchez Martínez', 'patricia326@gmail.com', '5577142220', 3, '2023-07-09', 'premium', 20);
INSERT INTO public.clientes VALUES (336, 'Claudia', 'Morales Ramos', 'claudia336@hotmail.com', '5566689004', 3, '2021-10-27', 'regular', 20);
INSERT INTO public.clientes VALUES (355, 'Roberto', 'Hernández Morales', 'roberto355@hotmail.com', '5568576625', 3, '2023-09-02', 'regular', 20);
INSERT INTO public.clientes VALUES (356, 'Manuel', 'Morales Cruz', 'manuel356@hotmail.com', '5529871432', 3, '2024-06-26', 'regular', 20);
INSERT INTO public.clientes VALUES (365, 'Gabriela', 'Castro Moreno', 'gabriela365@gmail.com', '5558190104', 3, '2021-10-11', 'regular', 20);
INSERT INTO public.clientes VALUES (392, 'Andrés', 'Mendoza Cruz', 'andrés392@gmail.com', '5524888885', 3, '2022-01-23', 'premium', 20);
INSERT INTO public.clientes VALUES (393, 'Sofía', 'Aguilar Gutiérrez', 'sofía393@yahoo.com', '5594547252', 3, '2021-07-24', 'regular', 20);
INSERT INTO public.clientes VALUES (394, 'Sergio', 'Castillo Cruz', 'sergio394@gmail.com', '5576892907', 3, '2025-07-31', 'premium', 20);
INSERT INTO public.clientes VALUES (413, 'Andrés', 'González Castillo', 'andrés413@gmail.com', '5581020117', 3, '2022-07-20', 'regular', 20);
INSERT INTO public.clientes VALUES (470, 'Luis', 'García Aguilar', 'luis470@gmail.com', '5560858151', 3, '2024-07-18', 'vip', 20);
INSERT INTO public.clientes VALUES (482, 'Laura', 'Mendoza Ramírez', 'laura482@gmail.com', '5523208247', 3, '2026-01-16', 'regular', 20);
INSERT INTO public.clientes VALUES (561, 'Luis', 'López Flores', 'luis561@gmail.com', '5535253920', 3, '2023-03-26', 'regular', 20);
INSERT INTO public.clientes VALUES (609, 'José', 'Reyes Reyes', 'josé609@gmail.com', '5565125778', 3, '2023-09-17', 'regular', 20);
INSERT INTO public.clientes VALUES (649, 'Sergio', 'Sánchez Núñez', 'sergio649@gmail.com', '5561639439', 3, '2023-09-08', 'regular', 20);
INSERT INTO public.clientes VALUES (673, 'Fernando', 'Flores Herrera', 'fernando673@yahoo.com', '5527383462', 3, '2024-08-02', 'regular', 20);
INSERT INTO public.clientes VALUES (686, 'Andrés', 'Cruz Vargas', 'andrés686@gmail.com', '5572391513', 3, '2025-12-18', 'regular', 20);
INSERT INTO public.clientes VALUES (700, 'Manuel', 'Díaz Reyes', 'manuel700@gmail.com', '5555073885', 3, '2025-06-16', 'regular', 20);
INSERT INTO public.clientes VALUES (710, 'Carmen', 'Gómez Castro', 'carmen710@yahoo.com', '5541000202', 3, '2022-06-18', 'mayorista', 20);
INSERT INTO public.clientes VALUES (715, 'Juan', 'Vargas García', 'juan715@gmail.com', '5587759654', 3, '2025-10-27', 'regular', 20);
INSERT INTO public.clientes VALUES (720, 'Verónica', 'García Rodríguez', 'verónica720@gmail.com', '5544158548', 3, '2025-05-13', 'premium', 20);
INSERT INTO public.clientes VALUES (732, 'Diego', 'Morales Hernández', 'diego732@gmail.com', '5566537506', 3, '2025-09-30', 'regular', 20);
INSERT INTO public.clientes VALUES (779, 'Francisco', 'Cruz Aguilar', 'francisco779@yahoo.com', '5597225409', 3, '2024-07-29', 'regular', 20);
INSERT INTO public.clientes VALUES (783, 'Carlos', 'González Jiménez', 'carlos783@gmail.com', '5579769403', 3, '2025-01-21', 'regular', 20);
INSERT INTO public.clientes VALUES (796, 'Diego', 'Flores Herrera', 'diego796@hotmail.com', '5541758221', 3, '2021-07-04', 'regular', 20);
INSERT INTO public.clientes VALUES (804, 'José', 'González Mendoza', 'josé804@gmail.com', '5523544314', 3, '2023-08-25', 'regular', 20);
INSERT INTO public.clientes VALUES (859, 'Rosa', 'Díaz Reyes', 'rosa859@hotmail.com', '5552193677', 3, '2024-06-30', 'regular', 20);
INSERT INTO public.clientes VALUES (874, 'Sofía', 'Rodríguez Cruz', 'sofía874@gmail.com', '5598665957', 3, '2024-06-30', 'premium', 20);
INSERT INTO public.clientes VALUES (959, 'Miguel', 'González Jiménez', 'miguel959@gmail.com', '5595606010', 3, '2024-04-20', 'regular', 20);
INSERT INTO public.clientes VALUES (972, 'Fernanda', 'Núñez Gutiérrez', 'fernanda972@hotmail.com', '5526575085', 3, '2024-03-23', 'regular', 20);
INSERT INTO public.clientes VALUES (974, 'Alberto', 'Ramírez Flores', 'alberto974@gmail.com', '5594594167', 3, '2022-09-20', 'mayorista', 20);
INSERT INTO public.clientes VALUES (983, 'Elena', 'Mendoza Rodríguez', 'elena983@gmail.com', '5577137712', 3, '2021-12-09', 'premium', 20);
INSERT INTO public.clientes VALUES (1003, 'Ricardo', 'Ortega Herrera', 'ricardo1003@gmail.com', '5572313438', 3, '2023-06-08', 'mayorista', 20);
INSERT INTO public.clientes VALUES (1004, 'José', 'Pérez Morales', 'josé1004@yahoo.com', '5536494075', 3, '2023-05-28', 'regular', 20);
INSERT INTO public.clientes VALUES (1035, 'Fernando', 'Herrera Rivera', 'fernando1035@hotmail.com', '5569007608', 3, '2021-10-07', 'vip', 20);
INSERT INTO public.clientes VALUES (1037, 'Roberto', 'Reyes Núñez', 'roberto1037@gmail.com', '5579322944', 3, '2025-07-13', 'premium', 20);
INSERT INTO public.clientes VALUES (1059, 'Carlos', 'Gutiérrez González', 'carlos1059@hotmail.com', '5524916551', 3, '2023-05-11', 'premium', 20);
INSERT INTO public.clientes VALUES (1123, 'Ramón', 'Vargas Jiménez', 'ramón1123@hotmail.com', '5537652856', 3, '2024-10-25', 'regular', 20);
INSERT INTO public.clientes VALUES (1130, 'Gabriela', 'Gutiérrez Torres', 'gabriela1130@hotmail.com', '5524561556', 3, '2024-03-25', 'mayorista', 20);
INSERT INTO public.clientes VALUES (1169, 'Mónica', 'Vargas Vega', 'mónica1169@hotmail.com', '5592217107', 3, '2026-02-16', 'premium', 20);
INSERT INTO public.clientes VALUES (1173, 'Roberto', 'Pérez Ramírez', 'roberto1173@hotmail.com', '5535413534', 3, '2022-07-03', 'premium', 20);
INSERT INTO public.clientes VALUES (1183, 'Roberto', 'González Ortega', 'roberto1183@gmail.com', '5539124413', 3, '2026-05-09', 'regular', 20);
INSERT INTO public.clientes VALUES (1214, 'Sandra', 'Herrera Gómez', 'sandra1214@yahoo.com', '5562002935', 3, '2022-04-12', 'vip', 20);
INSERT INTO public.clientes VALUES (1250, 'Roberto', 'Hernández Torres', 'roberto1250@gmail.com', '5567274946', 3, '2022-08-05', 'regular', 20);
INSERT INTO public.clientes VALUES (1279, 'Miguel', 'Díaz Vargas', 'miguel1279@gmail.com', '5589896025', 3, '2023-10-10', 'regular', 20);
INSERT INTO public.clientes VALUES (1333, 'Carmen', 'Castro Gómez', 'carmen1333@gmail.com', '5575815017', 3, '2024-12-11', 'regular', 20);
INSERT INTO public.clientes VALUES (1382, 'Mario', 'Ramírez Vargas', 'mario1382@gmail.com', '5510194969', 3, '2024-03-03', 'regular', 20);
INSERT INTO public.clientes VALUES (1383, 'Patricia', 'Ortega Rodríguez', 'patricia1383@gmail.com', '5587873678', 3, '2022-09-06', 'regular', 20);
INSERT INTO public.clientes VALUES (1393, 'Ricardo', 'Gutiérrez Reyes', 'ricardo1393@gmail.com', '5529420254', 3, '2024-12-10', 'premium', 20);
INSERT INTO public.clientes VALUES (1397, 'Manuel', 'Díaz Ortega', 'manuel1397@yahoo.com', '5535148626', 3, '2022-05-03', 'regular', 20);
INSERT INTO public.clientes VALUES (1406, 'Claudia', 'Aguilar Pérez', 'claudia1406@gmail.com', '5554391723', 3, '2025-12-12', 'regular', 20);
INSERT INTO public.clientes VALUES (1425, 'Adriana', 'García Ramos', 'adriana1425@yahoo.com', '5560874566', 3, '2021-12-27', 'vip', 20);
INSERT INTO public.clientes VALUES (1433, 'Sandra', 'Rodríguez González', 'sandra1433@yahoo.com', '5516306434', 3, '2021-08-04', 'regular', 20);
INSERT INTO public.clientes VALUES (1447, 'Ricardo', 'Mendoza González', 'ricardo1447@gmail.com', '5522087330', 3, '2022-06-16', 'regular', 20);
INSERT INTO public.clientes VALUES (1455, 'Eduardo', 'González Castro', 'eduardo1455@yahoo.com', '5519517739', 3, '2021-07-24', 'regular', 20);
INSERT INTO public.clientes VALUES (1479, 'Gabriela', 'Aguilar García', 'gabriela1479@gmail.com', '5564689989', 3, '2025-08-24', 'vip', 20);
INSERT INTO public.clientes VALUES (1496, 'Carmen', 'Moreno Martínez', 'carmen1496@yahoo.com', '5560979859', 3, '2025-03-20', 'premium', 20);
INSERT INTO public.clientes VALUES (1502, 'Claudia', 'Castro Aguilar', 'claudia1502@gmail.com', '5534480241', 3, '2022-12-03', 'regular', 20);
INSERT INTO public.clientes VALUES (1529, 'Elena', 'Vega Castillo', 'elena1529@hotmail.com', '5559667523', 3, '2025-03-11', 'mayorista', 20);
INSERT INTO public.clientes VALUES (1534, 'Eduardo', 'Pérez Gómez', 'eduardo1534@yahoo.com', '5570891460', 3, '2024-08-11', 'mayorista', 20);
INSERT INTO public.clientes VALUES (1557, 'Andrés', 'Gómez Castro', 'andrés1557@gmail.com', '5542358410', 3, '2024-03-30', 'regular', 20);
INSERT INTO public.clientes VALUES (1560, 'Liliana', 'Núñez Jiménez', 'liliana1560@yahoo.com', '5532977078', 3, '2022-05-03', 'regular', 20);
INSERT INTO public.clientes VALUES (1577, 'Luis', 'González Gómez', 'luis1577@yahoo.com', '5530372558', 3, '2025-04-13', 'regular', 20);
INSERT INTO public.clientes VALUES (1596, 'Alejandro', 'Cruz Díaz', 'alejandro1596@yahoo.com', '5517972328', 3, '2021-12-22', 'premium', 20);
INSERT INTO public.clientes VALUES (1671, 'Andrés', 'Flores Ramos', 'andrés1671@yahoo.com', '5520295008', 3, '2025-08-29', 'vip', 20);
INSERT INTO public.clientes VALUES (1678, 'Ricardo', 'Castro Torres', 'ricardo1678@hotmail.com', '5595143591', 3, '2023-07-23', 'regular', 20);
INSERT INTO public.clientes VALUES (1692, 'Verónica', 'Núñez Mendoza', 'verónica1692@gmail.com', '5561839427', 3, '2026-05-20', 'regular', 20);
INSERT INTO public.clientes VALUES (1736, 'Adriana', 'Hernández Gutiérrez', 'adriana1736@gmail.com', '5553560692', 3, '2026-03-16', 'regular', 20);
INSERT INTO public.clientes VALUES (1737, 'María', 'Moreno Jiménez', 'maría1737@yahoo.com', '5521184988', 3, '2023-11-07', 'premium', 20);
INSERT INTO public.clientes VALUES (1766, 'Manuel', 'García Rodríguez', 'manuel1766@hotmail.com', '5532581930', 3, '2022-10-25', 'premium', 20);
INSERT INTO public.clientes VALUES (1767, 'Carmen', 'López Rivera', 'carmen1767@gmail.com', '5580388195', 3, '2023-07-08', 'regular', 20);
INSERT INTO public.clientes VALUES (1768, 'Carlos', 'Moreno Rivera', 'carlos1768@gmail.com', '5568214906', 3, '2022-02-10', 'regular', 20);
INSERT INTO public.clientes VALUES (1804, 'Daniela', 'Ortega Gómez', 'daniela1804@hotmail.com', '5534390563', 3, '2021-08-29', 'vip', 20);
INSERT INTO public.clientes VALUES (1808, 'Mario', 'Sánchez Moreno', 'mario1808@gmail.com', '5540333941', 3, '2022-08-17', 'vip', 20);
INSERT INTO public.clientes VALUES (1817, 'David', 'Cruz Moreno', 'david1817@gmail.com', '5536154680', 3, '2024-01-22', 'regular', 20);
INSERT INTO public.clientes VALUES (1826, 'Fernanda', 'Hernández Martínez', 'fernanda1826@yahoo.com', '5563207360', 3, '2024-06-16', 'premium', 20);
INSERT INTO public.clientes VALUES (1835, 'David', 'Sánchez Vega', 'david1835@gmail.com', '5550921707', 3, '2022-10-13', 'regular', 20);
INSERT INTO public.clientes VALUES (1842, 'María', 'López Jiménez', 'maría1842@gmail.com', '5576589496', 3, '2025-09-06', 'premium', 20);
INSERT INTO public.clientes VALUES (1913, 'Alejandro', 'Jiménez Reyes', 'alejandro1913@hotmail.com', '5555586036', 3, '2025-05-09', 'regular', 20);
INSERT INTO public.clientes VALUES (1920, 'Pablo', 'Vargas Gómez', 'pablo1920@hotmail.com', '5551713824', 3, '2023-02-07', 'regular', 20);
INSERT INTO public.clientes VALUES (1959, 'Claudia', 'Núñez Ramos', 'claudia1959@gmail.com', '5597728424', 3, '2023-06-20', 'regular', 20);
INSERT INTO public.clientes VALUES (1976, 'Gabriela', 'Martínez Aguilar', 'gabriela1976@gmail.com', '5571907135', 3, '2024-06-12', 'regular', 20);


--
-- TOC entry 5090 (class 0 OID 24593)
-- Dependencies: 221
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.departamentos VALUES (1, 'Ventas', 850000.00, 5);
INSERT INTO public.departamentos VALUES (2, 'Marketing', 420000.00, 5);
INSERT INTO public.departamentos VALUES (3, 'Tecnología', 960000.00, 5);
INSERT INTO public.departamentos VALUES (4, 'Recursos Humanos', 310000.00, 5);
INSERT INTO public.departamentos VALUES (5, 'Finanzas', 540000.00, 5);
INSERT INTO public.departamentos VALUES (6, 'Operaciones', 720000.00, 1);
INSERT INTO public.departamentos VALUES (7, 'Logística', 680000.00, 2);
INSERT INTO public.departamentos VALUES (8, 'Servicio al Cliente', 290000.00, 3);
INSERT INTO public.departamentos VALUES (9, 'Compras', 380000.00, 4);
INSERT INTO public.departamentos VALUES (10, 'Legal', 260000.00, 5);


--
-- TOC entry 5091 (class 0 OID 24598)
-- Dependencies: 222
-- Data for Name: detalle_pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5092 (class 0 OID 24606)
-- Dependencies: 223
-- Data for Name: empleados; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.empleados VALUES (1, 'Alejandro', 'Sánchez Sánchez', 'alejandro.sánchez1@techstore.mx', 'Analista de Marketing', 65762.40, '2018-10-11', 2, NULL);
INSERT INTO public.empleados VALUES (2, 'Mario', 'Hernández García', 'mario.hernández2@techstore.mx', 'Jefe de Compras', 27960.57, '2020-09-12', 9, NULL);
INSERT INTO public.empleados VALUES (3, 'Fernando', 'Castillo Vargas', 'fernando.castillo3@techstore.mx', 'Paralegal', 28092.17, '2019-10-04', 10, NULL);
INSERT INTO public.empleados VALUES (4, 'María', 'Herrera Mendoza', 'maría.herrera4@techstore.mx', 'Contador', 62964.18, '2022-07-20', 5, NULL);
INSERT INTO public.empleados VALUES (5, 'David', 'Martínez López', 'david.martínez5@techstore.mx', 'Auditor Interno', 19060.30, '2016-11-10', 5, NULL);
INSERT INTO public.empleados VALUES (6, 'Ana', 'Ramos Cruz', 'ana.ramos6@techstore.mx', 'Director de Operaciones', 83037.45, '2022-02-13', 6, NULL);
INSERT INTO public.empleados VALUES (7, 'Adriana', 'Castro Vega', 'adriana.castro7@techstore.mx', 'Especialista en SEO', 54146.71, '2018-06-19', 2, NULL);
INSERT INTO public.empleados VALUES (8, 'Ricardo', 'Herrera Torres', 'ricardo.herrera8@techstore.mx', 'Director de Marketing', 74438.19, '2016-08-24', 2, NULL);
INSERT INTO public.empleados VALUES (9, 'Andrés', 'Vargas Aguilar', 'andrés.vargas9@techstore.mx', 'Especialista en SEO', 23873.75, '2022-05-19', 2, NULL);
INSERT INTO public.empleados VALUES (10, 'Laura', 'Jiménez Vargas', 'laura.jiménez10@techstore.mx', 'Reclutador', 50992.21, '2023-08-15', 4, NULL);
INSERT INTO public.empleados VALUES (11, 'Alejandro', 'Núñez Vargas', 'alejandro.núñez11@techstore.mx', 'DBA', 28031.91, '2022-09-23', 3, 1);
INSERT INTO public.empleados VALUES (12, 'Valeria', 'Gómez Ramírez', 'valeria.gómez12@techstore.mx', 'Director de RH', 27401.75, '2020-01-02', 4, 6);
INSERT INTO public.empleados VALUES (13, 'Fernanda', 'Castro Núñez', 'fernanda.castro13@techstore.mx', 'Coordinador de Capacitación', 22429.63, '2024-10-19', 4, 4);
INSERT INTO public.empleados VALUES (14, 'Liliana', 'Díaz Castro', 'liliana.díaz14@techstore.mx', 'Negociador de Proveedores', 38425.74, '2024-10-24', 9, 9);
INSERT INTO public.empleados VALUES (15, 'Miguel', 'Vega Martínez', 'miguel.vega15@techstore.mx', 'Agente de Soporte', 57803.56, '2017-06-25', 8, 11);
INSERT INTO public.empleados VALUES (16, 'Fernanda', 'Gómez Jiménez', 'fernanda.gómez16@techstore.mx', 'Controlador de Inventario', 50625.35, '2020-02-28', 7, 14);
INSERT INTO public.empleados VALUES (17, 'Sofía', 'Moreno Castro', 'sofía.moreno17@techstore.mx', 'Representante de Ventas', 68107.71, '2022-07-20', 1, 4);
INSERT INTO public.empleados VALUES (18, 'Andrés', 'García Ramos', 'andrés.garcía18@techstore.mx', 'Analista Financiero', 82947.83, '2017-10-27', 5, 6);
INSERT INTO public.empleados VALUES (19, 'Gabriela', 'Aguilar Vargas', 'gabriela.aguilar19@techstore.mx', 'Analista de Compras', 23157.27, '2017-10-24', 9, 6);
INSERT INTO public.empleados VALUES (20, 'Sandra', 'Núñez García', 'sandra.núñez20@techstore.mx', 'Comprador Senior', 47668.22, '2025-02-09', 9, 12);
INSERT INTO public.empleados VALUES (21, 'Ricardo', 'Castro Ortega', 'ricardo.castro21@techstore.mx', 'CFO', 18252.70, '2020-11-30', 5, 3);
INSERT INTO public.empleados VALUES (22, 'Patricia', 'Moreno Morales', 'patricia.moreno22@techstore.mx', 'Analista de Compras', 31349.13, '2016-07-31', 9, 20);
INSERT INTO public.empleados VALUES (23, 'Verónica', 'Herrera Ramos', 'verónica.herrera23@techstore.mx', 'Coordinador de Envíos', 64045.28, '2021-11-21', 7, 22);
INSERT INTO public.empleados VALUES (24, 'Francisco', 'Cruz Martínez', 'francisco.cruz24@techstore.mx', 'Supervisor de Almacén', 28402.91, '2022-07-29', 6, 1);
INSERT INTO public.empleados VALUES (25, 'Liliana', 'Sánchez García', 'liliana.sánchez25@techstore.mx', 'Director Legal', 63672.39, '2025-09-14', 10, 8);
INSERT INTO public.empleados VALUES (26, 'Valeria', 'López Reyes', 'valeria.lópez26@techstore.mx', 'Analista de Marketing', 32328.84, '2020-12-02', 2, 7);
INSERT INTO public.empleados VALUES (27, 'Ramón', 'Ortega Morales', 'ramón.ortega27@techstore.mx', 'Analista de Compras', 69277.22, '2017-04-23', 9, 14);
INSERT INTO public.empleados VALUES (28, 'Mario', 'Rivera Díaz', 'mario.rivera28@techstore.mx', 'Coordinador de Capacitación', 46092.80, '2018-03-10', 4, 2);
INSERT INTO public.empleados VALUES (29, 'David', 'Mendoza Vega', 'david.mendoza29@techstore.mx', 'Director de Marketing', 30151.91, '2024-03-25', 2, 18);
INSERT INTO public.empleados VALUES (30, 'Roberto', 'Ramírez Cruz', 'roberto.ramírez30@techstore.mx', 'Agente de Soporte', 75837.47, '2025-07-09', 8, 15);
INSERT INTO public.empleados VALUES (31, 'Manuel', 'Aguilar García', 'manuel.aguilar31@techstore.mx', 'Jefe de Compras', 79624.79, '2016-11-05', 9, 8);
INSERT INTO public.empleados VALUES (32, 'Diego', 'Pérez Vega', 'diego.pérez32@techstore.mx', 'Analista de Sistemas', 77878.33, '2024-07-08', 3, 13);
INSERT INTO public.empleados VALUES (33, 'Isabel', 'Núñez Mendoza', 'isabel.núñez33@techstore.mx', 'Asesor Comercial', 32823.19, '2018-07-21', 1, 32);
INSERT INTO public.empleados VALUES (34, 'Fernando', 'Hernández Ortega', 'fernando.hernández34@techstore.mx', 'DBA', 16449.90, '2022-11-06', 3, 4);
INSERT INTO public.empleados VALUES (35, 'Sandra', 'Núñez Vega', 'sandra.núñez35@techstore.mx', 'Ejecutivo de Ventas', 16152.21, '2020-09-01', 1, 6);
INSERT INTO public.empleados VALUES (36, 'José', 'Moreno Vega', 'josé.moreno36@techstore.mx', 'Desarrollador Senior', 41475.62, '2019-12-23', 3, 16);
INSERT INTO public.empleados VALUES (37, 'Adriana', 'López Díaz', 'adriana.lópez37@techstore.mx', 'Asesor Legal', 80233.56, '2024-01-28', 10, 21);
INSERT INTO public.empleados VALUES (38, 'Juan', 'Moreno Vargas', 'juan.moreno38@techstore.mx', 'Especialista en Nómina', 45377.39, '2017-12-07', 4, 5);
INSERT INTO public.empleados VALUES (39, 'Ramón', 'Martínez López', 'ramón.martínez39@techstore.mx', 'Ejecutivo de Ventas', 48929.58, '2024-11-17', 1, 23);
INSERT INTO public.empleados VALUES (40, 'Daniela', 'Torres Rodríguez', 'daniela.torres40@techstore.mx', 'Diseñador Gráfico', 72863.38, '2018-06-23', 2, 20);
INSERT INTO public.empleados VALUES (41, 'Sandra', 'García Moreno', 'sandra.garcía41@techstore.mx', 'Asesor Legal', 80018.19, '2025-03-15', 10, 9);
INSERT INTO public.empleados VALUES (42, 'Luis', 'Ramos Gutiérrez', 'luis.ramos42@techstore.mx', 'Contador', 31881.42, '2019-08-01', 5, 14);
INSERT INTO public.empleados VALUES (43, 'Alejandro', 'Reyes Morales', 'alejandro.reyes43@techstore.mx', 'Coordinador de Operaciones', 78089.56, '2016-11-16', 6, 4);
INSERT INTO public.empleados VALUES (44, 'Isabel', 'Hernández García', 'isabel.hernández44@techstore.mx', 'Especialista en SEO', 68291.70, '2019-03-22', 2, 17);
INSERT INTO public.empleados VALUES (45, 'Verónica', 'Castillo Díaz', 'verónica.castillo45@techstore.mx', 'DBA', 12705.89, '2025-07-09', 3, 10);
INSERT INTO public.empleados VALUES (46, 'Eduardo', 'Ortega Gutiérrez', 'eduardo.ortega46@techstore.mx', 'Analista de Compras', 43374.43, '2025-11-23', 9, 20);
INSERT INTO public.empleados VALUES (47, 'Ana', 'Castro Rivera', 'ana.castro47@techstore.mx', 'Supervisor de Almacén', 61790.87, '2018-11-20', 6, 7);
INSERT INTO public.empleados VALUES (48, 'Alejandra', 'Jiménez Ramos', 'alejandra.jiménez48@techstore.mx', 'Supervisor de Almacén', 79580.76, '2023-09-17', 6, 11);
INSERT INTO public.empleados VALUES (49, 'María', 'Rodríguez Ramos', 'maría.rodríguez49@techstore.mx', 'Desarrollador Junior', 69114.21, '2021-09-30', 3, 43);
INSERT INTO public.empleados VALUES (50, 'Luis', 'Gómez Vega', 'luis.gómez50@techstore.mx', 'Director de RH', 74677.31, '2023-11-14', 4, 13);
INSERT INTO public.empleados VALUES (51, 'Ricardo', 'Sánchez García', 'ricardo.sánchez51@techstore.mx', 'Agente de Soporte', 41088.02, '2023-03-29', 8, 5);
INSERT INTO public.empleados VALUES (52, 'Francisco', 'Gómez Moreno', 'francisco.gómez52@techstore.mx', 'Analista Financiero', 80564.31, '2025-01-26', 5, 17);
INSERT INTO public.empleados VALUES (53, 'Isabel', 'Hernández Martínez', 'isabel.hernández53@techstore.mx', 'DBA', 43723.15, '2018-03-12', 3, 51);
INSERT INTO public.empleados VALUES (54, 'Francisco', 'Martínez Gómez', 'francisco.martínez54@techstore.mx', 'Supervisor de Almacén', 30594.74, '2018-06-01', 6, 28);
INSERT INTO public.empleados VALUES (55, 'Verónica', 'Moreno Ramos', 'verónica.moreno55@techstore.mx', 'Ejecutivo de Ventas', 38588.17, '2025-07-31', 1, 43);
INSERT INTO public.empleados VALUES (56, 'Sofía', 'Ramos Castro', 'sofía.ramos56@techstore.mx', 'Coordinador de Operaciones', 49019.94, '2018-11-20', 6, 27);
INSERT INTO public.empleados VALUES (57, 'Sergio', 'Gutiérrez González', 'sergio.gutiérrez57@techstore.mx', 'Supervisor de Almacén', 42692.58, '2022-02-11', 6, 44);
INSERT INTO public.empleados VALUES (58, 'Gabriela', 'Gómez Gutiérrez', 'gabriela.gómez58@techstore.mx', 'CTO', 34182.87, '2024-01-04', 3, 28);
INSERT INTO public.empleados VALUES (59, 'Valeria', 'Cruz Cruz', 'valeria.cruz59@techstore.mx', 'Paralegal', 61320.79, '2020-08-19', 10, 31);
INSERT INTO public.empleados VALUES (60, 'Gabriela', 'Reyes Moreno', 'gabriela.reyes60@techstore.mx', 'DBA', 36468.74, '2017-03-09', 3, 49);
INSERT INTO public.empleados VALUES (61, 'Elena', 'Mendoza Pérez', 'elena.mendoza61@techstore.mx', 'Reclutador', 13783.05, '2023-08-15', 4, 31);
INSERT INTO public.empleados VALUES (62, 'Laura', 'Cruz Díaz', 'laura.cruz62@techstore.mx', 'Abogado Corporativo', 64439.25, '2022-01-22', 10, 32);
INSERT INTO public.empleados VALUES (63, 'Carlos', 'Castro Herrera', 'carlos.castro63@techstore.mx', 'Jefe de Logística', 68824.69, '2023-11-29', 7, 12);
INSERT INTO public.empleados VALUES (64, 'Manuel', 'Sánchez Núñez', 'manuel.sánchez64@techstore.mx', 'Jefe de Compras', 45321.71, '2017-05-18', 9, 30);
INSERT INTO public.empleados VALUES (65, 'Adriana', 'Flores Herrera', 'adriana.flores65@techstore.mx', 'Negociador de Proveedores', 56723.62, '2018-04-19', 9, 55);
INSERT INTO public.empleados VALUES (66, 'Roberto', 'Ramos Vega', 'roberto.ramos66@techstore.mx', 'Negociador de Proveedores', 44855.09, '2017-12-07', 9, 32);
INSERT INTO public.empleados VALUES (67, 'Sandra', 'Morales Vargas', 'sandra.morales67@techstore.mx', 'Contador', 32045.61, '2025-06-30', 5, 37);
INSERT INTO public.empleados VALUES (68, 'David', 'Castro Gutiérrez', 'david.castro68@techstore.mx', 'Director de RH', 22101.31, '2023-10-09', 4, 50);
INSERT INTO public.empleados VALUES (69, 'Laura', 'Díaz Díaz', 'laura.díaz69@techstore.mx', 'Desarrollador Junior', 51610.61, '2021-09-13', 3, 8);
INSERT INTO public.empleados VALUES (70, 'Fernanda', 'Castro Herrera', 'fernanda.castro70@techstore.mx', 'Director de RH', 74541.44, '2017-10-12', 4, 49);
INSERT INTO public.empleados VALUES (71, 'Eduardo', 'Torres Herrera', 'eduardo.torres71@techstore.mx', 'Coordinador de CX', 74301.70, '2016-12-28', 8, 54);
INSERT INTO public.empleados VALUES (72, 'Verónica', 'Mendoza Jiménez', 'verónica.mendoza72@techstore.mx', 'Analista de Compras', 47640.75, '2023-04-22', 9, 56);
INSERT INTO public.empleados VALUES (73, 'David', 'Moreno Moreno', 'david.moreno73@techstore.mx', 'Coordinador de CX', 64865.24, '2016-12-09', 8, 60);
INSERT INTO public.empleados VALUES (74, 'Verónica', 'García Núñez', 'verónica.garcía74@techstore.mx', 'Analista de Sistemas', 55208.17, '2018-12-06', 3, 4);
INSERT INTO public.empleados VALUES (75, 'Patricia', 'Vega Cruz', 'patricia.vega75@techstore.mx', 'Analista de Marketing', 15670.78, '2022-02-11', 2, 42);
INSERT INTO public.empleados VALUES (76, 'David', 'Herrera Castro', 'david.herrera76@techstore.mx', 'Coordinador de Capacitación', 32312.73, '2017-01-13', 4, 54);
INSERT INTO public.empleados VALUES (77, 'Claudia', 'García Ramos', 'claudia.garcía77@techstore.mx', 'CFO', 84993.27, '2022-06-10', 5, 29);
INSERT INTO public.empleados VALUES (78, 'Ana', 'Herrera García', 'ana.herrera78@techstore.mx', 'Analista de Marketing', 26553.33, '2026-02-19', 2, 20);
INSERT INTO public.empleados VALUES (79, 'Luis', 'Ortega Pérez', 'luis.ortega79@techstore.mx', 'Coordinador de Capacitación', 63060.94, '2017-10-06', 4, 48);
INSERT INTO public.empleados VALUES (80, 'Sofía', 'Herrera Aguilar', 'sofía.herrera80@techstore.mx', 'Desarrollador Senior', 82424.62, '2025-02-25', 3, 75);
INSERT INTO public.empleados VALUES (81, 'Liliana', 'Moreno Núñez', 'liliana.moreno81@techstore.mx', 'Asesor Comercial', 40955.77, '2018-05-07', 1, 26);
INSERT INTO public.empleados VALUES (82, 'Elena', 'Martínez Castillo', 'elena.martínez82@techstore.mx', 'Especialista en SEO', 74071.41, '2019-08-19', 2, 16);
INSERT INTO public.empleados VALUES (83, 'Daniela', 'Gutiérrez Díaz', 'daniela.gutiérrez83@techstore.mx', 'Asesor Legal', 17033.84, '2019-02-07', 10, 44);
INSERT INTO public.empleados VALUES (84, 'Claudia', 'Martínez Díaz', 'claudia.martínez84@techstore.mx', 'Representante de Ventas', 58397.71, '2017-01-26', 1, 59);
INSERT INTO public.empleados VALUES (85, 'Francisco', 'Vargas Ramírez', 'francisco.vargas85@techstore.mx', 'DBA', 70998.54, '2020-04-30', 3, 62);
INSERT INTO public.empleados VALUES (86, 'Ramón', 'Ramírez Flores', 'ramón.ramírez86@techstore.mx', 'Agente de Soporte', 72643.36, '2025-05-24', 8, 36);
INSERT INTO public.empleados VALUES (87, 'Andrés', 'Ortega Jiménez', 'andrés.ortega87@techstore.mx', 'Coordinador de CX', 36556.95, '2020-10-27', 8, 42);
INSERT INTO public.empleados VALUES (88, 'Eduardo', 'Mendoza Ramírez', 'eduardo.mendoza88@techstore.mx', 'Desarrollador Junior', 32415.07, '2019-09-06', 3, 36);
INSERT INTO public.empleados VALUES (89, 'Fernando', 'López Sánchez', 'fernando.lópez89@techstore.mx', 'Negociador de Proveedores', 47666.18, '2017-11-11', 9, 31);
INSERT INTO public.empleados VALUES (90, 'Claudia', 'Cruz Mendoza', 'claudia.cruz90@techstore.mx', 'Jefe de Soporte', 18792.89, '2023-11-18', 8, 52);
INSERT INTO public.empleados VALUES (91, 'Ramón', 'Rivera Morales', 'ramón.rivera91@techstore.mx', 'Especialista en Nómina', 43061.78, '2017-12-31', 4, 71);
INSERT INTO public.empleados VALUES (92, 'Andrés', 'Ramírez Torres', 'andrés.ramírez92@techstore.mx', 'Coordinador de Operaciones', 28829.28, '2018-04-11', 6, 25);
INSERT INTO public.empleados VALUES (93, 'Manuel', 'Herrera Castillo', 'manuel.herrera93@techstore.mx', 'Supervisor de Almacén', 25982.49, '2018-01-30', 6, 62);
INSERT INTO public.empleados VALUES (94, 'Sandra', 'Jiménez Torres', 'sandra.jiménez94@techstore.mx', 'CFO', 72781.87, '2023-01-16', 5, 30);
INSERT INTO public.empleados VALUES (95, 'Carlos', 'Castillo Gutiérrez', 'carlos.castillo95@techstore.mx', 'Supervisor de Almacén', 32024.73, '2025-10-02', 6, 71);
INSERT INTO public.empleados VALUES (96, 'Patricia', 'Vargas Vega', 'patricia.vargas96@techstore.mx', 'Auditor Interno', 19488.90, '2026-03-24', 5, 74);
INSERT INTO public.empleados VALUES (97, 'Andrés', 'Flores Rodríguez', 'andrés.flores97@techstore.mx', 'CFO', 30430.92, '2016-09-13', 5, 62);
INSERT INTO public.empleados VALUES (98, 'Fernanda', 'Morales López', 'fernanda.morales98@techstore.mx', 'Director de Marketing', 23076.07, '2017-04-08', 2, 73);
INSERT INTO public.empleados VALUES (99, 'Ricardo', 'Martínez Gutiérrez', 'ricardo.martínez99@techstore.mx', 'Auditor Interno', 56261.19, '2017-07-01', 5, 80);
INSERT INTO public.empleados VALUES (100, 'Fernanda', 'Cruz Núñez', 'fernanda.cruz100@techstore.mx', 'Coordinador de Capacitación', 33706.78, '2019-10-07', 4, 55);
INSERT INTO public.empleados VALUES (101, 'Ana', 'Jiménez Ramos', 'ana.jiménez101@techstore.mx', 'CFO', 81174.08, '2024-01-13', 5, 81);
INSERT INTO public.empleados VALUES (102, 'José', 'Rodríguez Sánchez', 'josé.rodríguez102@techstore.mx', 'Reclutador', 52295.43, '2024-08-10', 4, 1);
INSERT INTO public.empleados VALUES (103, 'Alberto', 'Morales Torres', 'alberto.morales103@techstore.mx', 'Jefe de Logística', 28897.77, '2018-06-09', 7, 37);
INSERT INTO public.empleados VALUES (104, 'Ricardo', 'Núñez Ramírez', 'ricardo.núñez104@techstore.mx', 'Agente de Soporte', 43035.14, '2020-04-04', 8, 29);
INSERT INTO public.empleados VALUES (105, 'Patricia', 'López Hernández', 'patricia.lópez105@techstore.mx', 'Desarrollador Senior', 69861.89, '2019-09-10', 3, 96);
INSERT INTO public.empleados VALUES (106, 'Mónica', 'Martínez Cruz', 'mónica.martínez106@techstore.mx', 'Asesor Legal', 63080.56, '2023-04-24', 10, 65);
INSERT INTO public.empleados VALUES (107, 'José', 'Jiménez Hernández', 'josé.jiménez107@techstore.mx', 'Negociador de Proveedores', 65620.98, '2019-08-06', 9, 33);
INSERT INTO public.empleados VALUES (108, 'Ramón', 'Ortega García', 'ramón.ortega108@techstore.mx', 'Representante de Ventas', 54066.03, '2017-10-22', 1, 97);
INSERT INTO public.empleados VALUES (109, 'Andrés', 'Núñez Ramírez', 'andrés.núñez109@techstore.mx', 'Desarrollador Senior', 84777.02, '2021-06-23', 3, 82);
INSERT INTO public.empleados VALUES (110, 'Claudia', 'Rivera Díaz', 'claudia.rivera110@techstore.mx', 'Técnico de Soporte', 35437.25, '2025-03-11', 8, 21);
INSERT INTO public.empleados VALUES (111, 'Diego', 'Torres Moreno', 'diego.torres111@techstore.mx', 'Analista de Procesos', 71390.32, '2020-03-12', 6, 5);
INSERT INTO public.empleados VALUES (112, 'Alejandro', 'Flores Martínez', 'alejandro.flores112@techstore.mx', 'Coordinador de CX', 75138.47, '2017-02-11', 8, 1);
INSERT INTO public.empleados VALUES (113, 'Miguel', 'Pérez Reyes', 'miguel.pérez113@techstore.mx', 'Comprador Senior', 57452.27, '2020-10-10', 9, 81);
INSERT INTO public.empleados VALUES (114, 'Rosa', 'Ramírez Gutiérrez', 'rosa.ramírez114@techstore.mx', 'Agente de Soporte', 79720.11, '2021-06-14', 8, 113);
INSERT INTO public.empleados VALUES (115, 'Alberto', 'Mendoza Sánchez', 'alberto.mendoza115@techstore.mx', 'Agente de Soporte', 34684.76, '2026-03-18', 8, 71);
INSERT INTO public.empleados VALUES (116, 'Luis', 'Cruz Martínez', 'luis.cruz116@techstore.mx', 'Coordinador de Envíos', 48381.41, '2018-04-30', 7, 38);
INSERT INTO public.empleados VALUES (117, 'Alejandra', 'Aguilar Morales', 'alejandra.aguilar117@techstore.mx', 'Negociador de Proveedores', 29792.36, '2020-03-08', 9, 19);
INSERT INTO public.empleados VALUES (118, 'Alberto', 'Reyes Ramos', 'alberto.reyes118@techstore.mx', 'Coordinador de Envíos', 75073.97, '2023-04-08', 7, 99);
INSERT INTO public.empleados VALUES (119, 'Francisco', 'Ramírez Aguilar', 'francisco.ramírez119@techstore.mx', 'Jefe de Logística', 32647.25, '2023-01-07', 7, 108);
INSERT INTO public.empleados VALUES (120, 'Claudia', 'Vega González', 'claudia.vega120@techstore.mx', 'Paralegal', 51316.38, '2022-06-30', 10, 43);
INSERT INTO public.empleados VALUES (121, 'Fernanda', 'Cruz Núñez', 'fernanda.cruz121@techstore.mx', 'Comprador Senior', 75480.92, '2018-07-18', 9, 31);
INSERT INTO public.empleados VALUES (122, 'Mario', 'Hernández Flores', 'mario.hernández122@techstore.mx', 'Paralegal', 63481.64, '2017-04-07', 10, 49);
INSERT INTO public.empleados VALUES (123, 'Patricia', 'Morales Hernández', 'patricia.morales123@techstore.mx', 'Coordinador de Envíos', 48667.25, '2019-09-30', 7, 43);
INSERT INTO public.empleados VALUES (124, 'Mónica', 'Martínez Reyes', 'mónica.martínez124@techstore.mx', 'Diseñador Gráfico', 13120.37, '2024-09-30', 2, 53);
INSERT INTO public.empleados VALUES (125, 'Alejandro', 'Flores Jiménez', 'alejandro.flores125@techstore.mx', 'Analista de Sistemas', 59438.08, '2016-10-24', 3, 43);
INSERT INTO public.empleados VALUES (126, 'David', 'Vargas Castillo', 'david.vargas126@techstore.mx', 'Negociador de Proveedores', 75683.96, '2025-12-17', 9, 80);
INSERT INTO public.empleados VALUES (127, 'Sergio', 'Sánchez Ramos', 'sergio.sánchez127@techstore.mx', 'Director de Marketing', 43679.92, '2025-04-05', 2, 98);
INSERT INTO public.empleados VALUES (128, 'Sergio', 'Castro García', 'sergio.castro128@techstore.mx', 'Director de Marketing', 35679.35, '2025-09-26', 2, 38);
INSERT INTO public.empleados VALUES (129, 'Juan', 'Sánchez Reyes', 'juan.sánchez129@techstore.mx', 'Analista de Procesos', 53312.75, '2017-06-23', 6, 47);
INSERT INTO public.empleados VALUES (130, 'Alberto', 'Vega Gómez', 'alberto.vega130@techstore.mx', 'DBA', 61868.82, '2020-10-13', 3, 37);
INSERT INTO public.empleados VALUES (131, 'Alejandro', 'Cruz Ramírez', 'alejandro.cruz131@techstore.mx', 'Director de RH', 77620.32, '2021-02-23', 4, 74);
INSERT INTO public.empleados VALUES (132, 'Andrés', 'Rivera Ortega', 'andrés.rivera132@techstore.mx', 'Comprador Senior', 58642.53, '2021-08-10', 9, 65);
INSERT INTO public.empleados VALUES (133, 'Rosa', 'Gómez Vega', 'rosa.gómez133@techstore.mx', 'Coordinador de CX', 19785.69, '2022-02-01', 8, 92);
INSERT INTO public.empleados VALUES (134, 'Sergio', 'García Aguilar', 'sergio.garcía134@techstore.mx', 'Paralegal', 32037.07, '2020-01-07', 10, 13);
INSERT INTO public.empleados VALUES (135, 'Gabriela', 'Herrera Mendoza', 'gabriela.herrera135@techstore.mx', 'Abogado Corporativo', 56315.74, '2022-05-31', 10, 57);
INSERT INTO public.empleados VALUES (136, 'Patricia', 'Vargas Martínez', 'patricia.vargas136@techstore.mx', 'Director de RH', 34552.10, '2021-06-03', 4, 9);
INSERT INTO public.empleados VALUES (137, 'Juan', 'López Núñez', 'juan.lópez137@techstore.mx', 'Asesor Legal', 35850.50, '2021-09-15', 10, 45);
INSERT INTO public.empleados VALUES (138, 'Manuel', 'Castro Rivera', 'manuel.castro138@techstore.mx', 'Especialista en Nómina', 72624.50, '2023-06-26', 4, 124);
INSERT INTO public.empleados VALUES (139, 'Valeria', 'Mendoza Martínez', 'valeria.mendoza139@techstore.mx', 'Auditor Interno', 82291.21, '2024-10-14', 5, 58);
INSERT INTO public.empleados VALUES (140, 'Verónica', 'Rivera López', 'verónica.rivera140@techstore.mx', 'Controlador de Inventario', 13016.06, '2020-05-07', 7, 32);
INSERT INTO public.empleados VALUES (141, 'Alejandro', 'Ortega Gómez', 'alejandro.ortega141@techstore.mx', 'Técnico de Soporte', 19909.27, '2023-09-29', 8, 121);
INSERT INTO public.empleados VALUES (142, 'Verónica', 'Flores Núñez', 'verónica.flores142@techstore.mx', 'Ejecutivo de Ventas', 59278.62, '2019-03-29', 1, 119);
INSERT INTO public.empleados VALUES (143, 'Sofía', 'González Hernández', 'sofía.gonzález143@techstore.mx', 'CFO', 34218.61, '2020-11-03', 5, 30);
INSERT INTO public.empleados VALUES (144, 'Manuel', 'González Gómez', 'manuel.gonzález144@techstore.mx', 'Diseñador Gráfico', 39083.84, '2018-01-12', 2, 139);
INSERT INTO public.empleados VALUES (145, 'Patricia', 'Castro Díaz', 'patricia.castro145@techstore.mx', 'Jefe de Logística', 72859.60, '2019-06-18', 7, 105);
INSERT INTO public.empleados VALUES (146, 'Eduardo', 'Pérez Cruz', 'eduardo.pérez146@techstore.mx', 'Auditor Interno', 81390.53, '2016-10-09', 5, 93);
INSERT INTO public.empleados VALUES (147, 'Daniela', 'Gutiérrez Castro', 'daniela.gutiérrez147@techstore.mx', 'Especialista en SEO', 16420.16, '2023-04-09', 2, 49);
INSERT INTO public.empleados VALUES (148, 'Mónica', 'López Moreno', 'mónica.lópez148@techstore.mx', 'Analista de Marketing', 58844.43, '2019-09-02', 2, 6);
INSERT INTO public.empleados VALUES (149, 'Elena', 'González Mendoza', 'elena.gonzález149@techstore.mx', 'Ejecutivo de Ventas', 17008.54, '2017-10-13', 1, 142);
INSERT INTO public.empleados VALUES (150, 'Elena', 'Flores Herrera', 'elena.flores150@techstore.mx', 'Reclutador', 69570.99, '2019-09-06', 4, 1);
INSERT INTO public.empleados VALUES (151, 'Patricia', 'González Gutiérrez', 'patricia.gonzález151@techstore.mx', 'Analista Financiero', 70291.51, '2025-02-17', 5, 7);
INSERT INTO public.empleados VALUES (152, 'Ricardo', 'Ortega Flores', 'ricardo.ortega152@techstore.mx', 'CTO', 24719.97, '2025-10-11', 3, 33);
INSERT INTO public.empleados VALUES (153, 'Laura', 'Morales Cruz', 'laura.morales153@techstore.mx', 'Operador de Almacén', 49466.37, '2025-02-21', 7, 116);
INSERT INTO public.empleados VALUES (154, 'Alberto', 'Hernández Ramos', 'alberto.hernández154@techstore.mx', 'Comprador Senior', 45437.10, '2026-01-06', 9, 16);
INSERT INTO public.empleados VALUES (155, 'Alejandra', 'Moreno Martínez', 'alejandra.moreno155@techstore.mx', 'Coordinador de CX', 64005.30, '2021-05-23', 8, 19);
INSERT INTO public.empleados VALUES (156, 'Juan', 'López González', 'juan.lópez156@techstore.mx', 'Especialista en SEO', 57575.18, '2019-10-20', 2, 141);
INSERT INTO public.empleados VALUES (157, 'Alberto', 'Reyes Torres', 'alberto.reyes157@techstore.mx', 'Analista de Procesos', 48905.23, '2021-07-16', 6, 26);
INSERT INTO public.empleados VALUES (158, 'Verónica', 'Ramos Vega', 'verónica.ramos158@techstore.mx', 'Analista de Marketing', 43395.11, '2023-10-21', 2, 106);
INSERT INTO public.empleados VALUES (159, 'Fernanda', 'Díaz Ramos', 'fernanda.díaz159@techstore.mx', 'Director de Operaciones', 34816.03, '2022-11-10', 6, 66);
INSERT INTO public.empleados VALUES (160, 'Claudia', 'López López', 'claudia.lópez160@techstore.mx', 'Director de Operaciones', 18805.80, '2025-04-13', 6, 96);
INSERT INTO public.empleados VALUES (161, 'Liliana', 'Gutiérrez Gutiérrez', 'liliana.gutiérrez161@techstore.mx', 'Desarrollador Junior', 60910.97, '2021-10-04', 3, 91);
INSERT INTO public.empleados VALUES (162, 'Ana', 'Torres Jiménez', 'ana.torres162@techstore.mx', 'Operador de Almacén', 37670.17, '2019-11-19', 7, 130);
INSERT INTO public.empleados VALUES (163, 'Diego', 'Sánchez Vega', 'diego.sánchez163@techstore.mx', 'Director de RH', 37558.32, '2020-02-16', 4, 95);
INSERT INTO public.empleados VALUES (164, 'Liliana', 'Sánchez Mendoza', 'liliana.sánchez164@techstore.mx', 'Diseñador Gráfico', 73696.33, '2017-10-04', 2, 160);
INSERT INTO public.empleados VALUES (165, 'Verónica', 'García Jiménez', 'verónica.garcía165@techstore.mx', 'Asesor Legal', 14113.58, '2023-04-20', 10, 80);
INSERT INTO public.empleados VALUES (166, 'Roberto', 'Vega González', 'roberto.vega166@techstore.mx', 'Analista de Procesos', 17079.74, '2018-01-20', 6, 163);
INSERT INTO public.empleados VALUES (167, 'Francisco', 'Pérez Gómez', 'francisco.pérez167@techstore.mx', 'Asesor Comercial', 45116.14, '2024-08-07', 1, 95);
INSERT INTO public.empleados VALUES (168, 'Liliana', 'Jiménez López', 'liliana.jiménez168@techstore.mx', 'CFO', 23357.33, '2017-11-26', 5, 159);
INSERT INTO public.empleados VALUES (169, 'Isabel', 'Cruz Moreno', 'isabel.cruz169@techstore.mx', 'Asesor Comercial', 47453.30, '2021-05-29', 1, 107);
INSERT INTO public.empleados VALUES (170, 'Francisco', 'Martínez Rivera', 'francisco.martínez170@techstore.mx', 'Auditor Interno', 20094.95, '2018-10-05', 5, 152);
INSERT INTO public.empleados VALUES (171, 'Gabriela', 'Hernández Sánchez', 'gabriela.hernández171@techstore.mx', 'Coordinador de CX', 83864.53, '2025-10-01', 8, 2);
INSERT INTO public.empleados VALUES (172, 'Fernando', 'Herrera González', 'fernando.herrera172@techstore.mx', 'Especialista en Nómina', 33129.64, '2025-01-07', 4, 2);
INSERT INTO public.empleados VALUES (173, 'Carmen', 'González Gómez', 'carmen.gonzález173@techstore.mx', 'Agente de Soporte', 48519.15, '2017-01-07', 8, 172);
INSERT INTO public.empleados VALUES (174, 'Miguel', 'Díaz García', 'miguel.díaz174@techstore.mx', 'Analista de Procesos', 79244.86, '2016-09-11', 6, 81);
INSERT INTO public.empleados VALUES (175, 'Pablo', 'Castillo Vargas', 'pablo.castillo175@techstore.mx', 'Paralegal', 33134.61, '2021-10-27', 10, 6);
INSERT INTO public.empleados VALUES (176, 'Alberto', 'Cruz Aguilar', 'alberto.cruz176@techstore.mx', 'Coordinador de Operaciones', 18433.48, '2016-11-22', 6, 28);
INSERT INTO public.empleados VALUES (177, 'Pablo', 'Reyes López', 'pablo.reyes177@techstore.mx', 'Coordinador de Capacitación', 75548.28, '2018-01-01', 4, 87);
INSERT INTO public.empleados VALUES (178, 'Roberto', 'López Reyes', 'roberto.lópez178@techstore.mx', 'Director de RH', 50734.15, '2024-03-10', 4, 90);
INSERT INTO public.empleados VALUES (179, 'Patricia', 'Sánchez Martínez', 'patricia.sánchez179@techstore.mx', 'Supervisor de Almacén', 30685.68, '2024-06-02', 6, 155);
INSERT INTO public.empleados VALUES (180, 'Laura', 'Rodríguez Herrera', 'laura.rodríguez180@techstore.mx', 'Analista de Sistemas', 45868.57, '2020-01-16', 3, 149);
INSERT INTO public.empleados VALUES (181, 'Liliana', 'Vargas Vargas', 'liliana.vargas181@techstore.mx', 'Técnico de Soporte', 75090.02, '2019-05-01', 8, 81);
INSERT INTO public.empleados VALUES (182, 'Diego', 'Cruz Vargas', 'diego.cruz182@techstore.mx', 'Desarrollador Junior', 70132.07, '2019-09-25', 3, 15);
INSERT INTO public.empleados VALUES (183, 'Gabriela', 'Cruz Cruz', 'gabriela.cruz183@techstore.mx', 'Director de Operaciones', 16152.97, '2017-01-14', 6, 74);
INSERT INTO public.empleados VALUES (184, 'Laura', 'Jiménez Jiménez', 'laura.jiménez184@techstore.mx', 'Diseñador Gráfico', 45777.95, '2020-02-24', 2, 11);
INSERT INTO public.empleados VALUES (185, 'Liliana', 'Vargas Pérez', 'liliana.vargas185@techstore.mx', 'Técnico de Soporte', 56165.43, '2020-09-28', 8, 39);
INSERT INTO public.empleados VALUES (186, 'David', 'Castillo López', 'david.castillo186@techstore.mx', 'Ejecutivo de Ventas', 14857.38, '2018-06-06', 1, 113);
INSERT INTO public.empleados VALUES (187, 'Adriana', 'Rodríguez Rivera', 'adriana.rodríguez187@techstore.mx', 'Técnico de Soporte', 79009.39, '2022-01-08', 8, 105);
INSERT INTO public.empleados VALUES (188, 'Ana', 'Mendoza Vargas', 'ana.mendoza188@techstore.mx', 'Coordinador de Operaciones', 16811.57, '2025-04-21', 6, 143);
INSERT INTO public.empleados VALUES (189, 'Alberto', 'Vega González', 'alberto.vega189@techstore.mx', 'Operador de Almacén', 17949.65, '2018-12-03', 7, 37);
INSERT INTO public.empleados VALUES (190, 'Pablo', 'González Jiménez', 'pablo.gonzález190@techstore.mx', 'Director de Operaciones', 34599.48, '2022-02-21', 6, 165);
INSERT INTO public.empleados VALUES (191, 'Sandra', 'López Vargas', 'sandra.lópez191@techstore.mx', 'Analista de Procesos', 49119.66, '2026-02-28', 6, 93);
INSERT INTO public.empleados VALUES (192, 'Fernando', 'Flores Herrera', 'fernando.flores192@techstore.mx', 'Auditor Interno', 26016.38, '2024-10-27', 5, 40);
INSERT INTO public.empleados VALUES (193, 'Luis', 'Reyes Herrera', 'luis.reyes193@techstore.mx', 'Director de Marketing', 60320.83, '2016-07-15', 2, 159);
INSERT INTO public.empleados VALUES (194, 'Patricia', 'Rodríguez Rodríguez', 'patricia.rodríguez194@techstore.mx', 'DBA', 71060.19, '2024-07-04', 3, 185);
INSERT INTO public.empleados VALUES (195, 'Eduardo', 'Moreno Ramos', 'eduardo.moreno195@techstore.mx', 'Agente de Soporte', 82779.97, '2019-07-09', 8, 73);
INSERT INTO public.empleados VALUES (196, 'Ricardo', 'Torres Mendoza', 'ricardo.torres196@techstore.mx', 'Coordinador de CX', 77990.13, '2024-03-10', 8, 95);
INSERT INTO public.empleados VALUES (197, 'Mónica', 'Herrera Torres', 'mónica.herrera197@techstore.mx', 'Paralegal', 48712.19, '2021-09-02', 10, 42);
INSERT INTO public.empleados VALUES (198, 'Patricia', 'Vega Ramírez', 'patricia.vega198@techstore.mx', 'Director de RH', 58806.07, '2016-07-24', 4, 96);
INSERT INTO public.empleados VALUES (199, 'Sandra', 'Vega Martínez', 'sandra.vega199@techstore.mx', 'Comprador Senior', 18122.88, '2024-07-26', 9, 70);
INSERT INTO public.empleados VALUES (200, 'Patricia', 'Aguilar Díaz', 'patricia.aguilar200@techstore.mx', 'Jefe de Soporte', 81088.17, '2023-11-16', 8, 116);


--
-- TOC entry 5097 (class 0 OID 24705)
-- Dependencies: 228
-- Data for Name: estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.estado VALUES (1, 'Baja California');
INSERT INTO public.estado VALUES (3, 'Campeche');
INSERT INTO public.estado VALUES (4, 'Chiapas');
INSERT INTO public.estado VALUES (5, 'Colima');
INSERT INTO public.estado VALUES (6, 'Guerrero');
INSERT INTO public.estado VALUES (7, 'Jalisco');
INSERT INTO public.estado VALUES (8, 'Michoacán');
INSERT INTO public.estado VALUES (9, 'Nayarit');
INSERT INTO public.estado VALUES (10, 'Oaxaca');
INSERT INTO public.estado VALUES (11, 'Quintana Roo');
INSERT INTO public.estado VALUES (12, 'Sinaloa');
INSERT INTO public.estado VALUES (13, 'Sonora');
INSERT INTO public.estado VALUES (14, 'Tabasco');
INSERT INTO public.estado VALUES (15, 'Tamaulipas');
INSERT INTO public.estado VALUES (16, 'Veracruz');
INSERT INTO public.estado VALUES (17, 'Yucatán');
INSERT INTO public.estado VALUES (18, 'Coahuila');
INSERT INTO public.estado VALUES (19, 'Nuevo León');
INSERT INTO public.estado VALUES (20, 'Chihuahua');
INSERT INTO public.estado VALUES (21, 'Querétaro');
INSERT INTO public.estado VALUES (22, 'Aguascalientes');
INSERT INTO public.estado VALUES (23, 'Ciudad de México');
INSERT INTO public.estado VALUES (24, 'Puebla');
INSERT INTO public.estado VALUES (25, 'San Luis Potosí');
INSERT INTO public.estado VALUES (2, 'Guanajuato');


--
-- TOC entry 5093 (class 0 OID 24612)
-- Dependencies: 224
-- Data for Name: pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5094 (class 0 OID 24619)
-- Dependencies: 225
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.productos VALUES (1, 'Apple Neo Plus', 'Apple', 'Neo Plus', 1, 12624.88, 15858.11, 41, 14, true);
INSERT INTO public.productos VALUES (2, 'OnePlus Ultra Pro', 'OnePlus', 'Ultra Pro', 1, 19815.81, 24015.17, 146, 18, true);
INSERT INTO public.productos VALUES (3, 'Xiaomi Edge 2022', 'Xiaomi', 'Edge 2022', 1, 22660.56, 26253.43, 110, 7, true);
INSERT INTO public.productos VALUES (4, 'Google Ultra S', 'Google', 'Ultra S', 1, 7633.61, 8942.68, 214, 17, true);
INSERT INTO public.productos VALUES (5, 'Sony Pro Max S', 'Sony', 'Pro Max S', 1, 18005.83, 23066.77, 0, 14, true);
INSERT INTO public.productos VALUES (6, 'Google Plus 2023', 'Google', 'Plus 2023', 1, 13158.59, 17267.65, 488, 19, true);
INSERT INTO public.productos VALUES (7, 'Apple Neo 2022', 'Apple', 'Neo 2022', 1, 15946.42, 25378.21, 129, 3, true);
INSERT INTO public.productos VALUES (8, 'Samsung SE 2023', 'Samsung', 'SE 2023', 1, 19321.81, 28612.40, 170, 7, false);
INSERT INTO public.productos VALUES (9, 'OnePlus Plus 97', 'OnePlus', 'Plus 97', 1, 24523.36, 33482.70, 93, 7, true);
INSERT INTO public.productos VALUES (10, 'Sony Pro Max S', 'Sony', 'Pro Max S', 1, 1238.59, 1535.56, 21, 13, true);
INSERT INTO public.productos VALUES (11, 'Google Edge 2022', 'Google', 'Edge 2022', 1, 18869.28, 23322.36, 182, 4, true);
INSERT INTO public.productos VALUES (12, 'OnePlus Lite Pro', 'OnePlus', 'Lite Pro', 1, 11008.24, 14641.07, 225, 15, true);
INSERT INTO public.productos VALUES (13, 'Xiaomi Edge 98', 'Xiaomi', 'Edge 98', 1, 9278.57, 13999.33, 136, 5, true);
INSERT INTO public.productos VALUES (14, 'Samsung Neo 2024', 'Samsung', 'Neo 2024', 1, 13705.04, 17741.79, 40, 13, true);
INSERT INTO public.productos VALUES (15, 'OPPO Edge Plus', 'OPPO', 'Edge Plus', 1, 4291.12, 5791.98, 228, 4, true);
INSERT INTO public.productos VALUES (16, 'OnePlus Neo 2022', 'OnePlus', 'Neo 2022', 1, 2014.77, 2894.98, 186, 19, true);
INSERT INTO public.productos VALUES (17, 'Xiaomi Pro Max 28', 'Xiaomi', 'Pro Max 28', 1, 1014.75, 1197.66, 398, 14, true);
INSERT INTO public.productos VALUES (18, 'Apple Plus 96', 'Apple', 'Plus 96', 1, 23728.26, 31259.75, 390, 5, true);
INSERT INTO public.productos VALUES (19, 'OnePlus Neo X', 'OnePlus', 'Neo X', 1, 6352.85, 7630.10, 376, 8, true);
INSERT INTO public.productos VALUES (20, 'Google Ultra X', 'Google', 'Ultra X', 1, 17645.34, 21995.92, 313, 12, true);
INSERT INTO public.productos VALUES (21, 'Sony Standard 2024', 'Sony', 'Standard 2024', 1, 21342.73, 28885.66, 460, 17, true);
INSERT INTO public.productos VALUES (22, 'OnePlus SE X', 'OnePlus', 'SE X', 1, 22299.59, 34187.79, 364, 8, true);
INSERT INTO public.productos VALUES (23, 'Motorola Ultra 2024', 'Motorola', 'Ultra 2024', 1, 6032.89, 8278.99, 184, 20, true);
INSERT INTO public.productos VALUES (24, 'Sony Plus 2023', 'Sony', 'Plus 2023', 1, 1783.84, 2371.03, 367, 18, true);
INSERT INTO public.productos VALUES (25, 'Google Ultra Pro', 'Google', 'Ultra Pro', 1, 16112.11, 21791.44, 348, 19, true);
INSERT INTO public.productos VALUES (26, 'Xiaomi Plus 2022', 'Xiaomi', 'Plus 2022', 1, 20810.06, 28783.35, 155, 8, true);
INSERT INTO public.productos VALUES (27, 'Acer Pavilion X', 'Acer', 'Pavilion X', 2, 5028.10, 7946.20, 140, 7, true);
INSERT INTO public.productos VALUES (28, 'LG Air 2024', 'LG', 'Air 2024', 2, 14856.44, 20966.76, 87, 13, true);
INSERT INTO public.productos VALUES (29, 'Apple Pro 2022', 'Apple', 'Pro 2022', 2, 23721.39, 35509.97, 135, 9, true);
INSERT INTO public.productos VALUES (30, 'MSI Pro X', 'MSI', 'Pro X', 2, 16101.40, 20705.47, 125, 15, true);
INSERT INTO public.productos VALUES (31, 'Dell Pro 30', 'Dell', 'Pro 30', 2, 10478.20, 14239.86, 174, 7, true);
INSERT INTO public.productos VALUES (32, 'Acer ThinkPad 2024', 'Acer', 'ThinkPad 2024', 2, 19052.53, 26325.66, 54, 13, true);
INSERT INTO public.productos VALUES (33, 'Dell Pavilion S', 'Dell', 'Pavilion S', 2, 3650.81, 4281.57, 484, 15, true);
INSERT INTO public.productos VALUES (34, 'MSI Inspiron Pro', 'MSI', 'Inspiron Pro', 2, 23353.73, 34435.26, 97, 8, true);
INSERT INTO public.productos VALUES (35, 'LG Swift X', 'LG', 'Swift X', 2, 12509.65, 14893.01, 201, 19, true);
INSERT INTO public.productos VALUES (36, 'Lenovo Inspiron Pro', 'Lenovo', 'Inspiron Pro', 2, 1359.15, 1735.10, 305, 18, true);
INSERT INTO public.productos VALUES (37, 'Apple Air 2024', 'Apple', 'Air 2024', 2, 22079.02, 32619.07, 391, 15, true);
INSERT INTO public.productos VALUES (38, 'MSI Pro S', 'MSI', 'Pro S', 2, 9158.72, 11721.98, 197, 19, true);
INSERT INTO public.productos VALUES (39, 'LG Pavilion 2023', 'LG', 'Pavilion 2023', 2, 3347.29, 3995.01, 191, 13, true);
INSERT INTO public.productos VALUES (40, 'Acer Elite Plus', 'Acer', 'Elite Plus', 2, 12576.94, 14719.88, 70, 13, true);
INSERT INTO public.productos VALUES (41, 'LG Swift 2024', 'LG', 'Swift 2024', 2, 8299.95, 11834.74, 83, 15, true);
INSERT INTO public.productos VALUES (42, 'ASUS ThinkPad 74', 'ASUS', 'ThinkPad 74', 2, 17762.18, 22822.73, 417, 3, true);
INSERT INTO public.productos VALUES (43, 'Dell VivoBook X', 'Dell', 'VivoBook X', 2, 19949.36, 29453.15, 352, 3, true);
INSERT INTO public.productos VALUES (44, 'ASUS Inspiron 16', 'ASUS', 'Inspiron 16', 2, 4387.22, 6287.16, 317, 15, true);
INSERT INTO public.productos VALUES (45, 'Lenovo Pro 2023', 'Lenovo', 'Pro 2023', 2, 4890.99, 6595.34, 214, 7, true);
INSERT INTO public.productos VALUES (46, 'Lenovo VivoBook 74', 'Lenovo', 'VivoBook 74', 2, 21839.52, 32347.10, 31, 7, true);
INSERT INTO public.productos VALUES (47, 'LG ThinkPad 94', 'LG', 'ThinkPad 94', 2, 13208.11, 17054.16, 88, 17, true);
INSERT INTO public.productos VALUES (48, 'Acer ThinkPad X', 'Acer', 'ThinkPad X', 2, 15310.40, 18931.60, 126, 11, true);
INSERT INTO public.productos VALUES (49, 'Lenovo Fire 36', 'Lenovo', 'Fire 36', 3, 8028.46, 10492.89, 478, 11, true);
INSERT INTO public.productos VALUES (50, 'Huawei MatePad Plus', 'Huawei', 'MatePad Plus', 3, 20486.68, 32360.23, 411, 7, true);
INSERT INTO public.productos VALUES (51, 'Lenovo Tab 54', 'Lenovo', 'Tab 54', 3, 16450.91, 24451.03, 109, 9, true);
INSERT INTO public.productos VALUES (52, 'Lenovo MatePad X', 'Lenovo', 'MatePad X', 3, 3561.23, 5082.07, 300, 10, true);
INSERT INTO public.productos VALUES (53, 'Microsoft MatePad S', 'Microsoft', 'MatePad S', 3, 1454.40, 1943.06, 367, 18, true);
INSERT INTO public.productos VALUES (54, 'Samsung Tab 2024', 'Samsung', 'Tab 2024', 3, 10261.65, 16118.63, 449, 18, true);
INSERT INTO public.productos VALUES (55, 'Samsung Fire X', 'Samsung', 'Fire X', 3, 16200.56, 25249.73, 45, 10, true);
INSERT INTO public.productos VALUES (56, 'Microsoft Tab Plus', 'Microsoft', 'Tab Plus', 3, 22073.79, 27131.00, 470, 4, true);
INSERT INTO public.productos VALUES (57, 'Amazon Surface X', 'Amazon', 'Surface X', 3, 21937.07, 25319.11, 290, 6, true);
INSERT INTO public.productos VALUES (58, 'Lenovo Fire 68', 'Lenovo', 'Fire 68', 3, 22248.11, 26928.89, 258, 17, true);
INSERT INTO public.productos VALUES (59, 'Apple Fire 30', 'Apple', 'Fire 30', 3, 16259.89, 23956.82, 7, 13, true);
INSERT INTO public.productos VALUES (60, 'Huawei Pad Plus', 'Huawei', 'Pad Plus', 3, 20700.70, 28605.81, 44, 15, true);
INSERT INTO public.productos VALUES (61, 'Samsung Pad Pro', 'Samsung', 'Pad Pro', 3, 23405.26, 26987.99, 196, 10, true);
INSERT INTO public.productos VALUES (62, 'Lenovo Fire 2022', 'Lenovo', 'Fire 2022', 3, 6649.60, 8722.93, 120, 4, true);
INSERT INTO public.productos VALUES (63, 'Amazon Fire Plus', 'Amazon', 'Fire Plus', 3, 17198.93, 26923.17, 454, 12, true);
INSERT INTO public.productos VALUES (64, 'Microsoft Fire S', 'Microsoft', 'Fire S', 3, 5595.35, 6770.97, 78, 17, true);
INSERT INTO public.productos VALUES (65, 'Huawei Fire 63', 'Huawei', 'Fire 63', 3, 18970.16, 28661.97, 422, 9, true);
INSERT INTO public.productos VALUES (66, 'Microsoft MatePad 20', 'Microsoft', 'MatePad 20', 3, 13275.10, 17427.59, 469, 6, true);
INSERT INTO public.productos VALUES (67, 'Huawei MatePad 2024', 'Huawei', 'MatePad 2024', 3, 4238.75, 6504.44, 226, 6, true);
INSERT INTO public.productos VALUES (68, 'Microsoft MatePad 2023', 'Microsoft', 'MatePad 2023', 3, 22487.40, 30368.50, 28, 17, true);
INSERT INTO public.productos VALUES (69, 'Amazon Surface 2022', 'Amazon', 'Surface 2022', 3, 14036.11, 20390.90, 157, 3, true);
INSERT INTO public.productos VALUES (70, 'Apple Pad 2023', 'Apple', 'Pad 2023', 3, 1275.45, 1664.51, 32, 20, true);
INSERT INTO public.productos VALUES (71, 'Sharp OLED Plus', 'Sharp', 'OLED Plus', 4, 4622.54, 5597.63, 328, 16, true);
INSERT INTO public.productos VALUES (72, 'Philips Nanocell Plus', 'Philips', 'Nanocell Plus', 4, 2144.21, 3396.14, 447, 20, true);
INSERT INTO public.productos VALUES (73, 'Panasonic OLED Plus', 'Panasonic', 'OLED Plus', 4, 13291.74, 19639.03, 114, 3, true);
INSERT INTO public.productos VALUES (74, 'Hisense Nanocell Plus', 'Hisense', 'Nanocell Plus', 4, 13368.55, 20327.04, 126, 17, true);
INSERT INTO public.productos VALUES (75, 'Hisense QLED 2022', 'Hisense', 'QLED 2022', 4, 20265.53, 27128.62, 392, 3, true);
INSERT INTO public.productos VALUES (76, 'LG OLED 2022', 'LG', 'OLED 2022', 4, 11244.06, 16330.99, 446, 4, true);
INSERT INTO public.productos VALUES (77, 'Samsung Nanocell S', 'Samsung', 'Nanocell S', 4, 13563.03, 20201.77, 397, 4, true);
INSERT INTO public.productos VALUES (78, 'Hisense QLED Pro', 'Hisense', 'QLED Pro', 4, 14500.25, 21716.19, 419, 13, true);
INSERT INTO public.productos VALUES (79, 'Sony C2 S', 'Sony', 'C2 S', 4, 10426.97, 13282.08, 285, 8, true);
INSERT INTO public.productos VALUES (80, 'Philips Bravia 2022', 'Philips', 'Bravia 2022', 4, 24311.41, 38259.20, 343, 15, true);
INSERT INTO public.productos VALUES (81, 'Panasonic C2 Plus', 'Panasonic', 'C2 Plus', 4, 3858.06, 5090.35, 386, 20, true);
INSERT INTO public.productos VALUES (82, 'TCL Crystal UHD 28', 'TCL', 'Crystal UHD 28', 4, 22881.32, 32104.18, 495, 16, true);
INSERT INTO public.productos VALUES (83, 'Sony Nanocell X', 'Sony', 'Nanocell X', 4, 5202.92, 7497.50, 472, 17, true);
INSERT INTO public.productos VALUES (84, 'LG Bravia 2022', 'LG', 'Bravia 2022', 4, 6821.27, 9912.34, 308, 4, true);
INSERT INTO public.productos VALUES (85, 'TCL G2 S', 'TCL', 'G2 S', 4, 12062.95, 18592.18, 170, 12, true);
INSERT INTO public.productos VALUES (86, 'Samsung QLED 2023', 'Samsung', 'QLED 2023', 4, 18709.95, 27867.51, 468, 10, true);
INSERT INTO public.productos VALUES (87, 'TCL Nanocell Pro', 'TCL', 'Nanocell Pro', 4, 19421.52, 25661.61, 273, 14, true);
INSERT INTO public.productos VALUES (88, 'Beats Flip 22', 'Beats', 'Flip 22', 5, 19076.48, 24686.97, 104, 14, true);
INSERT INTO public.productos VALUES (89, 'Sony AirPods 2024', 'Sony', 'AirPods 2024', 5, 553.06, 773.73, 299, 16, true);
INSERT INTO public.productos VALUES (90, 'Sennheiser Charge Plus', 'Sennheiser', 'Charge Plus', 5, 14309.27, 18037.96, 281, 13, true);
INSERT INTO public.productos VALUES (91, 'Beats Galaxy Buds 92', 'Beats', 'Galaxy Buds 92', 5, 11601.60, 17167.44, 180, 8, true);
INSERT INTO public.productos VALUES (92, 'Beats QuietComfort 2022', 'Beats', 'QuietComfort 2022', 5, 13170.02, 20118.27, 38, 4, true);
INSERT INTO public.productos VALUES (93, 'Jabra QuietComfort S', 'Jabra', 'QuietComfort S', 5, 1839.00, 2239.83, 111, 19, true);
INSERT INTO public.productos VALUES (94, 'Sony AirPods 91', 'Sony', 'AirPods 91', 5, 16533.22, 19130.25, 272, 20, true);
INSERT INTO public.productos VALUES (95, 'Sony AirPods X', 'Sony', 'AirPods X', 5, 575.99, 873.16, 345, 16, true);
INSERT INTO public.productos VALUES (96, 'JBL WH-1000 2024', 'JBL', 'WH-1000 2024', 5, 6138.08, 8770.71, 129, 14, true);
INSERT INTO public.productos VALUES (97, 'Jabra WH-1000 Plus', 'Jabra', 'WH-1000 Plus', 5, 11556.09, 14554.24, 356, 10, true);
INSERT INTO public.productos VALUES (98, 'Bose Galaxy Buds 2022', 'Bose', 'Galaxy Buds 2022', 5, 2473.49, 3266.66, 282, 18, true);
INSERT INTO public.productos VALUES (99, 'Sony Galaxy Buds 2023', 'Sony', 'Galaxy Buds 2023', 5, 12571.48, 16911.90, 401, 13, true);
INSERT INTO public.productos VALUES (100, 'Bose AirPods S', 'Bose', 'AirPods S', 5, 5403.71, 8325.24, 454, 18, true);
INSERT INTO public.productos VALUES (101, 'Bose Galaxy Buds 2022', 'Bose', 'Galaxy Buds 2022', 5, 4606.96, 7061.05, 8, 9, true);
INSERT INTO public.productos VALUES (102, 'Jabra WH-1000 2024', 'Jabra', 'WH-1000 2024', 5, 14164.36, 19901.11, 434, 15, true);
INSERT INTO public.productos VALUES (103, 'Samsung Flip 2023', 'Samsung', 'Flip 2023', 5, 12594.70, 20005.99, 27, 6, true);
INSERT INTO public.productos VALUES (104, 'Bose Charge Plus', 'Bose', 'Charge Plus', 5, 24227.68, 31420.14, 324, 11, true);
INSERT INTO public.productos VALUES (105, 'Beats Flip Pro', 'Beats', 'Flip Pro', 5, 13892.99, 18324.05, 95, 15, true);
INSERT INTO public.productos VALUES (106, 'Apple QuietComfort 2023', 'Apple', 'QuietComfort 2023', 5, 6809.10, 8994.82, 401, 7, true);
INSERT INTO public.productos VALUES (107, 'Samsung Charge 2023', 'Samsung', 'Charge 2023', 5, 279.10, 359.68, 184, 11, true);
INSERT INTO public.productos VALUES (108, 'Bose QuietComfort 65', 'Bose', 'QuietComfort 65', 5, 13991.08, 19316.06, 52, 3, true);
INSERT INTO public.productos VALUES (109, 'Bose AirPods Pro', 'Bose', 'AirPods Pro', 5, 21613.40, 24975.44, 211, 15, true);
INSERT INTO public.productos VALUES (110, 'Sennheiser AirPods 2024', 'Sennheiser', 'AirPods 2024', 5, 17180.10, 21067.54, 137, 12, true);
INSERT INTO public.productos VALUES (111, 'JBL WH-1000 Plus', 'JBL', 'WH-1000 Plus', 5, 7007.65, 9004.05, 400, 5, true);
INSERT INTO public.productos VALUES (112, 'Sennheiser Galaxy Buds 90', 'Sennheiser', 'Galaxy Buds 90', 5, 14906.09, 18453.69, 54, 7, true);
INSERT INTO public.productos VALUES (113, 'Jabra Charge Plus', 'Jabra', 'Charge Plus', 5, 20131.30, 26136.34, 171, 16, true);
INSERT INTO public.productos VALUES (114, 'Nintendo Switch S', 'Nintendo', 'Switch S', 6, 12053.39, 14824.91, 203, 13, true);
INSERT INTO public.productos VALUES (115, 'Logitech OLED S', 'Logitech', 'OLED S', 6, 8248.27, 10525.91, 402, 15, true);
INSERT INTO public.productos VALUES (116, 'SteelSeries Xbox Series 2024', 'SteelSeries', 'Xbox Series 2024', 6, 17090.56, 23884.82, 487, 17, true);
INSERT INTO public.productos VALUES (117, 'Microsoft OLED 2023', 'Microsoft', 'OLED 2023', 6, 20501.29, 30916.88, 209, 18, true);
INSERT INTO public.productos VALUES (118, 'Nintendo Xbox Series 2024', 'Nintendo', 'Xbox Series 2024', 6, 17923.62, 26976.56, 37, 17, true);
INSERT INTO public.productos VALUES (119, 'Razer Pro Controller Plus', 'Razer', 'Pro Controller Plus', 6, 13659.58, 20568.93, 184, 20, true);
INSERT INTO public.productos VALUES (120, 'Sony PS5 Pro', 'Sony', 'PS5 Pro', 6, 4283.51, 6107.02, 288, 15, true);
INSERT INTO public.productos VALUES (121, 'Nintendo OLED 2022', 'Nintendo', 'OLED 2022', 6, 2600.37, 3250.20, 382, 19, true);
INSERT INTO public.productos VALUES (122, 'Logitech Pro Controller 38', 'Logitech', 'Pro Controller 38', 6, 9446.87, 12832.42, 347, 19, true);
INSERT INTO public.productos VALUES (123, 'Sony OLED X', 'Sony', 'OLED X', 6, 10486.99, 16598.57, 59, 7, true);
INSERT INTO public.productos VALUES (124, 'Nintendo OLED 36', 'Nintendo', 'OLED 36', 6, 8805.26, 10512.87, 369, 17, true);
INSERT INTO public.productos VALUES (125, 'Nintendo PS5 2022', 'Nintendo', 'PS5 2022', 6, 21252.12, 30636.77, 346, 8, true);
INSERT INTO public.productos VALUES (126, 'Logitech Xbox Series 2024', 'Logitech', 'Xbox Series 2024', 6, 13864.97, 18009.84, 218, 17, true);
INSERT INTO public.productos VALUES (127, 'Razer Xbox Series Plus', 'Razer', 'Xbox Series Plus', 6, 9980.22, 14788.94, 452, 9, true);
INSERT INTO public.productos VALUES (128, 'Razer OLED S', 'Razer', 'OLED S', 6, 5263.74, 7835.32, 414, 5, true);
INSERT INTO public.productos VALUES (129, 'SteelSeries Xbox Series Pro', 'SteelSeries', 'Xbox Series Pro', 6, 5047.30, 6063.22, 343, 18, true);
INSERT INTO public.productos VALUES (130, 'Logitech Switch Plus', 'Logitech', 'Switch Plus', 6, 15341.01, 21694.52, 178, 14, true);
INSERT INTO public.productos VALUES (131, 'SteelSeries Xbox Series X', 'SteelSeries', 'Xbox Series X', 6, 22979.26, 32528.88, 344, 7, true);
INSERT INTO public.productos VALUES (132, 'Microsoft Switch 2024', 'Microsoft', 'Switch 2024', 6, 9426.66, 11440.30, 198, 16, true);
INSERT INTO public.productos VALUES (133, 'Fujifilm Alpha 2024', 'Fujifilm', 'Alpha 2024', 7, 13939.58, 19101.95, 71, 8, true);
INSERT INTO public.productos VALUES (134, 'Fujifilm HERO Pro', 'Fujifilm', 'HERO Pro', 7, 23803.27, 32564.64, 99, 15, true);
INSERT INTO public.productos VALUES (135, 'Panasonic Lumix Plus', 'Panasonic', 'Lumix Plus', 7, 17164.71, 22949.80, 430, 17, true);
INSERT INTO public.productos VALUES (136, 'Canon HERO S', 'Canon', 'HERO S', 7, 7408.43, 9436.00, 275, 12, true);
INSERT INTO public.productos VALUES (137, 'Fujifilm HERO 2023', 'Fujifilm', 'HERO 2023', 7, 14381.94, 18272.97, 278, 14, true);
INSERT INTO public.productos VALUES (138, 'Canon Lumix S', 'Canon', 'Lumix S', 7, 24745.93, 29598.30, 424, 10, true);
INSERT INTO public.productos VALUES (139, 'Canon X-T Pro', 'Canon', 'X-T Pro', 7, 21575.66, 25656.53, 443, 6, true);
INSERT INTO public.productos VALUES (140, 'Nikon Alpha Pro', 'Nikon', 'Alpha Pro', 7, 21547.06, 30696.33, 219, 8, true);
INSERT INTO public.productos VALUES (141, 'Nikon Alpha Pro', 'Nikon', 'Alpha Pro', 7, 13377.18, 18976.68, 86, 13, true);
INSERT INTO public.productos VALUES (142, 'Sony Z-Series X', 'Sony', 'Z-Series X', 7, 23817.07, 32902.97, 460, 6, true);
INSERT INTO public.productos VALUES (143, 'Fujifilm EOS 2024', 'Fujifilm', 'EOS 2024', 7, 17580.45, 21267.26, 74, 13, true);
INSERT INTO public.productos VALUES (144, 'GoPro X-T 2024', 'GoPro', 'X-T 2024', 7, 14499.02, 18427.13, 212, 15, true);
INSERT INTO public.productos VALUES (145, 'GoPro EOS X', 'GoPro', 'EOS X', 7, 17413.38, 26900.06, 232, 18, true);
INSERT INTO public.productos VALUES (146, 'Canon Lumix 21', 'Canon', 'Lumix 21', 7, 15925.79, 23311.85, 435, 5, true);
INSERT INTO public.productos VALUES (147, 'Fujifilm Alpha S', 'Fujifilm', 'Alpha S', 7, 12443.67, 16118.15, 145, 13, true);
INSERT INTO public.productos VALUES (148, 'Nikon HERO Pro', 'Nikon', 'HERO Pro', 7, 22369.74, 33398.34, 23, 6, true);
INSERT INTO public.productos VALUES (149, 'Fujifilm EOS 2024', 'Fujifilm', 'EOS 2024', 7, 11115.96, 12786.74, 490, 16, true);
INSERT INTO public.productos VALUES (150, 'GoPro Alpha X', 'GoPro', 'Alpha X', 7, 4100.59, 6436.80, 140, 5, true);
INSERT INTO public.productos VALUES (151, 'Sony EOS 2024', 'Sony', 'EOS 2024', 7, 1436.91, 2056.97, 371, 10, true);
INSERT INTO public.productos VALUES (152, 'Canon Lumix 2022', 'Canon', 'Lumix 2022', 7, 5453.52, 6462.82, 303, 10, true);
INSERT INTO public.productos VALUES (153, 'Fujifilm EOS Pro', 'Fujifilm', 'EOS Pro', 7, 20455.16, 32619.22, 216, 7, true);
INSERT INTO public.productos VALUES (154, 'Nikon X-T 2023', 'Nikon', 'X-T 2023', 7, 2714.56, 3570.74, 153, 7, true);
INSERT INTO public.productos VALUES (155, 'Nikon Lumix 2024', 'Nikon', 'Lumix 2024', 7, 1850.03, 2596.48, 312, 8, true);
INSERT INTO public.productos VALUES (156, 'GoPro Alpha 2024', 'GoPro', 'Alpha 2024', 7, 23009.37, 32839.76, 226, 9, true);
INSERT INTO public.productos VALUES (157, 'Canon Alpha Plus', 'Canon', 'Alpha Plus', 7, 8885.66, 11935.44, 405, 7, true);
INSERT INTO public.productos VALUES (158, 'GoPro EOS X', 'GoPro', 'EOS X', 7, 19507.40, 28494.74, 434, 12, true);
INSERT INTO public.productos VALUES (159, 'Panasonic HERO Plus', 'Panasonic', 'HERO Plus', 7, 7494.22, 8802.38, 459, 10, true);
INSERT INTO public.productos VALUES (160, 'Samsung Charge 2023', 'Samsung', 'Charge 2023', 8, 13277.92, 21111.41, 184, 13, true);
INSERT INTO public.productos VALUES (161, 'Xiaomi Charge 2024', 'Xiaomi', 'Charge 2024', 8, 19103.74, 30174.43, 394, 5, false);
INSERT INTO public.productos VALUES (162, 'Apple Watch S', 'Apple', 'Watch S', 8, 1139.70, 1341.67, 404, 15, true);
INSERT INTO public.productos VALUES (163, 'Huawei Band Plus', 'Huawei', 'Band Plus', 8, 17589.99, 20880.95, 274, 20, true);
INSERT INTO public.productos VALUES (164, 'Garmin Watch 2023', 'Garmin', 'Watch 2023', 8, 12855.92, 15959.84, 413, 7, true);
INSERT INTO public.productos VALUES (165, 'Fitbit Band 2023', 'Fitbit', 'Band 2023', 8, 7857.71, 10583.30, 488, 10, true);
INSERT INTO public.productos VALUES (166, 'Apple Charge 24', 'Apple', 'Charge 24', 8, 15365.58, 18050.91, 341, 8, true);
INSERT INTO public.productos VALUES (167, 'Huawei Galaxy Watch 2022', 'Huawei', 'Galaxy Watch 2022', 8, 4221.24, 6664.74, 267, 19, true);
INSERT INTO public.productos VALUES (168, 'Huawei Vivoactive Pro', 'Huawei', 'Vivoactive Pro', 8, 3304.23, 4961.32, 137, 6, true);
INSERT INTO public.productos VALUES (169, 'Apple Vivoactive X', 'Apple', 'Vivoactive X', 8, 13167.78, 16701.06, 499, 5, true);
INSERT INTO public.productos VALUES (170, 'Xiaomi Vivoactive 17', 'Xiaomi', 'Vivoactive 17', 8, 21505.09, 26345.81, 80, 11, true);
INSERT INTO public.productos VALUES (171, 'Xiaomi Watch 2022', 'Xiaomi', 'Watch 2022', 8, 1244.34, 1914.19, 125, 4, true);
INSERT INTO public.productos VALUES (172, 'Fitbit Galaxy Watch 2022', 'Fitbit', 'Galaxy Watch 2022', 8, 13888.69, 21684.08, 379, 16, true);
INSERT INTO public.productos VALUES (173, 'Samsung Charge X', 'Samsung', 'Charge X', 8, 20676.03, 29095.13, 61, 19, true);
INSERT INTO public.productos VALUES (174, 'Apple Galaxy Watch 2022', 'Apple', 'Galaxy Watch 2022', 8, 23858.87, 28177.73, 238, 12, true);
INSERT INTO public.productos VALUES (175, 'Garmin Vivoactive 21', 'Garmin', 'Vivoactive 21', 8, 348.03, 431.66, 288, 12, true);
INSERT INTO public.productos VALUES (176, 'Samsung Charge 57', 'Samsung', 'Charge 57', 8, 24945.01, 37396.28, 375, 20, true);
INSERT INTO public.productos VALUES (177, 'Samsung Galaxy Watch Plus', 'Samsung', 'Galaxy Watch Plus', 8, 744.17, 1037.15, 325, 3, true);
INSERT INTO public.productos VALUES (178, 'Nest Kasa 2023', 'Nest', 'Kasa 2023', 9, 5249.08, 8358.65, 214, 18, true);
INSERT INTO public.productos VALUES (179, 'Google Smart Hub 2023', 'Google', 'Smart Hub 2023', 9, 1240.92, 1556.32, 432, 19, true);
INSERT INTO public.productos VALUES (180, 'Philips Kasa 2023', 'Philips', 'Kasa 2023', 9, 12709.88, 18260.88, 201, 5, true);
INSERT INTO public.productos VALUES (181, 'Amazon Kasa 2024', 'Amazon', 'Kasa 2024', 9, 6033.78, 7647.49, 161, 15, true);
INSERT INTO public.productos VALUES (182, 'Nest Hue 50', 'Nest', 'Hue 50', 9, 6908.10, 8176.49, 103, 7, true);
INSERT INTO public.productos VALUES (183, 'Ring Echo 2023', 'Ring', 'Echo 2023', 9, 4234.72, 5758.05, 208, 6, true);
INSERT INTO public.productos VALUES (184, 'Google Kasa 49', 'Google', 'Kasa 49', 9, 6735.45, 8109.22, 80, 12, true);
INSERT INTO public.productos VALUES (185, 'Nest Ring S', 'Nest', 'Ring S', 9, 20922.73, 27147.39, 46, 10, true);
INSERT INTO public.productos VALUES (186, 'TP-Link Ring X', 'TP-Link', 'Ring X', 9, 6615.14, 10556.47, 15, 15, true);
INSERT INTO public.productos VALUES (187, 'Ring Smart Hub S', 'Ring', 'Smart Hub S', 9, 2503.92, 2994.33, 406, 7, true);
INSERT INTO public.productos VALUES (188, 'Amazon Nest S', 'Amazon', 'Nest S', 9, 20618.28, 27164.75, 322, 5, true);
INSERT INTO public.productos VALUES (189, 'Philips Echo 2023', 'Philips', 'Echo 2023', 9, 5064.10, 7295.82, 414, 7, true);
INSERT INTO public.productos VALUES (190, 'Philips Echo 15', 'Philips', 'Echo 15', 9, 1408.35, 2205.28, 221, 15, true);
INSERT INTO public.productos VALUES (191, 'TP-Link Smart Hub 2024', 'TP-Link', 'Smart Hub 2024', 9, 8945.49, 13943.67, 140, 11, true);
INSERT INTO public.productos VALUES (192, 'Google Echo S', 'Google', 'Echo S', 9, 16234.87, 22314.85, 451, 20, true);
INSERT INTO public.productos VALUES (193, 'Logitech DataTraveler Plus', 'Logitech', 'DataTraveler Plus', 10, 5106.53, 7905.39, 269, 10, true);
INSERT INTO public.productos VALUES (194, 'SanDisk PowerCore Pro', 'SanDisk', 'PowerCore Pro', 10, 12070.16, 18125.11, 176, 19, true);
INSERT INTO public.productos VALUES (195, 'Logitech USB-C Pro', 'Logitech', 'USB-C Pro', 10, 14988.34, 17434.24, 415, 11, true);
INSERT INTO public.productos VALUES (196, 'Kingston Extreme S', 'Kingston', 'Extreme S', 10, 24353.40, 29103.79, 336, 10, true);
INSERT INTO public.productos VALUES (197, 'Ugreen PowerCore Plus', 'Ugreen', 'PowerCore Plus', 10, 8966.90, 13698.28, 432, 8, true);
INSERT INTO public.productos VALUES (198, 'SanDisk MX Keys Pro', 'SanDisk', 'MX Keys Pro', 10, 22862.40, 26581.95, 358, 14, true);
INSERT INTO public.productos VALUES (199, 'SanDisk USB-C S', 'SanDisk', 'USB-C S', 10, 20941.92, 31720.32, 496, 18, true);
INSERT INTO public.productos VALUES (200, 'Belkin DataTraveler 2023', 'Belkin', 'DataTraveler 2023', 10, 1545.77, 2196.15, 10, 19, true);
INSERT INTO public.productos VALUES (201, 'Logitech Extreme 2024', 'Logitech', 'Extreme 2024', 10, 8617.86, 10598.73, 410, 13, true);
INSERT INTO public.productos VALUES (202, 'Belkin Extreme 2023', 'Belkin', 'Extreme 2023', 10, 21185.05, 32567.80, 491, 5, true);
INSERT INTO public.productos VALUES (203, 'Ugreen DataTraveler 2023', 'Ugreen', 'DataTraveler 2023', 10, 8513.54, 11026.49, 499, 8, true);
INSERT INTO public.productos VALUES (204, 'Kingston DataTraveler Pro', 'Kingston', 'DataTraveler Pro', 10, 4478.94, 7103.30, 355, 14, true);
INSERT INTO public.productos VALUES (205, 'SanDisk USB-C X', 'SanDisk', 'USB-C X', 10, 18389.78, 23585.50, 90, 3, true);
INSERT INTO public.productos VALUES (206, 'SanDisk DataTraveler 2022', 'SanDisk', 'DataTraveler 2022', 10, 4674.73, 6045.35, 414, 10, true);
INSERT INTO public.productos VALUES (207, 'Anker DataTraveler Pro', 'Anker', 'DataTraveler Pro', 10, 18671.78, 23472.26, 163, 8, true);
INSERT INTO public.productos VALUES (208, 'Anker MX Keys 2022', 'Anker', 'MX Keys 2022', 10, 6740.53, 8508.53, 34, 14, true);
INSERT INTO public.productos VALUES (209, 'Anker PowerCore Plus', 'Anker', 'PowerCore Plus', 10, 11039.77, 14780.53, 85, 16, true);
INSERT INTO public.productos VALUES (210, 'Epson WorkForce 2023', 'Epson', 'WorkForce 2023', 11, 20745.85, 31221.02, 295, 10, true);
INSERT INTO public.productos VALUES (211, 'HP OfficeJet 2022', 'HP', 'OfficeJet 2022', 11, 8070.12, 12736.65, 37, 13, true);
INSERT INTO public.productos VALUES (212, 'Brother PIXMA 2023', 'Brother', 'PIXMA 2023', 11, 8548.07, 13620.27, 457, 18, true);
INSERT INTO public.productos VALUES (213, 'Brother PIXMA Plus', 'Brother', 'PIXMA Plus', 11, 4054.03, 4846.86, 105, 9, true);
INSERT INTO public.productos VALUES (214, 'Xerox WorkForce X', 'Xerox', 'WorkForce X', 11, 7540.41, 8996.93, 201, 20, true);
INSERT INTO public.productos VALUES (215, 'Canon OfficeJet 2022', 'Canon', 'OfficeJet 2022', 11, 10776.01, 13820.74, 338, 18, true);
INSERT INTO public.productos VALUES (216, 'HP PIXMA X', 'HP', 'PIXMA X', 11, 24429.88, 33300.54, 59, 12, true);
INSERT INTO public.productos VALUES (217, 'Brother Brother HL X', 'Brother', 'Brother HL X', 11, 2414.75, 3368.23, 94, 14, true);
INSERT INTO public.productos VALUES (218, 'Epson PIXMA 2022', 'Epson', 'PIXMA 2022', 11, 6692.90, 9097.50, 115, 11, true);
INSERT INTO public.productos VALUES (219, 'Canon OfficeJet Pro', 'Canon', 'OfficeJet Pro', 11, 20233.28, 27037.61, 387, 10, true);
INSERT INTO public.productos VALUES (220, 'Brother WorkForce 63', 'Brother', 'WorkForce 63', 11, 14381.95, 18064.29, 153, 5, true);
INSERT INTO public.productos VALUES (221, 'HP WorkForce 2024', 'HP', 'WorkForce 2024', 11, 3139.00, 4679.42, 88, 8, true);
INSERT INTO public.productos VALUES (222, 'Canon PIXMA Plus', 'Canon', 'PIXMA Plus', 11, 2097.46, 3056.85, 103, 7, true);
INSERT INTO public.productos VALUES (223, 'Epson EcoTank 2023', 'Epson', 'EcoTank 2023', 11, 9794.26, 13014.71, 166, 11, true);
INSERT INTO public.productos VALUES (224, 'HP WorkForce Plus', 'HP', 'WorkForce Plus', 11, 2946.09, 3586.39, 290, 6, true);
INSERT INTO public.productos VALUES (225, 'Xerox OfficeJet Pro', 'Xerox', 'OfficeJet Pro', 11, 21965.66, 27871.38, 335, 18, true);
INSERT INTO public.productos VALUES (226, 'Brother OfficeJet X', 'Brother', 'OfficeJet X', 11, 10163.90, 14516.18, 348, 15, false);
INSERT INTO public.productos VALUES (227, 'Epson PIXMA 16', 'Epson', 'PIXMA 16', 11, 23032.75, 35785.16, 10, 13, true);
INSERT INTO public.productos VALUES (228, 'Epson EcoTank 45', 'Epson', 'EcoTank 45', 11, 21477.13, 31317.59, 497, 10, true);
INSERT INTO public.productos VALUES (229, 'Brother EcoTank Plus', 'Brother', 'EcoTank Plus', 11, 15183.73, 18071.36, 226, 9, true);
INSERT INTO public.productos VALUES (230, 'Brother Brother HL Pro', 'Brother', 'Brother HL Pro', 11, 20552.28, 28400.61, 81, 5, true);
INSERT INTO public.productos VALUES (231, 'Xerox Brother HL 2022', 'Xerox', 'Brother HL 2022', 11, 4467.37, 6896.87, 102, 4, true);
INSERT INTO public.productos VALUES (232, 'Brother OfficeJet S', 'Brother', 'OfficeJet S', 11, 6958.34, 10580.70, 258, 15, true);
INSERT INTO public.productos VALUES (233, 'HP OfficeJet Pro', 'HP', 'OfficeJet Pro', 11, 12296.35, 16609.25, 491, 18, true);
INSERT INTO public.productos VALUES (234, 'Epson EcoTank X', 'Epson', 'EcoTank X', 11, 18761.68, 27391.73, 145, 3, true);
INSERT INTO public.productos VALUES (235, 'Canon WorkForce S', 'Canon', 'WorkForce S', 11, 16237.39, 23624.80, 137, 16, true);
INSERT INTO public.productos VALUES (236, 'HP Brother HL 2024', 'HP', 'Brother HL 2024', 11, 15088.38, 17409.10, 129, 12, true);
INSERT INTO public.productos VALUES (237, 'Seagate SSD Pro 54', 'Seagate', 'SSD Pro 54', 12, 6412.17, 8720.64, 346, 19, true);
INSERT INTO public.productos VALUES (238, 'Seagate RTX 4080 2022', 'Seagate', 'RTX 4080 2022', 12, 12861.12, 18623.67, 431, 14, true);
INSERT INTO public.productos VALUES (239, 'Western Digital RTX 4080 X', 'Western Digital', 'RTX 4080 X', 12, 17157.67, 23450.80, 172, 11, true);
INSERT INTO public.productos VALUES (240, 'ASUS DDR5 X', 'ASUS', 'DDR5 X', 12, 4830.75, 6679.87, 123, 4, true);
INSERT INTO public.productos VALUES (241, 'ASUS RTX 4080 Pro', 'ASUS', 'RTX 4080 Pro', 12, 17066.78, 25166.29, 335, 18, true);
INSERT INTO public.productos VALUES (242, 'Kingston SSD Pro Plus', 'Kingston', 'SSD Pro Plus', 12, 18457.79, 26069.06, 292, 9, true);
INSERT INTO public.productos VALUES (243, 'Corsair Ryzen 7 97', 'Corsair', 'Ryzen 7 97', 12, 22677.18, 32934.99, 259, 12, true);
INSERT INTO public.productos VALUES (244, 'ASUS Vengeance 2024', 'ASUS', 'Vengeance 2024', 12, 7450.53, 10146.51, 379, 11, true);
INSERT INTO public.productos VALUES (245, 'Western Digital Ryzen 7 Pro', 'Western Digital', 'Ryzen 7 Pro', 12, 16412.70, 20516.11, 114, 12, true);
INSERT INTO public.productos VALUES (246, 'Kingston DDR5 X', 'Kingston', 'DDR5 X', 12, 11674.45, 14044.38, 27, 5, true);
INSERT INTO public.productos VALUES (247, 'AMD RTX 4080 Plus', 'AMD', 'RTX 4080 Plus', 12, 13316.49, 17789.48, 445, 7, true);
INSERT INTO public.productos VALUES (248, 'AMD DDR5 62', 'AMD', 'DDR5 62', 12, 3709.12, 5704.91, 92, 5, true);
INSERT INTO public.productos VALUES (249, 'Corsair Ryzen 7 2022', 'Corsair', 'Ryzen 7 2022', 12, 267.13, 340.08, 389, 8, true);
INSERT INTO public.productos VALUES (250, 'AMD SSD Pro 2024', 'AMD', 'SSD Pro 2024', 12, 15419.82, 22128.51, 206, 16, true);
INSERT INTO public.productos VALUES (251, 'Seagate Core i7 S', 'Seagate', 'Core i7 S', 12, 18306.88, 28879.67, 456, 13, true);
INSERT INTO public.productos VALUES (252, 'Western Digital Ryzen 7 2022', 'Western Digital', 'Ryzen 7 2022', 12, 15723.17, 19842.18, 355, 14, true);
INSERT INTO public.productos VALUES (253, 'Intel SSD Pro X', 'Intel', 'SSD Pro X', 12, 4300.45, 6539.82, 152, 12, true);
INSERT INTO public.productos VALUES (254, 'Western Digital RTX 4080 Pro', 'Western Digital', 'RTX 4080 Pro', 12, 10926.58, 15942.44, 68, 13, true);
INSERT INTO public.productos VALUES (255, 'Seagate DDR5 2024', 'Seagate', 'DDR5 2024', 12, 23709.90, 37063.14, 206, 3, true);
INSERT INTO public.productos VALUES (256, 'Corsair Ryzen 7 2022', 'Corsair', 'Ryzen 7 2022', 12, 14803.87, 18150.18, 187, 4, true);
INSERT INTO public.productos VALUES (257, 'Corsair DDR5 2022', 'Corsair', 'DDR5 2022', 12, 14909.01, 17467.13, 55, 3, false);
INSERT INTO public.productos VALUES (258, 'Intel SSD Pro Plus', 'Intel', 'SSD Pro Plus', 12, 3221.34, 4070.91, 359, 7, true);
INSERT INTO public.productos VALUES (259, 'Corsair Vengeance X', 'Corsair', 'Vengeance X', 12, 10608.66, 12682.03, 266, 11, true);
INSERT INTO public.productos VALUES (260, 'Ubiquiti Archer 2023', 'Ubiquiti', 'Archer 2023', 13, 7175.26, 10785.43, 254, 9, true);
INSERT INTO public.productos VALUES (261, 'Netgear DIR-X Pro', 'Netgear', 'DIR-X Pro', 13, 17630.40, 22618.18, 20, 20, true);
INSERT INTO public.productos VALUES (262, 'Cisco DGS-1000 S', 'Cisco', 'DGS-1000 S', 13, 218.04, 316.65, 464, 6, true);
INSERT INTO public.productos VALUES (263, 'Ubiquiti Nighthawk 2023', 'Ubiquiti', 'Nighthawk 2023', 13, 18130.56, 21676.55, 131, 10, true);
INSERT INTO public.productos VALUES (264, 'Netgear UniFi 2022', 'Netgear', 'UniFi 2022', 13, 2630.25, 3231.57, 20, 12, true);
INSERT INTO public.productos VALUES (265, 'Netgear DGS-1000 2023', 'Netgear', 'DGS-1000 2023', 13, 21303.46, 33033.81, 4, 7, true);
INSERT INTO public.productos VALUES (266, 'Cisco UniFi 55', 'Cisco', 'UniFi 55', 13, 23883.97, 30350.30, 375, 5, true);
INSERT INTO public.productos VALUES (267, 'Netgear Nighthawk Plus', 'Netgear', 'Nighthawk Plus', 13, 10096.22, 13684.84, 427, 15, true);
INSERT INTO public.productos VALUES (268, 'Ubiquiti DGS-1000 2024', 'Ubiquiti', 'DGS-1000 2024', 13, 2959.46, 4330.51, 30, 8, true);
INSERT INTO public.productos VALUES (269, 'D-Link DGS-1000 82', 'D-Link', 'DGS-1000 82', 13, 4654.32, 6147.83, 183, 3, true);
INSERT INTO public.productos VALUES (270, 'Cisco DGS-1000 2023', 'Cisco', 'DGS-1000 2023', 13, 22206.71, 29941.52, 32, 11, true);
INSERT INTO public.productos VALUES (271, 'TP-Link DIR-X S', 'TP-Link', 'DIR-X S', 13, 24450.70, 35488.48, 173, 19, true);
INSERT INTO public.productos VALUES (272, 'D-Link Archer S', 'D-Link', 'Archer S', 13, 12125.95, 17566.50, 328, 15, true);
INSERT INTO public.productos VALUES (273, 'D-Link DIR-X 2022', 'D-Link', 'DIR-X 2022', 13, 16138.46, 19698.88, 434, 18, true);
INSERT INTO public.productos VALUES (274, 'Cisco Archer Pro', 'Cisco', 'Archer Pro', 13, 6136.16, 9735.42, 25, 19, true);
INSERT INTO public.productos VALUES (275, 'Ubiquiti DGS-1000 2023', 'Ubiquiti', 'DGS-1000 2023', 13, 11558.50, 17459.90, 229, 5, true);
INSERT INTO public.productos VALUES (276, 'Ubiquiti UniFi 25', 'Ubiquiti', 'UniFi 25', 13, 18669.19, 21618.85, 206, 16, false);
INSERT INTO public.productos VALUES (277, 'D-Link Archer X', 'D-Link', 'Archer X', 13, 22269.26, 31244.88, 335, 17, true);
INSERT INTO public.productos VALUES (278, 'Netgear Archer 38', 'Netgear', 'Archer 38', 13, 8399.52, 12560.12, 307, 18, true);
INSERT INTO public.productos VALUES (279, 'Duracell Back-UPS S', 'Duracell', 'Back-UPS S', 14, 204.59, 267.97, 324, 12, true);
INSERT INTO public.productos VALUES (280, 'Energizer Back-UPS 2024', 'Energizer', 'Back-UPS 2024', 14, 12386.69, 18825.63, 380, 16, true);
INSERT INTO public.productos VALUES (281, 'Eaton PowerBank 2023', 'Eaton', 'PowerBank 2023', 14, 23265.87, 30869.24, 234, 9, true);
INSERT INTO public.productos VALUES (282, 'APC UPS 1500 2023', 'APC', 'UPS 1500 2023', 14, 19337.81, 26158.78, 337, 19, true);
INSERT INTO public.productos VALUES (283, 'Duracell Back-UPS 2022', 'Duracell', 'Back-UPS 2022', 14, 13897.67, 18689.10, 299, 18, true);
INSERT INTO public.productos VALUES (284, 'Anker PowerBank 2023', 'Anker', 'PowerBank 2023', 14, 9777.03, 13885.78, 451, 13, true);
INSERT INTO public.productos VALUES (285, 'Duracell UPS 1500 S', 'Duracell', 'UPS 1500 S', 14, 6948.86, 11004.33, 496, 12, true);
INSERT INTO public.productos VALUES (286, 'Anker PowerBank X', 'Anker', 'PowerBank X', 14, 21100.40, 29466.98, 160, 20, true);
INSERT INTO public.productos VALUES (287, 'Anker PowerBank X', 'Anker', 'PowerBank X', 14, 17212.29, 26929.25, 67, 8, true);
INSERT INTO public.productos VALUES (288, 'Energizer Back-UPS 55', 'Energizer', 'Back-UPS 55', 14, 14632.74, 23034.91, 363, 16, true);
INSERT INTO public.productos VALUES (289, 'Eaton Pro Charger 2022', 'Eaton', 'Pro Charger 2022', 14, 13139.84, 15260.25, 74, 4, true);
INSERT INTO public.productos VALUES (290, 'Anker Pro Charger X', 'Anker', 'Pro Charger X', 14, 17132.25, 20830.98, 31, 12, true);
INSERT INTO public.productos VALUES (291, 'Eaton Back-UPS 55', 'Eaton', 'Back-UPS 55', 14, 2696.63, 4154.47, 378, 20, true);
INSERT INTO public.productos VALUES (292, 'Eaton UPS 1500 X', 'Eaton', 'UPS 1500 X', 14, 17369.46, 20342.09, 195, 15, true);
INSERT INTO public.productos VALUES (293, 'Energizer Back-UPS X', 'Energizer', 'Back-UPS X', 14, 5196.72, 8008.05, 440, 17, true);
INSERT INTO public.productos VALUES (294, 'Energizer PowerBank X', 'Energizer', 'PowerBank X', 14, 11303.05, 18000.72, 38, 8, true);
INSERT INTO public.productos VALUES (295, 'Eaton Back-UPS 2022', 'Eaton', 'Back-UPS 2022', 14, 10798.42, 15122.86, 66, 8, true);
INSERT INTO public.productos VALUES (296, 'Energizer Back-UPS 52', 'Energizer', 'Back-UPS 52', 14, 17785.78, 21692.65, 78, 13, true);
INSERT INTO public.productos VALUES (297, 'Eaton Pro Charger Pro', 'Eaton', 'Pro Charger Pro', 14, 1961.09, 2879.78, 269, 10, true);
INSERT INTO public.productos VALUES (298, 'Eaton Back-UPS 2024', 'Eaton', 'Back-UPS 2024', 14, 10485.89, 14592.86, 47, 14, true);
INSERT INTO public.productos VALUES (299, 'Anker Pro Charger Pro', 'Anker', 'Pro Charger Pro', 14, 7445.32, 11746.03, 316, 19, true);
INSERT INTO public.productos VALUES (300, 'Eaton Back-UPS Pro', 'Eaton', 'Back-UPS Pro', 14, 11224.83, 17477.32, 314, 10, true);
INSERT INTO public.productos VALUES (301, 'Energizer UPS 1500 Plus', 'Energizer', 'UPS 1500 Plus', 14, 6526.28, 9631.41, 12, 19, true);
INSERT INTO public.productos VALUES (302, 'Energizer UPS 1500 2022', 'Energizer', 'UPS 1500 2022', 14, 7516.38, 10847.55, 164, 19, true);
INSERT INTO public.productos VALUES (303, 'APC PowerBank 2022', 'APC', 'PowerBank 2022', 14, 15729.29, 19580.63, 322, 9, true);
INSERT INTO public.productos VALUES (304, 'Duracell Back-UPS Plus', 'Duracell', 'Back-UPS Plus', 14, 16217.04, 25507.59, 382, 7, false);
INSERT INTO public.productos VALUES (305, 'Microsoft Office 365 2022', 'Microsoft', 'Office 365 2022', 15, 4573.11, 5777.48, 36, 10, true);
INSERT INTO public.productos VALUES (306, 'Kaspersky AutoCAD Plus', 'Kaspersky', 'AutoCAD Plus', 15, 10910.67, 12630.20, 344, 6, true);
INSERT INTO public.productos VALUES (307, 'Autodesk Office 365 2022', 'Autodesk', 'Office 365 2022', 15, 17566.92, 20775.79, 475, 19, true);
INSERT INTO public.productos VALUES (308, 'Norton Office 365 46', 'Norton', 'Office 365 46', 15, 9628.13, 14634.32, 15, 18, true);
INSERT INTO public.productos VALUES (309, 'Adobe Acrobat X', 'Adobe', 'Acrobat X', 15, 24009.34, 29167.36, 346, 14, true);
INSERT INTO public.productos VALUES (310, 'Microsoft Acrobat 2022', 'Microsoft', 'Acrobat 2022', 15, 274.99, 390.07, 275, 20, true);
INSERT INTO public.productos VALUES (311, 'Norton Acrobat S', 'Norton', 'Acrobat S', 15, 10404.46, 14989.38, 262, 7, true);
INSERT INTO public.productos VALUES (312, 'Adobe AntiVirus 2023', 'Adobe', 'AntiVirus 2023', 15, 4656.75, 7030.98, 436, 4, true);
INSERT INTO public.productos VALUES (313, 'Autodesk AutoCAD 2023', 'Autodesk', 'AutoCAD 2023', 15, 7372.72, 8702.12, 50, 9, true);
INSERT INTO public.productos VALUES (314, 'Kaspersky AntiVirus 2024', 'Kaspersky', 'AntiVirus 2024', 15, 16831.69, 21132.86, 145, 5, true);
INSERT INTO public.productos VALUES (315, 'Norton AutoCAD Pro', 'Norton', 'AutoCAD Pro', 15, 15466.11, 19913.45, 299, 7, true);
INSERT INTO public.productos VALUES (316, 'Norton AntiVirus 2024', 'Norton', 'AntiVirus 2024', 15, 270.07, 340.50, 113, 16, true);
INSERT INTO public.productos VALUES (317, 'Norton Acrobat Pro', 'Norton', 'Acrobat Pro', 15, 21965.46, 29835.28, 183, 12, true);
INSERT INTO public.productos VALUES (318, 'Microsoft Acrobat 2023', 'Microsoft', 'Acrobat 2023', 15, 21068.56, 32370.18, 71, 20, true);
INSERT INTO public.productos VALUES (319, 'Microsoft Office 365 2022', 'Microsoft', 'Office 365 2022', 15, 20344.16, 28695.55, 393, 9, true);
INSERT INTO public.productos VALUES (320, 'Autodesk AntiVirus 79', 'Autodesk', 'AntiVirus 79', 15, 16399.62, 19956.45, 200, 10, true);
INSERT INTO public.productos VALUES (321, 'Autodesk AntiVirus 27', 'Autodesk', 'AntiVirus 27', 15, 12602.91, 15006.91, 186, 19, false);
INSERT INTO public.productos VALUES (322, 'Adobe Acrobat 2024', 'Adobe', 'Acrobat 2024', 15, 11238.58, 13830.37, 485, 7, true);
INSERT INTO public.productos VALUES (323, 'Kaspersky AntiVirus S', 'Kaspersky', 'AntiVirus S', 15, 19072.59, 23922.51, 135, 14, true);
INSERT INTO public.productos VALUES (324, 'Adobe AntiVirus 59', 'Adobe', 'AntiVirus 59', 15, 22959.86, 35511.98, 20, 13, true);
INSERT INTO public.productos VALUES (325, 'Autodesk AntiVirus 2024', 'Autodesk', 'AntiVirus 2024', 15, 9509.99, 12556.36, 300, 5, true);
INSERT INTO public.productos VALUES (326, 'Kaspersky Acrobat Plus', 'Kaspersky', 'Acrobat Plus', 15, 8919.52, 13740.29, 249, 18, true);
INSERT INTO public.productos VALUES (327, 'Microsoft Acrobat 2024', 'Microsoft', 'Acrobat 2024', 15, 5865.27, 8103.13, 143, 9, true);
INSERT INTO public.productos VALUES (328, 'Adobe AntiVirus 2023', 'Adobe', 'AntiVirus 2023', 15, 16578.57, 22158.52, 169, 6, true);
INSERT INTO public.productos VALUES (329, 'Kaspersky AutoCAD 2024', 'Kaspersky', 'AutoCAD 2024', 15, 16234.39, 21671.36, 124, 4, true);


--
-- TOC entry 5095 (class 0 OID 24627)
-- Dependencies: 226
-- Data for Name: regiones; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.regiones VALUES (1, 'Norte', 'México');
INSERT INTO public.regiones VALUES (2, 'Sur', 'México');
INSERT INTO public.regiones VALUES (3, 'Este', 'México');
INSERT INTO public.regiones VALUES (4, 'Oeste', 'México');
INSERT INTO public.regiones VALUES (5, 'Centro', 'México');
INSERT INTO public.regiones VALUES (6, 'Noreste', 'México');
INSERT INTO public.regiones VALUES (7, 'Noroeste', 'México');
INSERT INTO public.regiones VALUES (8, 'Sureste', 'México');


--
-- TOC entry 5107 (class 0 OID 0)
-- Dependencies: 229
-- Name: ciudad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ciudad_id_seq', 20, true);


--
-- TOC entry 5108 (class 0 OID 0)
-- Dependencies: 227
-- Name: estado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estado_id_seq', 25, true);


--
-- TOC entry 4906 (class 2606 OID 24635)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (categoria_id);


--
-- TOC entry 4928 (class 2606 OID 24721)
-- Name: ciudad ciudad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (id);


--
-- TOC entry 4908 (class 2606 OID 24637)
-- Name: clientes clientes_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key UNIQUE (email);


--
-- TOC entry 4910 (class 2606 OID 24639)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (cliente_id);


--
-- TOC entry 4912 (class 2606 OID 24641)
-- Name: departamentos departamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT departamentos_pkey PRIMARY KEY (departamento_id);


--
-- TOC entry 4914 (class 2606 OID 24643)
-- Name: detalle_pedidos detalle_pedidos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_pedidos
    ADD CONSTRAINT detalle_pedidos_pkey PRIMARY KEY (detalle_id);


--
-- TOC entry 4916 (class 2606 OID 24645)
-- Name: empleados empleados_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_email_key UNIQUE (email);


--
-- TOC entry 4918 (class 2606 OID 24647)
-- Name: empleados empleados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (empleado_id);


--
-- TOC entry 4926 (class 2606 OID 24712)
-- Name: estado estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (id);


--
-- TOC entry 4920 (class 2606 OID 24649)
-- Name: pedidos pedidos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_pkey PRIMARY KEY (pedido_id);


--
-- TOC entry 4922 (class 2606 OID 24651)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (producto_id);


--
-- TOC entry 4924 (class 2606 OID 24653)
-- Name: regiones regiones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regiones
    ADD CONSTRAINT regiones_pkey PRIMARY KEY (region_id);


--
-- TOC entry 4929 (class 2606 OID 24654)
-- Name: clientes clientes_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regiones(region_id);


--
-- TOC entry 4931 (class 2606 OID 24659)
-- Name: departamentos departamentos_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT departamentos_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regiones(region_id);


--
-- TOC entry 4932 (class 2606 OID 24664)
-- Name: detalle_pedidos detalle_pedidos_pedido_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_pedidos
    ADD CONSTRAINT detalle_pedidos_pedido_id_fkey FOREIGN KEY (pedido_id) REFERENCES public.pedidos(pedido_id);


--
-- TOC entry 4933 (class 2606 OID 24669)
-- Name: detalle_pedidos detalle_pedidos_producto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalle_pedidos
    ADD CONSTRAINT detalle_pedidos_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES public.productos(producto_id);


--
-- TOC entry 4934 (class 2606 OID 24674)
-- Name: empleados empleados_departamento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_departamento_id_fkey FOREIGN KEY (departamento_id) REFERENCES public.departamentos(departamento_id);


--
-- TOC entry 4935 (class 2606 OID 24679)
-- Name: empleados empleados_jefe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_jefe_id_fkey FOREIGN KEY (jefe_id) REFERENCES public.empleados(empleado_id);


--
-- TOC entry 4940 (class 2606 OID 24722)
-- Name: ciudad fk_ciudad_estado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudad
    ADD CONSTRAINT fk_ciudad_estado FOREIGN KEY (estado_id) REFERENCES public.estado(id);


--
-- TOC entry 4930 (class 2606 OID 24727)
-- Name: clientes fk_clientes_ciudad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT fk_clientes_ciudad FOREIGN KEY (ciudad_id) REFERENCES public.ciudad(id);


--
-- TOC entry 4936 (class 2606 OID 24684)
-- Name: pedidos pedidos_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.clientes(cliente_id);


--
-- TOC entry 4937 (class 2606 OID 24689)
-- Name: pedidos pedidos_empleado_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_empleado_id_fkey FOREIGN KEY (empleado_id) REFERENCES public.empleados(empleado_id);


--
-- TOC entry 4938 (class 2606 OID 24694)
-- Name: pedidos pedidos_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regiones(region_id);


--
-- TOC entry 4939 (class 2606 OID 24699)
-- Name: productos productos_categoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES public.categorias(categoria_id);


-- Completed on 2026-10-27 09:26:46

--
-- PostgreSQL database dump complete
--

\unrestrict TcyDEO2cleu3YFKblakyHtC2TUo4kfOM9UdFctldmfcSqrDQnTArdN329FocyPQ

