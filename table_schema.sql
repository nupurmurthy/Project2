Create table countries_transformed (
Country_name varchar(50),
Country_code char(2) Primary Key,
Continent varchar(20),
Capital varchar(30),
Country_population int,
Area int,
Coastline int,
Government varchar(90),
Currency varchar(40),
Birthrate float(3),
Deathrate float(3)
);
select * from countries_transformed
------------------------------------------------------------------
Create table megacities_transformed (
city_name varchar(30),
country_code char(2),
Foreign Key (country_code) REFERENCES countries_transformed(country_code),
city_population int,
latitude float(10),
longitude float(10),
region varchar(40)
);
select * from megacities_transformed
---------------------------------------------------------------------------------
--All the cities in China--
Select city_name
from megacities_transformed m, countries_transformed c
where c.country_code='CN' and c.country_code = m.country_code

--All the cities with a population greater than 4,000,000 people in ascending order--
Select Distinct city_population, country_name, city_name
from countries_transformed c, megacities_transformed m
where city_population < 4000000 and c.country_code = m.country_code
order by city_population ASC

--All the cities in Asia--
Select city_name, country_name
from megacities_transformed m, countries_transformed c
where continent='Asia' and m.country_code = c.country_code

--Most populous city in each country--
Select m.country_code, city_name, city_population
FROM megacities_transformed m, countries_transformed c
Where city_name LIKE 'C%' and city_population > 2000000
group by m.country_code, city_name, city_population
order by city_population DESC

--Cities in the South-eastern hemisphere--
Select longitude, latitude, city_name, country_name 
From megacities_transformed, countries_transformed
Where latitude < 0 and longitude > 0 and megacities_transformed.country_code = countries_transformed.country_code
