/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Agumon', '2020-02-03', '10.23', true, 0);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Gabumon', '2018-11-15', '8', true, 2);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Pikachu', '2021-01-07', '15.04', true, 1);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) VALUES ('Devimon', '2017-05-12', '11', true, 5);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Charmander', '2020-02-8', '11', false, 0);
INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Plantmon', '2021-10-15', '-5.7', true, 2);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Squirtle', '1993-04-02', '-12.13', false, 3);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Angemon', '2005-06-12', '-45', true, 1);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Boarmon', '2005-06-07', '20.4', true, 7);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Blossom', '1998-10-13', '17', true, 3);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES ('Ditto', '2022-05-14', '22', true, 4);

-- Insert values into owners and species
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', '34'),
('Jennifer Orwell', 19),
('Bob', 15),
('Melody Pond', 77),
('Dean Winchester ', 14),
('Jodie Whittake', 38);

INSERT INTO species (name) VALUES
('Pokemon'),
('Digimon');

-- Modify the animals table to include the owners id
BEGIN;
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE owners.full_name = 'Sam Smith' LIMIT 1) WHERE name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE owners.full_name = 'Jennifer Orwell' LIMIT 1) WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE owners.full_name = 'Bob' LIMIT 1) WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE owners.full_name = 'Melody Pond' LIMIT 1) WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Angemon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE owners.full_name = 'Dean Winchester' LIMIT 1) WHERE name = 'Boarmon' OR name = 'Blossom';
COMMIT



/* Insert the following data for vets*/
INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, 'Apr 23, 2000'),
('Maisy Smith', 26, 'Jan 17, 2019'),
('Stephanie Mendez', 64, 'May 4, 1981'),
('Jack Harkness', 38, 'Jun 8, 2008');

/* Insert the following data for specializations*/
INSERT INTO specializations VALUES (1, 1),
(3, 1),
(3, 2),
(4, 2);

/* Insert the following data for visits*/
INSERT INTO visits SELECT vets.id, animals.id, 'May 24, 2020' FROM animals JOIN vets ON vets.name='William Tatcher' and animals.name='Agumon';
INSERT INTO visits SELECT vets.id, animals.id, 'Jul 22, 2020' FROM animals JOIN vets ON vets.name='Stephanie Mendez' and animals.name='Agumon';
INSERT INTO visits SELECT vets.id, animals.id, 'Feb 2, 2021' FROM animals JOIN vets ON vets.name='Jack Harkness' and animals.name='Gabumon';
INSERT INTO visits SELECT vets.id, animals.id, 'Jan 5, 2020' FROM animals JOIN vets ON vets.name='Maisy Smith' and animals.name='Pikachu';
INSERT INTO visits SELECT vets.id, animals.id, 'Mar 8, 2020' FROM animals JOIN vets ON vets.name='Maisy Smith' and animals.name='Pikachu';
INSERT INTO visits SELECT vets.id, animals.id, 'May 14, 2020' FROM animals JOIN vets ON vets.name='Maisy Smith' and animals.name='Pikachu';
INSERT INTO visits SELECT vets.id, animals.id, 'May 4, 2021' FROM animals JOIN vets ON vets.name='Stephanie Mendez' and animals.name='Devimon';
INSERT INTO visits SELECT vets.id, animals.id, 'Feb 24, 2021' FROM animals JOIN vets ON vets.name='Jack Harkness' and animals.name='Charmander';
INSERT INTO visits SELECT vets.id, animals.id, 'Dec 21, 2019' FROM animals JOIN vets ON vets.name='Maisy Smith' and animals.name='Plantmon';
INSERT INTO visits SELECT vets.id, animals.id, 'Aug 10, 2020' FROM animals JOIN vets ON vets.name='William Tatcher' and animals.name='Plantmon';
INSERT INTO visits SELECT vets.id, animals.id, 'Apr 7, 2021' FROM animals JOIN vets ON vets.name='Maisy Smith' and animals.name='Plantmon';
INSERT INTO visits SELECT vets.id, animals.id, 'Sep 29, 2019' FROM animals JOIN vets ON vets.name='Stephanie Mendez' and animals.name='Squirtle';
INSERT INTO visits SELECT vets.id, animals.id, 'Oct 3, 2020' FROM animals JOIN vets ON vets.name='Jack Harkness' and animals.name='Angemon';
INSERT INTO visits SELECT vets.id, animals.id, 'Nov 4, 2020' FROM animals JOIN vets ON vets.name='Jack Harkness' and animals.name='Angemon';
INSERT INTO visits SELECT vets.id, animals.id, 'Jan 24, 2019' FROM animals JOIN vets ON vets.name='Maisy Smith' and animals.name='Boarmon';
INSERT INTO visits SELECT vets.id, animals.id, 'May 15, 2019' FROM animals JOIN vets ON vets.name='Maisy Smith' and animals.name='Boarmon';
INSERT INTO visits SELECT vets.id, animals.id, 'Feb 27, 2020' FROM animals JOIN vets ON vets.name='Maisy Smith' and animals.name='Boarmon';
INSERT INTO visits SELECT vets.id, animals.id, 'Aug 3, 2020' FROM animals JOIN vets ON vets.name='Maisy Smith' and animals.name='Boarmon';
INSERT INTO visits SELECT vets.id, animals.id, 'May 24, 2020' FROM animals JOIN vets ON vets.name='Stephanie Mendez' and animals.name='Blossom';
INSERT INTO visits SELECT vets.id, animals.id, 'Jan 11, 2021' FROM animals JOIN vets ON vets.name='William Tatcher' and animals.name='Blossom';

INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';

SELECT COUNT(*) FROM visits where animal_id = 4;
SELECT * FROM visits where vet_id = 2;
SELECT * FROM owners where email = 'owner_18327@mail.com';