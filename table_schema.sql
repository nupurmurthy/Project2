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

Create table merged (
Country_name varchar(50),
Country_code char(2),
Continent varchar(20),
Capital varchar(100),
Country_population int,
Area int,
Coastline int,
Government varchar(90),
Currency varchar(40),
Birthrate float(3),
Deathrate float(3),
city_name varchar(30),
city_population int,
latitude float(10),
longitude float(10),
region varchar(40)
);

select * from merged

--List all the cities in China--
Select city_name
from megacities_transformed , countries_transformed
where countries_transformed.country_code='CN'

--All the cities with 
Select city_population, country_name, city_name
from countries_transformed c, megacities_transformed m
where city_population < 4000000 and c.country_code = m.country_code
order by city_population ASC
select * from countries_transformed where country_code = 'LR'
select * from megacities_transformed where country_code = 'LR'

Select max(city_population), megacities_transformed.country_code, city_name
from megacities_transformed m, countries_transformed
group by city_name, megacities_transformed.country_code

Select megacities_transformed.country_code, city_name, city_population
FROM megacities_transformed, countries_transformed
Where city_name LIKE 'C%' and city_population > 2000000
group by megacities_transformed.country_code, city_name, city_population
order by city_population DESC

Select longitude, latitude, city_name, country_name 
From megacities_transformed, countries_transformed
Where latitude < 0 and longitude > 0 and megacities_transformed.country_code = countries_transformed.country_code
