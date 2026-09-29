

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


CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_types character varying(50) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;


CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;


ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;



CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;


CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;


ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;



CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    distance_from_earth numeric NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;


CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;


ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;



CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;


CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;


ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;



CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;


CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;


ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;



ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);



ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);



ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);




ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);




ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);




INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13600, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 2.5);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12000, 3.0);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Elliptical', 13000, 29);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 400, 23);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 13200, 53);




INSERT INTO public.moon VALUES (1, 'Moon', 3, true, 4500);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, 1000);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, 1000);
INSERT INTO public.moon VALUES (4, 'Io', 5, true, 4500);
INSERT INTO public.moon VALUES (5, 'Europa', 5, true, 4500);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, true, 4500);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, true, 4500);
INSERT INTO public.moon VALUES (8, 'Titan', 6, true, 4500);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, true, 4500);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, false, 4500);
INSERT INTO public.moon VALUES (11, 'Rhea', 6, true, 4500);
INSERT INTO public.moon VALUES (12, 'Dione', 6, true, 4500);
INSERT INTO public.moon VALUES (13, 'Tethys', 6, true, 4500);
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, true, 4500);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, false, 4500);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, true, 4500);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, true, 4500);
INSERT INTO public.moon VALUES (18, 'Titania', 7, true, 4500);
INSERT INTO public.moon VALUES (19, 'Oberon', 7, true, 4500);
INSERT INTO public.moon VALUES (20, 'Triton', 8, true, 4500);




INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, 0.6);
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, 0.3);
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, 0.0);
INSERT INTO public.planet VALUES (4, 'Mars', 1, false, 0.5);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, false, 4.2);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, false, 8.5);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, false, 18.2);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, false, 29.0);
INSERT INTO public.planet VALUES (9, 'Planet B', 2, false, 4.3);
INSERT INTO public.planet VALUES (10, 'Planet C', 3, false, 8.6);
INSERT INTO public.planet VALUES (11, 'Planet D', 4, false, 642.5);
INSERT INTO public.planet VALUES (12, 'Planet E', 5, false, 25.0);




INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'Rocky planets like Earth');
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'Large planets composed mostly of gases');
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'Planets made of heavier volatile elements');




INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, true);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 5000, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 240, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 10, true);
INSERT INTO public.star VALUES (5, 'Vega', 1, 455, true);
INSERT INTO public.star VALUES (6, 'Polaris', 1, 70, true);




SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);




SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);




SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);




SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 3, true);




SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);




ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);




ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);




ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);




ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);




ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);




ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);




ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);




ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);




ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);




ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);




ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);




ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);




ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);




-- actualizado
