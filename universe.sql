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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(100),
    age_in_millions_of_years numeric,
    distance_from_earth integer NOT NULL,
    has_life boolean DEFAULT false NOT NULL
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
    name character varying(100) NOT NULL,
    moon_type character varying(100),
    planet_id integer NOT NULL,
    age_in_millions_of_years numeric,
    is_spherical boolean DEFAULT true NOT NULL
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
    name character varying(100) NOT NULL,
    planet_type character varying(100),
    star_id integer NOT NULL,
    distance_from_star integer NOT NULL,
    has_life boolean DEFAULT false NOT NULL
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
    name character varying(100) NOT NULL,
    star_type character varying(100),
    galaxy_id integer NOT NULL,
    age_in_millions_of_years numeric,
    is_spherical boolean DEFAULT true NOT NULL
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
-- Name: universe_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universe_info (
    universe_info_id integer NOT NULL,
    name character varying(100) NOT NULL,
    number_of_galaxies integer NOT NULL,
    age_in_billions_of_years numeric NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.universe_info OWNER TO freecodecamp;

--
-- Name: universe_info_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universe_info_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_info_info_id_seq OWNER TO freecodecamp;

--
-- Name: universe_info_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universe_info_info_id_seq OWNED BY public.universe_info.universe_info_id;


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
-- Name: universe_info universe_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_info ALTER COLUMN universe_info_id SET DEFAULT nextval('public.universe_info_info_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, 0, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 2537000, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 2300, 3000000, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 4000, 23000000, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 11800, 29000000, false);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 2100, 21000000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (19, 'Moon', 'Terrestrial', 1, 4500, true);
INSERT INTO public.moon VALUES (20, 'Phobos', 'Terrestrial', 2, 4500, true);
INSERT INTO public.moon VALUES (21, 'Deimos', 'Terrestrial', 2, 4500, true);
INSERT INTO public.moon VALUES (22, 'Io', 'Volcanic', 3, 4500, true);
INSERT INTO public.moon VALUES (23, 'Europa', 'Icy', 3, 4500, true);
INSERT INTO public.moon VALUES (24, 'Ganymede', 'Icy', 3, 4500, true);
INSERT INTO public.moon VALUES (25, 'Callisto', 'Icy', 3, 4500, true);
INSERT INTO public.moon VALUES (26, 'Titan', 'Icy', 4, 4500, true);
INSERT INTO public.moon VALUES (27, 'Rhea', 'Icy', 4, 4500, true);
INSERT INTO public.moon VALUES (28, 'Iapetus', 'Icy', 4, 4500, true);
INSERT INTO public.moon VALUES (29, 'Proxima Centauri b I', 'Rocky', 5, 4500, true);
INSERT INTO public.moon VALUES (30, 'Alpha Centauri Bb I', 'Rocky', 6, 4500, true);
INSERT INTO public.moon VALUES (31, 'Alpha Centauri Bc I', 'Rocky', 7, 4500, true);
INSERT INTO public.moon VALUES (32, 'Betelgeuse b I', 'Rocky', 8, 4500, true);
INSERT INTO public.moon VALUES (33, 'Betelgeuse c I', 'Rocky', 9, 4500, true);
INSERT INTO public.moon VALUES (34, 'Rigel b I', 'Rocky', 10, 4500, true);
INSERT INTO public.moon VALUES (35, 'Rigel c I', 'Rocky', 11, 4500, true);
INSERT INTO public.moon VALUES (36, 'Rigel d I', 'Rocky', 12, 4500, true);
INSERT INTO public.moon VALUES (37, 'Missing', 'Icy', 9, 4000, false);
INSERT INTO public.moon VALUES (38, 'Lost', 'Icy', 9, 6000, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 1, 1, true);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 1, 1, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Gas Giant', 1, 5, false);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Gas Giant', 1, 10, false);
INSERT INTO public.planet VALUES (5, 'Proxima b', 'Terrestrial', 2, 0, true);
INSERT INTO public.planet VALUES (6, 'Alpha Centauri Bb', 'Terrestrial', 3, 0, true);
INSERT INTO public.planet VALUES (7, 'Alpha Centauri Bc', 'Terrestrial', 4, 0, true);
INSERT INTO public.planet VALUES (8, 'Betelgeuse b', 'Gas Giant', 5, 5, false);
INSERT INTO public.planet VALUES (9, 'Betelgeuse c', 'Gas Giant', 5, 10, false);
INSERT INTO public.planet VALUES (10, 'Rigel b', 'Gas Giant', 6, 5, false);
INSERT INTO public.planet VALUES (11, 'Rigel c', 'Gas Giant', 6, 10, false);
INSERT INTO public.planet VALUES (12, 'Rigel d', 'Gas Giant', 6, 15, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-Type', 1, 4600, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'M-Type', 2, 4500, true);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 'G-Type', 2, 4600, true);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 'K-Type', 2, 4600, true);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'M-Type', 1, 8000, false);
INSERT INTO public.star VALUES (6, 'Rigel', 'B-Type', 1, 9000, false);


--
-- Data for Name: universe_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universe_info VALUES (3, 'The observable universe', 2, 13.8, 'prime universe');
INSERT INTO public.universe_info VALUES (1, 'zero', 52, 500, 'zero hour');
INSERT INTO public.universe_info VALUES (2, 'multiverse', 100, 1000, 'original');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 36, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: universe_info_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universe_info_info_id_seq', 3, true);


--
-- Name: galaxy age_in_millions_of_years; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT age_in_millions_of_years UNIQUE (age_in_millions_of_years);


--
-- Name: planet earth; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT earth UNIQUE (name);


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
-- Name: universe_info number_of_galaxies; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_info
    ADD CONSTRAINT number_of_galaxies UNIQUE (number_of_galaxies);


--
-- Name: moon phobos; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT phobos UNIQUE (name);


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
-- Name: star sun; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT sun UNIQUE (name);


--
-- Name: universe_info universe_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe_info
    ADD CONSTRAINT universe_info_pkey PRIMARY KEY (universe_info_id);


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

