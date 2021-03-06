-- Step 1: Add the column allowing null
ALTER TABLE TBLS ADD IS_REWRITE_ENABLED NUMBER(1) NULL;

 -- Step 2: Replace the null with default value (false)
UPDATE TBLS SET IS_REWRITE_ENABLED = 0;

-- Step 3: Alter the column to disallow null values
ALTER TABLE TBLS MODIFY(IS_REWRITE_ENABLED NOT NULL);
ALTER TABLE TBLS ADD CONSTRAINT REWRITE_CHECK CHECK (IS_REWRITE_ENABLED IN (1,0));
