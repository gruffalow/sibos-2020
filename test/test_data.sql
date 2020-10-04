
CREATE TABLE `messages` (
  `msgno` int(11) DEFAULT NULL,
  `UETR` text,
  `Type` text,
  `Sender` text,
  `Receiver` text,
  `20` text,
  `23B` text,
  `32A` text,
  `33B` text,
  `36` text,
  `50A` text,
  `50F` text,
  `50K` text,
  `52A` text,
  `56A` text,
  `57A` text,
  `59F` text,
  `:71A:` text,
  `:71F:` text,
  `:71G:` text,
  `79` text,
  `32A_Date` datetime DEFAULT NULL,
  `32A_Currency` text,
  `32A_Amount` double DEFAULT NULL,
  `33B_Currency` text,
  `33B_Amount` double DEFAULT NULL,
  `:71F:_Parsed` text,
  `:71F:_0_Currency` text,
  `:71F:_0_Amount` text,
  `:71F:_1_Currency` text,
  `:71F:_1_Amount` text,
  `:71F:_2_Currency` text,
  `:71F:_2_Amount` text,
  `:71G:_Currency` text,
  `:71G:_Amount` text,
  `50A_Present` text,
  `50F_Present` text,
  `50K_Present` text,
  `59F_Present` text,
  `DebtAcc` text,
  `BeneAcc` text,
  KEY `messages_type_idx` (`Type`(3)),
  KEY `idx_messages_32A_Date` (`32A_Date`),
  FULLTEXT KEY `idx_messages_UETR` (`UETR`),
  FULLTEXT KEY `idx_messages_DebtAcc` (`DebtAcc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO messages (`msgno`,`UETR`,`Type`,`Sender`,`Receiver`,`20`,`23B`,`32A`,`33B`,`36`,`50A`,`50F`,`50K`,`52A`,`56A`,`57A`,`59F`,`:71A:`,`:71F:`,`:71G:`,`79`,`32A_Date`,`32A_Currency`,`32A_Amount`,`33B_Currency`,`33B_Amount`,`:71F:_Parsed`,`:71F:_0_Currency`,`:71F:_0_Amount`,`:71F:_1_Currency`,`:71F:_1_Amount`,`:71F:_2_Currency`,`:71F:_2_Amount`,`:71G:_Currency`,`:71G:_Amount`,`50A_Present`,`50F_Present`,`50K_Present`,`59F_Present`,`DebtAcc`,`BeneAcc`) VALUES (0,'3815e53f-f0ab-4da3-b5ec-f9c14ddaa639','103','MYBNUS21','RPBNCN71','SIB000-NO-FX-001','CRED','200905USD23847,11','USD23847,11','','/0000000000000000000000000000000896\r\n MYBNUS21','','','MYBNUS21','','RPBNCN71','/0000000000000000000000000000005921\r\n 1/LILI KURT\r\n 2/251319 GLENN DR\r\n 3/US/SNOW HILL','SHA','','','','2020-09-05 00:00:00','USD',23847.11,'USD',23847.11,'[[]]','','','','','','','','','True','False','False','True','0000000000000000000000000000000896','0000000000000000000000000000005921\r');
INSERT INTO messages (`msgno`,`UETR`,`Type`,`Sender`,`Receiver`,`20`,`23B`,`32A`,`33B`,`36`,`50A`,`50F`,`50K`,`52A`,`56A`,`57A`,`59F`,`:71A:`,`:71F:`,`:71G:`,`79`,`32A_Date`,`32A_Currency`,`32A_Amount`,`33B_Currency`,`33B_Amount`,`:71F:_Parsed`,`:71F:_0_Currency`,`:71F:_0_Amount`,`:71F:_1_Currency`,`:71F:_1_Amount`,`:71F:_2_Currency`,`:71F:_2_Amount`,`:71G:_Currency`,`:71G:_Amount`,`50A_Present`,`50F_Present`,`50K_Present`,`59F_Present`,`DebtAcc`,`BeneAcc`) VALUES (1,'dd287238-fd3a-4a86-89a3-a2fd0aada786','103','MYBNUS21','RPBNCN71','SIB000-NO-FX-002','CRED','200905USD13289,65','USD13289,65','','','DRLC/US/VA/0000005285\r\n 1/RAHAF SANDERS\r\n 2/848042 GLORIA ST\r\n 3/US/FISHTAIL','','MYBNUS21','','RPBNCN71','/0000000000000000000000000000002947\r\n 1/LUKA THIBAULT\r\n 2/152266 SILO DR\r\n 3/US/CRESTWOOD','BEN','USD0,00','','','2020-09-05 00:00:00','USD',13289.65,'USD',13289.65,'[[\'USD\', \'0\']]','USD','0.0','','','','','','','False','True','False','True','DRLC/US/VA/0000005285','0000000000000000000000000000002947\r');
INSERT INTO messages (`msgno`,`UETR`,`Type`,`Sender`,`Receiver`,`20`,`23B`,`32A`,`33B`,`36`,`50A`,`50F`,`50K`,`52A`,`56A`,`57A`,`59F`,`:71A:`,`:71F:`,`:71G:`,`79`,`32A_Date`,`32A_Currency`,`32A_Amount`,`33B_Currency`,`33B_Amount`,`:71F:_Parsed`,`:71F:_0_Currency`,`:71F:_0_Amount`,`:71F:_1_Currency`,`:71F:_1_Amount`,`:71F:_2_Currency`,`:71F:_2_Amount`,`:71G:_Currency`,`:71G:_Amount`,`50A_Present`,`50F_Present`,`50K_Present`,`59F_Present`,`DebtAcc`,`BeneAcc`) VALUES (2,'d5fc97e0-d3a2-4474-af4f-6eb55632bcab','103','MYBNUS21','RPBNCN71','SIB000-NO-FX-003','CRED','200905USD28308,37','USD28308,37','','','','/0000000000000000000000000000006806\r\n 1/ARADHYA TURNER\r\n 2/661079 SILLIMAN DR\r\n 3/US/ASHLAND','MYBNUS21','','RPBNCN71','/0000000000000000000000000000003437\r\n 1/MARTIM CYR\r\n 2/129981 ERIE ST\r\n 3/US/LEBANON','OUR','','USD10,00','','2020-09-05 00:00:00','USD',28308.37,'USD',28308.37,'[[]]','','','','','','','USD','10.0','False','False','True','True','0000000000000000000000000000006806','0000000000000000000000000000003437\r');
INSERT INTO messages (`msgno`,`UETR`,`Type`,`Sender`,`Receiver`,`20`,`23B`,`32A`,`33B`,`36`,`50A`,`50F`,`50K`,`52A`,`56A`,`57A`,`59F`,`:71A:`,`:71F:`,`:71G:`,`79`,`32A_Date`,`32A_Currency`,`32A_Amount`,`33B_Currency`,`33B_Amount`,`:71F:_Parsed`,`:71F:_0_Currency`,`:71F:_0_Amount`,`:71F:_1_Currency`,`:71F:_1_Amount`,`:71F:_2_Currency`,`:71F:_2_Amount`,`:71G:_Currency`,`:71G:_Amount`,`50A_Present`,`50F_Present`,`50K_Present`,`59F_Present`,`DebtAcc`,`BeneAcc`) VALUES (3,'05ba18b9-ed4a-4596-a3f2-c9f1716d262d','103','MYBNUS21','RPBNCN71','SIB000-NO-FX-004','CRED','200905USD12487,11','USD12487,11','','/0000000000000000000000000000001294\r\n MYBNUS21','','','MYBNUS21','','RPBNCN71','/0000000000000000000000000000000695\r\n 1/ARSEN OUELLET\r\n 2/16411 E AZALEA AVE\r\n 3/US/FELTON','SHA','','','','2020-09-05 00:00:00','USD',12487.11,'USD',12487.11,'[[]]','','','','','','','','','True','False','False','True','0000000000000000000000000000001294','0000000000000000000000000000000695\r');
INSERT INTO messages (`msgno`,`UETR`,`Type`,`Sender`,`Receiver`,`20`,`23B`,`32A`,`33B`,`36`,`50A`,`50F`,`50K`,`52A`,`56A`,`57A`,`59F`,`:71A:`,`:71F:`,`:71G:`,`79`,`32A_Date`,`32A_Currency`,`32A_Amount`,`33B_Currency`,`33B_Amount`,`:71F:_Parsed`,`:71F:_0_Currency`,`:71F:_0_Amount`,`:71F:_1_Currency`,`:71F:_1_Amount`,`:71F:_2_Currency`,`:71F:_2_Amount`,`:71G:_Currency`,`:71G:_Amount`,`50A_Present`,`50F_Present`,`50K_Present`,`59F_Present`,`DebtAcc`,`BeneAcc`) VALUES (4,'e62bbcb9-60d4-4ed5-bb1e-fad49491dec1','103','MYBNUS21','RPBNCN71','SIB000-NO-FX-005','CRED','200905USD3780,66','USD3780,66','','','','/0000000000000000000000000000008113\r\n 1/ILGAR ASLAN\r\n 2/228440 KIPLING COVE\r\n 3/US/MOOSEHEART','MYBNUS21','','RPBNCN71','/0000000000000000000000000000005828\r\n 1/HUDSON LAMBERT\r\n 2/383571 MONTCLAIR CT\r\n 3/US/GRAND BAY','BEN','USD0,00','','','2020-09-05 00:00:00','USD',3780.66,'USD',3780.66,'[[\'USD\', \'0\']]','USD','0.0','','','','','','','False','False','True','True','0000000000000000000000000000008113','0000000000000000000000000000005828\r');
INSERT INTO messages (`msgno`,`UETR`,`Type`,`Sender`,`Receiver`,`20`,`23B`,`32A`,`33B`,`36`,`50A`,`50F`,`50K`,`52A`,`56A`,`57A`,`59F`,`:71A:`,`:71F:`,`:71G:`,`79`,`32A_Date`,`32A_Currency`,`32A_Amount`,`33B_Currency`,`33B_Amount`,`:71F:_Parsed`,`:71F:_0_Currency`,`:71F:_0_Amount`,`:71F:_1_Currency`,`:71F:_1_Amount`,`:71F:_2_Currency`,`:71F:_2_Amount`,`:71G:_Currency`,`:71G:_Amount`,`50A_Present`,`50F_Present`,`50K_Present`,`59F_Present`,`DebtAcc`,`BeneAcc`) VALUES (5,'07e79d9b-57cf-45da-ae15-8134e9f05b3f','103','MYBNUS21','RPBNCN71','SIB000-NO-FX-006','CRED','200905USD10009,37','USD10009,37','','','','/0000000000000000000000000000004803\r\n 1/ALISA NELSON\r\n 2/66984 LOVERS LN\r\n 3/US/LOWELL','MYBNUS21','','RPBNCN71','/0000000000000000000000000000005678\r\n 1/HOSSEIN MICHAUD\r\n 2/102652 CONNELL\'S VILLAGE LN\r\n 3/US/GENTRY','OUR','','USD10,00','','2020-09-05 00:00:00','USD',10009.37,'USD',10009.37,'[[]]','','','','','','','USD','10.0','False','False','True','True','0000000000000000000000000000004803','0000000000000000000000000000005678\r');
INSERT INTO messages (`msgno`,`UETR`,`Type`,`Sender`,`Receiver`,`20`,`23B`,`32A`,`33B`,`36`,`50A`,`50F`,`50K`,`52A`,`56A`,`57A`,`59F`,`:71A:`,`:71F:`,`:71G:`,`79`,`32A_Date`,`32A_Currency`,`32A_Amount`,`33B_Currency`,`33B_Amount`,`:71F:_Parsed`,`:71F:_0_Currency`,`:71F:_0_Amount`,`:71F:_1_Currency`,`:71F:_1_Amount`,`:71F:_2_Currency`,`:71F:_2_Amount`,`:71G:_Currency`,`:71G:_Amount`,`50A_Present`,`50F_Present`,`50K_Present`,`59F_Present`,`DebtAcc`,`BeneAcc`) VALUES (6,'c5247ed7-bd7d-4bfe-905b-46ac51beeba5','103','MYBNUS21','RPBNCN71','SIB000-NO-FX-007','CRED','200905USD39906,63','USD39906,63','','','','/0000000000000000000000000000004874\r\n 1/YASMINE CRUZ\r\n 2/338856 W CENTRAL AVE\r\n 3/US/LEBANON','MYBNUS21','','RPBNCN71','/0000000000000000000000000000003697\r\n 1/SAANVI GAUTHIER\r\n 2/285109 GERALD DR\r\n 3/US/WATCHUNG','SHA','','','','2020-09-05 00:00:00','USD',39906.63,'USD',39906.63,'[[]]','','','','','','','','','False','False','True','True','0000000000000000000000000000004874','0000000000000000000000000000003697\r');
INSERT INTO messages (`msgno`,`UETR`,`Type`,`Sender`,`Receiver`,`20`,`23B`,`32A`,`33B`,`36`,`50A`,`50F`,`50K`,`52A`,`56A`,`57A`,`59F`,`:71A:`,`:71F:`,`:71G:`,`79`,`32A_Date`,`32A_Currency`,`32A_Amount`,`33B_Currency`,`33B_Amount`,`:71F:_Parsed`,`:71F:_0_Currency`,`:71F:_0_Amount`,`:71F:_1_Currency`,`:71F:_1_Amount`,`:71F:_2_Currency`,`:71F:_2_Amount`,`:71G:_Currency`,`:71G:_Amount`,`50A_Present`,`50F_Present`,`50K_Present`,`59F_Present`,`DebtAcc`,`BeneAcc`) VALUES (7,'0d1d0723-300d-401c-97fb-4b23010935af','103','MYBNUS21','RPBNCN71','SIB000-NO-FX-008','CRED','200905USD3724,09','USD3724,09','','','DRLC/US/VA/0000009532\r\n 1/DIMITAR   BEAUDOIN\r\n 2/611749 S PARKVIEW DR\r\n 3/US/COLUMBUS','','MYBNUS21','','RPBNCN71','/0000000000000000000000000000000283\r\n 1/JOHANN ASLAN\r\n 2/388381 SCARBOROUGH DR\r\n 3/US/PETERBOROUGH','BEN','USD0,00','','','2020-09-05 00:00:00','USD',3724.09,'USD',3724.09,'[[\'USD\', \'0\']]','USD','0.0','','','','','','','False','True','False','True','DRLC/US/VA/0000009532','0000000000000000000000000000000283\r');
INSERT INTO messages (`msgno`,`UETR`,`Type`,`Sender`,`Receiver`,`20`,`23B`,`32A`,`33B`,`36`,`50A`,`50F`,`50K`,`52A`,`56A`,`57A`,`59F`,`:71A:`,`:71F:`,`:71G:`,`79`,`32A_Date`,`32A_Currency`,`32A_Amount`,`33B_Currency`,`33B_Amount`,`:71F:_Parsed`,`:71F:_0_Currency`,`:71F:_0_Amount`,`:71F:_1_Currency`,`:71F:_1_Amount`,`:71F:_2_Currency`,`:71F:_2_Amount`,`:71G:_Currency`,`:71G:_Amount`,`50A_Present`,`50F_Present`,`50K_Present`,`59F_Present`,`DebtAcc`,`BeneAcc`) VALUES (8,'b4d86bd2-5f45-4fb6-9d8e-ef3914d5eee9','103','MYBNUS21','RPBNCN71','SIB000-NO-FX-009','CRED','200905USD2023,35','USD2023,35','','','','/0000000000000000000000000000001757\r\n 1/TAYLOR MERCADO\r\n 2/163393 PARKIN AVE\r\n 3/US/MONETT','MYBNUS21','','RPBNCN71','/0000000000000000000000000000007409\r\n 1/BROOKLYN DEMERS\r\n 2/436103 INDEPENDENCE BLVD\r\n 3/US/ORANGEFIELD','OUR','','USD10,00','','2020-09-05 00:00:00','USD',2023.35,'USD',2023.35,'[[]]','','','','','','','USD','10.0','False','False','True','True','0000000000000000000000000000001757','0000000000000000000000000000007409\r');
INSERT INTO messages (`msgno`,`UETR`,`Type`,`Sender`,`Receiver`,`20`,`23B`,`32A`,`33B`,`36`,`50A`,`50F`,`50K`,`52A`,`56A`,`57A`,`59F`,`:71A:`,`:71F:`,`:71G:`,`79`,`32A_Date`,`32A_Currency`,`32A_Amount`,`33B_Currency`,`33B_Amount`,`:71F:_Parsed`,`:71F:_0_Currency`,`:71F:_0_Amount`,`:71F:_1_Currency`,`:71F:_1_Amount`,`:71F:_2_Currency`,`:71F:_2_Amount`,`:71G:_Currency`,`:71G:_Amount`,`50A_Present`,`50F_Present`,`50K_Present`,`59F_Present`,`DebtAcc`,`BeneAcc`) VALUES (9,'50f9e499-5648-4c89-a217-b06caff4b522','103','MYBNUS21','RPBNCN71','SIB000-NO-FX-010','CRED','200905USD8679,56','USD8679,56','','','DRLC/US/VA/0000000935\r\n 1/ZUZANNA FISHER\r\n 2/332086 PADDOCK AVE\r\n 3/US/HAMLIN','','MYBNUS21','','RPBNCN71','/0000000000000000000000000000003161\r\n 1/SEM ASLAN\r\n 2/305357 BRISTOL AVE\r\n 3/US/WOBURN','SHA','','','','2020-09-05 00:00:00','USD',8679.56,'USD',8679.56,'[[]]','','','','','','','','','False','True','False','True','DRLC/US/VA/0000000935','0000000000000000000000000000003162\r');
INSERT INTO messages (`msgno`,`UETR`,`Type`,`Sender`,`Receiver`,`20`,`23B`,`32A`,`33B`,`36`,`50A`,`50F`,`50K`,`52A`,`56A`,`57A`,`59F`,`:71A:`,`:71F:`,`:71G:`,`79`,`32A_Date`,`32A_Currency`,`32A_Amount`,`33B_Currency`,`33B_Amount`,`:71F:_Parsed`,`:71F:_0_Currency`,`:71F:_0_Amount`,`:71F:_1_Currency`,`:71F:_1_Amount`,`:71F:_2_Currency`,`:71F:_2_Amount`,`:71G:_Currency`,`:71G:_Amount`,`50A_Present`,`50F_Present`,`50K_Present`,`59F_Present`,`DebtAcc`,`BeneAcc`) VALUES (10,'50f9e499-5648-4c89-a217-b06caff4b522','103','RPBNCN71','MYBNUS21','SIB000-NO-FX-010','CRED','200905USD8679,56','USD8679,56','','','DRLC/US/VA/0000000935\r\n 1/ZUZANNA FISHER\r\n 2/332086 PADDOCK AVE\r\n 3/US/HAMLIN','','RPBNCN71','','MYBNUS21','/0000000000000000000000000000003161\r\n 1/SEM ASLAN\r\n 2/305357 BRISTOL AVE\r\n 3/US/WOBURN','SHA','','','','2020-09-05 00:00:00','USD',8679.56,'USD',8679.56,'[[]]','','','','','','','','','False','True','False','True','0000000000000000000000000000003162','DRLC/US/VA/0000000935\r');
INSERT INTO messages (`msgno`,`UETR`,`Type`,`Sender`,`Receiver`,`20`,`23B`,`32A`,`33B`,`36`,`50A`,`50F`,`50K`,`52A`,`56A`,`57A`,`59F`,`:71A:`,`:71F:`,`:71G:`,`79`,`32A_Date`,`32A_Currency`,`32A_Amount`,`33B_Currency`,`33B_Amount`,`:71F:_Parsed`,`:71F:_0_Currency`,`:71F:_0_Amount`,`:71F:_1_Currency`,`:71F:_1_Amount`,`:71F:_2_Currency`,`:71F:_2_Amount`,`:71G:_Currency`,`:71G:_Amount`,`50A_Present`,`50F_Present`,`50K_Present`,`59F_Present`,`DebtAcc`,`BeneAcc`) VALUES (11,'50f9e499-5648-4c89-a217-b06caff4b522','103','MYBNUS21','RPBNCN71','SIB000-NO-FX-010','CRED','200905USD8679,56','USD8679,56','','','DRLC/US/VA/0000000935\r\n 1/ZUZANNA FISHER\r\n 2/332086 PADDOCK AVE\r\n 3/US/HAMLIN','','MYBNUS21','','RPBNCN71','/0000000000000000000000000000003161\r\n 1/SEM ASLAN\r\n 2/305357 BRISTOL AVE\r\n 3/US/WOBURN','SHA','','','','2020-09-05 00:00:00','USD',8679.56,'USD',8679.56,'[[]]','','','','','','','','','False','True','False','True','DRLC/US/VA/0000000935','0000000000000000000000000000003162\r');
INSERT INTO messages (`msgno`,`UETR`,`Type`,`Sender`,`Receiver`,`20`,`23B`,`32A`,`33B`,`36`,`50A`,`50F`,`50K`,`52A`,`56A`,`57A`,`59F`,`:71A:`,`:71F:`,`:71G:`,`79`,`32A_Date`,`32A_Currency`,`32A_Amount`,`33B_Currency`,`33B_Amount`,`:71F:_Parsed`,`:71F:_0_Currency`,`:71F:_0_Amount`,`:71F:_1_Currency`,`:71F:_1_Amount`,`:71F:_2_Currency`,`:71F:_2_Amount`,`:71G:_Currency`,`:71G:_Amount`,`50A_Present`,`50F_Present`,`50K_Present`,`59F_Present`,`DebtAcc`,`BeneAcc`) VALUES (12,'50f9e499-5648-4c89-a217-b06caff4b522','103','RPBNCN71','MYBNUS21','SIB000-NO-FX-010','CRED','200905USD8679,56','USD8679,56','','','DRLC/US/VA/0000000935\r\n 1/ZUZANNA FISHER\r\n 2/332086 PADDOCK AVE\r\n 3/US/HAMLIN','','RPBNCN71','','MYBNUS21','/0000000000000000000000000000003161\r\n 1/SEM ASLAN\r\n 2/305357 BRISTOL AVE\r\n 3/US/WOBURN','SHA','','','','2020-09-05 00:00:00','USD',8679.56,'USD',8679.56,'[[]]','','','','','','','','','False','True','False','True','0000000000000000000000000000003162','DRLC/US/VA/0000000935\r');
INSERT INTO messages (`msgno`,`UETR`,`Type`,`Sender`,`Receiver`,`20`,`23B`,`32A`,`33B`,`36`,`50A`,`50F`,`50K`,`52A`,`56A`,`57A`,`59F`,`:71A:`,`:71F:`,`:71G:`,`79`,`32A_Date`,`32A_Currency`,`32A_Amount`,`33B_Currency`,`33B_Amount`,`:71F:_Parsed`,`:71F:_0_Currency`,`:71F:_0_Amount`,`:71F:_1_Currency`,`:71F:_1_Amount`,`:71F:_2_Currency`,`:71F:_2_Amount`,`:71G:_Currency`,`:71G:_Amount`,`50A_Present`,`50F_Present`,`50K_Present`,`59F_Present`,`DebtAcc`,`BeneAcc`) VALUES (13,'50f9e499-5648-4c89-a217-b06caff4b522','103','MYBNUS21','RPBNCN71','SIB000-NO-FX-010','CRED','200905USD8679,56','USD8679,56','','','DRLC/US/VA/0000000935\r\n 1/ZUZANNA FISHER\r\n 2/332086 PADDOCK AVE\r\n 3/US/HAMLIN','','MYBNUS21','','RPBNCN71','/0000000000000000000000000000003161\r\n 1/SEM ASLAN\r\n 2/305357 BRISTOL AVE\r\n 3/US/WOBURN','SHA','','','','2020-09-05 00:00:00','USD',8679.56,'USD',8679.56,'[[]]','','','','','','','','','False','True','False','True','DRLC/US/VA/0000000935','0000000000000000000000000000003162\r');
INSERT INTO messages (`msgno`,`UETR`,`Type`,`Sender`,`Receiver`,`20`,`23B`,`32A`,`33B`,`36`,`50A`,`50F`,`50K`,`52A`,`56A`,`57A`,`59F`,`:71A:`,`:71F:`,`:71G:`,`79`,`32A_Date`,`32A_Currency`,`32A_Amount`,`33B_Currency`,`33B_Amount`,`:71F:_Parsed`,`:71F:_0_Currency`,`:71F:_0_Amount`,`:71F:_1_Currency`,`:71F:_1_Amount`,`:71F:_2_Currency`,`:71F:_2_Amount`,`:71G:_Currency`,`:71G:_Amount`,`50A_Present`,`50F_Present`,`50K_Present`,`59F_Present`,`DebtAcc`,`BeneAcc`) VALUES (14,'50f9e499-5648-4c89-a217-b06caff4b522','103','MYBNUS21','RPBNCN71','SIB000-NO-FX-010','CRED','200905USD8679,56','USD8679,56','','','DRLC/US/VA/0000000935\r\n 1/ZUZANNA FISHER\r\n 2/332086 PADDOCK AVE\r\n 3/US/HAMLIN','','MYBNUS21','','RPBNCN71','/0000000000000000000000000000003161\r\n 1/SEM ASLAN\r\n 2/305357 BRISTOL AVE\r\n 3/US/WOBURN','SHA','','','','2020-09-05 00:00:00','USD',8679.56,'USD',8679.56,'[[]]','','','','','','','','','False','True','False','True','DRLC/US/VA/0000000935','0000000000000000000000000000003163\r');
INSERT INTO messages (`msgno`,`UETR`,`Type`,`Sender`,`Receiver`,`20`,`23B`,`32A`,`33B`,`36`,`50A`,`50F`,`50K`,`52A`,`56A`,`57A`,`59F`,`:71A:`,`:71F:`,`:71G:`,`79`,`32A_Date`,`32A_Currency`,`32A_Amount`,`33B_Currency`,`33B_Amount`,`:71F:_Parsed`,`:71F:_0_Currency`,`:71F:_0_Amount`,`:71F:_1_Currency`,`:71F:_1_Amount`,`:71F:_2_Currency`,`:71F:_2_Amount`,`:71G:_Currency`,`:71G:_Amount`,`50A_Present`,`50F_Present`,`50K_Present`,`59F_Present`,`DebtAcc`,`BeneAcc`) VALUES (15,'50f9e499-5648-4c89-a217-b06caff4b522','103','MYBNUS21','RPBNCN71','SIB000-NO-FX-010','CRED','200905USD8679,56','USD8679,56','','','DRLC/US/VA/0000000935\r\n 1/ZUZANNA FISHER\r\n 2/332086 PADDOCK AVE\r\n 3/US/HAMLIN','','MYBNUS21','','RPBNCN71','/0000000000000000000000000000003161\r\n 1/SEM ASLAN\r\n 2/305357 BRISTOL AVE\r\n 3/US/WOBURN','SHA','','','','2020-09-05 00:00:00','USD',8679.56,'USD',8679.56,'[[]]','','','','','','','','','False','True','False','True','DRLC/US/VA/0000000934','0000000000000000000000000000003162\r');

INSERT INTO messages (`msgno`,`UETR`,`Type`,`Sender`,`Receiver`,`20`,`23B`,`32A`,`33B`,`36`,`50A`,`50F`,`50K`,`52A`,`56A`,`57A`,`59F`,`:71A:`,`:71F:`,`:71G:`,`79`,`32A_Date`,`32A_Currency`,`32A_Amount`,`33B_Currency`,`33B_Amount`,`:71F:_Parsed`,`:71F:_0_Currency`,`:71F:_0_Amount`,`:71F:_1_Currency`,`:71F:_1_Amount`,`:71F:_2_Currency`,`:71F:_2_Amount`,`:71G:_Currency`,`:71G:_Amount`,`50A_Present`,`50F_Present`,`50K_Present`,`59F_Present`,`DebtAcc`,`BeneAcc`) VALUES (16,'50f9e499-5648-4c89-a217-b06caff4b522','103','RPBNCN71','RPBNCN71','SIB000-NO-FX-010','CRED','200905USD8679,56','USD8679,56','','','DRLC/US/VA/0000000935\r\n 1/ZUZANNA FISHER\r\n 2/332086 PADDOCK AVE\r\n 3/US/HAMLIN','','RPBNCN71','','RPBNCN71','/0000000000000000000000000000003161\r\n 1/SEM ASLAN\r\n 2/305357 BRISTOL AVE\r\n 3/US/WOBURN','SHA','','','','2020-09-05 00:00:00','USD',8679.56,'USD',8679.56,'[[]]','','','','','','','','','False','True','False','True','0000000000000000000000000000003163','0000000000000000000000000000003162\r');
