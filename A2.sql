/* PART1 */

CREATE TABLE JOURNAL(
ISSN char(15) NOT NULL,
Publisher varchar(32) NULL,
CONSTRAINT PK_JOURNAL PRIMARY KEY(ISSN)
);

CREATE TABLE JOURNAL_NAME(
ISSN char(15) NOT NULL,
DateFrom date NOT NULL,
Name varchar(64) NULL,
CONSTRAINT PK_JOURNAL_NAME PRIMARY KEY(ISSN,DateFrom),
CONSTRAINT FK_JOURNAL_NAME FOREIGN KEY(ISSN) REFERENCES JOURNAL(ISSN)
ON UPDATE CASCADE
ON DELETE CASCADE,
);

CREATE TABLE IMPACT_FACTOR(
ISSN char(15) NOT NULL,
Year int NOT NULL,
Impact_Factor numeric NULL,
CONSTRAINT PK_IMPACT_FACTOR PRIMARY KEY(ISSN,Year),
CONSTRAINT FK_IMPACT_FACTOR FOREIGN KEY(ISSN) REFERENCES JOURNAL(ISSN)
ON UPDATE CASCADE
ON DELETE CASCADE,
);

CREATE TABLE RESEARCHER(
ResearcherID varchar(66) NOT NULL,
FamilyName varchar(64) NULL,
GivenName varchar(64) NULL,
Title varchar(16) NULL,
CONSTRAINT PK_RESEARCHER PRIMARY KEY(ResearcherID)
);

CREATE TABLE RESEARCHER_CONTACT(
ResearcherID varchar(66) NOT NULL,
ContactDetail varchar(64) NOT NULL,
ContactType varchar(64) NOT NULL,
CONSTRAINT PK_RESEARCHER_CONTACT PRIMARY KEY(ResearcherID,ContactDetail),
CONSTRAINT FK_RESEARCHER_CONTACT FOREIGN KEY(ResearcherID) REFERENCES RESEARCHER(ResearcherID)
ON UPDATE CASCADE
ON DELETE CASCADE,
);

CREATE TABLE INSTITUTION(
InstitutionID int NOT NULL,
Name varchar(64) NULL,
Country varchar(64) NULL,
CONSTRAINT PK_INSTITUTION PRIMARY KEY(InstitutionID)
);

CREATE TABLE RESEARCHER_INSTITUTION(
InstitutionID int NOT NULL,
ResearcherID varchar(66) NOT NULL,
DateCommenced date NULL,
CONSTRAINT PK_RESEARCHER_INSTITUTION PRIMARY KEY(InstitutionID,ResearcherID),
CONSTRAINT FK1_RESEARCHER_INSTITUTION FOREIGN KEY(InstitutionID) REFERENCES INSTITUTION(InstitutionID)
ON UPDATE CASCADE
ON DELETE CASCADE,
CONSTRAINT FK2_RESEARCHER_INSTITUTION FOREIGN KEY(ResearcherID) REFERENCES RESEARCHER(ResearcherID)
ON UPDATE CASCADE
ON DELETE CASCADE,
);

CREATE TABLE PAPER(
DOI varchar(25) NOT NULL,
ISSN char(15) NOT NULL,
Title varchar(256) NULL,
Volume int NULL,
Issue int NULL,
Pages varchar(12) NULL,
Year int NULL,
CONSTRAINT PK_PAPER PRIMARY KEY(DOI),
CONSTRAINT FK_ISSN FOREIGN KEY(ISSN) REFERENCES JOURNAL(ISSN)
ON UPDATE CASCADE
ON DELETE CASCADE,
);

CREATE TABLE RESEARCHER_PAPER(
ResearcherID varchar(66) NOT NULL,
DOI varchar(25) NOT NULL,
CONSTRAINT PK_RESEARCHER_PAPER PRIMARY KEY(ResearcherID,DOI),
CONSTRAINT FK1_RESEARCHER_PAPER FOREIGN KEY(ResearcherID) REFERENCES RESEARCHER(ResearcherID)
ON UPDATE CASCADE
ON DELETE CASCADE,
CONSTRAINT FK2_RESEARCHER_PAPER FOREIGN KEY(DOI) REFERENCES PAPER(DOI)
ON UPDATE CASCADE
ON DELETE CASCADE,
);

CREATE TABLE FIELD_OF_STUDY(
FieldCode varchar(12) NOT NULL,
Name varchar(64) NULL,
Description text NULL,
CONSTRAINT PK_FIELD_OF_STUDY PRIMARY KEY(FieldCode)
);

CREATE TABLE RESEARCHER_FIELD_OF_STUDY(
ResearcherID varchar(66) NOT NULL,
FieldCode varchar(12) NOT NULL,
CONSTRAINT PK_RESEARCHER_FIELD_OF_STUDY PRIMARY KEY(ResearcherID,FieldCode),
CONSTRAINT FK1_RESEARCHER_FIELD_OF_STUDY FOREIGN KEY(ResearcherID) REFERENCES RESEARCHER(ResearcherID)
ON UPDATE CASCADE
ON DELETE CASCADE,
CONSTRAINT FK2_RESEARCHER_FIELD_OF_STUDY FOREIGN KEY(FieldCode) REFERENCES FIELD_OF_STUDY(FieldCode)
ON UPDATE CASCADE
ON DELETE CASCADE,
);

CREATE TABLE JOURNAL_FIELD_OF_STUDY(
ISSN char(15) NOT NULL,
FieldCode varchar(12) NOT NULL,
CONSTRAINT PK_JOURNAL_FIELD_OF_STUDY PRIMARY KEY(ISSN,FieldCode),
CONSTRAINT FK1_JOURNAL_FIELD_OF_STUDY FOREIGN KEY(ISSN) REFERENCES JOURNAL(ISSN)
ON UPDATE CASCADE
ON DELETE CASCADE,
CONSTRAINT FK2_JOURNAL_FIELD_OF_STUDY FOREIGN KEY(FieldCode) REFERENCES FIELD_OF_STUDY(FieldCode)
ON UPDATE CASCADE
ON DELETE CASCADE,
);

/* PART2 */


INSERT INTO JOURNAL(ISSN,Publisher)
VALUES
('077279032753885','Pearson'),
('519097553661571','Penguin'),
('747720856053957','Oxford'),
('330882717968629','Macmillan'),
('493364545058584','Collin'),
('347712999596800','Simon & Schuster'),
('618117148871215','Penguin'),
('197872640314800','Macmillan'),
('535436529379586','Penguin'),
('001969291568048','Oxford');

INSERT INTO JOURNAL_NAME(ISSN,DateFrom,Name)
VALUES 
('077279032753885','2012-02-01','Introduction to biology'),
('519097553661571','2014-10-03','Fundamental of chemistry'),
('747720856053957','2010-10-12','Psychology of children'),
('330882717968629','2017-11-02','geology of africa'),
('493364545058584','2018-11-11','Advanced Anatomy of head'),
('347712999596800','2016-06-24','Zoology'),
('618117148871215','2012-02-04','Introduction to forensic'),
('197872640314800','2017-03-05','Biochemistry'),
('535436529379586','2018-08-09','English grammar'),
('001969291568048','2019-08-07','Programming with python');


INSERT INTO IMPACT_FACTOR(ISSN,Year,Impact_Factor)
VALUES 
('077279032753885',2012,9),
('519097553661571',2014,6),
('747720856053957',2010,7),
('330882717968629',2017,8),
('493364545058584',2018,9),
('347712999596800',2016,7),
('618117148871215',2012,5),
('197872640314800',2017,7),
('535436529379586',2018,7),
('001969291568048',2019,8);

INSERT INTO RESEARCHER(ResearcherID,FamilyName,GivenName,Title)
VALUES
('123456','Billie','Kuhens','Dr'),
('765439','Glenn','Matthies','Dr'),
('734563','Hudson','Toniatti','Dr'),
('937648','Jessie','ritz','Dr'),
('722345','Marcus','Wasilewski','Dr'),
('234988','Clifford','Camps','Dr'),
('837497','Jared','Dasen','Dr'),
('328946','Landon','Kothenbeutel','Dr'),
('123443','Mario','Langholdt','Dr'),
('465435','Sydney','Senter','Dr');

INSERT INTO RESEARCHER_CONTACT(ResearcherID,ContactDetail,ContactType)
VALUES
('123456','BillisKuhens@gmail.com','E-mail'),
('765439','GlennMatthies@gmail.com','E-mail'),
('734563','HudsonToniatti@gmail.com','E-mail'),
('937648','Jessieritz@gmail.com','E-mail'),
('722345','MarcusWasilewski@gmail.com','E-mail'),
('234988','CliffordCamps@gmail.com','E-mail'),
('837497','JaredDasen@gmail.com','E-mail'),
('328946','LandonKothenbeutel@gmail.com','E-mail'),
('123443','MarioLangholdt@gmail.com','E-mail'),
('465435','SydneySenter@gmail.com','E-mail'),
('123456','022847638','Phone'),
('765439','024487383','Phone'),
('734563','022834745','Phone'),
('937648','023308483','Phone'),
('722345','022937486','Phone');

INSERT INTO INSTITUTION(InstitutionID,Name,Country)
VALUES
(987653,'Northshore University','New zealand'),
(347665,'Auckland University of Technology','New zealand'),
(746358,'Massey University','New zealand'),
(876537,'University of Otago','New zealand'),
(938467,'University of Sydney','Australia'),
(736383,'University of Queensland','Australia'),
(625362,'Stanford University','USA'),
(837632,'Princeton University','USA');


INSERT INTO RESEARCHER_INSTITUTION(ResearcherID,InstitutionID,DateCommenced)
VALUES
('123456',987653,'2012-03-03'),
('765439',987653,'2011-04-05'),
('734563',987653,'2002-01-02'),
('937648',736383,'2001-02-09'),
('722345',736383,'2001-09-01'),
('234988',987653,'2003-09-02'),
('837497',625362,'2002-09-08'),
('328946',347665,'2001-09-09'),
('123443',746358,'2005-08-05'),
('465435',746358,'2007-08-09');

INSERT INTO PAPER(DOI,ISSN,Title,Volume,Issue,Pages,Year)
VALUES
('10.1037/rmh0000008','077279032753885','Reptile',2,5,'80-95',2012),
('10.1027/rmh0030008','519097553661571','Acid',NULL,NULL,'20-47',2014),
('10.1027/rmh0030009','747720856053957','Newborn Child',NULL,NULL,'38-98',2010),
('10.1027/rmh0230002','330882717968629','Nigeria',NULL,NULL,'78-98',2017),
('10.1027/rmh0230004','493364545058584','Lower jaw',NULL,NULL,'102-108',2018),
('10.1027/rmh0230507','347712999596800','Frog',NULL,NULL,'78-79',2016),
('10.1027/rmh0230604','618117148871215','tools',NULL,NULL,'87-96',2012),
('10.1027/rmh0237006','197872640314800','amine acid',NULL,NULL,'76-78',2017),
('10.1027/rmh0247005','535436529379586','Future tense',NULL,NULL,'81-98',2018),
('10.1027/rmh0257009','001969291568048','Nested Loop',NULL,NULL,'150-190',2019);

INSERT INTO RESEARCHER_PAPER(ResearcherID,DOI)
VALUES 
('123456','10.1037/rmh0000008'), /*BIOLOGY*/
('765439','10.1027/rmh0030008'), /*CHEMISTRY*/
('734563','10.1027/rmh0030009'), /*PSYCHOLOGY*/
('937648','10.1027/rmh0230002'), /*GEOLOGY*/
('722345','10.1027/rmh0230004'), /*ANATOMY*/
('234988','10.1027/rmh0230507'), /*ZOO*/
('837497','10.1027/rmh0230604'), /*CHEMISTRY*/
('328946','10.1027/rmh0237006'), /*CHEMISTRY*/
('123443','10.1027/rmh0247005'), /*LANGUAGE*/
('465435','10.1027/rmh0257009'); /*COMPUTER SCIENCE*/

INSERT INTO FIELD_OF_STUDY(FieldCode,Name,Description)
VALUES 
/*('HUM01','ART','study about visual art(drawing, painting) and performance art(dancing,singing).'),*/
('HUM02','HISTORY','study about timeline of each country, war, evolution, culture, technology....etc.'),
('HUM03','LAW','study about legal matter and solve the conflict that happen everyday.'),
('HUM04','PHYLOSOPHY','stuy about logic, theory and vision of phylosopher.'),
('SOC01','ANTHROPOLOGY','study about culture and evolution of specific region.'),
('SOC02','BUSINESS','study about business'),
('SOC03','POLITICAL','study about political science'),
('SOC04','PSYCOLOGY','study about psychology'),
('NAT01','BIOLOGY','study about bioloy'),
('NAT02','CHEMISTRY','study about chemistry'),
('NAT03','PHYSICS','study about physic'),
('NAT04','GEOLOGY','study about geology'),
('FOR01','COMPUTER SCIENCE','study about computer'),
('FOR02','MATHMATIC','study about math'),
('FOR03','MEDICINE AND HEALTH','study aobut medicine');

INSERT INTO RESEARCHER_FIELD_OF_STUDY(ResearcherID,FieldCode)
VALUES
('123456','NAT01'),
('765439','NAT02'),
('734563','SOC04'),
('937648','HUM02'),
('722345','FOR03'),
('234988','FOR03'),
('837497','NAT02'),
('328946','NAT02'),
('123443','SOC02'),
('465435','FOR01');

INSERT INTO JOURNAL_FIELD_OF_STUDY(ISSN,FieldCode)
VALUES
('077279032753885','NAT01'),
('519097553661571','NAT02'),
('747720856053957','SOC04'),
('330882717968629','HUM02'),
('493364545058584','FOR03'),
('347712999596800','FOR03'),
('618117148871215','NAT02'),
('197872640314800','NAT02'),
('535436529379586','SOC02'),
('001969291568048','FOR01');

/* PART3 */

/*A*/

SELECT RESEARCHER.GivenName, RESEARCHER.FamilyName, RESEARCHER.Title, RESEARCHER_FIELD_OF_STUDY.FieldCode, FIELD_OF_STUDY.Name
FROM RESEARCHER
INNER JOIN RESEARCHER_FIELD_OF_STUDY
ON RESEARCHER.ResearcherID = RESEARCHER_FIELD_OF_STUDY.ResearcherID
INNER JOIN FIELD_OF_STUDY
ON RESEARCHER_FIELD_OF_STUDY.FieldCode = FIELD_OF_STUDY.FieldCode
WHERE FIELD_OF_STUDY.Name = 'CHEMISTRY';


/*B*/

SELECT PAPER.Title, PAPER.DOI, RESEARCHER.GivenName, RESEARCHER.FamilyName,INSTITUTION.Name
FROM PAPER
INNER JOIN RESEARCHER_PAPER
ON PAPER.DOI = RESEARCHER_PAPER.DOI
INNER JOIN RESEARCHER
ON RESEARCHER_PAPER.ResearcherID = RESEARCHER.ResearcherID
INNER JOIN RESEARCHER_INSTITUTION
ON RESEARCHER.ResearcherID = RESEARCHER_INSTITUTION.ResearcherID
INNER JOIN INSTITUTION
ON RESEARCHER_INSTITUTION.InstitutionID = INSTITUTION.InstitutionID;

/*C*/

SELECT PAPER.Title, JOURNAL.Publisher, FIELD_OF_STUDY.Name
FROM PAPER
INNER JOIN JOURNAL
ON PAPER.ISSN = JOURNAL.ISSN
INNER JOIN JOURNAL_FIELD_OF_STUDY
ON JOURNAL.ISSN = JOURNAL_FIELD_OF_STUDY.ISSN
INNER JOIN FIELD_OF_STUDY
ON JOURNAL_FIELD_OF_STUDY.FieldCode = FIELD_OF_STUDY.FieldCode
WHERE FIELD_OF_STUDY.Name = 'CHEMISTRY';

/*D*/

SELECT AVG(IMPACT_FACTOR.Impact_Factor) as Average_Impact_Factor_of_NorthShoreUniversity
FROM IMPACT_FACTOR
INNER JOIN JOURNAL
ON IMPACT_FACTOR.ISSN = JOURNAL.ISSN
INNER JOIN PAPER
ON JOURNAL.ISSN = PAPER.ISSN
INNER JOIN RESEARCHER_PAPER
ON PAPER.DOI = RESEARCHER_PAPER.DOI
INNER JOIN RESEARCHER
ON RESEARCHER_PAPER.ResearcherID = RESEARCHER.ResearcherID
INNER JOIN RESEARCHER_INSTITUTION
ON RESEARCHER.ResearcherID = RESEARCHER_INSTITUTION.ResearcherID
INNER JOIN INSTITUTION
ON RESEARCHER_INSTITUTION.InstitutionID = INSTITUTION.InstitutionID
WHERE INSTITUTION.Name = 'Northshore University';

/* PART5 */


/*A*/
CREATE VIEW RESEARCHER_IN_CHEMISTRY
AS
SELECT RESEARCHER.GivenName, RESEARCHER.FamilyName, RESEARCHER.Title, RESEARCHER_FIELD_OF_STUDY.FieldCode, FIELD_OF_STUDY.Name
FROM RESEARCHER
INNER JOIN RESEARCHER_FIELD_OF_STUDY
ON RESEARCHER.ResearcherID = RESEARCHER_FIELD_OF_STUDY.ResearcherID
INNER JOIN FIELD_OF_STUDY
ON RESEARCHER_FIELD_OF_STUDY.FieldCode = FIELD_OF_STUDY.FieldCode
WHERE FIELD_OF_STUDY.Name = 'CHEMISTRY';

/*B*/
CREATE VIEW NORTHSHORE_UNIVERSITY_PUBLISHED_PAPER
AS
SELECT PAPER.Title, PAPER.DOI, RESEARCHER.GivenName, RESEARCHER.FamilyName,INSTITUTION.Name
FROM PAPER
INNER JOIN RESEARCHER_PAPER
ON PAPER.DOI = RESEARCHER_PAPER.DOI
INNER JOIN RESEARCHER
ON RESEARCHER_PAPER.ResearcherID = RESEARCHER.ResearcherID
INNER JOIN RESEARCHER_INSTITUTION
ON RESEARCHER.ResearcherID = RESEARCHER_INSTITUTION.ResearcherID
INNER JOIN INSTITUTION
ON RESEARCHER_INSTITUTION.InstitutionID = INSTITUTION.InstitutionID;

/*C*/
CREATE VIEW PAPER_IN_CHEMESTRY_FIELD
AS
SELECT PAPER.Title, JOURNAL.Publisher, FIELD_OF_STUDY.Name
FROM PAPER
INNER JOIN JOURNAL
ON PAPER.ISSN = JOURNAL.ISSN
INNER JOIN JOURNAL_FIELD_OF_STUDY
ON JOURNAL.ISSN = JOURNAL_FIELD_OF_STUDY.ISSN
INNER JOIN FIELD_OF_STUDY
ON JOURNAL_FIELD_OF_STUDY.FieldCode = FIELD_OF_STUDY.FieldCode
WHERE FIELD_OF_STUDY.Name = 'CHEMISTRY';

/*D*/
CREATE VIEW Average_Impact_Factor_of_NorthShoreUniversity
AS
SELECT AVG(IMPACT_FACTOR.Impact_Factor) as AVG_ImpactFactor
FROM IMPACT_FACTOR
INNER JOIN JOURNAL
ON IMPACT_FACTOR.ISSN = JOURNAL.ISSN
INNER JOIN PAPER
ON JOURNAL.ISSN = PAPER.ISSN
INNER JOIN RESEARCHER_PAPER
ON PAPER.DOI = RESEARCHER_PAPER.DOI
INNER JOIN RESEARCHER
ON RESEARCHER_PAPER.ResearcherID = RESEARCHER.ResearcherID
INNER JOIN RESEARCHER_INSTITUTION
ON RESEARCHER.ResearcherID = RESEARCHER_INSTITUTION.ResearcherID
INNER JOIN INSTITUTION
ON RESEARCHER_INSTITUTION.InstitutionID = INSTITUTION.InstitutionID
WHERE INSTITUTION.Name = 'Northshore University';


/* PART6 */

CREATE TRIGGER trg_ResearcherID
ON RESEARCHER FOR INSERT
AS
BEGIN
DECLARE @FamilyName varchar(64);
DECLARE @COUNTER int;
DECLARE @ID varchar(66);
DECLARE @original varchar(66);
SET @FamilyName = (SELECT FamilyName FROM INSERTED);
SET @original = (SELECT ResearcherID FROM INSERTED);
SET @counter = CAST(CAST((SELECT COUNT(FamilyName) FROM RESEARCHER WHERE FamilyName =
@FamilyName) AS int)AS varchar(64));
SET @ID = CONCAT(UPPER(@FamilyName),RIGHT('0'+LTRIM(RTIM(@counter)),2));
UPDATE RESEARCHER
SET ResearcherID = @ID
WHERE ResearcherID = @original;
DELETE FROM RESEARCHER WHERE ResearcherID = @original;
END



