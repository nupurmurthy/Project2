-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/XDk28L
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Country" (
    "country_code" char(2)   NOT NULL,
    "country_en" char(50)   NOT NULL,
    "country_de" char(50)   NOT NULL,
    "continent" char(20)   NOT NULL,
    "capital" char(30)   NOT NULL,
    "population" integer   NOT NULL,
    "area" integer   NOT NULL,
    "coastline" integer   NOT NULL,
    "government_form" char(90)   NOT NULL,
    "currency" char(40)   NOT NULL,
    "currency_code" char(3)   NOT NULL,
    "dialing_prefix" char(12)   NOT NULL,
    "birthrate" numeric(2,1)   NOT NULL,
    "deathrate" numeric(2,1)   NOT NULL,
    "url" char(100)   NOT NULL,
    CONSTRAINT "pk_Country" PRIMARY KEY (
        "country_code"
     )
);

CREATE TABLE "City" (
    "city_en" char(30)   NOT NULL,
    "country_code" char(2)   NOT NULL,
    "city_de" char(30)   NOT NULL,
    "country_en" char(50)   NOT NULL,
    "country_de" char(50)   NOT NULL,
    "population" integer   NOT NULL,
    "latitude" numeric(3,6)   NOT NULL,
    "longitude" numeric(3,6)   NOT NULL,
    "region" char(40)   NOT NULL,
    CONSTRAINT "pk_City" PRIMARY KEY (
        "city_en","country_code"
     )
);

ALTER TABLE "City" ADD CONSTRAINT "fk_City_country_code" FOREIGN KEY("country_code")
REFERENCES "Country" ("country_code");

