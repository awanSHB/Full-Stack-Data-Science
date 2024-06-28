
UPDATE countrylanguage
SET "percentage" = convert(pgp_sym_encrypt("percentage"::text, '67yu8'), 'UTF8')::real;


-- Assuming 'percentage' is originally of type 'real'
ALTER TABLE countrylanguage
ALTER COLUMN "percentage" TYPE bytea;

-- Update the 'percentage' column with encrypted data
UPDATE countrylanguage
SET "percentage" = pgp_sym_encrypt("percentage"::text, '67yu8')::bytea;



-- Add a new column
ALTER TABLE countrylanguage
ADD COLUMN new_percentage bytea;

-- Update values in the new column based on the old column
UPDATE countrylanguage
SET new_percentage = fmcm("percentage");

-- Drop the old column
ALTER TABLE countrylanguage
DROP COLUMN "percentage";

-- Rename the new column to match the original column name
ALTER TABLE countrylanguage
RENAME COLUMN new_percentage TO "percentage";


ALTER TABLE countrylanguage
DROP COLUMN "new_percentage";
