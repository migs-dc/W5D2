# == Schema Information
#
# Table name: countries
#
#  name        :string       not null, primary key
#  continent   :string
#  area        :integer
#  population  :integer
#  gdp         :integer

require_relative './sqlzoo.rb'

def example_sum
  execute(<<-SQL)
    SELECT
      SUM(population)
    FROM
      countries;
  SQL
end

def continents
  # List all the continents - just once each.
  execute(<<-SQL)
    SELECT 
      DISTINCT continent
    FROM 
      countries;
  SQL
end

def africa_gdp
  # Give the total GDP of Africa.
  execute(<<-SQL)
    SELECT
      SUM(GDP) AS total_gdp
    FROM 
      countries
    WHERE
      continent = 'Africa';
  SQL
end

def area_count
  # How many countries have an area of more than 1,000,000?
  execute(<<-SQL)
    SELECT
      COUNT(name) AS big_area
    FROM
      countries
    WHERE
      area > 1000000;
  SQL
end

def group_population
  # What is the total population of ('France','Germany','Spain')?
  execute(<<-SQL)
    SELECT
      SUM(population) AS total_pop
    FROM 
      countries
    WHERE
      name = 'France' OR
      name = 'Germany' OR
      name = 'Spain';
  SQL
end

def country_counts
  # For each continent show the continent and number of countries.
  execute(<<-SQL)
    SELECT 
      continent, COUNT(name) AS country_count
    FROM 
      countries
    GROUP BY
      continent 
  SQL
end

### GROUP BY
=begin
- `GROUP BY` groups rows with matching values for given column
  - Collapses each group of rows into a single row
- Any column we `SELECT` must be in our `GROUP BY`
- Aggregate functions in `SELECT` will apply to the individual groups, not the groups as a whole
=end

def populous_country_counts
  # For each continent show the continent and number of countries with
  # populations of at least 10 million.
  execute(<<-SQL)
    SELECT
    FROM
      countries
    WHERE
  SQL
end

def populous_continents
  # List the continents that have a total population of at least 100 million.
  execute(<<-SQL)
  SQL
end
