-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;
-- ROLLBACK;
DROP TABLE IF EXISTS public."Boarding_passes";
DROP TABLE IF EXISTS public."Seats";
DROP TABLE IF EXISTS public."Aircrafts";
DROP TABLE IF EXISTS public."Flights";
DROP TABLE IF EXISTS public."Ticket_flights";
DROP TABLE IF EXISTS public."Tickets";
DROP TABLE IF EXISTS public."Airports";
DROP TABLE IF EXISTS public."Bookings";

CREATE TABLE IF NOT EXISTS public."Bookings"
(
    book_ref character varying(50) NOT NULL,
    book_date date,
    total_amount integer,
    PRIMARY KEY (book_ref)
);

CREATE TABLE IF NOT EXISTS public."Airports"
(
    airport_code character varying(50) NOT NULL,
    airport_name character varying(50),
    city character varying(50),
    coordinates point,
    timezone time(5) with time zone,
    PRIMARY KEY (airport_code)
);

CREATE TABLE IF NOT EXISTS public."Tickets"
(
    ticket_no serial PRIMARY KEY,
    book_ref character varying(50),
    passenger_id integer,
    passenger_name character varying(50),
    contact_data character varying(50)
);

CREATE TABLE IF NOT EXISTS public."Ticket_flights"
(
    ticket_no integer NOT NULL,
    flight_id integer NOT NULL,
    fare_conditions character varying(50),
    amount bigint,
    PRIMARY KEY (ticket_no)
);

CREATE TABLE IF NOT EXISTS public."Flights"
(
    flight_id serial PRIMARY KEY,
    flight_no bigint,
    scheduled_departure timestamp with time zone,
    scheduled_arrival timestamp with time zone,
    departure_airport character varying(50) REFERENCES public."Airports" (airport_code),
    arrival_airport character varying(50) REFERENCES public."Airports" (airport_code),
    status character varying(50),
    aircraft_code character varying(50) REFERENCES public."Aircrafts" (aircraft_code),
    actual_departure timestamp with time zone,
    actual_arrival timestamp with time zone
);

CREATE TABLE IF NOT EXISTS public."Aircrafts"
(
    aircraft_code character varying(50) NOT NULL,
    model character varying(100),
    range numeric(20, 4),
    PRIMARY KEY (aircraft_code)
);

CREATE TABLE IF NOT EXISTS public."Seats"
(
    aircraft_code character varying(50) NOT NULL,
    seat_no character varying(50) NOT NULL,
    fare_conditions character varying(50),
    PRIMARY KEY (aircraft_code, seat_no)
);

CREATE TABLE IF NOT EXISTS public."Boarding_passes"
(
    ticket_no integer NOT NULL,
    flight_id integer NOT NULL,
    boarding_no character varying(20),
    seat_no character varying(50),
    PRIMARY KEY (ticket_no)
);

-- COMMIT;


-- ROLLBACK;

ALTER TABLE public."Tickets"
ADD CONSTRAINT fk_book_ref
FOREIGN KEY (book_ref)
REFERENCES public."Bookings" (book_ref);

ALTER TABLE public."Ticket_flights"
ADD CONSTRAINT fk_ticket_no
FOREIGN KEY (ticket_no)
REFERENCES public."Tickets" (ticket_no);

ALTER TABLE public."Boarding_passes"
ADD CONSTRAINT fk_ticket_no_boarding_passes
FOREIGN KEY (ticket_no)
REFERENCES public."Tickets" (ticket_no);

ALTER TABLE public."Ticket_flights"
ADD CONSTRAINT fk_flight_id
FOREIGN KEY (flight_id)
REFERENCES public."Flights" (flight_id);

ALTER TABLE public."Flights"
ADD CONSTRAINT fk_departure_airport
FOREIGN KEY (departure_airport)
REFERENCES public."Airports" (airport_code);

ALTER TABLE public."Flights"
ADD CONSTRAINT fk_arrival_airport
FOREIGN KEY (arrival_airport)
REFERENCES public."Airports" (airport_code);


END;