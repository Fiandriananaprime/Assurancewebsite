CREATE EXTENSION IF NOT EXISTS pgcrypto;


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('0807f3d4-d28c-4cd5-8a2f-f7af1d26311b','user200@demo.com',crypt('test123', gen_salt('bf')),'client','2022-03-10');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('0807f3d4-d28c-4cd5-8a2f-f7af1d26311b','Fara','Rabe','Madagascar','2022-03-10',83,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('5c02d98d-7083-4027-8e62-e9616e8e042c','QX-200-0','0807f3d4-d28c-4cd5-8a2f-f7af1d26311b','habitation',669,'2023-03-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f165d963-4d12-4291-abdf-c02f5ae914f9','POLX-200-0','0807f3d4-d28c-4cd5-8a2f-f7af1d26311b','5c02d98d-7083-4027-8e62-e9616e8e042c','habitation','2023-03-22','2024-03-22',529,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('76ab8ecb-f9f5-40be-a7f2-e031eb35512b','QX-200-1','0807f3d4-d28c-4cd5-8a2f-f7af1d26311b','habitation',263,'2022-04-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('6ea8643f-08af-424c-83f2-d3c1601fa805','POLX-200-1','0807f3d4-d28c-4cd5-8a2f-f7af1d26311b','76ab8ecb-f9f5-40be-a7f2-e031eb35512b','habitation','2022-04-03','2023-04-03',630,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ad18cd70-5a3e-486d-ae0d-86f1c103d464','user201@demo.com',crypt('test123', gen_salt('bf')),'client','2021-07-27');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('ad18cd70-5a3e-486d-ae0d-86f1c103d464','Haja','Razanam','Madagascar','2021-07-27',45,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('418af382-55fc-466a-bb76-4e9eb726fd30','QX-201-0','ad18cd70-5a3e-486d-ae0d-86f1c103d464','habitation',547,'2023-04-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('140031be-9560-4fe9-be92-7a79885689a6','POLX-201-0','ad18cd70-5a3e-486d-ae0d-86f1c103d464','418af382-55fc-466a-bb76-4e9eb726fd30','habitation','2023-04-30','2024-04-30',596,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('93366407-e3b5-45df-b69a-a0d2f90007b4','QX-201-1','ad18cd70-5a3e-486d-ae0d-86f1c103d464','habitation',447,'2025-03-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('8454cd76-7e7e-4234-a8f1-82fbc5dcade7','POLX-201-1','ad18cd70-5a3e-486d-ae0d-86f1c103d464','93366407-e3b5-45df-b69a-a0d2f90007b4','habitation','2025-03-19','2026-03-19',250,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('e859b9d8-73ba-4bde-9883-191be07c209b','user202@demo.com',crypt('test123', gen_salt('bf')),'client','2023-08-19');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('e859b9d8-73ba-4bde-9883-191be07c209b','Elsa','Andrianina','Madagascar','2023-08-19',66,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9f405479-3d2f-4e1c-b7d3-4360a1877ea3','QX-202-0','e859b9d8-73ba-4bde-9883-191be07c209b','habitation',725,'2025-02-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('0223de4a-1be6-4020-9070-c595f7f3f4cf','POLX-202-0','e859b9d8-73ba-4bde-9883-191be07c209b','9f405479-3d2f-4e1c-b7d3-4360a1877ea3','habitation','2025-02-12','2026-02-12',458,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('6af4a0a4-2051-4f55-8727-d466651daa08','QX-202-1','e859b9d8-73ba-4bde-9883-191be07c209b','habitation',148,'2021-02-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('0229dcb2-0dcf-42e6-b7f0-6f43b9c963ba','POLX-202-1','e859b9d8-73ba-4bde-9883-191be07c209b','6af4a0a4-2051-4f55-8727-d466651daa08','habitation','2021-02-22','2022-02-22',190,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ff727f25-d095-4ad2-bce7-4bb27664885c','user203@demo.com',crypt('test123', gen_salt('bf')),'client','2020-12-09');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('ff727f25-d095-4ad2-bce7-4bb27664885c','Rina','Razafindrakoto','Madagascar','2020-12-09',44,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8322aecc-1382-4bdd-b562-09d3b414f7a9','QX-203-0','ff727f25-d095-4ad2-bce7-4bb27664885c','habitation',795,'2019-08-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e66df54c-349c-492f-9e37-1635348058c0','POLX-203-0','ff727f25-d095-4ad2-bce7-4bb27664885c','8322aecc-1382-4bdd-b562-09d3b414f7a9','habitation','2019-08-07','2020-08-07',563,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('bcfaf571-4d4c-44e6-a032-e6570abccb40','user204@demo.com',crypt('test123', gen_salt('bf')),'client','2023-06-02');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('bcfaf571-4d4c-44e6-a032-e6570abccb40','Kevin','Rakotondranaivo','Madagascar','2023-06-02',62,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('faa78078-51f4-4ea9-be04-7eb2e9fd1b76','QX-204-0','bcfaf571-4d4c-44e6-a032-e6570abccb40','habitation',521,'2019-05-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f9720d76-5562-4903-98fd-4a966ac82826','POLX-204-0','bcfaf571-4d4c-44e6-a032-e6570abccb40','faa78078-51f4-4ea9-be04-7eb2e9fd1b76','habitation','2019-05-22','2020-05-22',305,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ec14ced1-77ca-456c-91cb-13e12f738008','user205@demo.com',crypt('test123', gen_salt('bf')),'client','2021-11-07');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('ec14ced1-77ca-456c-91cb-13e12f738008','Tony','Rabe','Madagascar','2021-11-07',94,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('57f5b926-3661-4ac7-afaf-914c797064e9','QX-205-0','ec14ced1-77ca-456c-91cb-13e12f738008','habitation',431,'2021-05-29');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('8a6aa934-aaaf-4baa-a2d0-aee9f3849059','POLX-205-0','ec14ced1-77ca-456c-91cb-13e12f738008','57f5b926-3661-4ac7-afaf-914c797064e9','habitation','2021-05-29','2022-05-29',697,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('04668fec-da9c-40d0-8b67-ff54687e049b','user206@demo.com',crypt('test123', gen_salt('bf')),'client','2023-12-31');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('04668fec-da9c-40d0-8b67-ff54687e049b','Mialy','Andrianina','Madagascar','2023-12-31',55,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('95ff5789-b0c6-48a3-83dd-87770be5eaff','QX-206-0','04668fec-da9c-40d0-8b67-ff54687e049b','habitation',669,'2021-04-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('0dae7238-ba20-4f50-b1f8-239ace79aba3','POLX-206-0','04668fec-da9c-40d0-8b67-ff54687e049b','95ff5789-b0c6-48a3-83dd-87770be5eaff','habitation','2021-04-30','2022-04-30',542,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('871d8bca-1e90-4a30-961f-0febbefcae81','QX-206-1','04668fec-da9c-40d0-8b67-ff54687e049b','habitation',349,'2023-01-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5f85d56e-51a6-4b07-a150-73a607c5c60a','POLX-206-1','04668fec-da9c-40d0-8b67-ff54687e049b','871d8bca-1e90-4a30-961f-0febbefcae81','habitation','2023-01-10','2024-01-10',111,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('0c0b7758-bd36-4502-9d3e-6eaceb74a367','user207@demo.com',crypt('test123', gen_salt('bf')),'client','2022-02-16');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('0c0b7758-bd36-4502-9d3e-6eaceb74a367','Haja','Rakoto','Madagascar','2022-02-16',38,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2e3f2e3f-afcf-46b8-a33a-f15d2232c7c6','QX-207-0','0c0b7758-bd36-4502-9d3e-6eaceb74a367','habitation',675,'2025-07-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f7685db5-49ec-4f62-85b2-5e21ada33978','POLX-207-0','0c0b7758-bd36-4502-9d3e-6eaceb74a367','2e3f2e3f-afcf-46b8-a33a-f15d2232c7c6','habitation','2025-07-01','2026-07-01',192,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('95935cc4-ea2b-4821-bfb0-f7587a264908','user208@demo.com',crypt('test123', gen_salt('bf')),'client','2020-02-24');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('95935cc4-ea2b-4821-bfb0-f7587a264908','Nina','Rakoto','Madagascar','2020-02-24',33,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1d3f0548-ac2b-4054-9725-8fa226a02b60','QX-208-0','95935cc4-ea2b-4821-bfb0-f7587a264908','habitation',692,'2025-06-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('68f244c0-f3ad-4828-a17f-ed73827ae5a0','POLX-208-0','95935cc4-ea2b-4821-bfb0-f7587a264908','1d3f0548-ac2b-4054-9725-8fa226a02b60','habitation','2025-06-01','2026-06-01',602,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('63745506-658b-4894-ae78-63ec1ebc24ee','QX-208-1','95935cc4-ea2b-4821-bfb0-f7587a264908','habitation',208,'2023-10-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('957c92c0-34fc-4f3d-96cf-6c8ebece5efc','POLX-208-1','95935cc4-ea2b-4821-bfb0-f7587a264908','63745506-658b-4894-ae78-63ec1ebc24ee','habitation','2023-10-09','2024-10-09',694,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('2251a77d-5b56-489a-beaa-8e831729634a','user209@demo.com',crypt('test123', gen_salt('bf')),'client','2024-05-07');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('2251a77d-5b56-489a-beaa-8e831729634a','Tojo','Rabe','Madagascar','2024-05-07',72,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a967cc21-3c46-4e3c-a4e9-2c368e22058f','QX-209-0','2251a77d-5b56-489a-beaa-8e831729634a','habitation',618,'2020-09-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('ec4661be-8054-4693-bfcb-0b7d19a6989b','POLX-209-0','2251a77d-5b56-489a-beaa-8e831729634a','a967cc21-3c46-4e3c-a4e9-2c368e22058f','habitation','2020-09-02','2021-09-02',367,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('0ba9b3d1-9323-4fad-a364-2a6d1e961565','user210@demo.com',crypt('test123', gen_salt('bf')),'client','2019-07-09');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('0ba9b3d1-9323-4fad-a364-2a6d1e961565','Nina','Andrianina','Madagascar','2019-07-09',58,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('02dbdb5b-c3d2-4f0c-80c9-e5957cf8a728','QX-210-0','0ba9b3d1-9323-4fad-a364-2a6d1e961565','habitation',785,'2022-08-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('177b8eb5-3d97-4d4b-be2c-5c504ab97e99','POLX-210-0','0ba9b3d1-9323-4fad-a364-2a6d1e961565','02dbdb5b-c3d2-4f0c-80c9-e5957cf8a728','habitation','2022-08-13','2023-08-13',567,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('4a6a220f-22db-40e3-b7b8-32e50755adcd','QX-210-1','0ba9b3d1-9323-4fad-a364-2a6d1e961565','habitation',713,'2023-02-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('28903182-0fc8-4165-97f8-b2ccb0984d9d','POLX-210-1','0ba9b3d1-9323-4fad-a364-2a6d1e961565','4a6a220f-22db-40e3-b7b8-32e50755adcd','habitation','2023-02-27','2024-02-27',245,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('5fd1e99c-6d92-4d7f-bcd3-2ed289f49378','user211@demo.com',crypt('test123', gen_salt('bf')),'client','2024-05-26');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('5fd1e99c-6d92-4d7f-bcd3-2ed289f49378','Kevin','Rasoanaivo','Madagascar','2024-05-26',62,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9299d582-2fa4-45d9-b2f8-784d2fa933a9','QX-211-0','5fd1e99c-6d92-4d7f-bcd3-2ed289f49378','habitation',111,'2020-06-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('79a1f46a-9e3d-4be2-82a4-341f4dbccab8','POLX-211-0','5fd1e99c-6d92-4d7f-bcd3-2ed289f49378','9299d582-2fa4-45d9-b2f8-784d2fa933a9','habitation','2020-06-11','2021-06-11',451,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('679f8798-0729-4c73-9f47-71413ce53789','QX-211-1','5fd1e99c-6d92-4d7f-bcd3-2ed289f49378','habitation',771,'2021-02-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('6c91d7c2-2553-4e09-a37c-1006be1d3ccb','POLX-211-1','5fd1e99c-6d92-4d7f-bcd3-2ed289f49378','679f8798-0729-4c73-9f47-71413ce53789','habitation','2021-02-14','2022-02-14',619,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('0453633b-dd37-4240-bb1b-e9bd4472b739','user212@demo.com',crypt('test123', gen_salt('bf')),'client','2024-02-02');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('0453633b-dd37-4240-bb1b-e9bd4472b739','Tojo','Rakoto','Madagascar','2024-02-02',46,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('aaf6d056-861b-49dc-86d3-b457e0d6efe0','QX-212-0','0453633b-dd37-4240-bb1b-e9bd4472b739','habitation',176,'2019-08-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('8016fbe4-1cae-4167-80f2-8f58ac629ed0','POLX-212-0','0453633b-dd37-4240-bb1b-e9bd4472b739','aaf6d056-861b-49dc-86d3-b457e0d6efe0','habitation','2019-08-26','2020-08-26',440,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('98988171-2810-4f74-9bf9-02fea0448784','user213@demo.com',crypt('test123', gen_salt('bf')),'client','2024-04-17');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('98988171-2810-4f74-9bf9-02fea0448784','Rina','Razafindrakoto','Madagascar','2024-04-17',82,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('78603333-e3cd-4c96-b164-de96ac802b1a','QX-213-0','98988171-2810-4f74-9bf9-02fea0448784','habitation',302,'2026-04-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('3d0832c9-322e-4f5b-9c7d-4287928daa68','POLX-213-0','98988171-2810-4f74-9bf9-02fea0448784','78603333-e3cd-4c96-b164-de96ac802b1a','habitation','2026-04-05','2027-04-05',428,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('0e7757f5-b781-447e-9dfe-e530865b156f','user214@demo.com',crypt('test123', gen_salt('bf')),'client','2019-01-17');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('0e7757f5-b781-447e-9dfe-e530865b156f','Elsa','Rakoto','Madagascar','2019-01-17',94,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9e32b6f4-e5bf-449a-b227-476e41c13b67','QX-214-0','0e7757f5-b781-447e-9dfe-e530865b156f','habitation',467,'2025-06-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('d1447570-9086-44e7-83ca-752da88da945','POLX-214-0','0e7757f5-b781-447e-9dfe-e530865b156f','9e32b6f4-e5bf-449a-b227-476e41c13b67','habitation','2025-06-03','2026-06-03',320,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('5b3a400a-5603-44e2-8526-639e4704860a','user215@demo.com',crypt('test123', gen_salt('bf')),'client','2020-08-04');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('5b3a400a-5603-44e2-8526-639e4704860a','Fara','Rabe','Madagascar','2020-08-04',86,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('74343c92-b7e4-4474-b717-9471fdf0aaaf','QX-215-0','5b3a400a-5603-44e2-8526-639e4704860a','habitation',502,'2024-04-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('d41a51cb-1086-4509-b69e-5fc890467e56','POLX-215-0','5b3a400a-5603-44e2-8526-639e4704860a','74343c92-b7e4-4474-b717-9471fdf0aaaf','habitation','2024-04-12','2025-04-12',777,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3d56d289-70d8-4487-9a61-0ada4ead4ea0','QX-215-1','5b3a400a-5603-44e2-8526-639e4704860a','habitation',621,'2021-03-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('b02ae915-3a01-494c-b4aa-060611250c2d','POLX-215-1','5b3a400a-5603-44e2-8526-639e4704860a','3d56d289-70d8-4487-9a61-0ada4ead4ea0','habitation','2021-03-30','2022-03-30',628,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('90389770-a54c-4d2d-82ff-4db41444e36a','user216@demo.com',crypt('test123', gen_salt('bf')),'client','2023-06-02');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('90389770-a54c-4d2d-82ff-4db41444e36a','Tony','Razanam','Madagascar','2023-06-02',31,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('cfa5307e-a9aa-441e-af25-1534ccbf3be1','QX-216-0','90389770-a54c-4d2d-82ff-4db41444e36a','habitation',279,'2020-10-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('a0fd98a2-39d1-416a-a117-b38f3fbfac33','POLX-216-0','90389770-a54c-4d2d-82ff-4db41444e36a','cfa5307e-a9aa-441e-af25-1534ccbf3be1','habitation','2020-10-21','2021-10-21',611,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('402103eb-2026-483f-8a77-8ae0f2e9e057','QX-216-1','90389770-a54c-4d2d-82ff-4db41444e36a','habitation',143,'2024-11-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('296b49f3-027f-49bf-a325-abb18e43bd4b','POLX-216-1','90389770-a54c-4d2d-82ff-4db41444e36a','402103eb-2026-483f-8a77-8ae0f2e9e057','habitation','2024-11-14','2025-11-14',363,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('6ddea10d-d8ba-4069-a9de-d16b23a80369','user217@demo.com',crypt('test123', gen_salt('bf')),'client','2022-10-22');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('6ddea10d-d8ba-4069-a9de-d16b23a80369','Haja','Rafidy','Madagascar','2022-10-22',64,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7111ec63-8e0f-47c2-b6e0-1d45c938e8fe','QX-217-0','6ddea10d-d8ba-4069-a9de-d16b23a80369','habitation',132,'2023-03-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('493ea08e-7beb-4767-828a-9f3e422a7367','POLX-217-0','6ddea10d-d8ba-4069-a9de-d16b23a80369','7111ec63-8e0f-47c2-b6e0-1d45c938e8fe','habitation','2023-03-23','2024-03-23',436,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('5163800b-b6c9-4a6c-8010-5965699f7fe7','user218@demo.com',crypt('test123', gen_salt('bf')),'client','2019-02-23');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('5163800b-b6c9-4a6c-8010-5965699f7fe7','Rina','Rakotondranaivo','Madagascar','2019-02-23',91,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3ceab075-98ca-44d1-91db-0143f503f660','QX-218-0','5163800b-b6c9-4a6c-8010-5965699f7fe7','habitation',673,'2026-02-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('9ef159fa-81a0-4a73-818a-2f005b024c79','POLX-218-0','5163800b-b6c9-4a6c-8010-5965699f7fe7','3ceab075-98ca-44d1-91db-0143f503f660','habitation','2026-02-17','2027-02-17',111,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('05660770-f2fb-4b38-966b-3a7f4710592e','QX-218-1','5163800b-b6c9-4a6c-8010-5965699f7fe7','habitation',570,'2020-02-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('98b31719-de88-470d-9966-4c06009fe6d1','POLX-218-1','5163800b-b6c9-4a6c-8010-5965699f7fe7','05660770-f2fb-4b38-966b-3a7f4710592e','habitation','2020-02-11','2021-02-11',678,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ccf76a40-2bc6-4744-83b0-eb3e954d0a60','user219@demo.com',crypt('test123', gen_salt('bf')),'client','2019-06-04');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('ccf76a40-2bc6-4744-83b0-eb3e954d0a60','Tojo','Rafidy','Madagascar','2019-06-04',84,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8a2582ab-c2fa-47fc-bd6b-37d70713b4e4','QX-219-0','ccf76a40-2bc6-4744-83b0-eb3e954d0a60','habitation',497,'2019-06-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('1c91eea0-7a1c-4733-9032-a16e9a975e7d','POLX-219-0','ccf76a40-2bc6-4744-83b0-eb3e954d0a60','8a2582ab-c2fa-47fc-bd6b-37d70713b4e4','habitation','2019-06-26','2020-06-26',143,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('17018dc5-b1a1-45c7-b827-7ce2f1fd1627','QX-219-1','ccf76a40-2bc6-4744-83b0-eb3e954d0a60','habitation',345,'2023-02-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('7d869cb7-a3fb-4522-9604-b8a4e80f3689','POLX-219-1','ccf76a40-2bc6-4744-83b0-eb3e954d0a60','17018dc5-b1a1-45c7-b827-7ce2f1fd1627','habitation','2023-02-11','2024-02-11',255,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('eae66002-3a18-49be-ba23-c79dc21f5bee','user220@demo.com',crypt('test123', gen_salt('bf')),'client','2021-09-29');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('eae66002-3a18-49be-ba23-c79dc21f5bee','Fara','Rabe','Madagascar','2021-09-29',70,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('08d5ae33-b227-494e-950f-3e9b63899353','QX-220-0','eae66002-3a18-49be-ba23-c79dc21f5bee','habitation',581,'2019-09-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('2cd44971-a3d4-460a-96a5-069344d6ecdd','POLX-220-0','eae66002-3a18-49be-ba23-c79dc21f5bee','08d5ae33-b227-494e-950f-3e9b63899353','habitation','2019-09-01','2020-09-01',655,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('860784be-0f2a-4069-9c0f-de31a78f4124','QX-220-1','eae66002-3a18-49be-ba23-c79dc21f5bee','habitation',124,'2019-02-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('24f8bd37-c686-4ae7-8663-b0e6b822263c','POLX-220-1','eae66002-3a18-49be-ba23-c79dc21f5bee','860784be-0f2a-4069-9c0f-de31a78f4124','habitation','2019-02-08','2020-02-08',761,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('8a4a6d50-ff58-4a9e-882f-a25ab63c94aa','user221@demo.com',crypt('test123', gen_salt('bf')),'client','2020-02-27');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('8a4a6d50-ff58-4a9e-882f-a25ab63c94aa','Tony','Rafidy','Madagascar','2020-02-27',44,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('51d4209d-618d-4826-820f-1813f0551775','QX-221-0','8a4a6d50-ff58-4a9e-882f-a25ab63c94aa','habitation',669,'2025-01-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('d6d30cfb-fcee-4cc7-a504-6d932f15883d','POLX-221-0','8a4a6d50-ff58-4a9e-882f-a25ab63c94aa','51d4209d-618d-4826-820f-1813f0551775','habitation','2025-01-23','2026-01-23',212,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('7d0912ac-0baa-47ca-ba8d-76541ef7bd8b','user222@demo.com',crypt('test123', gen_salt('bf')),'client','2020-08-08');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('7d0912ac-0baa-47ca-ba8d-76541ef7bd8b','Mialy','Rakoto','Madagascar','2020-08-08',46,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9e841959-ea95-40c1-907b-e5f391ac172f','QX-222-0','7d0912ac-0baa-47ca-ba8d-76541ef7bd8b','habitation',441,'2022-12-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f5864318-73cb-46de-8f02-c381b92808e9','POLX-222-0','7d0912ac-0baa-47ca-ba8d-76541ef7bd8b','9e841959-ea95-40c1-907b-e5f391ac172f','habitation','2022-12-19','2023-12-19',756,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('e0733b52-6a45-48a1-8a54-add131e7939a','user223@demo.com',crypt('test123', gen_salt('bf')),'client','2024-04-15');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('e0733b52-6a45-48a1-8a54-add131e7939a','Mialy','Rakoto','Madagascar','2024-04-15',45,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('fa2f89d2-92a1-4474-958d-c0bd2c21fd5b','QX-223-0','e0733b52-6a45-48a1-8a54-add131e7939a','habitation',428,'2025-10-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f3453cc0-8364-4cf6-986f-403e9ecd93c5','POLX-223-0','e0733b52-6a45-48a1-8a54-add131e7939a','fa2f89d2-92a1-4474-958d-c0bd2c21fd5b','habitation','2025-10-06','2026-10-06',528,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('46842584-5752-49d5-96de-3e7add7f2811','QX-223-1','e0733b52-6a45-48a1-8a54-add131e7939a','habitation',298,'2022-09-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('1d72d370-bb11-4a94-bc24-e05d60cf20a4','POLX-223-1','e0733b52-6a45-48a1-8a54-add131e7939a','46842584-5752-49d5-96de-3e7add7f2811','habitation','2022-09-05','2023-09-05',530,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('9170f08b-0fb0-4937-b712-70d385bd5870','user224@demo.com',crypt('test123', gen_salt('bf')),'client','2022-10-08');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('9170f08b-0fb0-4937-b712-70d385bd5870','Kevin','Razafindrakoto','Madagascar','2022-10-08',25,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('5362cb97-07d8-4433-9001-7fd64200aca2','QX-224-0','9170f08b-0fb0-4937-b712-70d385bd5870','habitation',563,'2025-02-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('862c9149-a50b-4558-bfdf-5db345e2e32e','POLX-224-0','9170f08b-0fb0-4937-b712-70d385bd5870','5362cb97-07d8-4433-9001-7fd64200aca2','habitation','2025-02-13','2026-02-13',203,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('55ee1d0e-61f7-4fff-b8cf-99614f79fdb7','QX-224-1','9170f08b-0fb0-4937-b712-70d385bd5870','habitation',187,'2023-06-29');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('06bbc584-7229-4813-9cb8-821457a4ca17','POLX-224-1','9170f08b-0fb0-4937-b712-70d385bd5870','55ee1d0e-61f7-4fff-b8cf-99614f79fdb7','habitation','2023-06-29','2024-06-29',299,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('9ca540f4-e2ee-42cf-944c-7e30c1eda50a','user225@demo.com',crypt('test123', gen_salt('bf')),'client','2024-09-19');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('9ca540f4-e2ee-42cf-944c-7e30c1eda50a','Rina','Razafindrakoto','Madagascar','2024-09-19',60,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a8317716-fc86-4543-b391-9b3c4eafa9bb','QX-225-0','9ca540f4-e2ee-42cf-944c-7e30c1eda50a','habitation',481,'2024-06-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('9c25b328-96a3-460c-b5be-a013b30727b8','POLX-225-0','9ca540f4-e2ee-42cf-944c-7e30c1eda50a','a8317716-fc86-4543-b391-9b3c4eafa9bb','habitation','2024-06-28','2025-06-28',346,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b8eed574-c644-44ca-ac96-94e55c427231','QX-225-1','9ca540f4-e2ee-42cf-944c-7e30c1eda50a','habitation',165,'2025-04-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('a28267c7-3556-4908-90e5-9231f9a939f0','POLX-225-1','9ca540f4-e2ee-42cf-944c-7e30c1eda50a','b8eed574-c644-44ca-ac96-94e55c427231','habitation','2025-04-26','2026-04-26',675,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a21aa4a0-f318-472d-ba45-c0d766a7a71b','user226@demo.com',crypt('test123', gen_salt('bf')),'client','2021-10-27');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('a21aa4a0-f318-472d-ba45-c0d766a7a71b','Mialy','Razanam','Madagascar','2021-10-27',20,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('bffcf624-4ad5-4bae-b81f-98e5ea07d189','QX-226-0','a21aa4a0-f318-472d-ba45-c0d766a7a71b','habitation',421,'2021-09-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('90e008e6-0571-4008-8eb7-82b061851608','POLX-226-0','a21aa4a0-f318-472d-ba45-c0d766a7a71b','bffcf624-4ad5-4bae-b81f-98e5ea07d189','habitation','2021-09-09','2022-09-09',120,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f61f9b15-0d26-400f-8f6e-8031587698c5','QX-226-1','a21aa4a0-f318-472d-ba45-c0d766a7a71b','habitation',283,'2023-10-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('3b4aa537-287a-4213-ac07-2e83b7face17','POLX-226-1','a21aa4a0-f318-472d-ba45-c0d766a7a71b','f61f9b15-0d26-400f-8f6e-8031587698c5','habitation','2023-10-21','2024-10-21',213,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('5e1d4a8b-3653-4519-9f61-d7bd466f352d','user227@demo.com',crypt('test123', gen_salt('bf')),'client','2023-11-21');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('5e1d4a8b-3653-4519-9f61-d7bd466f352d','Nina','Razafindrakoto','Madagascar','2023-11-21',96,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('640b92e6-ba4f-462a-ae8a-9ece55589515','QX-227-0','5e1d4a8b-3653-4519-9f61-d7bd466f352d','habitation',487,'2025-08-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('9db5d666-c8e6-446e-ae6b-5744f299a557','POLX-227-0','5e1d4a8b-3653-4519-9f61-d7bd466f352d','640b92e6-ba4f-462a-ae8a-9ece55589515','habitation','2025-08-23','2026-08-23',782,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('82292967-1843-4a6a-96f4-8a5c34f73206','QX-227-1','5e1d4a8b-3653-4519-9f61-d7bd466f352d','habitation',309,'2019-05-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('0537c4f7-ccbe-4f9c-92ae-087288785463','POLX-227-1','5e1d4a8b-3653-4519-9f61-d7bd466f352d','82292967-1843-4a6a-96f4-8a5c34f73206','habitation','2019-05-12','2020-05-12',792,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('27660f6c-a7b2-4003-af72-d72b7c8b06ed','user228@demo.com',crypt('test123', gen_salt('bf')),'client','2019-07-09');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('27660f6c-a7b2-4003-af72-d72b7c8b06ed','Tojo','Rafidy','Madagascar','2019-07-09',96,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d2f6d978-7b7f-4e0d-bcc5-fee71d5631f4','QX-228-0','27660f6c-a7b2-4003-af72-d72b7c8b06ed','habitation',118,'2025-06-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('69a5d009-08d9-4e02-a296-8b4e041e95b5','POLX-228-0','27660f6c-a7b2-4003-af72-d72b7c8b06ed','d2f6d978-7b7f-4e0d-bcc5-fee71d5631f4','habitation','2025-06-03','2026-06-03',416,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('604acdfc-ddfd-4dbf-b75b-9dcaa6706a55','user229@demo.com',crypt('test123', gen_salt('bf')),'client','2022-10-04');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('604acdfc-ddfd-4dbf-b75b-9dcaa6706a55','Nina','Rakotondranaivo','Madagascar','2022-10-04',74,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ceaf6087-5758-4b78-a292-e7d4d55c1e14','QX-229-0','604acdfc-ddfd-4dbf-b75b-9dcaa6706a55','habitation',663,'2022-05-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('491065fb-6ca7-4423-8a3a-e77bc727f706','POLX-229-0','604acdfc-ddfd-4dbf-b75b-9dcaa6706a55','ceaf6087-5758-4b78-a292-e7d4d55c1e14','habitation','2022-05-07','2023-05-07',438,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a3982695-7695-498e-93d5-9abd64384bca','user230@demo.com',crypt('test123', gen_salt('bf')),'client','2021-03-24');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('a3982695-7695-498e-93d5-9abd64384bca','Nina','Rafidy','Madagascar','2021-03-24',53,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2989fd1a-867f-472a-be62-b61ec77ebb71','QX-230-0','a3982695-7695-498e-93d5-9abd64384bca','habitation',523,'2022-12-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5e35b6cd-febb-4d31-b73e-7ea03c236e46','POLX-230-0','a3982695-7695-498e-93d5-9abd64384bca','2989fd1a-867f-472a-be62-b61ec77ebb71','habitation','2022-12-25','2023-12-25',221,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('da1862c9-4916-486a-89d8-4ff8cede8e7a','user231@demo.com',crypt('test123', gen_salt('bf')),'client','2025-01-28');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('da1862c9-4916-486a-89d8-4ff8cede8e7a','Rina','Rabe','Madagascar','2025-01-28',74,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b7ff05a6-bf6a-4909-b18f-c03470e2d068','QX-231-0','da1862c9-4916-486a-89d8-4ff8cede8e7a','habitation',305,'2020-07-29');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('6ae12bbc-9351-4e2a-a307-6d2e792b7f8a','POLX-231-0','da1862c9-4916-486a-89d8-4ff8cede8e7a','b7ff05a6-bf6a-4909-b18f-c03470e2d068','habitation','2020-07-29','2021-07-29',266,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('80044a01-c2cc-42e7-96cf-de208e56d6af','user232@demo.com',crypt('test123', gen_salt('bf')),'client','2022-02-09');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('80044a01-c2cc-42e7-96cf-de208e56d6af','Rina','Rasoanaivo','Madagascar','2022-02-09',87,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('030fa114-3ac7-4499-a073-46f09e77cfd9','QX-232-0','80044a01-c2cc-42e7-96cf-de208e56d6af','habitation',419,'2022-08-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('24793d8a-1ec7-4aed-ac95-6ced3f8fa81d','POLX-232-0','80044a01-c2cc-42e7-96cf-de208e56d6af','030fa114-3ac7-4499-a073-46f09e77cfd9','habitation','2022-08-24','2023-08-24',380,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b4b138aa-9abf-4187-9337-b99f74c54e99','QX-232-1','80044a01-c2cc-42e7-96cf-de208e56d6af','habitation',798,'2025-08-31');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('96509cde-c274-4904-a490-0c31912cfc40','POLX-232-1','80044a01-c2cc-42e7-96cf-de208e56d6af','b4b138aa-9abf-4187-9337-b99f74c54e99','habitation','2025-08-31','2026-08-31',334,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('04982a0a-9731-4e70-93a1-5fefda718447','user233@demo.com',crypt('test123', gen_salt('bf')),'client','2022-06-11');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('04982a0a-9731-4e70-93a1-5fefda718447','Fara','Rabe','Madagascar','2022-06-11',89,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('005fa629-b2f3-44a9-b8c8-2872d817587d','QX-233-0','04982a0a-9731-4e70-93a1-5fefda718447','habitation',316,'2022-01-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('37f96c63-6460-4c6a-9a03-11f34731e1bc','POLX-233-0','04982a0a-9731-4e70-93a1-5fefda718447','005fa629-b2f3-44a9-b8c8-2872d817587d','habitation','2022-01-17','2023-01-17',448,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('062ad5e2-8755-44d7-acc6-a28b8129737d','QX-233-1','04982a0a-9731-4e70-93a1-5fefda718447','habitation',764,'2021-05-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('12b992bd-2dde-4078-8e6c-fb3251cfa946','POLX-233-1','04982a0a-9731-4e70-93a1-5fefda718447','062ad5e2-8755-44d7-acc6-a28b8129737d','habitation','2021-05-16','2022-05-16',334,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('583da3db-5466-4506-8258-9111773a1754','user234@demo.com',crypt('test123', gen_salt('bf')),'client','2024-01-12');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('583da3db-5466-4506-8258-9111773a1754','Tony','Razafindrakoto','Madagascar','2024-01-12',55,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('fec3bdce-68ab-456a-9801-77e72c506954','QX-234-0','583da3db-5466-4506-8258-9111773a1754','habitation',288,'2019-05-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('ff6d6082-1f5e-48ee-8223-30226c72e928','POLX-234-0','583da3db-5466-4506-8258-9111773a1754','fec3bdce-68ab-456a-9801-77e72c506954','habitation','2019-05-09','2020-05-09',741,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('b5370d04-b1bc-4b7d-b6e9-853ac6448395','user235@demo.com',crypt('test123', gen_salt('bf')),'client','2021-10-24');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('b5370d04-b1bc-4b7d-b6e9-853ac6448395','Fara','Rafidy','Madagascar','2021-10-24',44,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('70792afc-7064-426c-8cd5-1cecd942b5a7','QX-235-0','b5370d04-b1bc-4b7d-b6e9-853ac6448395','habitation',154,'2025-10-29');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('69dd1baf-669b-4c7a-9752-0a43cfe09073','POLX-235-0','b5370d04-b1bc-4b7d-b6e9-853ac6448395','70792afc-7064-426c-8cd5-1cecd942b5a7','habitation','2025-10-29','2026-10-29',756,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('3df24941-bbce-4105-a647-c90e6370ada0','user236@demo.com',crypt('test123', gen_salt('bf')),'client','2019-02-07');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('3df24941-bbce-4105-a647-c90e6370ada0','Fara','Razafindrakoto','Madagascar','2019-02-07',43,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b3c4a2ee-88a7-49ed-97c7-11b5b3ac865b','QX-236-0','3df24941-bbce-4105-a647-c90e6370ada0','habitation',549,'2020-11-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('88d0ef6e-6602-4535-beb9-d59afd36fcfd','POLX-236-0','3df24941-bbce-4105-a647-c90e6370ada0','b3c4a2ee-88a7-49ed-97c7-11b5b3ac865b','habitation','2020-11-06','2021-11-06',127,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0abd92de-1a3a-4fd6-9c01-bdb990441ec5','QX-236-1','3df24941-bbce-4105-a647-c90e6370ada0','habitation',618,'2024-05-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('53a712f5-d730-40f3-996c-fcbd3ae39118','POLX-236-1','3df24941-bbce-4105-a647-c90e6370ada0','0abd92de-1a3a-4fd6-9c01-bdb990441ec5','habitation','2024-05-30','2025-05-30',311,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('7f9f0a0c-bf99-4812-be74-e76e9abf8e6a','user237@demo.com',crypt('test123', gen_salt('bf')),'client','2022-09-17');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('7f9f0a0c-bf99-4812-be74-e76e9abf8e6a','Mialy','Rakotondranaivo','Madagascar','2022-09-17',83,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3e504d91-0ede-4d95-9416-5899cd140dec','QX-237-0','7f9f0a0c-bf99-4812-be74-e76e9abf8e6a','habitation',762,'2023-10-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('13f450dc-5f0b-4d41-9341-625b6b7ed062','POLX-237-0','7f9f0a0c-bf99-4812-be74-e76e9abf8e6a','3e504d91-0ede-4d95-9416-5899cd140dec','habitation','2023-10-25','2024-10-25',567,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('acaa3cc3-839c-446b-af7b-a5b951443240','user238@demo.com',crypt('test123', gen_salt('bf')),'client','2025-01-19');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('acaa3cc3-839c-446b-af7b-a5b951443240','Tony','Rakotondranaivo','Madagascar','2025-01-19',37,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('dd5fa9b5-a210-4bc8-888a-22944941a346','QX-238-0','acaa3cc3-839c-446b-af7b-a5b951443240','habitation',339,'2024-01-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('4267a29e-2141-4b0a-af1f-648897df9a51','POLX-238-0','acaa3cc3-839c-446b-af7b-a5b951443240','dd5fa9b5-a210-4bc8-888a-22944941a346','habitation','2024-01-20','2025-01-20',150,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('be2859b7-4175-425b-8bb7-2fff425dcb64','user239@demo.com',crypt('test123', gen_salt('bf')),'client','2022-11-06');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('be2859b7-4175-425b-8bb7-2fff425dcb64','Sarah','Razanam','Madagascar','2022-11-06',62,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f05ca144-6e79-4a0d-932e-aad1ff55c0b2','QX-239-0','be2859b7-4175-425b-8bb7-2fff425dcb64','habitation',186,'2023-07-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('c8cc19df-3af1-4d79-8f5d-b03e9013e19a','POLX-239-0','be2859b7-4175-425b-8bb7-2fff425dcb64','f05ca144-6e79-4a0d-932e-aad1ff55c0b2','habitation','2023-07-09','2024-07-09',437,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('108c7906-a6ab-4eb8-b07f-11f1b576dc05','QX-239-1','be2859b7-4175-425b-8bb7-2fff425dcb64','habitation',353,'2024-03-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('ae1344c5-2d54-45fa-af00-d3008a6a4ee1','POLX-239-1','be2859b7-4175-425b-8bb7-2fff425dcb64','108c7906-a6ab-4eb8-b07f-11f1b576dc05','habitation','2024-03-11','2025-03-11',406,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('6effa8c7-758f-4336-8bdd-934247fd29f5','user240@demo.com',crypt('test123', gen_salt('bf')),'client','2020-02-11');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('6effa8c7-758f-4336-8bdd-934247fd29f5','Rina','Razanam','Madagascar','2020-02-11',51,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7e586c5b-1aff-469f-b2c9-6c4c68389262','QX-240-0','6effa8c7-758f-4336-8bdd-934247fd29f5','habitation',137,'2022-06-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('b8425c32-adc7-45d5-b326-ac5b6074b5ec','POLX-240-0','6effa8c7-758f-4336-8bdd-934247fd29f5','7e586c5b-1aff-469f-b2c9-6c4c68389262','habitation','2022-06-13','2023-06-13',444,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('4adf2e6e-3d0e-4fbf-8577-d8af477b8af6','QX-240-1','6effa8c7-758f-4336-8bdd-934247fd29f5','habitation',690,'2025-01-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('63e31811-37d6-4180-9cc4-d28ef7ceb8da','POLX-240-1','6effa8c7-758f-4336-8bdd-934247fd29f5','4adf2e6e-3d0e-4fbf-8577-d8af477b8af6','habitation','2025-01-12','2026-01-12',401,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('0ff46b53-9900-4048-9445-e64d6bdc8629','user241@demo.com',crypt('test123', gen_salt('bf')),'client','2023-03-29');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('0ff46b53-9900-4048-9445-e64d6bdc8629','Kevin','Razafindrakoto','Madagascar','2023-03-29',75,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7589019d-b119-43b2-bfdb-e070f851001a','QX-241-0','0ff46b53-9900-4048-9445-e64d6bdc8629','habitation',365,'2025-06-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5446c503-c9b1-401b-a47b-cbd2d527d68e','POLX-241-0','0ff46b53-9900-4048-9445-e64d6bdc8629','7589019d-b119-43b2-bfdb-e070f851001a','habitation','2025-06-24','2026-06-24',547,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('33e4cb43-0660-4006-a849-15247499fc10','user242@demo.com',crypt('test123', gen_salt('bf')),'client','2020-08-31');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('33e4cb43-0660-4006-a849-15247499fc10','Rina','Rabe','Madagascar','2020-08-31',59,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('6f15b138-8e5d-4872-b8ef-651b469b512c','QX-242-0','33e4cb43-0660-4006-a849-15247499fc10','habitation',712,'2019-11-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('4f78e5a9-0d93-4cc4-9e87-05dd9f607774','POLX-242-0','33e4cb43-0660-4006-a849-15247499fc10','6f15b138-8e5d-4872-b8ef-651b469b512c','habitation','2019-11-01','2020-11-01',133,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1c9a9b38-b7e0-421c-8550-110f83f3300e','QX-242-1','33e4cb43-0660-4006-a849-15247499fc10','habitation',249,'2022-10-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('22fb8184-48cf-4860-a580-5c40498e0c94','POLX-242-1','33e4cb43-0660-4006-a849-15247499fc10','1c9a9b38-b7e0-421c-8550-110f83f3300e','habitation','2022-10-21','2023-10-21',173,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('d9d560fd-757a-4cb1-b926-17b01a04a681','user243@demo.com',crypt('test123', gen_salt('bf')),'client','2021-09-29');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('d9d560fd-757a-4cb1-b926-17b01a04a681','Sarah','Rafidy','Madagascar','2021-09-29',75,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('42ac82d3-a28d-40ba-8993-156040615563','QX-243-0','d9d560fd-757a-4cb1-b926-17b01a04a681','habitation',144,'2024-06-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('84522bac-14e1-49c1-bc7f-415e001205ac','POLX-243-0','d9d560fd-757a-4cb1-b926-17b01a04a681','42ac82d3-a28d-40ba-8993-156040615563','habitation','2024-06-04','2025-06-04',154,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('f2bf5c68-3a59-41f3-97b7-150bfd1b2435','user244@demo.com',crypt('test123', gen_salt('bf')),'client','2024-06-26');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('f2bf5c68-3a59-41f3-97b7-150bfd1b2435','Fara','Razanam','Madagascar','2024-06-26',54,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3b1833fc-17fd-4bb3-b90d-891d639143b0','QX-244-0','f2bf5c68-3a59-41f3-97b7-150bfd1b2435','habitation',145,'2022-01-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('95ecd4df-d932-4a56-96ec-842c13b01bec','POLX-244-0','f2bf5c68-3a59-41f3-97b7-150bfd1b2435','3b1833fc-17fd-4bb3-b90d-891d639143b0','habitation','2022-01-24','2023-01-24',456,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3ed37d3e-9cb0-45a3-a7d0-3d973364e3e4','QX-244-1','f2bf5c68-3a59-41f3-97b7-150bfd1b2435','habitation',108,'2020-10-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('a6a78895-8a9c-496d-b26d-894348165ff1','POLX-244-1','f2bf5c68-3a59-41f3-97b7-150bfd1b2435','3ed37d3e-9cb0-45a3-a7d0-3d973364e3e4','habitation','2020-10-20','2021-10-20',455,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ed9d2573-2849-4ce4-83eb-f23dc7d5feae','user245@demo.com',crypt('test123', gen_salt('bf')),'client','2024-04-10');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('ed9d2573-2849-4ce4-83eb-f23dc7d5feae','Fara','Rasoanaivo','Madagascar','2024-04-10',62,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('29580499-6bb9-41bf-aee8-741ebe1283ee','QX-245-0','ed9d2573-2849-4ce4-83eb-f23dc7d5feae','habitation',360,'2026-01-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('ac343d4f-8683-4b93-8e23-e2df7ac561bf','POLX-245-0','ed9d2573-2849-4ce4-83eb-f23dc7d5feae','29580499-6bb9-41bf-aee8-741ebe1283ee','habitation','2026-01-21','2027-01-21',251,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('441279d5-03b3-4a65-9c8b-fa876ba8a13e','QX-245-1','ed9d2573-2849-4ce4-83eb-f23dc7d5feae','habitation',341,'2021-07-15');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f8044403-2c89-4330-a4d0-0cb4c9f206d1','POLX-245-1','ed9d2573-2849-4ce4-83eb-f23dc7d5feae','441279d5-03b3-4a65-9c8b-fa876ba8a13e','habitation','2021-07-15','2022-07-15',739,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('cc734397-cf8c-4125-80d9-57811275c08b','user246@demo.com',crypt('test123', gen_salt('bf')),'client','2025-10-06');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('cc734397-cf8c-4125-80d9-57811275c08b','Sarah','Rakotondranaivo','Madagascar','2025-10-06',64,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7b88a533-ea71-45ec-9a47-8abf10683813','QX-246-0','cc734397-cf8c-4125-80d9-57811275c08b','habitation',285,'2020-10-31');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('c4685b45-c809-4cf0-8233-e28705e74eb3','POLX-246-0','cc734397-cf8c-4125-80d9-57811275c08b','7b88a533-ea71-45ec-9a47-8abf10683813','habitation','2020-10-31','2021-10-31',776,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('2be982d1-b0a3-428a-b354-31403de329e6','user247@demo.com',crypt('test123', gen_salt('bf')),'client','2020-07-21');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('2be982d1-b0a3-428a-b354-31403de329e6','Nina','Andrianina','Madagascar','2020-07-21',37,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0f4697cc-4148-42b1-9bb2-a5e7d5d4c4c2','QX-247-0','2be982d1-b0a3-428a-b354-31403de329e6','habitation',293,'2025-12-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('7dc2b97d-6725-4604-a518-c1653720b1fc','POLX-247-0','2be982d1-b0a3-428a-b354-31403de329e6','0f4697cc-4148-42b1-9bb2-a5e7d5d4c4c2','habitation','2025-12-02','2026-12-02',262,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('d85990df-5e64-4822-bf56-1751195a9cb1','user248@demo.com',crypt('test123', gen_salt('bf')),'client','2025-08-14');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('d85990df-5e64-4822-bf56-1751195a9cb1','Nina','Razanam','Madagascar','2025-08-14',38,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c47ba146-f25b-4dbe-82c7-a4ceda677b22','QX-248-0','d85990df-5e64-4822-bf56-1751195a9cb1','habitation',776,'2023-07-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('3c91b39b-0d10-455a-acd6-f57bee5b4a35','POLX-248-0','d85990df-5e64-4822-bf56-1751195a9cb1','c47ba146-f25b-4dbe-82c7-a4ceda677b22','habitation','2023-07-07','2024-07-07',287,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('86c6c03f-fe13-4b8b-b26d-e0f9b981f6a0','user249@demo.com',crypt('test123', gen_salt('bf')),'client','2026-03-07');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('86c6c03f-fe13-4b8b-b26d-e0f9b981f6a0','Elsa','Razafindrakoto','Madagascar','2026-03-07',82,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7093f10d-3c61-459f-8fe7-8e2b2c979f1f','QX-249-0','86c6c03f-fe13-4b8b-b26d-e0f9b981f6a0','habitation',571,'2020-03-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('bcc61e08-909f-4894-8305-b45e2dd58f21','POLX-249-0','86c6c03f-fe13-4b8b-b26d-e0f9b981f6a0','7093f10d-3c61-459f-8fe7-8e2b2c979f1f','habitation','2020-03-12','2021-03-12',541,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8e63ebf8-65d3-4ae2-8c2f-19c734a5dd05','QX-249-1','86c6c03f-fe13-4b8b-b26d-e0f9b981f6a0','habitation',345,'2023-04-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('6b2d7f4a-671a-430f-9ac9-d76bbc007e8d','POLX-249-1','86c6c03f-fe13-4b8b-b26d-e0f9b981f6a0','8e63ebf8-65d3-4ae2-8c2f-19c734a5dd05','habitation','2023-04-01','2024-04-01',359,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('573e432a-6ad5-4e06-a03c-ca96c53066c4','user250@demo.com',crypt('test123', gen_salt('bf')),'client','2026-04-04');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('573e432a-6ad5-4e06-a03c-ca96c53066c4','Rina','Rakoto','Madagascar','2026-04-04',97,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0f6527ad-75ea-4020-b0c5-2b1df03f81f5','QX-250-0','573e432a-6ad5-4e06-a03c-ca96c53066c4','habitation',216,'2024-08-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('9923e047-531f-48f2-b37f-ec571f4b8292','POLX-250-0','573e432a-6ad5-4e06-a03c-ca96c53066c4','0f6527ad-75ea-4020-b0c5-2b1df03f81f5','habitation','2024-08-04','2025-08-04',616,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('cef2e044-89d8-4708-a7af-29ce2dbb5157','QX-250-1','573e432a-6ad5-4e06-a03c-ca96c53066c4','habitation',795,'2021-03-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('7ba2bc6a-f5a8-43b8-9c2f-54c0a60b213d','POLX-250-1','573e432a-6ad5-4e06-a03c-ca96c53066c4','cef2e044-89d8-4708-a7af-29ce2dbb5157','habitation','2021-03-23','2022-03-23',732,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('144ee855-d895-4c16-b00b-c1292f6dcf4f','user251@demo.com',crypt('test123', gen_salt('bf')),'client','2019-11-14');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('144ee855-d895-4c16-b00b-c1292f6dcf4f','Fara','Rabe','Madagascar','2019-11-14',96,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7a3ca3e8-4310-4a9a-bb4b-1f7ccdb71d08','QX-251-0','144ee855-d895-4c16-b00b-c1292f6dcf4f','habitation',665,'2021-09-15');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('13e40f6e-ce7d-43ea-a02b-10ffd490203d','POLX-251-0','144ee855-d895-4c16-b00b-c1292f6dcf4f','7a3ca3e8-4310-4a9a-bb4b-1f7ccdb71d08','habitation','2021-09-15','2022-09-15',760,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('8b7f14a3-9571-48b6-b170-2ba905a5ee36','user252@demo.com',crypt('test123', gen_salt('bf')),'client','2023-03-12');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('8b7f14a3-9571-48b6-b170-2ba905a5ee36','Kevin','Razafindrakoto','Madagascar','2023-03-12',59,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('04b63c55-a2b9-40ac-8281-8ff7093fcc8c','QX-252-0','8b7f14a3-9571-48b6-b170-2ba905a5ee36','habitation',378,'2023-07-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('06e1b9ae-dd93-4dae-b546-40e00e8e5298','POLX-252-0','8b7f14a3-9571-48b6-b170-2ba905a5ee36','04b63c55-a2b9-40ac-8281-8ff7093fcc8c','habitation','2023-07-10','2024-07-10',781,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('9c32160a-6141-4285-9efe-876dfd88e094','user253@demo.com',crypt('test123', gen_salt('bf')),'client','2024-01-01');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('9c32160a-6141-4285-9efe-876dfd88e094','Nina','Rasoanaivo','Madagascar','2024-01-01',39,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d9b7a9a8-59c2-4299-a35c-6619e0db44a0','QX-253-0','9c32160a-6141-4285-9efe-876dfd88e094','habitation',721,'2022-08-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('b1391020-9f3a-4bf8-998f-fe1cf10b6344','POLX-253-0','9c32160a-6141-4285-9efe-876dfd88e094','d9b7a9a8-59c2-4299-a35c-6619e0db44a0','habitation','2022-08-04','2023-08-04',375,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('bdffa0d1-bc75-4b19-bf2f-2f4b1e40e80e','user254@demo.com',crypt('test123', gen_salt('bf')),'client','2022-03-26');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('bdffa0d1-bc75-4b19-bf2f-2f4b1e40e80e','Kevin','Razanam','Madagascar','2022-03-26',72,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('cacf5157-9ee7-4fcc-a58f-ba42b8f8a6ec','QX-254-0','bdffa0d1-bc75-4b19-bf2f-2f4b1e40e80e','habitation',435,'2019-07-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f8ea7a85-afc3-4489-a4a1-a06076da99a3','POLX-254-0','bdffa0d1-bc75-4b19-bf2f-2f4b1e40e80e','cacf5157-9ee7-4fcc-a58f-ba42b8f8a6ec','habitation','2019-07-16','2020-07-16',463,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('fd8f9a18-24de-4db0-aeaf-122d598e31a1','user255@demo.com',crypt('test123', gen_salt('bf')),'client','2022-05-16');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('fd8f9a18-24de-4db0-aeaf-122d598e31a1','Elsa','Rakoto','Madagascar','2022-05-16',87,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8b74aebe-452c-4c19-a799-b7d898228bb7','QX-255-0','fd8f9a18-24de-4db0-aeaf-122d598e31a1','habitation',298,'2024-11-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('a0c8a7d7-af7a-499a-bb3e-fec897a493ff','POLX-255-0','fd8f9a18-24de-4db0-aeaf-122d598e31a1','8b74aebe-452c-4c19-a799-b7d898228bb7','habitation','2024-11-04','2025-11-04',216,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('cd901d24-4580-4c55-acfd-5601c553197d','QX-255-1','fd8f9a18-24de-4db0-aeaf-122d598e31a1','habitation',355,'2025-12-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('dd40e205-4b6d-487a-a8e1-d4d3af936c4a','POLX-255-1','fd8f9a18-24de-4db0-aeaf-122d598e31a1','cd901d24-4580-4c55-acfd-5601c553197d','habitation','2025-12-28','2026-12-28',529,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('11dce1bf-b6e2-4d9b-8877-fdf71722295c','user256@demo.com',crypt('test123', gen_salt('bf')),'client','2026-04-11');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('11dce1bf-b6e2-4d9b-8877-fdf71722295c','Sarah','Rabe','Madagascar','2026-04-11',79,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a8b10883-a931-42f0-a9c6-899910177f26','QX-256-0','11dce1bf-b6e2-4d9b-8877-fdf71722295c','habitation',359,'2023-12-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('c10de834-e523-4e8f-bacd-32f19a9ae4c8','POLX-256-0','11dce1bf-b6e2-4d9b-8877-fdf71722295c','a8b10883-a931-42f0-a9c6-899910177f26','habitation','2023-12-21','2024-12-21',462,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('301de458-5e92-4636-9cd5-96b5daba594e','user257@demo.com',crypt('test123', gen_salt('bf')),'client','2024-04-17');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('301de458-5e92-4636-9cd5-96b5daba594e','Rina','Rafidy','Madagascar','2024-04-17',74,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('87166c84-18fc-4435-b745-1c88b12601f0','QX-257-0','301de458-5e92-4636-9cd5-96b5daba594e','habitation',351,'2020-12-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('272d846b-d85d-49c8-b9e3-dc36e8232ec9','POLX-257-0','301de458-5e92-4636-9cd5-96b5daba594e','87166c84-18fc-4435-b745-1c88b12601f0','habitation','2020-12-19','2021-12-19',588,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('55f44a5b-cf3e-41f1-8fec-f2d3a33ead64','user258@demo.com',crypt('test123', gen_salt('bf')),'client','2020-04-16');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('55f44a5b-cf3e-41f1-8fec-f2d3a33ead64','Rina','Rasoanaivo','Madagascar','2020-04-16',44,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('21477f58-fb0a-4563-91f9-9b83a7b36620','QX-258-0','55f44a5b-cf3e-41f1-8fec-f2d3a33ead64','habitation',655,'2024-12-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('0fda05b9-25d2-4bb8-8957-fa1fe1a49601','POLX-258-0','55f44a5b-cf3e-41f1-8fec-f2d3a33ead64','21477f58-fb0a-4563-91f9-9b83a7b36620','habitation','2024-12-25','2025-12-25',230,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('bb3a25f7-8a5e-439c-935a-7f719b303bfa','user259@demo.com',crypt('test123', gen_salt('bf')),'client','2023-05-27');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('bb3a25f7-8a5e-439c-935a-7f719b303bfa','Elsa','Andrianina','Madagascar','2023-05-27',77,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d4aa6edc-eb8d-4d37-8586-e1192c24ca95','QX-259-0','bb3a25f7-8a5e-439c-935a-7f719b303bfa','habitation',776,'2023-05-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('47e85dde-d6cd-4921-9b69-a14ec9922bf5','POLX-259-0','bb3a25f7-8a5e-439c-935a-7f719b303bfa','d4aa6edc-eb8d-4d37-8586-e1192c24ca95','habitation','2023-05-02','2024-05-02',612,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('367cbe1c-c1e3-47c9-86ad-4e82fde769a9','user260@demo.com',crypt('test123', gen_salt('bf')),'client','2025-12-04');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('367cbe1c-c1e3-47c9-86ad-4e82fde769a9','Fara','Rafidy','Madagascar','2025-12-04',58,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('4e933af2-fd1c-4201-a7e8-25965721fd9a','QX-260-0','367cbe1c-c1e3-47c9-86ad-4e82fde769a9','habitation',299,'2020-08-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('72765961-80be-4bc8-8650-e8fe3e92689d','POLX-260-0','367cbe1c-c1e3-47c9-86ad-4e82fde769a9','4e933af2-fd1c-4201-a7e8-25965721fd9a','habitation','2020-08-20','2021-08-20',170,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a90830c7-1730-46aa-b392-26a0b340077a','user261@demo.com',crypt('test123', gen_salt('bf')),'client','2026-01-31');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('a90830c7-1730-46aa-b392-26a0b340077a','Haja','Rafidy','Madagascar','2026-01-31',55,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9539e347-57ac-4249-8322-625e4a6eff5a','QX-261-0','a90830c7-1730-46aa-b392-26a0b340077a','habitation',737,'2021-08-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('18859ca6-f84b-448c-8cab-37b6a54e31db','POLX-261-0','a90830c7-1730-46aa-b392-26a0b340077a','9539e347-57ac-4249-8322-625e4a6eff5a','habitation','2021-08-14','2022-08-14',464,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('fadf5d30-659f-43dc-a569-ae332ff62432','user262@demo.com',crypt('test123', gen_salt('bf')),'client','2024-09-09');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('fadf5d30-659f-43dc-a569-ae332ff62432','Haja','Rakoto','Madagascar','2024-09-09',55,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('967d6d7d-ea88-4208-9c9a-68906c1a7ab6','QX-262-0','fadf5d30-659f-43dc-a569-ae332ff62432','habitation',365,'2026-03-18');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('96910757-48b7-4893-890b-8a06315604e6','POLX-262-0','fadf5d30-659f-43dc-a569-ae332ff62432','967d6d7d-ea88-4208-9c9a-68906c1a7ab6','habitation','2026-03-18','2027-03-18',335,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('f3165e99-03b9-44a2-8435-2d5b4fbad3f4','user263@demo.com',crypt('test123', gen_salt('bf')),'client','2023-05-31');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('f3165e99-03b9-44a2-8435-2d5b4fbad3f4','Nina','Rabe','Madagascar','2023-05-31',96,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('604bd0eb-266c-41c2-bf0a-3eea7a557d20','QX-263-0','f3165e99-03b9-44a2-8435-2d5b4fbad3f4','habitation',758,'2024-12-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('ab601088-f81d-4e48-bf37-ec57f99bbb84','POLX-263-0','f3165e99-03b9-44a2-8435-2d5b4fbad3f4','604bd0eb-266c-41c2-bf0a-3eea7a557d20','habitation','2024-12-23','2025-12-23',305,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3555d9ab-6f62-479b-86af-85399dd5180c','QX-263-1','f3165e99-03b9-44a2-8435-2d5b4fbad3f4','habitation',371,'2023-11-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('c35de317-c64b-48d4-be15-23520447b82f','POLX-263-1','f3165e99-03b9-44a2-8435-2d5b4fbad3f4','3555d9ab-6f62-479b-86af-85399dd5180c','habitation','2023-11-22','2024-11-22',315,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ea26f07a-c45c-41d4-94e0-47b3b6c6f9b1','user264@demo.com',crypt('test123', gen_salt('bf')),'client','2020-03-16');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('ea26f07a-c45c-41d4-94e0-47b3b6c6f9b1','Tony','Rafidy','Madagascar','2020-03-16',25,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('55d5b1dc-d280-41b7-b8e6-e9a7ce392759','QX-264-0','ea26f07a-c45c-41d4-94e0-47b3b6c6f9b1','habitation',743,'2025-02-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('7b1ebed9-aca6-47b9-90a0-bcaca801a92c','POLX-264-0','ea26f07a-c45c-41d4-94e0-47b3b6c6f9b1','55d5b1dc-d280-41b7-b8e6-e9a7ce392759','habitation','2025-02-26','2026-02-26',201,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8b999272-5b5c-4062-ad30-6e881048f8cb','QX-264-1','ea26f07a-c45c-41d4-94e0-47b3b6c6f9b1','habitation',548,'2019-08-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('afe76316-9062-49d2-a5b8-1ed1b72a4372','POLX-264-1','ea26f07a-c45c-41d4-94e0-47b3b6c6f9b1','8b999272-5b5c-4062-ad30-6e881048f8cb','habitation','2019-08-22','2020-08-22',768,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ee6fad85-a640-4d34-bfd2-188611f07fb0','user265@demo.com',crypt('test123', gen_salt('bf')),'client','2023-08-05');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('ee6fad85-a640-4d34-bfd2-188611f07fb0','Mialy','Rabe','Madagascar','2023-08-05',28,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('55c9f447-49da-44d6-8f25-5d6d6275fe07','QX-265-0','ee6fad85-a640-4d34-bfd2-188611f07fb0','habitation',143,'2022-12-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('119a2822-d681-46b2-824f-dd3920ab6af3','POLX-265-0','ee6fad85-a640-4d34-bfd2-188611f07fb0','55c9f447-49da-44d6-8f25-5d6d6275fe07','habitation','2022-12-22','2023-12-22',508,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a7a9a3ce-dae2-473f-9249-de3fc2dd622e','user266@demo.com',crypt('test123', gen_salt('bf')),'client','2023-05-07');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('a7a9a3ce-dae2-473f-9249-de3fc2dd622e','Sarah','Andrianina','Madagascar','2023-05-07',36,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('adeb064a-03bf-41e1-bf38-faa0710f52bd','QX-266-0','a7a9a3ce-dae2-473f-9249-de3fc2dd622e','habitation',729,'2025-01-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('3091ef92-3aad-4c6e-8017-a6f82e368681','POLX-266-0','a7a9a3ce-dae2-473f-9249-de3fc2dd622e','adeb064a-03bf-41e1-bf38-faa0710f52bd','habitation','2025-01-10','2026-01-10',247,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('aa776306-a29b-43a8-8fcf-aaabc8bf56ae','QX-266-1','a7a9a3ce-dae2-473f-9249-de3fc2dd622e','habitation',320,'2024-09-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('85aac22e-fd7c-427d-909a-62de3f125787','POLX-266-1','a7a9a3ce-dae2-473f-9249-de3fc2dd622e','aa776306-a29b-43a8-8fcf-aaabc8bf56ae','habitation','2024-09-30','2025-09-30',290,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('6d32aedb-0b59-47fa-ad38-ab4405fadd5b','user267@demo.com',crypt('test123', gen_salt('bf')),'client','2021-09-06');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('6d32aedb-0b59-47fa-ad38-ab4405fadd5b','Fara','Rafidy','Madagascar','2021-09-06',59,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ac0cbcb1-b50d-43db-ba28-87adb99e46b1','QX-267-0','6d32aedb-0b59-47fa-ad38-ab4405fadd5b','habitation',643,'2024-11-15');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e7a3b74f-5087-473a-9cb2-15f6c9e31a31','POLX-267-0','6d32aedb-0b59-47fa-ad38-ab4405fadd5b','ac0cbcb1-b50d-43db-ba28-87adb99e46b1','habitation','2024-11-15','2025-11-15',325,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f5d1a0b8-11fd-4402-927e-cffa87fd4ed8','QX-267-1','6d32aedb-0b59-47fa-ad38-ab4405fadd5b','habitation',705,'2019-03-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('eeb92f7f-c541-4133-b691-7e4dd6cdd235','POLX-267-1','6d32aedb-0b59-47fa-ad38-ab4405fadd5b','f5d1a0b8-11fd-4402-927e-cffa87fd4ed8','habitation','2019-03-05','2020-03-05',622,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('d212ffdc-9fd1-4b87-be2c-773e241a49ad','user268@demo.com',crypt('test123', gen_salt('bf')),'client','2023-03-07');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('d212ffdc-9fd1-4b87-be2c-773e241a49ad','Sarah','Rafidy','Madagascar','2023-03-07',56,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ead112c8-9542-47e2-98a9-ad3269d7c8ec','QX-268-0','d212ffdc-9fd1-4b87-be2c-773e241a49ad','habitation',698,'2024-05-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('637910ad-c8da-485b-8597-420be7982f88','POLX-268-0','d212ffdc-9fd1-4b87-be2c-773e241a49ad','ead112c8-9542-47e2-98a9-ad3269d7c8ec','habitation','2024-05-30','2025-05-30',103,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3ddcc3d2-e768-4f35-8b00-e4cdb89711e2','QX-268-1','d212ffdc-9fd1-4b87-be2c-773e241a49ad','habitation',117,'2022-10-31');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('363c1a37-5d70-4c33-a605-739ae9790ebd','POLX-268-1','d212ffdc-9fd1-4b87-be2c-773e241a49ad','3ddcc3d2-e768-4f35-8b00-e4cdb89711e2','habitation','2022-10-31','2023-10-31',521,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ba613d3b-9b39-4215-a58b-75f363dda8e2','user269@demo.com',crypt('test123', gen_salt('bf')),'client','2020-08-21');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('ba613d3b-9b39-4215-a58b-75f363dda8e2','Mialy','Rakoto','Madagascar','2020-08-21',73,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('be7741ee-cf65-403b-af17-cfc0438b0e1d','QX-269-0','ba613d3b-9b39-4215-a58b-75f363dda8e2','habitation',528,'2023-09-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('682516a3-486b-454d-bf37-72200421ffd3','POLX-269-0','ba613d3b-9b39-4215-a58b-75f363dda8e2','be7741ee-cf65-403b-af17-cfc0438b0e1d','habitation','2023-09-28','2024-09-28',157,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ea634a2d-0488-4324-9e5f-c901addd45a1','user270@demo.com',crypt('test123', gen_salt('bf')),'client','2021-09-11');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('ea634a2d-0488-4324-9e5f-c901addd45a1','Rina','Rasoanaivo','Madagascar','2021-09-11',91,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b36807ed-7850-4337-b0d9-11f9e0a87662','QX-270-0','ea634a2d-0488-4324-9e5f-c901addd45a1','habitation',466,'2022-07-15');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('b3f1e0f9-2706-4c7e-9723-88dcfc612758','POLX-270-0','ea634a2d-0488-4324-9e5f-c901addd45a1','b36807ed-7850-4337-b0d9-11f9e0a87662','habitation','2022-07-15','2023-07-15',483,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8038fd58-447e-4299-9e45-a52087aa9a4c','QX-270-1','ea634a2d-0488-4324-9e5f-c901addd45a1','habitation',500,'2019-05-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5fd7572e-f35b-46f0-a522-e065780d76c5','POLX-270-1','ea634a2d-0488-4324-9e5f-c901addd45a1','8038fd58-447e-4299-9e45-a52087aa9a4c','habitation','2019-05-16','2020-05-16',776,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('03f09494-774f-4d49-948a-8fce29af9abb','user271@demo.com',crypt('test123', gen_salt('bf')),'client','2026-02-23');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('03f09494-774f-4d49-948a-8fce29af9abb','Tojo','Rakoto','Madagascar','2026-02-23',71,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('eeb8d501-8651-4ee6-84df-8e9323583d51','QX-271-0','03f09494-774f-4d49-948a-8fce29af9abb','habitation',796,'2023-07-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('25d7b2db-9f8f-400a-8a20-730139106ef4','POLX-271-0','03f09494-774f-4d49-948a-8fce29af9abb','eeb8d501-8651-4ee6-84df-8e9323583d51','habitation','2023-07-28','2024-07-28',625,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('467529ef-9a87-4a58-8638-ebf07edd0acf','QX-271-1','03f09494-774f-4d49-948a-8fce29af9abb','habitation',757,'2022-09-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('7834f7a7-77bb-417e-a211-437f48dca526','POLX-271-1','03f09494-774f-4d49-948a-8fce29af9abb','467529ef-9a87-4a58-8638-ebf07edd0acf','habitation','2022-09-11','2023-09-11',289,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('9ade45cb-e11e-48e6-be59-2f28c9a0b4b9','user272@demo.com',crypt('test123', gen_salt('bf')),'client','2024-10-15');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('9ade45cb-e11e-48e6-be59-2f28c9a0b4b9','Elsa','Rasoanaivo','Madagascar','2024-10-15',85,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('34da3f9c-a4a1-4976-ba03-2f1c41972be8','QX-272-0','9ade45cb-e11e-48e6-be59-2f28c9a0b4b9','habitation',275,'2019-04-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e67f3741-7045-4037-baa2-1a5053f62bc2','POLX-272-0','9ade45cb-e11e-48e6-be59-2f28c9a0b4b9','34da3f9c-a4a1-4976-ba03-2f1c41972be8','habitation','2019-04-01','2020-04-01',384,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('364da73e-132a-429b-8861-204ca0bce7a2','user273@demo.com',crypt('test123', gen_salt('bf')),'client','2022-07-15');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('364da73e-132a-429b-8861-204ca0bce7a2','Sarah','Razanam','Madagascar','2022-07-15',97,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('38f58741-caf1-4b08-8217-f039257d2569','QX-273-0','364da73e-132a-429b-8861-204ca0bce7a2','habitation',414,'2024-03-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('b4a8d780-f87a-45ae-b48c-39a12541fc92','POLX-273-0','364da73e-132a-429b-8861-204ca0bce7a2','38f58741-caf1-4b08-8217-f039257d2569','habitation','2024-03-09','2025-03-09',641,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('92a328a9-c165-4b96-bfea-723657645316','user274@demo.com',crypt('test123', gen_salt('bf')),'client','2023-11-22');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('92a328a9-c165-4b96-bfea-723657645316','Elsa','Razanam','Madagascar','2023-11-22',50,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c96cc10a-3981-4586-b76b-8ea2a7f0cd5f','QX-274-0','92a328a9-c165-4b96-bfea-723657645316','habitation',584,'2021-04-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('96658f3c-bc14-4581-94bc-859bd0900b41','POLX-274-0','92a328a9-c165-4b96-bfea-723657645316','c96cc10a-3981-4586-b76b-8ea2a7f0cd5f','habitation','2021-04-30','2022-04-30',496,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('649efb1b-50f7-47db-8aee-3314c5789449','user275@demo.com',crypt('test123', gen_salt('bf')),'client','2024-01-16');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('649efb1b-50f7-47db-8aee-3314c5789449','Fara','Rakotondranaivo','Madagascar','2024-01-16',60,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('21957da7-1e12-40a8-96d3-d3af0d190ea2','QX-275-0','649efb1b-50f7-47db-8aee-3314c5789449','habitation',725,'2020-03-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('2027f52c-3f54-425b-9263-c81d8c385534','POLX-275-0','649efb1b-50f7-47db-8aee-3314c5789449','21957da7-1e12-40a8-96d3-d3af0d190ea2','habitation','2020-03-28','2021-03-28',271,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('90ec1577-aee3-465d-8054-de89cf73aefe','QX-275-1','649efb1b-50f7-47db-8aee-3314c5789449','habitation',701,'2024-03-18');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('c08f9b4e-1186-4b1c-8488-8dfaf24823c6','POLX-275-1','649efb1b-50f7-47db-8aee-3314c5789449','90ec1577-aee3-465d-8054-de89cf73aefe','habitation','2024-03-18','2025-03-18',624,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('9a7c767d-3c2c-4539-9499-0496cadc03e6','user276@demo.com',crypt('test123', gen_salt('bf')),'client','2020-09-18');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('9a7c767d-3c2c-4539-9499-0496cadc03e6','Haja','Rakotondranaivo','Madagascar','2020-09-18',88,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e408c65e-aa7f-4548-986c-30998c16f572','QX-276-0','9a7c767d-3c2c-4539-9499-0496cadc03e6','habitation',172,'2021-07-31');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('89d8aefe-4e66-4f6f-b2a4-9a4158caf0fb','POLX-276-0','9a7c767d-3c2c-4539-9499-0496cadc03e6','e408c65e-aa7f-4548-986c-30998c16f572','habitation','2021-07-31','2022-07-31',312,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('7358ee7f-cde1-49b6-9b5f-0aba26527fa5','user277@demo.com',crypt('test123', gen_salt('bf')),'client','2026-01-23');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('7358ee7f-cde1-49b6-9b5f-0aba26527fa5','Sarah','Rakoto','Madagascar','2026-01-23',28,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1a145143-8287-4661-a949-74b7ccb57ba7','QX-277-0','7358ee7f-cde1-49b6-9b5f-0aba26527fa5','habitation',182,'2020-04-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('a135a2b0-9071-4b87-8666-dec1ff6acec3','POLX-277-0','7358ee7f-cde1-49b6-9b5f-0aba26527fa5','1a145143-8287-4661-a949-74b7ccb57ba7','habitation','2020-04-14','2021-04-14',469,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('8b9a95e3-405e-44ed-86fd-e724943bb126','user278@demo.com',crypt('test123', gen_salt('bf')),'client','2025-01-18');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('8b9a95e3-405e-44ed-86fd-e724943bb126','Kevin','Razafindrakoto','Madagascar','2025-01-18',56,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d54f45a4-75be-483e-9503-3603512b16d4','QX-278-0','8b9a95e3-405e-44ed-86fd-e724943bb126','habitation',124,'2021-11-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('eb43c52c-2129-4dd2-8faa-318a23d4cebe','POLX-278-0','8b9a95e3-405e-44ed-86fd-e724943bb126','d54f45a4-75be-483e-9503-3603512b16d4','habitation','2021-11-24','2022-11-24',402,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('152751ef-c216-4486-8caf-e52762268cc2','user279@demo.com',crypt('test123', gen_salt('bf')),'client','2025-11-10');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('152751ef-c216-4486-8caf-e52762268cc2','Kevin','Razanam','Madagascar','2025-11-10',72,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('cb327ed8-127f-4d9f-96ff-93eeee3b46ac','QX-279-0','152751ef-c216-4486-8caf-e52762268cc2','habitation',351,'2023-09-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('c81b681a-48ec-4c63-9e5d-0c4b45163bbf','POLX-279-0','152751ef-c216-4486-8caf-e52762268cc2','cb327ed8-127f-4d9f-96ff-93eeee3b46ac','habitation','2023-09-20','2024-09-20',523,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9882e7a3-882f-43fb-aee0-6a8534bc9b2c','QX-279-1','152751ef-c216-4486-8caf-e52762268cc2','habitation',353,'2025-01-15');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('6fb65fe6-bc86-4a71-be62-a5b62caa03f1','POLX-279-1','152751ef-c216-4486-8caf-e52762268cc2','9882e7a3-882f-43fb-aee0-6a8534bc9b2c','habitation','2025-01-15','2026-01-15',260,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('b981cbd3-011e-47bd-adf0-22b696f31cec','user280@demo.com',crypt('test123', gen_salt('bf')),'client','2025-07-03');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('b981cbd3-011e-47bd-adf0-22b696f31cec','Nina','Rakotondranaivo','Madagascar','2025-07-03',79,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('619a78d2-be31-4a0a-a850-70b1322c7297','QX-280-0','b981cbd3-011e-47bd-adf0-22b696f31cec','habitation',591,'2023-08-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('b05e87e6-dae4-40f1-95c4-f501b0a8e605','POLX-280-0','b981cbd3-011e-47bd-adf0-22b696f31cec','619a78d2-be31-4a0a-a850-70b1322c7297','habitation','2023-08-26','2024-08-26',510,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ee120606-c112-45bd-b632-7d6b40bababf','user281@demo.com',crypt('test123', gen_salt('bf')),'client','2023-01-01');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('ee120606-c112-45bd-b632-7d6b40bababf','Haja','Rasoanaivo','Madagascar','2023-01-01',25,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a5839990-6411-415b-a874-a6dea96a653c','QX-281-0','ee120606-c112-45bd-b632-7d6b40bababf','habitation',176,'2024-09-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('b6b27057-a9b9-4044-88e8-4ab515976ccf','POLX-281-0','ee120606-c112-45bd-b632-7d6b40bababf','a5839990-6411-415b-a874-a6dea96a653c','habitation','2024-09-03','2025-09-03',713,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('b9fbcee5-fdb2-4c99-b23f-2f3ed96be708','user282@demo.com',crypt('test123', gen_salt('bf')),'client','2021-02-21');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('b9fbcee5-fdb2-4c99-b23f-2f3ed96be708','Elsa','Rakoto','Madagascar','2021-02-21',28,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9dc779eb-5591-470d-96fb-4fa3e0075bf0','QX-282-0','b9fbcee5-fdb2-4c99-b23f-2f3ed96be708','habitation',125,'2019-07-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('37a4b84e-dcf3-49b4-8675-438e75604225','POLX-282-0','b9fbcee5-fdb2-4c99-b23f-2f3ed96be708','9dc779eb-5591-470d-96fb-4fa3e0075bf0','habitation','2019-07-25','2020-07-25',209,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('bd41f3cf-ea44-4c8a-9dbb-bbe2f0bf93ed','user283@demo.com',crypt('test123', gen_salt('bf')),'client','2021-10-18');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('bd41f3cf-ea44-4c8a-9dbb-bbe2f0bf93ed','Haja','Rakotondranaivo','Madagascar','2021-10-18',89,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('860e5a07-d180-482a-bf73-00f5e1f88410','QX-283-0','bd41f3cf-ea44-4c8a-9dbb-bbe2f0bf93ed','habitation',523,'2020-10-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('a35dbc64-4b8f-42e1-a8c5-db4f5adbc33e','POLX-283-0','bd41f3cf-ea44-4c8a-9dbb-bbe2f0bf93ed','860e5a07-d180-482a-bf73-00f5e1f88410','habitation','2020-10-07','2021-10-07',576,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a522dc73-9136-4289-ba7e-8efacbe7b883','user284@demo.com',crypt('test123', gen_salt('bf')),'client','2025-06-18');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('a522dc73-9136-4289-ba7e-8efacbe7b883','Haja','Rafidy','Madagascar','2025-06-18',29,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b6ad7b46-50e4-49d5-af36-05b1725dfdc9','QX-284-0','a522dc73-9136-4289-ba7e-8efacbe7b883','habitation',436,'2020-07-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('4b1aaff2-6e2c-4267-b159-875269604a06','POLX-284-0','a522dc73-9136-4289-ba7e-8efacbe7b883','b6ad7b46-50e4-49d5-af36-05b1725dfdc9','habitation','2020-07-22','2021-07-22',621,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('380c01f7-eb24-49f0-ae50-aed1a5c3b79e','user285@demo.com',crypt('test123', gen_salt('bf')),'client','2020-01-19');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('380c01f7-eb24-49f0-ae50-aed1a5c3b79e','Rina','Rabe','Madagascar','2020-01-19',72,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('db7d50a4-8893-47fc-982e-47fee962eb05','QX-285-0','380c01f7-eb24-49f0-ae50-aed1a5c3b79e','habitation',563,'2023-03-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('d41ee005-2f6f-412b-a77c-667f1e085287','POLX-285-0','380c01f7-eb24-49f0-ae50-aed1a5c3b79e','db7d50a4-8893-47fc-982e-47fee962eb05','habitation','2023-03-02','2024-03-02',601,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('424ddc28-b6a5-40fb-ade5-c34dbffc4077','QX-285-1','380c01f7-eb24-49f0-ae50-aed1a5c3b79e','habitation',415,'2024-08-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('c95629f3-9132-439c-b3d6-cba05ba80793','POLX-285-1','380c01f7-eb24-49f0-ae50-aed1a5c3b79e','424ddc28-b6a5-40fb-ade5-c34dbffc4077','habitation','2024-08-26','2025-08-26',710,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('5d3e6c9c-c7b4-43f3-aaf2-9a4602abd320','user286@demo.com',crypt('test123', gen_salt('bf')),'client','2023-06-28');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('5d3e6c9c-c7b4-43f3-aaf2-9a4602abd320','Rina','Rakoto','Madagascar','2023-06-28',86,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b6aed693-0d4f-4c9d-9250-1ba04ba724e9','QX-286-0','5d3e6c9c-c7b4-43f3-aaf2-9a4602abd320','habitation',293,'2024-07-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5377fab6-1e51-4fe3-8669-bd6970f4e56f','POLX-286-0','5d3e6c9c-c7b4-43f3-aaf2-9a4602abd320','b6aed693-0d4f-4c9d-9250-1ba04ba724e9','habitation','2024-07-04','2025-07-04',621,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('aee0aa37-9908-4c0e-834b-2e69bb5f4165','user287@demo.com',crypt('test123', gen_salt('bf')),'client','2019-04-11');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('aee0aa37-9908-4c0e-834b-2e69bb5f4165','Tojo','Rabe','Madagascar','2019-04-11',27,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e594b51b-cbae-4f1a-9771-c5d56809ca70','QX-287-0','aee0aa37-9908-4c0e-834b-2e69bb5f4165','habitation',442,'2020-09-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('312a2068-b9ae-425e-affa-f665dffc26f0','POLX-287-0','aee0aa37-9908-4c0e-834b-2e69bb5f4165','e594b51b-cbae-4f1a-9771-c5d56809ca70','habitation','2020-09-01','2021-09-01',286,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('389da9e9-a463-44c8-b22e-8b2910e3aafa','QX-287-1','aee0aa37-9908-4c0e-834b-2e69bb5f4165','habitation',324,'2020-06-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('d9970857-a26e-41c7-a8bd-d31775137f41','POLX-287-1','aee0aa37-9908-4c0e-834b-2e69bb5f4165','389da9e9-a463-44c8-b22e-8b2910e3aafa','habitation','2020-06-24','2021-06-24',455,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('fdc71f75-e6b2-4d2d-b592-ff48f485edfd','user288@demo.com',crypt('test123', gen_salt('bf')),'client','2021-01-23');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('fdc71f75-e6b2-4d2d-b592-ff48f485edfd','Tojo','Razanam','Madagascar','2021-01-23',22,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d64f36b3-e20f-40b0-bc8e-f70aac0913de','QX-288-0','fdc71f75-e6b2-4d2d-b592-ff48f485edfd','habitation',240,'2023-12-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e20b7865-d366-46c1-b664-90be6c01d7e8','POLX-288-0','fdc71f75-e6b2-4d2d-b592-ff48f485edfd','d64f36b3-e20f-40b0-bc8e-f70aac0913de','habitation','2023-12-04','2024-12-04',728,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a2c89a95-3fbb-4e24-817b-1f6501d8592c','user289@demo.com',crypt('test123', gen_salt('bf')),'client','2023-03-03');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('a2c89a95-3fbb-4e24-817b-1f6501d8592c','Fara','Rakoto','Madagascar','2023-03-03',77,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('01033b81-cbf9-417e-a283-46712e7dcd80','QX-289-0','a2c89a95-3fbb-4e24-817b-1f6501d8592c','habitation',368,'2023-06-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('00d475b7-247d-491d-9ebc-de18b3039b0b','POLX-289-0','a2c89a95-3fbb-4e24-817b-1f6501d8592c','01033b81-cbf9-417e-a283-46712e7dcd80','habitation','2023-06-03','2024-06-03',692,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('fd2bc309-1409-4014-81f3-19e2ec309952','user290@demo.com',crypt('test123', gen_salt('bf')),'client','2021-01-18');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('fd2bc309-1409-4014-81f3-19e2ec309952','Sarah','Rakoto','Madagascar','2021-01-18',91,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('874a2478-2bb4-439f-89ad-3354a2bce12a','QX-290-0','fd2bc309-1409-4014-81f3-19e2ec309952','habitation',774,'2023-10-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('0107d183-342e-4c2a-b9ae-23ca93041f61','POLX-290-0','fd2bc309-1409-4014-81f3-19e2ec309952','874a2478-2bb4-439f-89ad-3354a2bce12a','habitation','2023-10-11','2024-10-11',181,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('21686b42-0183-4e30-810b-37d1ee93274e','QX-290-1','fd2bc309-1409-4014-81f3-19e2ec309952','habitation',147,'2025-03-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('8974cba9-f611-47e4-afc8-d9759999f264','POLX-290-1','fd2bc309-1409-4014-81f3-19e2ec309952','21686b42-0183-4e30-810b-37d1ee93274e','habitation','2025-03-10','2026-03-10',388,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('c271be6f-54b5-4ba0-8e0c-e2a5b41d37ea','user291@demo.com',crypt('test123', gen_salt('bf')),'client','2019-02-01');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('c271be6f-54b5-4ba0-8e0c-e2a5b41d37ea','Nina','Rakotondranaivo','Madagascar','2019-02-01',38,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('79352411-49e0-4315-b9e2-a12cab81257d','QX-291-0','c271be6f-54b5-4ba0-8e0c-e2a5b41d37ea','habitation',195,'2021-03-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('554b5a13-0441-4229-b4cc-913d8aaa74ad','POLX-291-0','c271be6f-54b5-4ba0-8e0c-e2a5b41d37ea','79352411-49e0-4315-b9e2-a12cab81257d','habitation','2021-03-10','2022-03-10',531,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('47370504-b039-42f7-a531-7375dad57129','user292@demo.com',crypt('test123', gen_salt('bf')),'client','2025-07-09');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('47370504-b039-42f7-a531-7375dad57129','Nina','Rabe','Madagascar','2025-07-09',48,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('99cb7f11-1250-4299-b54c-8cf3e76c779f','QX-292-0','47370504-b039-42f7-a531-7375dad57129','habitation',252,'2026-04-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('23e43c08-8d9a-4f6c-b481-2c1a279d413d','POLX-292-0','47370504-b039-42f7-a531-7375dad57129','99cb7f11-1250-4299-b54c-8cf3e76c779f','habitation','2026-04-05','2027-04-05',114,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ce37d6c2-b15c-4dc1-abff-e49ae6e061f4','user293@demo.com',crypt('test123', gen_salt('bf')),'client','2023-02-02');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('ce37d6c2-b15c-4dc1-abff-e49ae6e061f4','Haja','Rakotondranaivo','Madagascar','2023-02-02',28,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0d3b4a7a-8939-4a6f-9165-63fcb3dcbe2d','QX-293-0','ce37d6c2-b15c-4dc1-abff-e49ae6e061f4','habitation',351,'2023-02-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('160fe178-026e-44e1-9c44-6ace6552d190','POLX-293-0','ce37d6c2-b15c-4dc1-abff-e49ae6e061f4','0d3b4a7a-8939-4a6f-9165-63fcb3dcbe2d','habitation','2023-02-20','2024-02-20',219,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('1978e509-b039-4bb5-8c5a-de267c842436','user294@demo.com',crypt('test123', gen_salt('bf')),'client','2021-10-06');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('1978e509-b039-4bb5-8c5a-de267c842436','Tony','Rakoto','Madagascar','2021-10-06',22,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('fb12a08a-46f1-4f33-8607-0c25b974fad8','QX-294-0','1978e509-b039-4bb5-8c5a-de267c842436','habitation',617,'2019-02-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('96b231b7-434e-4464-9a34-fd2b962c35c2','POLX-294-0','1978e509-b039-4bb5-8c5a-de267c842436','fb12a08a-46f1-4f33-8607-0c25b974fad8','habitation','2019-02-03','2020-02-03',479,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('54944074-8c02-4a8a-b6f4-5beebd2a809c','user295@demo.com',crypt('test123', gen_salt('bf')),'client','2022-11-20');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('54944074-8c02-4a8a-b6f4-5beebd2a809c','Tony','Rabe','Madagascar','2022-11-20',47,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('923f9564-0003-472c-be99-d21268e01fd1','QX-295-0','54944074-8c02-4a8a-b6f4-5beebd2a809c','habitation',730,'2020-03-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('ab55553b-1ce4-4dc9-b895-e77a7be6f406','POLX-295-0','54944074-8c02-4a8a-b6f4-5beebd2a809c','923f9564-0003-472c-be99-d21268e01fd1','habitation','2020-03-22','2021-03-22',378,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('187aa8e6-74be-424b-9b46-fea3871b5d76','user296@demo.com',crypt('test123', gen_salt('bf')),'client','2024-01-17');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('187aa8e6-74be-424b-9b46-fea3871b5d76','Mialy','Razanam','Madagascar','2024-01-17',33,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('beb4cc7c-63bb-4ca8-bbe7-bb2e0a3ba765','QX-296-0','187aa8e6-74be-424b-9b46-fea3871b5d76','habitation',176,'2021-08-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e38b8b24-22ce-41c8-a154-fa6cf661cce6','POLX-296-0','187aa8e6-74be-424b-9b46-fea3871b5d76','beb4cc7c-63bb-4ca8-bbe7-bb2e0a3ba765','habitation','2021-08-23','2022-08-23',167,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('082e51ff-9279-4b90-b059-275ab5c1262b','QX-296-1','187aa8e6-74be-424b-9b46-fea3871b5d76','habitation',162,'2020-05-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('ac2618d2-41a7-45fa-b238-c1bbcbc0c601','POLX-296-1','187aa8e6-74be-424b-9b46-fea3871b5d76','082e51ff-9279-4b90-b059-275ab5c1262b','habitation','2020-05-12','2021-05-12',603,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('2281db10-00f7-4f15-8101-01d8e6b38da4','user297@demo.com',crypt('test123', gen_salt('bf')),'client','2019-03-14');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('2281db10-00f7-4f15-8101-01d8e6b38da4','Mialy','Rasoanaivo','Madagascar','2019-03-14',59,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('4a6fe316-e32d-4924-9cf0-026e9c822434','QX-297-0','2281db10-00f7-4f15-8101-01d8e6b38da4','habitation',562,'2022-04-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f9cbd717-efcb-41d4-9f80-c39337f6bb35','POLX-297-0','2281db10-00f7-4f15-8101-01d8e6b38da4','4a6fe316-e32d-4924-9cf0-026e9c822434','habitation','2022-04-11','2023-04-11',227,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('27a45abc-bdaf-4c38-b55c-f1dcdf08a5b1','QX-297-1','2281db10-00f7-4f15-8101-01d8e6b38da4','habitation',366,'2022-09-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('642cca57-4850-4076-9df7-511c33d59ef9','POLX-297-1','2281db10-00f7-4f15-8101-01d8e6b38da4','27a45abc-bdaf-4c38-b55c-f1dcdf08a5b1','habitation','2022-09-08','2023-09-08',335,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a9212286-4664-4113-be47-07b31e08d65f','user298@demo.com',crypt('test123', gen_salt('bf')),'client','2025-09-23');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('a9212286-4664-4113-be47-07b31e08d65f','Sarah','Andrianina','Madagascar','2025-09-23',80,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('464e5994-5ef5-44e3-9145-5151670bc4dd','QX-298-0','a9212286-4664-4113-be47-07b31e08d65f','habitation',606,'2023-10-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f45ddcff-65e5-484c-9776-3a46eb0b8ddd','POLX-298-0','a9212286-4664-4113-be47-07b31e08d65f','464e5994-5ef5-44e3-9145-5151670bc4dd','habitation','2023-10-19','2024-10-19',343,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('8671db4e-232e-414f-a57b-0f8d4c19e035','user299@demo.com',crypt('test123', gen_salt('bf')),'client','2021-12-18');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('8671db4e-232e-414f-a57b-0f8d4c19e035','Tony','Razafindrakoto','Madagascar','2021-12-18',75,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1f7404a8-f14b-404a-8917-2ff56b85c6df','QX-299-0','8671db4e-232e-414f-a57b-0f8d4c19e035','habitation',296,'2022-03-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('ac939d83-3841-46cb-a63e-580424617025','POLX-299-0','8671db4e-232e-414f-a57b-0f8d4c19e035','1f7404a8-f14b-404a-8917-2ff56b85c6df','habitation','2022-03-27','2023-03-27',390,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('1b16b4fa-8a82-4199-9032-e6f9ab72b316','user300@demo.com',crypt('test123', gen_salt('bf')),'client','2022-06-11');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('1b16b4fa-8a82-4199-9032-e6f9ab72b316','Mialy','Rasoanaivo','Madagascar','2022-06-11',36,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3d758c5f-c9ff-472b-8ba7-04bd50e6b1da','QX-300-0','1b16b4fa-8a82-4199-9032-e6f9ab72b316','habitation',764,'2022-05-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f77f6898-a849-48d1-a2f2-fcde9bc1cad0','POLX-300-0','1b16b4fa-8a82-4199-9032-e6f9ab72b316','3d758c5f-c9ff-472b-8ba7-04bd50e6b1da','habitation','2022-05-20','2023-05-20',351,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e1d8770c-4123-4e66-8dba-60926f25c60a','QX-300-1','1b16b4fa-8a82-4199-9032-e6f9ab72b316','habitation',276,'2024-12-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('51b3aa5d-b394-4889-a5a4-095050ea9139','POLX-300-1','1b16b4fa-8a82-4199-9032-e6f9ab72b316','e1d8770c-4123-4e66-8dba-60926f25c60a','habitation','2024-12-03','2025-12-03',249,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('02b60e9a-9c33-4284-a45e-60fa373b6fae','user301@demo.com',crypt('test123', gen_salt('bf')),'client','2019-03-27');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('02b60e9a-9c33-4284-a45e-60fa373b6fae','Sarah','Razanam','Madagascar','2019-03-27',28,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7676ab71-50a4-4043-84df-24b36c3bd7b7','QX-301-0','02b60e9a-9c33-4284-a45e-60fa373b6fae','habitation',492,'2024-09-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5c0d9ba7-6211-4cea-b903-fe12c4c5930f','POLX-301-0','02b60e9a-9c33-4284-a45e-60fa373b6fae','7676ab71-50a4-4043-84df-24b36c3bd7b7','habitation','2024-09-08','2025-09-08',324,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b2562f24-1bf5-4d9d-82de-77621fab6d4d','QX-301-1','02b60e9a-9c33-4284-a45e-60fa373b6fae','habitation',486,'2023-11-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('6a6c30b0-f545-4829-a963-765fbffa6cdc','POLX-301-1','02b60e9a-9c33-4284-a45e-60fa373b6fae','b2562f24-1bf5-4d9d-82de-77621fab6d4d','habitation','2023-11-27','2024-11-27',642,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('9636cf22-d74e-418d-9964-ace4f75d07a2','user302@demo.com',crypt('test123', gen_salt('bf')),'client','2025-02-08');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('9636cf22-d74e-418d-9964-ace4f75d07a2','Tojo','Razafindrakoto','Madagascar','2025-02-08',44,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2134f775-982d-4ed7-93c6-d68e38236ef9','QX-302-0','9636cf22-d74e-418d-9964-ace4f75d07a2','habitation',739,'2020-02-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('b53faf82-d72e-4ec2-af78-43bb6203a666','POLX-302-0','9636cf22-d74e-418d-9964-ace4f75d07a2','2134f775-982d-4ed7-93c6-d68e38236ef9','habitation','2020-02-06','2021-02-06',706,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('aa402670-ff1f-47f0-8a58-693f37121add','user303@demo.com',crypt('test123', gen_salt('bf')),'client','2019-11-08');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('aa402670-ff1f-47f0-8a58-693f37121add','Elsa','Rafidy','Madagascar','2019-11-08',29,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d3209ecd-f975-42f8-ba84-171ab6959da9','QX-303-0','aa402670-ff1f-47f0-8a58-693f37121add','habitation',689,'2019-09-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('97d5d10b-edf1-4bc0-95e9-3fc5169e6545','POLX-303-0','aa402670-ff1f-47f0-8a58-693f37121add','d3209ecd-f975-42f8-ba84-171ab6959da9','habitation','2019-09-10','2020-09-10',794,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3d171b07-060d-416f-ad48-23bacea0b993','QX-303-1','aa402670-ff1f-47f0-8a58-693f37121add','habitation',106,'2020-01-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('6f9f4890-27d7-4258-8113-9c26331f8458','POLX-303-1','aa402670-ff1f-47f0-8a58-693f37121add','3d171b07-060d-416f-ad48-23bacea0b993','habitation','2020-01-25','2021-01-25',218,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('13a01fed-2099-4dbc-a0a8-2736a45afee9','user304@demo.com',crypt('test123', gen_salt('bf')),'client','2025-04-11');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('13a01fed-2099-4dbc-a0a8-2736a45afee9','Rina','Rakotondranaivo','Madagascar','2025-04-11',29,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f3781153-10ba-4cb7-91bc-acd95919d8cd','QX-304-0','13a01fed-2099-4dbc-a0a8-2736a45afee9','habitation',474,'2020-11-15');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('fc8bfc13-6ef9-42d6-9a0e-cf677eebdd22','POLX-304-0','13a01fed-2099-4dbc-a0a8-2736a45afee9','f3781153-10ba-4cb7-91bc-acd95919d8cd','habitation','2020-11-15','2021-11-15',600,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('45e65fb2-ff66-4958-81f2-107e8877e3ad','QX-304-1','13a01fed-2099-4dbc-a0a8-2736a45afee9','habitation',124,'2019-11-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('1a041e4a-a363-424d-9a85-25ccb59003eb','POLX-304-1','13a01fed-2099-4dbc-a0a8-2736a45afee9','45e65fb2-ff66-4958-81f2-107e8877e3ad','habitation','2019-11-24','2020-11-24',213,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('60c1abcb-caff-49cc-bb4e-18ec3ed1659b','user305@demo.com',crypt('test123', gen_salt('bf')),'client','2021-06-17');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('60c1abcb-caff-49cc-bb4e-18ec3ed1659b','Mialy','Razanam','Madagascar','2021-06-17',63,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ab2ce332-ee45-4a48-9725-a8d7aab1872e','QX-305-0','60c1abcb-caff-49cc-bb4e-18ec3ed1659b','habitation',284,'2026-01-29');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('096c9f1d-c13a-48b3-ae49-222386802533','POLX-305-0','60c1abcb-caff-49cc-bb4e-18ec3ed1659b','ab2ce332-ee45-4a48-9725-a8d7aab1872e','habitation','2026-01-29','2027-01-29',529,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d16b4ebe-d0ae-4548-b14f-fd74f15124fc','QX-305-1','60c1abcb-caff-49cc-bb4e-18ec3ed1659b','habitation',340,'2024-03-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('0c7eb4a6-f9c3-421b-9547-2538ebd18358','POLX-305-1','60c1abcb-caff-49cc-bb4e-18ec3ed1659b','d16b4ebe-d0ae-4548-b14f-fd74f15124fc','habitation','2024-03-26','2025-03-26',702,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('829f8813-5245-4395-b891-9c6b11ffc309','user306@demo.com',crypt('test123', gen_salt('bf')),'client','2026-04-22');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('829f8813-5245-4395-b891-9c6b11ffc309','Fara','Razanam','Madagascar','2026-04-22',38,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('689dfea4-b93d-40ca-b6f4-210f86eb7462','QX-306-0','829f8813-5245-4395-b891-9c6b11ffc309','habitation',192,'2022-11-29');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('38157a18-f1db-4455-a5e5-1d57da27ec53','POLX-306-0','829f8813-5245-4395-b891-9c6b11ffc309','689dfea4-b93d-40ca-b6f4-210f86eb7462','habitation','2022-11-29','2023-11-29',366,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('66e7b59c-c326-4ab5-8077-6699fac0daae','QX-306-1','829f8813-5245-4395-b891-9c6b11ffc309','habitation',182,'2021-05-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('c47defd9-e8a7-47a3-aaa2-fea9e0a1df96','POLX-306-1','829f8813-5245-4395-b891-9c6b11ffc309','66e7b59c-c326-4ab5-8077-6699fac0daae','habitation','2021-05-03','2022-05-03',179,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ea262f24-bc60-45fe-a13e-3dd2108b7cbb','user307@demo.com',crypt('test123', gen_salt('bf')),'client','2019-04-14');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('ea262f24-bc60-45fe-a13e-3dd2108b7cbb','Tojo','Rakoto','Madagascar','2019-04-14',97,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('29af6cbc-a18c-4955-9a58-6390dfbdd29c','QX-307-0','ea262f24-bc60-45fe-a13e-3dd2108b7cbb','habitation',752,'2021-04-29');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('48f96a83-e307-45c7-abdd-b9f5b4db1b45','POLX-307-0','ea262f24-bc60-45fe-a13e-3dd2108b7cbb','29af6cbc-a18c-4955-9a58-6390dfbdd29c','habitation','2021-04-29','2022-04-29',546,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9af5308f-1dfb-4928-a759-d10ae03605f8','QX-307-1','ea262f24-bc60-45fe-a13e-3dd2108b7cbb','habitation',571,'2020-10-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f7d4c1f0-f89a-46bc-a105-f0de6d045263','POLX-307-1','ea262f24-bc60-45fe-a13e-3dd2108b7cbb','9af5308f-1dfb-4928-a759-d10ae03605f8','habitation','2020-10-13','2021-10-13',155,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('4b139062-e973-4112-bbde-a106e556ef46','user308@demo.com',crypt('test123', gen_salt('bf')),'client','2019-03-09');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('4b139062-e973-4112-bbde-a106e556ef46','Fara','Rabe','Madagascar','2019-03-09',25,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7ae6bb8d-4cf5-46c9-ad31-6debf2617d0a','QX-308-0','4b139062-e973-4112-bbde-a106e556ef46','habitation',244,'2021-08-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('39cf6feb-05b7-42d1-b66a-fd83b39f80db','POLX-308-0','4b139062-e973-4112-bbde-a106e556ef46','7ae6bb8d-4cf5-46c9-ad31-6debf2617d0a','habitation','2021-08-24','2022-08-24',504,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('638a9c6f-c8a0-41f5-9417-d62351caaa51','user309@demo.com',crypt('test123', gen_salt('bf')),'client','2020-08-10');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('638a9c6f-c8a0-41f5-9417-d62351caaa51','Kevin','Rafidy','Madagascar','2020-08-10',23,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('6dbeffe1-16b8-4ce4-990d-9181775ca579','QX-309-0','638a9c6f-c8a0-41f5-9417-d62351caaa51','habitation',713,'2024-03-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('63be8d1c-47c5-4187-a4b4-4a6d6a37a81c','POLX-309-0','638a9c6f-c8a0-41f5-9417-d62351caaa51','6dbeffe1-16b8-4ce4-990d-9181775ca579','habitation','2024-03-12','2025-03-12',323,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0d6c7a1d-f8e0-45a8-ad31-d1541e94a813','QX-309-1','638a9c6f-c8a0-41f5-9417-d62351caaa51','habitation',747,'2021-10-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('9887d972-6cd9-4b4c-84c5-a50bd29b3ed8','POLX-309-1','638a9c6f-c8a0-41f5-9417-d62351caaa51','0d6c7a1d-f8e0-45a8-ad31-d1541e94a813','habitation','2021-10-01','2022-10-01',166,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('85b1f686-88d3-4233-8d77-1a1f069c6e96','user310@demo.com',crypt('test123', gen_salt('bf')),'client','2023-09-28');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('85b1f686-88d3-4233-8d77-1a1f069c6e96','Elsa','Rafidy','Madagascar','2023-09-28',95,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('31369dee-37f0-4602-9fe8-54e6a6576e7d','QX-310-0','85b1f686-88d3-4233-8d77-1a1f069c6e96','habitation',690,'2021-01-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('bffb7943-5c9f-4c15-aaef-ca923c99b8aa','POLX-310-0','85b1f686-88d3-4233-8d77-1a1f069c6e96','31369dee-37f0-4602-9fe8-54e6a6576e7d','habitation','2021-01-14','2022-01-14',748,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('6b2914a7-0fb8-4899-b650-bb21e3fe0270','user311@demo.com',crypt('test123', gen_salt('bf')),'client','2020-07-20');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('6b2914a7-0fb8-4899-b650-bb21e3fe0270','Tony','Razafindrakoto','Madagascar','2020-07-20',93,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8e58ac21-8a15-424a-a2f7-952363709c5d','QX-311-0','6b2914a7-0fb8-4899-b650-bb21e3fe0270','habitation',408,'2024-07-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('4c1669cb-4e07-43c1-a070-195d806de5a6','POLX-311-0','6b2914a7-0fb8-4899-b650-bb21e3fe0270','8e58ac21-8a15-424a-a2f7-952363709c5d','habitation','2024-07-23','2025-07-23',508,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('258ca61d-77bb-448d-a5bd-bd54a9afe6b7','user312@demo.com',crypt('test123', gen_salt('bf')),'client','2022-04-30');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('258ca61d-77bb-448d-a5bd-bd54a9afe6b7','Elsa','Rabe','Madagascar','2022-04-30',95,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('fc351f6f-9552-4a06-9a93-df0adec2359e','QX-312-0','258ca61d-77bb-448d-a5bd-bd54a9afe6b7','habitation',593,'2022-02-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e96be56f-5010-46a5-bff2-d69289eb06ca','POLX-312-0','258ca61d-77bb-448d-a5bd-bd54a9afe6b7','fc351f6f-9552-4a06-9a93-df0adec2359e','habitation','2022-02-10','2023-02-10',244,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('7eff6bfe-2841-495f-a4fc-d604b97ea5f7','user313@demo.com',crypt('test123', gen_salt('bf')),'client','2023-09-29');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('7eff6bfe-2841-495f-a4fc-d604b97ea5f7','Haja','Rafidy','Madagascar','2023-09-29',62,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('4e1776f9-5917-4811-8566-ab6d9d90cc0f','QX-313-0','7eff6bfe-2841-495f-a4fc-d604b97ea5f7','habitation',467,'2023-04-29');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('2e133069-e18d-4ff3-94d6-5685e7edeaa2','POLX-313-0','7eff6bfe-2841-495f-a4fc-d604b97ea5f7','4e1776f9-5917-4811-8566-ab6d9d90cc0f','habitation','2023-04-29','2024-04-29',497,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3928b62d-5249-4dcb-848d-315900c144c3','QX-313-1','7eff6bfe-2841-495f-a4fc-d604b97ea5f7','habitation',664,'2023-09-29');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('dd9a0a53-c02d-4df3-a87d-7609b28bb7a2','POLX-313-1','7eff6bfe-2841-495f-a4fc-d604b97ea5f7','3928b62d-5249-4dcb-848d-315900c144c3','habitation','2023-09-29','2024-09-29',234,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('12b30e62-e300-4f07-b161-1855cf4b824c','user314@demo.com',crypt('test123', gen_salt('bf')),'client','2019-02-15');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('12b30e62-e300-4f07-b161-1855cf4b824c','Fara','Razafindrakoto','Madagascar','2019-02-15',71,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('554fb0ae-3701-4fa2-9831-f70a2f4297c7','QX-314-0','12b30e62-e300-4f07-b161-1855cf4b824c','habitation',216,'2025-07-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('a3d79cbd-9017-434d-9610-381ff6422a8d','POLX-314-0','12b30e62-e300-4f07-b161-1855cf4b824c','554fb0ae-3701-4fa2-9831-f70a2f4297c7','habitation','2025-07-11','2026-07-11',483,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d5812a0e-99fd-4e0e-af0b-259599093a68','QX-314-1','12b30e62-e300-4f07-b161-1855cf4b824c','habitation',421,'2023-03-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('12526880-c3e6-423b-a927-46b450945538','POLX-314-1','12b30e62-e300-4f07-b161-1855cf4b824c','d5812a0e-99fd-4e0e-af0b-259599093a68','habitation','2023-03-01','2024-03-01',527,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('310fdebb-a187-464b-8c70-c67d7250ea00','user315@demo.com',crypt('test123', gen_salt('bf')),'client','2024-10-02');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('310fdebb-a187-464b-8c70-c67d7250ea00','Mialy','Rasoanaivo','Madagascar','2024-10-02',29,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d4e8f77a-9f48-4b06-a12f-8c83b7a99c0c','QX-315-0','310fdebb-a187-464b-8c70-c67d7250ea00','habitation',399,'2023-12-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('769608e4-8444-4512-a001-6863c840a751','POLX-315-0','310fdebb-a187-464b-8c70-c67d7250ea00','d4e8f77a-9f48-4b06-a12f-8c83b7a99c0c','habitation','2023-12-20','2024-12-20',664,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('df1d7bdc-f929-4490-b21f-9cdccecc21bc','user316@demo.com',crypt('test123', gen_salt('bf')),'client','2019-12-04');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('df1d7bdc-f929-4490-b21f-9cdccecc21bc','Fara','Rabe','Madagascar','2019-12-04',28,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('06e94d9d-6091-4ec9-821c-cfaaadbc3917','QX-316-0','df1d7bdc-f929-4490-b21f-9cdccecc21bc','habitation',459,'2023-12-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('37f949a5-5eed-422c-947a-5f4a12e009ee','POLX-316-0','df1d7bdc-f929-4490-b21f-9cdccecc21bc','06e94d9d-6091-4ec9-821c-cfaaadbc3917','habitation','2023-12-25','2024-12-25',757,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('44de1c89-e3ca-496c-bedb-cc2cb8d29b89','QX-316-1','df1d7bdc-f929-4490-b21f-9cdccecc21bc','habitation',564,'2020-10-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('cd73975e-ab63-479c-bf66-40c901eca3a9','POLX-316-1','df1d7bdc-f929-4490-b21f-9cdccecc21bc','44de1c89-e3ca-496c-bedb-cc2cb8d29b89','habitation','2020-10-07','2021-10-07',511,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('8f43c7f2-b63a-4b9c-b3fc-f79eb8daed44','user317@demo.com',crypt('test123', gen_salt('bf')),'client','2019-09-23');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('8f43c7f2-b63a-4b9c-b3fc-f79eb8daed44','Rina','Rasoanaivo','Madagascar','2019-09-23',33,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('af613317-ff21-437d-9d18-a959a88f9060','QX-317-0','8f43c7f2-b63a-4b9c-b3fc-f79eb8daed44','habitation',419,'2024-07-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('ea89912a-6899-4289-8b6b-143a6adff30b','POLX-317-0','8f43c7f2-b63a-4b9c-b3fc-f79eb8daed44','af613317-ff21-437d-9d18-a959a88f9060','habitation','2024-07-20','2025-07-20',426,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('9be283ea-351b-402a-a2cb-cde4e3f451f3','user318@demo.com',crypt('test123', gen_salt('bf')),'client','2024-02-21');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('9be283ea-351b-402a-a2cb-cde4e3f451f3','Fara','Rakoto','Madagascar','2024-02-21',81,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a6b0d1d9-ae8c-48ab-8b79-bcefbf8822a8','QX-318-0','9be283ea-351b-402a-a2cb-cde4e3f451f3','habitation',579,'2025-03-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('032f9eff-9dd7-4337-b6f6-4304c152750e','POLX-318-0','9be283ea-351b-402a-a2cb-cde4e3f451f3','a6b0d1d9-ae8c-48ab-8b79-bcefbf8822a8','habitation','2025-03-21','2026-03-21',717,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('0fdff191-b9ed-4179-84d6-c5aa9cd163d5','user319@demo.com',crypt('test123', gen_salt('bf')),'client','2025-06-27');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('0fdff191-b9ed-4179-84d6-c5aa9cd163d5','Mialy','Rakotondranaivo','Madagascar','2025-06-27',36,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c0c930d6-c9bb-4043-97c0-5f8f6f65d7b6','QX-319-0','0fdff191-b9ed-4179-84d6-c5aa9cd163d5','habitation',128,'2020-12-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('b938c46e-8aad-47fd-a547-9f07069e7227','POLX-319-0','0fdff191-b9ed-4179-84d6-c5aa9cd163d5','c0c930d6-c9bb-4043-97c0-5f8f6f65d7b6','habitation','2020-12-19','2021-12-19',490,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('0f8490fd-dab4-4925-acfd-2fafd810d6ff','user320@demo.com',crypt('test123', gen_salt('bf')),'client','2020-09-23');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('0f8490fd-dab4-4925-acfd-2fafd810d6ff','Sarah','Rafidy','Madagascar','2020-09-23',29,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9c727101-a0e3-43ac-a4e9-fd869e1cea16','QX-320-0','0f8490fd-dab4-4925-acfd-2fafd810d6ff','habitation',328,'2022-05-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('ffe85e11-4f3b-4018-b5c0-701bc64d0aa6','POLX-320-0','0f8490fd-dab4-4925-acfd-2fafd810d6ff','9c727101-a0e3-43ac-a4e9-fd869e1cea16','habitation','2022-05-03','2023-05-03',431,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('c7075973-bc86-400e-9b39-78887a0a1e3c','user321@demo.com',crypt('test123', gen_salt('bf')),'client','2019-07-19');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('c7075973-bc86-400e-9b39-78887a0a1e3c','Haja','Rakotondranaivo','Madagascar','2019-07-19',39,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ada4f961-346c-4406-8c34-a38ce4dcabdb','QX-321-0','c7075973-bc86-400e-9b39-78887a0a1e3c','habitation',202,'2024-08-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('4f7cfeed-c266-40c7-847f-dbe8f6716394','POLX-321-0','c7075973-bc86-400e-9b39-78887a0a1e3c','ada4f961-346c-4406-8c34-a38ce4dcabdb','habitation','2024-08-28','2025-08-28',268,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b693fda7-c525-4b64-900f-7e0eec0eece6','QX-321-1','c7075973-bc86-400e-9b39-78887a0a1e3c','habitation',743,'2026-03-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e00ace8a-c291-41cc-b1ac-16ecccce6287','POLX-321-1','c7075973-bc86-400e-9b39-78887a0a1e3c','b693fda7-c525-4b64-900f-7e0eec0eece6','habitation','2026-03-30','2027-03-30',689,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('5b719c22-42a2-421c-bab4-e3cda20eac64','user322@demo.com',crypt('test123', gen_salt('bf')),'client','2022-09-30');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('5b719c22-42a2-421c-bab4-e3cda20eac64','Haja','Razafindrakoto','Madagascar','2022-09-30',85,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('60aba1c6-0ef8-42ec-95c2-6d7bdd2c526e','QX-322-0','5b719c22-42a2-421c-bab4-e3cda20eac64','habitation',529,'2024-12-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e72d30c9-c345-4e01-bc3b-a25bda4e151b','POLX-322-0','5b719c22-42a2-421c-bab4-e3cda20eac64','60aba1c6-0ef8-42ec-95c2-6d7bdd2c526e','habitation','2024-12-14','2025-12-14',701,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('8f0e22a1-5768-49b0-a54f-c20ee7b974c8','user323@demo.com',crypt('test123', gen_salt('bf')),'client','2025-07-24');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('8f0e22a1-5768-49b0-a54f-c20ee7b974c8','Mialy','Rasoanaivo','Madagascar','2025-07-24',87,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('137dff84-ea00-4ca4-9263-f1597791526f','QX-323-0','8f0e22a1-5768-49b0-a54f-c20ee7b974c8','habitation',370,'2024-11-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('9f24bebe-18e9-4d27-9cf6-1331609c70ef','POLX-323-0','8f0e22a1-5768-49b0-a54f-c20ee7b974c8','137dff84-ea00-4ca4-9263-f1597791526f','habitation','2024-11-28','2025-11-28',367,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('e659f4cd-5a5a-40c1-8c94-8a7f30fa9fe8','user324@demo.com',crypt('test123', gen_salt('bf')),'client','2019-09-13');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('e659f4cd-5a5a-40c1-8c94-8a7f30fa9fe8','Elsa','Rafidy','Madagascar','2019-09-13',45,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a48b5274-8b08-4132-b794-c4109c17690f','QX-324-0','e659f4cd-5a5a-40c1-8c94-8a7f30fa9fe8','habitation',750,'2020-03-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('11ace308-71bd-462c-9595-98b4d137667f','POLX-324-0','e659f4cd-5a5a-40c1-8c94-8a7f30fa9fe8','a48b5274-8b08-4132-b794-c4109c17690f','habitation','2020-03-09','2021-03-09',431,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('aeaf14f7-e31b-49d7-ad5e-7a3c885c1837','QX-324-1','e659f4cd-5a5a-40c1-8c94-8a7f30fa9fe8','habitation',533,'2022-09-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('28883d0d-a0ce-42ae-8a62-ec6c7c2f154c','POLX-324-1','e659f4cd-5a5a-40c1-8c94-8a7f30fa9fe8','aeaf14f7-e31b-49d7-ad5e-7a3c885c1837','habitation','2022-09-14','2023-09-14',443,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('1471b439-1b81-41af-999a-6fdd840a24dc','user325@demo.com',crypt('test123', gen_salt('bf')),'client','2026-02-11');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('1471b439-1b81-41af-999a-6fdd840a24dc','Fara','Rasoanaivo','Madagascar','2026-02-11',88,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d2b9161f-d6de-40c0-b440-c4e6383140bc','QX-325-0','1471b439-1b81-41af-999a-6fdd840a24dc','habitation',459,'2022-01-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('85d0b003-ec86-469a-a201-c52aa61f6faf','POLX-325-0','1471b439-1b81-41af-999a-6fdd840a24dc','d2b9161f-d6de-40c0-b440-c4e6383140bc','habitation','2022-01-26','2023-01-26',250,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('12b9e768-c5ab-4410-9a22-1fd78d05bacb','QX-325-1','1471b439-1b81-41af-999a-6fdd840a24dc','habitation',281,'2023-10-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('21a0dc45-96d6-4c09-9499-0afce03b98b8','POLX-325-1','1471b439-1b81-41af-999a-6fdd840a24dc','12b9e768-c5ab-4410-9a22-1fd78d05bacb','habitation','2023-10-07','2024-10-07',614,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('e4f5aed8-7008-4d22-9ae3-10f5399d7e7d','user326@demo.com',crypt('test123', gen_salt('bf')),'client','2022-01-19');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('e4f5aed8-7008-4d22-9ae3-10f5399d7e7d','Haja','Rafidy','Madagascar','2022-01-19',76,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b3a77ca7-51ed-4004-b169-e9b13093b67e','QX-326-0','e4f5aed8-7008-4d22-9ae3-10f5399d7e7d','habitation',246,'2023-03-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('aa3ca5ba-a5ca-40d1-866e-f13bec2d6a31','POLX-326-0','e4f5aed8-7008-4d22-9ae3-10f5399d7e7d','b3a77ca7-51ed-4004-b169-e9b13093b67e','habitation','2023-03-24','2024-03-24',148,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('0b201709-bc88-4637-9918-a9dead183b09','user327@demo.com',crypt('test123', gen_salt('bf')),'client','2020-03-23');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('0b201709-bc88-4637-9918-a9dead183b09','Tojo','Rabe','Madagascar','2020-03-23',27,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('cc6f5d9c-c7ae-4852-b5eb-edacc749393c','QX-327-0','0b201709-bc88-4637-9918-a9dead183b09','habitation',703,'2025-11-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('69605f0e-090d-44c2-b222-9d68a743f168','POLX-327-0','0b201709-bc88-4637-9918-a9dead183b09','cc6f5d9c-c7ae-4852-b5eb-edacc749393c','habitation','2025-11-27','2026-11-27',476,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('707a0936-f676-48cb-bac1-1a8126fc5885','user328@demo.com',crypt('test123', gen_salt('bf')),'client','2022-06-01');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('707a0936-f676-48cb-bac1-1a8126fc5885','Tojo','Andrianina','Madagascar','2022-06-01',82,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2971dd6f-4751-41a3-b622-df5be07b3b62','QX-328-0','707a0936-f676-48cb-bac1-1a8126fc5885','habitation',716,'2024-06-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('09bf6cbc-ebf8-4c42-8cbe-301a6e1e6c39','POLX-328-0','707a0936-f676-48cb-bac1-1a8126fc5885','2971dd6f-4751-41a3-b622-df5be07b3b62','habitation','2024-06-19','2025-06-19',730,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('33c36deb-a08b-4cde-bdfd-0b214f20d5eb','QX-328-1','707a0936-f676-48cb-bac1-1a8126fc5885','habitation',785,'2025-11-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('1800050e-ef06-4339-968e-a7ebc51f1b3f','POLX-328-1','707a0936-f676-48cb-bac1-1a8126fc5885','33c36deb-a08b-4cde-bdfd-0b214f20d5eb','habitation','2025-11-05','2026-11-05',720,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('5cd2f570-9a0a-4989-8846-bc0a90a61305','user329@demo.com',crypt('test123', gen_salt('bf')),'client','2022-03-30');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('5cd2f570-9a0a-4989-8846-bc0a90a61305','Rina','Razanam','Madagascar','2022-03-30',50,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b499a4c9-e86a-46eb-953e-195e0100553f','QX-329-0','5cd2f570-9a0a-4989-8846-bc0a90a61305','habitation',529,'2020-06-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('93058ecb-3c7f-4593-888c-8bdf65a12580','POLX-329-0','5cd2f570-9a0a-4989-8846-bc0a90a61305','b499a4c9-e86a-46eb-953e-195e0100553f','habitation','2020-06-26','2021-06-26',376,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('5ec3a7fb-cfd7-45af-8e32-f176a28cecd6','QX-329-1','5cd2f570-9a0a-4989-8846-bc0a90a61305','habitation',644,'2023-12-15');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('0f7ffa19-8979-4bb6-8a5f-d5667438d296','POLX-329-1','5cd2f570-9a0a-4989-8846-bc0a90a61305','5ec3a7fb-cfd7-45af-8e32-f176a28cecd6','habitation','2023-12-15','2024-12-15',113,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('e2197f0d-85a4-4a1e-9500-e10742cf7d31','user330@demo.com',crypt('test123', gen_salt('bf')),'client','2026-03-16');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('e2197f0d-85a4-4a1e-9500-e10742cf7d31','Tojo','Andrianina','Madagascar','2026-03-16',50,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('948172e6-58f6-4f3a-9611-b897a684e464','QX-330-0','e2197f0d-85a4-4a1e-9500-e10742cf7d31','habitation',249,'2024-05-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('60746eb6-0a44-4cea-8f73-322de9d57ad3','POLX-330-0','e2197f0d-85a4-4a1e-9500-e10742cf7d31','948172e6-58f6-4f3a-9611-b897a684e464','habitation','2024-05-04','2025-05-04',515,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('53c87a3f-571a-4bd5-a918-30c473740809','QX-330-1','e2197f0d-85a4-4a1e-9500-e10742cf7d31','habitation',548,'2019-08-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('39e97629-9c95-4f56-8d03-5c28e01d209a','POLX-330-1','e2197f0d-85a4-4a1e-9500-e10742cf7d31','53c87a3f-571a-4bd5-a918-30c473740809','habitation','2019-08-22','2020-08-22',340,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('363600be-e1c6-49dc-956e-fc8e2dae86d1','user331@demo.com',crypt('test123', gen_salt('bf')),'client','2024-08-02');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('363600be-e1c6-49dc-956e-fc8e2dae86d1','Elsa','Rasoanaivo','Madagascar','2024-08-02',51,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('18e3f203-4d31-4c97-9bf7-a174e6dc4bfa','QX-331-0','363600be-e1c6-49dc-956e-fc8e2dae86d1','habitation',690,'2021-12-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('2cf3e380-406e-4dfe-8c0a-88f6427889d1','POLX-331-0','363600be-e1c6-49dc-956e-fc8e2dae86d1','18e3f203-4d31-4c97-9bf7-a174e6dc4bfa','habitation','2021-12-07','2022-12-07',718,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('62330838-297c-42ff-8c79-94fa0a2acddd','user332@demo.com',crypt('test123', gen_salt('bf')),'client','2024-02-03');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('62330838-297c-42ff-8c79-94fa0a2acddd','Tojo','Rafidy','Madagascar','2024-02-03',33,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f4e0fc2d-65c0-4d39-8564-374ae36f0721','QX-332-0','62330838-297c-42ff-8c79-94fa0a2acddd','habitation',344,'2020-10-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('64623492-95f7-44bb-8ac0-d56c4e07bd3c','POLX-332-0','62330838-297c-42ff-8c79-94fa0a2acddd','f4e0fc2d-65c0-4d39-8564-374ae36f0721','habitation','2020-10-28','2021-10-28',406,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('dc6a7501-39a4-4024-8f9b-40e328cfcf7a','user333@demo.com',crypt('test123', gen_salt('bf')),'client','2021-07-04');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('dc6a7501-39a4-4024-8f9b-40e328cfcf7a','Haja','Rabe','Madagascar','2021-07-04',51,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7a907151-e847-4043-b26a-6ecfd48dc4b7','QX-333-0','dc6a7501-39a4-4024-8f9b-40e328cfcf7a','habitation',335,'2019-03-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('68a5a6ae-1f50-4524-bc0d-908d28215d1f','POLX-333-0','dc6a7501-39a4-4024-8f9b-40e328cfcf7a','7a907151-e847-4043-b26a-6ecfd48dc4b7','habitation','2019-03-28','2020-03-28',397,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('fcffe05e-f9ed-4de4-a33b-06962883984a','QX-333-1','dc6a7501-39a4-4024-8f9b-40e328cfcf7a','habitation',658,'2024-06-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('303540ff-37f8-4b19-84d3-59acbd7d5177','POLX-333-1','dc6a7501-39a4-4024-8f9b-40e328cfcf7a','fcffe05e-f9ed-4de4-a33b-06962883984a','habitation','2024-06-16','2025-06-16',488,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('7173f036-ec4d-4f77-8de6-b36489568b2d','user334@demo.com',crypt('test123', gen_salt('bf')),'client','2021-08-17');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('7173f036-ec4d-4f77-8de6-b36489568b2d','Fara','Razafindrakoto','Madagascar','2021-08-17',44,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('59c77524-cb08-4352-b1f9-d27d2e373098','QX-334-0','7173f036-ec4d-4f77-8de6-b36489568b2d','habitation',259,'2022-12-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('b16a56f5-a276-4523-97cb-cfbd78c2f7b4','POLX-334-0','7173f036-ec4d-4f77-8de6-b36489568b2d','59c77524-cb08-4352-b1f9-d27d2e373098','habitation','2022-12-10','2023-12-10',581,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('6171b023-c9de-4e58-ac3a-1cd14048c99c','user335@demo.com',crypt('test123', gen_salt('bf')),'client','2022-05-19');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('6171b023-c9de-4e58-ac3a-1cd14048c99c','Fara','Andrianina','Madagascar','2022-05-19',38,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9d44458a-59a0-4569-b728-97c52c3ed632','QX-335-0','6171b023-c9de-4e58-ac3a-1cd14048c99c','habitation',758,'2019-08-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('666c0bf0-00d2-4649-921e-e5148db576a1','POLX-335-0','6171b023-c9de-4e58-ac3a-1cd14048c99c','9d44458a-59a0-4569-b728-97c52c3ed632','habitation','2019-08-23','2020-08-23',344,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('b367b0db-4700-4572-8455-90ab1890166f','user336@demo.com',crypt('test123', gen_salt('bf')),'client','2025-05-03');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('b367b0db-4700-4572-8455-90ab1890166f','Rina','Andrianina','Madagascar','2025-05-03',52,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c28c720e-999e-4f22-ab18-b25c64176e21','QX-336-0','b367b0db-4700-4572-8455-90ab1890166f','habitation',341,'2023-01-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5f6677b2-b3e4-4899-b8e3-a406ec20d6b3','POLX-336-0','b367b0db-4700-4572-8455-90ab1890166f','c28c720e-999e-4f22-ab18-b25c64176e21','habitation','2023-01-28','2024-01-28',389,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('fec57eb7-3d0f-45fc-bf79-7d0df532e8b1','user337@demo.com',crypt('test123', gen_salt('bf')),'client','2022-10-24');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('fec57eb7-3d0f-45fc-bf79-7d0df532e8b1','Fara','Rabe','Madagascar','2022-10-24',49,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('94fede34-c2cb-46e6-b2eb-4ecf6f237cd9','QX-337-0','fec57eb7-3d0f-45fc-bf79-7d0df532e8b1','habitation',377,'2024-06-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('1854dfc5-8d51-441f-a92d-d836ee09aae0','POLX-337-0','fec57eb7-3d0f-45fc-bf79-7d0df532e8b1','94fede34-c2cb-46e6-b2eb-4ecf6f237cd9','habitation','2024-06-14','2025-06-14',697,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('4728387c-9513-4224-b39a-032dae453d47','QX-337-1','fec57eb7-3d0f-45fc-bf79-7d0df532e8b1','habitation',745,'2024-08-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('8fa4c809-82e6-4b13-8636-334277680991','POLX-337-1','fec57eb7-3d0f-45fc-bf79-7d0df532e8b1','4728387c-9513-4224-b39a-032dae453d47','habitation','2024-08-30','2025-08-30',241,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('8b96ba69-6943-47d8-8ada-5587f5b5e262','user338@demo.com',crypt('test123', gen_salt('bf')),'client','2021-06-29');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('8b96ba69-6943-47d8-8ada-5587f5b5e262','Sarah','Razafindrakoto','Madagascar','2021-06-29',77,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9dc251a7-91ae-4cd6-b60d-6d7fc463de50','QX-338-0','8b96ba69-6943-47d8-8ada-5587f5b5e262','habitation',150,'2019-08-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('ada22512-ff17-4b58-afe0-8ce35529e5d3','POLX-338-0','8b96ba69-6943-47d8-8ada-5587f5b5e262','9dc251a7-91ae-4cd6-b60d-6d7fc463de50','habitation','2019-08-17','2020-08-17',377,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e60e6d5c-4328-4dcf-a352-17c337b9912d','QX-338-1','8b96ba69-6943-47d8-8ada-5587f5b5e262','habitation',417,'2022-11-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('b642e015-5084-42ca-88d3-026f6291204a','POLX-338-1','8b96ba69-6943-47d8-8ada-5587f5b5e262','e60e6d5c-4328-4dcf-a352-17c337b9912d','habitation','2022-11-01','2023-11-01',685,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('d7567ade-ece9-46fc-a799-fac272f5c21b','user339@demo.com',crypt('test123', gen_salt('bf')),'client','2024-11-02');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('d7567ade-ece9-46fc-a799-fac272f5c21b','Elsa','Rakoto','Madagascar','2024-11-02',63,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e46cabdd-1685-4cd2-8ae7-87b0a89bb4ba','QX-339-0','d7567ade-ece9-46fc-a799-fac272f5c21b','habitation',418,'2019-07-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('083d2c45-06be-4cdf-9c53-22ea952bd5ad','POLX-339-0','d7567ade-ece9-46fc-a799-fac272f5c21b','e46cabdd-1685-4cd2-8ae7-87b0a89bb4ba','habitation','2019-07-23','2020-07-23',578,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1921232b-e941-40f6-885b-ad35ec2ac421','QX-339-1','d7567ade-ece9-46fc-a799-fac272f5c21b','habitation',558,'2023-03-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f819f919-257b-4601-bdb9-3bf454b56f12','POLX-339-1','d7567ade-ece9-46fc-a799-fac272f5c21b','1921232b-e941-40f6-885b-ad35ec2ac421','habitation','2023-03-04','2024-03-04',379,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('877c1e1d-e088-48c3-843f-8bde5dd70b30','user340@demo.com',crypt('test123', gen_salt('bf')),'client','2021-10-09');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('877c1e1d-e088-48c3-843f-8bde5dd70b30','Fara','Rakotondranaivo','Madagascar','2021-10-09',23,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('fda10ce3-c91b-40fa-8d4b-9c026e4bf0ce','QX-340-0','877c1e1d-e088-48c3-843f-8bde5dd70b30','habitation',584,'2022-12-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('eca491e0-6e9c-402f-993d-1c308bad7146','POLX-340-0','877c1e1d-e088-48c3-843f-8bde5dd70b30','fda10ce3-c91b-40fa-8d4b-9c026e4bf0ce','habitation','2022-12-08','2023-12-08',430,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('222a49a2-52d3-4a93-a1c7-7015b2fc157b','user341@demo.com',crypt('test123', gen_salt('bf')),'client','2020-09-22');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('222a49a2-52d3-4a93-a1c7-7015b2fc157b','Kevin','Razafindrakoto','Madagascar','2020-09-22',60,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('24611f90-225c-4fa9-bdc3-854bb5544848','QX-341-0','222a49a2-52d3-4a93-a1c7-7015b2fc157b','habitation',372,'2025-07-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('2cfa93cb-b8d8-4dd7-abb7-81edf4dac586','POLX-341-0','222a49a2-52d3-4a93-a1c7-7015b2fc157b','24611f90-225c-4fa9-bdc3-854bb5544848','habitation','2025-07-30','2026-07-30',331,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('cdb507d9-b2e3-42dd-925e-db58a8b481ba','user342@demo.com',crypt('test123', gen_salt('bf')),'client','2025-10-11');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('cdb507d9-b2e3-42dd-925e-db58a8b481ba','Elsa','Rakoto','Madagascar','2025-10-11',22,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c751db08-c59e-4380-a28d-79209f0bbb57','QX-342-0','cdb507d9-b2e3-42dd-925e-db58a8b481ba','habitation',528,'2019-04-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('1a2d1b4e-3840-4376-b7ab-50e58a33b113','POLX-342-0','cdb507d9-b2e3-42dd-925e-db58a8b481ba','c751db08-c59e-4380-a28d-79209f0bbb57','habitation','2019-04-08','2020-04-08',313,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('c0834b81-79c2-4fca-83a9-28743b594275','user343@demo.com',crypt('test123', gen_salt('bf')),'client','2023-06-18');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('c0834b81-79c2-4fca-83a9-28743b594275','Kevin','Rakoto','Madagascar','2023-06-18',28,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('dc8707f7-b14d-4229-a555-7d6d588d014d','QX-343-0','c0834b81-79c2-4fca-83a9-28743b594275','habitation',181,'2022-03-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('db2c5ce5-44fe-42d9-b42d-7b4cea5dfd07','POLX-343-0','c0834b81-79c2-4fca-83a9-28743b594275','dc8707f7-b14d-4229-a555-7d6d588d014d','habitation','2022-03-06','2023-03-06',638,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('6feaf081-16d1-4cd0-8fcf-e2602019c29c','user344@demo.com',crypt('test123', gen_salt('bf')),'client','2022-09-01');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('6feaf081-16d1-4cd0-8fcf-e2602019c29c','Nina','Rakotondranaivo','Madagascar','2022-09-01',95,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3d851154-f0c8-4c7b-9622-7601f23946e1','QX-344-0','6feaf081-16d1-4cd0-8fcf-e2602019c29c','habitation',755,'2024-01-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e6570b8d-66a7-4033-81f0-bff2fecfe163','POLX-344-0','6feaf081-16d1-4cd0-8fcf-e2602019c29c','3d851154-f0c8-4c7b-9622-7601f23946e1','habitation','2024-01-03','2025-01-03',404,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('254f6fb7-2c08-4985-a8d4-5d1d0f15b3c1','user345@demo.com',crypt('test123', gen_salt('bf')),'client','2023-12-13');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('254f6fb7-2c08-4985-a8d4-5d1d0f15b3c1','Tony','Razanam','Madagascar','2023-12-13',63,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9bc063fc-417f-4178-b813-26540cd87251','QX-345-0','254f6fb7-2c08-4985-a8d4-5d1d0f15b3c1','habitation',412,'2021-08-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5b3f731b-d7a9-489d-a296-0766aeec6ecd','POLX-345-0','254f6fb7-2c08-4985-a8d4-5d1d0f15b3c1','9bc063fc-417f-4178-b813-26540cd87251','habitation','2021-08-05','2022-08-05',496,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('5d5e4bef-533e-4f4a-9ce2-600cc5809d10','user346@demo.com',crypt('test123', gen_salt('bf')),'client','2023-07-24');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('5d5e4bef-533e-4f4a-9ce2-600cc5809d10','Kevin','Andrianina','Madagascar','2023-07-24',93,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('adb38cc0-3612-4d4d-95df-ee1ea83010dd','QX-346-0','5d5e4bef-533e-4f4a-9ce2-600cc5809d10','habitation',169,'2025-06-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('02b2cba3-f2ce-45ed-b619-da00e7388cf4','POLX-346-0','5d5e4bef-533e-4f4a-9ce2-600cc5809d10','adb38cc0-3612-4d4d-95df-ee1ea83010dd','habitation','2025-06-05','2026-06-05',526,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('fb13b65e-ebd8-496f-8a05-040149686b46','QX-346-1','5d5e4bef-533e-4f4a-9ce2-600cc5809d10','habitation',487,'2020-06-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('81b884aa-8370-40ad-87bf-0192d4365dc3','POLX-346-1','5d5e4bef-533e-4f4a-9ce2-600cc5809d10','fb13b65e-ebd8-496f-8a05-040149686b46','habitation','2020-06-10','2021-06-10',324,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('d2e3d3ff-c9d9-458e-a21b-f8f1ce37b391','user347@demo.com',crypt('test123', gen_salt('bf')),'client','2020-10-12');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('d2e3d3ff-c9d9-458e-a21b-f8f1ce37b391','Elsa','Rafidy','Madagascar','2020-10-12',23,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('04abf605-2245-4833-80bd-090a0d151405','QX-347-0','d2e3d3ff-c9d9-458e-a21b-f8f1ce37b391','habitation',784,'2025-04-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('59c4a8b9-5f80-4740-8765-257922768d24','POLX-347-0','d2e3d3ff-c9d9-458e-a21b-f8f1ce37b391','04abf605-2245-4833-80bd-090a0d151405','habitation','2025-04-03','2026-04-03',704,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('19776d4e-9776-4282-b987-03845b6e7fc7','user348@demo.com',crypt('test123', gen_salt('bf')),'client','2019-09-10');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('19776d4e-9776-4282-b987-03845b6e7fc7','Tony','Andrianina','Madagascar','2019-09-10',45,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('fb01ab2f-01fd-4eec-af9a-7baefbaa9c1b','QX-348-0','19776d4e-9776-4282-b987-03845b6e7fc7','habitation',170,'2019-06-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('16d81b4d-71d9-40a9-aed1-5f3588b01af4','POLX-348-0','19776d4e-9776-4282-b987-03845b6e7fc7','fb01ab2f-01fd-4eec-af9a-7baefbaa9c1b','habitation','2019-06-03','2020-06-03',486,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('e9b260dd-5b4c-4a5b-8676-44c08521d416','user349@demo.com',crypt('test123', gen_salt('bf')),'client','2025-06-24');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('e9b260dd-5b4c-4a5b-8676-44c08521d416','Fara','Rasoanaivo','Madagascar','2025-06-24',40,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('772970b4-e3eb-4d05-a92c-f6227ade0e7b','QX-349-0','e9b260dd-5b4c-4a5b-8676-44c08521d416','habitation',771,'2021-07-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('6dbba6c7-a713-4568-9f44-c72f32f400be','POLX-349-0','e9b260dd-5b4c-4a5b-8676-44c08521d416','772970b4-e3eb-4d05-a92c-f6227ade0e7b','habitation','2021-07-11','2022-07-11',799,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8667b04d-185c-4ee9-a523-0a2f540d44e2','QX-349-1','e9b260dd-5b4c-4a5b-8676-44c08521d416','habitation',388,'2024-07-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5ba3dd14-e465-4f82-83cb-b2ab814d50a4','POLX-349-1','e9b260dd-5b4c-4a5b-8676-44c08521d416','8667b04d-185c-4ee9-a523-0a2f540d44e2','habitation','2024-07-22','2025-07-22',353,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('85f6745b-b93a-4915-bb61-769385267f46','user350@demo.com',crypt('test123', gen_salt('bf')),'client','2026-04-08');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('85f6745b-b93a-4915-bb61-769385267f46','Tojo','Rakotondranaivo','Madagascar','2026-04-08',76,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('cb892add-a0f4-4183-9cf4-da472f97b0ac','QX-350-0','85f6745b-b93a-4915-bb61-769385267f46','habitation',646,'2026-02-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('c289c17b-9c1d-440f-ba38-0a19b4ec9c58','POLX-350-0','85f6745b-b93a-4915-bb61-769385267f46','cb892add-a0f4-4183-9cf4-da472f97b0ac','habitation','2026-02-14','2027-02-14',522,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('11c9886e-964b-435d-9a6c-905d54464a12','user351@demo.com',crypt('test123', gen_salt('bf')),'client','2023-02-12');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('11c9886e-964b-435d-9a6c-905d54464a12','Fara','Razanam','Madagascar','2023-02-12',53,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1da82d37-4d09-4a61-bcfd-81e2ae219133','QX-351-0','11c9886e-964b-435d-9a6c-905d54464a12','habitation',108,'2023-05-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('71d3d6de-5660-43b7-983b-a70b2a850bf2','POLX-351-0','11c9886e-964b-435d-9a6c-905d54464a12','1da82d37-4d09-4a61-bcfd-81e2ae219133','habitation','2023-05-03','2024-05-03',381,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('73b9c57f-c5d6-41b7-b3f2-fd1ba58cce99','user352@demo.com',crypt('test123', gen_salt('bf')),'client','2022-05-09');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('73b9c57f-c5d6-41b7-b3f2-fd1ba58cce99','Nina','Rabe','Madagascar','2022-05-09',92,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ff282404-198d-4c90-bb03-27d5e0cd9edd','QX-352-0','73b9c57f-c5d6-41b7-b3f2-fd1ba58cce99','habitation',522,'2020-01-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5905f5d3-11ef-48af-a6b1-28bc1a6fe950','POLX-352-0','73b9c57f-c5d6-41b7-b3f2-fd1ba58cce99','ff282404-198d-4c90-bb03-27d5e0cd9edd','habitation','2020-01-09','2021-01-09',411,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7f86d4fd-85a5-4b10-ad7f-c069b73d2b93','QX-352-1','73b9c57f-c5d6-41b7-b3f2-fd1ba58cce99','habitation',102,'2021-11-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('4b930858-4703-4476-82ab-565de1068a2a','POLX-352-1','73b9c57f-c5d6-41b7-b3f2-fd1ba58cce99','7f86d4fd-85a5-4b10-ad7f-c069b73d2b93','habitation','2021-11-26','2022-11-26',696,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('8a9448c3-4794-4e6a-a90a-92ded852eed7','user353@demo.com',crypt('test123', gen_salt('bf')),'client','2022-03-21');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('8a9448c3-4794-4e6a-a90a-92ded852eed7','Tojo','Razafindrakoto','Madagascar','2022-03-21',56,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9222f467-5744-4b65-882c-83ab5a3df268','QX-353-0','8a9448c3-4794-4e6a-a90a-92ded852eed7','habitation',607,'2022-08-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e95222f7-59ea-4657-8f6d-299bfd0ec7e7','POLX-353-0','8a9448c3-4794-4e6a-a90a-92ded852eed7','9222f467-5744-4b65-882c-83ab5a3df268','habitation','2022-08-24','2023-08-24',386,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9fcbeaea-eac1-4b05-b109-7077b4fc9497','QX-353-1','8a9448c3-4794-4e6a-a90a-92ded852eed7','habitation',470,'2024-09-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('46919a07-4cf2-4113-9682-4cd2089b5feb','POLX-353-1','8a9448c3-4794-4e6a-a90a-92ded852eed7','9fcbeaea-eac1-4b05-b109-7077b4fc9497','habitation','2024-09-16','2025-09-16',284,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('72d366e1-21c4-4acc-a916-a5f496ce207f','user354@demo.com',crypt('test123', gen_salt('bf')),'client','2022-02-16');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('72d366e1-21c4-4acc-a916-a5f496ce207f','Tojo','Rasoanaivo','Madagascar','2022-02-16',27,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0ba65c06-f505-47e9-babd-ecda20c626d5','QX-354-0','72d366e1-21c4-4acc-a916-a5f496ce207f','habitation',324,'2024-05-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('14b9a382-1973-4235-8528-da0551af0284','POLX-354-0','72d366e1-21c4-4acc-a916-a5f496ce207f','0ba65c06-f505-47e9-babd-ecda20c626d5','habitation','2024-05-05','2025-05-05',506,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('93522d3c-6e8d-4fad-9c34-40e7c31ccef0','user355@demo.com',crypt('test123', gen_salt('bf')),'client','2024-07-12');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('93522d3c-6e8d-4fad-9c34-40e7c31ccef0','Kevin','Rasoanaivo','Madagascar','2024-07-12',82,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c3bbadb1-5a60-482d-9b74-18a399ee81a1','QX-355-0','93522d3c-6e8d-4fad-9c34-40e7c31ccef0','habitation',524,'2022-07-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('05e7a92a-f6ec-4d73-8c45-7ffcd6aff86e','POLX-355-0','93522d3c-6e8d-4fad-9c34-40e7c31ccef0','c3bbadb1-5a60-482d-9b74-18a399ee81a1','habitation','2022-07-07','2023-07-07',332,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('313b98ec-ca94-4837-9f9b-c06dd2a43a40','user356@demo.com',crypt('test123', gen_salt('bf')),'client','2024-04-07');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('313b98ec-ca94-4837-9f9b-c06dd2a43a40','Rina','Andrianina','Madagascar','2024-04-07',98,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0519552c-477a-4dfc-beb6-b02bb6c01fe0','QX-356-0','313b98ec-ca94-4837-9f9b-c06dd2a43a40','habitation',407,'2025-07-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('1a0007ef-6cee-45de-8a95-a9c81d5af50c','POLX-356-0','313b98ec-ca94-4837-9f9b-c06dd2a43a40','0519552c-477a-4dfc-beb6-b02bb6c01fe0','habitation','2025-07-24','2026-07-24',199,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('af9ea694-6b69-40e7-a2ad-d2f478abd9cc','user357@demo.com',crypt('test123', gen_salt('bf')),'client','2025-04-09');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('af9ea694-6b69-40e7-a2ad-d2f478abd9cc','Haja','Razafindrakoto','Madagascar','2025-04-09',32,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('16802022-62be-4f53-82ba-210b756fa6b8','QX-357-0','af9ea694-6b69-40e7-a2ad-d2f478abd9cc','habitation',233,'2022-07-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('d3e59183-4133-4330-89aa-f44017dd724a','POLX-357-0','af9ea694-6b69-40e7-a2ad-d2f478abd9cc','16802022-62be-4f53-82ba-210b756fa6b8','habitation','2022-07-14','2023-07-14',591,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('4911a3d9-f215-4082-8a87-daf937ad7bf1','user358@demo.com',crypt('test123', gen_salt('bf')),'client','2024-10-02');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('4911a3d9-f215-4082-8a87-daf937ad7bf1','Fara','Andrianina','Madagascar','2024-10-02',91,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0cd5d2e2-2c5a-4fa3-befe-c6abf61352b1','QX-358-0','4911a3d9-f215-4082-8a87-daf937ad7bf1','habitation',279,'2023-12-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('89abbc99-3c92-4499-8a98-64f9bc539687','POLX-358-0','4911a3d9-f215-4082-8a87-daf937ad7bf1','0cd5d2e2-2c5a-4fa3-befe-c6abf61352b1','habitation','2023-12-10','2024-12-10',607,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('fbb3ee16-b267-4595-ad72-822a0044a182','user359@demo.com',crypt('test123', gen_salt('bf')),'client','2025-04-14');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('fbb3ee16-b267-4595-ad72-822a0044a182','Elsa','Rabe','Madagascar','2025-04-14',37,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f9d4d7cf-cb07-4111-92ab-4ed76e000160','QX-359-0','fbb3ee16-b267-4595-ad72-822a0044a182','habitation',303,'2023-02-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('bcafcfed-a768-4105-a37e-a03958da5bcb','POLX-359-0','fbb3ee16-b267-4595-ad72-822a0044a182','f9d4d7cf-cb07-4111-92ab-4ed76e000160','habitation','2023-02-11','2024-02-11',423,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('36155b9e-228a-41f7-8bd5-bc4c4e56e59c','user360@demo.com',crypt('test123', gen_salt('bf')),'client','2019-03-17');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('36155b9e-228a-41f7-8bd5-bc4c4e56e59c','Haja','Razanam','Madagascar','2019-03-17',49,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7609e2b6-046c-4112-a519-59930ccbdc6e','QX-360-0','36155b9e-228a-41f7-8bd5-bc4c4e56e59c','habitation',205,'2019-06-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('178ecd62-a97d-4526-884b-e3fde5b618fe','POLX-360-0','36155b9e-228a-41f7-8bd5-bc4c4e56e59c','7609e2b6-046c-4112-a519-59930ccbdc6e','habitation','2019-06-19','2020-06-19',194,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('beb07f14-1243-4a1c-be2e-4787a7d8a10d','QX-360-1','36155b9e-228a-41f7-8bd5-bc4c4e56e59c','habitation',402,'2022-11-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f882dcf0-dc3d-4d0e-a501-67ee18d3bc04','POLX-360-1','36155b9e-228a-41f7-8bd5-bc4c4e56e59c','beb07f14-1243-4a1c-be2e-4787a7d8a10d','habitation','2022-11-23','2023-11-23',389,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('71313f50-f51a-4607-9e2e-ebf6c0745873','user361@demo.com',crypt('test123', gen_salt('bf')),'client','2023-11-18');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('71313f50-f51a-4607-9e2e-ebf6c0745873','Mialy','Razafindrakoto','Madagascar','2023-11-18',98,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d2fdd0a6-5930-47c6-abf4-b02848b4c561','QX-361-0','71313f50-f51a-4607-9e2e-ebf6c0745873','habitation',533,'2022-02-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e538ada9-3e0a-4eea-919a-18b39616c289','POLX-361-0','71313f50-f51a-4607-9e2e-ebf6c0745873','d2fdd0a6-5930-47c6-abf4-b02848b4c561','habitation','2022-02-01','2023-02-01',722,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a3f1067d-dcb3-4873-85f7-4aac90b7900c','QX-361-1','71313f50-f51a-4607-9e2e-ebf6c0745873','habitation',707,'2021-07-15');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('a200cc5e-6c2e-488c-b192-e2c7427658f1','POLX-361-1','71313f50-f51a-4607-9e2e-ebf6c0745873','a3f1067d-dcb3-4873-85f7-4aac90b7900c','habitation','2021-07-15','2022-07-15',525,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a619e0c1-83d8-496e-8740-e04bce2536f2','user362@demo.com',crypt('test123', gen_salt('bf')),'client','2024-10-09');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('a619e0c1-83d8-496e-8740-e04bce2536f2','Elsa','Andrianina','Madagascar','2024-10-09',67,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('bd162fda-4d64-4c84-b004-d1cf096087ea','QX-362-0','a619e0c1-83d8-496e-8740-e04bce2536f2','habitation',563,'2021-12-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('d2c263ed-b799-4d78-b602-09fc6e08312c','POLX-362-0','a619e0c1-83d8-496e-8740-e04bce2536f2','bd162fda-4d64-4c84-b004-d1cf096087ea','habitation','2021-12-08','2022-12-08',705,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('7777de99-1c76-47ca-b802-dfb6b7f1ece1','user363@demo.com',crypt('test123', gen_salt('bf')),'client','2021-01-20');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('7777de99-1c76-47ca-b802-dfb6b7f1ece1','Elsa','Rasoanaivo','Madagascar','2021-01-20',68,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a3d952a0-19a6-4eca-b519-64f043a959c2','QX-363-0','7777de99-1c76-47ca-b802-dfb6b7f1ece1','habitation',271,'2022-10-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('ac726e84-0fb4-4ef1-8e7a-c9eb99461c8d','POLX-363-0','7777de99-1c76-47ca-b802-dfb6b7f1ece1','a3d952a0-19a6-4eca-b519-64f043a959c2','habitation','2022-10-14','2023-10-14',331,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e2adea3b-6f30-4cc1-939d-af32a9d9e8bb','QX-363-1','7777de99-1c76-47ca-b802-dfb6b7f1ece1','habitation',174,'2019-12-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('fb728b4d-be61-4f90-a3ea-f85cd5261731','POLX-363-1','7777de99-1c76-47ca-b802-dfb6b7f1ece1','e2adea3b-6f30-4cc1-939d-af32a9d9e8bb','habitation','2019-12-16','2020-12-16',270,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a7022b9c-e18c-41d7-b86a-e5c81e1af967','user364@demo.com',crypt('test123', gen_salt('bf')),'client','2022-12-29');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('a7022b9c-e18c-41d7-b86a-e5c81e1af967','Rina','Razafindrakoto','Madagascar','2022-12-29',25,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('22009756-16d2-448c-a0ab-6a80c1e677df','QX-364-0','a7022b9c-e18c-41d7-b86a-e5c81e1af967','habitation',410,'2025-03-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('46344d98-95b5-4873-9052-ba7bc66e9f0f','POLX-364-0','a7022b9c-e18c-41d7-b86a-e5c81e1af967','22009756-16d2-448c-a0ab-6a80c1e677df','habitation','2025-03-11','2026-03-11',464,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('17067e21-62f3-4314-9caf-747546a0cc80','user365@demo.com',crypt('test123', gen_salt('bf')),'client','2021-09-28');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('17067e21-62f3-4314-9caf-747546a0cc80','Elsa','Razanam','Madagascar','2021-09-28',58,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('290c71ed-4d81-4b2c-8859-367ef8b41f72','QX-365-0','17067e21-62f3-4314-9caf-747546a0cc80','habitation',270,'2021-07-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('01adfb4e-5be8-4f2c-adc9-d1760e1009bd','POLX-365-0','17067e21-62f3-4314-9caf-747546a0cc80','290c71ed-4d81-4b2c-8859-367ef8b41f72','habitation','2021-07-20','2022-07-20',529,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c893df6e-b398-4068-ae59-555c084e381e','QX-365-1','17067e21-62f3-4314-9caf-747546a0cc80','habitation',358,'2019-08-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('b5b42dac-81a5-4d85-a300-0e3209872283','POLX-365-1','17067e21-62f3-4314-9caf-747546a0cc80','c893df6e-b398-4068-ae59-555c084e381e','habitation','2019-08-04','2020-08-04',692,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('da2dfc3f-355b-4cf7-8eb5-a4b21dcbbe01','user366@demo.com',crypt('test123', gen_salt('bf')),'client','2022-01-29');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('da2dfc3f-355b-4cf7-8eb5-a4b21dcbbe01','Fara','Rasoanaivo','Madagascar','2022-01-29',34,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a9b04d58-7e56-4d6a-9d0c-85e61a714cb8','QX-366-0','da2dfc3f-355b-4cf7-8eb5-a4b21dcbbe01','habitation',733,'2024-09-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('75d83943-7d7e-474a-b21e-93cd81a41a46','POLX-366-0','da2dfc3f-355b-4cf7-8eb5-a4b21dcbbe01','a9b04d58-7e56-4d6a-9d0c-85e61a714cb8','habitation','2024-09-20','2025-09-20',564,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e4110dcf-de6f-4329-ac48-1228aa440210','QX-366-1','da2dfc3f-355b-4cf7-8eb5-a4b21dcbbe01','habitation',702,'2023-09-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('95d2fd9f-7d8d-4840-8f9f-71a3a6bb4506','POLX-366-1','da2dfc3f-355b-4cf7-8eb5-a4b21dcbbe01','e4110dcf-de6f-4329-ac48-1228aa440210','habitation','2023-09-03','2024-09-03',283,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('751b7352-92e2-4858-9859-53086e0a4b94','user367@demo.com',crypt('test123', gen_salt('bf')),'client','2021-08-06');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('751b7352-92e2-4858-9859-53086e0a4b94','Elsa','Rafidy','Madagascar','2021-08-06',34,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('14f25a81-b67f-4125-bd7c-720837e76334','QX-367-0','751b7352-92e2-4858-9859-53086e0a4b94','habitation',152,'2021-04-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('c4d56b6a-edbc-4526-a48e-c8de6027b163','POLX-367-0','751b7352-92e2-4858-9859-53086e0a4b94','14f25a81-b67f-4125-bd7c-720837e76334','habitation','2021-04-13','2022-04-13',344,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('6755e8f4-7968-4123-8050-33751807d2f6','user368@demo.com',crypt('test123', gen_salt('bf')),'client','2020-09-22');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('6755e8f4-7968-4123-8050-33751807d2f6','Fara','Andrianina','Madagascar','2020-09-22',52,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c54f6d2e-460d-4170-abbb-690a30ae564c','QX-368-0','6755e8f4-7968-4123-8050-33751807d2f6','habitation',692,'2019-06-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('dc5a826f-4745-463b-9027-369869eaf649','POLX-368-0','6755e8f4-7968-4123-8050-33751807d2f6','c54f6d2e-460d-4170-abbb-690a30ae564c','habitation','2019-06-28','2020-06-28',274,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('056d58e7-1040-44bd-92ea-7a2b48753003','user369@demo.com',crypt('test123', gen_salt('bf')),'client','2023-05-17');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('056d58e7-1040-44bd-92ea-7a2b48753003','Rina','Rakoto','Madagascar','2023-05-17',71,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('13d20bce-f11a-477d-a05c-4c3aaeca9c1c','QX-369-0','056d58e7-1040-44bd-92ea-7a2b48753003','habitation',362,'2023-02-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('0952f035-7df0-437d-9d1b-636e187cd903','POLX-369-0','056d58e7-1040-44bd-92ea-7a2b48753003','13d20bce-f11a-477d-a05c-4c3aaeca9c1c','habitation','2023-02-05','2024-02-05',557,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9f7a9691-1915-4756-b61b-ac1fdd109a1f','QX-369-1','056d58e7-1040-44bd-92ea-7a2b48753003','habitation',250,'2020-04-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('a0e0cac0-d4ba-4d79-8c42-3f4374ba0b46','POLX-369-1','056d58e7-1040-44bd-92ea-7a2b48753003','9f7a9691-1915-4756-b61b-ac1fdd109a1f','habitation','2020-04-08','2021-04-08',683,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('44e0afd6-a11c-4fae-886b-360155a0f0a6','user370@demo.com',crypt('test123', gen_salt('bf')),'client','2024-12-15');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('44e0afd6-a11c-4fae-886b-360155a0f0a6','Tojo','Razafindrakoto','Madagascar','2024-12-15',29,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c911b278-520a-4475-90e5-03674f9cb3b7','QX-370-0','44e0afd6-a11c-4fae-886b-360155a0f0a6','habitation',583,'2020-02-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('7909b2dc-bfd9-4907-9be0-b4007aebf16d','POLX-370-0','44e0afd6-a11c-4fae-886b-360155a0f0a6','c911b278-520a-4475-90e5-03674f9cb3b7','habitation','2020-02-01','2021-02-01',299,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a17fa60c-6f69-467a-a45a-96cf7162a2ff','user371@demo.com',crypt('test123', gen_salt('bf')),'client','2023-03-15');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('a17fa60c-6f69-467a-a45a-96cf7162a2ff','Mialy','Rafidy','Madagascar','2023-03-15',67,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('53151f41-54ac-4055-b829-6dff911e7e0d','QX-371-0','a17fa60c-6f69-467a-a45a-96cf7162a2ff','habitation',230,'2022-05-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('97998d99-ce69-4fe4-aebd-29fc9247feb0','POLX-371-0','a17fa60c-6f69-467a-a45a-96cf7162a2ff','53151f41-54ac-4055-b829-6dff911e7e0d','habitation','2022-05-27','2023-05-27',309,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('994e074d-dfbf-49ec-aa8c-719c57475361','user372@demo.com',crypt('test123', gen_salt('bf')),'client','2025-12-07');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('994e074d-dfbf-49ec-aa8c-719c57475361','Mialy','Rafidy','Madagascar','2025-12-07',67,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9be10c05-afb7-40bc-87b5-d7cfa5e898e2','QX-372-0','994e074d-dfbf-49ec-aa8c-719c57475361','habitation',791,'2021-03-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('9c9805fa-1598-4793-aa7c-c55a8514852f','POLX-372-0','994e074d-dfbf-49ec-aa8c-719c57475361','9be10c05-afb7-40bc-87b5-d7cfa5e898e2','habitation','2021-03-28','2022-03-28',342,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b5504ab7-bce5-4d45-8b41-f5ab60e712c3','QX-372-1','994e074d-dfbf-49ec-aa8c-719c57475361','habitation',611,'2023-11-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('7184dc61-c9c6-424a-b3d4-7e63eb07b1d4','POLX-372-1','994e074d-dfbf-49ec-aa8c-719c57475361','b5504ab7-bce5-4d45-8b41-f5ab60e712c3','habitation','2023-11-02','2024-11-02',201,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('251f84e5-e902-49ff-b783-75cbcb0fa5a3','user373@demo.com',crypt('test123', gen_salt('bf')),'client','2025-05-24');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('251f84e5-e902-49ff-b783-75cbcb0fa5a3','Mialy','Rakoto','Madagascar','2025-05-24',39,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('445559dc-3377-4f2b-925a-ef85995d5353','QX-373-0','251f84e5-e902-49ff-b783-75cbcb0fa5a3','habitation',107,'2023-07-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('74247853-9272-4e69-aaba-b3bb27cdce61','POLX-373-0','251f84e5-e902-49ff-b783-75cbcb0fa5a3','445559dc-3377-4f2b-925a-ef85995d5353','habitation','2023-07-07','2024-07-07',448,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d3ef8d8a-9f1d-4c17-a04c-d061fd6f261b','QX-373-1','251f84e5-e902-49ff-b783-75cbcb0fa5a3','habitation',524,'2022-06-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('a700a29e-2a68-4547-a6d5-db42d89b3dce','POLX-373-1','251f84e5-e902-49ff-b783-75cbcb0fa5a3','d3ef8d8a-9f1d-4c17-a04c-d061fd6f261b','habitation','2022-06-09','2023-06-09',339,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('5c1b3995-8e0a-453a-b6b8-6d8aace28d38','user374@demo.com',crypt('test123', gen_salt('bf')),'client','2019-02-12');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('5c1b3995-8e0a-453a-b6b8-6d8aace28d38','Mialy','Andrianina','Madagascar','2019-02-12',36,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ad5d4543-f088-428c-8d14-3dc9ca59a21d','QX-374-0','5c1b3995-8e0a-453a-b6b8-6d8aace28d38','habitation',239,'2022-08-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e0701aa6-74d0-42aa-a947-f2327388d673','POLX-374-0','5c1b3995-8e0a-453a-b6b8-6d8aace28d38','ad5d4543-f088-428c-8d14-3dc9ca59a21d','habitation','2022-08-24','2023-08-24',564,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('62556601-5b9e-4c14-9854-6b68024c373b','user375@demo.com',crypt('test123', gen_salt('bf')),'client','2025-04-21');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('62556601-5b9e-4c14-9854-6b68024c373b','Tojo','Razafindrakoto','Madagascar','2025-04-21',70,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1317189f-de17-469f-9fe3-3eb9f256f65e','QX-375-0','62556601-5b9e-4c14-9854-6b68024c373b','habitation',626,'2023-11-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('27a9ff0c-8205-4797-8c79-ede5436198bf','POLX-375-0','62556601-5b9e-4c14-9854-6b68024c373b','1317189f-de17-469f-9fe3-3eb9f256f65e','habitation','2023-11-05','2024-11-05',234,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('86c227f8-6255-4df8-a717-004cbb658c68','user376@demo.com',crypt('test123', gen_salt('bf')),'client','2020-12-03');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('86c227f8-6255-4df8-a717-004cbb658c68','Kevin','Razafindrakoto','Madagascar','2020-12-03',54,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c93779a6-f6bd-4cac-8a2d-95c99bd48136','QX-376-0','86c227f8-6255-4df8-a717-004cbb658c68','habitation',202,'2023-04-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f9bfb22f-3da5-4257-bf7d-6f7d7eb71174','POLX-376-0','86c227f8-6255-4df8-a717-004cbb658c68','c93779a6-f6bd-4cac-8a2d-95c99bd48136','habitation','2023-04-26','2024-04-26',120,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('e85f2176-f8d1-4800-9719-097281d5b8cd','user377@demo.com',crypt('test123', gen_salt('bf')),'client','2024-12-05');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('e85f2176-f8d1-4800-9719-097281d5b8cd','Fara','Rasoanaivo','Madagascar','2024-12-05',100,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('4f6c0ad2-f2c5-4a15-b161-286a788cec19','QX-377-0','e85f2176-f8d1-4800-9719-097281d5b8cd','habitation',625,'2020-02-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('b2931d7a-20fd-487b-98eb-7786edf301c0','POLX-377-0','e85f2176-f8d1-4800-9719-097281d5b8cd','4f6c0ad2-f2c5-4a15-b161-286a788cec19','habitation','2020-02-17','2021-02-17',550,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('cb0c083e-5599-48f1-ae85-5bd51933de88','QX-377-1','e85f2176-f8d1-4800-9719-097281d5b8cd','habitation',728,'2025-10-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('d7fd2bbd-9cb1-4870-abc5-9990221bc146','POLX-377-1','e85f2176-f8d1-4800-9719-097281d5b8cd','cb0c083e-5599-48f1-ae85-5bd51933de88','habitation','2025-10-27','2026-10-27',363,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('e16565ff-cce3-42db-9c23-aa8968d673ad','user378@demo.com',crypt('test123', gen_salt('bf')),'client','2025-04-27');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('e16565ff-cce3-42db-9c23-aa8968d673ad','Sarah','Rafidy','Madagascar','2025-04-27',46,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('94804376-71bb-437b-9296-855f5bf2c2da','QX-378-0','e16565ff-cce3-42db-9c23-aa8968d673ad','habitation',175,'2020-08-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('1fa7b117-0d09-448f-b9da-e06cebbff774','POLX-378-0','e16565ff-cce3-42db-9c23-aa8968d673ad','94804376-71bb-437b-9296-855f5bf2c2da','habitation','2020-08-24','2021-08-24',297,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('1b9248ca-7c24-42aa-85fb-3eadc982610d','user379@demo.com',crypt('test123', gen_salt('bf')),'client','2024-10-27');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('1b9248ca-7c24-42aa-85fb-3eadc982610d','Kevin','Rakoto','Madagascar','2024-10-27',43,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('5916f423-6e07-4bd8-a1d6-16e2c19ddfac','QX-379-0','1b9248ca-7c24-42aa-85fb-3eadc982610d','habitation',525,'2022-04-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('94d3d000-14f2-4351-b3c7-404887c9dac3','POLX-379-0','1b9248ca-7c24-42aa-85fb-3eadc982610d','5916f423-6e07-4bd8-a1d6-16e2c19ddfac','habitation','2022-04-16','2023-04-16',168,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('3b36c8a3-5aec-4c09-8149-6fca2f3c2b16','user380@demo.com',crypt('test123', gen_salt('bf')),'client','2025-07-05');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('3b36c8a3-5aec-4c09-8149-6fca2f3c2b16','Mialy','Rakoto','Madagascar','2025-07-05',70,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3a112b47-3bea-4b90-87c4-c68f2a59b194','QX-380-0','3b36c8a3-5aec-4c09-8149-6fca2f3c2b16','habitation',412,'2025-10-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('4027caff-49ae-4830-b43c-f9878c366f56','POLX-380-0','3b36c8a3-5aec-4c09-8149-6fca2f3c2b16','3a112b47-3bea-4b90-87c4-c68f2a59b194','habitation','2025-10-07','2026-10-07',147,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('eb1a56cf-4214-4f6f-a174-a600b4ec0b7d','user381@demo.com',crypt('test123', gen_salt('bf')),'client','2019-02-16');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('eb1a56cf-4214-4f6f-a174-a600b4ec0b7d','Mialy','Andrianina','Madagascar','2019-02-16',25,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7f3d54ce-a567-42a7-8178-9bdc27f2c23d','QX-381-0','eb1a56cf-4214-4f6f-a174-a600b4ec0b7d','habitation',595,'2021-08-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('671b3916-aea0-498c-832a-89526ff04d49','POLX-381-0','eb1a56cf-4214-4f6f-a174-a600b4ec0b7d','7f3d54ce-a567-42a7-8178-9bdc27f2c23d','habitation','2021-08-13','2022-08-13',154,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('d60a1d32-0fb8-417a-9e89-73ff1bf3abcd','user382@demo.com',crypt('test123', gen_salt('bf')),'client','2019-03-19');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('d60a1d32-0fb8-417a-9e89-73ff1bf3abcd','Nina','Razafindrakoto','Madagascar','2019-03-19',24,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('bf26dec6-9301-454f-94b0-c12c2adc1ef5','QX-382-0','d60a1d32-0fb8-417a-9e89-73ff1bf3abcd','habitation',275,'2019-09-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('42c820c4-a087-4d5b-990f-da4339622a40','POLX-382-0','d60a1d32-0fb8-417a-9e89-73ff1bf3abcd','bf26dec6-9301-454f-94b0-c12c2adc1ef5','habitation','2019-09-17','2020-09-17',488,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('343d3b27-ca94-47a8-aede-ad4c7b47ac99','user383@demo.com',crypt('test123', gen_salt('bf')),'client','2019-09-03');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('343d3b27-ca94-47a8-aede-ad4c7b47ac99','Sarah','Rabe','Madagascar','2019-09-03',25,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e9a46541-ffdf-40d5-b70e-6f0a695dfd43','QX-383-0','343d3b27-ca94-47a8-aede-ad4c7b47ac99','habitation',595,'2025-01-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('54a23c93-791e-4b46-ae3a-3cf8ef7f53f1','POLX-383-0','343d3b27-ca94-47a8-aede-ad4c7b47ac99','e9a46541-ffdf-40d5-b70e-6f0a695dfd43','habitation','2025-01-28','2026-01-28',739,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7a81caff-81b5-44e7-9ebd-e7334c085f6d','QX-383-1','343d3b27-ca94-47a8-aede-ad4c7b47ac99','habitation',554,'2019-03-31');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('0ea5da22-3cb5-4001-b303-bfb38b02dd13','POLX-383-1','343d3b27-ca94-47a8-aede-ad4c7b47ac99','7a81caff-81b5-44e7-9ebd-e7334c085f6d','habitation','2019-03-31','2020-03-31',297,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a3831e3d-4dbc-486f-8891-9ec043ab6cf5','user384@demo.com',crypt('test123', gen_salt('bf')),'client','2025-06-06');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('a3831e3d-4dbc-486f-8891-9ec043ab6cf5','Fara','Razanam','Madagascar','2025-06-06',67,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('fdbb8a76-3769-4a25-87a0-8d3f5b78c135','QX-384-0','a3831e3d-4dbc-486f-8891-9ec043ab6cf5','habitation',664,'2025-03-15');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('fb6b7952-380d-403a-9fb8-3dc0859e9909','POLX-384-0','a3831e3d-4dbc-486f-8891-9ec043ab6cf5','fdbb8a76-3769-4a25-87a0-8d3f5b78c135','habitation','2025-03-15','2026-03-15',192,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('01a6fb65-a1f4-4b52-a95b-7297386fb7dd','user385@demo.com',crypt('test123', gen_salt('bf')),'client','2021-09-04');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('01a6fb65-a1f4-4b52-a95b-7297386fb7dd','Mialy','Razafindrakoto','Madagascar','2021-09-04',34,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3d5bdd41-f9da-43d0-bfce-66df617e944a','QX-385-0','01a6fb65-a1f4-4b52-a95b-7297386fb7dd','habitation',577,'2022-10-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e082bf5a-4998-4811-ba80-58f32505a93c','POLX-385-0','01a6fb65-a1f4-4b52-a95b-7297386fb7dd','3d5bdd41-f9da-43d0-bfce-66df617e944a','habitation','2022-10-10','2023-10-10',645,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('dbc9054a-a4b6-40a0-b654-9ac2b796994d','user386@demo.com',crypt('test123', gen_salt('bf')),'client','2022-04-15');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('dbc9054a-a4b6-40a0-b654-9ac2b796994d','Fara','Rasoanaivo','Madagascar','2022-04-15',90,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('5a1b9210-2311-45b7-8a1f-eb7f46c7b67c','QX-386-0','dbc9054a-a4b6-40a0-b654-9ac2b796994d','habitation',797,'2026-04-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('37655742-a8f6-4c8a-a638-8397ad37e16b','POLX-386-0','dbc9054a-a4b6-40a0-b654-9ac2b796994d','5a1b9210-2311-45b7-8a1f-eb7f46c7b67c','habitation','2026-04-01','2027-04-01',266,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('57600059-9a06-4b77-a3d9-10c831248450','user387@demo.com',crypt('test123', gen_salt('bf')),'client','2020-12-31');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('57600059-9a06-4b77-a3d9-10c831248450','Rina','Razanam','Madagascar','2020-12-31',25,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9751de97-44ff-48a7-b601-5e9b11d4a9e8','QX-387-0','57600059-9a06-4b77-a3d9-10c831248450','habitation',506,'2025-08-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f140e446-ae55-4cdc-a8b6-8d23605eba20','POLX-387-0','57600059-9a06-4b77-a3d9-10c831248450','9751de97-44ff-48a7-b601-5e9b11d4a9e8','habitation','2025-08-02','2026-08-02',371,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('615e15e1-3bc2-4086-96c1-e7cff92b805c','QX-387-1','57600059-9a06-4b77-a3d9-10c831248450','habitation',514,'2025-03-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('72e0aaee-5a02-4351-9618-ac760d3cbac5','POLX-387-1','57600059-9a06-4b77-a3d9-10c831248450','615e15e1-3bc2-4086-96c1-e7cff92b805c','habitation','2025-03-12','2026-03-12',141,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('5009bc83-b8af-483a-bb0e-1fd7d237455a','user388@demo.com',crypt('test123', gen_salt('bf')),'client','2022-07-09');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('5009bc83-b8af-483a-bb0e-1fd7d237455a','Nina','Razafindrakoto','Madagascar','2022-07-09',73,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('eca7645f-e3cd-4b42-b09a-30af5b679040','QX-388-0','5009bc83-b8af-483a-bb0e-1fd7d237455a','habitation',678,'2021-03-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('edbc4f97-aaa1-4123-b5aa-8b4b86bdd92f','POLX-388-0','5009bc83-b8af-483a-bb0e-1fd7d237455a','eca7645f-e3cd-4b42-b09a-30af5b679040','habitation','2021-03-17','2022-03-17',516,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('9db8f2c7-2e43-49e3-9572-dab1d09668d7','user389@demo.com',crypt('test123', gen_salt('bf')),'client','2020-02-04');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('9db8f2c7-2e43-49e3-9572-dab1d09668d7','Haja','Rakotondranaivo','Madagascar','2020-02-04',23,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a951fa91-2236-4d34-b019-537e33d03edc','QX-389-0','9db8f2c7-2e43-49e3-9572-dab1d09668d7','habitation',677,'2019-06-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('12b4c610-3064-4a04-b75e-61a803f0bf52','POLX-389-0','9db8f2c7-2e43-49e3-9572-dab1d09668d7','a951fa91-2236-4d34-b019-537e33d03edc','habitation','2019-06-23','2020-06-23',476,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('32836dda-b9c9-4810-b6df-07d3313a0b1e','QX-389-1','9db8f2c7-2e43-49e3-9572-dab1d09668d7','habitation',342,'2020-02-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('9e6088d8-a904-4a24-80ef-f58bdcf1859c','POLX-389-1','9db8f2c7-2e43-49e3-9572-dab1d09668d7','32836dda-b9c9-4810-b6df-07d3313a0b1e','habitation','2020-02-23','2021-02-23',338,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('0b588ecd-7d72-4892-a9d9-9b6638f2ecdf','user390@demo.com',crypt('test123', gen_salt('bf')),'client','2025-02-21');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('0b588ecd-7d72-4892-a9d9-9b6638f2ecdf','Nina','Rabe','Madagascar','2025-02-21',64,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9ed496f6-6dd4-49eb-a296-4c066a7383e9','QX-390-0','0b588ecd-7d72-4892-a9d9-9b6638f2ecdf','habitation',695,'2024-06-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('510e0eba-f781-4944-a0d5-ffbe5a9dcfe7','POLX-390-0','0b588ecd-7d72-4892-a9d9-9b6638f2ecdf','9ed496f6-6dd4-49eb-a296-4c066a7383e9','habitation','2024-06-23','2025-06-23',665,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('e29bde04-a3c6-40e5-9569-3d70efb0baf9','user391@demo.com',crypt('test123', gen_salt('bf')),'client','2019-06-15');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('e29bde04-a3c6-40e5-9569-3d70efb0baf9','Kevin','Rakotondranaivo','Madagascar','2019-06-15',23,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9f66b0c2-4d6e-4048-a3c6-200794d4d2e6','QX-391-0','e29bde04-a3c6-40e5-9569-3d70efb0baf9','habitation',722,'2025-04-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('d66bf99a-91e4-4d2e-af6d-d5c3b3be0185','POLX-391-0','e29bde04-a3c6-40e5-9569-3d70efb0baf9','9f66b0c2-4d6e-4048-a3c6-200794d4d2e6','habitation','2025-04-03','2026-04-03',174,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1bcbe2a4-e2c5-49dc-b5e2-0723c21bf321','QX-391-1','e29bde04-a3c6-40e5-9569-3d70efb0baf9','habitation',529,'2026-01-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('b3c6b710-9fab-4637-8bd7-170ae61771e1','POLX-391-1','e29bde04-a3c6-40e5-9569-3d70efb0baf9','1bcbe2a4-e2c5-49dc-b5e2-0723c21bf321','habitation','2026-01-04','2027-01-04',773,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('02ad3007-2b97-425f-a7aa-d04f697c94af','user392@demo.com',crypt('test123', gen_salt('bf')),'client','2024-01-03');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('02ad3007-2b97-425f-a7aa-d04f697c94af','Tony','Razafindrakoto','Madagascar','2024-01-03',67,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c5c63104-2a23-440d-8179-69e113ce923f','QX-392-0','02ad3007-2b97-425f-a7aa-d04f697c94af','habitation',295,'2024-03-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('a00c63a4-526a-4a57-8d26-7f1d1914f093','POLX-392-0','02ad3007-2b97-425f-a7aa-d04f697c94af','c5c63104-2a23-440d-8179-69e113ce923f','habitation','2024-03-28','2025-03-28',421,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('8e087a21-bf34-45e2-aadc-0225c45513cd','user393@demo.com',crypt('test123', gen_salt('bf')),'client','2024-09-13');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('8e087a21-bf34-45e2-aadc-0225c45513cd','Mialy','Razafindrakoto','Madagascar','2024-09-13',29,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('85786b52-3dae-49ff-8d11-7a774a5036cf','QX-393-0','8e087a21-bf34-45e2-aadc-0225c45513cd','habitation',127,'2022-12-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('18361d3d-c01f-4e9c-af2a-5e280f040a39','POLX-393-0','8e087a21-bf34-45e2-aadc-0225c45513cd','85786b52-3dae-49ff-8d11-7a774a5036cf','habitation','2022-12-10','2023-12-10',402,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('59e5cd03-e47f-42f3-b562-daf2389797ec','user394@demo.com',crypt('test123', gen_salt('bf')),'client','2026-01-20');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('59e5cd03-e47f-42f3-b562-daf2389797ec','Kevin','Razanam','Madagascar','2026-01-20',67,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b1f574b9-9ede-400d-bbc4-73b763e0028c','QX-394-0','59e5cd03-e47f-42f3-b562-daf2389797ec','habitation',406,'2023-01-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('65b489b5-4254-4a07-9171-3661920bf6bd','POLX-394-0','59e5cd03-e47f-42f3-b562-daf2389797ec','b1f574b9-9ede-400d-bbc4-73b763e0028c','habitation','2023-01-23','2024-01-23',706,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('213536a5-91fb-40d9-bb26-27bcd2758f9a','user395@demo.com',crypt('test123', gen_salt('bf')),'client','2024-02-29');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('213536a5-91fb-40d9-bb26-27bcd2758f9a','Elsa','Razafindrakoto','Madagascar','2024-02-29',34,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('88e5625c-a999-48b6-9865-0e4cab5dfec8','QX-395-0','213536a5-91fb-40d9-bb26-27bcd2758f9a','habitation',291,'2023-09-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('55129e30-5f22-4e21-a4eb-c9ddc481ef75','POLX-395-0','213536a5-91fb-40d9-bb26-27bcd2758f9a','88e5625c-a999-48b6-9865-0e4cab5dfec8','habitation','2023-09-02','2024-09-02',104,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('2d53906a-7245-4d5b-b193-7d8061786430','user396@demo.com',crypt('test123', gen_salt('bf')),'client','2023-06-08');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('2d53906a-7245-4d5b-b193-7d8061786430','Tony','Rabe','Madagascar','2023-06-08',53,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3af1f551-4760-46ae-853e-7423061b8f81','QX-396-0','2d53906a-7245-4d5b-b193-7d8061786430','habitation',472,'2026-02-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('abf143dd-ad36-4ea1-97bd-d0d80957f18c','POLX-396-0','2d53906a-7245-4d5b-b193-7d8061786430','3af1f551-4760-46ae-853e-7423061b8f81','habitation','2026-02-10','2027-02-10',531,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('aefed174-cce0-4cec-996d-07b49a43b5dd','QX-396-1','2d53906a-7245-4d5b-b193-7d8061786430','habitation',693,'2025-02-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('370880a7-bacd-4c3e-b954-88b262a526b2','POLX-396-1','2d53906a-7245-4d5b-b193-7d8061786430','aefed174-cce0-4cec-996d-07b49a43b5dd','habitation','2025-02-10','2026-02-10',599,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('512e7138-d6e0-4adf-9d2b-e2b033c7351a','user397@demo.com',crypt('test123', gen_salt('bf')),'client','2024-12-13');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('512e7138-d6e0-4adf-9d2b-e2b033c7351a','Sarah','Rafidy','Madagascar','2024-12-13',77,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0c9fd9b9-1aae-47d5-ab4b-e8f82a8cf10f','QX-397-0','512e7138-d6e0-4adf-9d2b-e2b033c7351a','habitation',376,'2023-12-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('22b5d59a-7b01-40ba-9bd0-73121b64b1e7','POLX-397-0','512e7138-d6e0-4adf-9d2b-e2b033c7351a','0c9fd9b9-1aae-47d5-ab4b-e8f82a8cf10f','habitation','2023-12-03','2024-12-03',679,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('28ed597e-b55f-47e9-818f-b20c2311df49','QX-397-1','512e7138-d6e0-4adf-9d2b-e2b033c7351a','habitation',485,'2019-12-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('81e1dfe1-dd6a-485e-a333-3ac9f1d37b93','POLX-397-1','512e7138-d6e0-4adf-9d2b-e2b033c7351a','28ed597e-b55f-47e9-818f-b20c2311df49','habitation','2019-12-19','2020-12-19',782,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('413422b9-421b-4ac7-acf6-96225b0bfe2e','user398@demo.com',crypt('test123', gen_salt('bf')),'client','2024-04-22');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('413422b9-421b-4ac7-acf6-96225b0bfe2e','Sarah','Rakoto','Madagascar','2024-04-22',51,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('71f45efd-d9d2-40ff-8c27-32b66eaeae76','QX-398-0','413422b9-421b-4ac7-acf6-96225b0bfe2e','habitation',590,'2023-12-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('3f5eb89c-ddf7-4a8d-bbfc-aef46236a97b','POLX-398-0','413422b9-421b-4ac7-acf6-96225b0bfe2e','71f45efd-d9d2-40ff-8c27-32b66eaeae76','habitation','2023-12-16','2024-12-16',346,20,'premium','annuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a82354b5-77cc-4146-9339-dbd36984c08e','QX-398-1','413422b9-421b-4ac7-acf6-96225b0bfe2e','habitation',146,'2026-03-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('7c01c188-b046-4297-8cf9-267b0977f5bb','POLX-398-1','413422b9-421b-4ac7-acf6-96225b0bfe2e','a82354b5-77cc-4146-9339-dbd36984c08e','habitation','2026-03-06','2027-03-06',793,20,'premium','annuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('0bb5bbf7-e82b-4678-ba27-38781398a434','user399@demo.com',crypt('test123', gen_salt('bf')),'client','2025-06-13');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level)
VALUES ('0bb5bbf7-e82b-4678-ba27-38781398a434','Tojo','Razanam','Madagascar','2025-06-13',22,'medium');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7a553abc-e623-45ae-8bec-a2685ca2b02a','QX-399-0','0bb5bbf7-e82b-4678-ba27-38781398a434','habitation',767,'2025-07-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5aeaaad4-01ab-4717-926c-c4460321e4ca','POLX-399-0','0bb5bbf7-e82b-4678-ba27-38781398a434','7a553abc-e623-45ae-8bec-a2685ca2b02a','habitation','2025-07-12','2026-07-12',676,20,'premium','annuel');
