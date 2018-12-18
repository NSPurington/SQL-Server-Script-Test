USE ABT_Code_Test
GO
CREATE TABLE PersonLoading (JSON nvarchar(max))
GO
CREATE TABLE Person (ID nvarchar(max), FirstName nvarchar(max), LastName nvarchar(max), MobilePhone nvarchar(max), StreetAddress nvarchar(max), City nvarchar(max), [State] nvarchar(max), ZIP nvarchar(max))
GO
INSERT INTO PersonLoading VALUES ('{ "ID" : "0", "FirstName" : "Alex", "LastName" : "Adams", "MobilePhone" : "000-000-0000", "StreetAddress" : "0000 A Street", "City" : "Anchorage", "State" : "Alaska", "ZIP" : "0000" }')
INSERT INTO PersonLoading VALUES ('{ "ID" : 1, "FirstName" : "Barry", "LastName" : "Brown", "MobilePhone" : "111-111-1111", "StreetAddress" : "1111 B Street", "City" : "Brownsville", "State" : "Brownstate", "ZIP" : 11111 }')
INSERT INTO PersonLoading VALUES ('{ "ID" : 2, "FirstName" : "Charlie", "LastName" : "Cooper", "MobilePhone" : "222-222-2222", "StreetAddress" : "2222 C Street", "City" : "Centennial", "State" : "Colorado", "ZIP" : 22222 }')
INSERT INTO PersonLoading VALUES ('{ "ID" : 3, "FirstName" : "Dave", "LastName" : "Davis", "MobilePhone" : "333-333-3333", "StreetAddress" : "3333 D Street", "City" : "Dover", "State" : "Delaware", "ZIP" : 33333 }')
INSERT INTO PersonLoading VALUES ('{ "ID" : 4, "FirstName" : "Ernie", "LastName" : "Evans", "MobilePhone" : "444-444-4444", "StreetAddress" : "4444 E Street", "City" : "Escondido", "State" : "Estate", "ZIP" : 44444 }')
INSERT INTO PersonLoading VALUES ('{ "ID" : 5, "FirstName" : "Frank", "LastName" : "Fry", "MobilePhone" : "555-555-5555", "StreetAddress" : "5555 F Street", "City" : "Franktown", "State" : "Fstate", "ZIP" : 55555 }')
INSERT INTO PersonLoading VALUES ('{ "ID" : 6, "FirstName" : "Greg", "LastName" : "Grey", "MobilePhone" : "666-666-6666", "StreetAddress" : "6666 G Street", "City" : "Gregtown", "State" : "Georgia", "ZIP" : 66666 }')
INSERT INTO PersonLoading VALUES ('{ "ID" : 7, "FirstName" : "Henry", "LastName" : "Harrison", "MobilePhone" : "777-777-7777", "StreetAddress" : "7777 H Street", "City" : "Honolulu", "State" : "Hawii", "ZIP" : 77777 }')
INSERT INTO PersonLoading VALUES ('{ "ID" : 8, "FirstName" : "Ivan", "LastName" : "Iris", "MobilePhone" : "888-888-8888", "StreetAddress" : "8888 I Street", "City" : "Indiannapolis", "State" : "Indiana", "ZIP" : 88888 }')
INSERT INTO PersonLoading VALUES ('{ "ID" : 9, "FirstName" : "Jerry", "LastName" : "Johnson", "MobilePhone" : "999-999-9999", "StreetAddress" : "9999 J Street", "City" : "Jerrytown", "State" : "Jersey", "ZIP" : 99999 }')
GO
CREATE FUNCTION dbo.scaler()
RETURNS TABLE
AS 
RETURN 
(SELECT 
	JSON_VALUE(JSON,'$.ID') AS ID,
	JSON_VALUE(JSON,'$.FirstName') AS FirstName,
	JSON_VALUE(JSON,'$.LastName') AS LastName, 
	JSON_VALUE(JSON,'$.MobilePhone') AS MobilePhone,
	JSON_VALUE(JSON,'$.StreetAddress') AS StreetAddress,
	JSON_VALUE(JSON,'$.City') AS City,
	JSON_VALUE(JSON,'$.State') AS State,
	JSON_VALUE(JSON,'$.ZIP') AS ZIP
FROM PersonLoading)
GO
CREATE PROCEDURE InsertRecords
AS 
INSERT INTO Person 
SELECT *
FROM
dbo.scaler();
GO
EXECUTE InsertRecords
