-- SECTION 0 - SELECT BASICS

--Modify it to show the population of Germany
-- 1. 

SELECT population
FROM world
WHERE name = 'Germany'

-- Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
-- 2. 
SELECT name, population
FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- Modify it to show the country and the area for countries with an area between 200,000 and 250,000.
-- 3. 
SELECT name, area
FROM world
WHERE area BETWEEN 200000 AND 250000

-- SECTION 1 - SELECT NAME

--Find the country that start with Y
-- 1. 
SELECT name
FROM world
WHERE name LIKE 'Y%'
-- Find the countries that end with y
-- 2. 

SELECT name
FROM world
WHERE name LIKE '%y'

-- Find the countries that contain the letter x
-- 3. 
SELECT name
FROM world
WHERE name LIKE '%x%'

-- Find the countries that end with land
-- 4. 
SELECT name
FROM world
WHERE name LIKE '%land'
-- Find the countries that start with C and end with ia
-- 5. 
SELECT name
FROM world
WHERE name LIKE 'C%ia'
-- Find the country that has oo in the name
-- 6. 
SELECT name
FROM world
WHERE name LIKE '%oo%'
-- Find the countries that have three or more a in the name
-- 7. 
SELECT name
FROM world
WHERE name LIKE '%a%a%a%'
-- Find the countries that have "t" as the second character.
-- 8. 
SELECT name
FROM world
WHERE name LIKE '_t%'
ORDER BY name
-- Find the countries that have two "o" characters separated by two others.
-- 9. 
SELECT name
FROM world
WHERE name LIKE '%o__o%'
-- Find the countries that have exactly four characters.
-- 10. 
SELECT name
FROM world
WHERE name LIKE '____'

-- SECTION 2 - SELECT from World

-- Observe the result of running this SQL command to show the name, continent and population of all countries.
-- 1. 
SELECT name, continent, population
FROM world
-- Show the name for the countries that have a population of at least 200 million. 
-- 200 million is 200000000, there are eight zeros.
-- 2. 
SELECT name
FROM world
WHERE population >= 200000000;
-- Give the name and the per capita GDP for those countries with a population of at least 200 million.
-- 3. 
SELECT name, gdp/population
FROM world
WHERE population >= 200000000;
-- Show the name and population in millions for the countries of the continent 'South America'. 
-- 4. 
SELECT name, population/1000000
FROM world
WHERE continent = 'South America';
-- Show the name and population for France, Germany, Italy
-- 5. 
SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy');
-- Show the countries which have a name that includes the word 'United'
-- 6. 
SELECT name
FROM world
WHERE name LIKE '%United%';
-- Show the countries that are big by area or big by population. Show name, population and area.
-- 7. 
SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000;
-- Show the countries that are big by area or big by population but not both. Show name, population and area.
-- 8. 
SELECT name, population, area
FROM world
WHERE area > 3000000
XOR population > 250000000;
-- For South America show population in millions and GDP in billions both to 2 decimal places.
-- 9. 
SELECT name, ROUND(population/1000000, 2), ROUND (gdp/1000000000, 2)
FROM world
WHERE continent = 'South America';
-- Show per-capita GDP for the trillion dollar countries to the nearest $1000.
-- 10. 
SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE gdp >= 1000000000000;
-- Show the name and capital where the name and the capital have the same number of characters.
-- 11. 
SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital);
-- Show the name and the capital where the first letters of each match. 
-- Don't include countries where the name and the capital are the same word.
-- 12. 
SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital, 1) AND name <> capital;
-- Find the country that has all the vowels and no spaces in its name.
-- 13. 

SELECT name
FROM world
WHERE name LIKE '%A%' AND name LIKE '%E%' AND name LIKE '%I%' AND name LIKE '%O%' AND name LIKE '%U%'
  AND name NOT LIKE '% %';

--SECTION 3 - SELECT FROM nobel

-- Change the query shown so that it displays Nobel prizes for 1950.
-- 1. 
SELECT *
FROM nobel
WHERE yr = 1950

-- Show who won the 1962 prize for Literature.
-- 2.
SELECT winner
FROM nobel
WHERE yr = 1962 AND subject = 'Literature'

-- Show the year and subject that won 'Albert Einstein' his prize.
-- 3.
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein'

-- Give the name of the 'Peace' winners since the year 2000, including 2000.
-- 4. 
SELECT winner
FROM nobel
WHERE subject = 'Peace' AND yr >= 2000

-- Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
-- 5. 
SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989

/*Show all details of the presidential winners:
Theodore Roosevelt
Woodrow Wilson
Jimmy Carter
Barack Obama*/
-- 6. 
SELECT *
FROM nobel
where winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')

-- Show the winners with first name John
-- 7. 
SELECT winner
FROM nobel
WHERE winner LIKE 'John%'

-- Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.
-- 8. 

SELECT *
FROM nobel
WHERE (subject = 'Physics' AND yr = 1980) OR (subject = 'Chemistry' AND yr = 1984)
-- Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine
-- 9. 
SELECT *
FROM nobel
WHERE yr = 1980 AND NOT (subject = 'Chemistry' OR subject = 'Medicine')

-- Show year, subject, and name of people who won a 'Medicine' prize in an early year 
-- (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year 
-- (after 2004, including 2004)
-- 10. 

SELECT *
FROM nobel
WHERE (yr < 1910 AND subject = 'Medicine') OR (yr >= 2004 AND subject = 'Literature')


-- JOIN 6 EXERCISE

-- The first example shows the goal scored by a player with the last name 'Bender'. The * says to list all the columns in the table - a shorter way of saying matchid, teamid, player, gtime

-- Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'

SELECT matchid, player
FROM goal
WHERE teamid = 'GER'