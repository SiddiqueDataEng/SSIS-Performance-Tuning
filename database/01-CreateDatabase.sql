/*
 * SSIS Performance Tuning
 * Project #76 - Complete Database Implementation
 * SQL Server 2008/2012
 * Technology: SSIS
 * Created: 2013
 */

USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'TuningETL')
BEGIN
    ALTER DATABASE TuningETL SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE TuningETL;
END
GO

CREATE DATABASE TuningETL
ON PRIMARY
(
    NAME = 'TuningETL_Data',
    FILENAME = 'C:\SQLData\TuningETL_Data.mdf',
    SIZE = 100MB,
    MAXSIZE = 5GB,
    FILEGROWTH = 10MB
)
LOG ON
(
    NAME = 'TuningETL_Log',
    FILENAME = 'C:\SQLData\TuningETL_Log.ldf',
    SIZE = 50MB,
    MAXSIZE = 1GB,
    FILEGROWTH = 5MB
);
GO

ALTER DATABASE TuningETL SET RECOVERY SIMPLE;
ALTER DATABASE TuningETL SET AUTO_UPDATE_STATISTICS ON;
GO

USE TuningETL;
GO

PRINT 'Database TuningETL created successfully';
PRINT 'Project: SSIS Performance Tuning';
PRINT 'Description: Large volume package optimization';
GO
