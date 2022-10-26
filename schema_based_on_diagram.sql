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

-- Create Foreign keys connection
ALTER TABLE medical_histories ADD CONSTRAINT fk_patients FOREIGN KEY (patient_id) REFERENCES patients(id);

-- Creat Foregn keys for invoice and medical history
ALTER TABLE invoices ADD CONSTRAINT fk_medical_histories FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id);

-- Create Foreign keys for invoice items and invoice
ALTER TABLE invoice_items ADD CONSTRAINT fk_invoices FOREIGN KEY (invoice_id) REFERENCES invoices(id);

--Create Foreign keys for invoice and treatments
ALTER TABLE invoice_items ADD CONSTRAINT fk_treatments FOREIGN KEY (treatment_id) REFERENCES treatments(id);

--Create Foreign keys for treatments and medical history
ALTER TABLE treatments ADD CONSTRAINT fk_medical_histories FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id);

-- Create Indexes
CREATE INDEX medical_id_asc ON medical_histories(admitted_at asc);
CREATE INDEX invoiceitem_id_asc ON invoice_items(total_price asc);