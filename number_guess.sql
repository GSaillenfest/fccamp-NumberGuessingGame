--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_score integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (92, 'user_1720014310424', 1, 534);
INSERT INTO public.users VALUES (91, 'user_1720014310425', 1, 33);
INSERT INTO public.users VALUES (109, 'user_1720015132392', 1, 111);
INSERT INTO public.users VALUES (94, 'user_1720014430711', 1, 97);
INSERT INTO public.users VALUES (108, 'user_1720015132393', 1, 286);
INSERT INTO public.users VALUES (93, 'user_1720014430712', 1, 171);
INSERT INTO public.users VALUES (95, 'J', 1, 1);
INSERT INTO public.users VALUES (97, 'user_1720014897576', 1, 12);
INSERT INTO public.users VALUES (111, 'user_1720015301464', 1, 375);
INSERT INTO public.users VALUES (96, 'user_1720014897577', 1, 49);
INSERT INTO public.users VALUES (110, 'user_1720015301465', 1, 117);
INSERT INTO public.users VALUES (99, 'user_1720014905000', 1, 29);
INSERT INTO public.users VALUES (81, 'user_1720013511565', NULL, 5000);
INSERT INTO public.users VALUES (82, 'user_1720013511564', NULL, 5000);
INSERT INTO public.users VALUES (83, 'user_1720013662489', NULL, 5000);
INSERT INTO public.users VALUES (84, 'user_1720013662488', NULL, 5000);
INSERT INTO public.users VALUES (98, 'user_1720014905001', 1, 396);
INSERT INTO public.users VALUES (86, '', NULL, 5000);
INSERT INTO public.users VALUES (87, 'user_1720013698062', NULL, 5000);
INSERT INTO public.users VALUES (88, 'user_1720013698061', NULL, 5000);
INSERT INTO public.users VALUES (80, 'Bob', 1, 9);
INSERT INTO public.users VALUES (90, 'user_1720014278546', 1, 732);
INSERT INTO public.users VALUES (101, 'user_1720014926453', 1, 4);
INSERT INTO public.users VALUES (89, 'user_1720014278547', 1, 6);
INSERT INTO public.users VALUES (100, 'user_1720014926454', 1, 505);
INSERT INTO public.users VALUES (103, 'user_1720014933935', 1, 248);
INSERT INTO public.users VALUES (102, 'user_1720014933936', 1, 328);
INSERT INTO public.users VALUES (105, 'user_1720014982265', 1, 608);
INSERT INTO public.users VALUES (104, 'user_1720014982266', 1, 86);
INSERT INTO public.users VALUES (107, 'user_1720015032120', 1, 222);
INSERT INTO public.users VALUES (106, 'user_1720015032121', 1, 275);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 111, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

