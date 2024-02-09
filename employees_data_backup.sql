--
-- PostgreSQL database dump
--

-- Dumped from database version 10.23
-- Dumped by pg_dump version 10.23

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: authorities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authorities (
    username character varying(50) NOT NULL,
    authority character varying(50) NOT NULL
);


ALTER TABLE public.authorities OWNER TO postgres;

--
-- Name: employee_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_data (
    employee_id bigint NOT NULL,
    employee_name character(50) NOT NULL,
    employee_age integer,
    employee_address character(250),
    employee_phone character(50),
    employee_position character(50),
    employee_email character(250)
);


ALTER TABLE public.employee_data OWNER TO postgres;

--
-- Name: employee_data_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_data_employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_data_employee_id_seq OWNER TO postgres;

--
-- Name: employee_data_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_data_employee_id_seq OWNED BY public.employee_data.employee_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    username character varying(50) NOT NULL,
    password character varying(500) NOT NULL,
    enabled boolean NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: employee_data employee_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_data ALTER COLUMN employee_id SET DEFAULT nextval('public.employee_data_employee_id_seq'::regclass);


--
-- Data for Name: authorities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authorities (username, authority) FROM stdin;
haungkhaung	ADMIN
Jackon	Admin
Jame	Admin
Jame1	Admin
string	string
Jackson	ADMIN
\.


--
-- Data for Name: employee_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_data (employee_id, employee_name, employee_age, employee_address, employee_phone, employee_position, employee_email) FROM stdin;
6	Charlie                                           	50	Yangon                                                                                                                                                                                                                                                    	0098899977                                        	Senior                                            	uzaw90123@gmail.com                                                                                                                                                                                                                                       
10	Justin                                            	19	Mdy                                                                                                                                                                                                                                                       	099429118                                         	Junior                                            	mgchit123@gmail.com                                                                                                                                                                                                                                       
4	Jack                                              	25	Yangon                                                                                                                                                                                                                                                    	0998989898                                        	Senior                                            	mgmg98u313@gmail.com                                                                                                                                                                                                                                      
9	Okilven                                           	23	Yangon                                                                                                                                                                                                                                                    	09909097777                                       	Junior                                            	nyi9328@gmail.com                                                                                                                                                                                                                                         
15	Jacksonnn                                         	19	Mdy                                                                                                                                                                                                                                                       	09229                                             	\N	\N
7	 Name                                             	30	Updated Address                                                                                                                                                                                                                                           	0933                                              	Senior                                            	mamyintkkk99@gmail.com                                                                                                                                                                                                                                    
18	Kack                                              	2	Mdy                                                                                                                                                                                                                                                       	\N	\N	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (username, password, enabled) FROM stdin;
haungkhaung	$2a$12$SanMPPwdaKsV1TOM.Xf47eoAZLBTuRkQuS.FghUI6JspxR3vaRQKe	t
Jame	jack123	f
Jame1	jack123	f
Jackon	$2a$12$G5zu.32I0nBd.0EEd.fGue9VJrYQh5qzEE9ADOnN39.2z8jg4Av42\n	t
string	string	t
Jackson	$2a$10$AhZMI894tHGek7s4caSYues.GSxc407q7PwoGhxgx/wYMsS/cTbtu	t
\.


--
-- Name: employee_data_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_data_employee_id_seq', 18, true);


--
-- Name: employee_data employee_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_data
    ADD CONSTRAINT employee_data_pkey PRIMARY KEY (employee_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- Name: ix_auth_username; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_auth_username ON public.authorities USING btree (username, authority);


--
-- Name: authorities fk_authorities_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authorities
    ADD CONSTRAINT fk_authorities_users FOREIGN KEY (username) REFERENCES public.users(username);


--
-- PostgreSQL database dump complete
--

