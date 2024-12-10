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













