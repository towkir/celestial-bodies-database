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
    name character varying(20) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    size numeric(20,2)
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
    name character varying(20) NOT NULL,
    description text,
    radius integer,
    planet_id integer
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
    name character varying(20) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth numeric,
    radius integer,
    star_id integer
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
-- Name: space_station; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_station (
    space_station_id integer NOT NULL,
    name character varying(40) NOT NULL,
    is_functional boolean
);


ALTER TABLE public.space_station OWNER TO freecodecamp;

--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_station_space_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_station_space_station_id_seq OWNER TO freecodecamp;

--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_station_space_station_id_seq OWNED BY public.space_station.space_station_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    galaxy_id integer,
    luminosity integer
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
-- Name: space_station space_station_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station ALTER COLUMN space_station_id SET DEFAULT nextval('public.space_station_space_station_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Also known as Messier 31, a sprial galaxy that is the brightest external galaxy you can see', 2480000, 110000.00);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'A spiral galaxy which we live in, appearing as a milky band of light in the sky', 25800, 52850.00);
INSERT INTO public.galaxy VALUES (3, 'Cygnus A', 'An elliptical galaxy with billions of stars in its featurless oval, the dark streaks in the visable image are bands of dust blocking the starlight', 500000000, 540000.00);
INSERT INTO public.galaxy VALUES (4, 'Canis Major Dwarf', 'A dwarf galaxy closest to the milky way found to date, that is roughly elliptical in shape', 42000, 25000.00);
INSERT INTO public.galaxy VALUES (5, 'Magellanic Clouds', 'Irregular galaxies that share a gaseous envelope and lie about 22 degrees apart in the sky near teh south celestial pole', 158200, 7000.00);
INSERT INTO public.galaxy VALUES (6, 'Virgo A', 'An elliptical galaxy with over 700 galaxies appearing in the cluster including the milky way', 55000000, 7500000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', '', 1079, 2);
INSERT INTO public.moon VALUES (2, 'Europa', '', 969, 4);
INSERT INTO public.moon VALUES (3, 'Io', '', 1131, 4);
INSERT INTO public.moon VALUES (4, 'Titan', '', 1599, 5);
INSERT INTO public.moon VALUES (5, 'Ganymede', '', 1636, 4);
INSERT INTO public.moon VALUES (6, 'Callisto', '', 1497, 4);
INSERT INTO public.moon VALUES (7, 'Amalthea', '', 51, 4);
INSERT INTO public.moon VALUES (8, 'Adrastea', '', 5, 4);
INSERT INTO public.moon VALUES (9, 'Himalia', '', 52, 4);
INSERT INTO public.moon VALUES (10, 'Ananke', '', 8, 4);
INSERT INTO public.moon VALUES (11, 'Elara', '', 26, 4);
INSERT INTO public.moon VALUES (12, 'Carme', '', 14, 4);
INSERT INTO public.moon VALUES (13, 'Carpo', '', 0, 4);
INSERT INTO public.moon VALUES (14, 'Herse', '', 0, 4);
INSERT INTO public.moon VALUES (15, 'Thebe', '', 30, 4);
INSERT INTO public.moon VALUES (16, 'Aitne', '', 1, 4);
INSERT INTO public.moon VALUES (17, 'Kalyke', '', 1, 4);
INSERT INTO public.moon VALUES (18, 'Arche', '', 0, 4);
INSERT INTO public.moon VALUES (19, 'Dione', '', 348, 5);
INSERT INTO public.moon VALUES (20, 'Sponde', '', 1, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Pluto', '', false, true, 5325, 1151, 1);
INSERT INTO public.planet VALUES (2, 'Earth', '', true, true, 0, 6371, 2);
INSERT INTO public.planet VALUES (3, 'Mars', '', false, true, 140, 3389, 3);
INSERT INTO public.planet VALUES (4, 'Jupiter', '', false, true, 140, 3389, 4);
INSERT INTO public.planet VALUES (5, 'Saturn', '', false, true, 140, 3389, 5);
INSERT INTO public.planet VALUES (6, 'Uranus', '', false, true, 140, 3389, 6);
INSERT INTO public.planet VALUES (7, 'Neptune', '', false, true, 140, 3389, 1);
INSERT INTO public.planet VALUES (8, 'Charon', '', false, true, 140, 3389, 2);
INSERT INTO public.planet VALUES (9, '2003 UB313', '', false, true, 140, 3389, 3);
INSERT INTO public.planet VALUES (10, 'Ceres', '', false, true, 140, 3389, 4);
INSERT INTO public.planet VALUES (11, 'Mercury', '', false, true, 140, 3389, 5);
INSERT INTO public.planet VALUES (12, 'Venus', '', false, true, 140, 3389, 6);


--
-- Data for Name: space_station; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_station VALUES (1, 'International Space Station', true);
INSERT INTO public.space_station VALUES (2, 'Tiangong Space Station', true);
INSERT INTO public.space_station VALUES (3, 'Skylab Space Station', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'UY Scuti', '', 1, NULL);
INSERT INTO public.star VALUES (2, 'V766 Centauri Aa', '', 2, NULL);
INSERT INTO public.star VALUES (3, 'KY Cygni', '', 3, NULL);
INSERT INTO public.star VALUES (4, 'AH Scorpii', '', 4, NULL);
INSERT INTO public.star VALUES (5, 'W Cephei', '', 5, NULL);
INSERT INTO public.star VALUES (6, 'Westerlund 1 W237', '', 6, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_station_space_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_station_space_station_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: space_station space_station_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_name_key UNIQUE (name);


--
-- Name: space_station space_station_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_pkey PRIMARY KEY (space_station_id);


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

