-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/FSvmCj
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "countries_transformed" (
    "country_name" VARCHAR(50)   NOT NULL,
    "country_code" CHAR(2)   NOT NULL,
    "continent" VARCHAR(20)   NOT NULL,
    "capital" VARCHAR(30)   NOT NULL,
    "country_population" INT   NOT NULL,
    "area" INT   NOT NULL,
    "coastline" INT   NOT NULL,
    "govrnment" VARCHAR(90)   NOT NULL,
    "currency" VARCHAR(40)   NOT NULL,
    "birthrate" FLOAT(3)   NOT NULL,
    "deathrate" FLOAT(3)   NOT NULL,
    CONSTRAINT "pk_countries_transformed" PRIMARY KEY (
        "country_code"
     )
);

CREATE TABLE "megacities_transformed" (
    "city_name" VARCHAR(30)   NOT NULL,
    "country_code" CHAR(2)   NOT NULL,
    "city_population" INT   NOT NULL,
    "latitude" FLOAT(10)   NOT NULL,
    "longitude" FLOAT(10)   NOT NULL,
    "region" VARCHAR(40)   NOT NULL
);

ALTER TABLE "megacities_transformed" ADD CONSTRAINT "fk_megacities_transformed_country_code" FOREIGN KEY("country_code")
REFERENCES "countries_transformed" ("country_code");

