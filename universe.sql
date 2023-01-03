--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    light_years_from_earth numeric(11,2),
    colors text,
    stars_in_billions integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    planet_id integer NOT NULL,
    is_part_of_group boolean,
    group_name character varying(40),
    is_prograde boolean,
    is_retrograde boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    has_life boolean NOT NULL,
    star_id integer,
    is_dwarf boolean,
    light_years_from_earth numeric(20,10) NOT NULL,
    year_discovered integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    is_dwarf boolean NOT NULL,
    galaxy_id integer,
    is_giant boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Sagittarius A*', 1);
INSERT INTO public.black_hole VALUES (2, 'Manatee Nebula', 1);
INSERT INTO public.black_hole VALUES (3, 'M87*', 7);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 25800.00, 'white', 250);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2500000.00, 'yellow, blue', 1000);
INSERT INTO public.galaxy VALUES (3, 'Black Eye', 17000000.00, 'blue, pink', 100);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 31100000.00, 'Brilliant white', 100);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 21000000.00, 'red, blue', 1000);
INSERT INTO public.galaxy VALUES (6, 'Messier 82', 12000000.00, 'red, white', 30);
INSERT INTO public.galaxy VALUES (7, 'M87', 53490000.00, NULL, 1000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4, false, NULL, true, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 5, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 5, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Io', 6, true, 'Galilean', NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 6, true, 'Galilean', NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', 6, true, 'Galilean', NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', 6, true, 'Galilean', NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Amalthea', 6, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Himalia', 6, true, 'Himalia', true, false);
INSERT INTO public.moon VALUES (10, 'Elara', 6, true, 'Himalia', true, false);
INSERT INTO public.moon VALUES (11, 'Palsiphae', 6, true, 'Palsiphae', false, true);
INSERT INTO public.moon VALUES (12, 'Sinope', 6, true, 'Palsiphae', true, false);
INSERT INTO public.moon VALUES (13, '
Lysithea', 6, true, 'Himalia', true, false);
INSERT INTO public.moon VALUES (14, 'Carme', 6, true, 'Carme', false, true);
INSERT INTO public.moon VALUES (15, 'Ananke', 6, true, 'Ananke', false, true);
INSERT INTO public.moon VALUES (16, 'Leda', 6, true, 'Himalia', true, false);
INSERT INTO public.moon VALUES (17, 'Thebe', 6, true, 'Amalthea', NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Adrastea', 6, true, 'Amalthea', NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Metis', 6, true, 'Amalthea', NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Mimas', 7, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Enceladus', 7, false, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Tethys', 7, true, 'Sidera Lodoicea', NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (7, 'saturn', false, NULL, false, 0.0001500000, 1610);
INSERT INTO public.planet VALUES (8, 'uranus', false, NULL, false, 0.0003030000, 1781);
INSERT INTO public.planet VALUES (9, 'neptune', false, NULL, false, 0.0004768400, 1846);
INSERT INTO public.planet VALUES (10, 'pluto', false, NULL, true, 0.0006280000, 1930);
INSERT INTO public.planet VALUES (11, 'ceres', false, NULL, true, 0.0000342500, 1801);
INSERT INTO public.planet VALUES (12, 'makemake', false, NULL, true, 0.0008323000, 2005);
INSERT INTO public.planet VALUES (13, 'haumea', false, NULL, true, 0.0007970000, 2004);
INSERT INTO public.planet VALUES (14, 'eris', false, NULL, true, 0.0015120000, 2005);
INSERT INTO public.planet VALUES (2, 'mercury', false, NULL, false, 0.0000061239, 1631);
INSERT INTO public.planet VALUES (3, 'venus', false, NULL, false, 0.0024000000, 1610);
INSERT INTO public.planet VALUES (5, 'mars', false, NULL, false, 0.7500000000, 1610);
INSERT INTO public.planet VALUES (6, 'jupiter', false, NULL, false, 0.0000800000, 1610);
INSERT INTO public.planet VALUES (4, 'earth', true, NULL, false, 0.0000000000, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'a Centauri C', true, 1, false);
INSERT INTO public.star VALUES (2, 'a Centauri A', true, 1, false);
INSERT INTO public.star VALUES (3, 'a Centauri B', true, 1, false);
INSERT INTO public.star VALUES (4, 'Barnards Star', true, 1, false);
INSERT INTO public.star VALUES (5, 'Luhman 16A', true, 1, false);
INSERT INTO public.star VALUES (6, 'WISE 1855-0714', true, 1, false);
INSERT INTO public.star VALUES (7, 'Pistol Star', false, 1, true);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

