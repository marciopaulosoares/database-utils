select * from information_schema.tables;

DO $$ DECLARE
    tabname RECORD;
BEGIN
    FOR tabname IN (SELECT tablename 
                    FROM pg_tables 
                    WHERE schemaname = 'scheme_name') 
LOOP
    EXECUTE 'DROP TABLE IF EXISTS ' || quote_ident(tabname.tablename) || ' CASCADE';
END LOOP;
END $$;