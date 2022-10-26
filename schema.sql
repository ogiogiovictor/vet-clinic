/* Database schema to keep the structure of entire database. id INT GENERATED ALWAYS AS IDENTITY, */

CREATE TABLE animals (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50) NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL
);
ALTER TABLE animals ADD COLUMN species varchar(50) NULL;

CREATE TABLE owners (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(100) NOT NULL,
    age INT NULL
);

CREATE TABLE species (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL
);

-- Commands to add the foreign key
--ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id);
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD COLUMN owner_id INT;

ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species(id) ON DELETE CASCADE;

ALTER TABLE animals ADD CONSTRAINT fk_owners FOREIGN KEY(owner_id) REFERENCES owners(id) ON DELETE CASCADE;

-- Table Creation Vet
CREATE TABLE vets (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(50) NOT NULL,
    age INT NULL,
    date_of_graduation date NOT NULL
);

-- Table Creation Specialization
CREATE TABLE specializations (
    vet_id INT,
    species_id INT
);

-- Table Creation visits;
CREATE TABLE visits (
    vet_id INT,
    animal_id INT,
    date_of_visit DATE
);

-- CREATE INDEX friends_name_asc ON friends(name ASC);
--// create index employee_name on employees (name);

-- CREATE A INDEX ON THE NAME COLUMN OF THE VISTS TABLE
CREATE INDEX animal_id_asc ON visits(animal_id asc);
CREATE INDEX vet_id_asc ON visits(vet_id asc);
CREATE INDEX email_asc ON owners(email asc);
-- CREATE SCHEMA  schema_name_clause

