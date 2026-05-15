DROP TABLE IF EXISTS basics.students;

CREATE TABLE basics.students(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    age INTEGER CHECK(age>=18),
    created_at TIMESTAMP DEFAULT NOW()
);

-- insert some data

INSERT INTO basics.students(
    name, email, age
)
VALUES 
('Skyy','skyy@test.com',30),
('Soumadip','soumadip@test.com',100);

SELECT * FROM basics.students;