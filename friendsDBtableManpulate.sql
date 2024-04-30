  CREATE TABLE friends (
    id INTEGER,
    name TEXT, 
    birthday DATE
  );

INSERT INTO friends(id, name, birthday)
VALUES (1, 'Ororo Munroe', '1940-05-30');

SELECT * 
FROM friends;

INSERT INTO friends(id, name, birthday)
VALUES 
    (2, 'Mohand Othman', '2007-04-23'),
    (3, 'Nourah Ahmad', '1989-02-19');

UPDATE friends 
SET name ='storm'
WHERE name = 'Ororo Munroe';

ALTER TABLE friends
ADD COLUMN column email;

UPDATE friends
set email = 'storm@codecademy.com';

DELETE FROM friends
WHERE id = 1;

SELECT * 
FROM friends;
