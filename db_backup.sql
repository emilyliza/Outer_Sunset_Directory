--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: Favorites; Type: TABLE; Schema: public; Owner: emilyhittle; Tablespace: 
--

CREATE TABLE "Favorites" (
    id integer NOT NULL,
    "businessName" character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer,
    phone text,
    url text
);


ALTER TABLE "Favorites" OWNER TO emilyhittle;

--
-- Name: Favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: emilyhittle
--

CREATE SEQUENCE "Favorites_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Favorites_id_seq" OWNER TO emilyhittle;

--
-- Name: Favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emilyhittle
--

ALTER SEQUENCE "Favorites_id_seq" OWNED BY "Favorites".id;


--
-- Name: Reviews; Type: TABLE; Schema: public; Owner: emilyhittle; Tablespace: 
--

CREATE TABLE "Reviews" (
    id integer NOT NULL,
    "businessName" character varying(255),
    rating character varying(255),
    review character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer
);


ALTER TABLE "Reviews" OWNER TO emilyhittle;

--
-- Name: Reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: emilyhittle
--

CREATE SEQUENCE "Reviews_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Reviews_id_seq" OWNER TO emilyhittle;

--
-- Name: Reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emilyhittle
--

ALTER SEQUENCE "Reviews_id_seq" OWNED BY "Reviews".id;


--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: emilyhittle; Tablespace: 
--

CREATE TABLE "SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE "SequelizeMeta" OWNER TO emilyhittle;

--
-- Name: Users; Type: TABLE; Schema: public; Owner: emilyhittle; Tablespace: 
--

CREATE TABLE "Users" (
    id integer NOT NULL,
    "firstName" character varying(255),
    email character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "passwordDigest" text
);


ALTER TABLE "Users" OWNER TO emilyhittle;

--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: emilyhittle
--

CREATE SEQUENCE "Users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Users_id_seq" OWNER TO emilyhittle;

--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: emilyhittle
--

ALTER SEQUENCE "Users_id_seq" OWNED BY "Users".id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emilyhittle
--

ALTER TABLE ONLY "Favorites" ALTER COLUMN id SET DEFAULT nextval('"Favorites_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emilyhittle
--

ALTER TABLE ONLY "Reviews" ALTER COLUMN id SET DEFAULT nextval('"Reviews_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: emilyhittle
--

ALTER TABLE ONLY "Users" ALTER COLUMN id SET DEFAULT nextval('"Users_id_seq"'::regclass);


--
-- Data for Name: Favorites; Type: TABLE DATA; Schema: public; Owner: emilyhittle
--

COPY "Favorites" (id, "businessName", "createdAt", "updatedAt", "userId", phone, url) FROM stdin;
\.


--
-- Name: Favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emilyhittle
--

SELECT pg_catalog.setval('"Favorites_id_seq"', 1, false);


--
-- Data for Name: Reviews; Type: TABLE DATA; Schema: public; Owner: emilyhittle
--

COPY "Reviews" (id, "businessName", rating, review, "createdAt", "updatedAt", "userId") FROM stdin;
\.


--
-- Name: Reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emilyhittle
--

SELECT pg_catalog.setval('"Reviews_id_seq"', 1, false);


--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: emilyhittle
--

COPY "SequelizeMeta" (name) FROM stdin;
20150412125426-create-user.js
20150412125650-create-review.js
20150412125822-create-favorite.js
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: emilyhittle
--

COPY "Users" (id, "firstName", email, "createdAt", "updatedAt", "passwordDigest") FROM stdin;
1	\N	emilyliza@gmail.com	2015-04-12 14:18:05.054-07	2015-04-12 14:18:05.054-07	$2a$10$4Trng0Z6Jp.LXfgNnAthhuWQdmSjReIbTe0uJGYXxwLj8eohibCGG
2	\N	sam@gmail.com	2015-04-12 14:44:07.153-07	2015-04-12 14:44:07.153-07	$2a$10$WG.cneohtSqFjn8PznHPLuJCjc.jYr4Y5QJSl79sWOHybcQ24BAJa
3	\N	linda@gmail.com	2015-04-12 14:46:42.572-07	2015-04-12 14:46:42.572-07	$2a$10$WG.cneohtSqFjn8PznHPLu5yXp9ixl.ux0xL8NiFuBxEPABesep6.
4	\N	george@gmail.com	2015-04-12 14:50:32.057-07	2015-04-12 14:50:32.057-07	$2a$10$mu7ZqFG3sYQ39DTLBsCjc.kHVAwGKlmw3haikGn0HJadeTscZDG2.
5	\N	george1@gmail.com	2015-04-12 14:51:28.673-07	2015-04-12 14:51:28.673-07	$2a$10$yZk4ekWZG0EBLphWhikWaeGtXcRa8kwDKhmCK4JzOqJ0FYovpAYNK
6	\N	george2@gmail.com	2015-04-12 14:56:06.457-07	2015-04-12 14:56:06.457-07	$2a$10$eDQiLa3luhPk0wji1IiIMOFArr..5SDrXmD.JoN4oBorVASac9qtG
7	\N	george2@gmail.com	2015-04-12 15:04:36.592-07	2015-04-12 15:04:36.592-07	$2a$10$fvVkSOSkgbn9DRE83G7tSu3qJjJhbASXEieQjk84yzcY6KXf5iyN.
8	\N	katie@gmail.com	2015-04-12 15:23:58.003-07	2015-04-12 15:23:58.003-07	$2a$10$yFLQkPn8q2fTRjs9BpxhmO.pfiRtQ5oW8V9DCYe20GVfnRyLXoI1a
9	\N	tina@yahoo.com	2015-04-12 15:43:16.28-07	2015-04-12 15:43:16.279-07	$2a$10$E6BvpSaDVaErenuDQvVd7OhuxHzSgvzbzbfN4fxomcKfQI/8e5Pe.
10	\N	did@gmail.com	2015-04-12 15:44:57.531-07	2015-04-12 15:44:57.531-07	$2a$10$K2AUh18TsART3bcy8f/XSOVHcestb7j.QOdSp8bvR18NNoMPsVsLy
11	\N	dog@gmail.com	2015-04-12 16:05:20.119-07	2015-04-12 16:05:20.119-07	$2a$10$IwVXMV515630M/Au8GDoaOAsHnr3XWiQ80TIOl1TbpzBlYGocn7ym
12	\N	fred@sbcglobal.net	2015-04-13 10:25:54.208-07	2015-04-13 10:25:54.208-07	$2a$10$Pvp4JTyOg.yn7femXqHgkO/fqE14z6utmkqPMMTpZ7Ix5.BmoNWEW
13	\N	many@some.com	2015-04-13 10:28:09.016-07	2015-04-13 10:28:09.016-07	$2a$10$cl749.27G4GbuInN5X6ikO20bQeU05dnRsq6/rV0Yb7CxtFVUSEDu
14	\N	tim@email.com	2015-04-13 10:34:07.988-07	2015-04-13 10:34:07.988-07	$2a$10$0cBbOu79CKi20iz4E9qZSOkru6WQJS/HKO.nH7uvk4T2Vj9z.x4oC
15	\N	tom@email.com	2015-04-13 10:34:50.559-07	2015-04-13 10:34:50.559-07	$2a$10$./2bCRY/TbXMzwYizrEyRuUDbgkSidN3HtfsmH3PRD9DYiTB0mZU.
16	\N	somany@gmail.com	2015-04-13 13:59:29.937-07	2015-04-13 13:59:29.937-07	$2a$10$eBUc3SrgRFxjBC1qivUUweaiFrdvgZnkUEpwSn52qzw65bcA7RClS
\.


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: emilyhittle
--

SELECT pg_catalog.setval('"Users_id_seq"', 16, true);


--
-- Name: Favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: emilyhittle; Tablespace: 
--

ALTER TABLE ONLY "Favorites"
    ADD CONSTRAINT "Favorites_pkey" PRIMARY KEY (id);


--
-- Name: Reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: emilyhittle; Tablespace: 
--

ALTER TABLE ONLY "Reviews"
    ADD CONSTRAINT "Reviews_pkey" PRIMARY KEY (id);


--
-- Name: SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: emilyhittle; Tablespace: 
--

ALTER TABLE ONLY "SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: Users_pkey; Type: CONSTRAINT; Schema: public; Owner: emilyhittle; Tablespace: 
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: emilyhittle
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM emilyhittle;
GRANT ALL ON SCHEMA public TO emilyhittle;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

