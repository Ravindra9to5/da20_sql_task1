--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

-- Started on 2025-07-02 13:56:01

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
-- TOC entry 225 (class 1259 OID 16478)
-- Name: branch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.branch (
    branch_id integer NOT NULL,
    deparment_id integer NOT NULL,
    name character varying NOT NULL,
    total_seat integer NOT NULL,
    seat_filled integer NOT NULL,
    branch_head character varying
);


ALTER TABLE public.branch OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16476)
-- Name: branch_branch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.branch_branch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.branch_branch_id_seq OWNER TO postgres;

--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 223
-- Name: branch_branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.branch_branch_id_seq OWNED BY public.branch.branch_id;


--
-- TOC entry 224 (class 1259 OID 16477)
-- Name: branch_deparment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.branch_deparment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.branch_deparment_id_seq OWNER TO postgres;

--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 224
-- Name: branch_deparment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.branch_deparment_id_seq OWNED BY public.branch.deparment_id;


--
-- TOC entry 219 (class 1259 OID 16447)
-- Name: college; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.college (
    college_id integer NOT NULL,
    university_id integer NOT NULL,
    name character varying NOT NULL,
    founded_year integer NOT NULL,
    num_departments integer,
    dean character varying
);


ALTER TABLE public.college OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16446)
-- Name: college_college_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.college_college_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.college_college_id_seq OWNER TO postgres;

--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 218
-- Name: college_college_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.college_college_id_seq OWNED BY public.college.college_id;


--
-- TOC entry 222 (class 1259 OID 16462)
-- Name: deparments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deparments (
    deparment_id integer NOT NULL,
    college_id integer NOT NULL,
    name character varying NOT NULL,
    establish_year integer NOT NULL,
    hod_name character varying,
    no_of_faculties integer
);


ALTER TABLE public.deparments OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16461)
-- Name: deparments_college_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deparments_college_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.deparments_college_id_seq OWNER TO postgres;

--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 221
-- Name: deparments_college_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deparments_college_id_seq OWNED BY public.deparments.college_id;


--
-- TOC entry 220 (class 1259 OID 16460)
-- Name: deparments_deparment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deparments_deparment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.deparments_deparment_id_seq OWNER TO postgres;

--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 220
-- Name: deparments_deparment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deparments_deparment_id_seq OWNED BY public.deparments.deparment_id;


--
-- TOC entry 228 (class 1259 OID 16494)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    std_id integer NOT NULL,
    branch_id integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    dob date,
    gpa integer,
    percentage double precision,
    email_id character varying,
    enrollment_date date
);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16510)
-- Name: student_branch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_branch (
    std_id integer NOT NULL,
    branch_id integer NOT NULL,
    enrolled_on date DEFAULT CURRENT_DATE NOT NULL,
    grade character varying,
    total_fees integer,
    paid_fees integer
);


ALTER TABLE public.student_branch OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16509)
-- Name: student_branch_branch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_branch_branch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_branch_branch_id_seq OWNER TO postgres;

--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 230
-- Name: student_branch_branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_branch_branch_id_seq OWNED BY public.student_branch.branch_id;


--
-- TOC entry 227 (class 1259 OID 16493)
-- Name: student_branch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_branch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_branch_id_seq OWNER TO postgres;

--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 227
-- Name: student_branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_branch_id_seq OWNED BY public.student.branch_id;


--
-- TOC entry 229 (class 1259 OID 16508)
-- Name: student_branch_std_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_branch_std_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_branch_std_id_seq OWNER TO postgres;

--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 229
-- Name: student_branch_std_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_branch_std_id_seq OWNED BY public.student_branch.std_id;


--
-- TOC entry 226 (class 1259 OID 16492)
-- Name: student_std_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_std_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_std_id_seq OWNER TO postgres;

--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 226
-- Name: student_std_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_std_id_seq OWNED BY public.student.std_id;


--
-- TOC entry 217 (class 1259 OID 16428)
-- Name: university_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.university_info (
    uni_id integer NOT NULL,
    uni_code character varying,
    uni_name character varying NOT NULL,
    address character varying,
    phone_no character varying,
    inst_date date,
    website character varying
);


ALTER TABLE public.university_info OWNER TO postgres;

--
-- TOC entry 4773 (class 2604 OID 16481)
-- Name: branch branch_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch ALTER COLUMN branch_id SET DEFAULT nextval('public.branch_branch_id_seq'::regclass);


--
-- TOC entry 4774 (class 2604 OID 16535)
-- Name: branch deparment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch ALTER COLUMN deparment_id SET DEFAULT nextval('public.branch_deparment_id_seq'::regclass);


--
-- TOC entry 4770 (class 2604 OID 16450)
-- Name: college college_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.college ALTER COLUMN college_id SET DEFAULT nextval('public.college_college_id_seq'::regclass);


--
-- TOC entry 4771 (class 2604 OID 16465)
-- Name: deparments deparment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deparments ALTER COLUMN deparment_id SET DEFAULT nextval('public.deparments_deparment_id_seq'::regclass);


--
-- TOC entry 4772 (class 2604 OID 16466)
-- Name: deparments college_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deparments ALTER COLUMN college_id SET DEFAULT nextval('public.deparments_college_id_seq'::regclass);


--
-- TOC entry 4775 (class 2604 OID 16497)
-- Name: student std_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN std_id SET DEFAULT nextval('public.student_std_id_seq'::regclass);


--
-- TOC entry 4776 (class 2604 OID 16498)
-- Name: student branch_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN branch_id SET DEFAULT nextval('public.student_branch_id_seq'::regclass);


--
-- TOC entry 4777 (class 2604 OID 16513)
-- Name: student_branch std_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_branch ALTER COLUMN std_id SET DEFAULT nextval('public.student_branch_std_id_seq'::regclass);


--
-- TOC entry 4778 (class 2604 OID 16514)
-- Name: student_branch branch_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_branch ALTER COLUMN branch_id SET DEFAULT nextval('public.student_branch_branch_id_seq'::regclass);


--
-- TOC entry 4951 (class 0 OID 16478)
-- Dependencies: 225
-- Data for Name: branch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.branch (branch_id, deparment_id, name, total_seat, seat_filled, branch_head) FROM stdin;
1	4	Thermal Engineering	60	58	Dr. S. V. Deshmukh
2	4	Design Engineering	60	55	Dr. A. R. Wankhede
3	4	Production Engineering	60	52	Dr. M. B. Daigawane
4	4	Automobile Engineering	60	59	Dr. N. M. Borkar
5	4	Industrial Engineering	60	50	Dr. Rekha Nair
6	4	Mechatronics	60	53	Dr. Neha Shinde
7	4	Robotics and Automation	60	56	Dr. Ajay Jadhav
8	4	CAD/CAM	60	54	Dr. Lata More
9	4	Energy Systems	60	51	Dr. P. S. Kale
10	4	Advanced Manufacturing	60	57	Dr. K. G. Joshi
\.


--
-- TOC entry 4945 (class 0 OID 16447)
-- Dependencies: 219
-- Data for Name: college; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.college (college_id, university_id, name, founded_year, num_departments, dean) FROM stdin;
1	1	Government College of Engineering, Nagpur	1960	12	Dr. S. V. Deshmukh
2	1	Shri Ramdeobaba College of Engineering and Management	1984	14	Dr. R. S. Pande
3	1	G. H. Raisoni College of Engineering	1996	16	Dr. Preeti Bajaj
4	1	St. Francis De Sales College	1956	10	Dr. A. K. Sharma
5	1	Dr. Ambedkar College, Nagpur	1964	11	Dr. Meena Joshi
6	1	Anjuman College of Engineering and Technology	1999	9	Dr. M. A. Khan
7	1	Dhanwate National College	1935	8	Dr. Rekha Nair
8	1	Smt. Radhadevi Goenka College for Women	1989	7	Dr. Lata More
9	1	Central India College of Law	2006	6	Dr. Ajay Jadhav
10	1	JD College of Engineering and Management	2008	13	Dr. Neha Shinde
\.


--
-- TOC entry 4948 (class 0 OID 16462)
-- Dependencies: 222
-- Data for Name: deparments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deparments (deparment_id, college_id, name, establish_year, hod_name, no_of_faculties) FROM stdin;
1	1	Computer Science and Engineering	2016	Dr. A. R. Wankhede	10
2	1	Electronics and Telecommunication Engineering	2016	Dr. S. V. Deshmukh	9
3	1	Electrical Engineering	2016	Dr. R. P. Borkar	8
4	1	Mechanical Engineering	2016	Dr. M. B. Daigawane	11
5	1	Civil Engineering	2016	Dr. N. M. Borkar	10
6	1	Applied Sciences and Humanities	2016	Dr. Meenal Kulkarni	7
7	1	Information Technology	2017	Dr. Rekha Nair	6
8	1	Artificial Intelligence and Data Science	2020	Dr. Neha Shinde	5
9	1	Environmental Engineering	2018	Dr. Ajay Jadhav	4
10	1	Instrumentation Engineering	2019	Dr. Lata More	6
\.


--
-- TOC entry 4954 (class 0 OID 16494)
-- Dependencies: 228
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (std_id, branch_id, first_name, last_name, dob, gpa, percentage, email_id, enrollment_date) FROM stdin;
11	4	Aarav	Deshmukh	2004-06-15	8	78.5	aarav.deshmukh@gcoen.ac.in	2022-08-01
12	4	Sneha	Patil	2003-11-22	9	84.2	sneha.patil@gcoen.ac.in	2022-08-01
13	4	Rohan	Joshi	2004-01-10	7	72	rohan.joshi@gcoen.ac.in	2022-08-01
14	4	Isha	Kulkarni	2003-09-05	8	79.3	isha.kulkarni@gcoen.ac.in	2022-08-01
15	4	Yash	Shinde	2004-03-18	6	65.7	yash.shinde@gcoen.ac.in	2022-08-01
16	4	Pooja	More	2003-12-30	9	88.1	pooja.more@gcoen.ac.in	2022-08-01
17	4	Kunal	Borkar	2004-05-25	7	71.4	kunal.borkar@gcoen.ac.in	2022-08-01
18	4	Neha	Jadhav	2003-07-14	8	80	neha.jadhav@gcoen.ac.in	2022-08-01
19	4	Siddharth	Naik	2004-02-08	7	74.6	siddharth.naik@gcoen.ac.in	2022-08-01
20	4	Ritika	Sawant	2003-10-19	8	82.3	ritika.sawant@gcoen.ac.in	2022-08-01
\.


--
-- TOC entry 4957 (class 0 OID 16510)
-- Dependencies: 231
-- Data for Name: student_branch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student_branch (std_id, branch_id, enrolled_on, grade, total_fees, paid_fees) FROM stdin;
11	4	2022-08-01	A	116336	116336
12	4	2022-08-01	A+	116336	116336
13	4	2022-08-01	B+	116336	110000
14	4	2022-08-01	A	116336	116336
15	4	2022-08-01	B	116336	100000
16	4	2022-08-01	A+	116336	116336
17	4	2022-08-01	B+	116336	105000
18	4	2022-08-01	A	116336	116336
19	4	2022-08-01	B	116336	98000
20	4	2022-08-01	A	116336	116336
\.


--
-- TOC entry 4943 (class 0 OID 16428)
-- Dependencies: 217
-- Data for Name: university_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.university_info (uni_id, uni_code, uni_name, address, phone_no, inst_date, website) FROM stdin;
1	RTMNU001	Rashtrasant Tukadoji Maharaj Nagpur University	Amravati Road,Nagpur,Maharashtra,India	7122533452	1923-08-01	https://www.nagpuruniversity.ac.in
2	MU002	University of Mumbai	Mumbai,Maharashtra, India	2222652819	1857-07-18	https://mu.ac.in
3	SPPU003	Savitribai Phule Pune University	Pune, Maharashtra, India	2025601333	1949-02-10	http://www.unipune.ac.in
4	BAMU004	Dr. Babasaheb Ambedkar Marathwada University	Aurangabad, Maharashtra, India	2402403399	1958-08-23	https://www.bamu.ac.in
5	NMU005	Kavayitri Bahinabai Chaudhari North Maharashtra University	Jalgaon, Maharashtra, India	2572258403	1990-08-15	https://nmu.ac.in
6	SGBAU006	Sant Gadge Baba Amravati University	Amravati, Maharashtra, India	7212662358	1983-05-01	https://www.sgbau.ac.in
7	SU007	Shivaji University	Kolhapur, Maharashtra, India	2312609000	1962-11-18	https://www.unishivaji.ac.in
8	SNDT008	SNDT Women’s University	Mumbai, Maharashtra, India	2222001789	1916-07-05	https://sndt.ac.in
9	MUHS009	Maharashtra University of Health Sciences	Nashik, Maharashtra, India	2532539111	1998-06-10	https://www.muhs.ac.in
10	YCMOU010	Yashwantrao Chavan Maharashtra Open University	Nashik, Maharashtra, India	2532231714	1989-07-01	https://ycmou.ac.in
\.


--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 223
-- Name: branch_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.branch_branch_id_seq', 10, true);


--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 224
-- Name: branch_deparment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.branch_deparment_id_seq', 1, false);


--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 218
-- Name: college_college_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.college_college_id_seq', 10, true);


--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 221
-- Name: deparments_college_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deparments_college_id_seq', 1, false);


--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 220
-- Name: deparments_deparment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deparments_deparment_id_seq', 10, true);


--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 230
-- Name: student_branch_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_branch_branch_id_seq', 10, true);


--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 227
-- Name: student_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_branch_id_seq', 1, false);


--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 229
-- Name: student_branch_std_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_branch_std_id_seq', 10, true);


--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 226
-- Name: student_std_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_std_id_seq', 20, true);


--
-- TOC entry 4789 (class 2606 OID 16486)
-- Name: branch branch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_pkey PRIMARY KEY (branch_id);


--
-- TOC entry 4785 (class 2606 OID 16454)
-- Name: college college_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.college
    ADD CONSTRAINT college_pkey PRIMARY KEY (college_id);


--
-- TOC entry 4787 (class 2606 OID 16470)
-- Name: deparments deparments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deparments
    ADD CONSTRAINT deparments_pkey PRIMARY KEY (deparment_id);


--
-- TOC entry 4791 (class 2606 OID 16502)
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (std_id);


--
-- TOC entry 4781 (class 2606 OID 16434)
-- Name: university_info university_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_info
    ADD CONSTRAINT university_info_pkey PRIMARY KEY (uni_id);


--
-- TOC entry 4783 (class 2606 OID 16436)
-- Name: university_info university_info_uni_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.university_info
    ADD CONSTRAINT university_info_uni_code_key UNIQUE (uni_code);


--
-- TOC entry 4794 (class 2606 OID 16536)
-- Name: branch branch_deparment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_deparment_id_fkey FOREIGN KEY (deparment_id) REFERENCES public.deparments(deparment_id);


--
-- TOC entry 4792 (class 2606 OID 16455)
-- Name: college college_university_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.college
    ADD CONSTRAINT college_university_id_fkey FOREIGN KEY (university_id) REFERENCES public.university_info(uni_id);


--
-- TOC entry 4793 (class 2606 OID 16471)
-- Name: deparments deparments_college_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deparments
    ADD CONSTRAINT deparments_college_id_fkey FOREIGN KEY (college_id) REFERENCES public.college(college_id);


--
-- TOC entry 4796 (class 2606 OID 16523)
-- Name: student_branch student_branch_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_branch
    ADD CONSTRAINT student_branch_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(branch_id);


--
-- TOC entry 4795 (class 2606 OID 16503)
-- Name: student student_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branch(branch_id);


--
-- TOC entry 4797 (class 2606 OID 16518)
-- Name: student_branch student_branch_std_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_branch
    ADD CONSTRAINT student_branch_std_id_fkey FOREIGN KEY (std_id) REFERENCES public.student(std_id);


-- Completed on 2025-07-02 13:56:02

--
-- PostgreSQL database dump complete
--

