DROP SCHEMA bb_db_bonzano;
CREATE SCHEMA bb_db_bonzano;
ALTER DATABASE bb_db_bonzano CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci; -- Hice un alter de tipo de dato para poder usar Power BI para generar los reportes 
USE bb_db_bonzano;
 
-- TABLE CREATE banco_sangre
	
CREATE TABLE banco_de_sangre (
    bankname_id VARCHAR(255),
    bank_adress VARCHAR(80) NOT NULL,
    bankunidad_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY NOT NULL
);

-- PRIMARY TABLE DE UNIDADES 
	
CREATE TABLE tipo_unidad (
    tip_unid_id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    plaquetas TINYTEXT NOT NULL,
	rh TINYTEXT NOT NULL,
    grupo_sang TINYTEXT NOT NULL,
    sangre TINYTEXT NOT NULL

);
        
	-- TABLA UNIDAD
	CREATE TABLE unidad (
    unidad_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    unidad_tipeN BIGINT NOT NULL,
		FOREIGN KEY (unidad_tipeN)
		REFERENCES tipo_unidad (tip_unid_id)
);

-- TABLA DONANTE 
		CREATE TABLE donante (
    id_donante BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    donor_fk BIGINT NOT NULL,
    fullname TINYTEXT NOT NULL,
    nacimiento DATE NOT NULL,
    peso INT NOT NULL,
    email VARCHAR(45),
    fechadonac DATE NOT NULL,
    serologia TINYTEXT NOT NULL,
    FOREIGN KEY (donor_fk)
        REFERENCES unidad (unidad_id)
);
        

-- TABLA HOSPITAL
	 

CREATE TABLE hospital (
	hosp_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_hp VARCHAR(255) NOT NULL,
    adress_hp VARCHAR(255) NOT NULL
  
);
            
            
-- PACIENTE TABLA

	CREATE TABLE pacientehp (
    legajo BIGINT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    dni_pte VARCHAR(255),
    nombre_pt TINYTEXT NOT NULL,
    nac_pte DATE NOT NULL,
    solicit_pte BIGINT NULL,
    FOREIGN KEY (solicit_pte)
        REFERENCES hospital (hosp_id)
);
        
                
			-- tabla solicitud hosp banco
		
CREATE TABLE hp_banco_solicitud (
    solicitudbbpk INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    solicitud_hp BIGINT NOT NULL,
    solicitud_bd BIGINT NOT NULL,
    FOREIGN KEY (solicitud_hp)
        REFERENCES hospital (hosp_id),
    FOREIGN KEY (solicitud_bd)
        REFERENCES banco_de_sangre (bankunidad_id)
);
  
  
CREATE TABLE deposito_banco (
    deposito_bankpk BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    unidad_storage BIGINT NOT NULL,
    unidad_bank BIGINT NOT NULL,
    FOREIGN KEY (unidad_storage)
        REFERENCES banco_de_sangre (bankunidad_id),
    FOREIGN KEY (unidad_bank)
        REFERENCES unidad (unidad_id)
);

-- TABLA BACKUP ON DELETE TRIGGER para view de recontacto de paciente 
CREATE TABLE donantebackup (
fullname TINYTEXT NULL,
nacimiento DATE NULL,
peso INT NULL,
email VARCHAR(45) NULL,
fechadonac DATE NULL,
serologia TINYTEXT NULL
);
-- -- TABLA AUDITORIA 
CREATE TABLE audit_donante(
id_donante bigint NULL,
donor_fk BIGINT NULL,
fullname TINYTEXT NULL,
nacimientto date NULL,
peso INT NULL,
email VARCHAR (45) NULL,
fechadonac date NULL,
serologia TINYTEXT NULL,
USER VARCHAR(150) NULL,
Auditdate_donante TIMESTAMP NULL
);

    
CREATE TABLE banco_soli_audit(
solicitudbbpkaudit INT NOT NULL,
solicitud_hpaudit BIGINT NOT NULL,
solicitud_bdaudit BIGINT NOT NULL,
USER VARCHAR(150) NULL,
 Solicitbackup TIMESTAMP NULL 
);
  
  
-- INSERT LOS TIPOS DE UNIDAD DE LA TABLA tipo_unidad

INSERT INTO bb_db_bonzano.tipo_unidad (tip_unid_id, plaquetas, rh, grupo_sang, sangre)
VALUES (NOT NULL, 'si','positivo','a','si'),
       (NOT NULL, 'no','positvo','a','no'),
	   (NOT NULL, 'si','positivo','b','si'),
       (NOT NULL, 'no','positvo','b','no'),
       (NOT NULL, 'si','positivo','ab','si'),
       (NOT NULL, 'no','positvo','ab','no'),
       (NOT NULL, 'si','positivo','cero','si'),
       (NOT NULL, 'no','positvo','cero','no'),
       (NOT NULL, 'si','negativo','a','si'),
       (NOT NULL, 'no','negativo','a','no'),
	   (NOT NULL, 'si','negativo','b','si'),
       (NOT NULL, 'no','negativo','b','no'),
       (NOT NULL, 'si','nergativo','ab','si'),
       (NOT NULL, 'no','negativo','ab','no'),
       (NOT NULL, 'si','negativo','cero','si'),
       (NOT NULL, 'no','neagtivo','cero','no');

    
    -- INSERT DE LA TABLA UNIDAD DE CADA UNIDAD  
 
 INSERT INTO bb_db_bonzano.unidad (unidad_id, unidad_tipeN)
 VALUES (NOT NULL, 1),
		(NOT NULL, 2),
        (NOT NULL, 3),
        (NOT NULL, 1),
        (NOT NULL, 1),
        (NOT NULL, 6),
        (NOT NULL, 8),
        (NOT NULL, 5),
        (NOT NULL, 7),
        (NOT NULL, 1),
        (NOT NULL, 2),
        (NOT NULL, 2),
        (NOT NULL, 7),
        (NOT NULL, 7),
        (NOT NULL, 1),
        (NOT NULL, 5),
        (NOT NULL, 6),
        (NOT NULL, 8),
        (NOT NULL, 8),
        (NOT NULL, 8),
        (NOT NULL, 8),
        (NOT NULL, 1),
        (NOT NULL, 1),
        (NOT NULL, 1),
        (NOT NULL, 1),
        (NOT NULL, 3),
        (NOT NULL, 3),
        (NOT NULL, 3),
        (NOT NULL, 3),
        (NOT NULL, 3),
        (NOT NULL, 3),
        (NOT NULL, 10),
        (NOT NULL, 11),
        (NOT NULL, 11),
        (NOT NULL, 11),
        (NOT NULL, 11),
		(NOT NULL, 10),
		(NOT NULL, 10),
		(NOT NULL, 10),
		(NOT NULL, 10),
        (NOT NULL, 12),
        (NOT NULL, 12),
        (NOT NULL, 12),
        (NOT NULL, 12),
        (NOT NULL, 12),
        (NOT NULL, 13),
        (NOT NULL, 13),
        (NOT NULL, 13),
        (NOT NULL, 13),
        (NOT NULL, 14),
		(NOT NULL, 15),
        (NOT NULL, 15),
        (NOT NULL, 15),
        (NOT NULL, 15),
        (NOT NULL, 16),
        (NOT NULL, 16),
        (NOT NULL, 16),
        (NOT NULL, 16),
        (NOT NULL, 16),
        (NOT NULL, 16),
        (NOT NULL, 16),
        (NOT NULL, 16);


-- INSERT DE DONANTES 

insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (1, 'Abbe Patters', '1981-11-26', 50, 'apatters0@china.com.cn', '2022-01-10', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (2, 'Bella Natalie', '1977-09-16', 51, 'bnatalie1@deviantart.com', '2022-02-23', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (3, 'Nicolis Cavilla', '1999-11-05', 52, 'ncavilla2@nytimes.com', '2022-06-01', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (4, 'Baxie Covolini', '2003-08-07', 70, 'bcovolini3@lulu.com', '2022-06-25', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (5, 'Dael Minister', '1982-08-10', 78, 'dminister4@homestead.com', '2022-11-09', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (6, 'Gates Feveryear', '1993-06-08', 78, 'gfeveryear5@printfriendly.com', '2022-03-28', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (7, 'Albie Carnow', '1994-12-05', 90, 'acarnow6@slate.com', '2022-06-26', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (8, 'Ethelred Hechlin', '1988-02-20', 110, 'ehechlin7@blinklist.com', '2022-06-18', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (9, 'Kira Angier', '1999-08-29', 70, 'kangier8@liveinternet.ru', '2022-05-14', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (10, 'Morry Warrener', '1994-08-23', 65, 'mwarrener9@foxnews.com', '2022-05-01', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (11, 'Beatrix Pomeroy', '1981-12-04', 61, 'bpomeroya@marketwatch.com', '2021-11-26', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (12, 'Jules Breslin', '2003-08-04', 80, 'jbreslinb@alexa.com', '2022-04-16', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (13, 'Tomasina Bimson', '1990-09-05', 80, 'tbimsonc@wired.com', '2022-04-23', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (14, 'Merci Di Carlo', '1982-05-11', 81, 'mdid@biglobe.ne.jp', '2022-05-01', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (15, 'Lucina Matts', '1986-10-17', 82, 'lmattse@narod.ru', '2022-01-12', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (16, 'Pete Kahn', '1979-10-08', 83, 'pkahnf@ucoz.ru', '2022-01-11', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (17, 'Wallie Naden', '1982-02-22', 50, 'wnadeng@amazon.co.uk', '2022-02-17', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (18, 'Odie Bolles', '1985-08-13', 55, 'obollesh@webnode.com', '2021-11-26', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (19, 'Roxana Coverdale', '1993-05-14', 52, 'rcoverdalei@squarespace.com', '2022-04-06', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (20, 'Analise Trevon', '1992-02-11', 51, 'atrevonj@ucsd.edu', '2022-05-05', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (22, 'Fayre Stitch', '1977-11-14', 98, 'fstitchl@redcross.org', '2022-05-01', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (23, 'Fitzgerald Cristea', '1988-01-11', 200, 'fcristeam@reference.com', '2022-11-09', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (24, 'Emmet Butrimovich', '1991-12-05', 120, 'ebutrimovichn@tuttocitta.it', '2021-12-03', 'si');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (25, 'Christi Tolan', '1992-04-29', 57, 'ctolano@oracle.com', '2021-11-25', 'si');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (26, 'Kearney Spyby', '1998-11-22', 80, 'kspybyp@ed.gov', '2022-04-29', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (27, 'Cordie Bromley', '1981-06-04', 70, 'cbromleyq@google.ru', '2022-11-02', 'si');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (28, 'Jeremie Isbell', '2000-03-30', 87, 'jisbellr@nhs.uk', '2022-03-08', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (29, 'Gaynor Dowyer', '1996-04-08', 65, 'gdowyers@barnesandnoble.com', '2022-05-05', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (30, 'Minna Ravenshear', '1987-10-31', 87, 'mravensheart@apache.org', '2021-12-24', 'si');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (31, 'Brooks Wigg', '1988-10-31', 200, 'bwiggu@utexas.edu', '2022-02-22', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (32, 'Tan Challace', '2000-08-04', 70, 'tchallacev@nasa.gov', '2022-10-10', 'si');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (33, 'Angele Weller', '1982-07-29', 72, 'awellerw@cdbaby.com', '2022-03-06', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (34, 'Lyda Andrat', '1991-12-23', 52, 'landratx@tamu.edu', '2022-10-21', 'si');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (35, 'Cathrin Nannizzi', '1995-12-11', 78, 'cnannizziy@dailymotion.com', '2022-05-05', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (36, 'Trent Dowker', '1995-11-07', 87, 'tdowkerz@bluehost.com', '2022-06-12', 'si');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (37, 'Pincus MacDaid', '1985-02-13', 98, 'pmacdaid10@usnews.com', '2022-05-10', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (38, 'Pincus Yusupov', '1983-05-05', 89, 'pyusupov11@oakley.com', '2022-09-01', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (39, 'Izaak Lemanu', '1990-07-13', 58, 'ilemanu12@wikipedia.org', '2022-02-10', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (40, 'Dinnie Garnar', '2000-04-15', 85, 'dgarnar13@google.com', '2021-12-25', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (41, 'Letitia Klimov', '1977-09-05', 53, 'lklimov14@hatena.ne.jp', '2022-04-03', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (42, 'Chalmers Mordin', '1994-06-07', 54, 'cmordin15@themeforest.net', '2022-05-31', 'si');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (43, 'Jermayne Hamlett', '1999-10-30', 78, 'jhamlett16@mayoclinic.com', '2022-04-21', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (44, 'Irita Kernley', '1977-01-14', 68, 'ikernley17@wordpress.org', '2022-03-11', 'si');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (45, 'Dory Bromfield', '1997-09-18', 62, 'dbromfield18@cbc.ca', '2022-10-26', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (46, 'Jolene Pinch', '1979-04-29', 51, 'jpinch19@archive.org', '2022-04-08', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (47, 'Louella Durnford', '1983-05-26', 50, 'ldurnford1a@lycos.com', '2022-05-03', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (48, 'Shandy Lunck', '1993-02-04', 96, 'slunck1b@nifty.com', '2022-04-27', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (49, 'Sula Baake', '1987-04-12', 54, 'sbaake1c@histats.com', '2022-07-22', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (50, 'Mariel Bogays', '1997-02-07', 53, 'mbogays1d@hp.com', '2022-11-03', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (51, 'Broddy Sanbrooke', '1980-07-26', 75, 'bsanbrooke1e@ftc.gov', '2022-05-29', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (52, 'Skippie Pittendreigh', '1999-02-13', 78, 'spittendreigh1f@bing.com', '2022-03-14', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (53, 'Aurel Thirwell', '1979-04-10', 98, 'athirwell1g@meetup.com', '2021-12-16', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (54, 'Laetitia Gheorghescu', '1989-07-31', 89, 'lgheorghescu1h@huffingtonpost.com', '2021-12-21', 'si');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (55, 'Bathsheba Tansley', '1982-05-03', 45, 'btansley1i@devhub.com', '2022-10-19', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (56, 'Benita De Matteis', '1994-08-11', 200, 'bde1j@edublogs.org', '2022-08-13', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (57, 'Amil Ibbs', '1984-02-19', 125, 'aibbs1k@woothemes.com', '2022-05-05', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (58, 'Lynnet Ruslin', '1976-12-11', 145, 'lruslin1l@hugedomains.com', '2022-03-02', 'si');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (59, 'Philomena Webben', '1998-06-06', 78, 'pwebben1m@youtu.be', '2022-04-20', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (60, 'Chickie Beacham', '1984-10-21', 98, 'cbeacham1n@360.cn', '2022-07-14', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (61, 'Daloris Whitford', '1987-02-24', 85, 'dwhitford1o@go.com', '2021-12-18', 'no');
insert into donante (donor_fk, fullname, nacimiento, peso, email, fechadonac, serologia) values (62, 'Zulema Prettyjohn', '1977-11-04', 58, 'zprettyjohn1p@skype.com', '2022-04-02', 'no');



-- INSERT de banco_de_sangre
/*
en esta tabla se repite el mismo nombre de banco porque es el mismo banco es una sola sucursal con la misma dire,
bankuunidad_id hace referencia a las unidades de sangre que el banco tiene disponible
*/

INSERT INTO banco_de_sangre (bankname_id, bank_adress, bankunidad_id)
VALUES ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
	  ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL),
      ('banco de la provincia de cordoba','Av.Chacabuco 5036', NULL);



-- INSERT a tabla deposito_banco
/*En esta tablas van a ver repetidos muchos valores, esta tablas es para saber la ubicacion de la unidad en el banco,
 en este caso solo hay un banco de sangre anexado a esta base de datos pero eso a futuro puede cambiar por ende la creacion de esta tabla como medida a futuro
 */
 
 INSERT INTO deposito_banco (deposito_bankpk, unidad_storage, unidad_bank)
 VALUES (NOT NULL,1, 1),
		(NOT NULL,1, 1),
		(NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
		(NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
		(NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
		(NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
		(NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
		(NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
		(NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1),
		(NOT NULL,1, 1),
        (NOT NULL,1, 1),
        (NOT NULL,1, 1);
        
        
        -- Insert de HOSPITALES
      	
INSERT INTO hospital (hosp_id, nombre_hp, adress_hp)
VALUES (NOT NULL,'Hospital Rawson','Bajada Pucará 2025'),
	   (NOT NULL, 'Hospital Misericordia','Belgrano 1502'),
       (NOT NULL,'Hospital San Roque','Bajada Pucará'),
       (NOT NULL, 'Hospital Municipal de Urgencias (H.M.U.)',' Catamarca 441');
       

       
       -- INSERT de paciente de varios hospitales 

insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '366-17-9174', 'Maryl MacHoste', '2004-08-11', 1);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '143-41-4292', 'Stevy Deware', '1967-10-28', 2);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '364-52-5598', 'Amos Maryon', '2006-01-01', 3);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '660-22-0840', 'Laurianne Srawley', '2006-08-09', 4);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '638-88-1116', 'Datha Stuckley', '2021-09-12', 1);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '740-17-6391', 'Elbert Hazleton', '1970-11-12', 2);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '304-76-6712', 'Joellyn Singyard', '2018-07-22', 3);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '723-34-3765', 'Giovanna Andretti', '1967-03-16', 4);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '776-85-6794', 'Darby Karpushkin', '1981-05-02', 1);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '332-95-8683', 'Page Riordan', '2010-08-30', 2);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '569-92-4622', 'Merralee Piggin', '2016-11-18', 3);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '668-61-6252', 'Gar Hudghton', '1987-05-17', 4);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '474-04-3638', 'Bartholomew Pierse', '2020-09-17', 1);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '236-59-3883', 'Robin Horlick', '1967-05-29', 2);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '733-48-7785', 'Aloisia Dismore', '2007-01-23', 3);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '641-59-6267', 'North Croney', '1983-10-08', 4);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '109-15-0369', 'Ringo Pepineaux', '2002-01-06', 1);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '800-12-3561', 'Fredi Knappitt', '2012-10-15', 2);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '303-01-4419', 'Morgen Milliken', '2003-06-05', 3);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '772-42-2696', 'Anatol Wrought', '1985-07-03', 4);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '473-68-2911', 'Siana Bennell', '1967-11-19', 1);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '542-17-2102', 'Gaspard Muat', '1980-08-24', 2);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '469-03-1312', 'Bentlee Harses', '1996-05-27', 3);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '378-43-4372', 'Tasia Whyard', '1971-02-10', 4);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '322-29-4009', 'Tina Rouchy', '1991-10-21', 1);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '368-37-2338', 'Archibaldo Goudge', '1996-08-30', 2);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '107-75-8554', 'Danila Zambonini', '2005-05-07', 3);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '273-70-7944', 'Tonya Caudle', '1993-05-08', 4);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '829-52-3014', 'Anatol Mabbott', '1976-10-02', 1);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '578-73-5277', 'Dyana Claremont', '2011-02-22', 1);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '150-55-4354', 'Elita Binney', '2021-06-24', 1);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '244-22-7801', 'Tyrus Smitten', '1975-05-15', 1);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '195-37-1947', 'Gilligan Skune', '2021-08-14', 4);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '307-88-5094', 'Reynold Bysaker', '1982-12-15', 4);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '606-83-5175', 'Griz Christoforou', '1970-04-28', 4);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '108-03-2931', 'Eamon Antill', '2003-05-09', 4);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '700-98-6914', 'Tomaso Schapero', '1976-09-05', 2);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '472-83-0392', 'Caterina Nesby', '1977-05-16', 1);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '586-83-2301', 'Nellie Gainsboro', '1975-09-11', 2);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '607-48-4733', 'Drusi Drowsfield', '1998-03-29', 3);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '809-49-7103', 'Jervis Szach', '1998-09-23', 4);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '368-01-8484', 'Marcelo Kellington', '1972-07-22', 1);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '639-64-8329', 'Fabiano McCrostie', '1979-02-21', 2);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '795-30-1774', 'Jordan Tennewell', '1989-09-06', 3);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '685-38-3831', 'Marjory Liversedge', '1998-01-25', 3);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '741-56-4385', 'Somerset Martusewicz', '1987-09-24', 1);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '727-75-6582', 'Katuscha Cahill', '2010-06-24', 2);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '127-62-4178', 'Norah Audus', '1978-12-25', 3);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '116-02-8454', 'Aubry Richfield', '2012-03-19', 4);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '665-30-2793', 'Nikolaus Brafield', '2007-06-08', 1);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '156-64-1223', 'Binni Kingsland', '1988-08-23', 2);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '623-66-1514', 'Worden Anning', '1996-10-19', 3);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '864-46-8596', 'Gaylord Dolley', '1982-03-11', 4);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '630-60-1664', 'Chariot Sugar', '1997-06-13', 4);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '347-66-0425', 'Lemmie Colquit', '2009-10-12', 4);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '312-99-0911', 'Madelyn Redon', '1982-10-28', 4);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '457-30-6927', 'Kippy Waberer', '1997-07-04', 4);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '687-85-7725', 'Nona Weaben', '1965-04-18', 4);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '362-85-3217', 'Jolynn Lees', '2012-03-02', 4);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '533-98-2231', 'Anestassia Sinyard', '1976-02-26', 1);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '896-59-2667', 'Jeff Batchellor', '2016-06-15', 2);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '268-71-4181', 'Derward Basindale', '1971-07-18', 3);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '741-56-4385', 'Somerset Martusewicz', '1987-09-24', 2);
insert into pacientehp (legajo, dni_pte, nombre_pt, nac_pte, solicit_pte) values (null, '741-56-4385', 'Somerset Martusewicz', '1987-09-24', 3);

-- INSERT DE SOLICITUDES DE UNIDADES 

INSERT INTO hp_banco_solicitud (solicitudbbpk, solicitud_hp, solicitud_bd)
VALUES  (NULL, 1, 1 ),
		(NULL, 2, 1 ),
        (NULL, 3, 1 ),
        (NULL, 4, 1 ),
        (NULL, 4, 1 ),
        (NULL, 4, 1 ),
        (NULL, 4, 1 ),
        (NULL, 4, 1 ),
        (NULL, 2, 1 ),
        (NULL, 2, 1 ),
        (NULL, 2, 1 ),
        (NULL, 3, 1 ),
        (NULL, 3, 1 ),
        (NULL, 2, 1 ),
        (NULL, 1, 1 ),
        (NULL, 1, 1 ),
        (NULL, 1, 1 ),
        (NULL, 4, 1 ),
        (NULL, 4, 1 ),
        (NULL, 4, 1 ),
        (NULL, 4, 1 ),
        (NULL, 4, 1 );
  
  /*PRROCEDURE para traer todas las unidades de sangre ordenadas por donante que 
  contengan sangre independientemente de si tienen plaquetas o no
  */
  

DELIMITER //
CREATE PROCEDURE sangre_si()
BEGIN
Select * 
from bb_db_bonzano.donante
INNER JOIN tipo_unidad
INNER JOIN unidad
ON donante.id_donante = tipo_unidad.tip_unid_id
where sangre = 'si' ORDER BY id_donante ASC;
	
END // 

DELIMITER ; 
-- PROCEDURE para encontrar donantes con serologia positva 

DELIMITER //
CREATE PROCEDURE serologia_positiva()
BEGIN
Select * 
from bb_db_bonzano.donante  as cp
INNER JOIN tipo_unidad as tu
RIGHT JOIN unidad  as u 
ON cp.id_donante = tu.tip_unid_id;
select * from bb_db_bonzano.donante as cp
where serologia like 'si' ORDER BY id_donante ASC;
END // 

DELIMITER ;
/*PROCEDURE borrar todos los donantes con serologia postivia de la BD*/



DELIMITER //
 CREATE PROCEDURE `before delete` ()
BEGIN
SET SQL_SAFE_UPDATES = 0;
delete from bb_db_bonzano.donante as cp
where serologia like 'si';
SELECT 
    *
FROM
    bb_db_bonzano.donante AS cp
        INNER JOIN
    tipo_unidad AS tu
        RIGHT JOIN
    unidad AS u ON cp.id_donante = tu.tip_unid_id;
SET SQL_SAFE_UPDATES = 1;

END //

DELIMITER ;

/*
Trigger para guardar informacion de pte con serologia postiva para re contacto, la idea es que al borrar los datos de pacientes no viables para ser donantes 
y avisarles de su estado de salud 
*/
CREATE 
    TRIGGER  `cerologia postiva backup`
 BEFORE DELETE ON bb_db_bonzano.donante FOR EACH ROW 
 INSERT INTO bb_db_bonzano.donantebackup (fullname , nacimiento , peso , email , fechadonac , serologia)
 SELECT fullname , nacimiento , peso , email , fechadonac , serologia FROM donante where serologia = 'si';


 -- Trigger auditoria donante on insert , Este scripts es para guardar la info de la persona que realiza inserts en las tablas . 

CREATE 
TRIGGER `LOG DONANTE`
BEFORE INSERT ON bb_db_bonzano.donante FOR EACH ROW 
INSERT INTO BB_DB_BONZANO.audit_donante
VALUES (NEW.id_donante, NEW.donor_fk, NEW.fullname, NEW.nacimiento, NEW.peso, NEW.email, NEW.Fechadonac, New.serologia, session_user(), current_timestamp());


-- Dos triggers on insert y delete para trackear las solicitudes de unidades de sangre 


CREATE  TRIGGER `solicitauditbefore`
BEFORE INSERT ON bb_db_bonzano.hp_banco_solicitud FOR EACH ROW 
INSERT INTO BB_DB_BONZANO.banco_soli_audit
VALUES (NEW.solicitudbbpk, NEW.solicitud_hp, NEW.solicitud_bd,session_user(), current_timestamp());
  
  
CREATE  TRIGGER `solicitudauditdelete`
BEFORE DELETE ON bb_db_bonzano.hp_banco_solicitud FOR EACH ROW 
INSERT INTO BB_DB_BONZANO.banco_soli_audit
VALUES (old.solicitudbbpk, old.solicitud_hp, old.solicitud_bd,session_user(), current_timestamp());

-- View simple para re contacto de potenciales donantes (excluyendo serologias positivas las cuales son borradas con los SP ).
Create view  `donante_lastdonation` AS
 SELECT * FROM donante 
WHERE DATE(fechadonac) < '2022-01-01' ;

 -- VIEW ubicaion y tipo de unidad 
 CREATE VIEW `location` AS 
SELECT * 
FROM banco_de_sangre
right JOIN deposito_banco as db
ON banco_de_sangre.bankunidad_id = db.unidad_bank
LEFT JOIN unidad
ON db.deposito_bankpk = unidad.unidad_id;
 
 -- View de donantes con sus tipos de sangre y caracteristicas de la unidad 
 
CREATE VIEW `caracteristicas unid` AS
SELECT *
FROM donante AS dn
RIGHT JOIN tipo_unidad AS tu
ON dn.id_donante = tu.tip_unid_id
inner join unidad as un
on tu.tip_unid_id = un.unidad_tipeN;
 
 -- View de hubicaion de pacientes 
 
 CREATE VIEW `PATIENT LOCAITON` AS
    SELECT 
        *
    FROM
        hospital AS hp
            INNER JOIN
        pacientehp AS php;
 
-- View de recontacto de serologias positivas 

CREATE VIEW `Recontactopostivo` as
Select* from donantebackup;

-- s.p  parap contar la cantidad de unidades en storage  

DELIMITER // 
CREATE PROCEDURE `cantidaddeunidades` () 
DETERMINISTIC
BEGIN
SELECT COUNT(unidad_id) FROM unidad; 
END //

DELIMITER ; 

-- s.p para buscar de forma rapida tipo de sangre A+ con sangre y plaquetas  (serologia negativa)
 
DELIMITER // 
CREATE PROCEDURE `donantes posibles` ()
DETERMINISTIC
BEGIN
SELECT COUNT(unidad_id) FROM unidad WHERE (unidad_tipeN = 1) ;
END //

DELIMITER ; 

/*
Function para contar cantidad de unidades con serologia postiva y negativa 
*/
DELIMITER //  
CREATE FUNCTION donor_n_serology(  
    tipo_serologia  tinytext 
)   
RETURNS	 INT  
DETERMINISTIC  
BEGIN  
    DECLARE donor_n_serology INT;  
  SELECT COUNT(*) INTO donor_n_serology from donante where serologia = tipo_serologia;
    RETURN (donor_n_serology);  
	
END//  


DELIMITER ;  

/*
Function para contar las cantidades de unidad con ciertos tipos de atributos (a,b,0 (positvo o no negativo))
*/
DELIMITER //  
CREATE FUNCTION cant_unid(  
    cantunid  BIGINT 
)   
RETURNS	 BIGINT  
DETERMINISTIC  
BEGIN  
    DECLARE cant_unid BIGINT;  
  SELECT COUNT(*) INTO cant_unid from unidad where unidad_tipeN = cantunid;
    RETURN (cant_unid);  
	
END//  


DELIMITER ;  
