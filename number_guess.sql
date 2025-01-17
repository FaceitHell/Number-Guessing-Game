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
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer DEFAULT 0 NOT NULL
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

INSERT INTO public.users VALUES (2, 'user_1731391162081', 0, 0);
INSERT INTO public.users VALUES (3, 'user_1731391162080', 0, 0);
INSERT INTO public.users VALUES (4, 'Azizbek', 6, 0);
INSERT INTO public.users VALUES (6, 'user_1731393411918', 2, 903);
INSERT INTO public.users VALUES (5, 'user_1731393411919', 5, 852);
INSERT INTO public.users VALUES (8, 'user_1731393517895', 2, 97);
INSERT INTO public.users VALUES (7, 'user_1731393517896', 5, 195);
INSERT INTO public.users VALUES (10, 'user_1731393553708', 2, 737);
INSERT INTO public.users VALUES (9, 'user_1731393553709', 5, 550);
INSERT INTO public.users VALUES (11, '', 0, 0);
INSERT INTO public.users VALUES (12, '', 0, 0);
INSERT INTO public.users VALUES (13, '', 0, 0);
INSERT INTO public.users VALUES (14, '', 0, 0);
INSERT INTO public.users VALUES (15, '', 0, 0);
INSERT INTO public.users VALUES (16, '', 0, 0);
INSERT INTO public.users VALUES (17, '', 0, 0);
INSERT INTO public.users VALUES (18, '', 0, 0);
INSERT INTO public.users VALUES (19, '', 0, 0);
INSERT INTO public.users VALUES (20, '', 0, 0);
INSERT INTO public.users VALUES (21, '', 0, 0);
INSERT INTO public.users VALUES (22, '', 0, 0);
INSERT INTO public.users VALUES (23, '', 0, 0);
INSERT INTO public.users VALUES (24, '', 0, 0);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 24, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

