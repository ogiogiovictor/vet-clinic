/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = '%mon';

SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

-- List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT name from animals WHERE neutered = true AND escape_attempt > 3;

-- List the date of birth of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth from animals WHERE name = 'Agumon' OR name = 'Pikachu';

-- List name and escape attempts of animals that weigh more than 10.5kg
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;

-- Find all animals that are neutered.
SELECT * from animals WHERE neutered = true;

-- Find all animals not named Gabumon.
SELECT * from animals WHERE name != 'Gabumon';

-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
SELECT * from animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


/*
  *Transactions actions
*/
-- Set the species column and then rollback
BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT species FROM animals;
ROLLBACK;
SELECT species FROM animals;

-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE name NOT LIKE '%mon';
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

-- Delete all records from the animal TABLE
BEGIN
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;


-- Create SavePoint transaction
BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT animalDeleteSavePoint;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO animalDeleteSavePoint;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0; 
COMMIT;


-- Query Aggrecation
SELECT COUNT(*) FROM animals;

--What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- How many animals have never tried to escape
SELECT COUNT(*) FROM animals WHERE escape_attempts <= 0;

-- Who escapes the most, neutered or not neutered animals?
SELECT name, MAX(escape_attempts) FROM animals  GROUP BY name, escape_attempts ORDER BY escape_attempts DESC;


--What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg) AS minimun, MAX(weight_kg) as maximum FROM animals GROUP BY species;

--What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, COUNT(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;


-- Modify the animals table to include the respective species id
BEGIN;
UPDATE animals SET species_id = (SELECT id FROM species WHERE species.name LIKE '%mon' LIMIT 1) WHERE name LIKE '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE species.name NOT LIKE 'Poke%' LIMIT 1) WHERE name NOT LIKE '%mon';
SELECT name, species_id FROM animals;
COMMIT;

--What animals belong to Melody Pond?
SELECT name, escape_attempts FROM animals AS a
JOIN owners AS o ON o.id = a.owner_id
WHERE o.full_name = 'Melody Pond';

--List of all animals that are pokemon (their type is Pokemon).
SELECT a.name, escape_attempts FROM animals AS a
JOIN species AS s ON s.id = a.owner_id
WHERE s.name LIKE 'Pokemon' 

--List all owners and their animals, remember to include those that don't own any animal.
SELECT o.full_name as owner, a.name as animal_name FROM owners AS o
LEFT JOIN animals AS a ON a.owner_id = o.id;

--How many animals are there per species?
SELECT s.name, COUNT(a.name) FROM species AS s
JOIN animals AS a ON a.species_id = s.id
GROUP BY s.name;

--List all Digimon owned by Jennifer Orwell
SELECT a.name FROM animals AS a
JOIN owners AS o ON o.id = a.owner_id
JOIN species AS s ON s.id = a.species_id
WHERE o.full_name = 'Jennifer Orwell' AND s.name LIKE 'Digimon';

--List all animals owned by Dean Winchester that haven't tried to escape
SELECT a.name FROM animals AS a
JOIN owners AS o ON o.id = a.owner_id
WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts <= 0;
    

--Who owns the most animals?
SELECT full_name as animal_owner, COUNT(a.name) FROM owners AS o
JOIN animals AS a ON a.owner_id = o.id
GROUP BY full_name
ORDER BY COUNT(a.name) DESC;