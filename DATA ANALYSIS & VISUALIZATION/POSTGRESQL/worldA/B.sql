-- ROLLBACK;

-- Insert data into the "country" table
INSERT INTO public.country (code, name, continent, region, surfacearea, indepyear, population, lifeexpectancy, gnp, gnpoid, localname, governmentform, headofstate, capital, code2)
VALUES
    ('USA', 'United States', 'North America', 'North America', 9372610.00, 1776, 331883986, 77.1, 19379890.60, 2000.00, 'United States', 'Federal Republic', 'Joe Biden', 1, 'US'),
    ('CAN', 'Canada', 'North America', 'North America', 9984670.00, 1867, 37279811, 81.7, 1550652.00, 126709.00, 'Canada', 'Constitutional Monarchy', 'Queen Elizabeth II', 6, 'CA'),
    ('FRA', 'France', 'Europe', 'Western Europe', 551695.00, 843, 59225700, 78.8, 1424285.56, 1352.00, 'France', 'Republic', 'Emmanuel Macron', 179, 'FR'),
    ('GER', 'Germany', 'Europe', 'Western Europe', 357022.00, 1871, 83019200, 77.4, 2133372.88, 327761.00, 'Deutschland', 'Federal Republic', 'Frank-Walter Steinmeier', 55, 'DE'),
    ('GBR', 'United Kingdom', 'Europe', 'British Islands', 242900.00, 1707, 59623400, 77.7, 1378330.53, 225634.00, 'United Kingdom', 'Constitutional Monarchy', 'Queen Elizabeth II', 456, 'GB'),
    ('AUS', 'Australia', 'Oceania', 'Australia and New Zealand', 7741220.00, 1901, 18886000, 79.8, 351182.17, 253639.00, 'Australia', 'Constitutional Monarchy', 'Queen Elizabeth II', 135, 'AU'),
    ('BRA', 'Brazil', 'South America', 'South America', 8547403.00, 1822, 170115000, 62.9, 776739.36, 40470.00, 'Brasil', 'Federal Republic', 'Jair Bolsonaro', 211, 'BR'),
    ('CHN', 'China', 'Asia', 'Eastern Asia', 9572900.00, -1523, 1277558000, 71.4, 982268.42, 917719.00, 'Zhongquo', 'People''s Republic', 'Xi Jinping', 1891, 'CN'),
    ('IND', 'India', 'Asia', 'Southern and Central Asia', 3287263.00, 1947, 1013662000, 62.5, 447114.54, 430572.00, 'Bharat', 'Federal Republic', 'Ram Nath Kovind', 110, 'IN'),
    ('JPN', 'Japan', 'Asia', 'Eastern Asia', 377829.00, -660, 126714000, 80.7, 3787042.71, 419263.00, 'Nihon/Nippon', 'Constitutional Monarchy', 'Naruhito', 1532, 'JP');

-- Insert data into the "city" table
INSERT INTO public.city (id, name, countrycode, district, population)
VALUES
    (1, 'New York', 'USA', 'New York', 8622698),
    (2, 'Los Angeles', 'USA', 'California', 3990456),
    (3, 'Toronto', 'CAN', 'Ontario', 2731571),
    (4, 'Paris', 'FRA', 'Ile-de-France', 2249975),
    (5, 'Berlin', 'GER', 'Berlin', 3406000),
    (6, 'London', 'GBR', 'England', 7285000),
    (7, 'Sydney', 'AUS', 'New South Wales', 3276207),
    (8, 'Rio de Janeiro', 'BRA', 'Rio de Janeiro', 5598953),
    (9, 'Beijing', 'CHN', 'Beijing', 7472000),
    (10, 'Mumbai', 'IND', 'Maharashtra', 12478447);

-- Insert data into the "countrylanguage" table
INSERT INTO public.countrylanguage (countrycode, language, isofficial, percentage)
VALUES
    ('USA', 'English', true, 97.0),
    ('CAN', 'English', true, 56.9),
--     ('CAN', 'French', true, 21.3),
    ('FRA', 'French', true, 93.0),
    ('GER', 'German', true, 91.3),
    ('GBR', 'English', true, 97.3),
    ('AUS', 'English', true, 81.2),
    ('BRA', 'Portuguese', true, 97.5),
    ('CHN', 'Chinese', true, 92.0),
    ('IND', 'Hindi', true, 41.0);

commit;