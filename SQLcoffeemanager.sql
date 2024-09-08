CREATE DATABASE COFFEESHOPMANAGERS
GO
USE COFFEESHOPMANAGERS
GO 
-- FOOD 
-- TABLE
-- FOODCATEGORY
-- ACCOUNT
-- BILL
-- BILLINFO

CREATE TABLE TABLEFOODs(
ID INT IDENTITY PRIMARY KEY ,
NAME NVARCHAR(100) NOT NULL DEFAULT N'BAN CHU CO TEN',
STATUS NVARCHAR(100) NOT NULL DEFAULT N'NO'
)
GO

CREATE TABLE ACCOUNTs(
USERNAME NVARCHAR(100) PRIMARY KEY,
DISPLAYNAME NVARCHAR(100) NOT NULL DEFAULT N'THANH SANG',
PASSWORD NVARCHAR(1000) NOT NULL DEFAULT 0,
TYPE INT NOT NULL DEFAULT 0
)
GO

CREATE TABLE FOODCATEGORYs(
ID INT IDENTITY PRIMARY KEY,
NAME NVARCHAR(100)  NOT NULL DEFAULT N'CHUA DAT TEN'
)
GO

CREATE TABLE FOODs(
ID INT IDENTITY PRIMARY KEY,
NAME NVARCHAR (100) NOT NULL DEFAULT N'CHUA DAT TEN',
IDCATEGORY INT NOT NULL,
PRICE FLOAT NOT NULL DEFAULT 0
FOREIGN KEY (IDCATEGORY) REFERENCES DBO.FOODCATEGORYs(ID)
)
GO

CREATE TABLE BILLs(
ID INT IDENTITY PRIMARY KEY ,
DATECHECKIN DATE NOT NULL DEFAULT GETDATE(),
DATECHECKOUT DATE,
IDTABLE INT NOT NULL,
STATUS INT NOT NULL DEFAULT 0
FOREIGN KEY (IDTABLE) REFERENCES DBO.TABLEFOODs(ID)
)
GO

CREATE TABLE BILLINFO(
ID INT IDENTITY PRIMARY KEY ,
IDBILL INT NOT NULL,
IDFOOD INT NOT NULL,
COUNT INT NOT NULL DEFAULT 0
FOREIGN KEY (IDBILL) REFERENCES DBO.BILLs(ID),
FOREIGN KEY (IDFOOD) REFERENCES DBO.FOODs(ID)
)
GO

INSERT INTO DBO.ACCOUNTs(
USERNAME,
DISPLAYNAME,
PASSWORD,
TYPE
)
VALUES(
N'THANHSANG',
N'HOMAITHANHSANG',
N'1',
1
)

INSERT INTO DBO.ACCOUNTs(
USERNAME,
DISPLAYNAME,
PASSWORD,
TYPE
)
VALUES(
N'THANHSANG1',
N'HOMAITHANHSANG1',
N'12',
0
)
GO

CREATE PROC USP_GETACCOUNTUSERNAME
@USERNAME NVARCHAR(100)
AS
BEGIN
SELECT * FROM DBO.ACCOUNTs WHERE USERNAME = @USERNAME
END
GO

EXEC DBO.USP_GETACCOUNTUSERNAME @USERNAME = N'THANHSANG'




SELECT * FROM DBO.ACCOUNTs WHERE USERNAME = N'THANHSANG'

SELECT *FROM DBO.ACCOUNTs WHERE USERNAME = N' ' AND PASSWORD = N''OR	1 = 1--'

SELECT *FROM DBO.ACCOUNTs WHERE USERNAME = @USERNAME AND PASSWORD = @PASSWORD