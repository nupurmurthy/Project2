

CREATE TABLE Countries
(
    CountryCode 	CHAR(2),
    CountryName 	CHAR(50),
    Continent 		CHAR(20),
    Capital 		CHAR(30),
    CountryPopulation INTEGER,
    Area 			INTEGER,
    Coastline 		INTEGER,
    GovernmentForm 	CHAR(90),
    Currency 		CHAR(40),
    CurrencyCode 	CHAR(3),
    DialingPrefix 	CHAR(12),
    Birthrate 		FLOAT,
    Deathrate 		FLOAT,
    CONSTRAINT pk_Country PRIMARY KEY (
        CountryCode
     )
);	


CREATE TABLE Megacities
(
    CityName 		CHAR(30)   NOT NULL,
    CountryName 	CHAR(50)   NOT NULL,
    CountryCode 	CHAR(2)   NOT NULL,
    CityPopulation 	INTEGER,
    Latitude 		FLOAT,
    Longitude 		FLOAT,
	Region 			CHAR(40)
);

CREATE TABLE MergedCountryCity
(
    CountryCode 	CHAR(2),
    CountryName 	CHAR(50),
    Continent 		CHAR(20),
    Capital 		CHAR(30),
    CountryPopulation INTEGER,
    Area 			INTEGER,
    Coastline 		INTEGER,
    GovernmentForm 	CHAR(90),
    Currency 		CHAR(40),
    Birthrate 		FLOAT,
    Deathrate 		FLOAT,
	CityName 		CHAR(50),
    CityPopulation 	INTEGER,
    Latitude 		FLOAT,
    Longitude 		FLOAT,
    Region 			CHAR(40)
);

DROP TABLE Countries;
DROP TABLE Megacities;
DROP TABLE MergedCountryCity;

COPY Countries(CountryCode, CountryName, Continent, Capital, CountryPopulation, Area, Coastline, GovernmentForm, Currency, CurrencyCode,DialingPrefix, Birthrate, Deathrate)
FROM '/Users/victordituro/class/Columbia/Project2/countries1.csv' DELIMITER ',' CSV HEADER;

COPY Megacities(CityName,CountryName,CountryCode,CityPopulation,Latitude,Longitude,Region) 
FROM '/Users/victordituro/class/Columbia/Project2/megacities1.csv' DELIMITER ',' CSV HEADER;

COPY MergedCountryCity(CountryCode, CountryName, Continent, Capital, CountryPopulation, Area, Coastline, GovernmentForm, Currency, Birthrate, Deathrate,CityName,CityPopulation,Latitude,Longitude,Region)
FROM '/Users/victordituro/class/Columbia/Project2/cleaned_data.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM Countries;
SELECT * FROM Megacities;
SELECT * FROM MergedCountryCity;