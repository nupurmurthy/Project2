-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/XDk28L
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "countries_transformed" (
    "country_code" char(2)   NOT NULL,
    "country_name" varchar(50)   NOT NULL,
    "continent" varchar(20)   NOT NULL,
    "capital" varchar(30)   NOT NULL,
    "country_population" integer   NOT NULL,
    "area" integer   NOT NULL,
    "coastline" integer   NOT NULL,
    "government" varchar(90)   NOT NULL,
    "currency" varchar(40)   NOT NULL,
    "birthrate" float   NOT NULL,
    "deathrate" float   NOT NULL,
    CONSTRAINT "pk_countries_transformed" PRIMARY KEY (
        "country_code"
     )
);

CREATE TABLE "megacities_transformed" (
    "city_name" char(30)   NOT NULL,
    "country_code" char(2)   NOT NULL,
    "city_population" integer   NOT NULL,
    "longitude" float   NOT NULL,
    "latitude" float   NOT NULL,
    "region" varchar(40)   NOT NULL,
    CONSTRAINT "pk_megacities_transformed" PRIMARY KEY (
        "city_name","country_code"
     )
);

CREATE TABLE "merged" (
    "country_code" char(2)   NOT NULL,
    "continent" varchar(20)   NOT NULL,
    "capital" varchar(30)   NOT NULL,
    "country_population" integer   NOT NULL,
    "area" integer   NOT NULL,
    "coastline" integer   NOT NULL,
    "government" varchar(90)   NOT NULL,
    "currency" varchar(40)   NOT NULL,
    "birthrate" float   NOT NULL,
    "deathrate" float   NOT NULL,
    "city_name" char(30)   NOT NULL,
    "city_population" integer   NOT NULL,
    "latitude" float   NOT NULL,
    "longitude" float   NOT NULL,
    "region" varchar(40)   NOT NULL
);

ALTER TABLE "megacities_transformed" ADD CONSTRAINT "fk_megacities_transformed_country_code" FOREIGN KEY("country_code")
REFERENCES "countries_transformed" ("country_code");

ALTER TABLE "merged" ADD CONSTRAINT "fk_merged_country_code" FOREIGN KEY("country_code")
REFERENCES "countries_transformed" ("country_code");

ALTER TABLE "merged" ADD CONSTRAINT "fk_merged_city_name" FOREIGN KEY("city_name")
REFERENCES "megacities_transformed" ("city_name");

