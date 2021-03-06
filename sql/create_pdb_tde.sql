BEGIN
    BEGIN
        EXECUTE IMMEDIATE 'ADMINISTER KEY MANAGEMENT SET KEYSTORE CLOSE';
    EXCEPTION
        WHEN OTHERS THEN
            NULL;
    END;
    BEGIN
        EXECUTE IMMEDIATE 'ADMINISTER KEY MANAGEMENT SET KEYSTORE CLOSE IDENTIFIED BY "Welcome_1"';
    EXCEPTION
        WHEN OTHERS THEN
            NULL;
    END;
    EXECUTE IMMEDIATE 'ADMINISTER KEY MANAGEMENT SET KEYSTORE OPEN IDENTIFIED BY "Welcome_1"';
    EXECUTE IMMEDIATE 'CREATE PLUGGABLE DATABASE "PDB2"
        ADMIN USER "admin" IDENTIFIED BY "Welcome_1"
        STORAGE UNLIMITED
        TEMPFILE REUSE
        FILE_NAME_CONVERT=NONE';
END;
/
ALTER PLUGGABLE DATABASE "PDB2" OPEN READ WRITE
/
ALTER SESSION SET CONTAINER="PDB2"
/
BEGIN
    BEGIN
        EXECUTE IMMEDIATE 'ADMINISTER KEY MANAGEMENT SET KEYSTORE CLOSE';
    EXCEPTION
        WHEN OTHERS THEN
            NULL;
    END;
    BEGIN
        EXECUTE IMMEDIATE 'ADMINISTER KEY MANAGEMENT SET KEYSTORE CLOSE IDENTIFIED BY "Welcome_1"';
    EXCEPTION
        WHEN OTHERS THEN
            NULL;
    END;
    EXECUTE IMMEDIATE 'ADMINISTER KEY MANAGEMENT SET KEYSTORE OPEN IDENTIFIED BY "Welcome_1"';
    EXECUTE IMMEDIATE 'ADMINISTER KEY MANAGEMENT SET KEY IDENTIFIED BY "Welcome_1" WITH BACKUP';
END;
/
ALTER SESSION SET CONTAINER=CDB$ROOT
/
BEGIN
    BEGIN
        EXECUTE IMMEDIATE 'ADMINISTER KEY MANAGEMENT SET KEYSTORE CLOSE IDENTIFIED BY "Welcome_1" CONTAINER=ALL';
    EXCEPTION
        WHEN OTHERS THEN
            NULL;
    END;
    BEGIN
        EXECUTE IMMEDIATE 'SELECT * FROM V$ENCRYPTION_WALLET';
    EXCEPTION
        WHEN OTHERS THEN
            NULL;
    END;
END;
/

