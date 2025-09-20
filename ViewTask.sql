CREATE DATABASE VieWork
USE VieWork



CREATE TABLE Users( 
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(25) NOT NULL,
Surname VARCHAR(30) NOT NULL,
Username VARCHAR(75) NOT NULL UNIQUE,
Password VARCHAR(20) NOT NULL,
Gender VARCHAR(10) 
)

CREATE TABLE Artists(
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(25) NOT NULL,
Surname VARCHAR(30) NOT NULL,
FullName AS (Name + ' ' + Surname) UNIQUE,
Birthday DATE,
Gender VARCHAR(10)
)
--mence mugenni adi yada legebi(soyadi ile birlikde) unikal olmalidir

CREATE TABLE Categories(
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(25) NOT NULL UNIQUE
)


CREATE TABLE Musics(
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(100) NOT NULL,
Duration INT NOT NULL,
MusicArtist INT FOREIGN KEY REFERENCES Artists(Id),
MusicCategory INT FOREIGN KEY REFERENCES Categories(Id)
)


CREATE TABLE PlayLists(
UserId INT FOREIGN KEY REFERENCES Users(Id),
MusicId INT FOREIGN KEY REFERENCES Musics(Id)
PRIMARY KEY(UserId,MusicId)
)




CREATE VIEW MusicInfo 
AS 
SELECT m.Name AS MusicName,m.Duration, c.Name AS CategoryName, a.Name AS ArtistName FROM Musics m
JOIN Categories c
ON m.MusicCategory = c.Id
JOIN Artists a 
ON m.MusicArtist = a.Id


CREATE PROCEDURE usp_GetPlayListById @Id INT
AS
SELECT * FROM MusicInfo
JOIN PlayLists AS p
ON p.UserId=@Id



EXEC usp_GetPlayListById 3





