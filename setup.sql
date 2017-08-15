DROP DATABASE IF EXISTS racedb;
CREATE DATABASE racedb;

-- This is databse speicifc (Postgres). Other systems (MySQL or Oracle)
-- would be a different command to connect
\c racedb

CREATE TABLE runner(
  bib_id SERIAL PRIMARY KEY,
  division VARCHAR(100),
  sponsor VARCHAR(100),
  name VARCHAR(100) NOT NULL
);

CREATE TABLE venue(
  venue_id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  location VARCHAR(100)
);

CREATE TABLE race(
  race_id SERIAL PRIMARY KEY,
  name VARCHAR(250) NOT NULL,
  distance FLOAT NOT NULL,
  race_date TIMESTAMP NOT NULL,
  venue_id INTEGER,
  FOREIGN KEY(venue_id) REFERENCES venue(venue_id)
);

CREATE TABLE result(
  race_id INTEGER,
  FOREIGN KEY(race_id) REFERENCES race(race_id),
  bib_id INTEGER,
  FOREIGN KEY(bib_id) REFERENCES runner(bib_id),
  result_time FLOAT NOT NULL,
  PRIMARY KEY(race_id, bib_id)
);

INSERT INTO runner(division, sponsor, name, bib_id) VALUES ('m30', 'The Iron Yard', 'James Spargo','291038'), ('m30', 'The Iron Yard', 'Ben Gohlke','20182'), ('m40', 'The Iron Yard', 'Brian Gates', '291028'), ('m80', 'The  Old Man Club', 'Hamlin Juza', '22092'),('m200', 'Old Greg', 'Hamlin Juzas Twin Brother', '209182');
