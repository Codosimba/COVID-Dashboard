--- Tableau SQL Queries.
--1 .

-- It can be a stat
Select sum(new_cases) as total_cases, 
	sum(cast(total_deaths as bigint)) as total_deaths ,
	sum(cast(total_deaths as bigint))/NULLIF(sum(new_cases),0) as DeathPercentage
From Covid_project..CovidDeaths
where continent is not null
order by 1,2

--2. -- Total Death count by continents
-- Showing Continent death count as per population.
Select Location, max(cast(total_deaths as int)) as TotalDeathCount
from Covid_project..CovidDeaths
where continent is  null and Location in ('Asia',  
	'Europe', 'Africa','North America','South America','Oceania')
Group by Location 
Order by TotalDeathCount desc
;

-- 3. 
-- Looking at total cases vs population
SELECT Location, population, max(total_cases) as Highest_infection_count , max((total_cases / population))*100 AS Percent_people_infected
from Covid_project..CovidDeaths
group by Location, population
order by 1,2

--4.
-- Looking at total cases vs population
SELECT Location, population,date, max(total_cases) as Highest_infection_count , max((total_cases / population))*100 AS Percent_people_infected
from Covid_project..CovidDeaths
group by Location, population,date
order by Percent_people_infected desc