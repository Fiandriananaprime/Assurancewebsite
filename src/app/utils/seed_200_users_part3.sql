CREATE EXTENSION IF NOT EXISTS pgcrypto;


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('62f239ed-96a1-4844-b561-89a3d93a9d61','user400@rich.com',crypt('test123', gen_salt('bf')),'client','2022-06-21');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('62f239ed-96a1-4844-b561-89a3d93a9d61','Mamy','Ravelona','Antananarivo','2022-06-21',79,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('6b90f990-c1cd-4671-a34f-255f68b69cdf','QZ-400-0','62f239ed-96a1-4844-b561-89a3d93a9d61','moto',247,'2024-11-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('4dd06cf4-9a7d-4c68-ac91-610b91556ec4','POLZ-400-0','62f239ed-96a1-4844-b561-89a3d93a9d61','6b90f990-c1cd-4671-a34f-255f68b69cdf','moto','2024-11-08','2025-11-08',456,0,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('224bc87c-7fe8-44e6-ab33-5c8a7ac5a0b4','INCZ-400-0-0','4dd06cf4-9a7d-4c68-ac91-610b91556ec4','62f239ed-96a1-4844-b561-89a3d93a9d61','Incident','Déclaration de sinistre','2019-08-16','moto','moyen','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('7792ddfa-4d9f-4d3a-95a3-4dcd4178c8c8','user401@rich.com',crypt('test123', gen_salt('bf')),'client','2023-07-26');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('7792ddfa-4d9f-4d3a-95a3-4dcd4178c8c8','Miora','Andriamanitra','Antananarivo','2023-07-26',55,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7f5a7bc2-e39e-4ef1-b9b3-1df6fb30c564','QZ-401-0','7792ddfa-4d9f-4d3a-95a3-4dcd4178c8c8','moto',777,'2023-08-31');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('49ba9f3e-380f-4e61-8229-0132fa9fa901','POLZ-401-0','7792ddfa-4d9f-4d3a-95a3-4dcd4178c8c8','7f5a7bc2-e39e-4ef1-b9b3-1df6fb30c564','moto','2023-08-31','2024-08-31',800,17,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('a91d1788-fb3b-4511-868d-5338684d9af0','INCZ-401-0-0','49ba9f3e-380f-4e61-8229-0132fa9fa901','7792ddfa-4d9f-4d3a-95a3-4dcd4178c8c8','Incident','Déclaration de sinistre','2018-06-15','moto','leger','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ed9316ee-fa92-43e9-80fb-a9b1e033ac81','QZ-401-1','7792ddfa-4d9f-4d3a-95a3-4dcd4178c8c8','auto',501,'2023-09-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('b0b5a915-2093-484a-ac64-e22f8ee1401b','POLZ-401-1','7792ddfa-4d9f-4d3a-95a3-4dcd4178c8c8','ed9316ee-fa92-43e9-80fb-a9b1e033ac81','auto','2023-09-03','2024-09-03',404,42,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('2ef350c1-af12-448e-a143-5dfe13bc1f77','INCZ-401-1-0','b0b5a915-2093-484a-ac64-e22f8ee1401b','7792ddfa-4d9f-4d3a-95a3-4dcd4178c8c8','Incident','Déclaration de sinistre','2023-11-18','auto','moyen','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('c8a57979-6a19-48e5-96d0-af0b889b6f22','INCZ-401-1-1','b0b5a915-2093-484a-ac64-e22f8ee1401b','7792ddfa-4d9f-4d3a-95a3-4dcd4178c8c8','Incident','Déclaration de sinistre','2022-05-26','auto','eleve','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('8aa02d86-57ef-4103-8043-42b7072dd11c','user402@rich.com',crypt('test123', gen_salt('bf')),'client','2020-02-18');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('8aa02d86-57ef-4103-8043-42b7072dd11c','Tahina','Rakotomalala','Antananarivo','2020-02-18',83,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8793497d-0c21-40bb-ab25-1f4db0b5c0ff','QZ-402-0','8aa02d86-57ef-4103-8043-42b7072dd11c','sante',425,'2019-07-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5a8e2e80-21a2-4561-bd95-4429597b167f','POLZ-402-0','8aa02d86-57ef-4103-8043-42b7072dd11c','8793497d-0c21-40bb-ab25-1f4db0b5c0ff','sante','2019-07-06','2020-07-06',865,44,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('3c116831-2a89-4df9-b08b-11375cfa4d19','INCZ-402-0-0','5a8e2e80-21a2-4561-bd95-4429597b167f','8aa02d86-57ef-4103-8043-42b7072dd11c','Incident','Déclaration de sinistre','2024-12-06','sante','leger','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3072f42a-7356-4934-9d89-cd4891d821bf','QZ-402-1','8aa02d86-57ef-4103-8043-42b7072dd11c','auto',120,'2019-12-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('b8eeda6a-dbb0-40b4-92dd-282118c1cf95','POLZ-402-1','8aa02d86-57ef-4103-8043-42b7072dd11c','3072f42a-7356-4934-9d89-cd4891d821bf','auto','2019-12-07','2020-12-07',347,30,'medium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('016c0036-2b4d-46d9-99d2-62db23cd9f63','QZ-402-2','8aa02d86-57ef-4103-8043-42b7072dd11c','auto',904,'2018-07-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('9a9892bb-124f-4077-bf2f-52e74ca5bde5','POLZ-402-2','8aa02d86-57ef-4103-8043-42b7072dd11c','016c0036-2b4d-46d9-99d2-62db23cd9f63','auto','2018-07-07','2019-07-07',511,6,'premium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('9c53aac0-74c7-4e7e-b657-e67cc32967d0','user403@rich.com',crypt('test123', gen_salt('bf')),'client','2020-10-31');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('9c53aac0-74c7-4e7e-b657-e67cc32967d0','Zo','Rasoan','Antananarivo','2020-10-31',85,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('4afe865f-b369-4d58-8b64-f56c8b62b668','QZ-403-0','9c53aac0-74c7-4e7e-b657-e67cc32967d0','auto',287,'2019-05-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('554c0465-5312-4b0e-9524-c6eec9e35e6b','POLZ-403-0','9c53aac0-74c7-4e7e-b657-e67cc32967d0','4afe865f-b369-4d58-8b64-f56c8b62b668','auto','2019-05-10','2020-05-10',409,46,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('8c0fc050-6e8e-4e6d-b371-813de87fc590','INCZ-403-0-0','554c0465-5312-4b0e-9524-c6eec9e35e6b','9c53aac0-74c7-4e7e-b657-e67cc32967d0','Incident','Déclaration de sinistre','2023-09-09','auto','moyen','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('e91dd518-96ee-49f8-910d-d65249cb8315','INCZ-403-0-1','554c0465-5312-4b0e-9524-c6eec9e35e6b','9c53aac0-74c7-4e7e-b657-e67cc32967d0','Incident','Déclaration de sinistre','2018-08-15','auto','leger','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('816eee08-0355-4000-95ac-c7812c92ed39','QZ-403-1','9c53aac0-74c7-4e7e-b657-e67cc32967d0','moto',450,'2019-01-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('dbcb3569-bbb5-47b9-8de9-c3c7662160a3','POLZ-403-1','9c53aac0-74c7-4e7e-b657-e67cc32967d0','816eee08-0355-4000-95ac-c7812c92ed39','moto','2019-01-05','2020-01-05',964,19,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('1d0675df-9b2c-4d5b-8d0f-fc6b521b641b','INCZ-403-1-0','dbcb3569-bbb5-47b9-8de9-c3c7662160a3','9c53aac0-74c7-4e7e-b657-e67cc32967d0','Incident','Déclaration de sinistre','2018-07-07','moto','eleve','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('b80cd284-899e-4b1d-9738-08cec4789035','INCZ-403-1-1','dbcb3569-bbb5-47b9-8de9-c3c7662160a3','9c53aac0-74c7-4e7e-b657-e67cc32967d0','Incident','Déclaration de sinistre','2018-10-19','moto','leger','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c210b1e6-67c6-415e-9627-a4627e5d4bb2','QZ-403-2','9c53aac0-74c7-4e7e-b657-e67cc32967d0','sante',707,'2021-12-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('27629e00-8b05-4c2f-88b3-b12e7de62c8d','POLZ-403-2','9c53aac0-74c7-4e7e-b657-e67cc32967d0','c210b1e6-67c6-415e-9627-a4627e5d4bb2','sante','2021-12-02','2022-12-02',193,43,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('46d98f8c-1def-4854-83e6-1ab98c552335','INCZ-403-2-0','27629e00-8b05-4c2f-88b3-b12e7de62c8d','9c53aac0-74c7-4e7e-b657-e67cc32967d0','Incident','Déclaration de sinistre','2022-08-13','sante','eleve','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('0c3b616a-f508-4cbb-b6f6-c51f02b8ca31','user404@rich.com',crypt('test123', gen_salt('bf')),'client','2022-03-12');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('0c3b616a-f508-4cbb-b6f6-c51f02b8ca31','Clara','Rajaona','Antananarivo','2022-03-12',69,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f4bffa60-600a-4440-a862-e57ae85ef4ec','QZ-404-0','0c3b616a-f508-4cbb-b6f6-c51f02b8ca31','auto',858,'2019-03-18');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('93de1116-c550-4072-ba16-b426af8bf1e3','POLZ-404-0','0c3b616a-f508-4cbb-b6f6-c51f02b8ca31','f4bffa60-600a-4440-a862-e57ae85ef4ec','auto','2019-03-18','2020-03-18',96,48,'medium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('701fffc0-aae1-4959-b97a-4cd0cbef3af3','QZ-404-1','0c3b616a-f508-4cbb-b6f6-c51f02b8ca31','moto',414,'2019-09-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e351cbc0-45b7-4dce-b8b2-c3e1f0553ba7','POLZ-404-1','0c3b616a-f508-4cbb-b6f6-c51f02b8ca31','701fffc0-aae1-4959-b97a-4cd0cbef3af3','moto','2019-09-07','2020-09-07',298,12,'medium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('953ed312-184e-454b-9bdc-1f195094c175','QZ-404-2','0c3b616a-f508-4cbb-b6f6-c51f02b8ca31','sante',974,'2020-01-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('c9341c82-79ef-40db-a6e3-9e716fdc57ab','POLZ-404-2','0c3b616a-f508-4cbb-b6f6-c51f02b8ca31','953ed312-184e-454b-9bdc-1f195094c175','sante','2020-01-19','2021-01-19',818,26,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('aaf1566d-7981-40da-9997-5cb2ad11864a','INCZ-404-2-0','c9341c82-79ef-40db-a6e3-9e716fdc57ab','0c3b616a-f508-4cbb-b6f6-c51f02b8ca31','Incident','Déclaration de sinistre','2019-10-01','sante','leger','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('b54a4248-a6f9-43c7-901c-693e42acb473','user405@rich.com',crypt('test123', gen_salt('bf')),'client','2018-05-22');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('b54a4248-a6f9-43c7-901c-693e42acb473','Alex','Andriamanitra','Antananarivo','2018-05-22',74,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('90120aa3-f749-4166-82c5-4fb21b30425b','QZ-405-0','b54a4248-a6f9-43c7-901c-693e42acb473','moto',188,'2018-09-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('446e4ee8-e0cf-4ed0-8264-ce5b87f2eb4f','POLZ-405-0','b54a4248-a6f9-43c7-901c-693e42acb473','90120aa3-f749-4166-82c5-4fb21b30425b','moto','2018-09-24','2019-09-24',851,50,'medium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('be9bc6a7-b6f1-4fc8-a3de-2d9e459c2f43','QZ-405-1','b54a4248-a6f9-43c7-901c-693e42acb473','sante',104,'2025-09-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('1ce8d60a-a3e7-4d11-b175-554fb5f75e02','POLZ-405-1','b54a4248-a6f9-43c7-901c-693e42acb473','be9bc6a7-b6f1-4fc8-a3de-2d9e459c2f43','sante','2025-09-02','2026-09-02',545,50,'premium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e0f524f6-01a7-4537-9806-f325ee7ab660','QZ-405-2','b54a4248-a6f9-43c7-901c-693e42acb473','sante',782,'2021-09-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('62b58e35-c43b-4eff-8f37-0f16120db775','POLZ-405-2','b54a4248-a6f9-43c7-901c-693e42acb473','e0f524f6-01a7-4537-9806-f325ee7ab660','sante','2021-09-06','2022-09-06',375,48,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('3075ca02-42c1-4d4b-879b-8001aee01341','INCZ-405-2-0','62b58e35-c43b-4eff-8f37-0f16120db775','b54a4248-a6f9-43c7-901c-693e42acb473','Incident','Déclaration de sinistre','2024-09-13','sante','leger','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('caf44b7c-b594-4231-9316-6c7326966484','user406@rich.com',crypt('test123', gen_salt('bf')),'client','2021-01-11');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('caf44b7c-b594-4231-9316-6c7326966484','Tovo','Rakotonirina','Antananarivo','2021-01-11',88,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('89bc20c8-5d5a-4181-9a9e-099be71e5598','QZ-406-0','caf44b7c-b594-4231-9316-6c7326966484','sante',590,'2019-10-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e501f8e2-34b0-41d3-9dc7-08f266a0be37','POLZ-406-0','caf44b7c-b594-4231-9316-6c7326966484','89bc20c8-5d5a-4181-9a9e-099be71e5598','sante','2019-10-20','2020-10-20',385,9,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('3b1e11ff-7384-42f6-a830-798a5ae0a61a','INCZ-406-0-0','e501f8e2-34b0-41d3-9dc7-08f266a0be37','caf44b7c-b594-4231-9316-6c7326966484','Incident','Déclaration de sinistre','2022-04-14','sante','leger','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('b13f8b23-0a69-4e58-99fc-9c57e335ab59','INCZ-406-0-1','e501f8e2-34b0-41d3-9dc7-08f266a0be37','caf44b7c-b594-4231-9316-6c7326966484','Incident','Déclaration de sinistre','2025-02-15','sante','moyen','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c942c649-eca0-4f19-8144-19909ddf5cf0','QZ-406-1','caf44b7c-b594-4231-9316-6c7326966484','sante',119,'2019-11-29');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('44a2f19d-0601-4ff1-abfb-91cb113b06ea','POLZ-406-1','caf44b7c-b594-4231-9316-6c7326966484','c942c649-eca0-4f19-8144-19909ddf5cf0','sante','2019-11-29','2020-11-29',664,48,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('80eb25cb-89ca-4eff-993e-a7906aefb513','INCZ-406-1-0','44a2f19d-0601-4ff1-abfb-91cb113b06ea','caf44b7c-b594-4231-9316-6c7326966484','Incident','Déclaration de sinistre','2018-08-17','sante','moyen','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('6066693e-11a5-42f5-9df3-768615b17560','INCZ-406-1-1','44a2f19d-0601-4ff1-abfb-91cb113b06ea','caf44b7c-b594-4231-9316-6c7326966484','Incident','Déclaration de sinistre','2025-07-20','sante','eleve','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2d6a9a41-b6b7-41f6-9a33-9728f2951ddd','QZ-406-2','caf44b7c-b594-4231-9316-6c7326966484','sante',739,'2023-06-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('b3e232e3-c7e9-4803-ab7d-27ff1678afc1','POLZ-406-2','caf44b7c-b594-4231-9316-6c7326966484','2d6a9a41-b6b7-41f6-9a33-9728f2951ddd','sante','2023-06-19','2024-06-19',285,29,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('59cc7a6b-e6cc-48ca-bd19-ee5f8af9079c','INCZ-406-2-0','b3e232e3-c7e9-4803-ab7d-27ff1678afc1','caf44b7c-b594-4231-9316-6c7326966484','Incident','Déclaration de sinistre','2018-01-13','sante','moyen','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('366a1703-4e2d-475a-a1b9-3e9c2352d9ec','INCZ-406-2-1','b3e232e3-c7e9-4803-ab7d-27ff1678afc1','caf44b7c-b594-4231-9316-6c7326966484','Incident','Déclaration de sinistre','2023-03-31','sante','eleve','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('6cac7fc7-0d44-4114-b74c-31228acb3691','user407@rich.com',crypt('test123', gen_salt('bf')),'client','2022-02-19');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('6cac7fc7-0d44-4114-b74c-31228acb3691','Alex','Randriamanana','Antananarivo','2022-02-19',29,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d5c1dfa2-8ee5-4c23-9552-9b181850126b','QZ-407-0','6cac7fc7-0d44-4114-b74c-31228acb3691','auto',214,'2019-03-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('cff290ec-5102-4a1d-84b7-3635fe5da69d','POLZ-407-0','6cac7fc7-0d44-4114-b74c-31228acb3691','d5c1dfa2-8ee5-4c23-9552-9b181850126b','auto','2019-03-23','2020-03-23',72,43,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('cf554ad2-e1bf-4fb4-a723-bfac5bda565d','INCZ-407-0-0','cff290ec-5102-4a1d-84b7-3635fe5da69d','6cac7fc7-0d44-4114-b74c-31228acb3691','Incident','Déclaration de sinistre','2019-06-11','auto','eleve','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('f75e4621-038d-412a-ba67-c9ec5bfcda44','INCZ-407-0-1','cff290ec-5102-4a1d-84b7-3635fe5da69d','6cac7fc7-0d44-4114-b74c-31228acb3691','Incident','Déclaration de sinistre','2024-06-15','auto','leger','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('e6a1a5f9-9010-4542-aaa9-5a7488413a56','user408@rich.com',crypt('test123', gen_salt('bf')),'client','2020-05-24');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('e6a1a5f9-9010-4542-aaa9-5a7488413a56','Tovo','Rasoan','Antananarivo','2020-05-24',59,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('4a2ba373-0e33-4206-b515-9431e1626387','QZ-408-0','e6a1a5f9-9010-4542-aaa9-5a7488413a56','auto',344,'2019-11-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('05c53ea8-b4fd-40df-8f16-c5564c18f199','POLZ-408-0','e6a1a5f9-9010-4542-aaa9-5a7488413a56','4a2ba373-0e33-4206-b515-9431e1626387','auto','2019-11-27','2020-11-27',586,38,'premium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a7bd5775-1e93-47ab-b9e7-51c89b97bc93','QZ-408-1','e6a1a5f9-9010-4542-aaa9-5a7488413a56','moto',877,'2024-01-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('32e3c9e4-dadd-413a-a630-1b5d7f7f1e4c','POLZ-408-1','e6a1a5f9-9010-4542-aaa9-5a7488413a56','a7bd5775-1e93-47ab-b9e7-51c89b97bc93','moto','2024-01-25','2025-01-25',79,47,'medium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f93e81a0-99da-4a33-ad72-9305b3dbe560','QZ-408-2','e6a1a5f9-9010-4542-aaa9-5a7488413a56','moto',885,'2021-09-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('3beb51c5-4ae8-45c2-be25-60c69ed8fe94','POLZ-408-2','e6a1a5f9-9010-4542-aaa9-5a7488413a56','f93e81a0-99da-4a33-ad72-9305b3dbe560','moto','2021-09-27','2022-09-27',437,14,'basic','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('8e10d7e3-d74a-47d4-9b0a-10294c7ae5a8','user409@rich.com',crypt('test123', gen_salt('bf')),'client','2023-08-04');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('8e10d7e3-d74a-47d4-9b0a-10294c7ae5a8','Tovo','Rajaona','Antananarivo','2023-08-04',53,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0c01aed6-625e-4b68-804e-56c3b6ad096d','QZ-409-0','8e10d7e3-d74a-47d4-9b0a-10294c7ae5a8','moto',581,'2024-06-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('b73f15cb-1062-4aa6-a30a-ead14eff6d1c','POLZ-409-0','8e10d7e3-d74a-47d4-9b0a-10294c7ae5a8','0c01aed6-625e-4b68-804e-56c3b6ad096d','moto','2024-06-26','2025-06-26',908,29,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('3890e42f-2c5c-4e23-9083-080381d68152','INCZ-409-0-0','b73f15cb-1062-4aa6-a30a-ead14eff6d1c','8e10d7e3-d74a-47d4-9b0a-10294c7ae5a8','Incident','Déclaration de sinistre','2025-01-30','moto','eleve','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c3e9edb0-45da-4c06-820c-6947cbbd089d','QZ-409-1','8e10d7e3-d74a-47d4-9b0a-10294c7ae5a8','auto',680,'2020-03-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('03c72212-6dda-4888-bc66-a8adfe9b9786','POLZ-409-1','8e10d7e3-d74a-47d4-9b0a-10294c7ae5a8','c3e9edb0-45da-4c06-820c-6947cbbd089d','auto','2020-03-27','2021-03-27',756,22,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('08cad35c-4396-4e3f-a0b3-139b14045451','INCZ-409-1-0','03c72212-6dda-4888-bc66-a8adfe9b9786','8e10d7e3-d74a-47d4-9b0a-10294c7ae5a8','Incident','Déclaration de sinistre','2025-05-06','auto','leger','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('7a0d76e6-1ae2-4777-998b-69c8b787041f','user410@rich.com',crypt('test123', gen_salt('bf')),'client','2020-04-08');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('7a0d76e6-1ae2-4777-998b-69c8b787041f','Nantenaina','Randriamanana','Antananarivo','2020-04-08',58,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2536633b-41fa-4141-ab37-4fdb7c789591','QZ-410-0','7a0d76e6-1ae2-4777-998b-69c8b787041f','moto',997,'2025-01-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('165a32ad-9b36-49bb-bbea-3b619c1567ce','POLZ-410-0','7a0d76e6-1ae2-4777-998b-69c8b787041f','2536633b-41fa-4141-ab37-4fdb7c789591','moto','2025-01-25','2026-01-25',913,23,'basic','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('4a849d64-7b53-434f-b83f-46ad5af82417','user411@rich.com',crypt('test123', gen_salt('bf')),'client','2025-01-30');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('4a849d64-7b53-434f-b83f-46ad5af82417','Alex','Razaka','Antananarivo','2025-01-30',70,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('68d6ffd9-a919-421a-887a-822c7c0498c1','QZ-411-0','4a849d64-7b53-434f-b83f-46ad5af82417','auto',389,'2020-08-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('8f77c86d-9eb5-42e6-bda2-12a4de280311','POLZ-411-0','4a849d64-7b53-434f-b83f-46ad5af82417','68d6ffd9-a919-421a-887a-822c7c0498c1','auto','2020-08-20','2021-08-20',679,32,'premium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('094da7e7-376c-4b17-a9cb-e3666e5ab184','QZ-411-1','4a849d64-7b53-434f-b83f-46ad5af82417','moto',918,'2019-09-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('28a37dbb-d403-4524-8daf-bb089a6f6848','POLZ-411-1','4a849d64-7b53-434f-b83f-46ad5af82417','094da7e7-376c-4b17-a9cb-e3666e5ab184','moto','2019-09-27','2020-09-27',278,41,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('2e6e656d-2806-460f-8096-b7d6737971b6','INCZ-411-1-0','28a37dbb-d403-4524-8daf-bb089a6f6848','4a849d64-7b53-434f-b83f-46ad5af82417','Incident','Déclaration de sinistre','2022-11-20','moto','leger','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('b88fecea-0fa9-4606-9977-c2eef5954e05','INCZ-411-1-1','28a37dbb-d403-4524-8daf-bb089a6f6848','4a849d64-7b53-434f-b83f-46ad5af82417','Incident','Déclaration de sinistre','2026-02-24','moto','eleve','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1c4e955c-ad05-4e90-a6e0-aec8c7ed43ee','QZ-411-2','4a849d64-7b53-434f-b83f-46ad5af82417','sante',967,'2020-04-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('7d8237d4-e0a3-4e1b-901a-cd967ccc342e','POLZ-411-2','4a849d64-7b53-434f-b83f-46ad5af82417','1c4e955c-ad05-4e90-a6e0-aec8c7ed43ee','sante','2020-04-14','2021-04-14',726,36,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('57fe65db-bb8c-4d17-b44e-9791fc5dd0db','INCZ-411-2-0','7d8237d4-e0a3-4e1b-901a-cd967ccc342e','4a849d64-7b53-434f-b83f-46ad5af82417','Incident','Déclaration de sinistre','2025-07-14','sante','leger','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('1bfe44b7-da52-48cb-aa1d-b0cf41bdafcd','INCZ-411-2-1','7d8237d4-e0a3-4e1b-901a-cd967ccc342e','4a849d64-7b53-434f-b83f-46ad5af82417','Incident','Déclaration de sinistre','2020-11-29','sante','moyen','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('f10ebb87-0ad1-44c3-8c4d-1b428e47ce7e','user412@rich.com',crypt('test123', gen_salt('bf')),'client','2020-05-16');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('f10ebb87-0ad1-44c3-8c4d-1b428e47ce7e','Miora','Rakotonirina','Antananarivo','2020-05-16',28,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('576c4513-cb0b-4636-b16b-d6bb21ad038b','QZ-412-0','f10ebb87-0ad1-44c3-8c4d-1b428e47ce7e','sante',970,'2018-03-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('206f6b7e-a9f5-4510-9e71-8636dff83fea','POLZ-412-0','f10ebb87-0ad1-44c3-8c4d-1b428e47ce7e','576c4513-cb0b-4636-b16b-d6bb21ad038b','sante','2018-03-09','2019-03-09',72,7,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('babc6bbf-5a25-4a58-ae87-8af1b6364ce0','INCZ-412-0-0','206f6b7e-a9f5-4510-9e71-8636dff83fea','f10ebb87-0ad1-44c3-8c4d-1b428e47ce7e','Incident','Déclaration de sinistre','2023-01-30','sante','leger','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('1102c448-e36a-444b-899f-7247b6c864c1','INCZ-412-0-1','206f6b7e-a9f5-4510-9e71-8636dff83fea','f10ebb87-0ad1-44c3-8c4d-1b428e47ce7e','Incident','Déclaration de sinistre','2018-02-26','sante','moyen','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('19f124a9-43e9-4f34-b2ec-87ec0545ff8f','QZ-412-1','f10ebb87-0ad1-44c3-8c4d-1b428e47ce7e','auto',320,'2019-08-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('1b695e7b-328d-44ef-b2fd-e53130a1ad2c','POLZ-412-1','f10ebb87-0ad1-44c3-8c4d-1b428e47ce7e','19f124a9-43e9-4f34-b2ec-87ec0545ff8f','auto','2019-08-09','2020-08-09',320,42,'medium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('dd9cdbb9-dc83-426e-9f1c-678a3eebc310','QZ-412-2','f10ebb87-0ad1-44c3-8c4d-1b428e47ce7e','moto',282,'2023-10-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('6bd3dc23-56f4-4b3d-aa20-0b385129d301','POLZ-412-2','f10ebb87-0ad1-44c3-8c4d-1b428e47ce7e','dd9cdbb9-dc83-426e-9f1c-678a3eebc310','moto','2023-10-13','2024-10-13',140,38,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('cfe4fc00-87c3-4254-80bf-d1cced2076ac','INCZ-412-2-0','6bd3dc23-56f4-4b3d-aa20-0b385129d301','f10ebb87-0ad1-44c3-8c4d-1b428e47ce7e','Incident','Déclaration de sinistre','2023-10-05','moto','leger','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('60e567e3-9e51-41cd-8475-5bd5373021a8','user413@rich.com',crypt('test123', gen_salt('bf')),'client','2021-05-18');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('60e567e3-9e51-41cd-8475-5bd5373021a8','Tovo','Rasoan','Antananarivo','2021-05-18',89,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9c1e28b0-7e8c-4293-b5db-b6f975e914b7','QZ-413-0','60e567e3-9e51-41cd-8475-5bd5373021a8','auto',968,'2020-05-31');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('1c2adf21-2d3d-4036-ae6c-ccc9bcd1690e','POLZ-413-0','60e567e3-9e51-41cd-8475-5bd5373021a8','9c1e28b0-7e8c-4293-b5db-b6f975e914b7','auto','2020-05-31','2021-05-31',738,33,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('c0e397b6-4131-4ba5-a9d5-f7079a9e6fc6','INCZ-413-0-0','1c2adf21-2d3d-4036-ae6c-ccc9bcd1690e','60e567e3-9e51-41cd-8475-5bd5373021a8','Incident','Déclaration de sinistre','2023-07-06','auto','eleve','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('93309ca0-831e-487b-9ccb-6bab9278ffe3','INCZ-413-0-1','1c2adf21-2d3d-4036-ae6c-ccc9bcd1690e','60e567e3-9e51-41cd-8475-5bd5373021a8','Incident','Déclaration de sinistre','2023-11-18','auto','leger','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f8a5d5c7-39b9-4b29-b807-c070be70b5ad','QZ-413-1','60e567e3-9e51-41cd-8475-5bd5373021a8','moto',743,'2021-05-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('76c7c3e1-9110-46b4-91dd-aef4862a432c','POLZ-413-1','60e567e3-9e51-41cd-8475-5bd5373021a8','f8a5d5c7-39b9-4b29-b807-c070be70b5ad','moto','2021-05-04','2022-05-04',735,13,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('930ffa58-f1a5-4611-ad16-ae82e85d7036','INCZ-413-1-0','76c7c3e1-9110-46b4-91dd-aef4862a432c','60e567e3-9e51-41cd-8475-5bd5373021a8','Incident','Déclaration de sinistre','2022-06-07','moto','eleve','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d08fbbf6-783f-4496-939f-6e3033d43b97','QZ-413-2','60e567e3-9e51-41cd-8475-5bd5373021a8','sante',552,'2023-04-29');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('7092edb9-431d-4558-8b26-8d37600b8943','POLZ-413-2','60e567e3-9e51-41cd-8475-5bd5373021a8','d08fbbf6-783f-4496-939f-6e3033d43b97','sante','2023-04-29','2024-04-29',493,47,'premium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('23c5afd6-da0a-4f79-b5ad-b246ef2ca992','user414@rich.com',crypt('test123', gen_salt('bf')),'client','2020-06-09');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('23c5afd6-da0a-4f79-b5ad-b246ef2ca992','Hery','Ravelona','Antananarivo','2020-06-09',81,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('49b69b66-5435-4649-ab28-38e1c11dd240','QZ-414-0','23c5afd6-da0a-4f79-b5ad-b246ef2ca992','moto',580,'2021-10-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('407c90c2-5610-4e87-b503-30aafe9617c3','POLZ-414-0','23c5afd6-da0a-4f79-b5ad-b246ef2ca992','49b69b66-5435-4649-ab28-38e1c11dd240','moto','2021-10-13','2022-10-13',233,16,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('b218021d-c1c8-4fa2-92db-7bad0b1234db','INCZ-414-0-0','407c90c2-5610-4e87-b503-30aafe9617c3','23c5afd6-da0a-4f79-b5ad-b246ef2ca992','Incident','Déclaration de sinistre','2018-09-12','moto','eleve','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('05fe3de5-9ff2-47d3-8873-e66c6972cb64','QZ-414-1','23c5afd6-da0a-4f79-b5ad-b246ef2ca992','moto',856,'2018-11-18');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('ab24718a-61d3-49f5-afb2-57d092fc7e21','POLZ-414-1','23c5afd6-da0a-4f79-b5ad-b246ef2ca992','05fe3de5-9ff2-47d3-8873-e66c6972cb64','moto','2018-11-18','2019-11-18',349,17,'medium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b86e9f7a-d480-4c0a-872a-71c3e12c51e7','QZ-414-2','23c5afd6-da0a-4f79-b5ad-b246ef2ca992','auto',992,'2018-01-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('dabbc9ed-af3f-43ef-9041-dc727ca03b06','POLZ-414-2','23c5afd6-da0a-4f79-b5ad-b246ef2ca992','b86e9f7a-d480-4c0a-872a-71c3e12c51e7','auto','2018-01-26','2019-01-26',154,38,'premium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a27ddd88-f339-4f87-bcad-897652ef7e32','user415@rich.com',crypt('test123', gen_salt('bf')),'client','2024-06-20');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('a27ddd88-f339-4f87-bcad-897652ef7e32','Nantenaina','Andriamanitra','Antananarivo','2024-06-20',12,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('17a67095-748f-4939-b233-01724c1e1ca0','QZ-415-0','a27ddd88-f339-4f87-bcad-897652ef7e32','auto',736,'2025-11-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('104f2112-86f6-47d1-973a-ba2b0d3b8bee','POLZ-415-0','a27ddd88-f339-4f87-bcad-897652ef7e32','17a67095-748f-4939-b233-01724c1e1ca0','auto','2025-11-02','2026-11-02',89,16,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('dd140f49-942c-4965-802e-5f6143dae51f','INCZ-415-0-0','104f2112-86f6-47d1-973a-ba2b0d3b8bee','a27ddd88-f339-4f87-bcad-897652ef7e32','Incident','Déclaration de sinistre','2019-06-06','auto','moyen','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('e835b8be-2186-43b5-8645-4d997256f6f6','user416@rich.com',crypt('test123', gen_salt('bf')),'client','2019-04-23');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('e835b8be-2186-43b5-8645-4d997256f6f6','Tahina','Ravelona','Antananarivo','2019-04-23',54,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('de7a0ded-b03d-4acd-b553-570422f5fdf9','QZ-416-0','e835b8be-2186-43b5-8645-4d997256f6f6','moto',368,'2023-07-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5d3a7fd5-b8f0-4374-804c-14e61c363302','POLZ-416-0','e835b8be-2186-43b5-8645-4d997256f6f6','de7a0ded-b03d-4acd-b553-570422f5fdf9','moto','2023-07-23','2024-07-23',415,41,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('23047793-83dd-4fba-b45e-fc1b945566a6','INCZ-416-0-0','5d3a7fd5-b8f0-4374-804c-14e61c363302','e835b8be-2186-43b5-8645-4d997256f6f6','Incident','Déclaration de sinistre','2020-12-01','moto','moyen','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('35ebc1cd-43bd-4d5d-a93c-11f097196c95','QZ-416-1','e835b8be-2186-43b5-8645-4d997256f6f6','auto',778,'2019-06-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('2dcf6080-b4cc-4679-8abc-ccc907b1761e','POLZ-416-1','e835b8be-2186-43b5-8645-4d997256f6f6','35ebc1cd-43bd-4d5d-a93c-11f097196c95','auto','2019-06-02','2020-06-02',149,25,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('7fae3826-1aa1-4afd-8733-a4357c492eaf','INCZ-416-1-0','2dcf6080-b4cc-4679-8abc-ccc907b1761e','e835b8be-2186-43b5-8645-4d997256f6f6','Incident','Déclaration de sinistre','2021-03-06','auto','moyen','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('ced99ed3-fae6-461b-b277-736acd8ae1ae','INCZ-416-1-1','2dcf6080-b4cc-4679-8abc-ccc907b1761e','e835b8be-2186-43b5-8645-4d997256f6f6','Incident','Déclaration de sinistre','2020-03-18','auto','eleve','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ab9e4d20-778e-49a9-b551-53a22d45711d','QZ-416-2','e835b8be-2186-43b5-8645-4d997256f6f6','auto',676,'2023-03-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('3eb2c68f-b016-466b-80dc-7cd8465ed580','POLZ-416-2','e835b8be-2186-43b5-8645-4d997256f6f6','ab9e4d20-778e-49a9-b551-53a22d45711d','auto','2023-03-06','2024-03-06',910,18,'basic','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('c6bf2551-5bf6-46dd-ad98-e1c1e3603818','user417@rich.com',crypt('test123', gen_salt('bf')),'client','2022-10-27');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('c6bf2551-5bf6-46dd-ad98-e1c1e3603818','Bryan','Randriamanana','Antananarivo','2022-10-27',58,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b30f9f39-f205-4ab0-a221-c79dc70d6059','QZ-417-0','c6bf2551-5bf6-46dd-ad98-e1c1e3603818','moto',368,'2025-05-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('09984b88-8471-42cb-9a75-1a7f09b64e28','POLZ-417-0','c6bf2551-5bf6-46dd-ad98-e1c1e3603818','b30f9f39-f205-4ab0-a221-c79dc70d6059','moto','2025-05-23','2026-05-23',358,39,'basic','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('178807c2-c3e1-4340-b0fe-9a510999a241','QZ-417-1','c6bf2551-5bf6-46dd-ad98-e1c1e3603818','sante',878,'2018-06-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('702f117f-38e1-4825-a5b9-75e37cac1e3a','POLZ-417-1','c6bf2551-5bf6-46dd-ad98-e1c1e3603818','178807c2-c3e1-4340-b0fe-9a510999a241','sante','2018-06-25','2019-06-25',674,7,'premium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('377deb28-d3c8-4323-a5a4-d39b0cf9f336','user418@rich.com',crypt('test123', gen_salt('bf')),'client','2024-08-22');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('377deb28-d3c8-4323-a5a4-d39b0cf9f336','Bryan','Rakotonirina','Antananarivo','2024-08-22',45,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d545e3a5-b3a2-4959-976e-ebf5a2f70c3e','QZ-418-0','377deb28-d3c8-4323-a5a4-d39b0cf9f336','moto',629,'2021-10-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('981cb74f-0f63-4ce8-90bf-ef1a37aeebfa','POLZ-418-0','377deb28-d3c8-4323-a5a4-d39b0cf9f336','d545e3a5-b3a2-4959-976e-ebf5a2f70c3e','moto','2021-10-30','2022-10-30',503,39,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('156499a5-c3ca-473c-bec6-b4593b8afede','INCZ-418-0-0','981cb74f-0f63-4ce8-90bf-ef1a37aeebfa','377deb28-d3c8-4323-a5a4-d39b0cf9f336','Incident','Déclaration de sinistre','2025-05-01','moto','moyen','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('7115bcfc-c9e8-4265-b42f-b79aa010a5b8','INCZ-418-0-1','981cb74f-0f63-4ce8-90bf-ef1a37aeebfa','377deb28-d3c8-4323-a5a4-d39b0cf9f336','Incident','Déclaration de sinistre','2022-11-17','moto','eleve','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('6165aaba-f522-4994-a144-3fa525133ba5','user419@rich.com',crypt('test123', gen_salt('bf')),'client','2024-01-13');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('6165aaba-f522-4994-a144-3fa525133ba5','Tahina','Rakotonirina','Antananarivo','2024-01-13',49,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ddc02e22-4f8f-449b-aa12-bb29056a222e','QZ-419-0','6165aaba-f522-4994-a144-3fa525133ba5','moto',754,'2019-03-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('724b922d-35ef-42d9-8f57-c1fa827eb59c','POLZ-419-0','6165aaba-f522-4994-a144-3fa525133ba5','ddc02e22-4f8f-449b-aa12-bb29056a222e','moto','2019-03-24','2020-03-24',371,16,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('08c62d88-90af-4add-a5c3-3970a0e56964','INCZ-419-0-0','724b922d-35ef-42d9-8f57-c1fa827eb59c','6165aaba-f522-4994-a144-3fa525133ba5','Incident','Déclaration de sinistre','2021-10-13','moto','eleve','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('b7473645-17c2-437b-a4b3-a16f796e44c6','INCZ-419-0-1','724b922d-35ef-42d9-8f57-c1fa827eb59c','6165aaba-f522-4994-a144-3fa525133ba5','Incident','Déclaration de sinistre','2020-09-11','moto','eleve','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('56b66617-b573-458e-8ce8-9b64bc6e6ec4','QZ-419-1','6165aaba-f522-4994-a144-3fa525133ba5','sante',551,'2020-12-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('4bdc9a3d-3645-4b64-b30c-e383ded3c264','POLZ-419-1','6165aaba-f522-4994-a144-3fa525133ba5','56b66617-b573-458e-8ce8-9b64bc6e6ec4','sante','2020-12-24','2021-12-24',662,15,'basic','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d752a894-4743-4fbf-aea9-c72837cc36cd','QZ-419-2','6165aaba-f522-4994-a144-3fa525133ba5','sante',451,'2024-12-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('666f5a37-deee-4690-bc63-9842960ec51b','POLZ-419-2','6165aaba-f522-4994-a144-3fa525133ba5','d752a894-4743-4fbf-aea9-c72837cc36cd','sante','2024-12-28','2025-12-28',145,18,'premium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('7a74cff9-0d8a-4371-8f7e-997e9ea2afb7','user420@rich.com',crypt('test123', gen_salt('bf')),'client','2025-08-21');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('7a74cff9-0d8a-4371-8f7e-997e9ea2afb7','Tahina','Randriamanana','Antananarivo','2025-08-21',66,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1e86481c-2fd9-46c4-9251-aaa1fa41421c','QZ-420-0','7a74cff9-0d8a-4371-8f7e-997e9ea2afb7','moto',541,'2021-06-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('1b4019d5-305f-42eb-b60b-c6c091a7089f','POLZ-420-0','7a74cff9-0d8a-4371-8f7e-997e9ea2afb7','1e86481c-2fd9-46c4-9251-aaa1fa41421c','moto','2021-06-23','2022-06-23',195,37,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('338881d4-6dc7-4a24-8410-15206f82729a','INCZ-420-0-0','1b4019d5-305f-42eb-b60b-c6c091a7089f','7a74cff9-0d8a-4371-8f7e-997e9ea2afb7','Incident','Déclaration de sinistre','2024-03-11','moto','moyen','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f324c3a7-a772-49aa-9d5d-7b8842bd69a0','QZ-420-1','7a74cff9-0d8a-4371-8f7e-997e9ea2afb7','auto',255,'2024-04-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('9f3384b9-cac3-44e9-a10c-376ccc98f4fc','POLZ-420-1','7a74cff9-0d8a-4371-8f7e-997e9ea2afb7','f324c3a7-a772-49aa-9d5d-7b8842bd69a0','auto','2024-04-20','2025-04-20',917,41,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('423ee660-723d-40ed-8d6d-ecce54eee1b1','INCZ-420-1-0','9f3384b9-cac3-44e9-a10c-376ccc98f4fc','7a74cff9-0d8a-4371-8f7e-997e9ea2afb7','Incident','Déclaration de sinistre','2025-06-29','auto','leger','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('e3bd3fd8-4f7f-4f48-be47-4998d3cfc864','INCZ-420-1-1','9f3384b9-cac3-44e9-a10c-376ccc98f4fc','7a74cff9-0d8a-4371-8f7e-997e9ea2afb7','Incident','Déclaration de sinistre','2021-01-30','auto','leger','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('26f122c8-94ae-4621-9bea-27b96746c4b0','QZ-420-2','7a74cff9-0d8a-4371-8f7e-997e9ea2afb7','auto',144,'2024-11-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('47d90859-8eac-4ff3-bdb5-ee4c17f1aeac','POLZ-420-2','7a74cff9-0d8a-4371-8f7e-997e9ea2afb7','26f122c8-94ae-4621-9bea-27b96746c4b0','auto','2024-11-11','2025-11-11',238,40,'medium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('7842499c-4e09-484b-a204-bfd4f65be5d0','user421@rich.com',crypt('test123', gen_salt('bf')),'client','2024-12-03');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('7842499c-4e09-484b-a204-bfd4f65be5d0','Alex','Randriamanana','Antananarivo','2024-12-03',69,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('bc4b52df-e32e-4ead-9dcb-0e74882656d4','QZ-421-0','7842499c-4e09-484b-a204-bfd4f65be5d0','moto',544,'2020-06-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('d23c4b6d-4685-4bad-9e6b-a17676798c83','POLZ-421-0','7842499c-4e09-484b-a204-bfd4f65be5d0','bc4b52df-e32e-4ead-9dcb-0e74882656d4','moto','2020-06-26','2021-06-26',194,9,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('e91f3ce7-e231-468f-9111-b58db526d408','INCZ-421-0-0','d23c4b6d-4685-4bad-9e6b-a17676798c83','7842499c-4e09-484b-a204-bfd4f65be5d0','Incident','Déclaration de sinistre','2018-01-31','moto','eleve','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('5c16fd3d-162e-4e2f-9cb8-9b7e6b3e45cd','INCZ-421-0-1','d23c4b6d-4685-4bad-9e6b-a17676798c83','7842499c-4e09-484b-a204-bfd4f65be5d0','Incident','Déclaration de sinistre','2021-01-26','moto','leger','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('bcf24bf2-2df7-4ec9-a561-55b38fece92a','QZ-421-1','7842499c-4e09-484b-a204-bfd4f65be5d0','sante',65,'2022-03-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('12c70892-4f49-48c0-bf36-2a5c0ae99312','POLZ-421-1','7842499c-4e09-484b-a204-bfd4f65be5d0','bcf24bf2-2df7-4ec9-a561-55b38fece92a','sante','2022-03-01','2023-03-01',288,10,'medium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a6a8090b-6f8a-47aa-b004-b69c5de4002b','user422@rich.com',crypt('test123', gen_salt('bf')),'client','2025-04-17');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('a6a8090b-6f8a-47aa-b004-b69c5de4002b','Nantenaina','Razaka','Antananarivo','2025-04-17',92,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8f7d8859-026d-4869-8477-6bc2080150d6','QZ-422-0','a6a8090b-6f8a-47aa-b004-b69c5de4002b','sante',922,'2024-12-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('1fa63eef-3ede-4f2b-a4f8-7f460fc222ba','POLZ-422-0','a6a8090b-6f8a-47aa-b004-b69c5de4002b','8f7d8859-026d-4869-8477-6bc2080150d6','sante','2024-12-10','2025-12-10',135,43,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('5eca090f-3249-4bed-a5c5-1238f03fc951','INCZ-422-0-0','1fa63eef-3ede-4f2b-a4f8-7f460fc222ba','a6a8090b-6f8a-47aa-b004-b69c5de4002b','Incident','Déclaration de sinistre','2020-11-01','sante','eleve','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a5cadcdb-8145-4865-aa3e-664c0fef41df','user423@rich.com',crypt('test123', gen_salt('bf')),'client','2022-05-17');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('a5cadcdb-8145-4865-aa3e-664c0fef41df','Miora','Razaka','Antananarivo','2022-05-17',45,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('40050bc2-f78f-46c5-9370-f0abb9ca724b','QZ-423-0','a5cadcdb-8145-4865-aa3e-664c0fef41df','sante',484,'2019-11-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('7b16f33f-c048-4169-856e-96298dfc74e4','POLZ-423-0','a5cadcdb-8145-4865-aa3e-664c0fef41df','40050bc2-f78f-46c5-9370-f0abb9ca724b','sante','2019-11-14','2020-11-14',569,23,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('16dc7d39-e9ba-4fb3-8726-dbcdf61d61e1','INCZ-423-0-0','7b16f33f-c048-4169-856e-96298dfc74e4','a5cadcdb-8145-4865-aa3e-664c0fef41df','Incident','Déclaration de sinistre','2022-08-27','sante','eleve','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('7cd52351-39b8-477a-8481-af3971072e5d','user424@rich.com',crypt('test123', gen_salt('bf')),'client','2018-10-22');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('7cd52351-39b8-477a-8481-af3971072e5d','Zo','Rakotomalala','Antananarivo','2018-10-22',84,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b52e05e8-0ef9-45b5-90b9-8a2238f6fb32','QZ-424-0','7cd52351-39b8-477a-8481-af3971072e5d','moto',542,'2019-01-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('72e10e4a-0091-4550-b1bf-96650fc8b3c4','POLZ-424-0','7cd52351-39b8-477a-8481-af3971072e5d','b52e05e8-0ef9-45b5-90b9-8a2238f6fb32','moto','2019-01-04','2020-01-04',755,50,'medium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0366dd98-ce35-4515-9b3d-304844bc1a66','QZ-424-1','7cd52351-39b8-477a-8481-af3971072e5d','sante',119,'2022-10-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('1c18b709-f203-4a59-b804-a70834a01113','POLZ-424-1','7cd52351-39b8-477a-8481-af3971072e5d','0366dd98-ce35-4515-9b3d-304844bc1a66','sante','2022-10-04','2023-10-04',157,22,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('65715364-7cc0-41a7-adab-a3c507854085','INCZ-424-1-0','1c18b709-f203-4a59-b804-a70834a01113','7cd52351-39b8-477a-8481-af3971072e5d','Incident','Déclaration de sinistre','2019-07-29','sante','moyen','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('e1175753-8aac-4edb-afa7-4153bb131fb5','INCZ-424-1-1','1c18b709-f203-4a59-b804-a70834a01113','7cd52351-39b8-477a-8481-af3971072e5d','Incident','Déclaration de sinistre','2020-10-08','sante','moyen','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a25c82aa-c852-414f-9ea4-31683a44bc39','user425@rich.com',crypt('test123', gen_salt('bf')),'client','2019-04-26');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('a25c82aa-c852-414f-9ea4-31683a44bc39','Tahina','Rasoan','Antananarivo','2019-04-26',46,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('47931826-097b-43bc-ac3a-5f5d4636609e','QZ-425-0','a25c82aa-c852-414f-9ea4-31683a44bc39','auto',147,'2024-05-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('4f506e4f-2187-4f7b-b8a2-9212b76ba028','POLZ-425-0','a25c82aa-c852-414f-9ea4-31683a44bc39','47931826-097b-43bc-ac3a-5f5d4636609e','auto','2024-05-13','2025-05-13',826,50,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('c3f217a9-641f-4bcf-a081-31b60ea9d7b0','INCZ-425-0-0','4f506e4f-2187-4f7b-b8a2-9212b76ba028','a25c82aa-c852-414f-9ea4-31683a44bc39','Incident','Déclaration de sinistre','2024-05-02','auto','leger','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a310b037-dfc1-48f1-8008-75fea24a31a0','QZ-425-1','a25c82aa-c852-414f-9ea4-31683a44bc39','sante',861,'2019-11-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f23ee2b4-8a88-4b8f-8bef-852cd70ed5eb','POLZ-425-1','a25c82aa-c852-414f-9ea4-31683a44bc39','a310b037-dfc1-48f1-8008-75fea24a31a0','sante','2019-11-07','2020-11-07',666,48,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('8967394c-c968-4cab-baa3-0534629295a7','INCZ-425-1-0','f23ee2b4-8a88-4b8f-8bef-852cd70ed5eb','a25c82aa-c852-414f-9ea4-31683a44bc39','Incident','Déclaration de sinistre','2024-06-11','sante','leger','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('7d9b57ff-de33-4c1f-bcf4-675e5993bb06','INCZ-425-1-1','f23ee2b4-8a88-4b8f-8bef-852cd70ed5eb','a25c82aa-c852-414f-9ea4-31683a44bc39','Incident','Déclaration de sinistre','2023-05-24','sante','leger','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ee46c7a9-7ea8-42d8-8162-2cff581f7607','user426@rich.com',crypt('test123', gen_salt('bf')),'client','2020-03-07');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('ee46c7a9-7ea8-42d8-8162-2cff581f7607','Tahina','Rakotonirina','Antananarivo','2020-03-07',54,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('565b5646-5216-4162-946c-110bdd99844b','QZ-426-0','ee46c7a9-7ea8-42d8-8162-2cff581f7607','moto',361,'2025-07-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('a18b790f-5cdb-4768-992a-a46cde09e64b','POLZ-426-0','ee46c7a9-7ea8-42d8-8162-2cff581f7607','565b5646-5216-4162-946c-110bdd99844b','moto','2025-07-09','2026-07-09',563,25,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('6353ded7-a5be-41c2-995b-b58e1367b194','INCZ-426-0-0','a18b790f-5cdb-4768-992a-a46cde09e64b','ee46c7a9-7ea8-42d8-8162-2cff581f7607','Incident','Déclaration de sinistre','2022-07-31','moto','moyen','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('36a4c953-fe6d-4471-a7aa-4281aefd3766','user427@rich.com',crypt('test123', gen_salt('bf')),'client','2018-10-26');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('36a4c953-fe6d-4471-a7aa-4281aefd3766','Zo','Andriamanitra','Antananarivo','2018-10-26',14,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f0f99a5f-af53-400e-8e06-8067a76df69c','QZ-427-0','36a4c953-fe6d-4471-a7aa-4281aefd3766','auto',265,'2022-03-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5c838a88-2b29-4fcc-ae95-349f70e83d90','POLZ-427-0','36a4c953-fe6d-4471-a7aa-4281aefd3766','f0f99a5f-af53-400e-8e06-8067a76df69c','auto','2022-03-08','2023-03-08',169,10,'basic','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('7332d6d8-d756-464f-938c-f8583fd623a4','user428@rich.com',crypt('test123', gen_salt('bf')),'client','2024-08-20');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('7332d6d8-d756-464f-938c-f8583fd623a4','Tahina','Rasoan','Antananarivo','2024-08-20',14,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0f7fdc47-6d17-4887-aaab-3d7fda69ac7c','QZ-428-0','7332d6d8-d756-464f-938c-f8583fd623a4','auto',896,'2022-08-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('af03e604-77d1-4ffb-9d3a-f3037d6cccf2','POLZ-428-0','7332d6d8-d756-464f-938c-f8583fd623a4','0f7fdc47-6d17-4887-aaab-3d7fda69ac7c','auto','2022-08-02','2023-08-02',500,20,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('e67e8eed-0905-4f94-82d5-4cf2869c1c6e','INCZ-428-0-0','af03e604-77d1-4ffb-9d3a-f3037d6cccf2','7332d6d8-d756-464f-938c-f8583fd623a4','Incident','Déclaration de sinistre','2025-04-16','auto','leger','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('b8f2b701-aca5-418a-a28e-9744b645c68f','user429@rich.com',crypt('test123', gen_salt('bf')),'client','2022-01-04');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('b8f2b701-aca5-418a-a28e-9744b645c68f','Bryan','Razaka','Antananarivo','2022-01-04',86,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('656b2f6c-854a-4775-8ae6-8a7338e2ede5','QZ-429-0','b8f2b701-aca5-418a-a28e-9744b645c68f','auto',274,'2024-03-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('21227b22-5682-45ac-bb8b-0fee1289b89b','POLZ-429-0','b8f2b701-aca5-418a-a28e-9744b645c68f','656b2f6c-854a-4775-8ae6-8a7338e2ede5','auto','2024-03-28','2025-03-28',481,15,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('a89f274a-d1ae-493c-a2b7-53aeee5f480d','INCZ-429-0-0','21227b22-5682-45ac-bb8b-0fee1289b89b','b8f2b701-aca5-418a-a28e-9744b645c68f','Incident','Déclaration de sinistre','2021-09-27','auto','leger','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('4082d721-dd27-4200-8f39-1c063078d49f','INCZ-429-0-1','21227b22-5682-45ac-bb8b-0fee1289b89b','b8f2b701-aca5-418a-a28e-9744b645c68f','Incident','Déclaration de sinistre','2022-03-25','auto','moyen','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e76f3792-5609-4edb-9102-1fd795b3e507','QZ-429-1','b8f2b701-aca5-418a-a28e-9744b645c68f','moto',689,'2018-04-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('371d9561-9499-43b4-b103-e272fc3e9f32','POLZ-429-1','b8f2b701-aca5-418a-a28e-9744b645c68f','e76f3792-5609-4edb-9102-1fd795b3e507','moto','2018-04-06','2019-04-06',252,42,'medium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f44128fe-35ab-4557-92c3-03bba1f1d8ab','QZ-429-2','b8f2b701-aca5-418a-a28e-9744b645c68f','auto',820,'2024-08-31');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f131cfd6-c790-42cb-9349-0455fe3a0b2a','POLZ-429-2','b8f2b701-aca5-418a-a28e-9744b645c68f','f44128fe-35ab-4557-92c3-03bba1f1d8ab','auto','2024-08-31','2025-08-31',361,41,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('e2beaad4-ee17-437f-9826-0c7c6cd41ab1','INCZ-429-2-0','f131cfd6-c790-42cb-9349-0455fe3a0b2a','b8f2b701-aca5-418a-a28e-9744b645c68f','Incident','Déclaration de sinistre','2023-03-16','auto','moyen','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('6a1478bc-9ef2-41d6-ab25-eb6e0b2c7afa','INCZ-429-2-1','f131cfd6-c790-42cb-9349-0455fe3a0b2a','b8f2b701-aca5-418a-a28e-9744b645c68f','Incident','Déclaration de sinistre','2021-05-28','auto','moyen','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('da95dace-feb2-4b69-abb1-119bd5fd82d9','user430@rich.com',crypt('test123', gen_salt('bf')),'client','2019-07-01');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('da95dace-feb2-4b69-abb1-119bd5fd82d9','Mamy','Randriamanana','Antananarivo','2019-07-01',14,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('35c62d8f-f98c-4ed9-bfc0-ba94711829d2','QZ-430-0','da95dace-feb2-4b69-abb1-119bd5fd82d9','auto',825,'2021-12-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e78080a6-4062-4576-878d-e05a07c596dd','POLZ-430-0','da95dace-feb2-4b69-abb1-119bd5fd82d9','35c62d8f-f98c-4ed9-bfc0-ba94711829d2','auto','2021-12-17','2022-12-17',67,8,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('9dc88991-cdcb-4ae4-b5e6-0696bcc00ace','INCZ-430-0-0','e78080a6-4062-4576-878d-e05a07c596dd','da95dace-feb2-4b69-abb1-119bd5fd82d9','Incident','Déclaration de sinistre','2020-09-19','auto','leger','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('18681e42-3485-4a46-9f65-f1f6fd4ddd0d','INCZ-430-0-1','e78080a6-4062-4576-878d-e05a07c596dd','da95dace-feb2-4b69-abb1-119bd5fd82d9','Incident','Déclaration de sinistre','2024-07-16','auto','moyen','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e600ddda-7dfa-443c-a856-80b1bb9eb24d','QZ-430-1','da95dace-feb2-4b69-abb1-119bd5fd82d9','auto',661,'2021-01-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('42187483-2164-4581-ab91-159ff0e7bfec','POLZ-430-1','da95dace-feb2-4b69-abb1-119bd5fd82d9','e600ddda-7dfa-443c-a856-80b1bb9eb24d','auto','2021-01-02','2022-01-02',963,6,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('c3dd0c98-7136-4525-b24c-9bc0f7bfac4d','INCZ-430-1-0','42187483-2164-4581-ab91-159ff0e7bfec','da95dace-feb2-4b69-abb1-119bd5fd82d9','Incident','Déclaration de sinistre','2024-06-04','auto','moyen','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('2f1411d2-2620-4a75-89e4-4be4d74f18b5','user431@rich.com',crypt('test123', gen_salt('bf')),'client','2022-12-13');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('2f1411d2-2620-4a75-89e4-4be4d74f18b5','Nantenaina','Rakotomalala','Antananarivo','2022-12-13',81,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1c60b6eb-5b98-46f6-b38f-e6f9ca59ff13','QZ-431-0','2f1411d2-2620-4a75-89e4-4be4d74f18b5','auto',659,'2021-05-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('76769467-fdfc-4bb1-bf3d-49a79ac60b7f','POLZ-431-0','2f1411d2-2620-4a75-89e4-4be4d74f18b5','1c60b6eb-5b98-46f6-b38f-e6f9ca59ff13','auto','2021-05-16','2022-05-16',635,20,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('99c01d1a-d992-44fb-9008-c34c00c62520','INCZ-431-0-0','76769467-fdfc-4bb1-bf3d-49a79ac60b7f','2f1411d2-2620-4a75-89e4-4be4d74f18b5','Incident','Déclaration de sinistre','2022-09-02','auto','moyen','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('708d00ef-7dae-4e42-b402-4389d5ac06c7','INCZ-431-0-1','76769467-fdfc-4bb1-bf3d-49a79ac60b7f','2f1411d2-2620-4a75-89e4-4be4d74f18b5','Incident','Déclaration de sinistre','2019-02-16','auto','leger','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ce014b14-8813-4778-8010-17dae2408f37','user432@rich.com',crypt('test123', gen_salt('bf')),'client','2025-10-11');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('ce014b14-8813-4778-8010-17dae2408f37','Alex','Rakotonirina','Antananarivo','2025-10-11',65,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('416d6dd5-2a56-4024-8ede-e4b467e72706','QZ-432-0','ce014b14-8813-4778-8010-17dae2408f37','moto',403,'2021-11-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('7707aa3f-43a0-408c-9410-ae6477393c62','POLZ-432-0','ce014b14-8813-4778-8010-17dae2408f37','416d6dd5-2a56-4024-8ede-e4b467e72706','moto','2021-11-02','2022-11-02',470,17,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('bcd986b9-fbdb-421a-a24b-f3149db3f664','INCZ-432-0-0','7707aa3f-43a0-408c-9410-ae6477393c62','ce014b14-8813-4778-8010-17dae2408f37','Incident','Déclaration de sinistre','2022-09-15','moto','leger','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('61ae720f-3e08-4cc2-a570-c92d4b238d61','QZ-432-1','ce014b14-8813-4778-8010-17dae2408f37','auto',247,'2018-07-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('7f4ec8cf-e778-48f2-829d-0ae32eebe0d5','POLZ-432-1','ce014b14-8813-4778-8010-17dae2408f37','61ae720f-3e08-4cc2-a570-c92d4b238d61','auto','2018-07-08','2019-07-08',652,34,'basic','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('91bd12cf-87ee-42f7-81d6-e796d4b2613c','QZ-432-2','ce014b14-8813-4778-8010-17dae2408f37','sante',848,'2018-12-31');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('1726b6a6-8e82-4d17-9c92-271a8dec4a80','POLZ-432-2','ce014b14-8813-4778-8010-17dae2408f37','91bd12cf-87ee-42f7-81d6-e796d4b2613c','sante','2018-12-31','2019-12-31',589,17,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('fa85d792-5628-463a-be1a-0042ab8971da','INCZ-432-2-0','1726b6a6-8e82-4d17-9c92-271a8dec4a80','ce014b14-8813-4778-8010-17dae2408f37','Incident','Déclaration de sinistre','2023-09-11','sante','eleve','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('710682df-e59d-4cfe-bd70-d0b847c579f1','INCZ-432-2-1','1726b6a6-8e82-4d17-9c92-271a8dec4a80','ce014b14-8813-4778-8010-17dae2408f37','Incident','Déclaration de sinistre','2022-03-15','sante','moyen','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a0fcf384-d674-4eef-adda-d516bb49ab9d','user433@rich.com',crypt('test123', gen_salt('bf')),'client','2022-08-27');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('a0fcf384-d674-4eef-adda-d516bb49ab9d','Tahina','Rakotonirina','Antananarivo','2022-08-27',19,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a704c65d-5665-46a8-b065-1f9a3a06b5cf','QZ-433-0','a0fcf384-d674-4eef-adda-d516bb49ab9d','auto',494,'2025-12-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('fe5ce316-d84f-469a-bef9-b47152ca647a','POLZ-433-0','a0fcf384-d674-4eef-adda-d516bb49ab9d','a704c65d-5665-46a8-b065-1f9a3a06b5cf','auto','2025-12-22','2026-12-22',436,5,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('19a118dd-b9a0-4f4d-b4a7-7b014d5aab33','INCZ-433-0-0','fe5ce316-d84f-469a-bef9-b47152ca647a','a0fcf384-d674-4eef-adda-d516bb49ab9d','Incident','Déclaration de sinistre','2018-04-14','auto','leger','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b3b36522-5625-4014-80e7-16e41af3b76b','QZ-433-1','a0fcf384-d674-4eef-adda-d516bb49ab9d','auto',251,'2020-04-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5e67798f-598f-463c-8e9b-22272b4d48c9','POLZ-433-1','a0fcf384-d674-4eef-adda-d516bb49ab9d','b3b36522-5625-4014-80e7-16e41af3b76b','auto','2020-04-25','2021-04-25',335,34,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('54cb0ffe-8773-485f-8806-d92a6af1ffe0','INCZ-433-1-0','5e67798f-598f-463c-8e9b-22272b4d48c9','a0fcf384-d674-4eef-adda-d516bb49ab9d','Incident','Déclaration de sinistre','2024-12-03','auto','eleve','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('3e9b185e-6eb8-4311-b241-5a1c4acdd459','user434@rich.com',crypt('test123', gen_salt('bf')),'client','2021-10-18');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('3e9b185e-6eb8-4311-b241-5a1c4acdd459','Tovo','Rakotonirina','Antananarivo','2021-10-18',57,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ece68947-d50b-4fb2-9cf9-b1f5b85cf832','QZ-434-0','3e9b185e-6eb8-4311-b241-5a1c4acdd459','sante',519,'2018-10-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('7b3072fd-fb6a-4097-90dd-ab2ad74ed1f3','POLZ-434-0','3e9b185e-6eb8-4311-b241-5a1c4acdd459','ece68947-d50b-4fb2-9cf9-b1f5b85cf832','sante','2018-10-20','2019-10-20',945,23,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('1847186a-9318-46a5-a48a-b38f5e8aa9d9','INCZ-434-0-0','7b3072fd-fb6a-4097-90dd-ab2ad74ed1f3','3e9b185e-6eb8-4311-b241-5a1c4acdd459','Incident','Déclaration de sinistre','2023-09-21','sante','eleve','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('db616170-b28c-445f-8f4f-b44bd6e7c418','QZ-434-1','3e9b185e-6eb8-4311-b241-5a1c4acdd459','sante',484,'2019-11-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('4d15f94f-4dc2-4975-8cb9-66d267a27e3a','POLZ-434-1','3e9b185e-6eb8-4311-b241-5a1c4acdd459','db616170-b28c-445f-8f4f-b44bd6e7c418','sante','2019-11-14','2020-11-14',699,50,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('23887887-27e9-4588-b637-6d7846638177','INCZ-434-1-0','4d15f94f-4dc2-4975-8cb9-66d267a27e3a','3e9b185e-6eb8-4311-b241-5a1c4acdd459','Incident','Déclaration de sinistre','2023-12-08','sante','eleve','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e88027ad-a3d3-4602-a24b-36ac6a3f8035','QZ-434-2','3e9b185e-6eb8-4311-b241-5a1c4acdd459','auto',516,'2019-04-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('a2a13997-9ac8-4996-b2a3-e02517c815a2','POLZ-434-2','3e9b185e-6eb8-4311-b241-5a1c4acdd459','e88027ad-a3d3-4602-a24b-36ac6a3f8035','auto','2019-04-26','2020-04-26',144,33,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('ece03438-9c41-460e-b46c-29aef360a7a3','INCZ-434-2-0','a2a13997-9ac8-4996-b2a3-e02517c815a2','3e9b185e-6eb8-4311-b241-5a1c4acdd459','Incident','Déclaration de sinistre','2021-04-09','auto','moyen','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('e663d709-1fbe-465d-b1c3-a2f82e0e34f4','INCZ-434-2-1','a2a13997-9ac8-4996-b2a3-e02517c815a2','3e9b185e-6eb8-4311-b241-5a1c4acdd459','Incident','Déclaration de sinistre','2022-04-05','auto','moyen','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('9e08e3a9-dfa7-4175-81ac-aa41a735fcb4','user435@rich.com',crypt('test123', gen_salt('bf')),'client','2020-08-02');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('9e08e3a9-dfa7-4175-81ac-aa41a735fcb4','Zo','Andriamanitra','Antananarivo','2020-08-02',20,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9e302fc2-e85f-420b-a5e3-809030a21f4c','QZ-435-0','9e08e3a9-dfa7-4175-81ac-aa41a735fcb4','sante',901,'2019-12-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('7ce51cff-016a-488f-a166-d03572917fa8','POLZ-435-0','9e08e3a9-dfa7-4175-81ac-aa41a735fcb4','9e302fc2-e85f-420b-a5e3-809030a21f4c','sante','2019-12-19','2020-12-19',344,39,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('691b1ead-9f19-4661-ab1f-f42693f24e9e','INCZ-435-0-0','7ce51cff-016a-488f-a166-d03572917fa8','9e08e3a9-dfa7-4175-81ac-aa41a735fcb4','Incident','Déclaration de sinistre','2019-09-28','sante','eleve','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('ad1c03b4-fe66-41c8-89f2-861697e521bb','INCZ-435-0-1','7ce51cff-016a-488f-a166-d03572917fa8','9e08e3a9-dfa7-4175-81ac-aa41a735fcb4','Incident','Déclaration de sinistre','2022-01-07','sante','eleve','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c4cf02d3-bc3d-4a9a-9a92-7e0c7a0e10fc','QZ-435-1','9e08e3a9-dfa7-4175-81ac-aa41a735fcb4','sante',861,'2020-12-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5da12941-7145-48bd-b430-ad0f4fc56234','POLZ-435-1','9e08e3a9-dfa7-4175-81ac-aa41a735fcb4','c4cf02d3-bc3d-4a9a-9a92-7e0c7a0e10fc','sante','2020-12-24','2021-12-24',841,47,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('f82a9a8b-8044-4a8f-824e-78d8b7ba4631','INCZ-435-1-0','5da12941-7145-48bd-b430-ad0f4fc56234','9e08e3a9-dfa7-4175-81ac-aa41a735fcb4','Incident','Déclaration de sinistre','2021-11-29','sante','eleve','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c455a654-382f-4be9-ae90-653d70394ac4','QZ-435-2','9e08e3a9-dfa7-4175-81ac-aa41a735fcb4','auto',582,'2023-06-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('12801413-6b42-4141-bb36-b8209fe9c39b','POLZ-435-2','9e08e3a9-dfa7-4175-81ac-aa41a735fcb4','c455a654-382f-4be9-ae90-653d70394ac4','auto','2023-06-06','2024-06-06',87,12,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('f377ec93-2371-4f74-9890-41095b8ea718','INCZ-435-2-0','12801413-6b42-4141-bb36-b8209fe9c39b','9e08e3a9-dfa7-4175-81ac-aa41a735fcb4','Incident','Déclaration de sinistre','2022-07-21','auto','leger','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('f275b7a9-5edd-486b-a7ee-b4f94c1f0132','user436@rich.com',crypt('test123', gen_salt('bf')),'client','2019-09-18');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('f275b7a9-5edd-486b-a7ee-b4f94c1f0132','Alex','Rajaona','Antananarivo','2019-09-18',64,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7d40e994-e024-4536-946a-1d4410c6e0ec','QZ-436-0','f275b7a9-5edd-486b-a7ee-b4f94c1f0132','auto',954,'2020-08-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('de047a25-aae9-4ec5-9436-c8f015e779f7','POLZ-436-0','f275b7a9-5edd-486b-a7ee-b4f94c1f0132','7d40e994-e024-4536-946a-1d4410c6e0ec','auto','2020-08-14','2021-08-14',472,41,'premium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('936608ea-d6ff-438b-bdee-8e1d75f88648','user437@rich.com',crypt('test123', gen_salt('bf')),'client','2024-12-04');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('936608ea-d6ff-438b-bdee-8e1d75f88648','Alex','Andriamanitra','Antananarivo','2024-12-04',40,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('68a99bf4-154f-4b8d-b6e4-1bd40f9f2792','QZ-437-0','936608ea-d6ff-438b-bdee-8e1d75f88648','sante',953,'2022-02-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('ad9044fe-4676-407e-bb01-e224ea6939c9','POLZ-437-0','936608ea-d6ff-438b-bdee-8e1d75f88648','68a99bf4-154f-4b8d-b6e4-1bd40f9f2792','sante','2022-02-08','2023-02-08',453,23,'premium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('bbf196c2-10d3-4f0a-8d4a-4c3f198fee0b','QZ-437-1','936608ea-d6ff-438b-bdee-8e1d75f88648','auto',233,'2018-10-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('204e557b-3311-4389-9365-ac52a2909c2e','POLZ-437-1','936608ea-d6ff-438b-bdee-8e1d75f88648','bbf196c2-10d3-4f0a-8d4a-4c3f198fee0b','auto','2018-10-06','2019-10-06',84,8,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('956cdee9-ad6e-4a40-ba64-ba02b6a576db','INCZ-437-1-0','204e557b-3311-4389-9365-ac52a2909c2e','936608ea-d6ff-438b-bdee-8e1d75f88648','Incident','Déclaration de sinistre','2019-01-10','auto','eleve','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('f1c694c5-68c5-4788-9316-e50fb6d11777','INCZ-437-1-1','204e557b-3311-4389-9365-ac52a2909c2e','936608ea-d6ff-438b-bdee-8e1d75f88648','Incident','Déclaration de sinistre','2023-02-12','auto','moyen','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('7e6a2fc1-349c-4934-be1d-976b3a8f6fc8','user438@rich.com',crypt('test123', gen_salt('bf')),'client','2018-08-23');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('7e6a2fc1-349c-4934-be1d-976b3a8f6fc8','Nantenaina','Razaka','Antananarivo','2018-08-23',88,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ffcc71ed-383c-405e-a23b-18057c80afbf','QZ-438-0','7e6a2fc1-349c-4934-be1d-976b3a8f6fc8','moto',693,'2023-05-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('a6968e0a-4e48-4a7d-b646-5ce4293d9b28','POLZ-438-0','7e6a2fc1-349c-4934-be1d-976b3a8f6fc8','ffcc71ed-383c-405e-a23b-18057c80afbf','moto','2023-05-06','2024-05-06',107,11,'basic','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('cd8d9b8a-f402-4e93-829a-b63aabb119ce','QZ-438-1','7e6a2fc1-349c-4934-be1d-976b3a8f6fc8','sante',641,'2022-03-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f550c281-e278-42f8-a76f-940d4bb152c6','POLZ-438-1','7e6a2fc1-349c-4934-be1d-976b3a8f6fc8','cd8d9b8a-f402-4e93-829a-b63aabb119ce','sante','2022-03-28','2023-03-28',585,8,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('4c6163dc-f488-4206-95c4-c0311092f8fd','INCZ-438-1-0','f550c281-e278-42f8-a76f-940d4bb152c6','7e6a2fc1-349c-4934-be1d-976b3a8f6fc8','Incident','Déclaration de sinistre','2018-09-03','sante','moyen','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('8b8c33a5-7e2c-49c3-ac1a-ffb384106c64','INCZ-438-1-1','f550c281-e278-42f8-a76f-940d4bb152c6','7e6a2fc1-349c-4934-be1d-976b3a8f6fc8','Incident','Déclaration de sinistre','2023-07-04','sante','eleve','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('6e4b3d0a-4df0-4814-8cbb-8662076a150a','QZ-438-2','7e6a2fc1-349c-4934-be1d-976b3a8f6fc8','moto',877,'2025-05-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('902b7b1c-6f7b-4e35-ad31-57aeeb50f500','POLZ-438-2','7e6a2fc1-349c-4934-be1d-976b3a8f6fc8','6e4b3d0a-4df0-4814-8cbb-8662076a150a','moto','2025-05-24','2026-05-24',713,38,'medium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('8611217c-84df-41b0-acfc-c6ccd75567b6','user439@rich.com',crypt('test123', gen_salt('bf')),'client','2020-07-13');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('8611217c-84df-41b0-acfc-c6ccd75567b6','Tovo','Randriamanana','Antananarivo','2020-07-13',88,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ee53d7d8-0e66-4eb9-bed0-8a5123d6e514','QZ-439-0','8611217c-84df-41b0-acfc-c6ccd75567b6','moto',93,'2023-07-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('8c3fed64-0617-403d-a816-fc4b24733760','POLZ-439-0','8611217c-84df-41b0-acfc-c6ccd75567b6','ee53d7d8-0e66-4eb9-bed0-8a5123d6e514','moto','2023-07-02','2024-07-02',691,25,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('3c26cba4-b476-4671-9fb0-d76d7bed1b24','INCZ-439-0-0','8c3fed64-0617-403d-a816-fc4b24733760','8611217c-84df-41b0-acfc-c6ccd75567b6','Incident','Déclaration de sinistre','2025-08-07','moto','eleve','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('0c502c3e-8cbb-46ae-a1ce-34cdd05566e7','user440@rich.com',crypt('test123', gen_salt('bf')),'client','2018-06-28');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('0c502c3e-8cbb-46ae-a1ce-34cdd05566e7','Zo','Razaka','Antananarivo','2018-06-28',46,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1c8e78fe-013c-46de-85b5-945e9993f886','QZ-440-0','0c502c3e-8cbb-46ae-a1ce-34cdd05566e7','moto',225,'2022-06-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('74d1a033-9a1a-4437-8aa1-40eb44e74df6','POLZ-440-0','0c502c3e-8cbb-46ae-a1ce-34cdd05566e7','1c8e78fe-013c-46de-85b5-945e9993f886','moto','2022-06-09','2023-06-09',735,40,'medium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0d607de0-eb03-4aaf-902c-5cdf3441b32d','QZ-440-1','0c502c3e-8cbb-46ae-a1ce-34cdd05566e7','moto',812,'2021-10-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('15946a9d-4925-48af-9308-a0b8dbd68774','POLZ-440-1','0c502c3e-8cbb-46ae-a1ce-34cdd05566e7','0d607de0-eb03-4aaf-902c-5cdf3441b32d','moto','2021-10-12','2022-10-12',363,18,'medium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8c930392-f695-48f3-b517-fadddef9c656','QZ-440-2','0c502c3e-8cbb-46ae-a1ce-34cdd05566e7','auto',56,'2026-02-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('bd677b4b-ce46-4fc0-a9dd-f507a0dccaac','POLZ-440-2','0c502c3e-8cbb-46ae-a1ce-34cdd05566e7','8c930392-f695-48f3-b517-fadddef9c656','auto','2026-02-23','2027-02-23',387,30,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('5ecbb0d5-4d36-44d8-ba16-a4dcb59f391d','INCZ-440-2-0','bd677b4b-ce46-4fc0-a9dd-f507a0dccaac','0c502c3e-8cbb-46ae-a1ce-34cdd05566e7','Incident','Déclaration de sinistre','2020-09-26','auto','leger','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('24ef63a2-e1ff-4251-8f2e-0c1c15bad529','INCZ-440-2-1','bd677b4b-ce46-4fc0-a9dd-f507a0dccaac','0c502c3e-8cbb-46ae-a1ce-34cdd05566e7','Incident','Déclaration de sinistre','2021-09-24','auto','moyen','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ffb21f96-0ec7-4639-97b4-83042faddb66','user441@rich.com',crypt('test123', gen_salt('bf')),'client','2022-09-26');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('ffb21f96-0ec7-4639-97b4-83042faddb66','Alex','Andriamanitra','Antananarivo','2022-09-26',19,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('151663c3-4a07-40dd-9c7a-3e007b67c7fa','QZ-441-0','ffb21f96-0ec7-4639-97b4-83042faddb66','moto',805,'2021-09-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('14e39b4b-fe61-4689-ae32-1b976b40dfa1','POLZ-441-0','ffb21f96-0ec7-4639-97b4-83042faddb66','151663c3-4a07-40dd-9c7a-3e007b67c7fa','moto','2021-09-10','2022-09-10',310,29,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('25928283-d734-468d-8210-14a103d5bb1b','INCZ-441-0-0','14e39b4b-fe61-4689-ae32-1b976b40dfa1','ffb21f96-0ec7-4639-97b4-83042faddb66','Incident','Déclaration de sinistre','2024-03-19','moto','moyen','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9887f07e-1888-4bd2-b32b-830754f92e06','QZ-441-1','ffb21f96-0ec7-4639-97b4-83042faddb66','auto',582,'2018-03-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('24067462-2149-4606-9d99-e38d5b34482c','POLZ-441-1','ffb21f96-0ec7-4639-97b4-83042faddb66','9887f07e-1888-4bd2-b32b-830754f92e06','auto','2018-03-21','2019-03-21',605,45,'basic','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('80d5d4c6-44f8-42ab-80e5-2afaa787ff11','QZ-441-2','ffb21f96-0ec7-4639-97b4-83042faddb66','moto',313,'2023-03-18');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('41385249-d7cb-4d24-82c3-9c0ab01267a4','POLZ-441-2','ffb21f96-0ec7-4639-97b4-83042faddb66','80d5d4c6-44f8-42ab-80e5-2afaa787ff11','moto','2023-03-18','2024-03-18',832,20,'basic','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ea37c632-ee29-4bd3-980c-cfa777ac7724','user442@rich.com',crypt('test123', gen_salt('bf')),'client','2025-05-28');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('ea37c632-ee29-4bd3-980c-cfa777ac7724','Tovo','Rakotonirina','Antananarivo','2025-05-28',79,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('240e8f69-3e55-4546-8575-24ec1f9c6d8f','QZ-442-0','ea37c632-ee29-4bd3-980c-cfa777ac7724','auto',294,'2023-10-29');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('da2e18ba-d70f-4358-9808-5e2040522bba','POLZ-442-0','ea37c632-ee29-4bd3-980c-cfa777ac7724','240e8f69-3e55-4546-8575-24ec1f9c6d8f','auto','2023-10-29','2024-10-29',950,14,'medium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('bf48cca4-4de2-454d-abd6-2fe972a5d44d','user443@rich.com',crypt('test123', gen_salt('bf')),'client','2020-05-30');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('bf48cca4-4de2-454d-abd6-2fe972a5d44d','Hery','Andriamanitra','Antananarivo','2020-05-30',75,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a0c0048e-e60f-41f0-ae8b-69202ebf3c9d','QZ-443-0','bf48cca4-4de2-454d-abd6-2fe972a5d44d','auto',466,'2021-03-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('2b65386e-bc87-4fd0-9b01-bf7c21187b16','POLZ-443-0','bf48cca4-4de2-454d-abd6-2fe972a5d44d','a0c0048e-e60f-41f0-ae8b-69202ebf3c9d','auto','2021-03-14','2022-03-14',436,26,'basic','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d4ac84eb-bd1e-40b8-866d-b12752eebdcc','QZ-443-1','bf48cca4-4de2-454d-abd6-2fe972a5d44d','moto',125,'2023-04-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('9ae0b441-3c2a-43cc-ad06-832bc59a0a34','POLZ-443-1','bf48cca4-4de2-454d-abd6-2fe972a5d44d','d4ac84eb-bd1e-40b8-866d-b12752eebdcc','moto','2023-04-21','2024-04-21',560,0,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('6a61f6e2-d2f2-4132-b1cb-d7883ebde5b4','INCZ-443-1-0','9ae0b441-3c2a-43cc-ad06-832bc59a0a34','bf48cca4-4de2-454d-abd6-2fe972a5d44d','Incident','Déclaration de sinistre','2024-10-06','moto','leger','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('38293643-bfc7-45b6-8aca-8b711643f58b','user444@rich.com',crypt('test123', gen_salt('bf')),'client','2020-09-20');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('38293643-bfc7-45b6-8aca-8b711643f58b','Miora','Rakotonirina','Antananarivo','2020-09-20',42,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('35dc5690-f6f5-408f-9a7e-d73c7d300ffc','QZ-444-0','38293643-bfc7-45b6-8aca-8b711643f58b','sante',436,'2023-11-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('a9dca2a3-4244-4e6d-9955-e976028f1eb9','POLZ-444-0','38293643-bfc7-45b6-8aca-8b711643f58b','35dc5690-f6f5-408f-9a7e-d73c7d300ffc','sante','2023-11-28','2024-11-28',144,10,'premium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f4346f06-c1a3-4ea1-af19-d31dcd3e2792','QZ-444-1','38293643-bfc7-45b6-8aca-8b711643f58b','sante',848,'2021-01-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f9eb2f2e-6d4f-4d6f-8d5f-3d96a08d349c','POLZ-444-1','38293643-bfc7-45b6-8aca-8b711643f58b','f4346f06-c1a3-4ea1-af19-d31dcd3e2792','sante','2021-01-30','2022-01-30',201,1,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('5096eb37-c070-48fc-a698-f6e0503766a2','INCZ-444-1-0','f9eb2f2e-6d4f-4d6f-8d5f-3d96a08d349c','38293643-bfc7-45b6-8aca-8b711643f58b','Incident','Déclaration de sinistre','2022-01-18','sante','leger','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('d8925142-36c7-4c1f-ab07-90f3277bb2db','INCZ-444-1-1','f9eb2f2e-6d4f-4d6f-8d5f-3d96a08d349c','38293643-bfc7-45b6-8aca-8b711643f58b','Incident','Déclaration de sinistre','2021-06-23','sante','moyen','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('03466d06-9f3b-4266-8501-0376b5ec2eb7','QZ-444-2','38293643-bfc7-45b6-8aca-8b711643f58b','auto',813,'2021-06-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('998359c1-11d7-4fdb-b424-25bc4f9365ed','POLZ-444-2','38293643-bfc7-45b6-8aca-8b711643f58b','03466d06-9f3b-4266-8501-0376b5ec2eb7','auto','2021-06-30','2022-06-30',647,48,'basic','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('d109972a-7105-47da-8924-8aa0926ce3d6','user445@rich.com',crypt('test123', gen_salt('bf')),'client','2025-03-12');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('d109972a-7105-47da-8924-8aa0926ce3d6','Hery','Razaka','Antananarivo','2025-03-12',34,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('75fb771b-7c12-467b-a50b-4a4226fab45b','QZ-445-0','d109972a-7105-47da-8924-8aa0926ce3d6','sante',367,'2022-10-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('edbece59-23bc-49db-b41d-27797986b071','POLZ-445-0','d109972a-7105-47da-8924-8aa0926ce3d6','75fb771b-7c12-467b-a50b-4a4226fab45b','sante','2022-10-20','2023-10-20',55,21,'medium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('e49fb2ab-62f3-454a-9a0a-d6a7497c6545','user446@rich.com',crypt('test123', gen_salt('bf')),'client','2020-01-12');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('e49fb2ab-62f3-454a-9a0a-d6a7497c6545','Hery','Andriamanitra','Antananarivo','2020-01-12',49,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8c59cd3d-c5e8-49d3-b18d-7f6d0bcde0aa','QZ-446-0','e49fb2ab-62f3-454a-9a0a-d6a7497c6545','auto',835,'2018-12-18');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('9265c23a-c8f1-49e3-8851-d37cb3cf7f2e','POLZ-446-0','e49fb2ab-62f3-454a-9a0a-d6a7497c6545','8c59cd3d-c5e8-49d3-b18d-7f6d0bcde0aa','auto','2018-12-18','2019-12-18',534,6,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('c6b121e7-9c3c-45e8-915a-60f43b1b4817','INCZ-446-0-0','9265c23a-c8f1-49e3-8851-d37cb3cf7f2e','e49fb2ab-62f3-454a-9a0a-d6a7497c6545','Incident','Déclaration de sinistre','2023-09-29','auto','leger','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('13d778ac-1070-4d08-8c5b-05e36bf8a19e','QZ-446-1','e49fb2ab-62f3-454a-9a0a-d6a7497c6545','auto',272,'2023-07-15');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('c6fd4237-0565-494d-ba9c-10ffd45eaba0','POLZ-446-1','e49fb2ab-62f3-454a-9a0a-d6a7497c6545','13d778ac-1070-4d08-8c5b-05e36bf8a19e','auto','2023-07-15','2024-07-15',538,48,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('8ccdf935-b4c7-4a15-8b44-7eb07fc9f344','INCZ-446-1-0','c6fd4237-0565-494d-ba9c-10ffd45eaba0','e49fb2ab-62f3-454a-9a0a-d6a7497c6545','Incident','Déclaration de sinistre','2025-07-17','auto','moyen','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('60520548-41fb-4de7-ab52-2ff2a37c29ef','user447@rich.com',crypt('test123', gen_salt('bf')),'client','2018-08-17');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('60520548-41fb-4de7-ab52-2ff2a37c29ef','Miora','Rajaona','Antananarivo','2018-08-17',65,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f0525614-0fa7-4900-a92c-7685d02aedc8','QZ-447-0','60520548-41fb-4de7-ab52-2ff2a37c29ef','sante',77,'2023-02-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('141ae476-d938-425b-8f1d-d5064c83b23f','POLZ-447-0','60520548-41fb-4de7-ab52-2ff2a37c29ef','f0525614-0fa7-4900-a92c-7685d02aedc8','sante','2023-02-24','2024-02-24',583,24,'basic','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('61f8fb11-a938-4111-aea1-21efa4bda86b','user448@rich.com',crypt('test123', gen_salt('bf')),'client','2024-06-20');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('61f8fb11-a938-4111-aea1-21efa4bda86b','Hery','Ravelona','Antananarivo','2024-06-20',73,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('fb791a5c-b659-41f1-89c7-6ec232fb0d93','QZ-448-0','61f8fb11-a938-4111-aea1-21efa4bda86b','sante',239,'2019-05-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('9a30e82b-05d2-4080-94aa-61c86a60c9d6','POLZ-448-0','61f8fb11-a938-4111-aea1-21efa4bda86b','fb791a5c-b659-41f1-89c7-6ec232fb0d93','sante','2019-05-02','2020-05-02',309,15,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('08b291a9-6746-4806-90be-44a1b2caf91c','INCZ-448-0-0','9a30e82b-05d2-4080-94aa-61c86a60c9d6','61f8fb11-a938-4111-aea1-21efa4bda86b','Incident','Déclaration de sinistre','2022-02-15','sante','leger','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('6bef93d0-0f46-4c10-85f3-248b7edaf40f','INCZ-448-0-1','9a30e82b-05d2-4080-94aa-61c86a60c9d6','61f8fb11-a938-4111-aea1-21efa4bda86b','Incident','Déclaration de sinistre','2020-10-22','sante','eleve','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b001f530-475b-472e-9771-ac983e288a31','QZ-448-1','61f8fb11-a938-4111-aea1-21efa4bda86b','moto',506,'2018-01-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('bf890046-f1fc-427f-9dc3-90613a08fcd9','POLZ-448-1','61f8fb11-a938-4111-aea1-21efa4bda86b','b001f530-475b-472e-9771-ac983e288a31','moto','2018-01-28','2019-01-28',745,15,'medium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ba3aa85c-efc2-4062-95d5-61465507c353','QZ-448-2','61f8fb11-a938-4111-aea1-21efa4bda86b','moto',121,'2020-01-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('8decb04a-c357-4104-a7c2-db0f1a313761','POLZ-448-2','61f8fb11-a938-4111-aea1-21efa4bda86b','ba3aa85c-efc2-4062-95d5-61465507c353','moto','2020-01-28','2021-01-28',294,33,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('674beb32-eb22-4dbb-ac46-20f6e1365c91','INCZ-448-2-0','8decb04a-c357-4104-a7c2-db0f1a313761','61f8fb11-a938-4111-aea1-21efa4bda86b','Incident','Déclaration de sinistre','2023-09-23','moto','leger','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('b9f0843a-f002-4ecd-ab38-6cdf19192ca5','user449@rich.com',crypt('test123', gen_salt('bf')),'client','2019-05-26');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('b9f0843a-f002-4ecd-ab38-6cdf19192ca5','Clara','Rajaona','Antananarivo','2019-05-26',63,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c7d6c218-78da-410f-b29d-d04b737db0c9','QZ-449-0','b9f0843a-f002-4ecd-ab38-6cdf19192ca5','sante',780,'2019-07-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('94ba1d60-68bd-40a3-9871-5890ad0acd68','POLZ-449-0','b9f0843a-f002-4ecd-ab38-6cdf19192ca5','c7d6c218-78da-410f-b29d-d04b737db0c9','sante','2019-07-26','2020-07-26',748,3,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('e6a0cf91-53ca-4d1d-89ed-43c7fe0e2646','INCZ-449-0-0','94ba1d60-68bd-40a3-9871-5890ad0acd68','b9f0843a-f002-4ecd-ab38-6cdf19192ca5','Incident','Déclaration de sinistre','2020-06-13','sante','moyen','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('2ea869c2-be31-436f-852c-fd16de60146d','INCZ-449-0-1','94ba1d60-68bd-40a3-9871-5890ad0acd68','b9f0843a-f002-4ecd-ab38-6cdf19192ca5','Incident','Déclaration de sinistre','2022-02-25','sante','eleve','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('33a6ccf0-302d-405c-8fef-7726467e2a6d','QZ-449-1','b9f0843a-f002-4ecd-ab38-6cdf19192ca5','sante',474,'2019-01-31');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('c3632d14-d00c-4eef-8e98-ccf771b487e5','POLZ-449-1','b9f0843a-f002-4ecd-ab38-6cdf19192ca5','33a6ccf0-302d-405c-8fef-7726467e2a6d','sante','2019-01-31','2020-01-31',207,35,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('37dae203-e9b2-4a6e-88ed-5cb9b9fbb1cd','INCZ-449-1-0','c3632d14-d00c-4eef-8e98-ccf771b487e5','b9f0843a-f002-4ecd-ab38-6cdf19192ca5','Incident','Déclaration de sinistre','2025-11-04','sante','moyen','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0a1ff522-c415-4c35-9078-8f332c6c4eba','QZ-449-2','b9f0843a-f002-4ecd-ab38-6cdf19192ca5','moto',478,'2021-04-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('a87b2990-6eb0-44c3-a310-576953bb2c6a','POLZ-449-2','b9f0843a-f002-4ecd-ab38-6cdf19192ca5','0a1ff522-c415-4c35-9078-8f332c6c4eba','moto','2021-04-13','2022-04-13',724,36,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('cc295200-43d9-4410-8730-6601013e45c6','INCZ-449-2-0','a87b2990-6eb0-44c3-a310-576953bb2c6a','b9f0843a-f002-4ecd-ab38-6cdf19192ca5','Incident','Déclaration de sinistre','2025-10-01','moto','moyen','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('32a0226b-a895-4a8c-9c95-05b27e691937','user450@rich.com',crypt('test123', gen_salt('bf')),'client','2022-11-20');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('32a0226b-a895-4a8c-9c95-05b27e691937','Bryan','Rajaona','Antananarivo','2022-11-20',54,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ec26a5f5-9ac7-4d2e-8818-8df6b6514ea2','QZ-450-0','32a0226b-a895-4a8c-9c95-05b27e691937','auto',937,'2022-09-29');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('8836032c-cad2-402b-8a09-7471967c7047','POLZ-450-0','32a0226b-a895-4a8c-9c95-05b27e691937','ec26a5f5-9ac7-4d2e-8818-8df6b6514ea2','auto','2022-09-29','2023-09-29',886,32,'basic','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('9cc6a260-275b-45ae-8567-4b9f9ac2f4c0','user451@rich.com',crypt('test123', gen_salt('bf')),'client','2020-04-05');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('9cc6a260-275b-45ae-8567-4b9f9ac2f4c0','Clara','Rakotonirina','Antananarivo','2020-04-05',58,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e37e9686-81d4-472d-84f2-41403d0d5190','QZ-451-0','9cc6a260-275b-45ae-8567-4b9f9ac2f4c0','moto',636,'2021-12-18');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('cc73e053-aeef-4cf7-9297-b71c902f6c5d','POLZ-451-0','9cc6a260-275b-45ae-8567-4b9f9ac2f4c0','e37e9686-81d4-472d-84f2-41403d0d5190','moto','2021-12-18','2022-12-18',421,41,'basic','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c9a0763b-59b7-47c0-84d2-9001a5bdc2e1','QZ-451-1','9cc6a260-275b-45ae-8567-4b9f9ac2f4c0','auto',679,'2025-06-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('64624ca2-f99e-48af-ab22-665bc28e270a','POLZ-451-1','9cc6a260-275b-45ae-8567-4b9f9ac2f4c0','c9a0763b-59b7-47c0-84d2-9001a5bdc2e1','auto','2025-06-09','2026-06-09',270,17,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('0dda6ed9-cfa6-4d78-b93d-9d6f2f4d029d','INCZ-451-1-0','64624ca2-f99e-48af-ab22-665bc28e270a','9cc6a260-275b-45ae-8567-4b9f9ac2f4c0','Incident','Déclaration de sinistre','2021-04-02','auto','moyen','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('8561aa18-d1d9-442f-b52b-e7b30ca6e88e','INCZ-451-1-1','64624ca2-f99e-48af-ab22-665bc28e270a','9cc6a260-275b-45ae-8567-4b9f9ac2f4c0','Incident','Déclaration de sinistre','2021-11-25','auto','moyen','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d0a4b423-9aaa-4c14-9b5e-fd6f9c994719','QZ-451-2','9cc6a260-275b-45ae-8567-4b9f9ac2f4c0','sante',785,'2022-07-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('cf0ce305-5139-424d-b500-2de9c0e6e175','POLZ-451-2','9cc6a260-275b-45ae-8567-4b9f9ac2f4c0','d0a4b423-9aaa-4c14-9b5e-fd6f9c994719','sante','2022-07-17','2023-07-17',89,17,'medium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('66ce93e6-d7d3-4f6a-9801-2489972a4033','user452@rich.com',crypt('test123', gen_salt('bf')),'client','2024-02-11');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('66ce93e6-d7d3-4f6a-9801-2489972a4033','Zo','Rakotonirina','Antananarivo','2024-02-11',10,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2edf68e8-db57-439e-a258-c592bd27b019','QZ-452-0','66ce93e6-d7d3-4f6a-9801-2489972a4033','auto',390,'2020-05-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('036b4dc6-9362-4bc1-b767-b5f04a001e21','POLZ-452-0','66ce93e6-d7d3-4f6a-9801-2489972a4033','2edf68e8-db57-439e-a258-c592bd27b019','auto','2020-05-10','2021-05-10',408,41,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('e06d30c9-2236-4ecb-b9de-c863be88acfa','INCZ-452-0-0','036b4dc6-9362-4bc1-b767-b5f04a001e21','66ce93e6-d7d3-4f6a-9801-2489972a4033','Incident','Déclaration de sinistre','2024-11-02','auto','moyen','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('dd337893-15c1-4c6a-8fb7-21167b12729c','user453@rich.com',crypt('test123', gen_salt('bf')),'client','2021-08-22');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('dd337893-15c1-4c6a-8fb7-21167b12729c','Miora','Rajaona','Antananarivo','2021-08-22',53,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8c6f885d-3def-437c-b920-9a23748f60b7','QZ-453-0','dd337893-15c1-4c6a-8fb7-21167b12729c','auto',156,'2024-06-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('0fb5fdad-49c6-47a6-b2e8-8b752fabb037','POLZ-453-0','dd337893-15c1-4c6a-8fb7-21167b12729c','8c6f885d-3def-437c-b920-9a23748f60b7','auto','2024-06-05','2025-06-05',127,12,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('04907097-3946-44d7-986f-eb60f9938742','INCZ-453-0-0','0fb5fdad-49c6-47a6-b2e8-8b752fabb037','dd337893-15c1-4c6a-8fb7-21167b12729c','Incident','Déclaration de sinistre','2025-07-23','auto','leger','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('e67e96ed-6fa5-4c60-9802-4a8751fabf61','INCZ-453-0-1','0fb5fdad-49c6-47a6-b2e8-8b752fabb037','dd337893-15c1-4c6a-8fb7-21167b12729c','Incident','Déclaration de sinistre','2022-11-26','auto','eleve','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b3fd3b6d-cec6-434f-a2de-65b0a6249603','QZ-453-1','dd337893-15c1-4c6a-8fb7-21167b12729c','sante',440,'2023-05-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('0f9e6535-cd4e-4d78-a35b-4bc754bb9e4e','POLZ-453-1','dd337893-15c1-4c6a-8fb7-21167b12729c','b3fd3b6d-cec6-434f-a2de-65b0a6249603','sante','2023-05-07','2024-05-07',250,2,'medium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('0a96cb61-03e7-408e-b4b7-055dcd9ace5f','user454@rich.com',crypt('test123', gen_salt('bf')),'client','2022-09-03');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('0a96cb61-03e7-408e-b4b7-055dcd9ace5f','Alex','Rakotonirina','Antananarivo','2022-09-03',90,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e6f4befc-3abb-4133-b976-a80327eb0c50','QZ-454-0','0a96cb61-03e7-408e-b4b7-055dcd9ace5f','moto',581,'2025-12-31');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('ed4779e1-2c7d-4abf-8d8c-c90b7a9ae9e7','POLZ-454-0','0a96cb61-03e7-408e-b4b7-055dcd9ace5f','e6f4befc-3abb-4133-b976-a80327eb0c50','moto','2025-12-31','2026-12-31',155,49,'medium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('1fb242f1-8512-4018-acf9-50f2541f8189','user455@rich.com',crypt('test123', gen_salt('bf')),'client','2019-06-17');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('1fb242f1-8512-4018-acf9-50f2541f8189','Mamy','Rakotomalala','Antananarivo','2019-06-17',34,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('6cb750fb-d6d1-4bdb-a17c-35eebb7edf57','QZ-455-0','1fb242f1-8512-4018-acf9-50f2541f8189','auto',986,'2025-09-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('eeb20561-9264-4413-89ea-d185432d62e3','POLZ-455-0','1fb242f1-8512-4018-acf9-50f2541f8189','6cb750fb-d6d1-4bdb-a17c-35eebb7edf57','auto','2025-09-24','2026-09-24',186,34,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('39630c4c-c5c5-467c-82c5-eb51d0e39659','INCZ-455-0-0','eeb20561-9264-4413-89ea-d185432d62e3','1fb242f1-8512-4018-acf9-50f2541f8189','Incident','Déclaration de sinistre','2021-03-24','auto','leger','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('f43fe2e6-9208-4dc6-a3b5-176b15478bc5','INCZ-455-0-1','eeb20561-9264-4413-89ea-d185432d62e3','1fb242f1-8512-4018-acf9-50f2541f8189','Incident','Déclaration de sinistre','2018-02-07','auto','moyen','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('0ab8be1a-d0ac-4ff5-bf73-44f887161816','user456@rich.com',crypt('test123', gen_salt('bf')),'client','2018-03-02');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('0ab8be1a-d0ac-4ff5-bf73-44f887161816','Tovo','Rasoan','Antananarivo','2018-03-02',81,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2628a078-8dd7-4dda-a5b7-c9503228e286','QZ-456-0','0ab8be1a-d0ac-4ff5-bf73-44f887161816','moto',980,'2019-06-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('a5e2b4fe-a1d7-4683-b937-b25745c46414','POLZ-456-0','0ab8be1a-d0ac-4ff5-bf73-44f887161816','2628a078-8dd7-4dda-a5b7-c9503228e286','moto','2019-06-27','2020-06-27',116,45,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('5e7707b3-6344-4d34-93ae-d07b061ba9e4','INCZ-456-0-0','a5e2b4fe-a1d7-4683-b937-b25745c46414','0ab8be1a-d0ac-4ff5-bf73-44f887161816','Incident','Déclaration de sinistre','2025-06-22','moto','leger','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('0a22078b-4474-47ac-a441-cdef1da414a7','INCZ-456-0-1','a5e2b4fe-a1d7-4683-b937-b25745c46414','0ab8be1a-d0ac-4ff5-bf73-44f887161816','Incident','Déclaration de sinistre','2023-08-03','moto','moyen','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('23e9d59a-6097-4c15-917f-54b8735959d0','QZ-456-1','0ab8be1a-d0ac-4ff5-bf73-44f887161816','moto',353,'2022-06-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('c3d3e54a-af2f-4047-83cd-17860d6c3ae7','POLZ-456-1','0ab8be1a-d0ac-4ff5-bf73-44f887161816','23e9d59a-6097-4c15-917f-54b8735959d0','moto','2022-06-13','2023-06-13',104,11,'medium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('9f9214e3-fba0-44cb-a2b1-488e9392cf23','user457@rich.com',crypt('test123', gen_salt('bf')),'client','2025-11-30');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('9f9214e3-fba0-44cb-a2b1-488e9392cf23','Nantenaina','Randriamanana','Antananarivo','2025-11-30',70,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d0ba6b03-a3d8-4cbf-ac5a-fda6fdc3420f','QZ-457-0','9f9214e3-fba0-44cb-a2b1-488e9392cf23','moto',268,'2018-08-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e3116ed4-7f36-4e1e-bb9d-9c786d74e636','POLZ-457-0','9f9214e3-fba0-44cb-a2b1-488e9392cf23','d0ba6b03-a3d8-4cbf-ac5a-fda6fdc3420f','moto','2018-08-17','2019-08-17',869,40,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('fba378b1-fb2e-48b6-9667-c62156cef24f','INCZ-457-0-0','e3116ed4-7f36-4e1e-bb9d-9c786d74e636','9f9214e3-fba0-44cb-a2b1-488e9392cf23','Incident','Déclaration de sinistre','2025-09-29','moto','leger','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('56770e08-05c4-49e9-bd3a-5b5e608fd46f','user458@rich.com',crypt('test123', gen_salt('bf')),'client','2022-10-14');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('56770e08-05c4-49e9-bd3a-5b5e608fd46f','Nantenaina','Rasoan','Antananarivo','2022-10-14',89,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('02af5dde-208c-4bce-85b8-0323985e483e','QZ-458-0','56770e08-05c4-49e9-bd3a-5b5e608fd46f','moto',965,'2018-05-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('47b99e8a-2e68-4d82-82e0-6148dd8cba96','POLZ-458-0','56770e08-05c4-49e9-bd3a-5b5e608fd46f','02af5dde-208c-4bce-85b8-0323985e483e','moto','2018-05-27','2019-05-27',343,20,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('e249264a-73e9-42e2-9448-7ac008e68fd5','INCZ-458-0-0','47b99e8a-2e68-4d82-82e0-6148dd8cba96','56770e08-05c4-49e9-bd3a-5b5e608fd46f','Incident','Déclaration de sinistre','2024-08-25','moto','leger','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('675d8c97-9dfa-484b-a132-aca15fd7d77c','QZ-458-1','56770e08-05c4-49e9-bd3a-5b5e608fd46f','sante',337,'2019-04-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('eda3c82b-7959-4420-8cb8-b5eff3a3bcd4','POLZ-458-1','56770e08-05c4-49e9-bd3a-5b5e608fd46f','675d8c97-9dfa-484b-a132-aca15fd7d77c','sante','2019-04-01','2020-04-01',956,36,'medium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('605a0e8c-81f6-46f5-b3d0-d6fc6da5b197','user459@rich.com',crypt('test123', gen_salt('bf')),'client','2021-08-21');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('605a0e8c-81f6-46f5-b3d0-d6fc6da5b197','Mamy','Rajaona','Antananarivo','2021-08-21',95,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7dbfe487-6fce-4657-9823-192f274590b0','QZ-459-0','605a0e8c-81f6-46f5-b3d0-d6fc6da5b197','auto',756,'2021-09-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('9dda95e8-02b7-4d37-bfdf-1d9660def95c','POLZ-459-0','605a0e8c-81f6-46f5-b3d0-d6fc6da5b197','7dbfe487-6fce-4657-9823-192f274590b0','auto','2021-09-17','2022-09-17',307,14,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('02f9560a-c298-47c4-bb11-166b44cf80b6','INCZ-459-0-0','9dda95e8-02b7-4d37-bfdf-1d9660def95c','605a0e8c-81f6-46f5-b3d0-d6fc6da5b197','Incident','Déclaration de sinistre','2018-11-08','auto','moyen','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('69eb7f83-5e24-4e68-8382-1374ddf37724','INCZ-459-0-1','9dda95e8-02b7-4d37-bfdf-1d9660def95c','605a0e8c-81f6-46f5-b3d0-d6fc6da5b197','Incident','Déclaration de sinistre','2023-09-09','auto','leger','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8871ce19-c4a8-4209-8d96-a1e965da896f','QZ-459-1','605a0e8c-81f6-46f5-b3d0-d6fc6da5b197','sante',51,'2024-05-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('523bd2bf-21a5-4ec7-9613-0fd6f74576dc','POLZ-459-1','605a0e8c-81f6-46f5-b3d0-d6fc6da5b197','8871ce19-c4a8-4209-8d96-a1e965da896f','sante','2024-05-09','2025-05-09',232,25,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('3fba51d6-c5f4-4cad-ae42-db1d5c8f06e3','INCZ-459-1-0','523bd2bf-21a5-4ec7-9613-0fd6f74576dc','605a0e8c-81f6-46f5-b3d0-d6fc6da5b197','Incident','Déclaration de sinistre','2024-10-04','sante','eleve','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('713fc011-6fbf-46e5-ba32-5612f144b727','QZ-459-2','605a0e8c-81f6-46f5-b3d0-d6fc6da5b197','moto',996,'2023-11-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('65495425-69fe-4cb7-af20-52e5726fc60d','POLZ-459-2','605a0e8c-81f6-46f5-b3d0-d6fc6da5b197','713fc011-6fbf-46e5-ba32-5612f144b727','moto','2023-11-02','2024-11-02',194,33,'medium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('41d40017-c912-4721-b1e9-868f49a8a12c','user460@rich.com',crypt('test123', gen_salt('bf')),'client','2026-01-16');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('41d40017-c912-4721-b1e9-868f49a8a12c','Miora','Ravelona','Antananarivo','2026-01-16',25,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('32e8bc36-462d-4d5b-aee8-2b3f85834ab1','QZ-460-0','41d40017-c912-4721-b1e9-868f49a8a12c','sante',118,'2023-03-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('3579469d-20e4-46f1-becb-98554e0aee6a','POLZ-460-0','41d40017-c912-4721-b1e9-868f49a8a12c','32e8bc36-462d-4d5b-aee8-2b3f85834ab1','sante','2023-03-27','2024-03-27',833,32,'premium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('8c5d848b-ab29-4938-a251-02e617f0d8e6','user461@rich.com',crypt('test123', gen_salt('bf')),'client','2022-02-01');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('8c5d848b-ab29-4938-a251-02e617f0d8e6','Bryan','Andriamanitra','Antananarivo','2022-02-01',47,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2674fac1-9395-4a62-806c-699d365f5ba3','QZ-461-0','8c5d848b-ab29-4938-a251-02e617f0d8e6','sante',303,'2019-02-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('014acf66-8075-4502-9592-085a2a1ae973','POLZ-461-0','8c5d848b-ab29-4938-a251-02e617f0d8e6','2674fac1-9395-4a62-806c-699d365f5ba3','sante','2019-02-06','2020-02-06',678,16,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('89e268c5-ff31-4411-b46c-036411409e01','INCZ-461-0-0','014acf66-8075-4502-9592-085a2a1ae973','8c5d848b-ab29-4938-a251-02e617f0d8e6','Incident','Déclaration de sinistre','2024-03-11','sante','moyen','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2c5939fa-cfb3-45c3-87f0-92a7666e69f3','QZ-461-1','8c5d848b-ab29-4938-a251-02e617f0d8e6','sante',387,'2024-11-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('4a6b8db9-3ac3-4480-9114-6550dafa816c','POLZ-461-1','8c5d848b-ab29-4938-a251-02e617f0d8e6','2c5939fa-cfb3-45c3-87f0-92a7666e69f3','sante','2024-11-28','2025-11-28',853,47,'medium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('9d2133b9-b781-4636-b704-b8f1cc7586a5','user462@rich.com',crypt('test123', gen_salt('bf')),'client','2021-06-17');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('9d2133b9-b781-4636-b704-b8f1cc7586a5','Tovo','Rakotomalala','Antananarivo','2021-06-17',26,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('21d1f2eb-f009-4572-9722-28e7b3386492','QZ-462-0','9d2133b9-b781-4636-b704-b8f1cc7586a5','sante',671,'2021-11-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('a14b6c50-c4eb-49f8-ab61-694cc414c8f6','POLZ-462-0','9d2133b9-b781-4636-b704-b8f1cc7586a5','21d1f2eb-f009-4572-9722-28e7b3386492','sante','2021-11-08','2022-11-08',178,9,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('f9ffea80-0f14-4333-9208-4c25242c04be','INCZ-462-0-0','a14b6c50-c4eb-49f8-ab61-694cc414c8f6','9d2133b9-b781-4636-b704-b8f1cc7586a5','Incident','Déclaration de sinistre','2023-10-27','sante','leger','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f7441368-7564-462c-8e17-8f802a40fd07','QZ-462-1','9d2133b9-b781-4636-b704-b8f1cc7586a5','sante',836,'2020-03-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('923b8c9d-417b-4b0d-b169-851426525f80','POLZ-462-1','9d2133b9-b781-4636-b704-b8f1cc7586a5','f7441368-7564-462c-8e17-8f802a40fd07','sante','2020-03-08','2021-03-08',508,1,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('f5dba42c-dcec-4a94-b01e-41a2ccb4b252','INCZ-462-1-0','923b8c9d-417b-4b0d-b169-851426525f80','9d2133b9-b781-4636-b704-b8f1cc7586a5','Incident','Déclaration de sinistre','2020-04-05','sante','moyen','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('cb2fdfcb-79e8-4b84-92d9-fb12c013026d','INCZ-462-1-1','923b8c9d-417b-4b0d-b169-851426525f80','9d2133b9-b781-4636-b704-b8f1cc7586a5','Incident','Déclaration de sinistre','2018-05-04','sante','moyen','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('507ded52-c7c4-4f36-a832-9e58e4800d25','QZ-462-2','9d2133b9-b781-4636-b704-b8f1cc7586a5','moto',938,'2022-11-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f3e6c2d9-b7f8-46b8-af22-ac78d2e3f972','POLZ-462-2','9d2133b9-b781-4636-b704-b8f1cc7586a5','507ded52-c7c4-4f36-a832-9e58e4800d25','moto','2022-11-22','2023-11-22',489,35,'basic','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('eec13eb9-e0b1-4a26-a052-2fb06e79b77a','user463@rich.com',crypt('test123', gen_salt('bf')),'client','2023-04-15');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('eec13eb9-e0b1-4a26-a052-2fb06e79b77a','Bryan','Rakotonirina','Antananarivo','2023-04-15',32,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9049d036-e4c2-4d3d-b9f0-be69a19128c3','QZ-463-0','eec13eb9-e0b1-4a26-a052-2fb06e79b77a','moto',973,'2024-12-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('6e9c7444-f4b9-47f9-a154-eb9d361caafb','POLZ-463-0','eec13eb9-e0b1-4a26-a052-2fb06e79b77a','9049d036-e4c2-4d3d-b9f0-be69a19128c3','moto','2024-12-11','2025-12-11',400,19,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('e7b4f9d8-a99f-4904-a93c-14fca73bcea4','INCZ-463-0-0','6e9c7444-f4b9-47f9-a154-eb9d361caafb','eec13eb9-e0b1-4a26-a052-2fb06e79b77a','Incident','Déclaration de sinistre','2018-12-31','moto','moyen','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('bc34f5ab-6c29-427f-b475-2a1a4628b76b','INCZ-463-0-1','6e9c7444-f4b9-47f9-a154-eb9d361caafb','eec13eb9-e0b1-4a26-a052-2fb06e79b77a','Incident','Déclaration de sinistre','2019-06-04','moto','eleve','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b52b75cb-3715-4183-b682-e397fccb43e7','QZ-463-1','eec13eb9-e0b1-4a26-a052-2fb06e79b77a','sante',628,'2023-03-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('c6be40e4-1f22-4857-8675-987eb2eda59d','POLZ-463-1','eec13eb9-e0b1-4a26-a052-2fb06e79b77a','b52b75cb-3715-4183-b682-e397fccb43e7','sante','2023-03-04','2024-03-04',107,27,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('1b538748-ad60-47bd-87e6-d2f38050abf7','INCZ-463-1-0','c6be40e4-1f22-4857-8675-987eb2eda59d','eec13eb9-e0b1-4a26-a052-2fb06e79b77a','Incident','Déclaration de sinistre','2022-01-17','sante','leger','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('10a2a013-2126-487e-920c-0c68bd962312','INCZ-463-1-1','c6be40e4-1f22-4857-8675-987eb2eda59d','eec13eb9-e0b1-4a26-a052-2fb06e79b77a','Incident','Déclaration de sinistre','2019-03-02','sante','eleve','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('95e8b54d-9d43-4339-af2d-4db96d748782','user464@rich.com',crypt('test123', gen_salt('bf')),'client','2019-09-05');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('95e8b54d-9d43-4339-af2d-4db96d748782','Tovo','Rajaona','Antananarivo','2019-09-05',45,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2816efef-d722-4e57-b909-e4c5f4572f54','QZ-464-0','95e8b54d-9d43-4339-af2d-4db96d748782','auto',730,'2023-09-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('a003189a-36e8-42dc-81af-3a52d4b18e0b','POLZ-464-0','95e8b54d-9d43-4339-af2d-4db96d748782','2816efef-d722-4e57-b909-e4c5f4572f54','auto','2023-09-30','2024-09-30',94,48,'premium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('bab87ef8-a5aa-41bb-b0da-807cb2a8509a','QZ-464-1','95e8b54d-9d43-4339-af2d-4db96d748782','moto',52,'2019-08-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('bd0682ee-2997-434e-9a47-0064cd2c78cc','POLZ-464-1','95e8b54d-9d43-4339-af2d-4db96d748782','bab87ef8-a5aa-41bb-b0da-807cb2a8509a','moto','2019-08-12','2020-08-12',462,46,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('22da6cbd-8037-4893-ad16-e5e4fad5cf57','INCZ-464-1-0','bd0682ee-2997-434e-9a47-0064cd2c78cc','95e8b54d-9d43-4339-af2d-4db96d748782','Incident','Déclaration de sinistre','2026-02-06','moto','eleve','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('a7925da2-9ef4-4357-8c42-c7d29e529afc','INCZ-464-1-1','bd0682ee-2997-434e-9a47-0064cd2c78cc','95e8b54d-9d43-4339-af2d-4db96d748782','Incident','Déclaration de sinistre','2021-07-10','moto','leger','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('9515dccd-dd69-478a-9cdc-b90fc8869240','user465@rich.com',crypt('test123', gen_salt('bf')),'client','2025-09-06');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('9515dccd-dd69-478a-9cdc-b90fc8869240','Tovo','Rakotomalala','Antananarivo','2025-09-06',36,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ec4e3216-b978-4d5f-8cd1-43e9f5e033ce','QZ-465-0','9515dccd-dd69-478a-9cdc-b90fc8869240','moto',877,'2018-11-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('2e159831-12d5-45d6-933b-432d7b89fffc','POLZ-465-0','9515dccd-dd69-478a-9cdc-b90fc8869240','ec4e3216-b978-4d5f-8cd1-43e9f5e033ce','moto','2018-11-19','2019-11-19',299,23,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('d26c0484-082f-480c-a56d-880508da7b0e','INCZ-465-0-0','2e159831-12d5-45d6-933b-432d7b89fffc','9515dccd-dd69-478a-9cdc-b90fc8869240','Incident','Déclaration de sinistre','2019-01-01','moto','eleve','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3b31ac8c-d3fc-4c1e-980e-528064d25e00','QZ-465-1','9515dccd-dd69-478a-9cdc-b90fc8869240','sante',102,'2020-08-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('7a770ef6-e408-4f6f-bb9a-dd8c50c424f8','POLZ-465-1','9515dccd-dd69-478a-9cdc-b90fc8869240','3b31ac8c-d3fc-4c1e-980e-528064d25e00','sante','2020-08-28','2021-08-28',261,11,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('170bb1d4-86a6-484d-aafc-3690121f8b29','INCZ-465-1-0','7a770ef6-e408-4f6f-bb9a-dd8c50c424f8','9515dccd-dd69-478a-9cdc-b90fc8869240','Incident','Déclaration de sinistre','2019-12-26','sante','leger','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('1842d83e-9a3d-4472-9862-03cf0b039fe7','user466@rich.com',crypt('test123', gen_salt('bf')),'client','2025-08-22');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('1842d83e-9a3d-4472-9862-03cf0b039fe7','Tovo','Rasoan','Antananarivo','2025-08-22',85,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('41ac7544-9fc5-49b7-9779-aa0525451c90','QZ-466-0','1842d83e-9a3d-4472-9862-03cf0b039fe7','moto',367,'2019-06-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('bd0e7393-0b8b-48d4-bd09-821782e81bae','POLZ-466-0','1842d83e-9a3d-4472-9862-03cf0b039fe7','41ac7544-9fc5-49b7-9779-aa0525451c90','moto','2019-06-22','2020-06-22',716,20,'premium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('89a3556e-c0b6-457a-a833-074e12691a09','QZ-466-1','1842d83e-9a3d-4472-9862-03cf0b039fe7','sante',193,'2023-11-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('48a4845c-9bc1-4169-a704-e06dce3245dd','POLZ-466-1','1842d83e-9a3d-4472-9862-03cf0b039fe7','89a3556e-c0b6-457a-a833-074e12691a09','sante','2023-11-19','2024-11-19',434,25,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('659e688f-8c0d-4827-bf1f-6b8807aa499f','INCZ-466-1-0','48a4845c-9bc1-4169-a704-e06dce3245dd','1842d83e-9a3d-4472-9862-03cf0b039fe7','Incident','Déclaration de sinistre','2022-09-01','sante','moyen','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('d6b57cc5-34c1-43ac-9640-1739c9c852f0','INCZ-466-1-1','48a4845c-9bc1-4169-a704-e06dce3245dd','1842d83e-9a3d-4472-9862-03cf0b039fe7','Incident','Déclaration de sinistre','2023-04-03','sante','eleve','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('97a925eb-a797-4b9f-a544-be16c7c409d4','QZ-466-2','1842d83e-9a3d-4472-9862-03cf0b039fe7','sante',746,'2023-07-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('cc5715af-2e80-4f5f-b296-3ca43942dd5d','POLZ-466-2','1842d83e-9a3d-4472-9862-03cf0b039fe7','97a925eb-a797-4b9f-a544-be16c7c409d4','sante','2023-07-26','2024-07-26',523,6,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('5b1d091f-2a4b-4fb9-8a0c-c6184582c605','INCZ-466-2-0','cc5715af-2e80-4f5f-b296-3ca43942dd5d','1842d83e-9a3d-4472-9862-03cf0b039fe7','Incident','Déclaration de sinistre','2020-05-18','sante','moyen','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('19d35e9f-fbe4-4aba-8525-648cfc848e8f','user467@rich.com',crypt('test123', gen_salt('bf')),'client','2020-02-03');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('19d35e9f-fbe4-4aba-8525-648cfc848e8f','Zo','Rasoan','Antananarivo','2020-02-03',10,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3d04d152-97ce-4d67-a24c-669fa150d6ec','QZ-467-0','19d35e9f-fbe4-4aba-8525-648cfc848e8f','moto',882,'2022-10-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('745ce0fe-1fed-4937-b7e5-4cba6d3aeb8b','POLZ-467-0','19d35e9f-fbe4-4aba-8525-648cfc848e8f','3d04d152-97ce-4d67-a24c-669fa150d6ec','moto','2022-10-04','2023-10-04',844,42,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('a92c5823-2114-4f67-bb9c-d8651387930f','INCZ-467-0-0','745ce0fe-1fed-4937-b7e5-4cba6d3aeb8b','19d35e9f-fbe4-4aba-8525-648cfc848e8f','Incident','Déclaration de sinistre','2021-10-29','moto','moyen','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d5eaffff-6d40-4612-b881-8c55c557b94d','QZ-467-1','19d35e9f-fbe4-4aba-8525-648cfc848e8f','sante',792,'2021-07-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f9154579-139b-4fe8-a66c-3fc0a6b806be','POLZ-467-1','19d35e9f-fbe4-4aba-8525-648cfc848e8f','d5eaffff-6d40-4612-b881-8c55c557b94d','sante','2021-07-12','2022-07-12',183,14,'medium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('14e50433-4675-474b-a41c-a4c5f4e110b7','QZ-467-2','19d35e9f-fbe4-4aba-8525-648cfc848e8f','sante',143,'2019-03-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5912fce4-1c1d-4dff-b835-f024a76205e8','POLZ-467-2','19d35e9f-fbe4-4aba-8525-648cfc848e8f','14e50433-4675-474b-a41c-a4c5f4e110b7','sante','2019-03-12','2020-03-12',178,3,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('39892ea1-6e47-4b81-94fc-5af5165d563a','INCZ-467-2-0','5912fce4-1c1d-4dff-b835-f024a76205e8','19d35e9f-fbe4-4aba-8525-648cfc848e8f','Incident','Déclaration de sinistre','2026-04-27','sante','eleve','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('eb7c647c-919c-45be-85dd-53660351b039','INCZ-467-2-1','5912fce4-1c1d-4dff-b835-f024a76205e8','19d35e9f-fbe4-4aba-8525-648cfc848e8f','Incident','Déclaration de sinistre','2020-04-25','sante','eleve','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('445f482f-98f8-49b4-a221-9393a1df81cd','user468@rich.com',crypt('test123', gen_salt('bf')),'client','2019-06-28');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('445f482f-98f8-49b4-a221-9393a1df81cd','Nantenaina','Randriamanana','Antananarivo','2019-06-28',95,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('361c0f51-2051-4899-abef-557737b8f5e4','QZ-468-0','445f482f-98f8-49b4-a221-9393a1df81cd','sante',587,'2022-01-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('84d6b218-4889-408d-b937-44badf7830dc','POLZ-468-0','445f482f-98f8-49b4-a221-9393a1df81cd','361c0f51-2051-4899-abef-557737b8f5e4','sante','2022-01-19','2023-01-19',574,9,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('c48eb6e9-703d-4688-aa1f-f9aa934e44d6','INCZ-468-0-0','84d6b218-4889-408d-b937-44badf7830dc','445f482f-98f8-49b4-a221-9393a1df81cd','Incident','Déclaration de sinistre','2024-07-19','sante','eleve','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('8ec86674-7fa6-4a89-abb1-32e0f0212dc0','INCZ-468-0-1','84d6b218-4889-408d-b937-44badf7830dc','445f482f-98f8-49b4-a221-9393a1df81cd','Incident','Déclaration de sinistre','2019-12-05','sante','eleve','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9eb6e5aa-50a7-463d-9032-f9b5a963914e','QZ-468-1','445f482f-98f8-49b4-a221-9393a1df81cd','sante',427,'2023-08-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('d37217a1-6b8f-4676-a317-7e9307be9c17','POLZ-468-1','445f482f-98f8-49b4-a221-9393a1df81cd','9eb6e5aa-50a7-463d-9032-f9b5a963914e','sante','2023-08-01','2024-08-01',160,13,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('1b9ff523-d180-4ab7-acbd-e8680534d2c5','INCZ-468-1-0','d37217a1-6b8f-4676-a317-7e9307be9c17','445f482f-98f8-49b4-a221-9393a1df81cd','Incident','Déclaration de sinistre','2022-05-10','sante','eleve','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0e1577d7-4132-4ebd-8772-910d3a57eff4','QZ-468-2','445f482f-98f8-49b4-a221-9393a1df81cd','moto',812,'2020-03-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('69000752-03de-4781-892c-46a98ae87466','POLZ-468-2','445f482f-98f8-49b4-a221-9393a1df81cd','0e1577d7-4132-4ebd-8772-910d3a57eff4','moto','2020-03-14','2021-03-14',595,8,'medium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('8fd1c9dc-4548-488f-83d2-c10ba3e2459a','user469@rich.com',crypt('test123', gen_salt('bf')),'client','2021-11-14');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('8fd1c9dc-4548-488f-83d2-c10ba3e2459a','Tovo','Razaka','Antananarivo','2021-11-14',47,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3085f609-938b-428b-b3f3-7a1b3e0a6b96','QZ-469-0','8fd1c9dc-4548-488f-83d2-c10ba3e2459a','moto',620,'2021-11-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('ac8f961d-e7cb-45d0-93cd-884b8004d085','POLZ-469-0','8fd1c9dc-4548-488f-83d2-c10ba3e2459a','3085f609-938b-428b-b3f3-7a1b3e0a6b96','moto','2021-11-07','2022-11-07',401,6,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('1c0eed80-9f20-4386-9719-db18dd34329d','INCZ-469-0-0','ac8f961d-e7cb-45d0-93cd-884b8004d085','8fd1c9dc-4548-488f-83d2-c10ba3e2459a','Incident','Déclaration de sinistre','2021-12-04','moto','moyen','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('89ae7de7-df79-4f35-a8cf-316b8465b67b','QZ-469-1','8fd1c9dc-4548-488f-83d2-c10ba3e2459a','moto',513,'2020-07-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('bb1feae0-b57e-4dc4-ae56-4c2ad960ead8','POLZ-469-1','8fd1c9dc-4548-488f-83d2-c10ba3e2459a','89ae7de7-df79-4f35-a8cf-316b8465b67b','moto','2020-07-21','2021-07-21',428,11,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('01c1d522-ae7a-448d-8a39-96feb483ced9','INCZ-469-1-0','bb1feae0-b57e-4dc4-ae56-4c2ad960ead8','8fd1c9dc-4548-488f-83d2-c10ba3e2459a','Incident','Déclaration de sinistre','2020-11-27','moto','moyen','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ebf66463-5480-4b53-91d6-c9d4dbcbcc2d','user470@rich.com',crypt('test123', gen_salt('bf')),'client','2024-08-09');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('ebf66463-5480-4b53-91d6-c9d4dbcbcc2d','Hery','Randriamanana','Antananarivo','2024-08-09',54,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('29d32e08-8e46-4121-8da3-67308b787fa1','QZ-470-0','ebf66463-5480-4b53-91d6-c9d4dbcbcc2d','sante',109,'2025-02-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('602dfbfd-40bb-40e8-9ca6-57ea338210a2','POLZ-470-0','ebf66463-5480-4b53-91d6-c9d4dbcbcc2d','29d32e08-8e46-4121-8da3-67308b787fa1','sante','2025-02-19','2026-02-19',675,7,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('fe491ae0-9d84-492d-8661-7f7b21cd301c','INCZ-470-0-0','602dfbfd-40bb-40e8-9ca6-57ea338210a2','ebf66463-5480-4b53-91d6-c9d4dbcbcc2d','Incident','Déclaration de sinistre','2022-02-13','sante','eleve','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('76191429-9365-4283-b920-4e711fbee6e3','user471@rich.com',crypt('test123', gen_salt('bf')),'client','2018-09-08');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('76191429-9365-4283-b920-4e711fbee6e3','Mamy','Razaka','Antananarivo','2018-09-08',91,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f9d388dc-d142-434f-b079-7483e74ee58d','QZ-471-0','76191429-9365-4283-b920-4e711fbee6e3','moto',208,'2024-07-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('35da9d9f-3894-46ff-b4cc-44aa0c479587','POLZ-471-0','76191429-9365-4283-b920-4e711fbee6e3','f9d388dc-d142-434f-b079-7483e74ee58d','moto','2024-07-08','2025-07-08',404,12,'premium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2afb5182-a91c-413f-83fe-e1dfeebd6393','QZ-471-1','76191429-9365-4283-b920-4e711fbee6e3','sante',484,'2018-07-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('3ceb012f-46c9-432a-85c5-00c910534417','POLZ-471-1','76191429-9365-4283-b920-4e711fbee6e3','2afb5182-a91c-413f-83fe-e1dfeebd6393','sante','2018-07-26','2019-07-26',788,6,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('7de5724b-e162-4941-9a78-609fe3c73d7f','INCZ-471-1-0','3ceb012f-46c9-432a-85c5-00c910534417','76191429-9365-4283-b920-4e711fbee6e3','Incident','Déclaration de sinistre','2021-08-14','sante','eleve','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('98d36406-1036-42af-84c5-fb14ade81991','INCZ-471-1-1','3ceb012f-46c9-432a-85c5-00c910534417','76191429-9365-4283-b920-4e711fbee6e3','Incident','Déclaration de sinistre','2021-04-03','sante','leger','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e45f1374-f798-4490-bbe8-a377d95b02a9','QZ-471-2','76191429-9365-4283-b920-4e711fbee6e3','sante',508,'2023-02-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('63e908f6-316c-4b1d-9dd3-582be00c3b6f','POLZ-471-2','76191429-9365-4283-b920-4e711fbee6e3','e45f1374-f798-4490-bbe8-a377d95b02a9','sante','2023-02-08','2024-02-08',233,48,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('69fa3ef8-6f5f-4bbf-a621-34fa0b381def','INCZ-471-2-0','63e908f6-316c-4b1d-9dd3-582be00c3b6f','76191429-9365-4283-b920-4e711fbee6e3','Incident','Déclaration de sinistre','2018-11-20','sante','leger','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('0bb64b8e-0043-42b3-83e5-082720fb4112','user472@rich.com',crypt('test123', gen_salt('bf')),'client','2018-10-23');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('0bb64b8e-0043-42b3-83e5-082720fb4112','Mamy','Rasoan','Antananarivo','2018-10-23',30,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('4017ad93-92ea-483e-9601-204de1897f28','QZ-472-0','0bb64b8e-0043-42b3-83e5-082720fb4112','sante',488,'2019-02-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('6d7c2f82-4b02-43d1-997a-5d1ce973a24b','POLZ-472-0','0bb64b8e-0043-42b3-83e5-082720fb4112','4017ad93-92ea-483e-9601-204de1897f28','sante','2019-02-19','2020-02-19',961,5,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('4aab7032-90d2-4e87-88ae-ae8d60f73e8a','INCZ-472-0-0','6d7c2f82-4b02-43d1-997a-5d1ce973a24b','0bb64b8e-0043-42b3-83e5-082720fb4112','Incident','Déclaration de sinistre','2022-04-23','sante','eleve','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('fc1e7fe0-8e83-482f-9ead-a1e50b79672a','QZ-472-1','0bb64b8e-0043-42b3-83e5-082720fb4112','moto',460,'2024-08-31');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('20a54c04-6ceb-441c-ac9c-29f3de9b38db','POLZ-472-1','0bb64b8e-0043-42b3-83e5-082720fb4112','fc1e7fe0-8e83-482f-9ead-a1e50b79672a','moto','2024-08-31','2025-08-31',619,4,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('ce7ecefa-b1a6-41a6-93e5-754910464b3b','INCZ-472-1-0','20a54c04-6ceb-441c-ac9c-29f3de9b38db','0bb64b8e-0043-42b3-83e5-082720fb4112','Incident','Déclaration de sinistre','2020-10-13','moto','moyen','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('f6b456c7-1ded-401f-bc71-61f15a78a7fe','INCZ-472-1-1','20a54c04-6ceb-441c-ac9c-29f3de9b38db','0bb64b8e-0043-42b3-83e5-082720fb4112','Incident','Déclaration de sinistre','2020-06-08','moto','leger','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('3421d92b-e18b-464a-ac8d-a9402338ab20','user473@rich.com',crypt('test123', gen_salt('bf')),'client','2019-01-14');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('3421d92b-e18b-464a-ac8d-a9402338ab20','Clara','Ravelona','Antananarivo','2019-01-14',85,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1b3061b0-c828-49f0-88e7-3c61a7e32b55','QZ-473-0','3421d92b-e18b-464a-ac8d-a9402338ab20','moto',320,'2023-01-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('9cf7aa5a-7153-45b0-b2d1-fb326338b8b8','POLZ-473-0','3421d92b-e18b-464a-ac8d-a9402338ab20','1b3061b0-c828-49f0-88e7-3c61a7e32b55','moto','2023-01-17','2024-01-17',301,27,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('119863d6-ec06-43e7-9071-b4a7d7ffe4cf','INCZ-473-0-0','9cf7aa5a-7153-45b0-b2d1-fb326338b8b8','3421d92b-e18b-464a-ac8d-a9402338ab20','Incident','Déclaration de sinistre','2023-07-28','moto','eleve','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('b7178670-5148-43ff-9f7c-db1f3d222b2a','user474@rich.com',crypt('test123', gen_salt('bf')),'client','2018-11-11');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('b7178670-5148-43ff-9f7c-db1f3d222b2a','Tovo','Rakotonirina','Antananarivo','2018-11-11',95,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('45fa750c-c29e-4a2b-9e6a-1c433e4ef874','QZ-474-0','b7178670-5148-43ff-9f7c-db1f3d222b2a','sante',780,'2019-07-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('0c68915f-1fae-47d1-ab8c-ff34d6c97643','POLZ-474-0','b7178670-5148-43ff-9f7c-db1f3d222b2a','45fa750c-c29e-4a2b-9e6a-1c433e4ef874','sante','2019-07-12','2020-07-12',762,15,'medium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('4cd3b51a-0900-4ada-b915-5df3ca15e8ad','user475@rich.com',crypt('test123', gen_salt('bf')),'client','2023-04-16');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('4cd3b51a-0900-4ada-b915-5df3ca15e8ad','Alex','Rajaona','Antananarivo','2023-04-16',24,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('6992bb78-954a-4a5f-85a1-f457f65e3bcc','QZ-475-0','4cd3b51a-0900-4ada-b915-5df3ca15e8ad','auto',969,'2026-01-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e0943fde-cb3f-4b9a-9f65-eee738f7b62d','POLZ-475-0','4cd3b51a-0900-4ada-b915-5df3ca15e8ad','6992bb78-954a-4a5f-85a1-f457f65e3bcc','auto','2026-01-25','2027-01-25',445,11,'medium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('b9028fa1-505e-489c-a99d-753da8f796ac','user476@rich.com',crypt('test123', gen_salt('bf')),'client','2023-01-25');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('b9028fa1-505e-489c-a99d-753da8f796ac','Alex','Razaka','Antananarivo','2023-01-25',92,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('233c1221-75a6-4047-a736-18cfe8d3bc23','QZ-476-0','b9028fa1-505e-489c-a99d-753da8f796ac','sante',378,'2024-07-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('8380abc2-4beb-4eab-8f49-1484318f7ad3','POLZ-476-0','b9028fa1-505e-489c-a99d-753da8f796ac','233c1221-75a6-4047-a736-18cfe8d3bc23','sante','2024-07-16','2025-07-16',850,41,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('3fc54eb8-6687-46e5-93d9-c4f5d7d75581','INCZ-476-0-0','8380abc2-4beb-4eab-8f49-1484318f7ad3','b9028fa1-505e-489c-a99d-753da8f796ac','Incident','Déclaration de sinistre','2024-11-19','sante','eleve','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ed3add9f-c589-4b98-8d0c-4f419c942fd8','QZ-476-1','b9028fa1-505e-489c-a99d-753da8f796ac','moto',482,'2019-08-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('01d519fe-cafb-47ff-8cc8-2c1ea1e093bf','POLZ-476-1','b9028fa1-505e-489c-a99d-753da8f796ac','ed3add9f-c589-4b98-8d0c-4f419c942fd8','moto','2019-08-01','2020-08-01',297,19,'medium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('db01743d-8ca5-470c-84e3-1f84c52bc1fa','user477@rich.com',crypt('test123', gen_salt('bf')),'client','2023-01-18');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('db01743d-8ca5-470c-84e3-1f84c52bc1fa','Tahina','Rasoan','Antananarivo','2023-01-18',74,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c26333fd-6eab-43e5-bc3e-e56ed265ed96','QZ-477-0','db01743d-8ca5-470c-84e3-1f84c52bc1fa','auto',308,'2021-01-15');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('895db2b3-a402-4150-a648-5336d32a773c','POLZ-477-0','db01743d-8ca5-470c-84e3-1f84c52bc1fa','c26333fd-6eab-43e5-bc3e-e56ed265ed96','auto','2021-01-15','2022-01-15',318,18,'premium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('3e50b542-5793-47e6-9544-033952255aaf','user478@rich.com',crypt('test123', gen_salt('bf')),'client','2018-04-22');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('3e50b542-5793-47e6-9544-033952255aaf','Zo','Rasoan','Antananarivo','2018-04-22',18,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c3bec1c0-e5ae-4e2c-8362-150a0388e0c8','QZ-478-0','3e50b542-5793-47e6-9544-033952255aaf','auto',405,'2020-07-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5998de66-addf-4da2-b7bd-5aca92bfbe0f','POLZ-478-0','3e50b542-5793-47e6-9544-033952255aaf','c3bec1c0-e5ae-4e2c-8362-150a0388e0c8','auto','2020-07-20','2021-07-20',750,36,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('378bdf18-55f1-447b-8da6-273171ab3218','INCZ-478-0-0','5998de66-addf-4da2-b7bd-5aca92bfbe0f','3e50b542-5793-47e6-9544-033952255aaf','Incident','Déclaration de sinistre','2024-05-09','auto','leger','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('a5c14e44-b9cb-4fd3-83b1-008d5d384bab','INCZ-478-0-1','5998de66-addf-4da2-b7bd-5aca92bfbe0f','3e50b542-5793-47e6-9544-033952255aaf','Incident','Déclaration de sinistre','2020-11-07','auto','eleve','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('102425cb-d765-4b7b-91a6-ce48f493db33','user479@rich.com',crypt('test123', gen_salt('bf')),'client','2025-02-19');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('102425cb-d765-4b7b-91a6-ce48f493db33','Miora','Razaka','Antananarivo','2025-02-19',51,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('4c4d05cf-d40b-4a8c-813e-aab2db99e7d2','QZ-479-0','102425cb-d765-4b7b-91a6-ce48f493db33','sante',842,'2018-09-29');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('2b2ddb1b-4727-4ee5-b05f-a4e792a2aac6','POLZ-479-0','102425cb-d765-4b7b-91a6-ce48f493db33','4c4d05cf-d40b-4a8c-813e-aab2db99e7d2','sante','2018-09-29','2019-09-29',660,40,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('dbfb2146-886d-4144-b934-b6b2889879a5','INCZ-479-0-0','2b2ddb1b-4727-4ee5-b05f-a4e792a2aac6','102425cb-d765-4b7b-91a6-ce48f493db33','Incident','Déclaration de sinistre','2022-09-16','sante','moyen','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('70dbbe3e-5b77-41a6-bd68-2c5daf3f3de7','QZ-479-1','102425cb-d765-4b7b-91a6-ce48f493db33','sante',388,'2022-06-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('b9ac4b1d-7dc2-40e2-bc05-a612c517a478','POLZ-479-1','102425cb-d765-4b7b-91a6-ce48f493db33','70dbbe3e-5b77-41a6-bd68-2c5daf3f3de7','sante','2022-06-17','2023-06-17',569,38,'medium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e52955a8-84d4-402a-a7dc-aafe4f053fc8','QZ-479-2','102425cb-d765-4b7b-91a6-ce48f493db33','sante',540,'2018-03-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('c2c7f031-b2d7-418e-9fab-136917732d20','POLZ-479-2','102425cb-d765-4b7b-91a6-ce48f493db33','e52955a8-84d4-402a-a7dc-aafe4f053fc8','sante','2018-03-30','2019-03-30',129,41,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('0a266d8f-f163-410e-8667-43bd9ffe2876','INCZ-479-2-0','c2c7f031-b2d7-418e-9fab-136917732d20','102425cb-d765-4b7b-91a6-ce48f493db33','Incident','Déclaration de sinistre','2020-06-01','sante','moyen','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('74f79a32-af83-4c60-9a1e-5a7177cdc840','INCZ-479-2-1','c2c7f031-b2d7-418e-9fab-136917732d20','102425cb-d765-4b7b-91a6-ce48f493db33','Incident','Déclaration de sinistre','2025-07-11','sante','moyen','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ab9d6bfa-417b-416f-9353-91b1e9c01e62','user480@rich.com',crypt('test123', gen_salt('bf')),'client','2022-04-24');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('ab9d6bfa-417b-416f-9353-91b1e9c01e62','Clara','Rakotonirina','Antananarivo','2022-04-24',100,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('648d5a9c-11ff-4580-ba89-4d68dd313eb4','QZ-480-0','ab9d6bfa-417b-416f-9353-91b1e9c01e62','moto',66,'2021-05-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('668f1b92-dc7f-4d53-8985-c7c7b015d442','POLZ-480-0','ab9d6bfa-417b-416f-9353-91b1e9c01e62','648d5a9c-11ff-4580-ba89-4d68dd313eb4','moto','2021-05-13','2022-05-13',376,28,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('ebaaa15a-2dd5-475f-8a2a-bca7d483eec3','INCZ-480-0-0','668f1b92-dc7f-4d53-8985-c7c7b015d442','ab9d6bfa-417b-416f-9353-91b1e9c01e62','Incident','Déclaration de sinistre','2018-01-28','moto','moyen','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('43632c5c-b794-44ed-8c98-5c235f98cd75','INCZ-480-0-1','668f1b92-dc7f-4d53-8985-c7c7b015d442','ab9d6bfa-417b-416f-9353-91b1e9c01e62','Incident','Déclaration de sinistre','2022-03-15','moto','moyen','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('16ca1ce6-ad2f-48b7-993d-bd5b2a15c3a0','QZ-480-1','ab9d6bfa-417b-416f-9353-91b1e9c01e62','auto',83,'2022-09-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('4d08343c-fe3d-4634-9abb-abb1f66717a5','POLZ-480-1','ab9d6bfa-417b-416f-9353-91b1e9c01e62','16ca1ce6-ad2f-48b7-993d-bd5b2a15c3a0','auto','2022-09-08','2023-09-08',724,50,'medium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ead0f9a4-dc97-4ebe-b755-3667204f857a','user481@rich.com',crypt('test123', gen_salt('bf')),'client','2022-03-11');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('ead0f9a4-dc97-4ebe-b755-3667204f857a','Tovo','Andriamanitra','Antananarivo','2022-03-11',77,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e9c770bb-b76d-4fd4-ae1d-363cebb22f89','QZ-481-0','ead0f9a4-dc97-4ebe-b755-3667204f857a','sante',741,'2018-03-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('11b7cc1d-ac62-42c4-b214-ec53b6a2aae4','POLZ-481-0','ead0f9a4-dc97-4ebe-b755-3667204f857a','e9c770bb-b76d-4fd4-ae1d-363cebb22f89','sante','2018-03-01','2019-03-01',796,1,'premium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('76f10e41-5f1d-4fca-9a7d-c07ca10ee379','user482@rich.com',crypt('test123', gen_salt('bf')),'client','2023-09-20');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('76f10e41-5f1d-4fca-9a7d-c07ca10ee379','Miora','Randriamanana','Antananarivo','2023-09-20',45,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('00b73e48-4b6d-4a4c-a275-11da53f84f67','QZ-482-0','76f10e41-5f1d-4fca-9a7d-c07ca10ee379','auto',811,'2025-06-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('9c1334a3-fb57-4eff-ab1b-230e6ab0ead1','POLZ-482-0','76f10e41-5f1d-4fca-9a7d-c07ca10ee379','00b73e48-4b6d-4a4c-a275-11da53f84f67','auto','2025-06-08','2026-06-08',351,32,'basic','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('229acf3b-5d02-4434-8719-f12cecaedb6d','QZ-482-1','76f10e41-5f1d-4fca-9a7d-c07ca10ee379','auto',463,'2019-06-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('c185bc38-137e-4ecd-b2e9-2070d8bdce4c','POLZ-482-1','76f10e41-5f1d-4fca-9a7d-c07ca10ee379','229acf3b-5d02-4434-8719-f12cecaedb6d','auto','2019-06-22','2020-06-22',229,39,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('e18f4268-7c88-4213-8d1b-97a6509a5a60','INCZ-482-1-0','c185bc38-137e-4ecd-b2e9-2070d8bdce4c','76f10e41-5f1d-4fca-9a7d-c07ca10ee379','Incident','Déclaration de sinistre','2025-10-15','auto','moyen','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ad806d52-2398-43da-88ec-bdff1d1e1a65','user483@rich.com',crypt('test123', gen_salt('bf')),'client','2024-01-01');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('ad806d52-2398-43da-88ec-bdff1d1e1a65','Alex','Andriamanitra','Antananarivo','2024-01-01',65,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('badd3fea-a582-4c5f-99d5-9f683a675a45','QZ-483-0','ad806d52-2398-43da-88ec-bdff1d1e1a65','sante',172,'2018-11-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f5491ccd-8460-4703-ad24-2a5c3769b220','POLZ-483-0','ad806d52-2398-43da-88ec-bdff1d1e1a65','badd3fea-a582-4c5f-99d5-9f683a675a45','sante','2018-11-01','2019-11-01',276,22,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('eec26d24-f8d7-4239-8aff-ad090ed07bb1','INCZ-483-0-0','f5491ccd-8460-4703-ad24-2a5c3769b220','ad806d52-2398-43da-88ec-bdff1d1e1a65','Incident','Déclaration de sinistre','2022-08-31','sante','moyen','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('2b0c395f-e4b4-4e5e-928c-7f2f1eca054f','user484@rich.com',crypt('test123', gen_salt('bf')),'client','2018-12-07');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('2b0c395f-e4b4-4e5e-928c-7f2f1eca054f','Clara','Randriamanana','Antananarivo','2018-12-07',46,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('fc843a37-f66d-4896-8c51-e7533df13db4','QZ-484-0','2b0c395f-e4b4-4e5e-928c-7f2f1eca054f','moto',576,'2026-01-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('1960e0b4-a0ed-4c6c-9718-bc256492dae5','POLZ-484-0','2b0c395f-e4b4-4e5e-928c-7f2f1eca054f','fc843a37-f66d-4896-8c51-e7533df13db4','moto','2026-01-11','2027-01-11',249,4,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('a8b981a4-8686-4db1-9c6e-85f8bbc39da4','INCZ-484-0-0','1960e0b4-a0ed-4c6c-9718-bc256492dae5','2b0c395f-e4b4-4e5e-928c-7f2f1eca054f','Incident','Déclaration de sinistre','2021-09-14','moto','eleve','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('3a4cb2be-4ef3-48c7-b358-f3e805ef4141','user485@rich.com',crypt('test123', gen_salt('bf')),'client','2019-11-27');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('3a4cb2be-4ef3-48c7-b358-f3e805ef4141','Tovo','Ravelona','Antananarivo','2019-11-27',24,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('69152634-52b6-487e-b2b5-dcbe976794cc','QZ-485-0','3a4cb2be-4ef3-48c7-b358-f3e805ef4141','auto',785,'2018-06-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('7b17b1a9-4491-44fd-91fc-d8a7d446b8c1','POLZ-485-0','3a4cb2be-4ef3-48c7-b358-f3e805ef4141','69152634-52b6-487e-b2b5-dcbe976794cc','auto','2018-06-16','2019-06-16',437,17,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('eb85cbd7-2fc3-4510-a9ee-bb5429b27bfc','INCZ-485-0-0','7b17b1a9-4491-44fd-91fc-d8a7d446b8c1','3a4cb2be-4ef3-48c7-b358-f3e805ef4141','Incident','Déclaration de sinistre','2019-04-17','auto','moyen','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b6f79050-1ee8-4e89-b1df-d9ce57b4627e','QZ-485-1','3a4cb2be-4ef3-48c7-b358-f3e805ef4141','moto',441,'2020-02-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('52be3205-611e-44d5-b526-63bb6b793531','POLZ-485-1','3a4cb2be-4ef3-48c7-b358-f3e805ef4141','b6f79050-1ee8-4e89-b1df-d9ce57b4627e','moto','2020-02-27','2021-02-27',463,19,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('fb8f5639-ced5-4ca1-bff9-09cbc3655bbb','INCZ-485-1-0','52be3205-611e-44d5-b526-63bb6b793531','3a4cb2be-4ef3-48c7-b358-f3e805ef4141','Incident','Déclaration de sinistre','2019-07-29','moto','leger','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9b68738c-83fd-4b19-8596-29487fb533e8','QZ-485-2','3a4cb2be-4ef3-48c7-b358-f3e805ef4141','auto',760,'2024-12-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e133c10c-6347-4f59-aca6-33c9cceda69f','POLZ-485-2','3a4cb2be-4ef3-48c7-b358-f3e805ef4141','9b68738c-83fd-4b19-8596-29487fb533e8','auto','2024-12-21','2025-12-21',411,18,'medium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('7f49280b-3271-4485-b014-824c9e8375fa','user486@rich.com',crypt('test123', gen_salt('bf')),'client','2023-10-07');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('7f49280b-3271-4485-b014-824c9e8375fa','Bryan','Randriamanana','Antananarivo','2023-10-07',10,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c4ac1397-6ae8-4ba7-8d4e-b098569addff','QZ-486-0','7f49280b-3271-4485-b014-824c9e8375fa','auto',879,'2020-01-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5897de4a-f291-4bbc-bcbe-65bed749864a','POLZ-486-0','7f49280b-3271-4485-b014-824c9e8375fa','c4ac1397-6ae8-4ba7-8d4e-b098569addff','auto','2020-01-20','2021-01-20',278,5,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('6d558048-cbfb-4941-a6df-caf436149bef','INCZ-486-0-0','5897de4a-f291-4bbc-bcbe-65bed749864a','7f49280b-3271-4485-b014-824c9e8375fa','Incident','Déclaration de sinistre','2025-04-08','auto','eleve','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('ab7cf042-0290-45b3-990c-da3147ca20da','INCZ-486-0-1','5897de4a-f291-4bbc-bcbe-65bed749864a','7f49280b-3271-4485-b014-824c9e8375fa','Incident','Déclaration de sinistre','2025-08-06','auto','eleve','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7a33de28-d4e6-4025-9e65-e67859ce756f','QZ-486-1','7f49280b-3271-4485-b014-824c9e8375fa','sante',749,'2020-01-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('d65ba740-a9a9-4da8-a43c-84c5ec8723d1','POLZ-486-1','7f49280b-3271-4485-b014-824c9e8375fa','7a33de28-d4e6-4025-9e65-e67859ce756f','sante','2020-01-19','2021-01-19',813,47,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('ba981a66-66a7-4065-b0c7-f91498e2d25e','INCZ-486-1-0','d65ba740-a9a9-4da8-a43c-84c5ec8723d1','7f49280b-3271-4485-b014-824c9e8375fa','Incident','Déclaration de sinistre','2018-09-23','sante','eleve','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1feef840-2c5c-4567-be67-137181e317e3','QZ-486-2','7f49280b-3271-4485-b014-824c9e8375fa','auto',115,'2021-09-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('6fffdb80-fc02-4379-bbb8-dd584cc6324e','POLZ-486-2','7f49280b-3271-4485-b014-824c9e8375fa','1feef840-2c5c-4567-be67-137181e317e3','auto','2021-09-20','2022-09-20',515,0,'medium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('3bfd7d32-c7f7-4ee4-82eb-ef4d79fd65a2','user487@rich.com',crypt('test123', gen_salt('bf')),'client','2021-02-04');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('3bfd7d32-c7f7-4ee4-82eb-ef4d79fd65a2','Zo','Rakotomalala','Antananarivo','2021-02-04',55,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9ed1402b-9081-4f58-8610-b45d3d2ab731','QZ-487-0','3bfd7d32-c7f7-4ee4-82eb-ef4d79fd65a2','moto',369,'2024-05-18');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('c06f26d1-7954-4ba5-a53f-a5ae345fb785','POLZ-487-0','3bfd7d32-c7f7-4ee4-82eb-ef4d79fd65a2','9ed1402b-9081-4f58-8610-b45d3d2ab731','moto','2024-05-18','2025-05-18',768,37,'premium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('045c449c-d237-4fa2-869b-2a000476b16c','QZ-487-1','3bfd7d32-c7f7-4ee4-82eb-ef4d79fd65a2','auto',393,'2021-03-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('90844ece-6be6-4a42-9953-9961273fdd7a','POLZ-487-1','3bfd7d32-c7f7-4ee4-82eb-ef4d79fd65a2','045c449c-d237-4fa2-869b-2a000476b16c','auto','2021-03-30','2022-03-30',422,47,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('66581c79-017c-4c66-bceb-1b7b047a84b9','INCZ-487-1-0','90844ece-6be6-4a42-9953-9961273fdd7a','3bfd7d32-c7f7-4ee4-82eb-ef4d79fd65a2','Incident','Déclaration de sinistre','2020-05-07','auto','leger','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('4dd34f08-0816-4ecb-b04b-019f2888c4f4','INCZ-487-1-1','90844ece-6be6-4a42-9953-9961273fdd7a','3bfd7d32-c7f7-4ee4-82eb-ef4d79fd65a2','Incident','Déclaration de sinistre','2019-12-14','auto','eleve','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('4bd50d59-29f0-4182-b71e-5ba28073b3a1','QZ-487-2','3bfd7d32-c7f7-4ee4-82eb-ef4d79fd65a2','auto',959,'2025-02-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e7064f7b-1a9f-47c2-85fb-b5c165932747','POLZ-487-2','3bfd7d32-c7f7-4ee4-82eb-ef4d79fd65a2','4bd50d59-29f0-4182-b71e-5ba28073b3a1','auto','2025-02-23','2026-02-23',925,45,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('b3bcdf32-ab9e-498c-9bf3-185d5f80abfb','INCZ-487-2-0','e7064f7b-1a9f-47c2-85fb-b5c165932747','3bfd7d32-c7f7-4ee4-82eb-ef4d79fd65a2','Incident','Déclaration de sinistre','2023-02-06','auto','eleve','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('9d6461e6-0cf4-43ae-95f0-7b74e26f0b67','INCZ-487-2-1','e7064f7b-1a9f-47c2-85fb-b5c165932747','3bfd7d32-c7f7-4ee4-82eb-ef4d79fd65a2','Incident','Déclaration de sinistre','2024-05-24','auto','moyen','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('c087f6f5-162f-4573-8acf-8db8d9989d86','user488@rich.com',crypt('test123', gen_salt('bf')),'client','2020-07-31');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('c087f6f5-162f-4573-8acf-8db8d9989d86','Tovo','Andriamanitra','Antananarivo','2020-07-31',34,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('4b69ffa7-2d38-43d6-9eb9-8db3eb9f1389','QZ-488-0','c087f6f5-162f-4573-8acf-8db8d9989d86','auto',949,'2022-01-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('31a0bda2-db6e-4abe-bd53-48ebfa8c1cd4','POLZ-488-0','c087f6f5-162f-4573-8acf-8db8d9989d86','4b69ffa7-2d38-43d6-9eb9-8db3eb9f1389','auto','2022-01-19','2023-01-19',506,45,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('7adbf2df-dcd4-4d33-8933-0b1255532411','INCZ-488-0-0','31a0bda2-db6e-4abe-bd53-48ebfa8c1cd4','c087f6f5-162f-4573-8acf-8db8d9989d86','Incident','Déclaration de sinistre','2019-05-28','auto','moyen','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('55fdd40a-db5d-4c4a-b270-f5bc2e4f05cb','INCZ-488-0-1','31a0bda2-db6e-4abe-bd53-48ebfa8c1cd4','c087f6f5-162f-4573-8acf-8db8d9989d86','Incident','Déclaration de sinistre','2020-03-28','auto','moyen','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('eeaeb924-568a-406f-af4c-8ffc48ef9103','QZ-488-1','c087f6f5-162f-4573-8acf-8db8d9989d86','sante',104,'2018-06-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('235fb372-ba85-4619-b4d5-de341990585d','POLZ-488-1','c087f6f5-162f-4573-8acf-8db8d9989d86','eeaeb924-568a-406f-af4c-8ffc48ef9103','sante','2018-06-26','2019-06-26',621,9,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('1fa2ddcf-0f82-4dc0-9dde-62a093663fb5','INCZ-488-1-0','235fb372-ba85-4619-b4d5-de341990585d','c087f6f5-162f-4573-8acf-8db8d9989d86','Incident','Déclaration de sinistre','2019-12-03','sante','leger','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('1db754db-2345-40f6-8138-aed76faa00fd','user489@rich.com',crypt('test123', gen_salt('bf')),'client','2018-02-24');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('1db754db-2345-40f6-8138-aed76faa00fd','Tovo','Rajaona','Antananarivo','2018-02-24',70,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0b5a96e2-e100-4bf0-bd88-b9af4e3b2cd6','QZ-489-0','1db754db-2345-40f6-8138-aed76faa00fd','sante',177,'2021-05-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('4bf6ffc2-0fc5-455f-8944-5624b0bbfa5e','POLZ-489-0','1db754db-2345-40f6-8138-aed76faa00fd','0b5a96e2-e100-4bf0-bd88-b9af4e3b2cd6','sante','2021-05-17','2022-05-17',478,12,'basic','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('d5e455e8-18b0-4595-8ba9-39c7b8d39de0','user490@rich.com',crypt('test123', gen_salt('bf')),'client','2024-01-11');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('d5e455e8-18b0-4595-8ba9-39c7b8d39de0','Miora','Rakotomalala','Antananarivo','2024-01-11',12,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f313f769-9925-48d6-abd7-b80806a928f8','QZ-490-0','d5e455e8-18b0-4595-8ba9-39c7b8d39de0','moto',921,'2018-12-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e9813b9c-9d11-47b7-b3c2-e1d331bbca0d','POLZ-490-0','d5e455e8-18b0-4595-8ba9-39c7b8d39de0','f313f769-9925-48d6-abd7-b80806a928f8','moto','2018-12-24','2019-12-24',208,40,'premium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('2e7345ae-b5fd-4808-9dca-f3aabe13f06f','user491@rich.com',crypt('test123', gen_salt('bf')),'client','2023-11-03');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('2e7345ae-b5fd-4808-9dca-f3aabe13f06f','Mamy','Randriamanana','Antananarivo','2023-11-03',50,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1b051ff9-c795-4099-b34f-26f41cf0518c','QZ-491-0','2e7345ae-b5fd-4808-9dca-f3aabe13f06f','sante',635,'2024-11-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('75c8e47a-474f-487d-b532-9cf7d77fd38e','POLZ-491-0','2e7345ae-b5fd-4808-9dca-f3aabe13f06f','1b051ff9-c795-4099-b34f-26f41cf0518c','sante','2024-11-07','2025-11-07',287,13,'medium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('83db0334-0377-4fd6-af67-cc33530c6a8f','QZ-491-1','2e7345ae-b5fd-4808-9dca-f3aabe13f06f','sante',311,'2021-05-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f16f8f6a-9a4b-4f0f-be70-14d92daac6b1','POLZ-491-1','2e7345ae-b5fd-4808-9dca-f3aabe13f06f','83db0334-0377-4fd6-af67-cc33530c6a8f','sante','2021-05-16','2022-05-16',594,40,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('820330de-9bff-46f6-a0e0-86e06dbe668f','INCZ-491-1-0','f16f8f6a-9a4b-4f0f-be70-14d92daac6b1','2e7345ae-b5fd-4808-9dca-f3aabe13f06f','Incident','Déclaration de sinistre','2019-02-13','sante','leger','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('585d2005-568d-40ef-bddd-cf118050b2f3','user492@rich.com',crypt('test123', gen_salt('bf')),'client','2022-01-04');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('585d2005-568d-40ef-bddd-cf118050b2f3','Alex','Razaka','Antananarivo','2022-01-04',42,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('6f08edae-bf64-468a-a6d6-9be3bc9d35d1','QZ-492-0','585d2005-568d-40ef-bddd-cf118050b2f3','moto',748,'2023-12-18');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('93f0168c-3990-4187-bb50-5ad0c6977445','POLZ-492-0','585d2005-568d-40ef-bddd-cf118050b2f3','6f08edae-bf64-468a-a6d6-9be3bc9d35d1','moto','2023-12-18','2024-12-18',835,4,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('b30d57e6-b89c-42d8-ae27-acce5af5a615','INCZ-492-0-0','93f0168c-3990-4187-bb50-5ad0c6977445','585d2005-568d-40ef-bddd-cf118050b2f3','Incident','Déclaration de sinistre','2022-12-14','moto','leger','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('af5c9933-46c2-4a2a-a41c-4ab63e01d900','user493@rich.com',crypt('test123', gen_salt('bf')),'client','2021-06-04');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('af5c9933-46c2-4a2a-a41c-4ab63e01d900','Hery','Rakotomalala','Antananarivo','2021-06-04',82,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e82ec62a-4e66-44e3-a7d6-b192ba6a3069','QZ-493-0','af5c9933-46c2-4a2a-a41c-4ab63e01d900','sante',429,'2023-03-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('946ef70c-431b-4c13-9963-936bc649425a','POLZ-493-0','af5c9933-46c2-4a2a-a41c-4ab63e01d900','e82ec62a-4e66-44e3-a7d6-b192ba6a3069','sante','2023-03-03','2024-03-03',546,34,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('5e55683d-9cb5-4c51-8dd6-44899974c885','INCZ-493-0-0','946ef70c-431b-4c13-9963-936bc649425a','af5c9933-46c2-4a2a-a41c-4ab63e01d900','Incident','Déclaration de sinistre','2023-01-20','sante','eleve','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('5968de2e-8e97-4553-b2bf-d71fa407a04b','QZ-493-1','af5c9933-46c2-4a2a-a41c-4ab63e01d900','sante',184,'2025-08-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('97e86824-43e9-4472-a93c-b92c7bb725bd','POLZ-493-1','af5c9933-46c2-4a2a-a41c-4ab63e01d900','5968de2e-8e97-4553-b2bf-d71fa407a04b','sante','2025-08-13','2026-08-13',586,16,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('0082ccb8-d32e-4fd6-b831-78a80d6d5457','INCZ-493-1-0','97e86824-43e9-4472-a93c-b92c7bb725bd','af5c9933-46c2-4a2a-a41c-4ab63e01d900','Incident','Déclaration de sinistre','2021-07-22','sante','moyen','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('05e0d854-da54-4180-861b-feaf119b1ec3','INCZ-493-1-1','97e86824-43e9-4472-a93c-b92c7bb725bd','af5c9933-46c2-4a2a-a41c-4ab63e01d900','Incident','Déclaration de sinistre','2023-01-15','sante','moyen','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('b9141f25-7635-445f-86d1-13417136f41b','user494@rich.com',crypt('test123', gen_salt('bf')),'client','2023-01-04');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('b9141f25-7635-445f-86d1-13417136f41b','Bryan','Rakotomalala','Antananarivo','2023-01-04',41,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('50463da5-5e7e-4e4a-ac0f-2d2de5f09262','QZ-494-0','b9141f25-7635-445f-86d1-13417136f41b','sante',210,'2025-03-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('7e222d49-bba5-4f7e-94f0-3c6236a6c8ae','POLZ-494-0','b9141f25-7635-445f-86d1-13417136f41b','50463da5-5e7e-4e4a-ac0f-2d2de5f09262','sante','2025-03-08','2026-03-08',862,3,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('6735d807-edb3-4887-847e-a82eacc008e2','INCZ-494-0-0','7e222d49-bba5-4f7e-94f0-3c6236a6c8ae','b9141f25-7635-445f-86d1-13417136f41b','Incident','Déclaration de sinistre','2020-01-20','sante','eleve','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('659d6d3e-61e4-4ba5-80bf-ae665ff02679','user495@rich.com',crypt('test123', gen_salt('bf')),'client','2025-10-16');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('659d6d3e-61e4-4ba5-80bf-ae665ff02679','Miora','Ravelona','Antananarivo','2025-10-16',47,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('78d8c73c-9678-464d-8453-124d7312363a','QZ-495-0','659d6d3e-61e4-4ba5-80bf-ae665ff02679','auto',188,'2020-10-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('00a59fef-67ae-44c5-a64b-d249e5c1a738','POLZ-495-0','659d6d3e-61e4-4ba5-80bf-ae665ff02679','78d8c73c-9678-464d-8453-124d7312363a','auto','2020-10-27','2021-10-27',850,45,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('365431dd-4c82-439e-bdaa-6eedf1e8b4a8','INCZ-495-0-0','00a59fef-67ae-44c5-a64b-d249e5c1a738','659d6d3e-61e4-4ba5-80bf-ae665ff02679','Incident','Déclaration de sinistre','2018-11-14','auto','moyen','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a3a6c79a-11be-4dfa-be98-6f9ccf1758cd','QZ-495-1','659d6d3e-61e4-4ba5-80bf-ae665ff02679','moto',482,'2025-12-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('fcb1c114-faf9-41e7-a6ef-16f68a9adbc4','POLZ-495-1','659d6d3e-61e4-4ba5-80bf-ae665ff02679','a3a6c79a-11be-4dfa-be98-6f9ccf1758cd','moto','2025-12-30','2026-12-30',940,42,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('4e832df8-0e95-4177-a5b2-36de96269d56','INCZ-495-1-0','fcb1c114-faf9-41e7-a6ef-16f68a9adbc4','659d6d3e-61e4-4ba5-80bf-ae665ff02679','Incident','Déclaration de sinistre','2024-12-14','moto','moyen','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('cdd965c8-4d68-48a3-9e29-c5f073012082','QZ-495-2','659d6d3e-61e4-4ba5-80bf-ae665ff02679','auto',460,'2024-03-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('569c299d-1d82-4018-95b7-16e10e5654ae','POLZ-495-2','659d6d3e-61e4-4ba5-80bf-ae665ff02679','cdd965c8-4d68-48a3-9e29-c5f073012082','auto','2024-03-12','2025-03-12',191,40,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('01e38aa2-d830-4c21-afd9-61ed44e9b40e','INCZ-495-2-0','569c299d-1d82-4018-95b7-16e10e5654ae','659d6d3e-61e4-4ba5-80bf-ae665ff02679','Incident','Déclaration de sinistre','2020-12-02','auto','leger','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('4bb19f0d-83c1-4fd4-aef9-6d8ea7132eee','INCZ-495-2-1','569c299d-1d82-4018-95b7-16e10e5654ae','659d6d3e-61e4-4ba5-80bf-ae665ff02679','Incident','Déclaration de sinistre','2024-10-13','auto','leger','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('3de8197d-8cb5-45bc-9afa-f5f51b8abcb0','user496@rich.com',crypt('test123', gen_salt('bf')),'client','2022-09-15');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('3de8197d-8cb5-45bc-9afa-f5f51b8abcb0','Clara','Rajaona','Antananarivo','2022-09-15',93,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('384caadd-6d91-4b9f-8000-3a0efa1680f1','QZ-496-0','3de8197d-8cb5-45bc-9afa-f5f51b8abcb0','moto',863,'2018-11-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('15e3e6e1-30ea-4a06-a8b4-e6691a9355bf','POLZ-496-0','3de8197d-8cb5-45bc-9afa-f5f51b8abcb0','384caadd-6d91-4b9f-8000-3a0efa1680f1','moto','2018-11-13','2019-11-13',84,45,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('9e7c264b-1ae8-4deb-8d38-fc4d1795ed41','INCZ-496-0-0','15e3e6e1-30ea-4a06-a8b4-e6691a9355bf','3de8197d-8cb5-45bc-9afa-f5f51b8abcb0','Incident','Déclaration de sinistre','2019-11-01','moto','eleve','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('50106b59-55a5-471e-a51f-4e25ef45d8fb','INCZ-496-0-1','15e3e6e1-30ea-4a06-a8b4-e6691a9355bf','3de8197d-8cb5-45bc-9afa-f5f51b8abcb0','Incident','Déclaration de sinistre','2021-03-03','moto','leger','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0f120479-3b3a-44ab-9bd5-08ea0f0cd3a9','QZ-496-1','3de8197d-8cb5-45bc-9afa-f5f51b8abcb0','sante',476,'2018-10-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('3d8ec37f-d199-4f77-a2a7-a9c83c64b086','POLZ-496-1','3de8197d-8cb5-45bc-9afa-f5f51b8abcb0','0f120479-3b3a-44ab-9bd5-08ea0f0cd3a9','sante','2018-10-11','2019-10-11',524,11,'basic','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('08c111f3-2ff3-4719-a1d6-f0f74f2e5614','user497@rich.com',crypt('test123', gen_salt('bf')),'client','2024-12-29');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('08c111f3-2ff3-4719-a1d6-f0f74f2e5614','Mamy','Razaka','Antananarivo','2024-12-29',60,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ecaa3b45-e24a-4927-b0b4-a9d06e24b073','QZ-497-0','08c111f3-2ff3-4719-a1d6-f0f74f2e5614','moto',122,'2018-09-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('954f87df-a3e4-4c2e-a2ce-f0b31ae726cd','POLZ-497-0','08c111f3-2ff3-4719-a1d6-f0f74f2e5614','ecaa3b45-e24a-4927-b0b4-a9d06e24b073','moto','2018-09-06','2019-09-06',754,7,'medium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e68c9ad5-c643-4266-b28d-c190a456d087','QZ-497-1','08c111f3-2ff3-4719-a1d6-f0f74f2e5614','auto',673,'2021-07-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('01588e1e-a739-4bc0-8666-bdad5376c363','POLZ-497-1','08c111f3-2ff3-4719-a1d6-f0f74f2e5614','e68c9ad5-c643-4266-b28d-c190a456d087','auto','2021-07-19','2022-07-19',377,19,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('7c9cf03d-2cfd-44d4-8164-7806629edb44','INCZ-497-1-0','01588e1e-a739-4bc0-8666-bdad5376c363','08c111f3-2ff3-4719-a1d6-f0f74f2e5614','Incident','Déclaration de sinistre','2022-06-04','auto','leger','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('845cdd04-655f-4c74-b3b5-04025ffc6f7c','QZ-497-2','08c111f3-2ff3-4719-a1d6-f0f74f2e5614','auto',841,'2025-06-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('86b98224-870a-4c85-86ec-15a804bf6ab4','POLZ-497-2','08c111f3-2ff3-4719-a1d6-f0f74f2e5614','845cdd04-655f-4c74-b3b5-04025ffc6f7c','auto','2025-06-03','2026-06-03',374,28,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('48201648-85f7-4661-ae1a-aab540ce3ab5','INCZ-497-2-0','86b98224-870a-4c85-86ec-15a804bf6ab4','08c111f3-2ff3-4719-a1d6-f0f74f2e5614','Incident','Déclaration de sinistre','2023-10-27','auto','eleve','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('845e7296-5a39-4d33-ba48-737b133b1e18','user498@rich.com',crypt('test123', gen_salt('bf')),'client','2021-05-05');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('845e7296-5a39-4d33-ba48-737b133b1e18','Mamy','Andriamanitra','Antananarivo','2021-05-05',28,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('34444449-21f4-4be2-abf8-4c187077336b','QZ-498-0','845e7296-5a39-4d33-ba48-737b133b1e18','auto',345,'2019-02-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('c6aa16d3-73ce-4d6b-bc32-38b0c2058aa4','POLZ-498-0','845e7296-5a39-4d33-ba48-737b133b1e18','34444449-21f4-4be2-abf8-4c187077336b','auto','2019-02-06','2020-02-06',549,37,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('bb86acef-797b-4493-95f6-ce8eb51051f9','INCZ-498-0-0','c6aa16d3-73ce-4d6b-bc32-38b0c2058aa4','845e7296-5a39-4d33-ba48-737b133b1e18','Incident','Déclaration de sinistre','2025-11-11','auto','eleve','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c365f64c-8fff-44a7-a3b0-59d355aeb491','QZ-498-1','845e7296-5a39-4d33-ba48-737b133b1e18','sante',355,'2018-12-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e80c5d54-fc89-481f-8c88-45ff8525e35e','POLZ-498-1','845e7296-5a39-4d33-ba48-737b133b1e18','c365f64c-8fff-44a7-a3b0-59d355aeb491','sante','2018-12-24','2019-12-24',320,18,'premium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('468d6355-9770-49fc-b3e2-0d16534db667','user499@rich.com',crypt('test123', gen_salt('bf')),'client','2025-09-12');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('468d6355-9770-49fc-b3e2-0d16534db667','Clara','Rakotonirina','Antananarivo','2025-09-12',43,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9913f20e-25bf-4357-8390-ca3b5de81f2b','QZ-499-0','468d6355-9770-49fc-b3e2-0d16534db667','auto',433,'2023-02-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('bc0bc3c4-c283-4391-b62c-83799f49b88f','POLZ-499-0','468d6355-9770-49fc-b3e2-0d16534db667','9913f20e-25bf-4357-8390-ca3b5de81f2b','auto','2023-02-17','2024-02-17',651,14,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('a279eeba-2ada-4393-80e1-6f2bec806a77','INCZ-499-0-0','bc0bc3c4-c283-4391-b62c-83799f49b88f','468d6355-9770-49fc-b3e2-0d16534db667','Incident','Déclaration de sinistre','2025-12-13','auto','leger','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('1bf40091-9810-4816-9c45-f3473f9942ab','INCZ-499-0-1','bc0bc3c4-c283-4391-b62c-83799f49b88f','468d6355-9770-49fc-b3e2-0d16534db667','Incident','Déclaration de sinistre','2025-09-11','auto','eleve','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b3a60c12-a215-4635-b2dc-dd5042565125','QZ-499-1','468d6355-9770-49fc-b3e2-0d16534db667','moto',792,'2025-11-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('fc4e0a44-2f6e-426d-ba38-a662ab043610','POLZ-499-1','468d6355-9770-49fc-b3e2-0d16534db667','b3a60c12-a215-4635-b2dc-dd5042565125','moto','2025-11-21','2026-11-21',85,43,'premium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('0ff1411c-cc96-450d-a429-b417d8df0e56','user500@rich.com',crypt('test123', gen_salt('bf')),'client','2025-08-05');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('0ff1411c-cc96-450d-a429-b417d8df0e56','Mamy','Rakotonirina','Antananarivo','2025-08-05',66,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3203f2e8-af10-4c3a-8402-9fc0289c131d','QZ-500-0','0ff1411c-cc96-450d-a429-b417d8df0e56','sante',797,'2024-04-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('1dfee163-6496-4fdc-b7a3-96cb4a6a5167','POLZ-500-0','0ff1411c-cc96-450d-a429-b417d8df0e56','3203f2e8-af10-4c3a-8402-9fc0289c131d','sante','2024-04-25','2025-04-25',294,23,'basic','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1d6c6e6f-2465-45a5-945f-413ff278794b','QZ-500-1','0ff1411c-cc96-450d-a429-b417d8df0e56','sante',683,'2024-04-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('4588797d-68c6-40ce-aeb1-c48125f8fd7c','POLZ-500-1','0ff1411c-cc96-450d-a429-b417d8df0e56','1d6c6e6f-2465-45a5-945f-413ff278794b','sante','2024-04-01','2025-04-01',318,4,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('9baaacc3-4abf-4669-954f-be09d5106c6d','INCZ-500-1-0','4588797d-68c6-40ce-aeb1-c48125f8fd7c','0ff1411c-cc96-450d-a429-b417d8df0e56','Incident','Déclaration de sinistre','2025-07-01','sante','leger','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('66f86b86-bbd1-4be9-8b9e-7e2490d66899','user501@rich.com',crypt('test123', gen_salt('bf')),'client','2020-07-16');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('66f86b86-bbd1-4be9-8b9e-7e2490d66899','Nantenaina','Rakotonirina','Antananarivo','2020-07-16',41,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1b1cbda3-3cc0-480b-8a5d-ee972c25ad4e','QZ-501-0','66f86b86-bbd1-4be9-8b9e-7e2490d66899','sante',462,'2023-04-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('7e0af0e3-eab0-40e2-8070-117d8a74dd77','POLZ-501-0','66f86b86-bbd1-4be9-8b9e-7e2490d66899','1b1cbda3-3cc0-480b-8a5d-ee972c25ad4e','sante','2023-04-14','2024-04-14',864,39,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('58ef06a5-0f9b-4d10-8545-c6588c6fe35d','INCZ-501-0-0','7e0af0e3-eab0-40e2-8070-117d8a74dd77','66f86b86-bbd1-4be9-8b9e-7e2490d66899','Incident','Déclaration de sinistre','2024-10-14','sante','moyen','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('72981677-394e-4a05-ab30-39474fbde983','QZ-501-1','66f86b86-bbd1-4be9-8b9e-7e2490d66899','moto',93,'2023-11-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('1d308f83-ad14-4dfb-8472-022836eb6284','POLZ-501-1','66f86b86-bbd1-4be9-8b9e-7e2490d66899','72981677-394e-4a05-ab30-39474fbde983','moto','2023-11-20','2024-11-20',171,35,'premium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('90f28541-c490-45a4-bcfe-076422b4e531','QZ-501-2','66f86b86-bbd1-4be9-8b9e-7e2490d66899','auto',823,'2024-05-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5b8e104d-9ef2-4676-ade8-7875a3c44dc8','POLZ-501-2','66f86b86-bbd1-4be9-8b9e-7e2490d66899','90f28541-c490-45a4-bcfe-076422b4e531','auto','2024-05-10','2025-05-10',101,48,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('f142d2b1-2adb-4951-80e3-e2024d267a52','INCZ-501-2-0','5b8e104d-9ef2-4676-ade8-7875a3c44dc8','66f86b86-bbd1-4be9-8b9e-7e2490d66899','Incident','Déclaration de sinistre','2021-11-05','auto','moyen','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('a99ad464-c069-4456-b8ec-69f05ad30bf9','INCZ-501-2-1','5b8e104d-9ef2-4676-ade8-7875a3c44dc8','66f86b86-bbd1-4be9-8b9e-7e2490d66899','Incident','Déclaration de sinistre','2021-05-19','auto','moyen','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('8e3cad97-4f4b-4645-b0ee-092ec2aca64c','user502@rich.com',crypt('test123', gen_salt('bf')),'client','2020-03-05');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('8e3cad97-4f4b-4645-b0ee-092ec2aca64c','Hery','Randriamanana','Antananarivo','2020-03-05',19,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d61bd05b-1820-444b-b8db-ec6593e80a28','QZ-502-0','8e3cad97-4f4b-4645-b0ee-092ec2aca64c','sante',726,'2019-09-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e2eb76fd-c515-4ecd-8daf-ada48c6a65a5','POLZ-502-0','8e3cad97-4f4b-4645-b0ee-092ec2aca64c','d61bd05b-1820-444b-b8db-ec6593e80a28','sante','2019-09-14','2020-09-14',364,39,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('8b1a304b-fe59-4ea4-863b-8be03e3d2879','INCZ-502-0-0','e2eb76fd-c515-4ecd-8daf-ada48c6a65a5','8e3cad97-4f4b-4645-b0ee-092ec2aca64c','Incident','Déclaration de sinistre','2021-03-19','sante','eleve','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('1adc3de9-1de5-4031-b4df-9f2c1d593e7c','user503@rich.com',crypt('test123', gen_salt('bf')),'client','2022-12-05');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('1adc3de9-1de5-4031-b4df-9f2c1d593e7c','Mamy','Rakotonirina','Antananarivo','2022-12-05',22,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ddcafcdd-534a-490f-985e-9b2457aa539d','QZ-503-0','1adc3de9-1de5-4031-b4df-9f2c1d593e7c','sante',797,'2019-03-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('008c6fda-8a87-4a25-a7ab-021d05652d94','POLZ-503-0','1adc3de9-1de5-4031-b4df-9f2c1d593e7c','ddcafcdd-534a-490f-985e-9b2457aa539d','sante','2019-03-21','2020-03-21',656,31,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('d80f7f24-0115-48d8-a2b5-a811cbbf7f90','INCZ-503-0-0','008c6fda-8a87-4a25-a7ab-021d05652d94','1adc3de9-1de5-4031-b4df-9f2c1d593e7c','Incident','Déclaration de sinistre','2019-11-13','sante','moyen','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('b84c844b-93af-415e-a58f-42dd99763489','INCZ-503-0-1','008c6fda-8a87-4a25-a7ab-021d05652d94','1adc3de9-1de5-4031-b4df-9f2c1d593e7c','Incident','Déclaration de sinistre','2023-05-26','sante','leger','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('18586c0f-5615-4937-b507-684a060bd6b7','QZ-503-1','1adc3de9-1de5-4031-b4df-9f2c1d593e7c','moto',862,'2023-06-18');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('3d7eb185-f429-40a6-8f47-e56c4355e9a9','POLZ-503-1','1adc3de9-1de5-4031-b4df-9f2c1d593e7c','18586c0f-5615-4937-b507-684a060bd6b7','moto','2023-06-18','2024-06-18',774,36,'premium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('22761c59-bce4-40fc-85d6-40c27149a4b8','QZ-503-2','1adc3de9-1de5-4031-b4df-9f2c1d593e7c','moto',234,'2023-10-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('c42ed7bc-8dd9-4371-9b11-13ddbb2e8d65','POLZ-503-2','1adc3de9-1de5-4031-b4df-9f2c1d593e7c','22761c59-bce4-40fc-85d6-40c27149a4b8','moto','2023-10-22','2024-10-22',625,34,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('2f50bd6b-784b-478c-a7e2-70e8ce6dfa61','INCZ-503-2-0','c42ed7bc-8dd9-4371-9b11-13ddbb2e8d65','1adc3de9-1de5-4031-b4df-9f2c1d593e7c','Incident','Déclaration de sinistre','2021-02-18','moto','eleve','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('199d6f08-886f-46e9-b81d-65aefd29d21e','INCZ-503-2-1','c42ed7bc-8dd9-4371-9b11-13ddbb2e8d65','1adc3de9-1de5-4031-b4df-9f2c1d593e7c','Incident','Déclaration de sinistre','2020-02-23','moto','eleve','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ec21cba8-c3c8-4432-96e2-225b4655123a','user504@rich.com',crypt('test123', gen_salt('bf')),'client','2020-05-04');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('ec21cba8-c3c8-4432-96e2-225b4655123a','Clara','Rakotomalala','Antananarivo','2020-05-04',82,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3bc61534-61a4-41a9-8442-81c20ec981b5','QZ-504-0','ec21cba8-c3c8-4432-96e2-225b4655123a','sante',888,'2022-06-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('26e3e041-739b-4f9d-a3ec-600b4d952849','POLZ-504-0','ec21cba8-c3c8-4432-96e2-225b4655123a','3bc61534-61a4-41a9-8442-81c20ec981b5','sante','2022-06-01','2023-06-01',272,35,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('6d620889-6464-4ffc-964a-102d69549cfa','INCZ-504-0-0','26e3e041-739b-4f9d-a3ec-600b4d952849','ec21cba8-c3c8-4432-96e2-225b4655123a','Incident','Déclaration de sinistre','2025-07-07','sante','leger','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('b6b74e38-3356-4653-b760-7889fbdb123f','user505@rich.com',crypt('test123', gen_salt('bf')),'client','2019-12-02');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('b6b74e38-3356-4653-b760-7889fbdb123f','Nantenaina','Ravelona','Antananarivo','2019-12-02',92,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('94bdc705-cd1c-4ede-8552-490fd71626df','QZ-505-0','b6b74e38-3356-4653-b760-7889fbdb123f','auto',480,'2023-02-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e4b59619-46fc-4366-87fa-f6f9ddde5022','POLZ-505-0','b6b74e38-3356-4653-b760-7889fbdb123f','94bdc705-cd1c-4ede-8552-490fd71626df','auto','2023-02-19','2024-02-19',757,39,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('dc8cb4ba-7314-4aab-9931-5ecb40b9a8a7','INCZ-505-0-0','e4b59619-46fc-4366-87fa-f6f9ddde5022','b6b74e38-3356-4653-b760-7889fbdb123f','Incident','Déclaration de sinistre','2023-10-13','auto','moyen','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('fa5dd752-9be0-4e36-9c1a-981b1206a6d3','QZ-505-1','b6b74e38-3356-4653-b760-7889fbdb123f','moto',210,'2020-02-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('c5b6fa42-3aa1-49a9-9aa7-b0cedc801408','POLZ-505-1','b6b74e38-3356-4653-b760-7889fbdb123f','fa5dd752-9be0-4e36-9c1a-981b1206a6d3','moto','2020-02-01','2021-02-01',670,18,'basic','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('00f33c1b-cbef-4e3f-8347-5d3c8dd5f8ab','user506@rich.com',crypt('test123', gen_salt('bf')),'client','2025-11-11');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('00f33c1b-cbef-4e3f-8347-5d3c8dd5f8ab','Bryan','Rakotomalala','Antananarivo','2025-11-11',16,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7f6742ba-2874-4a6b-ab38-6777a68ec0f1','QZ-506-0','00f33c1b-cbef-4e3f-8347-5d3c8dd5f8ab','sante',627,'2022-05-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('c5378eef-8b91-47e7-9a17-2461e9027113','POLZ-506-0','00f33c1b-cbef-4e3f-8347-5d3c8dd5f8ab','7f6742ba-2874-4a6b-ab38-6777a68ec0f1','sante','2022-05-28','2023-05-28',844,21,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('e79dd88f-3a09-4659-b5cb-0e213247d77b','INCZ-506-0-0','c5378eef-8b91-47e7-9a17-2461e9027113','00f33c1b-cbef-4e3f-8347-5d3c8dd5f8ab','Incident','Déclaration de sinistre','2018-01-10','sante','moyen','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('b797c14d-521c-4ea9-90de-79ab7fc5d76a','INCZ-506-0-1','c5378eef-8b91-47e7-9a17-2461e9027113','00f33c1b-cbef-4e3f-8347-5d3c8dd5f8ab','Incident','Déclaration de sinistre','2020-11-03','sante','eleve','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('8c0a8f62-cc9f-443f-915a-a260cc829105','user507@rich.com',crypt('test123', gen_salt('bf')),'client','2020-12-03');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('8c0a8f62-cc9f-443f-915a-a260cc829105','Clara','Ravelona','Antananarivo','2020-12-03',18,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8f2a3f25-61b3-4934-9c80-8cdc9a420502','QZ-507-0','8c0a8f62-cc9f-443f-915a-a260cc829105','moto',342,'2020-02-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('525888e0-00cf-4e0b-804b-c6fe50f4e84d','POLZ-507-0','8c0a8f62-cc9f-443f-915a-a260cc829105','8f2a3f25-61b3-4934-9c80-8cdc9a420502','moto','2020-02-16','2021-02-16',137,3,'premium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('563b2cf0-c0ba-4661-b5b4-21f65b2d342b','user508@rich.com',crypt('test123', gen_salt('bf')),'client','2026-03-11');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('563b2cf0-c0ba-4661-b5b4-21f65b2d342b','Alex','Randriamanana','Antananarivo','2026-03-11',27,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('76501193-6b72-4d89-ab69-2234a11e6933','QZ-508-0','563b2cf0-c0ba-4661-b5b4-21f65b2d342b','sante',382,'2022-02-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('86c71c78-bda9-40ec-85ec-f715a4de4a32','POLZ-508-0','563b2cf0-c0ba-4661-b5b4-21f65b2d342b','76501193-6b72-4d89-ab69-2234a11e6933','sante','2022-02-17','2023-02-17',891,12,'basic','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('bc85385c-8211-45b9-bee6-36dc4decc146','QZ-508-1','563b2cf0-c0ba-4661-b5b4-21f65b2d342b','auto',273,'2022-07-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5cea7620-13ca-4889-933e-76c36bd031c0','POLZ-508-1','563b2cf0-c0ba-4661-b5b4-21f65b2d342b','bc85385c-8211-45b9-bee6-36dc4decc146','auto','2022-07-16','2023-07-16',185,45,'premium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('fb6026a3-86ed-4b44-86a9-9cb32cdfa624','user509@rich.com',crypt('test123', gen_salt('bf')),'client','2020-08-03');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('fb6026a3-86ed-4b44-86a9-9cb32cdfa624','Mamy','Ravelona','Antananarivo','2020-08-03',94,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('45b1d776-53a1-4a87-bca8-4f3e19c0fa66','QZ-509-0','fb6026a3-86ed-4b44-86a9-9cb32cdfa624','sante',816,'2024-04-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('38b004e8-bf91-498d-8737-62f3f088cdb2','POLZ-509-0','fb6026a3-86ed-4b44-86a9-9cb32cdfa624','45b1d776-53a1-4a87-bca8-4f3e19c0fa66','sante','2024-04-22','2025-04-22',847,26,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('168ee84a-c5ac-4d77-a25a-387a70d4693e','INCZ-509-0-0','38b004e8-bf91-498d-8737-62f3f088cdb2','fb6026a3-86ed-4b44-86a9-9cb32cdfa624','Incident','Déclaration de sinistre','2024-08-19','sante','leger','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('50244c04-cf19-4c46-8a8f-8bfe54b35cd6','INCZ-509-0-1','38b004e8-bf91-498d-8737-62f3f088cdb2','fb6026a3-86ed-4b44-86a9-9cb32cdfa624','Incident','Déclaration de sinistre','2023-03-01','sante','leger','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f827f712-f949-42f4-8bd5-d1df3438cdc9','QZ-509-1','fb6026a3-86ed-4b44-86a9-9cb32cdfa624','moto',766,'2024-08-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('0ab4d48e-ed6a-493c-ba07-261bce0b9df9','POLZ-509-1','fb6026a3-86ed-4b44-86a9-9cb32cdfa624','f827f712-f949-42f4-8bd5-d1df3438cdc9','moto','2024-08-11','2025-08-11',872,40,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('11b4ce06-b195-4101-9ce7-c98df0e997e6','INCZ-509-1-0','0ab4d48e-ed6a-493c-ba07-261bce0b9df9','fb6026a3-86ed-4b44-86a9-9cb32cdfa624','Incident','Déclaration de sinistre','2020-06-02','moto','moyen','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('37eddf55-662a-4b9a-82af-5d5f9f4c261f','user510@rich.com',crypt('test123', gen_salt('bf')),'client','2018-05-14');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('37eddf55-662a-4b9a-82af-5d5f9f4c261f','Alex','Razaka','Antananarivo','2018-05-14',36,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('4b4d606a-1724-4a7a-98de-40aa38b2d9c8','QZ-510-0','37eddf55-662a-4b9a-82af-5d5f9f4c261f','sante',154,'2018-05-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('1c06aa33-df10-402c-a214-cf21e1723d86','POLZ-510-0','37eddf55-662a-4b9a-82af-5d5f9f4c261f','4b4d606a-1724-4a7a-98de-40aa38b2d9c8','sante','2018-05-12','2019-05-12',638,45,'medium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('52de3642-ed70-4a70-bf09-90ca571a89b0','QZ-510-1','37eddf55-662a-4b9a-82af-5d5f9f4c261f','sante',179,'2020-10-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('652d9b9f-2cf6-45a2-a698-d6e31174afa9','POLZ-510-1','37eddf55-662a-4b9a-82af-5d5f9f4c261f','52de3642-ed70-4a70-bf09-90ca571a89b0','sante','2020-10-19','2021-10-19',662,27,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('d7702f30-2f80-4852-8b79-ac530aef4afb','INCZ-510-1-0','652d9b9f-2cf6-45a2-a698-d6e31174afa9','37eddf55-662a-4b9a-82af-5d5f9f4c261f','Incident','Déclaration de sinistre','2021-01-03','sante','moyen','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1bc75c94-2235-40f5-821d-f16e8860aee8','QZ-510-2','37eddf55-662a-4b9a-82af-5d5f9f4c261f','sante',222,'2021-04-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5e24f0df-a98e-4018-93cf-ce0d8fd6b433','POLZ-510-2','37eddf55-662a-4b9a-82af-5d5f9f4c261f','1bc75c94-2235-40f5-821d-f16e8860aee8','sante','2021-04-17','2022-04-17',938,2,'basic','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('119ff1d9-fb52-4776-9187-bd2aec203340','user511@rich.com',crypt('test123', gen_salt('bf')),'client','2019-06-07');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('119ff1d9-fb52-4776-9187-bd2aec203340','Alex','Rakotomalala','Antananarivo','2019-06-07',64,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('abac9ba2-f470-4df5-ab73-e98e4805db91','QZ-511-0','119ff1d9-fb52-4776-9187-bd2aec203340','sante',958,'2022-08-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('d60c7fe1-b2a5-4a11-9fcb-d2680da1d181','POLZ-511-0','119ff1d9-fb52-4776-9187-bd2aec203340','abac9ba2-f470-4df5-ab73-e98e4805db91','sante','2022-08-05','2023-08-05',529,47,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('1da0560e-5722-4564-b15e-a062bbb09070','INCZ-511-0-0','d60c7fe1-b2a5-4a11-9fcb-d2680da1d181','119ff1d9-fb52-4776-9187-bd2aec203340','Incident','Déclaration de sinistre','2025-05-25','sante','eleve','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3273c1f7-e977-4819-8d9a-3a1b1b367ed6','QZ-511-1','119ff1d9-fb52-4776-9187-bd2aec203340','auto',924,'2021-05-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('d59998dd-2404-46b9-9829-dc05a197d054','POLZ-511-1','119ff1d9-fb52-4776-9187-bd2aec203340','3273c1f7-e977-4819-8d9a-3a1b1b367ed6','auto','2021-05-28','2022-05-28',423,48,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('d548a22b-9d8a-4010-ba0a-7071de6a9e6f','INCZ-511-1-0','d59998dd-2404-46b9-9829-dc05a197d054','119ff1d9-fb52-4776-9187-bd2aec203340','Incident','Déclaration de sinistre','2018-01-16','auto','eleve','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('0c011df2-1bc6-43d3-a9a4-257f7cd63306','user512@rich.com',crypt('test123', gen_salt('bf')),'client','2022-02-02');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('0c011df2-1bc6-43d3-a9a4-257f7cd63306','Clara','Rakotomalala','Antananarivo','2022-02-02',50,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('83c2d4a0-8bca-4bba-b92c-726473a4571b','QZ-512-0','0c011df2-1bc6-43d3-a9a4-257f7cd63306','sante',54,'2024-09-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('a3a2b24c-6c59-4d50-abc9-ff314d21d91d','POLZ-512-0','0c011df2-1bc6-43d3-a9a4-257f7cd63306','83c2d4a0-8bca-4bba-b92c-726473a4571b','sante','2024-09-12','2025-09-12',114,24,'premium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7c38bf17-220b-4959-b0d8-c8e44f89eefa','QZ-512-1','0c011df2-1bc6-43d3-a9a4-257f7cd63306','auto',545,'2024-07-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f05e7012-1bf5-465c-86d3-2fbd534e08f1','POLZ-512-1','0c011df2-1bc6-43d3-a9a4-257f7cd63306','7c38bf17-220b-4959-b0d8-c8e44f89eefa','auto','2024-07-20','2025-07-20',449,27,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('b347348a-1b25-401f-baf4-597210b73833','INCZ-512-1-0','f05e7012-1bf5-465c-86d3-2fbd534e08f1','0c011df2-1bc6-43d3-a9a4-257f7cd63306','Incident','Déclaration de sinistre','2021-05-04','auto','leger','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('925751de-af58-4506-870d-bdcf550ea127','user513@rich.com',crypt('test123', gen_salt('bf')),'client','2024-12-12');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('925751de-af58-4506-870d-bdcf550ea127','Mamy','Rakotomalala','Antananarivo','2024-12-12',40,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('90372c21-daa5-4ed2-b2df-497060d8995b','QZ-513-0','925751de-af58-4506-870d-bdcf550ea127','moto',342,'2025-10-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f666b8fa-b868-4ea2-90ec-1e845ee3aad6','POLZ-513-0','925751de-af58-4506-870d-bdcf550ea127','90372c21-daa5-4ed2-b2df-497060d8995b','moto','2025-10-14','2026-10-14',366,19,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('0491290b-50ea-4c3d-ada3-3270157aaa23','INCZ-513-0-0','f666b8fa-b868-4ea2-90ec-1e845ee3aad6','925751de-af58-4506-870d-bdcf550ea127','Incident','Déclaration de sinistre','2021-12-18','moto','moyen','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e2f506e5-7bad-4f07-8cc6-67fc77e03ad1','QZ-513-1','925751de-af58-4506-870d-bdcf550ea127','sante',187,'2019-06-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('0e6fb424-3264-4954-8ed0-e7ae1d0e8c77','POLZ-513-1','925751de-af58-4506-870d-bdcf550ea127','e2f506e5-7bad-4f07-8cc6-67fc77e03ad1','sante','2019-06-01','2020-06-01',73,41,'premium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('45032032-9545-4453-967f-4b9d93e25f70','QZ-513-2','925751de-af58-4506-870d-bdcf550ea127','sante',383,'2025-06-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('ea83bb5e-8dad-4309-a77f-533b1794a788','POLZ-513-2','925751de-af58-4506-870d-bdcf550ea127','45032032-9545-4453-967f-4b9d93e25f70','sante','2025-06-09','2026-06-09',609,1,'premium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('2d11673b-90c8-4c24-b0c4-fdb88021ab8e','user514@rich.com',crypt('test123', gen_salt('bf')),'client','2019-02-13');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('2d11673b-90c8-4c24-b0c4-fdb88021ab8e','Miora','Randriamanana','Antananarivo','2019-02-13',27,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a083a60d-3ff3-4836-b928-bdafb2823be5','QZ-514-0','2d11673b-90c8-4c24-b0c4-fdb88021ab8e','auto',746,'2024-05-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('d99e364f-88f1-4f28-bd84-08e2d4e5bd12','POLZ-514-0','2d11673b-90c8-4c24-b0c4-fdb88021ab8e','a083a60d-3ff3-4836-b928-bdafb2823be5','auto','2024-05-30','2025-05-30',83,9,'premium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c295b623-8394-4a46-b54d-38c8c165c31a','QZ-514-1','2d11673b-90c8-4c24-b0c4-fdb88021ab8e','moto',578,'2024-03-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('4aa5f788-cee7-44a4-a7e5-9fbacc137e9b','POLZ-514-1','2d11673b-90c8-4c24-b0c4-fdb88021ab8e','c295b623-8394-4a46-b54d-38c8c165c31a','moto','2024-03-10','2025-03-10',89,49,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('17163732-c9f8-49ee-9a72-5129349cf7c2','INCZ-514-1-0','4aa5f788-cee7-44a4-a7e5-9fbacc137e9b','2d11673b-90c8-4c24-b0c4-fdb88021ab8e','Incident','Déclaration de sinistre','2021-05-30','moto','moyen','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('14f08db4-ade4-4e84-b1a7-973d84df623e','QZ-514-2','2d11673b-90c8-4c24-b0c4-fdb88021ab8e','moto',756,'2025-05-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('59d5a282-cb08-4960-9f08-e0b888cee5b4','POLZ-514-2','2d11673b-90c8-4c24-b0c4-fdb88021ab8e','14f08db4-ade4-4e84-b1a7-973d84df623e','moto','2025-05-25','2026-05-25',180,42,'premium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('4298e3d1-eb88-42c8-a048-166d9690b3f2','user515@rich.com',crypt('test123', gen_salt('bf')),'client','2022-08-08');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('4298e3d1-eb88-42c8-a048-166d9690b3f2','Mamy','Razaka','Antananarivo','2022-08-08',75,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7ce132de-a66d-4b4a-be95-a71577cfc2e1','QZ-515-0','4298e3d1-eb88-42c8-a048-166d9690b3f2','moto',232,'2019-06-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('461a82f1-d946-46dd-a522-04d1cdad837d','POLZ-515-0','4298e3d1-eb88-42c8-a048-166d9690b3f2','7ce132de-a66d-4b4a-be95-a71577cfc2e1','moto','2019-06-16','2020-06-16',221,10,'basic','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('14645cac-54a3-4d9e-90f4-78d83c387364','user516@rich.com',crypt('test123', gen_salt('bf')),'client','2019-11-04');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('14645cac-54a3-4d9e-90f4-78d83c387364','Zo','Rakotonirina','Antananarivo','2019-11-04',93,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('5a88ee23-3ed2-4d59-ae91-1441d4c0a15f','QZ-516-0','14645cac-54a3-4d9e-90f4-78d83c387364','sante',826,'2026-01-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('6df0cdf1-48fb-4fed-a993-b23ebf150268','POLZ-516-0','14645cac-54a3-4d9e-90f4-78d83c387364','5a88ee23-3ed2-4d59-ae91-1441d4c0a15f','sante','2026-01-08','2027-01-08',627,49,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('8e91b7bc-fe5b-4c0c-bec4-f02c8f5f804e','INCZ-516-0-0','6df0cdf1-48fb-4fed-a993-b23ebf150268','14645cac-54a3-4d9e-90f4-78d83c387364','Incident','Déclaration de sinistre','2025-03-07','sante','moyen','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('f9c8a82a-ff19-4bdf-bcec-1852282eb2d8','user517@rich.com',crypt('test123', gen_salt('bf')),'client','2024-07-29');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('f9c8a82a-ff19-4bdf-bcec-1852282eb2d8','Tahina','Rajaona','Antananarivo','2024-07-29',87,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7871a528-4a86-4aba-992c-7b92210713d6','QZ-517-0','f9c8a82a-ff19-4bdf-bcec-1852282eb2d8','sante',308,'2022-12-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('2172cbfa-5f1b-4d54-9bc1-007886913ea9','POLZ-517-0','f9c8a82a-ff19-4bdf-bcec-1852282eb2d8','7871a528-4a86-4aba-992c-7b92210713d6','sante','2022-12-09','2023-12-09',904,23,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('3412a927-eacc-4092-b4f2-bba9a375ba55','INCZ-517-0-0','2172cbfa-5f1b-4d54-9bc1-007886913ea9','f9c8a82a-ff19-4bdf-bcec-1852282eb2d8','Incident','Déclaration de sinistre','2018-12-10','sante','leger','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('9b018c43-574b-4485-8b40-ae8a4b53d4fe','INCZ-517-0-1','2172cbfa-5f1b-4d54-9bc1-007886913ea9','f9c8a82a-ff19-4bdf-bcec-1852282eb2d8','Incident','Déclaration de sinistre','2020-02-09','sante','eleve','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3bf38610-56ae-4c94-9514-c8cdae357cd5','QZ-517-1','f9c8a82a-ff19-4bdf-bcec-1852282eb2d8','auto',629,'2023-09-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('dc1c0b9f-eadc-426b-835a-18aedd4ac74f','POLZ-517-1','f9c8a82a-ff19-4bdf-bcec-1852282eb2d8','3bf38610-56ae-4c94-9514-c8cdae357cd5','auto','2023-09-09','2024-09-09',460,23,'premium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a6c0a9c5-812a-4f0a-b8d8-bd476581ee06','QZ-517-2','f9c8a82a-ff19-4bdf-bcec-1852282eb2d8','sante',514,'2024-07-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('682ebb96-9ef8-4f63-9ff9-e27551c97b70','POLZ-517-2','f9c8a82a-ff19-4bdf-bcec-1852282eb2d8','a6c0a9c5-812a-4f0a-b8d8-bd476581ee06','sante','2024-07-17','2025-07-17',488,6,'basic','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('707888c5-144e-41fa-a30e-85f794182351','user518@rich.com',crypt('test123', gen_salt('bf')),'client','2021-12-08');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('707888c5-144e-41fa-a30e-85f794182351','Tovo','Razaka','Antananarivo','2021-12-08',92,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('03f45ae5-daf8-4e6f-a245-381d0dd923ec','QZ-518-0','707888c5-144e-41fa-a30e-85f794182351','moto',571,'2025-08-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('869d4a4d-2014-442a-be21-d25773286006','POLZ-518-0','707888c5-144e-41fa-a30e-85f794182351','03f45ae5-daf8-4e6f-a245-381d0dd923ec','moto','2025-08-25','2026-08-25',571,14,'basic','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a93e57eb-d04f-4e2d-992e-7c4a753c674e','user519@rich.com',crypt('test123', gen_salt('bf')),'client','2018-02-12');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('a93e57eb-d04f-4e2d-992e-7c4a753c674e','Tahina','Rasoan','Antananarivo','2018-02-12',64,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1c483098-826e-4c7c-82f0-e1e6920d3177','QZ-519-0','a93e57eb-d04f-4e2d-992e-7c4a753c674e','auto',375,'2024-11-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('89292d86-bb6f-4a11-838a-d95575e3c770','POLZ-519-0','a93e57eb-d04f-4e2d-992e-7c4a753c674e','1c483098-826e-4c7c-82f0-e1e6920d3177','auto','2024-11-24','2025-11-24',511,7,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('186f2df4-ea23-49dd-aca2-16a9b9be4a6f','INCZ-519-0-0','89292d86-bb6f-4a11-838a-d95575e3c770','a93e57eb-d04f-4e2d-992e-7c4a753c674e','Incident','Déclaration de sinistre','2024-04-21','auto','leger','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('1ccafd6c-48e7-4bfd-815a-c6fae33e21ed','INCZ-519-0-1','89292d86-bb6f-4a11-838a-d95575e3c770','a93e57eb-d04f-4e2d-992e-7c4a753c674e','Incident','Déclaration de sinistre','2023-08-07','auto','moyen','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ed409a0b-31bb-4f8e-b454-559f6883f88f','QZ-519-1','a93e57eb-d04f-4e2d-992e-7c4a753c674e','auto',609,'2019-05-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('dd788ccf-5508-4c47-a385-2b5339119959','POLZ-519-1','a93e57eb-d04f-4e2d-992e-7c4a753c674e','ed409a0b-31bb-4f8e-b454-559f6883f88f','auto','2019-05-21','2020-05-21',256,22,'basic','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('48843a09-15e3-4727-a4fe-53d9d0065b00','user520@rich.com',crypt('test123', gen_salt('bf')),'client','2021-11-05');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('48843a09-15e3-4727-a4fe-53d9d0065b00','Nantenaina','Rakotonirina','Antananarivo','2021-11-05',79,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('07b87f24-1d19-4028-b6c7-2656943463f4','QZ-520-0','48843a09-15e3-4727-a4fe-53d9d0065b00','sante',375,'2022-08-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('bb0d9144-d9c5-4680-91ea-de0bee337f98','POLZ-520-0','48843a09-15e3-4727-a4fe-53d9d0065b00','07b87f24-1d19-4028-b6c7-2656943463f4','sante','2022-08-24','2023-08-24',769,23,'basic','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('06914d4d-af38-410a-8df3-90f386154cfb','user521@rich.com',crypt('test123', gen_salt('bf')),'client','2026-02-25');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('06914d4d-af38-410a-8df3-90f386154cfb','Clara','Rajaona','Antananarivo','2026-02-25',43,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('921942a7-01bb-43a7-bf3b-eeabbf8a4c13','QZ-521-0','06914d4d-af38-410a-8df3-90f386154cfb','moto',93,'2022-09-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('dbd1e187-20d7-4588-a7d9-e8777768e505','POLZ-521-0','06914d4d-af38-410a-8df3-90f386154cfb','921942a7-01bb-43a7-bf3b-eeabbf8a4c13','moto','2022-09-25','2023-09-25',883,46,'premium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e53db371-153c-4bbf-86eb-0da82a1c2f7d','QZ-521-1','06914d4d-af38-410a-8df3-90f386154cfb','moto',107,'2022-10-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('39f08334-0eb6-41b2-93bd-792e31beb2d3','POLZ-521-1','06914d4d-af38-410a-8df3-90f386154cfb','e53db371-153c-4bbf-86eb-0da82a1c2f7d','moto','2022-10-22','2023-10-22',843,29,'basic','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('774efbd3-72f6-4b8b-9028-d987df5886ab','QZ-521-2','06914d4d-af38-410a-8df3-90f386154cfb','auto',941,'2024-01-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('806293a4-6281-4b3b-807e-f92ab5a2c8d1','POLZ-521-2','06914d4d-af38-410a-8df3-90f386154cfb','774efbd3-72f6-4b8b-9028-d987df5886ab','auto','2024-01-12','2025-01-12',273,25,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('b06bdaae-d1ef-4cee-8169-2bb5400c92ba','INCZ-521-2-0','806293a4-6281-4b3b-807e-f92ab5a2c8d1','06914d4d-af38-410a-8df3-90f386154cfb','Incident','Déclaration de sinistre','2021-04-10','auto','moyen','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('534fc248-9339-4789-9e49-61d18fdb11f8','user522@rich.com',crypt('test123', gen_salt('bf')),'client','2020-12-27');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('534fc248-9339-4789-9e49-61d18fdb11f8','Tovo','Razaka','Antananarivo','2020-12-27',33,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('37953683-ded5-4754-8dce-29b6d2e0bf7c','QZ-522-0','534fc248-9339-4789-9e49-61d18fdb11f8','moto',919,'2025-03-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('a6ee9bbd-4339-49f1-9755-8e6ffe4fd886','POLZ-522-0','534fc248-9339-4789-9e49-61d18fdb11f8','37953683-ded5-4754-8dce-29b6d2e0bf7c','moto','2025-03-04','2026-03-04',92,14,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('0b2ba290-118f-4e06-ad45-290765d7ba34','INCZ-522-0-0','a6ee9bbd-4339-49f1-9755-8e6ffe4fd886','534fc248-9339-4789-9e49-61d18fdb11f8','Incident','Déclaration de sinistre','2021-03-27','moto','moyen','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('6e80f870-53a7-4db1-9333-647fdabc262c','QZ-522-1','534fc248-9339-4789-9e49-61d18fdb11f8','sante',982,'2023-07-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('4dad87e5-679f-459c-8418-ad1050c3923e','POLZ-522-1','534fc248-9339-4789-9e49-61d18fdb11f8','6e80f870-53a7-4db1-9333-647fdabc262c','sante','2023-07-23','2024-07-23',111,33,'basic','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a621d7e5-3866-4931-8cb1-664a75e9b28d','user523@rich.com',crypt('test123', gen_salt('bf')),'client','2022-08-27');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('a621d7e5-3866-4931-8cb1-664a75e9b28d','Hery','Rajaona','Antananarivo','2022-08-27',73,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c24adef8-a442-4b75-9b84-74766fbd1601','QZ-523-0','a621d7e5-3866-4931-8cb1-664a75e9b28d','sante',975,'2019-05-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('eb8b2216-9a3b-4e59-a11e-982d7840da4d','POLZ-523-0','a621d7e5-3866-4931-8cb1-664a75e9b28d','c24adef8-a442-4b75-9b84-74766fbd1601','sante','2019-05-07','2020-05-07',607,2,'basic','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('cef66d1b-52d6-44e7-ad20-ffa0e4273487','user524@rich.com',crypt('test123', gen_salt('bf')),'client','2021-03-13');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('cef66d1b-52d6-44e7-ad20-ffa0e4273487','Alex','Rakotomalala','Antananarivo','2021-03-13',51,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d879f9f6-b390-4fd1-b388-c857c0827e1c','QZ-524-0','cef66d1b-52d6-44e7-ad20-ffa0e4273487','auto',871,'2018-11-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('9cedb2fc-f8b0-4651-ac80-25e7ecc57723','POLZ-524-0','cef66d1b-52d6-44e7-ad20-ffa0e4273487','d879f9f6-b390-4fd1-b388-c857c0827e1c','auto','2018-11-27','2019-11-27',824,47,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('d7e19b65-24a5-4d75-92b7-74de6f42a780','INCZ-524-0-0','9cedb2fc-f8b0-4651-ac80-25e7ecc57723','cef66d1b-52d6-44e7-ad20-ffa0e4273487','Incident','Déclaration de sinistre','2025-12-27','auto','eleve','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('b9c652eb-9745-4ad0-b68c-e5efa22ac7a3','user525@rich.com',crypt('test123', gen_salt('bf')),'client','2025-05-04');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('b9c652eb-9745-4ad0-b68c-e5efa22ac7a3','Tahina','Randriamanana','Antananarivo','2025-05-04',54,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('41b47851-e924-4164-939f-70b16360b943','QZ-525-0','b9c652eb-9745-4ad0-b68c-e5efa22ac7a3','auto',500,'2020-01-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('3d3294b3-d351-45f3-a999-382ec895afbf','POLZ-525-0','b9c652eb-9745-4ad0-b68c-e5efa22ac7a3','41b47851-e924-4164-939f-70b16360b943','auto','2020-01-22','2021-01-22',482,11,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('60f5af95-788c-43c4-996e-285715f18711','INCZ-525-0-0','3d3294b3-d351-45f3-a999-382ec895afbf','b9c652eb-9745-4ad0-b68c-e5efa22ac7a3','Incident','Déclaration de sinistre','2021-01-05','auto','eleve','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('d1e3679d-a2d0-4080-976a-3020f4b8ac7c','INCZ-525-0-1','3d3294b3-d351-45f3-a999-382ec895afbf','b9c652eb-9745-4ad0-b68c-e5efa22ac7a3','Incident','Déclaration de sinistre','2019-01-14','auto','eleve','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8cdbc686-43ed-4891-a71b-223ee01d7ee8','QZ-525-1','b9c652eb-9745-4ad0-b68c-e5efa22ac7a3','auto',782,'2021-07-31');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('2e91bcef-dca4-4366-8a4f-7f64fc235c39','POLZ-525-1','b9c652eb-9745-4ad0-b68c-e5efa22ac7a3','8cdbc686-43ed-4891-a71b-223ee01d7ee8','auto','2021-07-31','2022-07-31',682,16,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('c714368d-d792-403f-8e34-07254db0ac09','INCZ-525-1-0','2e91bcef-dca4-4366-8a4f-7f64fc235c39','b9c652eb-9745-4ad0-b68c-e5efa22ac7a3','Incident','Déclaration de sinistre','2025-07-11','auto','leger','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('a8605085-3a7d-48c8-8b01-cf2a7850fb9c','INCZ-525-1-1','2e91bcef-dca4-4366-8a4f-7f64fc235c39','b9c652eb-9745-4ad0-b68c-e5efa22ac7a3','Incident','Déclaration de sinistre','2018-12-26','auto','moyen','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('184f584e-1226-4de5-be07-74b7fa925c70','QZ-525-2','b9c652eb-9745-4ad0-b68c-e5efa22ac7a3','sante',691,'2021-01-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('23a3c5f3-cac0-4683-bf48-b22517e987fb','POLZ-525-2','b9c652eb-9745-4ad0-b68c-e5efa22ac7a3','184f584e-1226-4de5-be07-74b7fa925c70','sante','2021-01-20','2022-01-20',769,48,'medium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('4ad5ac68-beeb-4312-a06c-19bd86c0c715','user526@rich.com',crypt('test123', gen_salt('bf')),'client','2018-11-09');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('4ad5ac68-beeb-4312-a06c-19bd86c0c715','Tovo','Rasoan','Antananarivo','2018-11-09',45,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('08edef80-d13a-4c36-a657-4a6210721fc6','QZ-526-0','4ad5ac68-beeb-4312-a06c-19bd86c0c715','auto',397,'2019-05-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('d477a830-1241-48b7-9a3d-6bcb3480d75e','POLZ-526-0','4ad5ac68-beeb-4312-a06c-19bd86c0c715','08edef80-d13a-4c36-a657-4a6210721fc6','auto','2019-05-03','2020-05-03',534,29,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('dc0e77a4-c47b-4f3c-a050-a54826592ac6','INCZ-526-0-0','d477a830-1241-48b7-9a3d-6bcb3480d75e','4ad5ac68-beeb-4312-a06c-19bd86c0c715','Incident','Déclaration de sinistre','2025-02-08','auto','moyen','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('32d82db1-09d5-4fe2-b93f-5db9c161d2d2','user527@rich.com',crypt('test123', gen_salt('bf')),'client','2022-08-03');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('32d82db1-09d5-4fe2-b93f-5db9c161d2d2','Zo','Ravelona','Antananarivo','2022-08-03',82,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('4df84184-00be-4dd5-80c5-c01dded9c8ea','QZ-527-0','32d82db1-09d5-4fe2-b93f-5db9c161d2d2','auto',948,'2021-05-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('001db1e9-09c9-44b5-9f3f-4c5a781a4382','POLZ-527-0','32d82db1-09d5-4fe2-b93f-5db9c161d2d2','4df84184-00be-4dd5-80c5-c01dded9c8ea','auto','2021-05-09','2022-05-09',896,34,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('158cf7e5-d085-4a58-96a8-58f35baa910b','INCZ-527-0-0','001db1e9-09c9-44b5-9f3f-4c5a781a4382','32d82db1-09d5-4fe2-b93f-5db9c161d2d2','Incident','Déclaration de sinistre','2024-12-28','auto','leger','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('20a27c03-904d-48f0-8004-61ad6b66f011','INCZ-527-0-1','001db1e9-09c9-44b5-9f3f-4c5a781a4382','32d82db1-09d5-4fe2-b93f-5db9c161d2d2','Incident','Déclaration de sinistre','2024-02-02','auto','eleve','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f25752dc-71b6-4abe-bb85-6a79d0cce326','QZ-527-1','32d82db1-09d5-4fe2-b93f-5db9c161d2d2','sante',92,'2019-07-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('b48f126f-be26-4918-bc5e-d8f85482ad39','POLZ-527-1','32d82db1-09d5-4fe2-b93f-5db9c161d2d2','f25752dc-71b6-4abe-bb85-6a79d0cce326','sante','2019-07-30','2020-07-30',120,30,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('90167922-5320-4ed0-ac28-dfb04b2942b6','INCZ-527-1-0','b48f126f-be26-4918-bc5e-d8f85482ad39','32d82db1-09d5-4fe2-b93f-5db9c161d2d2','Incident','Déclaration de sinistre','2022-09-23','sante','eleve','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1259646f-6fe9-424b-a214-e2974996ba0e','QZ-527-2','32d82db1-09d5-4fe2-b93f-5db9c161d2d2','moto',663,'2018-05-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('d309e496-46b5-4d37-b58a-5da8ae78819b','POLZ-527-2','32d82db1-09d5-4fe2-b93f-5db9c161d2d2','1259646f-6fe9-424b-a214-e2974996ba0e','moto','2018-05-25','2019-05-25',166,27,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('bb478b67-a7a5-44b0-ad70-83d902eb3f35','INCZ-527-2-0','d309e496-46b5-4d37-b58a-5da8ae78819b','32d82db1-09d5-4fe2-b93f-5db9c161d2d2','Incident','Déclaration de sinistre','2025-10-08','moto','leger','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('6a474166-99a7-4f21-a863-58523966426a','INCZ-527-2-1','d309e496-46b5-4d37-b58a-5da8ae78819b','32d82db1-09d5-4fe2-b93f-5db9c161d2d2','Incident','Déclaration de sinistre','2025-09-19','moto','eleve','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('82bc5b03-61a1-4854-b163-c6f9718b2bc8','user528@rich.com',crypt('test123', gen_salt('bf')),'client','2021-09-02');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('82bc5b03-61a1-4854-b163-c6f9718b2bc8','Bryan','Andriamanitra','Antananarivo','2021-09-02',99,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('00617d82-9676-4fa9-9037-75c6e1df17b0','QZ-528-0','82bc5b03-61a1-4854-b163-c6f9718b2bc8','moto',196,'2019-12-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('552b44ce-d1b4-4387-9c7a-d3805c3a7e2f','POLZ-528-0','82bc5b03-61a1-4854-b163-c6f9718b2bc8','00617d82-9676-4fa9-9037-75c6e1df17b0','moto','2019-12-09','2020-12-09',336,35,'medium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('5c2cae6b-e8bc-4fb4-8dba-3f63a6a850ec','QZ-528-1','82bc5b03-61a1-4854-b163-c6f9718b2bc8','sante',568,'2026-01-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('235d7584-635e-49ba-823f-f6898b37d11e','POLZ-528-1','82bc5b03-61a1-4854-b163-c6f9718b2bc8','5c2cae6b-e8bc-4fb4-8dba-3f63a6a850ec','sante','2026-01-01','2027-01-01',423,18,'medium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('4c9bd965-2bba-45b5-80ac-316cd8fc49e5','user529@rich.com',crypt('test123', gen_salt('bf')),'client','2024-06-17');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('4c9bd965-2bba-45b5-80ac-316cd8fc49e5','Tovo','Rakotomalala','Antananarivo','2024-06-17',42,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('84878c1a-1715-4a3f-b3ed-9b211311834d','QZ-529-0','4c9bd965-2bba-45b5-80ac-316cd8fc49e5','auto',144,'2019-08-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('6a5cf582-c11a-4a57-aed6-f6b0dd662ead','POLZ-529-0','4c9bd965-2bba-45b5-80ac-316cd8fc49e5','84878c1a-1715-4a3f-b3ed-9b211311834d','auto','2019-08-08','2020-08-08',155,19,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('9ce449b3-c875-4ecd-a8b9-c190d581ad90','INCZ-529-0-0','6a5cf582-c11a-4a57-aed6-f6b0dd662ead','4c9bd965-2bba-45b5-80ac-316cd8fc49e5','Incident','Déclaration de sinistre','2020-07-19','auto','leger','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('8a4efd8c-a5f6-49e0-b63a-c6a84ac6dd72','INCZ-529-0-1','6a5cf582-c11a-4a57-aed6-f6b0dd662ead','4c9bd965-2bba-45b5-80ac-316cd8fc49e5','Incident','Déclaration de sinistre','2019-05-21','auto','leger','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2e123e70-cd14-4860-ae1e-1a383f54273c','QZ-529-1','4c9bd965-2bba-45b5-80ac-316cd8fc49e5','auto',346,'2019-04-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('ff56268a-72a1-48a5-839d-c7eb41acedb7','POLZ-529-1','4c9bd965-2bba-45b5-80ac-316cd8fc49e5','2e123e70-cd14-4860-ae1e-1a383f54273c','auto','2019-04-13','2020-04-13',276,41,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('ef56cfea-e4c7-4b58-af49-367f73e006cc','INCZ-529-1-0','ff56268a-72a1-48a5-839d-c7eb41acedb7','4c9bd965-2bba-45b5-80ac-316cd8fc49e5','Incident','Déclaration de sinistre','2025-09-01','auto','eleve','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('dc72ecdc-1a53-442c-a48d-4dbcb89c65d7','user530@rich.com',crypt('test123', gen_salt('bf')),'client','2025-05-16');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('dc72ecdc-1a53-442c-a48d-4dbcb89c65d7','Tovo','Rasoan','Antananarivo','2025-05-16',70,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('641cdd60-910b-45c0-ba03-a74442485dfa','QZ-530-0','dc72ecdc-1a53-442c-a48d-4dbcb89c65d7','sante',191,'2021-12-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('8ad23dc6-9676-46df-abef-4723d046faaf','POLZ-530-0','dc72ecdc-1a53-442c-a48d-4dbcb89c65d7','641cdd60-910b-45c0-ba03-a74442485dfa','sante','2021-12-12','2022-12-12',613,18,'basic','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('04e6a511-f952-415e-a2f3-78d1c517bf44','QZ-530-1','dc72ecdc-1a53-442c-a48d-4dbcb89c65d7','moto',357,'2019-07-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('0183a401-784d-4969-a040-e871bf62e170','POLZ-530-1','dc72ecdc-1a53-442c-a48d-4dbcb89c65d7','04e6a511-f952-415e-a2f3-78d1c517bf44','moto','2019-07-27','2020-07-27',125,42,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('31663cc4-107e-4ca1-9814-dde2b8876f31','INCZ-530-1-0','0183a401-784d-4969-a040-e871bf62e170','dc72ecdc-1a53-442c-a48d-4dbcb89c65d7','Incident','Déclaration de sinistre','2018-03-28','moto','moyen','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('7fd6b2fb-006e-4f18-b220-0776b206c606','user531@rich.com',crypt('test123', gen_salt('bf')),'client','2019-05-25');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('7fd6b2fb-006e-4f18-b220-0776b206c606','Tovo','Rajaona','Antananarivo','2019-05-25',60,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('14e8f656-e22e-425a-bb27-a57f6a638942','QZ-531-0','7fd6b2fb-006e-4f18-b220-0776b206c606','moto',549,'2018-06-18');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('10b4a6ec-aa8a-4ffb-b2d7-5e152506459f','POLZ-531-0','7fd6b2fb-006e-4f18-b220-0776b206c606','14e8f656-e22e-425a-bb27-a57f6a638942','moto','2018-06-18','2019-06-18',805,0,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('1f9937a1-707b-4727-90dc-c7458d84441e','INCZ-531-0-0','10b4a6ec-aa8a-4ffb-b2d7-5e152506459f','7fd6b2fb-006e-4f18-b220-0776b206c606','Incident','Déclaration de sinistre','2024-05-03','moto','eleve','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c444acb4-f802-4bda-b61f-6c39f494634b','QZ-531-1','7fd6b2fb-006e-4f18-b220-0776b206c606','sante',470,'2025-06-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('ea5e730b-a4c8-4ffc-93a7-4403ea8f475d','POLZ-531-1','7fd6b2fb-006e-4f18-b220-0776b206c606','c444acb4-f802-4bda-b61f-6c39f494634b','sante','2025-06-03','2026-06-03',448,46,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('28537d63-e190-48b1-ab08-094c7fdec14e','INCZ-531-1-0','ea5e730b-a4c8-4ffc-93a7-4403ea8f475d','7fd6b2fb-006e-4f18-b220-0776b206c606','Incident','Déclaration de sinistre','2023-10-23','sante','moyen','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('88fbc140-34f8-476f-b041-64b3d40dc2ca','QZ-531-2','7fd6b2fb-006e-4f18-b220-0776b206c606','moto',541,'2024-11-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5f213d7a-378f-49ca-bc8a-810e5907a107','POLZ-531-2','7fd6b2fb-006e-4f18-b220-0776b206c606','88fbc140-34f8-476f-b041-64b3d40dc2ca','moto','2024-11-27','2025-11-27',357,18,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('717939e6-4927-410a-ba19-7347e9c1e894','INCZ-531-2-0','5f213d7a-378f-49ca-bc8a-810e5907a107','7fd6b2fb-006e-4f18-b220-0776b206c606','Incident','Déclaration de sinistre','2025-01-01','moto','leger','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('faa9b096-9f62-47f3-a808-6408e6e2329b','user532@rich.com',crypt('test123', gen_salt('bf')),'client','2020-07-02');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('faa9b096-9f62-47f3-a808-6408e6e2329b','Hery','Rakotomalala','Antananarivo','2020-07-02',31,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('edd60f32-a648-4273-b7c0-c00cd19c20fe','QZ-532-0','faa9b096-9f62-47f3-a808-6408e6e2329b','auto',854,'2025-06-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('b2a1b124-42a8-49ff-986f-acc7afb87cbd','POLZ-532-0','faa9b096-9f62-47f3-a808-6408e6e2329b','edd60f32-a648-4273-b7c0-c00cd19c20fe','auto','2025-06-04','2026-06-04',328,10,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('037c732b-3dd8-4b45-8ad9-12d9afd51589','INCZ-532-0-0','b2a1b124-42a8-49ff-986f-acc7afb87cbd','faa9b096-9f62-47f3-a808-6408e6e2329b','Incident','Déclaration de sinistre','2025-08-11','auto','eleve','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('3778c638-2cc3-40e0-98b3-f6fc8f928135','user533@rich.com',crypt('test123', gen_salt('bf')),'client','2022-08-10');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('3778c638-2cc3-40e0-98b3-f6fc8f928135','Hery','Rajaona','Antananarivo','2022-08-10',69,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b7a1267a-94e3-47a4-a25d-5f4f7e996f89','QZ-533-0','3778c638-2cc3-40e0-98b3-f6fc8f928135','auto',470,'2020-12-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e076b841-c026-4d95-9293-56210ebdbd23','POLZ-533-0','3778c638-2cc3-40e0-98b3-f6fc8f928135','b7a1267a-94e3-47a4-a25d-5f4f7e996f89','auto','2020-12-16','2021-12-16',593,30,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('4a216fa9-acd5-47c9-9d26-df4610c43e11','INCZ-533-0-0','e076b841-c026-4d95-9293-56210ebdbd23','3778c638-2cc3-40e0-98b3-f6fc8f928135','Incident','Déclaration de sinistre','2020-03-01','auto','eleve','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('81dfe693-edf7-4691-b36f-7258d68355b1','user534@rich.com',crypt('test123', gen_salt('bf')),'client','2019-02-25');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('81dfe693-edf7-4691-b36f-7258d68355b1','Clara','Razaka','Antananarivo','2019-02-25',36,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b0855c51-26d9-4592-abce-9ffdddaa8d02','QZ-534-0','81dfe693-edf7-4691-b36f-7258d68355b1','moto',224,'2019-04-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('4bd259a6-cf9c-4c57-a8fc-0d9eae89bf81','POLZ-534-0','81dfe693-edf7-4691-b36f-7258d68355b1','b0855c51-26d9-4592-abce-9ffdddaa8d02','moto','2019-04-19','2020-04-19',390,1,'basic','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('00d4caba-989b-4b2b-8cbe-014ceec81b34','QZ-534-1','81dfe693-edf7-4691-b36f-7258d68355b1','moto',758,'2019-04-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('36773b64-e094-4c35-b8db-dc73e26812ae','POLZ-534-1','81dfe693-edf7-4691-b36f-7258d68355b1','00d4caba-989b-4b2b-8cbe-014ceec81b34','moto','2019-04-16','2020-04-16',976,42,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('aee14fdb-d564-476c-8f70-da1706dd87cf','INCZ-534-1-0','36773b64-e094-4c35-b8db-dc73e26812ae','81dfe693-edf7-4691-b36f-7258d68355b1','Incident','Déclaration de sinistre','2023-09-26','moto','leger','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('e108d971-2b7b-4ad1-be8a-b54509b9a608','INCZ-534-1-1','36773b64-e094-4c35-b8db-dc73e26812ae','81dfe693-edf7-4691-b36f-7258d68355b1','Incident','Déclaration de sinistre','2018-11-30','moto','moyen','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ce73575e-125c-46c5-b846-79ec49fd10d2','user535@rich.com',crypt('test123', gen_salt('bf')),'client','2022-02-18');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('ce73575e-125c-46c5-b846-79ec49fd10d2','Clara','Randriamanana','Antananarivo','2022-02-18',62,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9635812f-6dc7-4552-a13c-221e883cf398','QZ-535-0','ce73575e-125c-46c5-b846-79ec49fd10d2','moto',863,'2023-06-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('7f04f834-365c-46c6-abeb-aa76a3466c67','POLZ-535-0','ce73575e-125c-46c5-b846-79ec49fd10d2','9635812f-6dc7-4552-a13c-221e883cf398','moto','2023-06-21','2024-06-21',881,50,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('47243e2a-e6b2-47ea-b6d5-9df3ec542e3b','INCZ-535-0-0','7f04f834-365c-46c6-abeb-aa76a3466c67','ce73575e-125c-46c5-b846-79ec49fd10d2','Incident','Déclaration de sinistre','2019-11-10','moto','moyen','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('01eed217-cb0e-419f-aabd-05c9894b225b','QZ-535-1','ce73575e-125c-46c5-b846-79ec49fd10d2','sante',133,'2021-08-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('ec723a1f-0bdd-4237-92fd-13f21eb8a95f','POLZ-535-1','ce73575e-125c-46c5-b846-79ec49fd10d2','01eed217-cb0e-419f-aabd-05c9894b225b','sante','2021-08-09','2022-08-09',463,34,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('c599fe06-c40e-4395-b910-1a0e0d6db685','INCZ-535-1-0','ec723a1f-0bdd-4237-92fd-13f21eb8a95f','ce73575e-125c-46c5-b846-79ec49fd10d2','Incident','Déclaration de sinistre','2021-03-15','sante','leger','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7e299c87-c987-4f05-91ac-60bb930e55f3','QZ-535-2','ce73575e-125c-46c5-b846-79ec49fd10d2','sante',293,'2024-01-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('1ea1139c-bab9-495e-b550-d0c6ee13c8f2','POLZ-535-2','ce73575e-125c-46c5-b846-79ec49fd10d2','7e299c87-c987-4f05-91ac-60bb930e55f3','sante','2024-01-30','2025-01-30',849,2,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('a86f24e3-b8c3-4014-92cc-f699131fd8ca','INCZ-535-2-0','1ea1139c-bab9-495e-b550-d0c6ee13c8f2','ce73575e-125c-46c5-b846-79ec49fd10d2','Incident','Déclaration de sinistre','2019-07-05','sante','moyen','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('1462ea41-209a-4db6-af40-aae706a869a5','INCZ-535-2-1','1ea1139c-bab9-495e-b550-d0c6ee13c8f2','ce73575e-125c-46c5-b846-79ec49fd10d2','Incident','Déclaration de sinistre','2023-06-26','sante','eleve','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('fd8e9543-e760-492a-b8bd-ee369f3b6ec5','user536@rich.com',crypt('test123', gen_salt('bf')),'client','2023-04-16');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('fd8e9543-e760-492a-b8bd-ee369f3b6ec5','Hery','Rasoan','Antananarivo','2023-04-16',56,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f7e95593-de8c-43cd-a9c6-ff27d69fa0f5','QZ-536-0','fd8e9543-e760-492a-b8bd-ee369f3b6ec5','moto',958,'2020-04-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('ae7d99a8-30ec-4882-b397-4e7ba27e6441','POLZ-536-0','fd8e9543-e760-492a-b8bd-ee369f3b6ec5','f7e95593-de8c-43cd-a9c6-ff27d69fa0f5','moto','2020-04-01','2021-04-01',286,43,'medium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('cee4667b-ff53-416d-8cb6-a20166e42dc8','QZ-536-1','fd8e9543-e760-492a-b8bd-ee369f3b6ec5','moto',944,'2018-09-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('0c2e66fc-f5cb-4532-85aa-f6bd6ec03494','POLZ-536-1','fd8e9543-e760-492a-b8bd-ee369f3b6ec5','cee4667b-ff53-416d-8cb6-a20166e42dc8','moto','2018-09-19','2019-09-19',276,40,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('52aa0d5a-1d77-4536-9fca-53a445f48edd','INCZ-536-1-0','0c2e66fc-f5cb-4532-85aa-f6bd6ec03494','fd8e9543-e760-492a-b8bd-ee369f3b6ec5','Incident','Déclaration de sinistre','2018-01-04','moto','leger','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('b4f28155-9c96-41eb-860d-2db96d618bfd','INCZ-536-1-1','0c2e66fc-f5cb-4532-85aa-f6bd6ec03494','fd8e9543-e760-492a-b8bd-ee369f3b6ec5','Incident','Déclaration de sinistre','2025-05-11','moto','moyen','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c8e4dae3-7a35-4a28-a7ea-6f4867b1d29e','QZ-536-2','fd8e9543-e760-492a-b8bd-ee369f3b6ec5','auto',268,'2024-11-18');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('8c1d2e85-f4ee-4a18-ba60-8a9adc65e382','POLZ-536-2','fd8e9543-e760-492a-b8bd-ee369f3b6ec5','c8e4dae3-7a35-4a28-a7ea-6f4867b1d29e','auto','2024-11-18','2025-11-18',295,28,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('b5c3be86-32a1-432b-94bb-49c4b7215359','INCZ-536-2-0','8c1d2e85-f4ee-4a18-ba60-8a9adc65e382','fd8e9543-e760-492a-b8bd-ee369f3b6ec5','Incident','Déclaration de sinistre','2023-01-23','auto','eleve','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('c9c7dbe5-beef-4aac-8391-895868967d40','user537@rich.com',crypt('test123', gen_salt('bf')),'client','2025-10-28');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('c9c7dbe5-beef-4aac-8391-895868967d40','Mamy','Rasoan','Antananarivo','2025-10-28',80,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c87f150c-8061-4e16-aae4-a1a214a9bddf','QZ-537-0','c9c7dbe5-beef-4aac-8391-895868967d40','sante',947,'2023-03-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f15fcb6c-10cc-4577-b2f5-18b7b226dbb3','POLZ-537-0','c9c7dbe5-beef-4aac-8391-895868967d40','c87f150c-8061-4e16-aae4-a1a214a9bddf','sante','2023-03-23','2024-03-23',873,47,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('0356b83c-bd72-4ace-bae7-d81cc07d5f71','INCZ-537-0-0','f15fcb6c-10cc-4577-b2f5-18b7b226dbb3','c9c7dbe5-beef-4aac-8391-895868967d40','Incident','Déclaration de sinistre','2021-06-12','sante','eleve','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('9367214f-65d4-4384-a6f7-1396947a6b0d','INCZ-537-0-1','f15fcb6c-10cc-4577-b2f5-18b7b226dbb3','c9c7dbe5-beef-4aac-8391-895868967d40','Incident','Déclaration de sinistre','2024-04-25','sante','eleve','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ef9e5166-6b24-425b-883a-41fc71263a3d','QZ-537-1','c9c7dbe5-beef-4aac-8391-895868967d40','auto',799,'2024-06-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f4eb438f-26f2-42d1-81e9-7d61589ac94f','POLZ-537-1','c9c7dbe5-beef-4aac-8391-895868967d40','ef9e5166-6b24-425b-883a-41fc71263a3d','auto','2024-06-01','2025-06-01',495,23,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('d8cc56b2-0ce9-4f80-9696-c737f3d6c76a','INCZ-537-1-0','f4eb438f-26f2-42d1-81e9-7d61589ac94f','c9c7dbe5-beef-4aac-8391-895868967d40','Incident','Déclaration de sinistre','2020-05-02','auto','moyen','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0e221790-da63-48eb-87a7-4c233ba4e2a1','QZ-537-2','c9c7dbe5-beef-4aac-8391-895868967d40','moto',685,'2024-12-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('fa7f2764-acc4-468a-9d6d-9affad31ae05','POLZ-537-2','c9c7dbe5-beef-4aac-8391-895868967d40','0e221790-da63-48eb-87a7-4c233ba4e2a1','moto','2024-12-12','2025-12-12',469,0,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('8ecda2e4-ebdf-4478-a16e-e9ca692dfac5','INCZ-537-2-0','fa7f2764-acc4-468a-9d6d-9affad31ae05','c9c7dbe5-beef-4aac-8391-895868967d40','Incident','Déclaration de sinistre','2021-08-30','moto','leger','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('80517479-309c-446c-a3be-f38e092e7c90','user538@rich.com',crypt('test123', gen_salt('bf')),'client','2020-03-06');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('80517479-309c-446c-a3be-f38e092e7c90','Zo','Rajaona','Antananarivo','2020-03-06',45,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f77feaaf-b006-4249-aabf-b668929ad984','QZ-538-0','80517479-309c-446c-a3be-f38e092e7c90','moto',471,'2023-06-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('d43776bd-92c6-4fd5-85f9-0d31b0033b0b','POLZ-538-0','80517479-309c-446c-a3be-f38e092e7c90','f77feaaf-b006-4249-aabf-b668929ad984','moto','2023-06-09','2024-06-09',696,38,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('1b3700fc-6ec9-4f7f-85fb-0a4c8d210ffe','INCZ-538-0-0','d43776bd-92c6-4fd5-85f9-0d31b0033b0b','80517479-309c-446c-a3be-f38e092e7c90','Incident','Déclaration de sinistre','2020-06-17','moto','moyen','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('82a9594a-1cac-4bcd-a6d8-fc457757a11f','INCZ-538-0-1','d43776bd-92c6-4fd5-85f9-0d31b0033b0b','80517479-309c-446c-a3be-f38e092e7c90','Incident','Déclaration de sinistre','2018-06-21','moto','leger','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('07f225a2-1ed7-4ff2-8ef9-ad03be2a6307','QZ-538-1','80517479-309c-446c-a3be-f38e092e7c90','sante',582,'2023-04-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('df7caabc-f060-48d1-8b9e-0a6696cc7ce2','POLZ-538-1','80517479-309c-446c-a3be-f38e092e7c90','07f225a2-1ed7-4ff2-8ef9-ad03be2a6307','sante','2023-04-07','2024-04-07',408,48,'basic','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('669c20c3-bd05-490b-b323-c3238151415e','QZ-538-2','80517479-309c-446c-a3be-f38e092e7c90','sante',905,'2022-10-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('bb36697d-cc37-4329-a9c2-e7363c248259','POLZ-538-2','80517479-309c-446c-a3be-f38e092e7c90','669c20c3-bd05-490b-b323-c3238151415e','sante','2022-10-27','2023-10-27',540,0,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('5c653fc5-0611-429e-8ac7-595ae7651108','INCZ-538-2-0','bb36697d-cc37-4329-a9c2-e7363c248259','80517479-309c-446c-a3be-f38e092e7c90','Incident','Déclaration de sinistre','2018-10-09','sante','leger','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('60eaa728-ff00-4f19-bcd0-58d1c57ad646','user539@rich.com',crypt('test123', gen_salt('bf')),'client','2025-11-10');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('60eaa728-ff00-4f19-bcd0-58d1c57ad646','Miora','Razaka','Antananarivo','2025-11-10',48,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('92755b9c-d1e4-49e4-9e39-cd0560ede190','QZ-539-0','60eaa728-ff00-4f19-bcd0-58d1c57ad646','moto',650,'2024-06-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f5ada8c0-39ff-4915-adbc-e6762029b663','POLZ-539-0','60eaa728-ff00-4f19-bcd0-58d1c57ad646','92755b9c-d1e4-49e4-9e39-cd0560ede190','moto','2024-06-27','2025-06-27',747,18,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('9ea26e01-e8ca-44ff-8937-55af76db67df','INCZ-539-0-0','f5ada8c0-39ff-4915-adbc-e6762029b663','60eaa728-ff00-4f19-bcd0-58d1c57ad646','Incident','Déclaration de sinistre','2022-12-13','moto','leger','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c6bb9e54-e418-4a3c-88cd-b211b25b280b','QZ-539-1','60eaa728-ff00-4f19-bcd0-58d1c57ad646','auto',112,'2021-12-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('78110b3a-7284-41b0-8b70-b7df1f1a0bdd','POLZ-539-1','60eaa728-ff00-4f19-bcd0-58d1c57ad646','c6bb9e54-e418-4a3c-88cd-b211b25b280b','auto','2021-12-04','2022-12-04',106,10,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('06c54814-b19a-405d-9b10-0d4ce0939b23','INCZ-539-1-0','78110b3a-7284-41b0-8b70-b7df1f1a0bdd','60eaa728-ff00-4f19-bcd0-58d1c57ad646','Incident','Déclaration de sinistre','2025-01-06','auto','leger','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('afaccf84-120c-4ec6-9c58-e4c0831f5e95','user540@rich.com',crypt('test123', gen_salt('bf')),'client','2022-08-19');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('afaccf84-120c-4ec6-9c58-e4c0831f5e95','Zo','Rajaona','Antananarivo','2022-08-19',50,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a61bc3b4-f3b0-4215-9f37-ae2cef70cc7a','QZ-540-0','afaccf84-120c-4ec6-9c58-e4c0831f5e95','moto',319,'2022-12-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('79b6ff01-c64f-4832-a570-98142c762d4b','POLZ-540-0','afaccf84-120c-4ec6-9c58-e4c0831f5e95','a61bc3b4-f3b0-4215-9f37-ae2cef70cc7a','moto','2022-12-10','2023-12-10',576,42,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('0c526d15-8f8a-4eea-8c37-7f571953613a','INCZ-540-0-0','79b6ff01-c64f-4832-a570-98142c762d4b','afaccf84-120c-4ec6-9c58-e4c0831f5e95','Incident','Déclaration de sinistre','2026-03-12','moto','leger','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('6b5e9f63-564b-4649-a726-595541842979','QZ-540-1','afaccf84-120c-4ec6-9c58-e4c0831f5e95','auto',460,'2021-09-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('70d8ac90-afb9-4ce8-889a-563ed042e3ed','POLZ-540-1','afaccf84-120c-4ec6-9c58-e4c0831f5e95','6b5e9f63-564b-4649-a726-595541842979','auto','2021-09-23','2022-09-23',692,10,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('eea8f24b-5a71-45a7-9128-7bca4703ab83','INCZ-540-1-0','70d8ac90-afb9-4ce8-889a-563ed042e3ed','afaccf84-120c-4ec6-9c58-e4c0831f5e95','Incident','Déclaration de sinistre','2023-07-12','auto','eleve','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('dc0942c6-e8ab-44cc-bcb3-14e1a9fc851c','user541@rich.com',crypt('test123', gen_salt('bf')),'client','2026-03-09');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('dc0942c6-e8ab-44cc-bcb3-14e1a9fc851c','Clara','Razaka','Antananarivo','2026-03-09',23,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('82bd5230-e4fe-4391-b4cc-8c10e8a7047c','QZ-541-0','dc0942c6-e8ab-44cc-bcb3-14e1a9fc851c','auto',466,'2024-01-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('8ca30c6b-d0eb-4dba-a620-991296c77480','POLZ-541-0','dc0942c6-e8ab-44cc-bcb3-14e1a9fc851c','82bd5230-e4fe-4391-b4cc-8c10e8a7047c','auto','2024-01-17','2025-01-17',173,20,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('f1199b05-bef4-4c3f-8aa8-d12980f0d09b','INCZ-541-0-0','8ca30c6b-d0eb-4dba-a620-991296c77480','dc0942c6-e8ab-44cc-bcb3-14e1a9fc851c','Incident','Déclaration de sinistre','2025-01-30','auto','leger','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('bf1e05a0-ff8c-4f08-8cdc-349f6a58c1df','INCZ-541-0-1','8ca30c6b-d0eb-4dba-a620-991296c77480','dc0942c6-e8ab-44cc-bcb3-14e1a9fc851c','Incident','Déclaration de sinistre','2024-04-16','auto','eleve','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('29c89b96-9a0d-4518-a8ab-683d798096f6','QZ-541-1','dc0942c6-e8ab-44cc-bcb3-14e1a9fc851c','moto',475,'2020-04-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('366c8c20-59b4-44c6-9bde-fbb899105a65','POLZ-541-1','dc0942c6-e8ab-44cc-bcb3-14e1a9fc851c','29c89b96-9a0d-4518-a8ab-683d798096f6','moto','2020-04-08','2021-04-08',231,20,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('cd7b5b45-5582-420f-8157-458594736db7','INCZ-541-1-0','366c8c20-59b4-44c6-9bde-fbb899105a65','dc0942c6-e8ab-44cc-bcb3-14e1a9fc851c','Incident','Déclaration de sinistre','2025-01-20','moto','moyen','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('43d4e494-e52e-4efd-8d92-767e6a17455a','QZ-541-2','dc0942c6-e8ab-44cc-bcb3-14e1a9fc851c','sante',721,'2018-10-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('20a2abbc-2eb7-42e7-ba03-a1381a1d2e51','POLZ-541-2','dc0942c6-e8ab-44cc-bcb3-14e1a9fc851c','43d4e494-e52e-4efd-8d92-767e6a17455a','sante','2018-10-01','2019-10-01',838,40,'basic','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('eda87b0b-dd93-4ddb-aa35-b095b5c0129f','user542@rich.com',crypt('test123', gen_salt('bf')),'client','2024-09-25');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('eda87b0b-dd93-4ddb-aa35-b095b5c0129f','Alex','Razaka','Antananarivo','2024-09-25',33,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b99e9572-f537-44d4-be16-cfa092706741','QZ-542-0','eda87b0b-dd93-4ddb-aa35-b095b5c0129f','sante',491,'2023-12-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('871d96ee-afa0-484a-ba09-5f50119da8c4','POLZ-542-0','eda87b0b-dd93-4ddb-aa35-b095b5c0129f','b99e9572-f537-44d4-be16-cfa092706741','sante','2023-12-23','2024-12-23',609,17,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('38aa15c2-8f47-4af3-b004-e8577b4683bc','INCZ-542-0-0','871d96ee-afa0-484a-ba09-5f50119da8c4','eda87b0b-dd93-4ddb-aa35-b095b5c0129f','Incident','Déclaration de sinistre','2022-04-24','sante','leger','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('5b8777df-8d1a-4e5c-8a62-cc25e210cb06','QZ-542-1','eda87b0b-dd93-4ddb-aa35-b095b5c0129f','moto',878,'2018-09-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('891cbe1f-1b2e-4b84-9366-036bcdb8dcfa','POLZ-542-1','eda87b0b-dd93-4ddb-aa35-b095b5c0129f','5b8777df-8d1a-4e5c-8a62-cc25e210cb06','moto','2018-09-08','2019-09-08',781,12,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('78c3c21b-3344-409f-8fe2-c3c6b060e96c','INCZ-542-1-0','891cbe1f-1b2e-4b84-9366-036bcdb8dcfa','eda87b0b-dd93-4ddb-aa35-b095b5c0129f','Incident','Déclaration de sinistre','2019-05-27','moto','eleve','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('2d31481b-746e-47cc-9d01-8e36631f53b9','INCZ-542-1-1','891cbe1f-1b2e-4b84-9366-036bcdb8dcfa','eda87b0b-dd93-4ddb-aa35-b095b5c0129f','Incident','Déclaration de sinistre','2022-11-12','moto','eleve','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('77462229-4818-4bc9-a619-ac469073c9ab','user543@rich.com',crypt('test123', gen_salt('bf')),'client','2020-05-03');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('77462229-4818-4bc9-a619-ac469073c9ab','Bryan','Andriamanitra','Antananarivo','2020-05-03',28,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8f965e0a-cfde-41e5-a8cd-4b8cf9c59a24','QZ-543-0','77462229-4818-4bc9-a619-ac469073c9ab','moto',825,'2019-09-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('209be31c-c689-4755-90cb-95bd2ad788ed','POLZ-543-0','77462229-4818-4bc9-a619-ac469073c9ab','8f965e0a-cfde-41e5-a8cd-4b8cf9c59a24','moto','2019-09-01','2020-09-01',138,38,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('bd35ff2e-bf58-4d3b-890a-ca6867e3a907','INCZ-543-0-0','209be31c-c689-4755-90cb-95bd2ad788ed','77462229-4818-4bc9-a619-ac469073c9ab','Incident','Déclaration de sinistre','2025-09-12','moto','moyen','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('33ff0bb6-ef3d-4449-ae98-99c64b749f85','INCZ-543-0-1','209be31c-c689-4755-90cb-95bd2ad788ed','77462229-4818-4bc9-a619-ac469073c9ab','Incident','Déclaration de sinistre','2018-06-27','moto','leger','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('09c039c1-52dd-4bc7-8f13-c8f9eaba0154','QZ-543-1','77462229-4818-4bc9-a619-ac469073c9ab','moto',614,'2026-02-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e385eb33-0ad5-4353-a04c-b7f12cbeb223','POLZ-543-1','77462229-4818-4bc9-a619-ac469073c9ab','09c039c1-52dd-4bc7-8f13-c8f9eaba0154','moto','2026-02-16','2027-02-16',491,13,'basic','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ca6c0dc7-948a-418b-a941-434b6d4acd3a','QZ-543-2','77462229-4818-4bc9-a619-ac469073c9ab','moto',384,'2020-01-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('9ec8f691-c483-41fb-863e-ccadcc92db87','POLZ-543-2','77462229-4818-4bc9-a619-ac469073c9ab','ca6c0dc7-948a-418b-a941-434b6d4acd3a','moto','2020-01-16','2021-01-16',712,39,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('39a2618c-04c1-49e1-829f-083db989a922','INCZ-543-2-0','9ec8f691-c483-41fb-863e-ccadcc92db87','77462229-4818-4bc9-a619-ac469073c9ab','Incident','Déclaration de sinistre','2025-10-15','moto','moyen','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('b01df93c-8106-4ff3-b32a-f20430bfcb75','INCZ-543-2-1','9ec8f691-c483-41fb-863e-ccadcc92db87','77462229-4818-4bc9-a619-ac469073c9ab','Incident','Déclaration de sinistre','2022-01-11','moto','eleve','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('d118f951-4509-4d97-a235-484b1b5ed56a','user544@rich.com',crypt('test123', gen_salt('bf')),'client','2020-11-26');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('d118f951-4509-4d97-a235-484b1b5ed56a','Zo','Rakotonirina','Antananarivo','2020-11-26',70,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8005d479-5e5e-45cf-ab4d-0e00133f3c43','QZ-544-0','d118f951-4509-4d97-a235-484b1b5ed56a','sante',261,'2022-04-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('a72ec833-6cd1-4d3e-93c4-5542f73da7a1','POLZ-544-0','d118f951-4509-4d97-a235-484b1b5ed56a','8005d479-5e5e-45cf-ab4d-0e00133f3c43','sante','2022-04-24','2023-04-24',80,43,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('8825e60b-accb-42d6-a703-59b162d4bce4','INCZ-544-0-0','a72ec833-6cd1-4d3e-93c4-5542f73da7a1','d118f951-4509-4d97-a235-484b1b5ed56a','Incident','Déclaration de sinistre','2025-11-28','sante','moyen','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('8d32e028-8b45-4f7d-a9cd-f845bb310c0e','INCZ-544-0-1','a72ec833-6cd1-4d3e-93c4-5542f73da7a1','d118f951-4509-4d97-a235-484b1b5ed56a','Incident','Déclaration de sinistre','2026-02-20','sante','eleve','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b820317e-a1fb-42fe-9251-77716e16709a','QZ-544-1','d118f951-4509-4d97-a235-484b1b5ed56a','sante',819,'2023-01-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('b956108d-d33e-4d34-bf3c-1674d035dcbe','POLZ-544-1','d118f951-4509-4d97-a235-484b1b5ed56a','b820317e-a1fb-42fe-9251-77716e16709a','sante','2023-01-12','2024-01-12',231,36,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('82447582-0d5f-4c52-aeb1-8e425949f318','INCZ-544-1-0','b956108d-d33e-4d34-bf3c-1674d035dcbe','d118f951-4509-4d97-a235-484b1b5ed56a','Incident','Déclaration de sinistre','2018-07-10','sante','moyen','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('0cf5f5fc-6e72-43cd-9e47-9f01ebb04507','INCZ-544-1-1','b956108d-d33e-4d34-bf3c-1674d035dcbe','d118f951-4509-4d97-a235-484b1b5ed56a','Incident','Déclaration de sinistre','2018-12-13','sante','eleve','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('21b51ee1-fc54-4470-9c97-a1d4c58d82b1','QZ-544-2','d118f951-4509-4d97-a235-484b1b5ed56a','moto',85,'2021-05-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('c5a4350d-5f7e-4c75-b30a-3524f78d140f','POLZ-544-2','d118f951-4509-4d97-a235-484b1b5ed56a','21b51ee1-fc54-4470-9c97-a1d4c58d82b1','moto','2021-05-30','2022-05-30',158,23,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('2764818e-71a8-45b2-bf43-606b9bdc19d2','INCZ-544-2-0','c5a4350d-5f7e-4c75-b30a-3524f78d140f','d118f951-4509-4d97-a235-484b1b5ed56a','Incident','Déclaration de sinistre','2018-01-15','moto','eleve','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('92062d44-6f0e-4d60-9654-7bb87ef464a4','user545@rich.com',crypt('test123', gen_salt('bf')),'client','2025-10-29');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('92062d44-6f0e-4d60-9654-7bb87ef464a4','Zo','Razaka','Antananarivo','2025-10-29',14,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('795ddf2a-c687-43ca-9854-46b5c8a79523','QZ-545-0','92062d44-6f0e-4d60-9654-7bb87ef464a4','moto',73,'2023-07-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('b1d5101c-2683-4e29-98c1-cac6d2207f46','POLZ-545-0','92062d44-6f0e-4d60-9654-7bb87ef464a4','795ddf2a-c687-43ca-9854-46b5c8a79523','moto','2023-07-28','2024-07-28',646,32,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('d01bfd78-29d6-476c-896c-0eaa2ed06122','INCZ-545-0-0','b1d5101c-2683-4e29-98c1-cac6d2207f46','92062d44-6f0e-4d60-9654-7bb87ef464a4','Incident','Déclaration de sinistre','2025-10-01','moto','leger','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2f6854b6-6d06-4509-b552-d1f74afc4c1a','QZ-545-1','92062d44-6f0e-4d60-9654-7bb87ef464a4','sante',392,'2020-01-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('deb0d2fe-24a6-45ca-b0cb-655674ed7dca','POLZ-545-1','92062d44-6f0e-4d60-9654-7bb87ef464a4','2f6854b6-6d06-4509-b552-d1f74afc4c1a','sante','2020-01-13','2021-01-13',617,34,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('94a775ba-a3a9-41f1-9295-b10e0fe15351','INCZ-545-1-0','deb0d2fe-24a6-45ca-b0cb-655674ed7dca','92062d44-6f0e-4d60-9654-7bb87ef464a4','Incident','Déclaration de sinistre','2019-03-14','sante','moyen','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('763c75ce-9483-4d0b-9989-a8065f2289d6','INCZ-545-1-1','deb0d2fe-24a6-45ca-b0cb-655674ed7dca','92062d44-6f0e-4d60-9654-7bb87ef464a4','Incident','Déclaration de sinistre','2019-01-23','sante','leger','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e8768073-2235-4d51-a9b5-1e8db96b9906','QZ-545-2','92062d44-6f0e-4d60-9654-7bb87ef464a4','sante',698,'2025-03-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('b3c5a81d-8da5-42e5-9f34-e5c2c7847e18','POLZ-545-2','92062d44-6f0e-4d60-9654-7bb87ef464a4','e8768073-2235-4d51-a9b5-1e8db96b9906','sante','2025-03-01','2026-03-01',85,38,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('fbe9250c-9f06-48ef-a80f-972801b555c1','INCZ-545-2-0','b3c5a81d-8da5-42e5-9f34-e5c2c7847e18','92062d44-6f0e-4d60-9654-7bb87ef464a4','Incident','Déclaration de sinistre','2020-05-17','sante','moyen','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('c5369ec5-ae54-4512-bb88-e039c88df9ca','INCZ-545-2-1','b3c5a81d-8da5-42e5-9f34-e5c2c7847e18','92062d44-6f0e-4d60-9654-7bb87ef464a4','Incident','Déclaration de sinistre','2024-04-13','sante','moyen','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('b29707c5-702c-4604-8e6e-cc0120e85fde','user546@rich.com',crypt('test123', gen_salt('bf')),'client','2024-07-16');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('b29707c5-702c-4604-8e6e-cc0120e85fde','Nantenaina','Rajaona','Antananarivo','2024-07-16',76,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3f3cfc28-ee43-4447-9bb2-398b0deb524d','QZ-546-0','b29707c5-702c-4604-8e6e-cc0120e85fde','auto',509,'2021-12-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('174454c6-27e5-4733-abcb-0d59198e4501','POLZ-546-0','b29707c5-702c-4604-8e6e-cc0120e85fde','3f3cfc28-ee43-4447-9bb2-398b0deb524d','auto','2021-12-20','2022-12-20',961,13,'basic','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7ac239b4-bdd1-4d54-a224-1da89d0548e8','QZ-546-1','b29707c5-702c-4604-8e6e-cc0120e85fde','moto',602,'2019-05-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('7c5debec-3d5c-402f-ab04-55fa8b083f45','POLZ-546-1','b29707c5-702c-4604-8e6e-cc0120e85fde','7ac239b4-bdd1-4d54-a224-1da89d0548e8','moto','2019-05-10','2020-05-10',952,16,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('acf3fb81-7955-4745-b240-790d137ec77a','INCZ-546-1-0','7c5debec-3d5c-402f-ab04-55fa8b083f45','b29707c5-702c-4604-8e6e-cc0120e85fde','Incident','Déclaration de sinistre','2022-01-09','moto','moyen','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('f065db6c-1441-430a-a506-7780cdd34f8f','INCZ-546-1-1','7c5debec-3d5c-402f-ab04-55fa8b083f45','b29707c5-702c-4604-8e6e-cc0120e85fde','Incident','Déclaration de sinistre','2018-07-01','moto','moyen','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('d17fec44-cddc-4bcd-8f38-2ccc13ce2db3','user547@rich.com',crypt('test123', gen_salt('bf')),'client','2024-10-01');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('d17fec44-cddc-4bcd-8f38-2ccc13ce2db3','Mamy','Razaka','Antananarivo','2024-10-01',33,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d7b577f7-1d92-4b59-9943-801e6cc239f4','QZ-547-0','d17fec44-cddc-4bcd-8f38-2ccc13ce2db3','auto',991,'2022-12-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('90d62c5d-0070-4255-9c26-b599539683d6','POLZ-547-0','d17fec44-cddc-4bcd-8f38-2ccc13ce2db3','d7b577f7-1d92-4b59-9943-801e6cc239f4','auto','2022-12-26','2023-12-26',873,26,'medium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('34fc3297-ba38-4b89-afb4-6caae5e13482','QZ-547-1','d17fec44-cddc-4bcd-8f38-2ccc13ce2db3','moto',981,'2024-07-18');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e92d3e66-29c9-426e-815b-5a621f8ddba5','POLZ-547-1','d17fec44-cddc-4bcd-8f38-2ccc13ce2db3','34fc3297-ba38-4b89-afb4-6caae5e13482','moto','2024-07-18','2025-07-18',399,38,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('a022cf2e-151d-48ff-a0bb-29950fb6bf6f','INCZ-547-1-0','e92d3e66-29c9-426e-815b-5a621f8ddba5','d17fec44-cddc-4bcd-8f38-2ccc13ce2db3','Incident','Déclaration de sinistre','2021-04-09','moto','moyen','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('10ec37d5-9496-4c4a-bc47-75ebe23ce120','INCZ-547-1-1','e92d3e66-29c9-426e-815b-5a621f8ddba5','d17fec44-cddc-4bcd-8f38-2ccc13ce2db3','Incident','Déclaration de sinistre','2019-05-13','moto','eleve','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('16482e68-eed9-4904-a8a5-7d640694bab8','QZ-547-2','d17fec44-cddc-4bcd-8f38-2ccc13ce2db3','auto',98,'2023-07-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('9d1b372d-d0ce-4931-aa0e-fead55dcdbcb','POLZ-547-2','d17fec44-cddc-4bcd-8f38-2ccc13ce2db3','16482e68-eed9-4904-a8a5-7d640694bab8','auto','2023-07-05','2024-07-05',659,24,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('5694ac3c-748c-403b-a40c-abc4aaadb4ae','INCZ-547-2-0','9d1b372d-d0ce-4931-aa0e-fead55dcdbcb','d17fec44-cddc-4bcd-8f38-2ccc13ce2db3','Incident','Déclaration de sinistre','2023-07-21','auto','eleve','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('74e73da8-dbd6-4b58-8e58-5d3dfd872cf0','INCZ-547-2-1','9d1b372d-d0ce-4931-aa0e-fead55dcdbcb','d17fec44-cddc-4bcd-8f38-2ccc13ce2db3','Incident','Déclaration de sinistre','2023-09-22','auto','eleve','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('4d0a9504-3fc5-4ca8-a91f-f4753ab8e086','user548@rich.com',crypt('test123', gen_salt('bf')),'client','2023-01-29');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('4d0a9504-3fc5-4ca8-a91f-f4753ab8e086','Hery','Rasoan','Antananarivo','2023-01-29',30,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0d309440-179c-4490-bb30-7af46afcb5fe','QZ-548-0','4d0a9504-3fc5-4ca8-a91f-f4753ab8e086','auto',110,'2021-11-18');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('1e424929-7059-4148-9d6f-ef9b1dfe199f','POLZ-548-0','4d0a9504-3fc5-4ca8-a91f-f4753ab8e086','0d309440-179c-4490-bb30-7af46afcb5fe','auto','2021-11-18','2022-11-18',791,48,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('e0090a06-fcf3-4c07-a840-c06ed4333250','INCZ-548-0-0','1e424929-7059-4148-9d6f-ef9b1dfe199f','4d0a9504-3fc5-4ca8-a91f-f4753ab8e086','Incident','Déclaration de sinistre','2023-06-30','auto','eleve','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('5d9fc0f6-d04e-4638-af25-e38b66c8a994','user549@rich.com',crypt('test123', gen_salt('bf')),'client','2018-12-31');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('5d9fc0f6-d04e-4638-af25-e38b66c8a994','Bryan','Ravelona','Antananarivo','2018-12-31',90,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('230563c8-042b-42fc-9910-2705bf960f29','QZ-549-0','5d9fc0f6-d04e-4638-af25-e38b66c8a994','sante',403,'2026-03-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('af524a5c-a138-45fb-a48a-1054f092747e','POLZ-549-0','5d9fc0f6-d04e-4638-af25-e38b66c8a994','230563c8-042b-42fc-9910-2705bf960f29','sante','2026-03-08','2027-03-08',588,27,'premium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('9b42b7e7-7487-4aaa-9364-a7095b3615bd','user550@rich.com',crypt('test123', gen_salt('bf')),'client','2020-07-20');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('9b42b7e7-7487-4aaa-9364-a7095b3615bd','Miora','Rasoan','Antananarivo','2020-07-20',56,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3bd7047f-b365-487a-af6f-70a51530f265','QZ-550-0','9b42b7e7-7487-4aaa-9364-a7095b3615bd','auto',143,'2024-07-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('04514d5c-2e4a-4393-a087-c27451ed3356','POLZ-550-0','9b42b7e7-7487-4aaa-9364-a7095b3615bd','3bd7047f-b365-487a-af6f-70a51530f265','auto','2024-07-20','2025-07-20',120,45,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('06823690-c4f5-4738-971f-256dda6162a6','INCZ-550-0-0','04514d5c-2e4a-4393-a087-c27451ed3356','9b42b7e7-7487-4aaa-9364-a7095b3615bd','Incident','Déclaration de sinistre','2021-02-05','auto','eleve','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('cb23e31e-33c2-4e38-b430-e8ff3ee73234','user551@rich.com',crypt('test123', gen_salt('bf')),'client','2020-09-14');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('cb23e31e-33c2-4e38-b430-e8ff3ee73234','Miora','Rakotomalala','Antananarivo','2020-09-14',63,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('74fafed5-146e-4721-9ec2-a607b8f450be','QZ-551-0','cb23e31e-33c2-4e38-b430-e8ff3ee73234','auto',465,'2022-07-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('cee0b8fe-2121-4bd6-ab90-0216ed21d26a','POLZ-551-0','cb23e31e-33c2-4e38-b430-e8ff3ee73234','74fafed5-146e-4721-9ec2-a607b8f450be','auto','2022-07-27','2023-07-27',580,21,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('6b00d88a-9253-4a57-affe-6e5cec94dc37','INCZ-551-0-0','cee0b8fe-2121-4bd6-ab90-0216ed21d26a','cb23e31e-33c2-4e38-b430-e8ff3ee73234','Incident','Déclaration de sinistre','2024-06-17','auto','eleve','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8d041a89-a97c-42e6-8bdb-bd82e645fad5','QZ-551-1','cb23e31e-33c2-4e38-b430-e8ff3ee73234','auto',721,'2021-12-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('db578e26-91bc-4a6c-bf0d-d13c3bde6577','POLZ-551-1','cb23e31e-33c2-4e38-b430-e8ff3ee73234','8d041a89-a97c-42e6-8bdb-bd82e645fad5','auto','2021-12-27','2022-12-27',801,8,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('2ef3f69f-5033-42e2-8a32-9c27db272eb0','INCZ-551-1-0','db578e26-91bc-4a6c-bf0d-d13c3bde6577','cb23e31e-33c2-4e38-b430-e8ff3ee73234','Incident','Déclaration de sinistre','2024-11-05','auto','moyen','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('11e07030-1510-4762-95c5-d990218bc45c','INCZ-551-1-1','db578e26-91bc-4a6c-bf0d-d13c3bde6577','cb23e31e-33c2-4e38-b430-e8ff3ee73234','Incident','Déclaration de sinistre','2022-02-19','auto','leger','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0a2d1acd-cdc0-4bc0-92f2-9f5fdd747b3f','QZ-551-2','cb23e31e-33c2-4e38-b430-e8ff3ee73234','sante',448,'2018-10-15');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('9eb5fa6e-9b6b-4ded-871e-87f49b4ffc40','POLZ-551-2','cb23e31e-33c2-4e38-b430-e8ff3ee73234','0a2d1acd-cdc0-4bc0-92f2-9f5fdd747b3f','sante','2018-10-15','2019-10-15',779,26,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('74aaec72-8dc6-401b-bc18-521a32d33575','INCZ-551-2-0','9eb5fa6e-9b6b-4ded-871e-87f49b4ffc40','cb23e31e-33c2-4e38-b430-e8ff3ee73234','Incident','Déclaration de sinistre','2019-02-12','sante','leger','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('50768199-588d-4d35-9027-e2d7a12fd4b0','user552@rich.com',crypt('test123', gen_salt('bf')),'client','2018-08-04');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('50768199-588d-4d35-9027-e2d7a12fd4b0','Miora','Andriamanitra','Antananarivo','2018-08-04',14,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('196a13bd-e702-4bb5-908b-9775a9cb7314','QZ-552-0','50768199-588d-4d35-9027-e2d7a12fd4b0','auto',223,'2018-06-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('cfc08cc8-f470-4e54-a580-63b7546e02f9','POLZ-552-0','50768199-588d-4d35-9027-e2d7a12fd4b0','196a13bd-e702-4bb5-908b-9775a9cb7314','auto','2018-06-05','2019-06-05',920,44,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('ac2454cb-8260-42ef-8a2d-b453ed129f5b','INCZ-552-0-0','cfc08cc8-f470-4e54-a580-63b7546e02f9','50768199-588d-4d35-9027-e2d7a12fd4b0','Incident','Déclaration de sinistre','2024-06-09','auto','moyen','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('e86db5de-ecaa-40cd-af27-c882b9b35c5a','user553@rich.com',crypt('test123', gen_salt('bf')),'client','2026-02-12');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('e86db5de-ecaa-40cd-af27-c882b9b35c5a','Alex','Rasoan','Antananarivo','2026-02-12',76,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('78357bad-7949-4b11-b03b-584543db8adb','QZ-553-0','e86db5de-ecaa-40cd-af27-c882b9b35c5a','moto',804,'2019-11-15');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('6ae98784-715d-4f62-b1c8-a6ebf366edca','POLZ-553-0','e86db5de-ecaa-40cd-af27-c882b9b35c5a','78357bad-7949-4b11-b03b-584543db8adb','moto','2019-11-15','2020-11-15',703,47,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('731a4f13-6e09-4d27-9ede-0f56d5b489ec','INCZ-553-0-0','6ae98784-715d-4f62-b1c8-a6ebf366edca','e86db5de-ecaa-40cd-af27-c882b9b35c5a','Incident','Déclaration de sinistre','2019-12-20','moto','eleve','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('bb2196c5-c8ed-4dab-b06c-e76bf382b7a4','QZ-553-1','e86db5de-ecaa-40cd-af27-c882b9b35c5a','sante',527,'2019-04-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('d4afe2fa-7be2-489f-b0aa-a8a51cb429fe','POLZ-553-1','e86db5de-ecaa-40cd-af27-c882b9b35c5a','bb2196c5-c8ed-4dab-b06c-e76bf382b7a4','sante','2019-04-16','2020-04-16',130,50,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('388a7d7c-9e2a-4b84-bcb2-008f3b8e33ed','INCZ-553-1-0','d4afe2fa-7be2-489f-b0aa-a8a51cb429fe','e86db5de-ecaa-40cd-af27-c882b9b35c5a','Incident','Déclaration de sinistre','2023-12-14','sante','eleve','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('04a78694-3833-44ff-8967-8c67c383c93d','QZ-553-2','e86db5de-ecaa-40cd-af27-c882b9b35c5a','moto',67,'2020-06-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5a7ac636-8499-445b-a491-8202402d43dd','POLZ-553-2','e86db5de-ecaa-40cd-af27-c882b9b35c5a','04a78694-3833-44ff-8967-8c67c383c93d','moto','2020-06-03','2021-06-03',792,13,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('74ff1c02-4f45-4aab-abb5-e12fd174fab5','INCZ-553-2-0','5a7ac636-8499-445b-a491-8202402d43dd','e86db5de-ecaa-40cd-af27-c882b9b35c5a','Incident','Déclaration de sinistre','2025-02-11','moto','eleve','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a3351e67-8c25-46a7-b12b-6228c8871750','user554@rich.com',crypt('test123', gen_salt('bf')),'client','2025-02-21');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('a3351e67-8c25-46a7-b12b-6228c8871750','Alex','Rasoan','Antananarivo','2025-02-21',35,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b9124525-cd9f-458a-8a2e-a73314e42e76','QZ-554-0','a3351e67-8c25-46a7-b12b-6228c8871750','sante',606,'2021-03-29');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('25b14779-bb46-43b5-973d-11a4c9d3535f','POLZ-554-0','a3351e67-8c25-46a7-b12b-6228c8871750','b9124525-cd9f-458a-8a2e-a73314e42e76','sante','2021-03-29','2022-03-29',114,46,'basic','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('e5e1b07a-43a9-4e24-a800-6d95a282c8b4','user555@rich.com',crypt('test123', gen_salt('bf')),'client','2018-10-26');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('e5e1b07a-43a9-4e24-a800-6d95a282c8b4','Zo','Rasoan','Antananarivo','2018-10-26',91,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2858cdd3-7210-44e6-b56d-c4b8b65f4879','QZ-555-0','e5e1b07a-43a9-4e24-a800-6d95a282c8b4','moto',58,'2025-06-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('16e68daf-ef18-40bc-98e9-e52741323324','POLZ-555-0','e5e1b07a-43a9-4e24-a800-6d95a282c8b4','2858cdd3-7210-44e6-b56d-c4b8b65f4879','moto','2025-06-24','2026-06-24',333,4,'medium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0d35ba1d-19ed-4748-904e-5dbe38cbbac7','QZ-555-1','e5e1b07a-43a9-4e24-a800-6d95a282c8b4','sante',928,'2021-11-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('a534ebb5-67d2-4621-9796-972022730ead','POLZ-555-1','e5e1b07a-43a9-4e24-a800-6d95a282c8b4','0d35ba1d-19ed-4748-904e-5dbe38cbbac7','sante','2021-11-01','2022-11-01',863,31,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('41cd67f3-fe00-424d-b3eb-873d5a71aeff','INCZ-555-1-0','a534ebb5-67d2-4621-9796-972022730ead','e5e1b07a-43a9-4e24-a800-6d95a282c8b4','Incident','Déclaration de sinistre','2026-04-28','sante','moyen','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('190d80b4-b011-4e81-8cdc-db8e7fed4e18','user556@rich.com',crypt('test123', gen_salt('bf')),'client','2020-10-28');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('190d80b4-b011-4e81-8cdc-db8e7fed4e18','Mamy','Razaka','Antananarivo','2020-10-28',82,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7eede5cb-ff63-4854-b6c0-df13dc6f782b','QZ-556-0','190d80b4-b011-4e81-8cdc-db8e7fed4e18','sante',912,'2021-06-15');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('df22ec26-b58e-422d-8569-b28b4f116dfc','POLZ-556-0','190d80b4-b011-4e81-8cdc-db8e7fed4e18','7eede5cb-ff63-4854-b6c0-df13dc6f782b','sante','2021-06-15','2022-06-15',117,48,'premium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('740ab35f-7d0f-4ece-afbc-dd950a772b2e','QZ-556-1','190d80b4-b011-4e81-8cdc-db8e7fed4e18','moto',712,'2024-03-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('2594dbf0-3b26-4569-baaf-1ba2c305c196','POLZ-556-1','190d80b4-b011-4e81-8cdc-db8e7fed4e18','740ab35f-7d0f-4ece-afbc-dd950a772b2e','moto','2024-03-23','2025-03-23',709,17,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('7fab129d-a121-421f-ab5e-a51577d8d495','INCZ-556-1-0','2594dbf0-3b26-4569-baaf-1ba2c305c196','190d80b4-b011-4e81-8cdc-db8e7fed4e18','Incident','Déclaration de sinistre','2025-07-13','moto','eleve','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('9293c255-5976-4de8-a792-b390c6373319','user557@rich.com',crypt('test123', gen_salt('bf')),'client','2021-11-21');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('9293c255-5976-4de8-a792-b390c6373319','Mamy','Rajaona','Antananarivo','2021-11-21',46,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2ce164d2-c65f-43ee-b750-2f8cda03acd8','QZ-557-0','9293c255-5976-4de8-a792-b390c6373319','moto',850,'2021-08-31');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e1560ce4-c34c-4d1b-9035-44be4188cf36','POLZ-557-0','9293c255-5976-4de8-a792-b390c6373319','2ce164d2-c65f-43ee-b750-2f8cda03acd8','moto','2021-08-31','2022-08-31',659,12,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('3f143832-d8e2-49dd-8738-b25162338cd9','INCZ-557-0-0','e1560ce4-c34c-4d1b-9035-44be4188cf36','9293c255-5976-4de8-a792-b390c6373319','Incident','Déclaration de sinistre','2023-10-24','moto','eleve','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('656c8964-0651-43e8-bac4-756cab4dab37','INCZ-557-0-1','e1560ce4-c34c-4d1b-9035-44be4188cf36','9293c255-5976-4de8-a792-b390c6373319','Incident','Déclaration de sinistre','2020-08-07','moto','eleve','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('042ac75c-b88c-4c4c-b82a-79cc34863ae6','QZ-557-1','9293c255-5976-4de8-a792-b390c6373319','moto',469,'2018-05-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('14c25495-7f5b-4c8a-9aea-4f1ffda8a060','POLZ-557-1','9293c255-5976-4de8-a792-b390c6373319','042ac75c-b88c-4c4c-b82a-79cc34863ae6','moto','2018-05-01','2019-05-01',418,27,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('8024318b-7a9f-46c0-ad04-a106aa5291d1','INCZ-557-1-0','14c25495-7f5b-4c8a-9aea-4f1ffda8a060','9293c255-5976-4de8-a792-b390c6373319','Incident','Déclaration de sinistre','2023-01-19','moto','eleve','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('7c35e7ff-6b34-4bba-bf65-8ed3f0f9d2b0','INCZ-557-1-1','14c25495-7f5b-4c8a-9aea-4f1ffda8a060','9293c255-5976-4de8-a792-b390c6373319','Incident','Déclaration de sinistre','2022-10-28','moto','leger','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('bef66f90-604a-4e7a-a215-7d8a58a29f34','user558@rich.com',crypt('test123', gen_salt('bf')),'client','2018-09-22');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('bef66f90-604a-4e7a-a215-7d8a58a29f34','Alex','Rasoan','Antananarivo','2018-09-22',42,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ebc019ed-326a-4fd6-914d-5bb011401136','QZ-558-0','bef66f90-604a-4e7a-a215-7d8a58a29f34','sante',238,'2025-08-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('328660c1-92eb-417a-8c10-226788ece1dc','POLZ-558-0','bef66f90-604a-4e7a-a215-7d8a58a29f34','ebc019ed-326a-4fd6-914d-5bb011401136','sante','2025-08-06','2026-08-06',195,48,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('a0440acb-b8b0-4905-9ea2-78c6df300958','INCZ-558-0-0','328660c1-92eb-417a-8c10-226788ece1dc','bef66f90-604a-4e7a-a215-7d8a58a29f34','Incident','Déclaration de sinistre','2019-02-02','sante','eleve','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('315504ac-a296-4fa3-9d03-4c5aaf000da7','QZ-558-1','bef66f90-604a-4e7a-a215-7d8a58a29f34','moto',106,'2025-12-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('4bf97ef3-770e-40d1-91e0-aac525276fa7','POLZ-558-1','bef66f90-604a-4e7a-a215-7d8a58a29f34','315504ac-a296-4fa3-9d03-4c5aaf000da7','moto','2025-12-19','2026-12-19',931,20,'premium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('748e44f2-7078-4a0f-b78c-f6d39ce48024','user559@rich.com',crypt('test123', gen_salt('bf')),'client','2023-01-09');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('748e44f2-7078-4a0f-b78c-f6d39ce48024','Clara','Randriamanana','Antananarivo','2023-01-09',12,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('5b614d8f-97ac-4c5e-a417-2ab805c334f6','QZ-559-0','748e44f2-7078-4a0f-b78c-f6d39ce48024','auto',283,'2025-01-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('57be66bc-987e-45d7-bb11-e15e0cbf84ec','POLZ-559-0','748e44f2-7078-4a0f-b78c-f6d39ce48024','5b614d8f-97ac-4c5e-a417-2ab805c334f6','auto','2025-01-05','2026-01-05',869,25,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('f11117d0-24dc-420f-8341-5e8bf375d718','INCZ-559-0-0','57be66bc-987e-45d7-bb11-e15e0cbf84ec','748e44f2-7078-4a0f-b78c-f6d39ce48024','Incident','Déclaration de sinistre','2023-11-17','auto','moyen','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3f9f1b78-60f2-4a6a-b352-3ed2e8948c41','QZ-559-1','748e44f2-7078-4a0f-b78c-f6d39ce48024','sante',453,'2022-05-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f6e2a1f8-f6b8-448f-8cfd-3b906dd6f113','POLZ-559-1','748e44f2-7078-4a0f-b78c-f6d39ce48024','3f9f1b78-60f2-4a6a-b352-3ed2e8948c41','sante','2022-05-28','2023-05-28',761,41,'medium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3e4e5b7a-e7d7-4e46-b00b-1c2f770b684c','QZ-559-2','748e44f2-7078-4a0f-b78c-f6d39ce48024','sante',526,'2022-03-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('b32f51fc-5733-49c0-8d91-557495c8693c','POLZ-559-2','748e44f2-7078-4a0f-b78c-f6d39ce48024','3e4e5b7a-e7d7-4e46-b00b-1c2f770b684c','sante','2022-03-25','2023-03-25',368,31,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('126fa10e-01a0-4d5e-9caa-6686a8db7d07','INCZ-559-2-0','b32f51fc-5733-49c0-8d91-557495c8693c','748e44f2-7078-4a0f-b78c-f6d39ce48024','Incident','Déclaration de sinistre','2020-07-12','sante','eleve','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ba0d1326-eb4b-46a9-a84d-2a84e500ad67','user560@rich.com',crypt('test123', gen_salt('bf')),'client','2019-12-30');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('ba0d1326-eb4b-46a9-a84d-2a84e500ad67','Tovo','Razaka','Antananarivo','2019-12-30',83,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a63c1a77-f724-415a-be56-8987de076bdd','QZ-560-0','ba0d1326-eb4b-46a9-a84d-2a84e500ad67','sante',418,'2018-02-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('692a6b66-204f-453a-936d-b3a334434d01','POLZ-560-0','ba0d1326-eb4b-46a9-a84d-2a84e500ad67','a63c1a77-f724-415a-be56-8987de076bdd','sante','2018-02-28','2019-02-28',730,23,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('a6105f16-2605-4d59-86dc-758743de8220','INCZ-560-0-0','692a6b66-204f-453a-936d-b3a334434d01','ba0d1326-eb4b-46a9-a84d-2a84e500ad67','Incident','Déclaration de sinistre','2022-02-22','sante','moyen','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('560960c6-628f-4123-8c57-6652139913dc','INCZ-560-0-1','692a6b66-204f-453a-936d-b3a334434d01','ba0d1326-eb4b-46a9-a84d-2a84e500ad67','Incident','Déclaration de sinistre','2025-09-16','sante','leger','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('808c2d9d-01d8-4e05-ae78-48c0b0b14093','QZ-560-1','ba0d1326-eb4b-46a9-a84d-2a84e500ad67','auto',408,'2019-02-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e855a08d-63e2-44cf-b60b-26d7d94bf10a','POLZ-560-1','ba0d1326-eb4b-46a9-a84d-2a84e500ad67','808c2d9d-01d8-4e05-ae78-48c0b0b14093','auto','2019-02-01','2020-02-01',178,22,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('756d88c8-02af-4e0b-a21b-73b62b629d7f','INCZ-560-1-0','e855a08d-63e2-44cf-b60b-26d7d94bf10a','ba0d1326-eb4b-46a9-a84d-2a84e500ad67','Incident','Déclaration de sinistre','2022-05-27','auto','moyen','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('f43e6eef-26f9-410f-858b-d9f3423f8d67','INCZ-560-1-1','e855a08d-63e2-44cf-b60b-26d7d94bf10a','ba0d1326-eb4b-46a9-a84d-2a84e500ad67','Incident','Déclaration de sinistre','2020-01-20','auto','eleve','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('e6f0e42d-a78f-4502-8003-c22ee9230870','user561@rich.com',crypt('test123', gen_salt('bf')),'client','2019-06-02');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('e6f0e42d-a78f-4502-8003-c22ee9230870','Tovo','Rasoan','Antananarivo','2019-06-02',48,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('52cff302-5398-4c7a-aff6-e36e643bbf2b','QZ-561-0','e6f0e42d-a78f-4502-8003-c22ee9230870','sante',608,'2018-06-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('400cd01f-8326-4287-a9e3-90218b20f35c','POLZ-561-0','e6f0e42d-a78f-4502-8003-c22ee9230870','52cff302-5398-4c7a-aff6-e36e643bbf2b','sante','2018-06-04','2019-06-04',982,3,'basic','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('aa53adb6-5f0b-4292-826b-b56d05d5b473','QZ-561-1','e6f0e42d-a78f-4502-8003-c22ee9230870','auto',739,'2023-04-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5d5c5fa1-495b-41e8-ad0f-6ed4399de944','POLZ-561-1','e6f0e42d-a78f-4502-8003-c22ee9230870','aa53adb6-5f0b-4292-826b-b56d05d5b473','auto','2023-04-17','2024-04-17',482,48,'medium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('45948468-b8af-4eb9-a9a3-dce3eef39d39','QZ-561-2','e6f0e42d-a78f-4502-8003-c22ee9230870','auto',477,'2024-03-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('978c782a-4c2a-4bfa-b130-d733d602cd13','POLZ-561-2','e6f0e42d-a78f-4502-8003-c22ee9230870','45948468-b8af-4eb9-a9a3-dce3eef39d39','auto','2024-03-10','2025-03-10',999,50,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('4463c1e0-767b-4ec6-8028-246c1df9b95d','INCZ-561-2-0','978c782a-4c2a-4bfa-b130-d733d602cd13','e6f0e42d-a78f-4502-8003-c22ee9230870','Incident','Déclaration de sinistre','2021-02-07','auto','moyen','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('549456b8-a281-44d0-9c9b-006e7dcfd6e8','INCZ-561-2-1','978c782a-4c2a-4bfa-b130-d733d602cd13','e6f0e42d-a78f-4502-8003-c22ee9230870','Incident','Déclaration de sinistre','2022-05-01','auto','eleve','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('9159db02-1812-4cf0-a21c-8e4e8ba79807','user562@rich.com',crypt('test123', gen_salt('bf')),'client','2018-02-19');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('9159db02-1812-4cf0-a21c-8e4e8ba79807','Nantenaina','Ravelona','Antananarivo','2018-02-19',47,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3d09bf1e-4f9f-4271-8681-d889037f6852','QZ-562-0','9159db02-1812-4cf0-a21c-8e4e8ba79807','sante',344,'2026-01-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5c12ea26-d863-4188-be38-9e978cf88cb8','POLZ-562-0','9159db02-1812-4cf0-a21c-8e4e8ba79807','3d09bf1e-4f9f-4271-8681-d889037f6852','sante','2026-01-26','2027-01-26',532,45,'medium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('159a2860-654b-470e-9585-fe38cbeb39e9','QZ-562-1','9159db02-1812-4cf0-a21c-8e4e8ba79807','auto',738,'2024-02-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('d6ba2ba8-e4eb-45db-b574-3e22631d7e0f','POLZ-562-1','9159db02-1812-4cf0-a21c-8e4e8ba79807','159a2860-654b-470e-9585-fe38cbeb39e9','auto','2024-02-03','2025-02-03',285,35,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('3b3425e9-d100-4b4e-96dc-478ebcd89d07','INCZ-562-1-0','d6ba2ba8-e4eb-45db-b574-3e22631d7e0f','9159db02-1812-4cf0-a21c-8e4e8ba79807','Incident','Déclaration de sinistre','2019-03-20','auto','eleve','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('593a7433-12f8-40b3-baa1-2ba206bd02e8','user563@rich.com',crypt('test123', gen_salt('bf')),'client','2023-09-22');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('593a7433-12f8-40b3-baa1-2ba206bd02e8','Alex','Rajaona','Antananarivo','2023-09-22',86,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d73ca407-6c70-48c4-9f33-4c4f74275c18','QZ-563-0','593a7433-12f8-40b3-baa1-2ba206bd02e8','sante',950,'2022-03-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('74515882-484b-4156-8a9f-629ae49f0d9b','POLZ-563-0','593a7433-12f8-40b3-baa1-2ba206bd02e8','d73ca407-6c70-48c4-9f33-4c4f74275c18','sante','2022-03-04','2023-03-04',51,26,'premium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('f9434b27-71c5-4738-a1da-adc44bd743a5','user564@rich.com',crypt('test123', gen_salt('bf')),'client','2024-02-25');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('f9434b27-71c5-4738-a1da-adc44bd743a5','Tahina','Ravelona','Antananarivo','2024-02-25',60,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('686e25c4-5d1a-4de8-b48e-e4df37515aa9','QZ-564-0','f9434b27-71c5-4738-a1da-adc44bd743a5','sante',227,'2018-09-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('18c70824-a01e-45ad-9e83-dd7487b60afb','POLZ-564-0','f9434b27-71c5-4738-a1da-adc44bd743a5','686e25c4-5d1a-4de8-b48e-e4df37515aa9','sante','2018-09-16','2019-09-16',592,38,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('3492665b-f385-43a1-8326-94ca612cd5b7','INCZ-564-0-0','18c70824-a01e-45ad-9e83-dd7487b60afb','f9434b27-71c5-4738-a1da-adc44bd743a5','Incident','Déclaration de sinistre','2019-12-21','sante','leger','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('74316fbf-5226-43a7-88f1-9c996881761a','INCZ-564-0-1','18c70824-a01e-45ad-9e83-dd7487b60afb','f9434b27-71c5-4738-a1da-adc44bd743a5','Incident','Déclaration de sinistre','2023-07-05','sante','leger','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('92996c4a-bac7-4639-ae08-4529e88a2b47','QZ-564-1','f9434b27-71c5-4738-a1da-adc44bd743a5','moto',404,'2022-01-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('396fd95f-e3f3-4a51-a026-9a05bee889ce','POLZ-564-1','f9434b27-71c5-4738-a1da-adc44bd743a5','92996c4a-bac7-4639-ae08-4529e88a2b47','moto','2022-01-05','2023-01-05',378,46,'basic','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f1539a79-055c-4148-b67c-4375604b565a','QZ-564-2','f9434b27-71c5-4738-a1da-adc44bd743a5','sante',800,'2022-08-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e3230611-55b4-4c4c-a21a-2734f0d6067d','POLZ-564-2','f9434b27-71c5-4738-a1da-adc44bd743a5','f1539a79-055c-4148-b67c-4375604b565a','sante','2022-08-04','2023-08-04',814,13,'premium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('37d2032d-a737-4c94-840a-5166812f9c71','user565@rich.com',crypt('test123', gen_salt('bf')),'client','2020-03-15');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('37d2032d-a737-4c94-840a-5166812f9c71','Hery','Rasoan','Antananarivo','2020-03-15',17,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('689a7409-9442-4c4f-9efb-04b122015694','QZ-565-0','37d2032d-a737-4c94-840a-5166812f9c71','auto',214,'2024-07-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('bd1a6c09-e21c-445a-b711-23df1fa9a3d2','POLZ-565-0','37d2032d-a737-4c94-840a-5166812f9c71','689a7409-9442-4c4f-9efb-04b122015694','auto','2024-07-01','2025-07-01',749,7,'premium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('c2fe47ea-b159-4048-86ad-aaad35047c43','user566@rich.com',crypt('test123', gen_salt('bf')),'client','2020-07-09');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('c2fe47ea-b159-4048-86ad-aaad35047c43','Hery','Ravelona','Antananarivo','2020-07-09',54,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0b808e40-1916-4dd3-b168-6881e27477bd','QZ-566-0','c2fe47ea-b159-4048-86ad-aaad35047c43','auto',472,'2019-12-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('76e309b5-fbef-4742-b694-dda647256c71','POLZ-566-0','c2fe47ea-b159-4048-86ad-aaad35047c43','0b808e40-1916-4dd3-b168-6881e27477bd','auto','2019-12-23','2020-12-23',623,21,'medium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8f7fff7d-99db-4905-85c1-d61dfff2e132','QZ-566-1','c2fe47ea-b159-4048-86ad-aaad35047c43','sante',285,'2018-10-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('964faa51-88df-462b-9278-9365e24d0035','POLZ-566-1','c2fe47ea-b159-4048-86ad-aaad35047c43','8f7fff7d-99db-4905-85c1-d61dfff2e132','sante','2018-10-05','2019-10-05',85,50,'medium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('e5fba107-481f-4ab4-b2f6-fab416598d55','user567@rich.com',crypt('test123', gen_salt('bf')),'client','2020-04-22');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('e5fba107-481f-4ab4-b2f6-fab416598d55','Bryan','Rakotomalala','Antananarivo','2020-04-22',56,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9ce59520-ee8b-4011-b8a8-e6cb60734e3a','QZ-567-0','e5fba107-481f-4ab4-b2f6-fab416598d55','moto',542,'2025-10-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('9c93b083-280f-42a5-8a1a-d7abf24b7a5c','POLZ-567-0','e5fba107-481f-4ab4-b2f6-fab416598d55','9ce59520-ee8b-4011-b8a8-e6cb60734e3a','moto','2025-10-27','2026-10-27',954,20,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('38c42d40-c556-4d80-8d18-a08eb5f41658','INCZ-567-0-0','9c93b083-280f-42a5-8a1a-d7abf24b7a5c','e5fba107-481f-4ab4-b2f6-fab416598d55','Incident','Déclaration de sinistre','2025-03-02','moto','moyen','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('aa3b549b-2265-43fd-a198-c38855510040','INCZ-567-0-1','9c93b083-280f-42a5-8a1a-d7abf24b7a5c','e5fba107-481f-4ab4-b2f6-fab416598d55','Incident','Déclaration de sinistre','2025-10-10','moto','leger','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e0a4bb6c-2f9e-4e12-a288-d703313d24ae','QZ-567-1','e5fba107-481f-4ab4-b2f6-fab416598d55','sante',865,'2026-04-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('21ba74a2-de58-4390-8385-e4596b22b199','POLZ-567-1','e5fba107-481f-4ab4-b2f6-fab416598d55','e0a4bb6c-2f9e-4e12-a288-d703313d24ae','sante','2026-04-01','2027-04-01',710,26,'premium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('68cc3d0b-75e8-4267-a9cd-3a13cf0bd3c5','QZ-567-2','e5fba107-481f-4ab4-b2f6-fab416598d55','auto',390,'2023-09-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('4953c3d8-e151-4d5f-9af7-48dbaa0e5d98','POLZ-567-2','e5fba107-481f-4ab4-b2f6-fab416598d55','68cc3d0b-75e8-4267-a9cd-3a13cf0bd3c5','auto','2023-09-03','2024-09-03',627,49,'basic','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('15c8135e-5e40-4a65-a517-d703260e03c9','user568@rich.com',crypt('test123', gen_salt('bf')),'client','2026-02-21');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('15c8135e-5e40-4a65-a517-d703260e03c9','Mamy','Andriamanitra','Antananarivo','2026-02-21',79,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3f843309-6faf-4548-8e40-59c503956570','QZ-568-0','15c8135e-5e40-4a65-a517-d703260e03c9','moto',747,'2019-03-15');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('6597a2fa-fe3e-41dc-824e-9a8c2814d12c','POLZ-568-0','15c8135e-5e40-4a65-a517-d703260e03c9','3f843309-6faf-4548-8e40-59c503956570','moto','2019-03-15','2020-03-15',700,5,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('88d5823d-1e99-4a18-8827-de56a9311928','INCZ-568-0-0','6597a2fa-fe3e-41dc-824e-9a8c2814d12c','15c8135e-5e40-4a65-a517-d703260e03c9','Incident','Déclaration de sinistre','2023-09-11','moto','moyen','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('82851bb0-ca20-4f78-8ad8-44179ec9401d','user569@rich.com',crypt('test123', gen_salt('bf')),'client','2021-06-30');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('82851bb0-ca20-4f78-8ad8-44179ec9401d','Alex','Andriamanitra','Antananarivo','2021-06-30',11,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e6205dcb-ce65-4a32-b807-b5882c243a82','QZ-569-0','82851bb0-ca20-4f78-8ad8-44179ec9401d','moto',942,'2024-02-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('6a8cbd9e-3eeb-4337-b2d9-2a199edd1b9d','POLZ-569-0','82851bb0-ca20-4f78-8ad8-44179ec9401d','e6205dcb-ce65-4a32-b807-b5882c243a82','moto','2024-02-01','2025-02-01',647,8,'medium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c8dcdfc9-6e0f-4877-ad44-7ab86fa4f5ab','QZ-569-1','82851bb0-ca20-4f78-8ad8-44179ec9401d','sante',991,'2018-06-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('d5edc4f8-cb31-4f5a-a610-15646c38fe9f','POLZ-569-1','82851bb0-ca20-4f78-8ad8-44179ec9401d','c8dcdfc9-6e0f-4877-ad44-7ab86fa4f5ab','sante','2018-06-12','2019-06-12',622,8,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('584d88e3-274f-4de3-a3a3-d63ab921e764','INCZ-569-1-0','d5edc4f8-cb31-4f5a-a610-15646c38fe9f','82851bb0-ca20-4f78-8ad8-44179ec9401d','Incident','Déclaration de sinistre','2020-03-28','sante','leger','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('b03edd17-3e9b-415f-a3bb-0f8bf9cb0a8b','INCZ-569-1-1','d5edc4f8-cb31-4f5a-a610-15646c38fe9f','82851bb0-ca20-4f78-8ad8-44179ec9401d','Incident','Déclaration de sinistre','2020-04-22','sante','eleve','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('792cf811-9eed-41a2-86cf-615c40155ead','QZ-569-2','82851bb0-ca20-4f78-8ad8-44179ec9401d','auto',256,'2025-02-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('d822e8f6-2561-42a9-8217-f154a401a03f','POLZ-569-2','82851bb0-ca20-4f78-8ad8-44179ec9401d','792cf811-9eed-41a2-86cf-615c40155ead','auto','2025-02-09','2026-02-09',134,18,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('b3c65d7c-509b-4ff7-adac-08abaa308cb9','INCZ-569-2-0','d822e8f6-2561-42a9-8217-f154a401a03f','82851bb0-ca20-4f78-8ad8-44179ec9401d','Incident','Déclaration de sinistre','2021-03-24','auto','leger','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('4b176e02-2052-42f2-b847-6a29c71da344','INCZ-569-2-1','d822e8f6-2561-42a9-8217-f154a401a03f','82851bb0-ca20-4f78-8ad8-44179ec9401d','Incident','Déclaration de sinistre','2025-12-07','auto','moyen','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('b85efec2-04c3-4759-b3df-d603007f813a','user570@rich.com',crypt('test123', gen_salt('bf')),'client','2023-03-08');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('b85efec2-04c3-4759-b3df-d603007f813a','Tahina','Rajaona','Antananarivo','2023-03-08',85,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('326bd268-0f2c-425a-9d0d-182ef5ac9537','QZ-570-0','b85efec2-04c3-4759-b3df-d603007f813a','moto',816,'2018-03-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('08fdf7a6-fc87-4b8b-9b4e-945ab2075804','POLZ-570-0','b85efec2-04c3-4759-b3df-d603007f813a','326bd268-0f2c-425a-9d0d-182ef5ac9537','moto','2018-03-14','2019-03-14',944,0,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('fac32d21-d66a-4c49-a78d-332953e6ef2e','INCZ-570-0-0','08fdf7a6-fc87-4b8b-9b4e-945ab2075804','b85efec2-04c3-4759-b3df-d603007f813a','Incident','Déclaration de sinistre','2022-02-18','moto','leger','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('3877b7ea-1dc0-41db-af98-065d79b6482a','INCZ-570-0-1','08fdf7a6-fc87-4b8b-9b4e-945ab2075804','b85efec2-04c3-4759-b3df-d603007f813a','Incident','Déclaration de sinistre','2024-04-29','moto','leger','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7368a9a4-efeb-4766-a941-2f4974d9c3c7','QZ-570-1','b85efec2-04c3-4759-b3df-d603007f813a','sante',633,'2019-07-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('1377d36e-a8c3-4837-981f-51e4b92bb8cb','POLZ-570-1','b85efec2-04c3-4759-b3df-d603007f813a','7368a9a4-efeb-4766-a941-2f4974d9c3c7','sante','2019-07-24','2020-07-24',350,1,'premium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('70207e65-b8f2-4946-b105-ba5130902688','user571@rich.com',crypt('test123', gen_salt('bf')),'client','2025-07-08');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('70207e65-b8f2-4946-b105-ba5130902688','Tovo','Rakotomalala','Antananarivo','2025-07-08',45,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f7bc544c-dd6e-4385-9490-a31f7d9ae88b','QZ-571-0','70207e65-b8f2-4946-b105-ba5130902688','moto',797,'2019-10-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('36f217fa-03e3-4eff-99d5-f4070ff43fe0','POLZ-571-0','70207e65-b8f2-4946-b105-ba5130902688','f7bc544c-dd6e-4385-9490-a31f7d9ae88b','moto','2019-10-28','2020-10-28',469,31,'basic','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('53be2a51-6d52-4b3e-8200-5ed578239010','QZ-571-1','70207e65-b8f2-4946-b105-ba5130902688','sante',634,'2019-10-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5d7ec587-37e4-4d52-b283-ff0c6dab41de','POLZ-571-1','70207e65-b8f2-4946-b105-ba5130902688','53be2a51-6d52-4b3e-8200-5ed578239010','sante','2019-10-13','2020-10-13',665,46,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('efbd04b4-ae5d-49e6-b0f9-e774b7d2b130','INCZ-571-1-0','5d7ec587-37e4-4d52-b283-ff0c6dab41de','70207e65-b8f2-4946-b105-ba5130902688','Incident','Déclaration de sinistre','2024-04-24','sante','leger','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('89f374a9-2e49-4bd1-a42e-f4be098c8253','QZ-571-2','70207e65-b8f2-4946-b105-ba5130902688','moto',418,'2023-04-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('01e2557f-d57a-45ee-8564-01a7bf98ead0','POLZ-571-2','70207e65-b8f2-4946-b105-ba5130902688','89f374a9-2e49-4bd1-a42e-f4be098c8253','moto','2023-04-08','2024-04-08',984,17,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('a69c0607-fd81-42bc-8171-8d3a0b692caf','INCZ-571-2-0','01e2557f-d57a-45ee-8564-01a7bf98ead0','70207e65-b8f2-4946-b105-ba5130902688','Incident','Déclaration de sinistre','2025-06-24','moto','moyen','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('d7049b00-4540-4c69-93ae-280f5882aa99','user572@rich.com',crypt('test123', gen_salt('bf')),'client','2024-12-06');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('d7049b00-4540-4c69-93ae-280f5882aa99','Mamy','Randriamanana','Antananarivo','2024-12-06',32,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7e2208f8-bb85-46ac-af01-6f5f48f711ad','QZ-572-0','d7049b00-4540-4c69-93ae-280f5882aa99','sante',786,'2018-11-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('b807cc4f-a319-4408-bf65-b7ca48279cc0','POLZ-572-0','d7049b00-4540-4c69-93ae-280f5882aa99','7e2208f8-bb85-46ac-af01-6f5f48f711ad','sante','2018-11-14','2019-11-14',298,16,'premium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('7e5f31ca-4fbc-4d0f-bbe2-fa5a687b52ce','user573@rich.com',crypt('test123', gen_salt('bf')),'client','2023-01-05');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('7e5f31ca-4fbc-4d0f-bbe2-fa5a687b52ce','Hery','Ravelona','Antananarivo','2023-01-05',77,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('faddd9ce-4102-46d0-ac3c-48fdd1f5dcd3','QZ-573-0','7e5f31ca-4fbc-4d0f-bbe2-fa5a687b52ce','sante',398,'2018-04-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('451fbdc0-c750-4bdb-97b6-76670e34666b','POLZ-573-0','7e5f31ca-4fbc-4d0f-bbe2-fa5a687b52ce','faddd9ce-4102-46d0-ac3c-48fdd1f5dcd3','sante','2018-04-14','2019-04-14',782,40,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('6048fb5b-1593-4163-a740-c481aed84f7a','INCZ-573-0-0','451fbdc0-c750-4bdb-97b6-76670e34666b','7e5f31ca-4fbc-4d0f-bbe2-fa5a687b52ce','Incident','Déclaration de sinistre','2023-04-24','sante','moyen','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('5875d54e-b814-4807-8421-001e2fc476d9','INCZ-573-0-1','451fbdc0-c750-4bdb-97b6-76670e34666b','7e5f31ca-4fbc-4d0f-bbe2-fa5a687b52ce','Incident','Déclaration de sinistre','2018-08-25','sante','leger','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('5f13fe2a-8276-4599-b4ad-5f848fa7a81c','QZ-573-1','7e5f31ca-4fbc-4d0f-bbe2-fa5a687b52ce','moto',329,'2018-11-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('85caa7e3-bb25-4aa2-9a95-404c615ccba7','POLZ-573-1','7e5f31ca-4fbc-4d0f-bbe2-fa5a687b52ce','5f13fe2a-8276-4599-b4ad-5f848fa7a81c','moto','2018-11-13','2019-11-13',936,12,'premium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('046f67f8-e589-4197-89cd-9b7fd5912e67','user574@rich.com',crypt('test123', gen_salt('bf')),'client','2022-06-06');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('046f67f8-e589-4197-89cd-9b7fd5912e67','Tovo','Rakotomalala','Antananarivo','2022-06-06',97,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('db2c4df3-9423-40e1-85e7-9cf63901afae','QZ-574-0','046f67f8-e589-4197-89cd-9b7fd5912e67','auto',576,'2023-03-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('701a90af-169b-43d5-8b59-16e3538aca62','POLZ-574-0','046f67f8-e589-4197-89cd-9b7fd5912e67','db2c4df3-9423-40e1-85e7-9cf63901afae','auto','2023-03-14','2024-03-14',246,16,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('467c1388-9a87-4734-abef-b029672036ee','INCZ-574-0-0','701a90af-169b-43d5-8b59-16e3538aca62','046f67f8-e589-4197-89cd-9b7fd5912e67','Incident','Déclaration de sinistre','2023-06-21','auto','leger','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('10081ecc-4e6f-4a1e-b76a-6259661034a1','INCZ-574-0-1','701a90af-169b-43d5-8b59-16e3538aca62','046f67f8-e589-4197-89cd-9b7fd5912e67','Incident','Déclaration de sinistre','2018-01-29','auto','leger','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('da0bdb70-99a6-4bba-8ead-b7ead85892c3','QZ-574-1','046f67f8-e589-4197-89cd-9b7fd5912e67','auto',229,'2019-05-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('d1593581-c9e6-4d0f-86ff-ffce5ec33fc1','POLZ-574-1','046f67f8-e589-4197-89cd-9b7fd5912e67','da0bdb70-99a6-4bba-8ead-b7ead85892c3','auto','2019-05-04','2020-05-04',684,5,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('57fb69c1-e88f-4220-b592-b5412dc871c0','INCZ-574-1-0','d1593581-c9e6-4d0f-86ff-ffce5ec33fc1','046f67f8-e589-4197-89cd-9b7fd5912e67','Incident','Déclaration de sinistre','2021-06-24','auto','leger','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('e13c0680-9660-4902-93ba-7ee51329eef3','INCZ-574-1-1','d1593581-c9e6-4d0f-86ff-ffce5ec33fc1','046f67f8-e589-4197-89cd-9b7fd5912e67','Incident','Déclaration de sinistre','2025-01-22','auto','leger','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a03b9a48-8268-4a31-9cb9-94e1b452236d','user575@rich.com',crypt('test123', gen_salt('bf')),'client','2025-06-05');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('a03b9a48-8268-4a31-9cb9-94e1b452236d','Tahina','Randriamanana','Antananarivo','2025-06-05',98,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('33a18fa2-02d3-4b14-80b0-b7107f22f111','QZ-575-0','a03b9a48-8268-4a31-9cb9-94e1b452236d','sante',339,'2026-02-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('8eaee1be-b78d-4943-bd82-7e56edb51b55','POLZ-575-0','a03b9a48-8268-4a31-9cb9-94e1b452236d','33a18fa2-02d3-4b14-80b0-b7107f22f111','sante','2026-02-07','2027-02-07',306,11,'medium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('67468be4-3499-48fc-b7b1-c35d36c290cc','user576@rich.com',crypt('test123', gen_salt('bf')),'client','2022-04-24');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('67468be4-3499-48fc-b7b1-c35d36c290cc','Clara','Rajaona','Antananarivo','2022-04-24',19,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a4a1f0a0-070b-4e2f-b2d4-d30b8596ad57','QZ-576-0','67468be4-3499-48fc-b7b1-c35d36c290cc','moto',855,'2020-03-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('47dd8e9b-5356-4404-9f73-fe6e3a16fe72','POLZ-576-0','67468be4-3499-48fc-b7b1-c35d36c290cc','a4a1f0a0-070b-4e2f-b2d4-d30b8596ad57','moto','2020-03-11','2021-03-11',81,47,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('2a531739-3ac4-459e-87ae-196d26c1537b','INCZ-576-0-0','47dd8e9b-5356-4404-9f73-fe6e3a16fe72','67468be4-3499-48fc-b7b1-c35d36c290cc','Incident','Déclaration de sinistre','2019-01-15','moto','moyen','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('9fd9698d-3ef5-4d62-8c5c-f57613d2b821','user577@rich.com',crypt('test123', gen_salt('bf')),'client','2019-07-26');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('9fd9698d-3ef5-4d62-8c5c-f57613d2b821','Clara','Andriamanitra','Antananarivo','2019-07-26',34,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('86e88d37-d1a9-42f2-8780-3110ea598b31','QZ-577-0','9fd9698d-3ef5-4d62-8c5c-f57613d2b821','sante',751,'2023-06-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('677680e0-9aa7-469d-b896-95f7f2a46fed','POLZ-577-0','9fd9698d-3ef5-4d62-8c5c-f57613d2b821','86e88d37-d1a9-42f2-8780-3110ea598b31','sante','2023-06-11','2024-06-11',764,3,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('3ebb2324-a7cf-4a99-a38c-13548e10bbf3','INCZ-577-0-0','677680e0-9aa7-469d-b896-95f7f2a46fed','9fd9698d-3ef5-4d62-8c5c-f57613d2b821','Incident','Déclaration de sinistre','2022-08-20','sante','leger','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('a507e630-1eb6-4b2d-b2bf-4ddef88f5076','INCZ-577-0-1','677680e0-9aa7-469d-b896-95f7f2a46fed','9fd9698d-3ef5-4d62-8c5c-f57613d2b821','Incident','Déclaration de sinistre','2021-12-07','sante','eleve','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('718c0b44-80b0-4016-a218-43d12aac7352','QZ-577-1','9fd9698d-3ef5-4d62-8c5c-f57613d2b821','moto',462,'2025-10-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('ba9f0d00-6d10-4bce-8139-ea8578d5975b','POLZ-577-1','9fd9698d-3ef5-4d62-8c5c-f57613d2b821','718c0b44-80b0-4016-a218-43d12aac7352','moto','2025-10-09','2026-10-09',371,45,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('869fdf58-e329-4755-b535-30a126833196','INCZ-577-1-0','ba9f0d00-6d10-4bce-8139-ea8578d5975b','9fd9698d-3ef5-4d62-8c5c-f57613d2b821','Incident','Déclaration de sinistre','2024-10-05','moto','leger','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7b3ca766-7304-4fa5-8bf1-33f5ffbbeffd','QZ-577-2','9fd9698d-3ef5-4d62-8c5c-f57613d2b821','moto',918,'2026-03-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('60eedb39-1a86-40c1-998c-bc03d8b064fb','POLZ-577-2','9fd9698d-3ef5-4d62-8c5c-f57613d2b821','7b3ca766-7304-4fa5-8bf1-33f5ffbbeffd','moto','2026-03-04','2027-03-04',990,39,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('61ab4bb9-832e-4049-a0c4-9e126d1278ee','INCZ-577-2-0','60eedb39-1a86-40c1-998c-bc03d8b064fb','9fd9698d-3ef5-4d62-8c5c-f57613d2b821','Incident','Déclaration de sinistre','2023-04-08','moto','eleve','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('9fc3cd74-4ec5-4bae-be3f-98504fbe03ce','user578@rich.com',crypt('test123', gen_salt('bf')),'client','2023-01-16');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('9fc3cd74-4ec5-4bae-be3f-98504fbe03ce','Clara','Randriamanana','Antananarivo','2023-01-16',28,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('4ceb8b4d-9a43-4ffe-8162-40c773a72d94','QZ-578-0','9fc3cd74-4ec5-4bae-be3f-98504fbe03ce','auto',580,'2022-05-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5cc1a70f-c9dc-4e89-b633-aa411b1dc569','POLZ-578-0','9fc3cd74-4ec5-4bae-be3f-98504fbe03ce','4ceb8b4d-9a43-4ffe-8162-40c773a72d94','auto','2022-05-21','2023-05-21',69,32,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('50c1563f-e940-47ce-a6f8-8856110780c9','INCZ-578-0-0','5cc1a70f-c9dc-4e89-b633-aa411b1dc569','9fc3cd74-4ec5-4bae-be3f-98504fbe03ce','Incident','Déclaration de sinistre','2026-02-17','auto','leger','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('26ca0d18-cebf-43f5-9f99-ee64f2d6c031','INCZ-578-0-1','5cc1a70f-c9dc-4e89-b633-aa411b1dc569','9fc3cd74-4ec5-4bae-be3f-98504fbe03ce','Incident','Déclaration de sinistre','2021-08-12','auto','eleve','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('f13ae822-3bb9-4947-a2f9-70104144a8e5','user579@rich.com',crypt('test123', gen_salt('bf')),'client','2019-04-17');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('f13ae822-3bb9-4947-a2f9-70104144a8e5','Clara','Ravelona','Antananarivo','2019-04-17',68,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('81708b9d-b959-4810-a14d-1e6a94ccb182','QZ-579-0','f13ae822-3bb9-4947-a2f9-70104144a8e5','auto',877,'2024-04-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('0eef1793-5577-4c6c-b2a9-29f1ab0a9dd8','POLZ-579-0','f13ae822-3bb9-4947-a2f9-70104144a8e5','81708b9d-b959-4810-a14d-1e6a94ccb182','auto','2024-04-24','2025-04-24',503,15,'medium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e19393b3-ad1f-41f3-ab5f-1160bd787e77','QZ-579-1','f13ae822-3bb9-4947-a2f9-70104144a8e5','auto',95,'2023-01-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('c390de81-3559-4348-8937-2d85303fdc1e','POLZ-579-1','f13ae822-3bb9-4947-a2f9-70104144a8e5','e19393b3-ad1f-41f3-ab5f-1160bd787e77','auto','2023-01-24','2024-01-24',109,40,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('90e292fb-2ead-4bb9-81eb-3cb51f2b34d8','INCZ-579-1-0','c390de81-3559-4348-8937-2d85303fdc1e','f13ae822-3bb9-4947-a2f9-70104144a8e5','Incident','Déclaration de sinistre','2019-07-28','auto','leger','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('75b44a16-3a9c-4197-9d34-a45e03bcf6e6','QZ-579-2','f13ae822-3bb9-4947-a2f9-70104144a8e5','sante',644,'2020-09-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('60ef70cf-07a4-4954-a51d-c0ed8ff04090','POLZ-579-2','f13ae822-3bb9-4947-a2f9-70104144a8e5','75b44a16-3a9c-4197-9d34-a45e03bcf6e6','sante','2020-09-02','2021-09-02',113,9,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('e00f9832-f602-4fa0-8790-848549c1bcd9','INCZ-579-2-0','60ef70cf-07a4-4954-a51d-c0ed8ff04090','f13ae822-3bb9-4947-a2f9-70104144a8e5','Incident','Déclaration de sinistre','2023-08-17','sante','eleve','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('913d49ce-87e8-4ab7-832a-9687f647f5e4','INCZ-579-2-1','60ef70cf-07a4-4954-a51d-c0ed8ff04090','f13ae822-3bb9-4947-a2f9-70104144a8e5','Incident','Déclaration de sinistre','2023-10-20','sante','moyen','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('24cb4c4c-623f-4271-85ba-62fe24b2f0b0','user580@rich.com',crypt('test123', gen_salt('bf')),'client','2019-08-11');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('24cb4c4c-623f-4271-85ba-62fe24b2f0b0','Nantenaina','Rakotomalala','Antananarivo','2019-08-11',46,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ce6f7b90-f9a4-4929-b599-c4c9fb170247','QZ-580-0','24cb4c4c-623f-4271-85ba-62fe24b2f0b0','moto',696,'2021-06-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('cdd59214-6060-496b-a8cd-bd7aaea762de','POLZ-580-0','24cb4c4c-623f-4271-85ba-62fe24b2f0b0','ce6f7b90-f9a4-4929-b599-c4c9fb170247','moto','2021-06-21','2022-06-21',206,7,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('2b676287-cf44-4911-8181-281a0b7b404e','INCZ-580-0-0','cdd59214-6060-496b-a8cd-bd7aaea762de','24cb4c4c-623f-4271-85ba-62fe24b2f0b0','Incident','Déclaration de sinistre','2021-08-06','moto','eleve','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('a9b7bd44-e7b2-4adb-889a-690011b148a3','INCZ-580-0-1','cdd59214-6060-496b-a8cd-bd7aaea762de','24cb4c4c-623f-4271-85ba-62fe24b2f0b0','Incident','Déclaration de sinistre','2021-07-23','moto','eleve','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c685fa7e-c3dd-4196-acc5-3c7debd44f4b','QZ-580-1','24cb4c4c-623f-4271-85ba-62fe24b2f0b0','auto',674,'2024-08-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('1146b141-5d35-4d71-81ed-fa499e49f0d4','POLZ-580-1','24cb4c4c-623f-4271-85ba-62fe24b2f0b0','c685fa7e-c3dd-4196-acc5-3c7debd44f4b','auto','2024-08-21','2025-08-21',803,27,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('ab3e9904-ffec-4a85-8967-0e68f4fabfb0','INCZ-580-1-0','1146b141-5d35-4d71-81ed-fa499e49f0d4','24cb4c4c-623f-4271-85ba-62fe24b2f0b0','Incident','Déclaration de sinistre','2018-08-18','auto','moyen','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('5c99579d-1ed3-4eb5-8bdb-8ff99549757b','INCZ-580-1-1','1146b141-5d35-4d71-81ed-fa499e49f0d4','24cb4c4c-623f-4271-85ba-62fe24b2f0b0','Incident','Déclaration de sinistre','2020-12-09','auto','moyen','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('4b597e4e-f2c0-4c21-b0af-d59a3527f5c7','QZ-580-2','24cb4c4c-623f-4271-85ba-62fe24b2f0b0','moto',67,'2018-10-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('446709d0-7208-4ea6-9441-482fbb17ccdc','POLZ-580-2','24cb4c4c-623f-4271-85ba-62fe24b2f0b0','4b597e4e-f2c0-4c21-b0af-d59a3527f5c7','moto','2018-10-02','2019-10-02',192,34,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('23eae0d5-aed5-424b-83fd-5185d1faebbb','INCZ-580-2-0','446709d0-7208-4ea6-9441-482fbb17ccdc','24cb4c4c-623f-4271-85ba-62fe24b2f0b0','Incident','Déclaration de sinistre','2020-09-22','moto','leger','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('35c9c385-295f-40f5-88c6-23cd6488f22a','user581@rich.com',crypt('test123', gen_salt('bf')),'client','2024-10-18');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('35c9c385-295f-40f5-88c6-23cd6488f22a','Zo','Rasoan','Antananarivo','2024-10-18',57,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ef037425-1c34-4f69-8feb-1e76cd72f8c5','QZ-581-0','35c9c385-295f-40f5-88c6-23cd6488f22a','sante',380,'2019-09-15');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('7199896f-58b7-4eb6-8315-081d79077d5b','POLZ-581-0','35c9c385-295f-40f5-88c6-23cd6488f22a','ef037425-1c34-4f69-8feb-1e76cd72f8c5','sante','2019-09-15','2020-09-15',528,32,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('c50b0fe9-c8c8-4abf-a549-f0d63f704e52','INCZ-581-0-0','7199896f-58b7-4eb6-8315-081d79077d5b','35c9c385-295f-40f5-88c6-23cd6488f22a','Incident','Déclaration de sinistre','2020-05-09','sante','leger','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('27f31671-9993-4dff-aae5-4d512212ade2','user582@rich.com',crypt('test123', gen_salt('bf')),'client','2022-12-31');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('27f31671-9993-4dff-aae5-4d512212ade2','Zo','Randriamanana','Antananarivo','2022-12-31',75,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3838cb8e-394f-4a00-bebf-1151f506e7a0','QZ-582-0','27f31671-9993-4dff-aae5-4d512212ade2','sante',771,'2024-06-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('64ab357a-a9f1-4282-b4f3-73db70be9da3','POLZ-582-0','27f31671-9993-4dff-aae5-4d512212ade2','3838cb8e-394f-4a00-bebf-1151f506e7a0','sante','2024-06-25','2025-06-25',861,1,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('9926fd58-9d2f-4195-8f13-db22fc46c369','INCZ-582-0-0','64ab357a-a9f1-4282-b4f3-73db70be9da3','27f31671-9993-4dff-aae5-4d512212ade2','Incident','Déclaration de sinistre','2020-06-11','sante','moyen','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('4d14dd4f-b37d-4b14-b8f9-a9e2487d53e8','user583@rich.com',crypt('test123', gen_salt('bf')),'client','2022-12-13');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('4d14dd4f-b37d-4b14-b8f9-a9e2487d53e8','Hery','Rasoan','Antananarivo','2022-12-13',61,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('53fa365f-28c4-4cc4-8d96-64d42d5df348','QZ-583-0','4d14dd4f-b37d-4b14-b8f9-a9e2487d53e8','auto',122,'2018-12-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('8877d9d6-9f34-46d7-b3de-1cfebe27c773','POLZ-583-0','4d14dd4f-b37d-4b14-b8f9-a9e2487d53e8','53fa365f-28c4-4cc4-8d96-64d42d5df348','auto','2018-12-21','2019-12-21',217,32,'premium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('be53fbfe-c0f7-4371-b107-7773a8b1fdd7','QZ-583-1','4d14dd4f-b37d-4b14-b8f9-a9e2487d53e8','moto',219,'2025-05-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('be514230-4d89-444b-8d2d-8dec2d2e571e','POLZ-583-1','4d14dd4f-b37d-4b14-b8f9-a9e2487d53e8','be53fbfe-c0f7-4371-b107-7773a8b1fdd7','moto','2025-05-21','2026-05-21',621,14,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('eca717c3-1447-4ffa-9f2b-f394297e519d','INCZ-583-1-0','be514230-4d89-444b-8d2d-8dec2d2e571e','4d14dd4f-b37d-4b14-b8f9-a9e2487d53e8','Incident','Déclaration de sinistre','2018-03-08','moto','leger','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('0ef9a4e4-544e-4159-b3d6-6892f84fc96a','INCZ-583-1-1','be514230-4d89-444b-8d2d-8dec2d2e571e','4d14dd4f-b37d-4b14-b8f9-a9e2487d53e8','Incident','Déclaration de sinistre','2022-11-16','moto','moyen','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('99f184c1-2e07-4a2b-bab3-c5d20e7b147a','user584@rich.com',crypt('test123', gen_salt('bf')),'client','2021-06-05');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('99f184c1-2e07-4a2b-bab3-c5d20e7b147a','Tahina','Razaka','Antananarivo','2021-06-05',97,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('084c8b52-6598-4120-b389-f2fa34c01284','QZ-584-0','99f184c1-2e07-4a2b-bab3-c5d20e7b147a','sante',623,'2022-11-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('3d424e99-41b1-4b50-a81f-0d764f695233','POLZ-584-0','99f184c1-2e07-4a2b-bab3-c5d20e7b147a','084c8b52-6598-4120-b389-f2fa34c01284','sante','2022-11-09','2023-11-09',961,40,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('4178f99a-6e45-4f59-8edc-0727923f4e57','INCZ-584-0-0','3d424e99-41b1-4b50-a81f-0d764f695233','99f184c1-2e07-4a2b-bab3-c5d20e7b147a','Incident','Déclaration de sinistre','2019-11-18','sante','eleve','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('56c5d342-ac28-4a54-89c8-a7cda0ce322d','INCZ-584-0-1','3d424e99-41b1-4b50-a81f-0d764f695233','99f184c1-2e07-4a2b-bab3-c5d20e7b147a','Incident','Déclaration de sinistre','2024-03-25','sante','leger','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3c4a91da-4d9e-4fac-b6fb-92ebc7a083c7','QZ-584-1','99f184c1-2e07-4a2b-bab3-c5d20e7b147a','moto',236,'2022-02-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e35e577c-a257-4f2e-91b1-fe52cd094945','POLZ-584-1','99f184c1-2e07-4a2b-bab3-c5d20e7b147a','3c4a91da-4d9e-4fac-b6fb-92ebc7a083c7','moto','2022-02-05','2023-02-05',81,7,'basic','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('4eaaeea7-541f-43d0-b049-4993dc7a8cef','user585@rich.com',crypt('test123', gen_salt('bf')),'client','2026-02-26');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('4eaaeea7-541f-43d0-b049-4993dc7a8cef','Mamy','Randriamanana','Antananarivo','2026-02-26',50,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7baf6ca0-7321-4a58-8032-34f5e9bf13d6','QZ-585-0','4eaaeea7-541f-43d0-b049-4993dc7a8cef','moto',149,'2023-10-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('bcd013e6-0e5c-4ec4-880f-aa91299965cc','POLZ-585-0','4eaaeea7-541f-43d0-b049-4993dc7a8cef','7baf6ca0-7321-4a58-8032-34f5e9bf13d6','moto','2023-10-14','2024-10-14',989,42,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('d1946ac7-b408-4272-891e-4fdc417e140b','INCZ-585-0-0','bcd013e6-0e5c-4ec4-880f-aa91299965cc','4eaaeea7-541f-43d0-b049-4993dc7a8cef','Incident','Déclaration de sinistre','2026-03-15','moto','eleve','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('b415e582-0e8f-4827-8970-83f18c887497','INCZ-585-0-1','bcd013e6-0e5c-4ec4-880f-aa91299965cc','4eaaeea7-541f-43d0-b049-4993dc7a8cef','Incident','Déclaration de sinistre','2019-08-11','moto','moyen','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0e550683-b48d-43a1-8402-a81da89acc12','QZ-585-1','4eaaeea7-541f-43d0-b049-4993dc7a8cef','auto',81,'2019-08-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('bda106ca-29b1-4c1c-a170-8b93fbbedbc5','POLZ-585-1','4eaaeea7-541f-43d0-b049-4993dc7a8cef','0e550683-b48d-43a1-8402-a81da89acc12','auto','2019-08-02','2020-08-02',170,3,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('f260eaa4-e5a2-43c2-b9ef-8763133b0964','INCZ-585-1-0','bda106ca-29b1-4c1c-a170-8b93fbbedbc5','4eaaeea7-541f-43d0-b049-4993dc7a8cef','Incident','Déclaration de sinistre','2019-12-20','auto','leger','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('4e6dee0f-63cc-45d4-8f6b-2fc350a4c7b4','QZ-585-2','4eaaeea7-541f-43d0-b049-4993dc7a8cef','auto',433,'2022-03-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('18e67349-6e5e-403f-be9b-b55b09520c7e','POLZ-585-2','4eaaeea7-541f-43d0-b049-4993dc7a8cef','4e6dee0f-63cc-45d4-8f6b-2fc350a4c7b4','auto','2022-03-07','2023-03-07',907,17,'basic','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('71c5cbd5-8c77-4f7f-9c52-d3b3717cdbca','user586@rich.com',crypt('test123', gen_salt('bf')),'client','2025-06-19');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('71c5cbd5-8c77-4f7f-9c52-d3b3717cdbca','Nantenaina','Rasoan','Antananarivo','2025-06-19',24,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('11d5e6d1-bd3a-442b-915d-316342025274','QZ-586-0','71c5cbd5-8c77-4f7f-9c52-d3b3717cdbca','sante',880,'2018-02-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('9e157bef-0095-47cc-b13c-7ec916cc644c','POLZ-586-0','71c5cbd5-8c77-4f7f-9c52-d3b3717cdbca','11d5e6d1-bd3a-442b-915d-316342025274','sante','2018-02-12','2019-02-12',673,49,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('d33ad708-7e03-48b6-b15a-fcd2f95491be','INCZ-586-0-0','9e157bef-0095-47cc-b13c-7ec916cc644c','71c5cbd5-8c77-4f7f-9c52-d3b3717cdbca','Incident','Déclaration de sinistre','2022-01-22','sante','eleve','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('46e42309-8b14-4249-a45f-6d16a8f5fa12','QZ-586-1','71c5cbd5-8c77-4f7f-9c52-d3b3717cdbca','moto',830,'2025-11-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('58beba38-a761-468f-9f02-cfb7bcd1ce01','POLZ-586-1','71c5cbd5-8c77-4f7f-9c52-d3b3717cdbca','46e42309-8b14-4249-a45f-6d16a8f5fa12','moto','2025-11-30','2026-11-30',543,28,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('d1647e03-4ab0-4e63-87af-bb90c7e3ea79','INCZ-586-1-0','58beba38-a761-468f-9f02-cfb7bcd1ce01','71c5cbd5-8c77-4f7f-9c52-d3b3717cdbca','Incident','Déclaration de sinistre','2022-09-26','moto','eleve','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c6d7a0bf-50eb-46bb-a5ce-13449d90a207','QZ-586-2','71c5cbd5-8c77-4f7f-9c52-d3b3717cdbca','moto',238,'2020-11-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('fab7c645-5fde-4fe4-aeaf-21ea8a723fc9','POLZ-586-2','71c5cbd5-8c77-4f7f-9c52-d3b3717cdbca','c6d7a0bf-50eb-46bb-a5ce-13449d90a207','moto','2020-11-11','2021-11-11',66,37,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('c96da367-35f3-4da3-a47b-6b34937705a4','INCZ-586-2-0','fab7c645-5fde-4fe4-aeaf-21ea8a723fc9','71c5cbd5-8c77-4f7f-9c52-d3b3717cdbca','Incident','Déclaration de sinistre','2022-02-23','moto','leger','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('5c8d439d-3e6c-4d5d-9a43-e4e1c7552bec','INCZ-586-2-1','fab7c645-5fde-4fe4-aeaf-21ea8a723fc9','71c5cbd5-8c77-4f7f-9c52-d3b3717cdbca','Incident','Déclaration de sinistre','2020-02-25','moto','moyen','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ce8765a5-2bb7-4b5e-9f1f-017ceb96fd13','user587@rich.com',crypt('test123', gen_salt('bf')),'client','2022-11-20');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('ce8765a5-2bb7-4b5e-9f1f-017ceb96fd13','Alex','Rajaona','Antananarivo','2022-11-20',14,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('155fab3f-030f-4967-a08e-a47332b364b3','QZ-587-0','ce8765a5-2bb7-4b5e-9f1f-017ceb96fd13','auto',199,'2018-10-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('c016fa4b-1b97-4068-9cd3-4ebeba48ce54','POLZ-587-0','ce8765a5-2bb7-4b5e-9f1f-017ceb96fd13','155fab3f-030f-4967-a08e-a47332b364b3','auto','2018-10-28','2019-10-28',570,38,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('6c49f223-5b5e-4a3c-a188-c3feb1eb9eee','INCZ-587-0-0','c016fa4b-1b97-4068-9cd3-4ebeba48ce54','ce8765a5-2bb7-4b5e-9f1f-017ceb96fd13','Incident','Déclaration de sinistre','2024-06-26','auto','leger','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0cf4d7d6-1184-4c4a-979e-ad76fc54b5c5','QZ-587-1','ce8765a5-2bb7-4b5e-9f1f-017ceb96fd13','auto',801,'2020-04-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('aca9822d-2d54-4e2a-a125-3ad402e57cc9','POLZ-587-1','ce8765a5-2bb7-4b5e-9f1f-017ceb96fd13','0cf4d7d6-1184-4c4a-979e-ad76fc54b5c5','auto','2020-04-30','2021-04-30',552,50,'basic','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('579fefc4-f73f-4087-bd62-31ee3a3f47b6','user588@rich.com',crypt('test123', gen_salt('bf')),'client','2018-03-03');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('579fefc4-f73f-4087-bd62-31ee3a3f47b6','Alex','Randriamanana','Antananarivo','2018-03-03',63,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('4a3d8d74-8efe-471b-bbc7-190b0baeffcc','QZ-588-0','579fefc4-f73f-4087-bd62-31ee3a3f47b6','auto',840,'2021-11-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('c5839f25-22c8-49be-a739-40547ac0c6a5','POLZ-588-0','579fefc4-f73f-4087-bd62-31ee3a3f47b6','4a3d8d74-8efe-471b-bbc7-190b0baeffcc','auto','2021-11-05','2022-11-05',798,15,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('fc5d5692-9ab0-4626-bb16-056a8ff9d322','INCZ-588-0-0','c5839f25-22c8-49be-a739-40547ac0c6a5','579fefc4-f73f-4087-bd62-31ee3a3f47b6','Incident','Déclaration de sinistre','2021-01-15','auto','eleve','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('e4f4c5f5-6b32-4c9e-a168-80d2b491c24d','INCZ-588-0-1','c5839f25-22c8-49be-a739-40547ac0c6a5','579fefc4-f73f-4087-bd62-31ee3a3f47b6','Incident','Déclaration de sinistre','2025-07-13','auto','moyen','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('b05c49a1-8296-4b9c-99cd-11d21b19a209','user589@rich.com',crypt('test123', gen_salt('bf')),'client','2025-06-04');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('b05c49a1-8296-4b9c-99cd-11d21b19a209','Nantenaina','Rajaona','Antananarivo','2025-06-04',14,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('842d76ad-4433-4cbc-bdd1-6ae9912fcc17','QZ-589-0','b05c49a1-8296-4b9c-99cd-11d21b19a209','sante',434,'2021-06-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('7b51762c-b2ac-4f09-81f6-4b855667c2dc','POLZ-589-0','b05c49a1-8296-4b9c-99cd-11d21b19a209','842d76ad-4433-4cbc-bdd1-6ae9912fcc17','sante','2021-06-12','2022-06-12',546,16,'premium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('29797acd-10a2-47ea-88ba-4ad3d02a25a5','QZ-589-1','b05c49a1-8296-4b9c-99cd-11d21b19a209','moto',891,'2022-06-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('b76acdfa-827c-485e-8a7e-60140a5f2bc7','POLZ-589-1','b05c49a1-8296-4b9c-99cd-11d21b19a209','29797acd-10a2-47ea-88ba-4ad3d02a25a5','moto','2022-06-02','2023-06-02',267,39,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('6c28a624-40a6-48af-9c33-439370a35727','INCZ-589-1-0','b76acdfa-827c-485e-8a7e-60140a5f2bc7','b05c49a1-8296-4b9c-99cd-11d21b19a209','Incident','Déclaration de sinistre','2018-01-14','moto','leger','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('95c379ab-1732-4d37-bb77-03df36c6b505','INCZ-589-1-1','b76acdfa-827c-485e-8a7e-60140a5f2bc7','b05c49a1-8296-4b9c-99cd-11d21b19a209','Incident','Déclaration de sinistre','2018-05-20','moto','leger','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('2177a366-278e-4183-b653-125b424b8752','user590@rich.com',crypt('test123', gen_salt('bf')),'client','2020-04-10');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('2177a366-278e-4183-b653-125b424b8752','Tovo','Rajaona','Antananarivo','2020-04-10',68,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e023716a-be26-4190-bd1a-34c2b61795ca','QZ-590-0','2177a366-278e-4183-b653-125b424b8752','sante',436,'2019-11-29');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('c23641e7-cdae-4abd-bd3e-86e179763531','POLZ-590-0','2177a366-278e-4183-b653-125b424b8752','e023716a-be26-4190-bd1a-34c2b61795ca','sante','2019-11-29','2020-11-29',234,37,'premium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a16bdcdf-aca3-4dac-ac95-d21facd738ea','QZ-590-1','2177a366-278e-4183-b653-125b424b8752','sante',288,'2025-01-15');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5590ae94-ed13-4dd5-a217-58eda7de29e1','POLZ-590-1','2177a366-278e-4183-b653-125b424b8752','a16bdcdf-aca3-4dac-ac95-d21facd738ea','sante','2025-01-15','2026-01-15',182,17,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('acd4ffe0-638f-43e6-8d63-6fffce845fbb','INCZ-590-1-0','5590ae94-ed13-4dd5-a217-58eda7de29e1','2177a366-278e-4183-b653-125b424b8752','Incident','Déclaration de sinistre','2024-04-11','sante','eleve','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('487de27d-79bf-4799-9e91-2afa927125b0','user591@rich.com',crypt('test123', gen_salt('bf')),'client','2026-01-21');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('487de27d-79bf-4799-9e91-2afa927125b0','Tovo','Ravelona','Antananarivo','2026-01-21',45,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8c933e85-20f5-4a43-b953-720b06e55d90','QZ-591-0','487de27d-79bf-4799-9e91-2afa927125b0','sante',449,'2022-03-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('3bf05805-dc4a-401d-9c5b-32fa13387432','POLZ-591-0','487de27d-79bf-4799-9e91-2afa927125b0','8c933e85-20f5-4a43-b953-720b06e55d90','sante','2022-03-17','2023-03-17',525,33,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('7e0656b8-50a2-4039-9db1-73e42206ae48','INCZ-591-0-0','3bf05805-dc4a-401d-9c5b-32fa13387432','487de27d-79bf-4799-9e91-2afa927125b0','Incident','Déclaration de sinistre','2022-12-26','sante','leger','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('baca2a2e-b63e-4f1b-a979-4fe391ada49e','INCZ-591-0-1','3bf05805-dc4a-401d-9c5b-32fa13387432','487de27d-79bf-4799-9e91-2afa927125b0','Incident','Déclaration de sinistre','2025-08-22','sante','leger','en_cours');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8b1c9359-c140-41b9-94b9-0075edbd3d94','QZ-591-1','487de27d-79bf-4799-9e91-2afa927125b0','sante',956,'2019-01-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('3bf8daa6-9db3-4090-81d9-c56cd4269e20','POLZ-591-1','487de27d-79bf-4799-9e91-2afa927125b0','8b1c9359-c140-41b9-94b9-0075edbd3d94','sante','2019-01-04','2020-01-04',914,33,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('5fb60705-7079-43c0-824a-2702cee3636b','INCZ-591-1-0','3bf8daa6-9db3-4090-81d9-c56cd4269e20','487de27d-79bf-4799-9e91-2afa927125b0','Incident','Déclaration de sinistre','2024-01-18','sante','moyen','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('8269577b-f4a7-4702-ba64-6de3dcde5cd8','INCZ-591-1-1','3bf8daa6-9db3-4090-81d9-c56cd4269e20','487de27d-79bf-4799-9e91-2afa927125b0','Incident','Déclaration de sinistre','2026-02-11','sante','eleve','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9f316c98-3328-44ae-9ace-4e40f02057a3','QZ-591-2','487de27d-79bf-4799-9e91-2afa927125b0','auto',691,'2021-09-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e92ebd79-1e20-4d40-9f42-2cc9a60ab458','POLZ-591-2','487de27d-79bf-4799-9e91-2afa927125b0','9f316c98-3328-44ae-9ace-4e40f02057a3','auto','2021-09-08','2022-09-08',530,33,'premium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('c90fcb2b-d619-4442-81a7-33608b0067d0','user592@rich.com',crypt('test123', gen_salt('bf')),'client','2018-11-12');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('c90fcb2b-d619-4442-81a7-33608b0067d0','Hery','Rasoan','Antananarivo','2018-11-12',66,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('235ffa03-dbc3-4f06-877d-1d02f7b5d043','QZ-592-0','c90fcb2b-d619-4442-81a7-33608b0067d0','sante',378,'2022-12-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('0163f771-27c4-47b1-9acb-1f98b38381ac','POLZ-592-0','c90fcb2b-d619-4442-81a7-33608b0067d0','235ffa03-dbc3-4f06-877d-1d02f7b5d043','sante','2022-12-01','2023-12-01',839,21,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('feb2691e-bbc7-482b-acd1-831a1cf39de7','INCZ-592-0-0','0163f771-27c4-47b1-9acb-1f98b38381ac','c90fcb2b-d619-4442-81a7-33608b0067d0','Incident','Déclaration de sinistre','2021-06-08','sante','leger','traite');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('e5c9462c-be28-4c2a-ae4b-b99aa5204d3d','INCZ-592-0-1','0163f771-27c4-47b1-9acb-1f98b38381ac','c90fcb2b-d619-4442-81a7-33608b0067d0','Incident','Déclaration de sinistre','2022-02-22','sante','leger','traite');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ba79a7de-2058-4bbf-bcb0-44925f0e5a46','user593@rich.com',crypt('test123', gen_salt('bf')),'client','2019-10-13');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('ba79a7de-2058-4bbf-bcb0-44925f0e5a46','Miora','Rakotomalala','Antananarivo','2019-10-13',63,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('795db99b-4f31-4353-92b0-5a6e269faf75','QZ-593-0','ba79a7de-2058-4bbf-bcb0-44925f0e5a46','auto',345,'2022-10-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('4929f70d-734e-4c8c-a805-93407643eee8','POLZ-593-0','ba79a7de-2058-4bbf-bcb0-44925f0e5a46','795db99b-4f31-4353-92b0-5a6e269faf75','auto','2022-10-02','2023-10-02',820,46,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('af30131d-3205-4bbf-b297-dbc4aa6750a5','INCZ-593-0-0','4929f70d-734e-4c8c-a805-93407643eee8','ba79a7de-2058-4bbf-bcb0-44925f0e5a46','Incident','Déclaration de sinistre','2025-09-18','auto','eleve','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('c1148a33-b156-4f8b-a683-ad2a09a074f9','INCZ-593-0-1','4929f70d-734e-4c8c-a805-93407643eee8','ba79a7de-2058-4bbf-bcb0-44925f0e5a46','Incident','Déclaration de sinistre','2019-09-18','auto','leger','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('132c9d49-0d23-4d1b-80b9-e2c1cb3b9019','QZ-593-1','ba79a7de-2058-4bbf-bcb0-44925f0e5a46','moto',244,'2026-01-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('b97c07f4-50f8-4aa4-b586-4eeba1c0f0c6','POLZ-593-1','ba79a7de-2058-4bbf-bcb0-44925f0e5a46','132c9d49-0d23-4d1b-80b9-e2c1cb3b9019','moto','2026-01-04','2027-01-04',642,28,'basic','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('a65e23e0-f289-4e5e-b001-321962e5f46c','INCZ-593-1-0','b97c07f4-50f8-4aa4-b586-4eeba1c0f0c6','ba79a7de-2058-4bbf-bcb0-44925f0e5a46','Incident','Déclaration de sinistre','2021-04-22','moto','moyen','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('042b5f93-5270-4d77-b879-a2ad8e86a056','INCZ-593-1-1','b97c07f4-50f8-4aa4-b586-4eeba1c0f0c6','ba79a7de-2058-4bbf-bcb0-44925f0e5a46','Incident','Déclaration de sinistre','2026-02-06','moto','moyen','en_attente');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('dded2fdb-670c-436a-b92a-4ed3cb0ff683','QZ-593-2','ba79a7de-2058-4bbf-bcb0-44925f0e5a46','moto',198,'2018-06-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('fd13aa7e-68f0-4de9-a9c6-8e5b16d8b960','POLZ-593-2','ba79a7de-2058-4bbf-bcb0-44925f0e5a46','dded2fdb-670c-436a-b92a-4ed3cb0ff683','moto','2018-06-13','2019-06-13',833,46,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('f622217c-3e2c-4dd2-95a6-abbace7fda39','INCZ-593-2-0','fd13aa7e-68f0-4de9-a9c6-8e5b16d8b960','ba79a7de-2058-4bbf-bcb0-44925f0e5a46','Incident','Déclaration de sinistre','2021-05-25','moto','leger','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('072c60ec-7256-43db-8e08-7d1473c332f3','INCZ-593-2-1','fd13aa7e-68f0-4de9-a9c6-8e5b16d8b960','ba79a7de-2058-4bbf-bcb0-44925f0e5a46','Incident','Déclaration de sinistre','2026-02-02','moto','eleve','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('3393023a-1415-49c9-bfcc-91784891f38c','user594@rich.com',crypt('test123', gen_salt('bf')),'client','2018-10-23');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('3393023a-1415-49c9-bfcc-91784891f38c','Tahina','Rakotonirina','Antananarivo','2018-10-23',59,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('27f04cb0-6804-4c77-8cbb-ced3d2901627','QZ-594-0','3393023a-1415-49c9-bfcc-91784891f38c','sante',345,'2022-07-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('0623707e-988d-4a47-8265-7ee1df51cedf','POLZ-594-0','3393023a-1415-49c9-bfcc-91784891f38c','27f04cb0-6804-4c77-8cbb-ced3d2901627','sante','2022-07-09','2023-07-09',738,6,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('d64b6d1a-4576-475f-828a-8e59926be483','INCZ-594-0-0','0623707e-988d-4a47-8265-7ee1df51cedf','3393023a-1415-49c9-bfcc-91784891f38c','Incident','Déclaration de sinistre','2019-06-08','sante','leger','en_attente');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('30419104-5ec9-4c2d-8177-2fb10be86469','INCZ-594-0-1','0623707e-988d-4a47-8265-7ee1df51cedf','3393023a-1415-49c9-bfcc-91784891f38c','Incident','Déclaration de sinistre','2018-09-26','sante','eleve','en_attente');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('e56998a0-2d3f-4f94-8f86-941f56eed10a','user595@rich.com',crypt('test123', gen_salt('bf')),'client','2024-12-30');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('e56998a0-2d3f-4f94-8f86-941f56eed10a','Alex','Rakotonirina','Antananarivo','2024-12-30',14,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3d1c2981-96dc-4ffb-a317-fb2287c6051c','QZ-595-0','e56998a0-2d3f-4f94-8f86-941f56eed10a','moto',357,'2018-07-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('3d75b4e0-3151-427e-a69f-3888180710c2','POLZ-595-0','e56998a0-2d3f-4f94-8f86-941f56eed10a','3d1c2981-96dc-4ffb-a317-fb2287c6051c','moto','2018-07-08','2019-07-08',991,21,'basic','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('26e6587b-6745-44b7-84f6-7b07120dcf00','QZ-595-1','e56998a0-2d3f-4f94-8f86-941f56eed10a','sante',957,'2023-06-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('8e85a4b2-1fd4-4692-baec-ccd90144bc92','POLZ-595-1','e56998a0-2d3f-4f94-8f86-941f56eed10a','26e6587b-6745-44b7-84f6-7b07120dcf00','sante','2023-06-04','2024-06-04',603,45,'basic','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('19b213b0-8bde-47fb-99dc-df59d76a5f10','user596@rich.com',crypt('test123', gen_salt('bf')),'client','2022-02-16');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('19b213b0-8bde-47fb-99dc-df59d76a5f10','Zo','Razaka','Antananarivo','2022-02-16',66,'low','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b8316dae-3e3f-4544-8524-d13efe321acb','QZ-596-0','19b213b0-8bde-47fb-99dc-df59d76a5f10','sante',164,'2026-02-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('f0a06fd1-3efb-466f-9120-4a729637bd72','POLZ-596-0','19b213b0-8bde-47fb-99dc-df59d76a5f10','b8316dae-3e3f-4544-8524-d13efe321acb','sante','2026-02-16','2027-02-16',362,39,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('6cd8de31-de8f-4f41-a51e-b6bae927c2e3','INCZ-596-0-0','f0a06fd1-3efb-466f-9120-4a729637bd72','19b213b0-8bde-47fb-99dc-df59d76a5f10','Incident','Déclaration de sinistre','2020-12-05','sante','leger','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('9d4aa6d4-1e5d-400f-8a9a-edd0517f5083','INCZ-596-0-1','f0a06fd1-3efb-466f-9120-4a729637bd72','19b213b0-8bde-47fb-99dc-df59d76a5f10','Incident','Déclaration de sinistre','2024-06-25','sante','leger','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('11e29e6d-0b0b-4f43-af9a-de0c77489c15','QZ-596-1','19b213b0-8bde-47fb-99dc-df59d76a5f10','auto',958,'2024-08-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('aa3866cb-5d57-4dda-ba2e-091ed8acdf93','POLZ-596-1','19b213b0-8bde-47fb-99dc-df59d76a5f10','11e29e6d-0b0b-4f43-af9a-de0c77489c15','auto','2024-08-17','2025-08-17',118,45,'premium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('380920f3-e432-4a0b-9d69-070d6e730b76','INCZ-596-1-0','aa3866cb-5d57-4dda-ba2e-091ed8acdf93','19b213b0-8bde-47fb-99dc-df59d76a5f10','Incident','Déclaration de sinistre','2022-08-10','auto','leger','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('42c3c55b-88f6-4184-8971-8ef382a37302','user597@rich.com',crypt('test123', gen_salt('bf')),'client','2019-11-11');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('42c3c55b-88f6-4184-8971-8ef382a37302','Tahina','Rakotonirina','Antananarivo','2019-11-11',30,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e13e2924-180d-479b-b759-046309e7e9d4','QZ-597-0','42c3c55b-88f6-4184-8971-8ef382a37302','moto',600,'2025-06-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('9eb94de8-badd-4440-b530-ad1c4d1fda97','POLZ-597-0','42c3c55b-88f6-4184-8971-8ef382a37302','e13e2924-180d-479b-b759-046309e7e9d4','moto','2025-06-24','2026-06-24',990,46,'medium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c2f57102-efd2-4ae7-aa20-9d247bf3e40b','QZ-597-1','42c3c55b-88f6-4184-8971-8ef382a37302','auto',714,'2019-02-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('15f35d4b-88fc-43ee-8b9a-5f0d02b87b8d','POLZ-597-1','42c3c55b-88f6-4184-8971-8ef382a37302','c2f57102-efd2-4ae7-aa20-9d247bf3e40b','auto','2019-02-25','2020-02-25',359,48,'premium','mensuel');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('b028a07f-4b4f-4bc3-a82b-f52ea00b8954','user598@rich.com',crypt('test123', gen_salt('bf')),'client','2020-12-12');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('b028a07f-4b4f-4bc3-a82b-f52ea00b8954','Clara','Randriamanana','Antananarivo','2020-12-12',16,'high','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ec197cc5-e740-4218-9454-9ac93c5a1055','QZ-598-0','b028a07f-4b4f-4bc3-a82b-f52ea00b8954','moto',779,'2024-03-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e4803a3e-d372-48d7-a12d-f3a3fd0489dd','POLZ-598-0','b028a07f-4b4f-4bc3-a82b-f52ea00b8954','ec197cc5-e740-4218-9454-9ac93c5a1055','moto','2024-03-21','2025-03-21',158,32,'medium','mensuel');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('89a90ffb-dc4f-4dbe-a9fc-198d3297ca35','QZ-598-1','b028a07f-4b4f-4bc3-a82b-f52ea00b8954','moto',980,'2018-08-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('e67c5d5c-9ef2-4fba-b9b0-05437e8e2bc6','POLZ-598-1','b028a07f-4b4f-4bc3-a82b-f52ea00b8954','89a90ffb-dc4f-4dbe-a9fc-198d3297ca35','moto','2018-08-25','2019-08-25',404,37,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('0664f91a-1f58-4ece-9806-bc2c61edf7e9','INCZ-598-1-0','e67c5d5c-9ef2-4fba-b9b0-05437e8e2bc6','b028a07f-4b4f-4bc3-a82b-f52ea00b8954','Incident','Déclaration de sinistre','2018-07-12','moto','eleve','traite');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1de0f2ad-6fe8-4b25-899e-9abf6e6b95a7','QZ-598-2','b028a07f-4b4f-4bc3-a82b-f52ea00b8954','moto',381,'2026-03-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('04b692eb-ab34-4919-acd1-e6834dd52e97','POLZ-598-2','b028a07f-4b4f-4bc3-a82b-f52ea00b8954','1de0f2ad-6fe8-4b25-899e-9abf6e6b95a7','moto','2026-03-30','2027-03-30',177,40,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('5798202f-3626-4ebc-a6eb-7e7de58640ad','INCZ-598-2-0','04b692eb-ab34-4919-acd1-e6834dd52e97','b028a07f-4b4f-4bc3-a82b-f52ea00b8954','Incident','Déclaration de sinistre','2018-01-26','moto','moyen','en_cours');


INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('1f6de121-0c88-4cf5-8eb1-0301b2bc68d3','user599@rich.com',crypt('test123', gen_salt('bf')),'client','2025-11-30');

INSERT INTO profiles (user_id,first_name,last_name,address,join_date,loyalty_score,risk_level,notes)
VALUES ('1f6de121-0c88-4cf5-8eb1-0301b2bc68d3','Clara','Andriamanitra','Antananarivo','2025-11-30',59,'medium','Client actif depuis plusieurs années');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ab08d63a-6c42-4ed8-af4b-3f71a1cc519b','QZ-599-0','1f6de121-0c88-4cf5-8eb1-0301b2bc68d3','auto',978,'2018-04-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage,payment_method)
VALUES ('5c43225c-a18b-4813-83af-65fcd2a3a567','POLZ-599-0','1f6de121-0c88-4cf5-8eb1-0301b2bc68d3','ab08d63a-6c42-4ed8-af4b-3f71a1cc519b','auto','2018-04-06','2019-04-06',100,35,'medium','mensuel');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('839abf20-ffcd-4d5c-a0b9-9cef9ca1eb8d','INCZ-599-0-0','5c43225c-a18b-4813-83af-65fcd2a3a567','1f6de121-0c88-4cf5-8eb1-0301b2bc68d3','Incident','Déclaration de sinistre','2018-09-27','auto','leger','en_cours');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type,severity,status)
VALUES ('c677c09d-fbb9-4159-9a4f-0f6469b953ac','INCZ-599-0-1','5c43225c-a18b-4813-83af-65fcd2a3a567','1f6de121-0c88-4cf5-8eb1-0301b2bc68d3','Incident','Déclaration de sinistre','2022-03-10','auto','moyen','en_cours');
