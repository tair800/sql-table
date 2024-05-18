create database turboAz

CREATE TABLE Techizat (
    id int PRIMARY KEY IDENTITY,
    [Name] int
);

CREATE TABLE elanTechizat(
id int primary key identity,
TechizatId int REFERENCES techizat(id),
ELanId int REFERENCES elan(id)
)

CREATE TABLE Picture (
    id int PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(255)
);

CREATE TABLE Yanacag (
    id int PRIMARY KEY IDENTITY,
    [Name] int
);

CREATE TABLE Il (
    id int PRIMARY KEY IDENTITY,
    Age int
);

CREATE TABLE Muherrik (
    id int PRIMARY KEY IDENTITY,
    Size int
);

CREATE TABLE Ban_novu (
    id int PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(255)
);

CREATE TABLE Color (
    id int PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(255)
);

CREATE TABLE Marka (
    id int PRIMARY KEY IDENTITY,
    Name VARCHAR(255) UNIQUE
);

CREATE TABLE Model (
    id int PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(255),
    MarkaId int REFERENCES Marka(id)
);

CREATE TABLE Elan (
    id INT PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(255),
    Yurush INT,
    Price INT,
    Sahib INT,
    Oturucu INT,
    Suretler_qutusu INT,
    Bazar INT,
    HorsePower INT,
    Veziyyet INT,
    YerlerinSayi INT,
    Kredit_Barter INT,
    VinCode INT UNIQUE,
    ElaveMelumat TEXT,
    PictureId INT REFERENCES Picture(id),
    YanacagId INT REFERENCES Yanacag(id),
    Ilid INT REFERENCES Il(id),
    MuherrikId INT REFERENCES Muherrik(id),
    Banid INT REFERENCES Ban_novu(id),
    ColorId INT REFERENCES Color(id),
    ModelId INT REFERENCES Model(id),
    TechizatId INT REFERENCES Techizat(id)
);

INSERT INTO Techizat ([Name]) VALUES (1);
INSERT INTO Techizat ([Name]) VALUES (2);
INSERT INTO Techizat ([Name]) VALUES (3);
INSERT INTO Techizat ([Name]) VALUES (4);
INSERT INTO Techizat ([Name]) VALUES (5);

INSERT INTO Picture ([Name]) VALUES ('Picture 1');
INSERT INTO Picture ([Name]) VALUES ('Picture 2');
INSERT INTO Picture ([Name]) VALUES ('Picture 3');
INSERT INTO Picture ([Name]) VALUES ('Picture 4');
INSERT INTO Picture ([Name]) VALUES ('Picture 5');

INSERT INTO Yanacag ([Name]) VALUES (1);
INSERT INTO Yanacag ([Name]) VALUES (2);
INSERT INTO Yanacag ([Name]) VALUES (3);
INSERT INTO Yanacag ([Name]) VALUES (4);
INSERT INTO Yanacag ([Name]) VALUES (5);

INSERT INTO Il (Age) VALUES (20);
INSERT INTO Il (Age) VALUES (25);
INSERT INTO Il (Age) VALUES (30);
INSERT INTO Il (Age) VALUES (35);
INSERT INTO Il (Age) VALUES (40);

INSERT INTO Muherrik (Size) VALUES (100);
INSERT INTO Muherrik (Size) VALUES (200);
INSERT INTO Muherrik (Size) VALUES (300);
INSERT INTO Muherrik (Size) VALUES (400);
INSERT INTO Muherrik (Size) VALUES (500);

INSERT INTO Ban_novu ([Name]) VALUES ('Ban 1');
INSERT INTO Ban_novu ([Name]) VALUES ('Ban 2');
INSERT INTO Ban_novu ([Name]) VALUES ('Ban 3');
INSERT INTO Ban_novu ([Name]) VALUES ('Ban 4');
INSERT INTO Ban_novu ([Name]) VALUES ('Ban 5');

INSERT INTO Color ([Name]) VALUES ('Color 1');
INSERT INTO Color ([Name]) VALUES ('Color 2');
INSERT INTO Color ([Name]) VALUES ('Color 3');
INSERT INTO Color ([Name]) VALUES ('Color 4');
INSERT INTO Color ([Name]) VALUES ('Color 5');

INSERT INTO Marka (Name) VALUES ('Brand 1');
INSERT INTO Marka (Name) VALUES ('Brand 2');
INSERT INTO Marka (Name) VALUES ('Brand 3');
INSERT INTO Marka (Name) VALUES ('Brand 4');
INSERT INTO Marka (Name) VALUES ('Brand 5');

INSERT INTO Model ([Name], MarkaId) VALUES ('Model 1', 1);
INSERT INTO Model ([Name], MarkaId) VALUES ('Model 2', 2);
INSERT INTO Model ([Name], MarkaId) VALUES ('Model 3', 3);
INSERT INTO Model ([Name], MarkaId) VALUES ('Model 4', 4);
INSERT INTO Model ([Name], MarkaId) VALUES ('Model 5', 5);

INSERT INTO Elan ([Name], Yurush, Price, Sahib, Oturucu, Suretler_qutusu, Bazar, HorsePower, Veziyyet, YerlerinSayi, Kredit_Barter, VinCode, ElaveMelumat) 
VALUES 
('Car 1', 100, 5000, 1, 1, 5, 1, 200, 1, 4, 1, 123456, 'Additional information 1'),
('Car 2', 120, 6000, 2, 1, 6, 1, 220, 2, 5, 0, 654321, 'Additional information 2'),
('Car 3', 130, 7000, 3, 1, 7, 1, 240, 3, 6, 1, 987654, 'Additional information 3'),
('Car 4', 140, 8000, 4, 1, 8, 1, 260, 4, 7, 0, 456789, 'Additional information 4'),
('Car 5', 150, 9000, 5, 1, 9, 1, 280, 5, 8, 1, 789123, 'Additional information 5');


select elan.id elanId,elan.name elanName,elan.yurush elanYurush,elan.price elanPrice,elan.sahib elanSahib,elan.oturucu elanOturucu,elan.Suretler_qutusu SuretQutusu,
elan.Bazar elanBazar,elan.HorsePower horsepower,elan.Veziyyet elanVeziyyet,elan.YerlerinSayi yerSayi,elan.Kredit_Barter elanKredit,elan.VinCode elanVincode,elan.ElaveMelumat elanMelumat ,
Ban_novu.Name banName,color.name colorName,il.Age age,marka.name markaName,Muherrik.size muherrikSize,
picture.name picName,Techizat.name techizatName,Yanacag.name yanacagName  FROM elan
join Ban_novu on elan.id=Ban_novu.id
join color on elan.id=color.id
join il on elan.id=il.id
join marka on elan.id=marka.id
join muherrik on elan.id=Muherrik.id
join picture on elan.id=picture.id
join yanacag on elan.id=yanacag.id
join elanTechizat et on elan.id=et.ELanId
join Techizat on et.TechizatId=Techizat.id
