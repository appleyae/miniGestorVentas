--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE clientes (
    cod_cliente integer NOT NULL,
    apellido character varying(255),
    direccion character varying(255),
    nombre character varying(255),
    telefono character varying(255)
);


ALTER TABLE clientes OWNER TO postgres;

--
-- Name: id_usuario_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_usuario_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE id_usuario_usuario_seq OWNER TO postgres;

--
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE productos (
    id integer NOT NULL,
    nombre character varying(255),
    precio integer,
    existencia integer
);


ALTER TABLE productos OWNER TO postgres;

--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE usuario (
    id_usuario numeric(38,0) NOT NULL,
    contrasenha character varying(255),
    estado character varying(255),
    nombre character varying(255),
    rol character varying(255)
);


ALTER TABLE usuario OWNER TO postgres;

--
-- Name: vendedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE vendedores (
    id integer NOT NULL,
    nombre character varying(255),
    apellido character varying(255)
);


ALTER TABLE vendedores OWNER TO postgres;

--
-- Name: venta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE venta (
    id integer NOT NULL,
    id_cliente integer,
    id_vendedor integer,
    id_ventas integer
);


ALTER TABLE venta OWNER TO postgres;

--
-- Name: venta_det; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE venta_det (
    id integer NOT NULL,
    id_producto integer,
    cantidad integer,
    total_producto integer,
    id_ventas integer
);


ALTER TABLE venta_det OWNER TO postgres;

--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY clientes (cod_cliente, apellido, direccion, nombre, telefono) FROM stdin;
1	Caceres	Calle 1 y Calle 2	Antonio	021-944787
2	Riquelque	Calle 4	Juan	098665544
\.


--
-- Name: id_usuario_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id_usuario_usuario_seq', 2, true);


--
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY productos (id, nombre, precio, existencia) FROM stdin;
1	Coca Cola 1L.	5000	10
2	Papa fritas 300g	3000	10
3	Latita de Miller Negra	10000	10
4	Pilsen'i	2500	20
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuario (id_usuario, contrasenha, estado, nombre, rol) FROM stdin;
1	12345	A	ANTO	admin
2	admin	A	Eduardo Appleyard	admin
3	Romero	A	Larissa	admin
\.


--
-- Data for Name: vendedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY vendedores (id, nombre, apellido) FROM stdin;
1	Eduardo	Appleyard
2	Larissa	Romero
\.


--
-- Data for Name: venta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY venta (id, id_cliente, id_vendedor, id_ventas) FROM stdin;
\.


--
-- Data for Name: venta_det; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY venta_det (id, id_producto, cantidad, total_producto, id_ventas) FROM stdin;
\.


--
-- Name: clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (cod_cliente);


--
-- Name: productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- Name: vendedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vendedores
    ADD CONSTRAINT vendedores_pkey PRIMARY KEY (id);


--
-- Name: venta_det_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venta_det
    ADD CONSTRAINT venta_det_pkey PRIMARY KEY (id);


--
-- Name: venta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY venta
    ADD CONSTRAINT venta_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

