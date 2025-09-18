CREATE DATABASE ViewExample
USE ViewExample

CREATE TABLE Users(
Id INT PRIMARY KEY IDENTITY, 
Name NVARCHAR(50) NOT NULL,
Surname NVARCHAR(50) NOT NULL,
Username VARCHAR(50) UNIQUE NOT NULL,
Password VARCHAR(25) NOT NULL,
Gender VARCHAR(10) NOT NULL
)

CREATE TABLE Artists(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(50) NOT NULL,
Surname NVARCHAR(50) NOT NULL,
Birthday DATE,
Gender VARCHAR(10)
)

CREATE TABLE Categories(
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(25) NOT NULL
)

CREATE TABLE Musics(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(50),
Duration INT,
MusicCategory INT  FOREIGN KEY REFERENCES Categories(Id),
MusicArtist INT FOREIGN KEY REFERENCES Artists(Id)
);


CREATE TABLE PlayLists(
UserId INT FOREIGN KEY REFERENCES Users(Id),
MusicId INT FOREIGN KEY REFERENCES Musics(Id)
)


CREATE VIEW MusicInfo 
AS 
SELECT m.Id	,m.Name AS MusicName,m.Duration, c.Name AS CategoryName, a.Name AS ArtistName FROM Musics m
JOIN Categories c
ON m.MusicCategory = c.Id
JOIN Artists a 
ON m.MusicArtist = a.Id










CREATE PROCEDURE usp_GetMusicsById @Id INT 
AS 
SELECT m.Name FROM PlayLists p
JOIN Musics m 
ON p.MusicId=m.Id
WHERE p.UserId=@Id
































