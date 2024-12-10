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















