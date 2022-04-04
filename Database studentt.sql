create database Fakultet2019;
go
use Fakultet2019;
go

CREATE TABLE [dbo].[ispit] (
    [brojIndeksa] [nvarchar] (10) NOT NULL ,
    [idPredmeta] [int] NOT NULL ,
    [idNastavnika] [int] NOT NULL ,
    [datum] [datetime] NOT NULL ,
    [ocena] [tinyint] NOT NULL 
)

GO

CREATE TABLE [dbo].[katedra] (
    [idKatedre] [int] NOT NULL ,
    [naziv] [nvarchar] (30) NOT NULL 
) 

GO

CREATE TABLE [dbo].[mesto] (
    [ptt] [bigint] NOT NULL ,
    [naziv] [nvarchar] (30) NOT NULL 
)

GO

CREATE TABLE [dbo].[nastavnik] (
    [idNastavnika] [int] NOT NULL ,
    [ime] [nvarchar] (30) NOT NULL ,
    [prezime] [nvarchar] (30) NOT NULL ,
    [zvanje] [nvarchar] (30) NOT NULL ,
    [plata] [money] NULL ,
    [putniTrosak] [real] NULL ,
    [ptt] [bigint] NULL 
)

GO

CREATE TABLE [dbo].[predaje] (
    [idNastavnika] [int] NOT NULL ,
    [idPredmeta] [int] NOT NULL ,
    [brojCasova] [tinyint] NOT NULL 
)

GO

CREATE TABLE [dbo].[predmet] (
    [idPredmeta] [int] NOT NULL ,
    [nazivPredmeta] [nvarchar] (50) NOT NULL ,
    [idKatedre] [int] NOT NULL 
) 

GO

CREATE TABLE [dbo].[slusa] (
    [brojIndeksa] [nvarchar] (10) NOT NULL ,
    [idPredmeta] [int] NOT NULL 
) 

GO

CREATE TABLE [dbo].[student] (
    [brojIndeksa] [nvarchar] (10) NOT NULL ,
    [ime] [nvarchar] (30) NOT NULL ,
    [prezime] [nvarchar] (30) NOT NULL ,
    [adresa] [nvarchar] (30) NOT NULL ,
    [datumRodjenja] [datetime] NOT NULL ,
    [godStudija] [tinyint] NOT NULL ,
    [ptt] [bigint] NOT NULL 
)

GO

ALTER TABLE [dbo].[ispit] ADD 
    CONSTRAINT [PK_ispit] PRIMARY KEY  CLUSTERED 
    (
        [brojIndeksa],
        [idPredmeta]
    ) 
 
GO

ALTER TABLE [dbo].[katedra] ADD 
    CONSTRAINT [PK_katedra] PRIMARY KEY  CLUSTERED 
    (
        [idKatedre]
    )  

GO

ALTER TABLE [dbo].[mesto] ADD 
    CONSTRAINT [PK_mesto] PRIMARY KEY  CLUSTERED 
    (
        [ptt]
    )  

GO

ALTER TABLE [dbo].[nastavnik] ADD 
    CONSTRAINT [PK_nastavnik] PRIMARY KEY  CLUSTERED 
    (
        [idNastavnika]
    )  

GO

ALTER TABLE [dbo].[predaje] ADD 
    CONSTRAINT [PK_predaje] PRIMARY KEY  CLUSTERED 
    (
        [idNastavnika],
        [idPredmeta]
    ) 

GO

ALTER TABLE [dbo].[predmet] ADD 
    CONSTRAINT [PK_predmet] PRIMARY KEY  CLUSTERED 
    (
        [idPredmeta]
    ) 

GO

ALTER TABLE [dbo].[slusa] ADD 
    CONSTRAINT [PK_slusa] PRIMARY KEY  CLUSTERED 
    (
        [brojIndeksa],
        [idPredmeta]
    ) 

GO

ALTER TABLE [dbo].[student] ADD 
    CONSTRAINT [PK_student] PRIMARY KEY  CLUSTERED 
    (
        [brojIndeksa]
    )

GO


ALTER TABLE [dbo].[predmet] ADD 
    CONSTRAINT [AK_predmet] UNIQUE ([nazivPredmeta])

GO

ALTER TABLE [dbo].[predaje] ADD 
    CONSTRAINT [CK_predaje] CHECK ([brojCasova]>0)

GO

ALTER TABLE [dbo].[ispit] ADD 
    CONSTRAINT [DF_ispit] DEFAULT '6' FOR [ocena]

GO

ALTER TABLE [dbo].[ispit] ADD 
    CONSTRAINT [FK_ispit_predaje] FOREIGN KEY 
    (
        [idNastavnika],
        [idPredmeta]
    ) REFERENCES [dbo].[predaje] (
        [idNastavnika],
        [idPredmeta]
    )
      ON UPDATE NO ACTION
      ON DELETE NO ACTION,
    CONSTRAINT [FK_ispit_slusa] FOREIGN KEY 
    (
        [brojIndeksa],
        [idPredmeta]
    ) REFERENCES [dbo].[slusa] (
        [brojIndeksa],
        [idPredmeta]
    )
      ON UPDATE NO ACTION
      ON DELETE NO ACTION

GO

ALTER TABLE [dbo].[nastavnik] ADD 
    CONSTRAINT [FK_nastavnik_mesto] FOREIGN KEY 
    (
        [ptt]
    ) REFERENCES [dbo].[mesto] (
        [ptt]
    ) ON UPDATE CASCADE 
      ON DELETE NO ACTION
GO

ALTER TABLE [dbo].[predaje] ADD 
    CONSTRAINT [FK_predaje_nastavnik] FOREIGN KEY 
    (
        [idNastavnika]
    ) REFERENCES [dbo].[nastavnik] (
        [idNastavnika]
    ) ON UPDATE NO ACTION
      ON DELETE NO ACTION ,
    CONSTRAINT [FK_predaje_predmet] FOREIGN KEY 
    (
        [idPredmeta]
    ) REFERENCES [dbo].[predmet] (
        [idPredmeta]
    ) ON UPDATE NO ACTION
      ON DELETE NO ACTION
GO

ALTER TABLE [dbo].[predmet] ADD 
    CONSTRAINT [FK_predmet_katedra] FOREIGN KEY 
    (
        [idKatedre]
    ) REFERENCES [dbo].[katedra] (
        [idKatedre]
    ) ON UPDATE CASCADE 
      ON DELETE NO ACTION
      
GO

ALTER TABLE [dbo].[slusa] ADD 
    CONSTRAINT [FK_slusa_predmet] FOREIGN KEY 
    (
        [idPredmeta]
    ) REFERENCES [dbo].[predmet] (
        [idPredmeta]
    ) ON UPDATE NO ACTION
      ON DELETE NO ACTION ,
    CONSTRAINT [FK_slusa_student] FOREIGN KEY 
    (
        [brojIndeksa]
    ) REFERENCES [dbo].[student] (
        [brojIndeksa]
    ) ON UPDATE NO ACTION
      ON DELETE NO ACTION
GO

ALTER TABLE [dbo].[student] ADD 
    CONSTRAINT [FK_student_mesto] FOREIGN KEY 
    (
        [ptt]
    ) REFERENCES [dbo].[mesto] (
        [ptt]
    ) ON UPDATE CASCADE 
      ON DELETE NO ACTION
GO









INSERT INTO Mesto
VALUES(11000, 'Beograd')             
INSERT INTO Mesto
VALUES(13000,  'Pancevo')
INSERT INTO Mesto
VALUES(21000, 'Novi Sad')            
INSERT INTO Mesto
VALUES(23000, 'Zrenjanin')           
INSERT INTO Mesto
VALUES(23300, 'Kikinda')           
INSERT INTO Mesto
VALUES(18000, 'Nis')
INSERT INTO Mesto
VALUES(31000, 'Uzice')

INSERT INTO Katedra
VALUES(1, 'Katedra za osnovne discipline')
INSERT INTO Katedra
VALUES(2, 'Katedra za informatiku')
INSERT INTO Katedra
VALUES(3, 'Katedra za metodiku')
INSERT INTO Katedra
VALUES(4, 'Katedra za masinstvo')
INSERT INTO Katedra
VALUES(5, 'Katedra za menadzment')

INSERT INTO Nastavnik
VALUES(1, 'Petar', 'Hotomski', 'redovni profesor',25000,NULL,23000)
INSERT INTO Nastavnik
VALUES(2, 'Biljana', 'Radulovic', 'docent',22000,NULL,23000)
INSERT INTO Nastavnik
VALUES(3, 'Dusan', 'Malbaski', 'vanredni profesor',23300,2500,21000)
INSERT INTO Nastavnik
VALUES(4, 'Velimir', 'Sotirovic', 'redovni profesor',28000,2550,13000)
INSERT INTO Nastavnik
VALUES(5, 'Dragica', 'Radosav', 'vanredni profesor',22000,NULL,23000)
INSERT INTO Nastavnik
VALUES(6, 'Ivana', 'Berkovic', 'docent',23000,NULL,23000)
INSERT INTO Nastavnik
VALUES(7, 'Miodrag', 'Ivkovic', 'vanredni profesor',20000,3500,11000)
INSERT INTO Nastavnik
VALUES(8, 'Zarko', 'Mitrovic', 'redovni profesor',25000,NULL,23000)
INSERT INTO Nastavnik
VALUES(9, 'Zelimir', 'Branovic', 'vanredni profesor',19000,2200,18000)
INSERT INTO Nastavnik
VALUES(10, 'Dragan', 'Brankovic', 'akademik',59000,2200,11000)

INSERT INTO Predmet
VALUES(1, 'Baze podataka 1',2)
INSERT INTO Predmet
VALUES(2, 'Programski jezici I',2)
INSERT INTO Predmet
VALUES(3, 'Matematika I',1)
INSERT INTO Predmet
VALUES(4, 'Metodika informatike',3)
INSERT INTO Predmet
VALUES(5, 'Matematicka logika',2)
INSERT INTO Predmet
VALUES(6, 'Programski jezici II',2)
INSERT INTO Predmet
VALUES(7, 'Projektovanje ORS',3)
INSERT INTO Predmet
VALUES(8, 'Sistemi vetaske inteligencije',2)
INSERT INTO Predmet
VALUES(9, 'Matematika II',1)
INSERT INTO Predmet
VALUES(10, 'Projektovanje IS',2)
INSERT INTO Predmet
VALUES(11, 'Informacioni sistemi',2)
INSERT INTO Predmet
VALUES(12, 'Racunarska grafika',2)
INSERT INTO Predmet
VALUES(13, 'Operativni sistemi',2)
INSERT INTO Predmet
VALUES(14, 'Elektronsko poslovanje',2)
INSERT INTO Predmet
VALUES(15, 'Multimedijalni sistemi i servisi',2)
INSERT INTO Predmet
VALUES(16, 'Baze podataka 2',2)


INSERT INTO Student
VALUES('004/98-02', 'Jovana', 'Maljokovic', 'Narodnog Fronta 33', '10/18/1977',5,11000)
INSERT INTO Student
VALUES('007/00-02', 'Goran', 'Cuk', 'Perleska 55', '05/18/1981',3,23000)
INSERT INTO Student
VALUES('011/98-02', 'Jovan', 'Anastasijevic', 'Rade Koncara 33', '01/18/1981',4,21000)
INSERT INTO Student
VALUES('014/98-02', 'Jovanka', 'Petrovic', 'Skadarska 67', '12/12/1977',4,23000)
INSERT INTO Student
VALUES('022/01-02', 'Milica', 'Pajevic', 'Pere Ognjenova 2', '09/14/1979',2,21000)
INSERT INTO Student
VALUES('033/00-01', 'Miljana', 'Grasilovic', 'Kovinska bb', '07/24/1981',3,13000)
INSERT INTO Student
VALUES('044/00-01', 'Tijana', 'Vujanac', 'Zarka Zrenjanina 4', '12/12/1981',3,23000)
INSERT INTO Student
VALUES('078/02-01', 'Novica', 'Bogovic', 'Nemanjina 45a', '12/14/1982',1,31000)
INSERT INTO Student
VALUES('101/00-01', 'Jovan', 'Adamov', 'Jovana Cvijica 42', '08/12/1980',2,11000)
INSERT INTO Student
VALUES('115/01-01', 'Goran', 'Dabic', 'Nepoznatog junaka bb', '07/15/1978',3,23000)
INSERT INTO Student
VALUES('150/98-01', 'Predrag', 'Pajovic', 'Zelenog polja 58', '12/01/1978',5,23000)


INSERT INTO Slusa
VALUES('004/98-02',1)
INSERT INTO Slusa
VALUES('004/98-02',2)
INSERT INTO Slusa
VALUES('004/98-02',3)
INSERT INTO Slusa
VALUES('004/98-02',5)
INSERT INTO Slusa
VALUES('004/98-02',6)
INSERT INTO Slusa
VALUES('004/98-02',8)
INSERT INTO Slusa
VALUES('004/98-02',9)
INSERT INTO Slusa
VALUES('004/98-02',10)
INSERT INTO Slusa
VALUES('004/98-02',11)
INSERT INTO Slusa
VALUES('004/98-02',12)
INSERT INTO Slusa
VALUES('004/98-02',13)
INSERT INTO Slusa
VALUES('004/98-02',14)
INSERT INTO Slusa
VALUES('004/98-02',15)
INSERT INTO Slusa
VALUES('007/00-02',1)
INSERT INTO Slusa
VALUES('007/00-02',2)
INSERT INTO Slusa
VALUES('007/00-02',3)
INSERT INTO Slusa
VALUES('007/00-02',5)
INSERT INTO Slusa
VALUES('007/00-02',6)
INSERT INTO Slusa
VALUES('007/00-02',8)
INSERT INTO Slusa
VALUES('007/00-02',9)
INSERT INTO Slusa
VALUES('007/00-02',12)
INSERT INTO Slusa
VALUES('007/00-02',13)
INSERT INTO Slusa
VALUES('011/98-02',1)
INSERT INTO Slusa
VALUES('011/98-02',2)
INSERT INTO Slusa
VALUES('011/98-02',3)
INSERT INTO Slusa
VALUES('011/98-02',4)
INSERT INTO Slusa
VALUES('011/98-02',5)
INSERT INTO Slusa
VALUES('011/98-02',6)
INSERT INTO Slusa
VALUES('011/98-02',7)
INSERT INTO Slusa
VALUES('011/98-02',8)
INSERT INTO Slusa
VALUES('011/98-02',9)
INSERT INTO Slusa
VALUES('011/98-02',11)
INSERT INTO Slusa
VALUES('011/98-02',12)
INSERT INTO Slusa
VALUES('011/98-02',13)
INSERT INTO Slusa
VALUES('011/98-02',15)
INSERT INTO Slusa
VALUES('014/98-02',1)
INSERT INTO Slusa
VALUES('014/98-02',2)
INSERT INTO Slusa
VALUES('014/98-02',3)
INSERT INTO Slusa
VALUES('014/98-02',4)
INSERT INTO Slusa
VALUES('014/98-02',5)
INSERT INTO Slusa
VALUES('014/98-02',6)
INSERT INTO Slusa
VALUES('014/98-02',7)
INSERT INTO Slusa
VALUES('014/98-02',8)
INSERT INTO Slusa
VALUES('014/98-02',9)
INSERT INTO Slusa
VALUES('014/98-02',11)
INSERT INTO Slusa
VALUES('014/98-02',12)
INSERT INTO Slusa
VALUES('014/98-02',13)
INSERT INTO Slusa
VALUES('014/98-02',15)
INSERT INTO Slusa
VALUES('022/01-02',1)
INSERT INTO Slusa
VALUES('022/01-02',2)
INSERT INTO Slusa
VALUES('022/01-02',3)
INSERT INTO Slusa
VALUES('022/01-02',5)
INSERT INTO Slusa
VALUES('022/01-02',9)
INSERT INTO Slusa
VALUES('033/00-01',1)
INSERT INTO Slusa
VALUES('033/00-01',2)
INSERT INTO Slusa
VALUES('033/00-01',3)
INSERT INTO Slusa
VALUES('033/00-01',5)
INSERT INTO Slusa
VALUES('033/00-01',6)
INSERT INTO Slusa
VALUES('033/00-01',8)
INSERT INTO Slusa
VALUES('033/00-01',9)
INSERT INTO Slusa
VALUES('033/00-01',12)
INSERT INTO Slusa
VALUES('033/00-01',13)
INSERT INTO Slusa
VALUES('044/00-01',1)
INSERT INTO Slusa
VALUES('044/00-01',2)
INSERT INTO Slusa
VALUES('044/00-01',3)
INSERT INTO Slusa
VALUES('044/00-01',5)
INSERT INTO Slusa
VALUES('044/00-01',6)
INSERT INTO Slusa
VALUES('044/00-01',8)
INSERT INTO Slusa
VALUES('044/00-01',9)
INSERT INTO Slusa
VALUES('044/00-01',12)
INSERT INTO Slusa
VALUES('044/00-01',13)
INSERT INTO Slusa
VALUES('078/02-01',3)
INSERT INTO Slusa
VALUES('078/02-01',5)
INSERT INTO Slusa
VALUES('101/00-01',1)
INSERT INTO Slusa
VALUES('101/00-01',2)
INSERT INTO Slusa
VALUES('101/00-01',3)
INSERT INTO Slusa
VALUES('101/00-01',5)
INSERT INTO Slusa
VALUES('101/00-01',9)
INSERT INTO Slusa
VALUES('115/01-01',1)
INSERT INTO Slusa
VALUES('115/01-01',2)
INSERT INTO Slusa
VALUES('115/01-01',3)
INSERT INTO Slusa
VALUES('115/01-01',5)
INSERT INTO Slusa
VALUES('115/01-01',6)
INSERT INTO Slusa
VALUES('115/01-01',8)
INSERT INTO Slusa
VALUES('115/01-01',9)
INSERT INTO Slusa
VALUES('115/01-01',12)
INSERT INTO Slusa
VALUES('115/01-01',13)
INSERT INTO Slusa
VALUES('150/98-01',1)
INSERT INTO Slusa
VALUES('150/98-01',2)
INSERT INTO Slusa
VALUES('150/98-01',3)
INSERT INTO Slusa
VALUES('150/98-01',5)
INSERT INTO Slusa
VALUES('150/98-01',6)
INSERT INTO Slusa
VALUES('150/98-01',8)
INSERT INTO Slusa
VALUES('150/98-01',9)
INSERT INTO Slusa
VALUES('150/98-01',10)
INSERT INTO Slusa
VALUES('150/98-01',11)
INSERT INTO Slusa
VALUES('150/98-01',12)
INSERT INTO Slusa
VALUES('150/98-01',13)
INSERT INTO Slusa
VALUES('150/98-01',14)


INSERT INTO Predaje
VALUES(1,5,2)
INSERT INTO Predaje
VALUES(1,8,2)
INSERT INTO Predaje
VALUES(2,1,2)
INSERT INTO Predaje
VALUES(2,11,2)
INSERT INTO Predaje
VALUES(3,2,3)
INSERT INTO Predaje
VALUES(3,6,3)
INSERT INTO Predaje
VALUES(4,4,2)
INSERT INTO Predaje
VALUES(4,10,4)
INSERT INTO Predaje
VALUES(5,7,2)
INSERT INTO Predaje
VALUES(6,12,2)
INSERT INTO Predaje
VALUES(7,14,2)
INSERT INTO Predaje
VALUES(8,3,2)
INSERT INTO Predaje
VALUES(8,9,2)
INSERT INTO Predaje
VALUES(9,13,3)
INSERT INTO Predaje
VALUES(9,15,2)


INSERT INTO Ispit
VALUES('004/98-02',1,2, '6/18/1999',6)
INSERT INTO Ispit
VALUES('004/98-02',2,3, '12/24/2002',10)
INSERT INTO Ispit
VALUES('004/98-02',9,8, '06/06/2007',6)
INSERT INTO Ispit
VALUES('007/00-02',1,2, '06/20/2002',7)
INSERT INTO Ispit
VALUES('007/00-02',9,8, '06/06/2007',6)
INSERT INTO Ispit
VALUES('011/98-02',1,2, '9/30/2001',10)
INSERT INTO Ispit
VALUES('011/98-02',9,8, '06/06/2007',10)
INSERT INTO Ispit
VALUES('014/98-02',1,2, '9/30/2001',9)
INSERT INTO Ispit
VALUES('033/00-01',1,2, '9/15/2001' ,9)
INSERT INTO Ispit
VALUES('044/00-01',1,2, '9/15/2001' ,8)
INSERT INTO Ispit
VALUES('150/98-01',1,2, '6/18/1999',6)
INSERT INTO Ispit
VALUES('150/98-01',14,7, '2/10/2010',10)


SELECT * FROM ispit
SELECT * FROM predaje
SELECT * FROM predmet
SELECT * FROM slusa
SELECT * FROM student
SELECT * FROM nastavnik

--2 ZADATAK
SELECT S.IME + S.PREZIME AS [IME I PREZIME] FROM student S INNER JOIN
slusa ss ON S.brojIndeksa = SS.brojIndeksa AND SS.idPredmeta = 1

--3 ZADATAK
SELECT P.NAZIVPREDMETA, COUNT(brojIndeksa) AS [BROJ STUDENATA] FROM predmet P INNER JOIN ISPIT I
ON P.idPredmeta = I.idPredmeta WHERE OCENA > 5 GROUP BY nazivPredmeta



--4 ZADATAK
CREATE PROCEDURE IZDVOJI
AS
BEGIN
SELECT S.BROJINDEKSA, S.IME + S.PREZIME AS [IME I PREZIME], AVG(I.OCENA) AS [PROSECNA OCENA], COUNT(I.brojIndeksa) 
FROM STUDENT S
INNER JOIN ISPIT I
ON S.brojIndeksa = I.brojIndeksa group by ime, prezime, S.brojIndeksa HAVING AVG(I.OCENA) > 8
END 
EXECUTE IZDVOJI