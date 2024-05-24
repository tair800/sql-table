CREATE TABLE Elan (
    id INT PRIMARY KEY identity,
    Name VARCHAR(255),
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
    ElaveMelumat VARCHAR(255),
    BanId INT,
    ColorId INT,
    ModelId INT,
    YanacagId INT,
    IlId INT,
    MuherrikSizeId INT,
    TechizatId INT,
    PictureId INT,
    FOREIGN KEY (BanId) REFERENCES Ban_novu(id),
    FOREIGN KEY (ColorId) REFERENCES Color(id),
    FOREIGN KEY (ModelId) REFERENCES Model(id),
    FOREIGN KEY (YanacagId) REFERENCES Yanacag(id),
    FOREIGN KEY (IlId) REFERENCES Il(id),
    FOREIGN KEY (MuherrikSizeId) REFERENCES Muherrik(id),
    FOREIGN KEY (TechizatId) REFERENCES Techizat(id),
    FOREIGN KEY (PictureId) REFERENCES Picture(id)
);

INSERT INTO elan ( [name], yurush, price, sahib, oturucu, Suretler_qutusu, Bazar, HorsePower, Veziyyet, YerlerinSayi, Kredit_Barter, VinCode, ElaveMelumat)
VALUES 
('elanName1',1000,100,1,1,1,1,1000,1,1,1,100,'elave1'),
('elanName2',2000,200,2,2,2,2,2000,2,2,2,200,'elave2'),
('elanName3',3000,300,3,3,3,3,3000,3,3,3,300,'elave3'),
('elanName4',4000,400,4,4,4,4,4000,4,4,4,400,'elave4'),
('elanName5',5000,500,5,5,5,5,5000,5,5,5,500,'elave5');


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
join techizat on elan.id=techizat.id
join yanacag on elan.id=yanacag.id




