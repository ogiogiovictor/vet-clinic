/*
 *Data Base Schema based on Diagram
*/
-- Create Tables Part
CREATE TABLE patients (
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
  name VARCHAR,
  date_of_birth DATE,
  PRIMARY KEY (id)
);


CREATE TABLE medical_histories (
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
  admitted_at TIMESTAMP,
  patient_id INT,
  status VARCHAR,
  PRIMARY KEY (id)
);