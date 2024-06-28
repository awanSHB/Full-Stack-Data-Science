select * from public.city;
SELECT * FROM country;
SELECT * FROM "countrylanguage";
SELECT * from public."country";


-- ALTER TABLE countrylanguage ALTER COLUMN "percentage" TYPE bytea;
CREATE EXTENSION IF NOT EXISTS pgcrypto;

ALTER TABLE countrylanguage
ADD COLUMN encrypted_percentage bytea;

UPDATE countrylanguage
SET encrypted_percentage = pgp_sym_encrypt("percentage"::text, 'your_secret_key');

ALTER TABLE countrylanguage
DROP COLUMN "percentage";

ALTER TABLE countrylanguage
RENAME COLUMN encrypted_percentage TO "percentage";

SELECT "percentage" FROM countrylanguage;

-------------------- select decrypted COLUMN
SELECT pgp_sym_decrypt("percentage", 'your_secret_key')::real FROM countrylanguage;

-------------------------------------------------
-------------------- decrypt the TABLE          |
-------------------------------------------------

-- Add a new column to store the decrypted data
ALTER TABLE countrylanguage
ADD COLUMN decrypted_percentage real;

-- Update the new column with the decrypted values
UPDATE countrylanguage
SET decrypted_percentage = pgp_sym_decrypt("percentage", 'your_secret_key')::text::real;

-- Drop the old 'percentage' column
ALTER TABLE countrylanguage
DROP COLUMN "percentage";

-- Rename the new column to 'percentage'
ALTER TABLE countrylanguage
RENAME COLUMN decrypted_percentage TO "percentage";

-- Verify the result
SELECT "percentage" FROM countrylanguage;


--
---
----
-----
------

--- another METHOD
-- Add the pgcrypto extension
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Add a new column to store the encrypted data
ALTER TABLE countrylanguage
ADD COLUMN encrypted_percentage bytea;

-- Update the new column with the encrypted data using AES encryption
UPDATE countrylanguage
SET encrypted_percentage = crypt("percentage"::text, gen_salt('bf'));

-- Drop the old 'percentage' column
ALTER TABLE countrylanguage
DROP COLUMN "percentage";

-- Rename the new column to 'percentage'
ALTER TABLE countrylanguage
RENAME COLUMN encrypted_percentage TO "percentage";

-- Select the decrypted 'percentage' values
SELECT pgp_sym_decrypt("percentage", 'your_secret_key')::real FROM countrylanguage;


--- Method END





