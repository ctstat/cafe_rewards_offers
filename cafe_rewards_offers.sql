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

-- create empty columns (NULL) for each channel
SELECT * 
    , NULL AS web
    , NULL AS email
    , NULL AS mobile
    , NULL AS social
FROM offer2


-- a testing table
CREATE TABLE IF NOT EXISTS testing(
    id INT,
    items TEXT
);

INSERT INTO testing (id, items)
VALUES
    (1, '["A", "B"]'),
    (2, '["A", "B", "C"]'),
    (3, '["A", "C"]')

SELECT *
FROM testing


CREATE TABLE IF NOT EXISTS testing2(
    id INT,
    items TEXT,
    A INT,
    B INT,
    C INT
);

INSERT INTO testing (id, items, A, B, C)
VALUES
    (1, '["A", "B"]', 1, 0, 1),
    (2, '["A", "B", "C"]', 1, 1, 1),
    (3, '["A", "C"]', 1, 1, 0)




