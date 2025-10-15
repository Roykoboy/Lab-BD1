--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2024-10-31 22:35:56

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
-- TOC entry 225 (class 1259 OID 16406)
-- Name: Company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Company" (
    id_company bigint NOT NULL,
    "id_Directors" bigint NOT NULL,
    "date of foundation" date,
    "type of activity" character varying,
    "count employees" bigint,
    "company name" character varying
);


ALTER TABLE public."Company" OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16411)
-- Name: Company_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Company_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Company_Id_seq" OWNER TO postgres;

--
-- TOC entry 4847 (class 0 OID 0)
-- Dependencies: 226
-- Name: Company_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Company_Id_seq" OWNED BY public."Company".id_company;


--
-- TOC entry 223 (class 1259 OID 16402)
-- Name: Contracts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Contracts" (
    id bigint NOT NULL,
    id_client bigint,
    id_product bigint,
    "purchased products" bigint,
    date date
);


ALTER TABLE public."Contracts" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16405)
-- Name: Contracts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Contracts_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Contracts_id_seq" OWNER TO postgres;

--
-- TOC entry 4848 (class 0 OID 0)
-- Dependencies: 224
-- Name: Contracts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Contracts_id_seq" OWNED BY public."Contracts".id;


--
-- TOC entry 219 (class 1259 OID 16392)
-- Name: Credits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Credits" (
    "id_Directors" bigint NOT NULL,
    "credit amount" bigint
);


ALTER TABLE public."Credits" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16395)
-- Name: Credits_id_Directors_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Credits_id_Directors_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Credits_id_Directors_seq" OWNER TO postgres;

--
-- TOC entry 4850 (class 0 OID 0)
-- Dependencies: 220
-- Name: Credits_id_Directors_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Credits_id_Directors_seq" OWNED BY public."Credits"."id_Directors";


--
-- TOC entry 217 (class 1259 OID 16386)
-- Name: Directors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Directors" (
    id bigint NOT NULL,
    "Full name" character varying,
    "date of birth" date
);


ALTER TABLE public."Directors" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16391)
-- Name: Directors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Directors_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Directors_id_seq" OWNER TO postgres;

--
-- TOC entry 4851 (class 0 OID 0)
-- Dependencies: 218
-- Name: Directors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Directors_id_seq" OWNED BY public."Directors".id;


--
-- TOC entry 221 (class 1259 OID 16396)
-- Name: released product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."released product" (
    id bigint NOT NULL,
    name character varying,
    cost bigint,
    id_company bigint
);


ALTER TABLE public."released product" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16401)
-- Name: released product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."released product_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."released product_id_seq" OWNER TO postgres;

--
-- TOC entry 4852 (class 0 OID 0)
-- Dependencies: 222
-- Name: released product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."released product_id_seq" OWNED BY public."released product".id;


--
-- TOC entry 4665 (class 2604 OID 16416)
-- Name: Company id_company; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Company" ALTER COLUMN id_company SET DEFAULT nextval('public."Company_Id_seq"'::regclass);


--
-- TOC entry 4664 (class 2604 OID 16414)
-- Name: Contracts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Contracts" ALTER COLUMN id SET DEFAULT nextval('public."Contracts_id_seq"'::regclass);


--
-- TOC entry 4662 (class 2604 OID 16415)
-- Name: Credits id_Directors; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Credits" ALTER COLUMN "id_Directors" SET DEFAULT nextval('public."Credits_id_Directors_seq"'::regclass);


--
-- TOC entry 4661 (class 2604 OID 16413)
-- Name: Directors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Directors" ALTER COLUMN id SET DEFAULT nextval('public."Directors_id_seq"'::regclass);


--
-- TOC entry 4663 (class 2604 OID 16412)
-- Name: released product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."released product" ALTER COLUMN id SET DEFAULT nextval('public."released product_id_seq"'::regclass);


--
-- TOC entry 4840 (class 0 OID 16406)
-- Dependencies: 225
-- Data for Name: Company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Company" (id_company, "id_Directors", "date of foundation", "type of activity", "count employees", "company name") FROM stdin;
1	1	2006-06-14	Производство красок, эмалей и чернил для промышленного и полиграфического использования	130	Омский Красочный Завод
2	2	2002-05-30	Производство строительных материалов и керамической продукции	220	Завод Керамических Блоков
3	3	2003-09-12	Производство и продажа мебели	200	Комфорт
4	4	1999-08-14	Cтроительство, поставка строительных материалов	500	Стройинвест
5	5	1998-03-20	Производство бумажной продукции	300	СибБумага
6	6	1965-05-18	Типографское производство, полиграфия	300	ДомПечати
\.


--
-- TOC entry 4838 (class 0 OID 16402)
-- Dependencies: 223
-- Data for Name: Contracts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Contracts" (id, id_client, id_product, "purchased products", date) FROM stdin;
2	1	201	2400	2004-04-22
3	1	301	100	2000-02-23
4	2	101	350	2004-04-05
6	2	501	10000	2006-02-12
7	2	601	2000	2007-12-12
8	3	401	5000	2005-05-25
9	4	201	10000	2004-04-05
5	2	401	1000	2004-04-05
1	1	601	3500	2004-04-15
10	4	501	2000	2004-04-05
\.


--
-- TOC entry 4834 (class 0 OID 16392)
-- Dependencies: 219
-- Data for Name: Credits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Credits" ("id_Directors", "credit amount") FROM stdin;
1	1450000
2	900000
3	1430000
4	859000
5	1123000
6	1900000
\.


--
-- TOC entry 4832 (class 0 OID 16386)
-- Dependencies: 217
-- Data for Name: Directors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Directors" (id, "Full name", "date of birth") FROM stdin;
1	Дмитрий Викторович Селезнев	1981-03-29
2	Павел Андреевич Сидоров	1978-08-21
3	Сергей Александрович Климов	1980-04-25
4	Николай Васильевич Соколов	1971-02-10
5	Андрей Петрович Власов	1974-07-15
6	Виктор Иванович Михайлов	1969-11-02
\.


--
-- TOC entry 4836 (class 0 OID 16396)
-- Dependencies: 221
-- Data for Name: released product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."released product" (id, name, cost, id_company) FROM stdin;
101	Краски	150	1
201	Кирпич	10	2
301	Шкаф	8000	3
401	Металлочерепица	3000	4
501	Бумага	100	5
601	Книги	300	6
\.


--
-- TOC entry 4853 (class 0 OID 0)
-- Dependencies: 226
-- Name: Company_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Company_Id_seq"', 9, true);


--
-- TOC entry 4854 (class 0 OID 0)
-- Dependencies: 224
-- Name: Contracts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Contracts_id_seq"', 12, true);


--
-- TOC entry 4855 (class 0 OID 0)
-- Dependencies: 220
-- Name: Credits_id_Directors_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Credits_id_Directors_seq"', 6, true);


--
-- TOC entry 4856 (class 0 OID 0)
-- Dependencies: 218
-- Name: Directors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Directors_id_seq"', 6, true);


--
-- TOC entry 4857 (class 0 OID 0)
-- Dependencies: 222
-- Name: released product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."released product_id_seq"', 1, false);


--
-- TOC entry 4680 (class 2606 OID 16426)
-- Name: Company company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Company"
    ADD CONSTRAINT company_pkey PRIMARY KEY (id_company);


--
-- TOC entry 4673 (class 2606 OID 16422)
-- Name: released product released product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."released product"
    ADD CONSTRAINT "released product_pkey" PRIMARY KEY (id);


--
-- TOC entry 4667 (class 2606 OID 16418)
-- Name: Directors Директора_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Directors"
    ADD CONSTRAINT "Директора_pkey" PRIMARY KEY (id);


--
-- TOC entry 4670 (class 2606 OID 16420)
-- Name: Credits Кредиты_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Credits"
    ADD CONSTRAINT "Кредиты_pkey" PRIMARY KEY ("id_Directors");


--
-- TOC entry 4678 (class 2606 OID 16424)
-- Name: Contracts контракты_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Contracts"
    ADD CONSTRAINT "контракты_pkey" PRIMARY KEY (id);


--
-- TOC entry 4668 (class 1259 OID 16427)
-- Name: fki_id_директора; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_id_директора" ON public."Credits" USING btree ("id_Directors");


--
-- TOC entry 4674 (class 1259 OID 16428)
-- Name: fki_id_товара; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_id_товара" ON public."Contracts" USING btree (id_product);


--
-- TOC entry 4675 (class 1259 OID 16429)
-- Name: fki_id_товара_выпущенныйтовар; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_id_товара_выпущенныйтовар" ON public."Contracts" USING btree (id_product);


--
-- TOC entry 4671 (class 1259 OID 16430)
-- Name: fki_г; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_г" ON public."released product" USING btree (id_company);


--
-- TOC entry 4676 (class 1259 OID 16431)
-- Name: fki_ш; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_ш" ON public."Contracts" USING btree (id_client);


--
-- TOC entry 4686 (class 2606 OID 16437)
-- Name: Company id_Directors; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Company"
    ADD CONSTRAINT "id_Directors" FOREIGN KEY ("id_Directors") REFERENCES public."Directors"(id) NOT VALID;


--
-- TOC entry 4682 (class 2606 OID 16447)
-- Name: released product id_company; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."released product"
    ADD CONSTRAINT id_company FOREIGN KEY (id_company) REFERENCES public."Company"(id_company);


--
-- TOC entry 4681 (class 2606 OID 16432)
-- Name: Credits id_директора; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Credits"
    ADD CONSTRAINT "id_директора" FOREIGN KEY ("id_Directors") REFERENCES public."Directors"(id) NOT VALID;


--
-- TOC entry 4683 (class 2606 OID 16442)
-- Name: Contracts id_заказчика_предприятия; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Contracts"
    ADD CONSTRAINT "id_заказчика_предприятия" FOREIGN KEY (id_client) REFERENCES public."Company"(id_company) NOT VALID;


--
-- TOC entry 4684 (class 2606 OID 16452)
-- Name: Contracts id_товара; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Contracts"
    ADD CONSTRAINT "id_товара" FOREIGN KEY (id_product) REFERENCES public."released product"(id) NOT VALID;


--
-- TOC entry 4685 (class 2606 OID 16457)
-- Name: Contracts id_товара_выпущенныйтовар; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Contracts"
    ADD CONSTRAINT "id_товара_выпущенныйтовар" FOREIGN KEY (id_product) REFERENCES public."released product"(id) NOT VALID;


--
-- TOC entry 4849 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE "Credits"; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE public."Credits" FROM postgres;
GRANT ALL ON TABLE public."Credits" TO PUBLIC;


-- Completed on 2024-10-31 22:35:56

--
-- PostgreSQL database dump complete
--

