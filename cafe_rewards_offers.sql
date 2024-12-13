CREATE TABLE IF NOT EXISTS offers(
    offer_id VARCHAR(255),
    offer_type VARCHAR(255),
    difficulty INT,
    reward INT,
    duration INT,
    channels TEXT
);

CREATE TABLE IF NOT EXISTS customers(
    customer_id VARCHAR(255),
    become_member_on DATE,
    gender VARCHAR(5),
    age INT,
    income INT
);

CREATE TABLE IF NOT EXISTS events(
    customer_id VARCHAR(255),
    event VARCHAR(255),
    value TEXT,
    time INT
);
-----------------------------------------------------------------------
-- import csv files
COPY offers 
FROM  'C:/Users/ctsta/Desktop/cafe_rewards_offers/offers.csv'
WITH (FORMAT CSV, HEADER TRUE)

COPY customers 
FROM  'C:/Users/ctsta/Desktop/cafe_rewards_offers/customers.csv'
WITH (FORMAT CSV, HEADER TRUE)

COPY events 
FROM  'C:/Users/ctsta/Desktop/cafe_rewards_offers/events.csv'
WITH (FORMAT CSV, HEADER TRUE)

-- check import files
SELECT * 
FROM offers
LIMIT 3;

SELECT * 
FROM customers
LIMIT 3;

SELECT * 
FROM events
LIMIT 3;

--------------------------------------------------------------------------
-- unlist a column
SELECT DISTINCT channels
FROM offers;

-- create a duplicated table
SELECT *
INTO offer2
FROM offers


SELECT *
FROM offer2

-- create channel group
SELECT channels, 
CASE WHEN (web = 1 AND email = 1 and mobile = 1 and social = 1) THEN 1
     WHEN (web = 1 AND email = 1 and mobile = 1) THEN 2
     WHEN (email = 1 and mobile = 1 and social = 1) THEN 3
     ELSE 4 END AS channel_group
FROM offer2

-- update the customer table
SELECT * 
INTO customer2
FROM customers

-- calculate median
SELECT 
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY income) AS median
FROM
  customer2

-- replace income missing value with median
UPDATE customer2
SET income = (SELECT 
              PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY income) AS median
              FROM customer2)
WHERE income IS NULL;

SELECT *
FROM customer2

