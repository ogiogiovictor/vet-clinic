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

CREATE TABLE invoices
(
    id integer NOT NULL,
    total_amount DECIMAL,
    generated_at time without time zone,
    payed_at time without time zone,
    medical_history_id integer,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS invoices

CREATE TABLE invoice_items
(
    id integer NOT NULL,
    unit_price DECIMAL,
    quantity integer,
    total_price DECIMAL,
    invoice_id integer,
    treatment_id integer,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS invoice_items


    CREATE TABLE treatments
(
    id integer NOT NULL,
    type character varying,
    name character varying,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS treatments
