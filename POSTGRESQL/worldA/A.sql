-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;
-- ROLLBACK;

CREATE TABLE IF NOT EXISTS public.city
(
    id integer NOT NULL,
    name text,
    countrycode character(3),
    district text,
    population integer,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.countrylanguage
(
    countrycode character(3) NOT NULL,
    language text,
    isofficial boolean,
    percentage real,
    PRIMARY KEY (countrycode)
);

CREATE TABLE IF NOT EXISTS public.country
(
    code character(3) NOT NULL,
    name text,
    continent text,
    region text,
    surfacearea real,
    indepyear smallint,
    population integer,
    lifeexpectancy real,
    gnp numeric(10, 2),
    gnpoid numeric(10, 2),
    localname text,
    governmentform text,
    headofstate text,
    capital integer,
    code2 character(2),
    PRIMARY KEY (code)
);

ALTER TABLE IF EXISTS public.city
    ADD FOREIGN KEY (countrycode)
    REFERENCES public.country (code) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.countrylanguage
    ADD FOREIGN KEY (countrycode)
    REFERENCES public.country (code) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;