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
    name character varying(30) NOT NULL,
    description text,
    origin_of_name text,
    diameter_in_ly integer
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
    name character varying(30) NOT NULL,
    planet character varying(30),
    distance_from_planet_in_km integer,
    orbital_period_in_days numeric(8,3),
    planet_id integer NOT NULL,
    is_spherical boolean
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
    name character varying(30) NOT NULL,
    diameter integer,
    density_in_kg_per_m3 integer,
    gravity numeric(3,1),
    length_of_day_in_hours numeric(5,1),
    distance_from_sun_in_million_kms numeric(5,1),
    orbital_period_in_days numeric(6,1),
    mean_temperature_in_celsius integer,
    number_of_moons integer,
    star_id integer,
    has_life boolean
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
-- Name: planetary_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planetary_system (
    planetary_system_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(255),
    number_of_planets integer,
    notes text
);


ALTER TABLE public.planetary_system OWNER TO freecodecamp;

--
-- Name: planetary_system_planetary_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planetary_system_planetary_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planetary_system_planetary_system_id_seq OWNER TO freecodecamp;

--
-- Name: planetary_system_planetary_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planetary_system_planetary_system_id_seq OWNED BY public.planetary_system.planetary_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    constellation character varying(20),
    system character varying(30),
    stellar_class character varying(10),
    distance_in_light_years numeric(10,7),
    mass_in_solar_mass numeric(5,3),
    galaxy_id integer
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
-- Name: planetary_system planetary_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_system ALTER COLUMN planetary_system_id SET DEFAULT nextval('public.planetary_system_planetary_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now. The two will eventually merge into a single new galaxy called Milkdromeda.', 'Andromeda, which is shortened from "Andromeda Galaxy", gets its name from the area of the sky in which it appears, the constellation of Andromeda.', 200000);
INSERT INTO public.galaxy VALUES (2, 'Condor Galaxy', 'The largest known spiral galaxy, it has a diameter of over 665,300 light-years (204.0 kiloparsecs). It is tidally disturbed by the smaller lenticular galaxy IC 4970.', 'Named after a condor, a type of vulture that is one of the largest flying birds.', 717000);
INSERT INTO public.galaxy VALUES (3, 'Cosmos Redshift 7', 'Galaxy Cosmos Redshift 7 is reported to be the brightest of distant galaxies (z > 6) and to contain some of the earliest first stars (first generation; Population III) that produced the chemical elements needed for the later formation of planets and life as we know it.', 'The name of this galaxy is based on a Redshift (z) measurement of nearly 7 (actually, z = 6.604).', NULL);
INSERT INTO public.galaxy VALUES (4, 'Eye of God', 'A prototype for multi-arm spiral galaxies', 'Name after its structural appearance', 200000);
INSERT INTO public.galaxy VALUES (5, 'Milky Way', 'The galaxy containing the Sun and its Solar System, and therefore Earth', 'The appearance from Earth of the galaxy—a band of light', 87400);
INSERT INTO public.galaxy VALUES (6, 'Peekaboo', 'Galaxy, relatively nearby, is considered one of the most metal-poor ("extremely metal-poor" (XMP)), least chemically enriched, and seemingly primordial, galaxies known.', 'Galaxy (akaHIPASS J1131-31) was hidden behind a relatively fast-moving foreground star (TYC 7215-199-1) and became observable when the star moved aside.', 1200);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Io', 'Jupiter', 421800, 1.800, 5, true);
INSERT INTO public.moon VALUES (2, 'Europa', 'Jupiter', 671100, 3.500, 5, true);
INSERT INTO public.moon VALUES (3, 'Ganymede', 'Jupiter', 1070400, 7.200, 5, true);
INSERT INTO public.moon VALUES (4, 'Callisto', 'Jupiter', 1882700, 16.700, 5, true);
INSERT INTO public.moon VALUES (5, 'Amalthea', 'Jupiter', 181400, 0.500, 5, true);
INSERT INTO public.moon VALUES (6, 'Himalia', 'Jupiter', 1141000, 250.600, 5, true);
INSERT INTO public.moon VALUES (7, 'Elara', 'Jupiter', 1174000, 259.300, 5, true);
INSERT INTO public.moon VALUES (8, 'Pasiphae', 'Jupiter', 2353000, 734.100, 5, true);
INSERT INTO public.moon VALUES (9, 'Sinope', 'Jupiter', 2360000, 758.500, 5, true);
INSERT INTO public.moon VALUES (10, 'Lysithea', 'Jupiter', 1172000, 259.100, 5, true);
INSERT INTO public.moon VALUES (11, 'Titan', 'Saturn', 1221870, 15.900, 6, true);
INSERT INTO public.moon VALUES (12, 'Rhea', 'Saturn', 527040, 4.600, 6, true);
INSERT INTO public.moon VALUES (13, 'Iapetus', 'Saturn', 3561300, 79.300, 6, true);
INSERT INTO public.moon VALUES (14, 'Dione', 'Saturn', 377400, 2.700, 6, true);
INSERT INTO public.moon VALUES (15, 'Tethys', 'Saturn', 294660, 1.900, 6, true);
INSERT INTO public.moon VALUES (16, 'Enceladus', 'Saturn', 238040, 1.400, 6, true);
INSERT INTO public.moon VALUES (17, 'Mimas', 'Saturn', 185520, 0.900, 6, true);
INSERT INTO public.moon VALUES (18, 'Hyperion', 'Saturn', 148100, 21.300, 6, true);
INSERT INTO public.moon VALUES (19, 'Phoebe', 'Saturn', 1271000, 550.300, 6, true);
INSERT INTO public.moon VALUES (20, 'Janus', 'Saturn', 151472, 0.700, 6, true);
INSERT INTO public.moon VALUES (21, 'Phobos', 'Mars', 9378, 0.300, 4, true);
INSERT INTO public.moon VALUES (22, 'Deimos', 'Mars', 23460, 1.300, 4, true);
INSERT INTO public.moon VALUES (23, 'Moon/Luna', 'Earth', 384400, 27.300, 3, true);
INSERT INTO public.moon VALUES (24, 'Triton', 'Neptune', 354800, 5.900, 7, true);
INSERT INTO public.moon VALUES (25, 'Nereid', 'Neptune', 1176470, 360.000, 7, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4879, 5429, 3.7, 4222.6, 57.9, 88.0, 167, 0, 6, false);
INSERT INTO public.planet VALUES (2, 'Venus', 12104, 5243, 8.9, 2802.0, 108.2, 224.7, 464, 0, 6, false);
INSERT INTO public.planet VALUES (3, 'Earth', 12756, 5514, 9.8, 24.0, 149.6, 365.2, 15, 1, 6, true);
INSERT INTO public.planet VALUES (4, 'Mars', 6792, 3934, 3.7, 24.7, 228.0, 687.0, -65, 2, 6, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 142984, 1326, 23.1, 9.9, 778.5, 4331.0, -110, 95, 6, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 120536, 687, 9.0, 10.7, 1432.0, 10747.0, -140, 146, 6, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 51118, 1270, 8.7, 17.2, 2867.0, 30589.0, -195, 28, 6, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 49528, 1638, 11.0, 16.1, 4515.0, 59800.0, -200, 16, 6, false);
INSERT INTO public.planet VALUES (9, 'Pluto', 2376, 1850, 0.7, 153.3, 5906.4, 90560.0, -225, 5, 6, false);
INSERT INTO public.planet VALUES (10, 'Barnard''s Star b', 12000, 5000, 8.0, 26.0, 1.2, 233.0, -70, 0, 1, false);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 12000, 5100, 8.8, 21.0, 0.0, 11.2, -40, 0, 3, false);
INSERT INTO public.planet VALUES (12, 'Alpha Centauri Bb', 15000, 4400, 9.5, 30.0, 0.0, 3.2, -50, 0, 3, false);
INSERT INTO public.planet VALUES (13, 'Alpha Centauri B b', 14000, 4300, 9.0, 25.0, 0.1, 3.2, -60, 0, 4, false);


--
-- Data for Name: planetary_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planetary_system VALUES (1, 6, 'Solar System', 8, 'Includes all the planets in our solar system.');
INSERT INTO public.planetary_system VALUES (2, 4, 'Alpha Centauri System', 4, 'Known to have several exoplanets.');
INSERT INTO public.planetary_system VALUES (3, 3, 'Proxima Centauri System', 2, 'Includes Proxima b and Proxima c.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Barnard''s Star ', 'Barnard''s Star ', 'Ophiuchus ', 'M4.0Ve ', 5.9629000, 0.144, 5);
INSERT INTO public.star VALUES (2, 'EZ Aquarii A ', 'EZ Aquarii ', 'Aquarius ', 'M5.0Ve ', 11.1090000, 0.110, 5);
INSERT INTO public.star VALUES (4, 'Rigil Kentaurus ', 'Centaurus ', 'Alpha Centauri ', 'G2V ', 4.3441000, 1.079, 5);
INSERT INTO public.star VALUES (5, 'Sirius A ', 'Alpha Canis Majoris ', 'Canis Major ', 'A1V ', 8.7094000, 2.063, 5);
INSERT INTO public.star VALUES (6, 'Sun ', NULL, 'Solar System ', 'G2V ', 0.0000158, 1.000, 5);
INSERT INTO public.star VALUES (7, 'Toliman ', 'Centaurus ', 'Alpha Centauri ', 'K1V ', 4.3441000, 0.909, 5);
INSERT INTO public.star VALUES (3, 'Proxima Centauri ', 'Centaurus ', 'Proxima Centauri', 'M5.5Ve ', 4.2465000, 0.122, 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: planetary_system_planetary_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planetary_system_planetary_system_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: planetary_system planetary_system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_system
    ADD CONSTRAINT planetary_system_name_key UNIQUE (name);


--
-- Name: planetary_system planetary_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_system
    ADD CONSTRAINT planetary_system_pkey PRIMARY KEY (planetary_system_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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
-- Name: planetary_system planetary_system_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planetary_system
    ADD CONSTRAINT planetary_system_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

