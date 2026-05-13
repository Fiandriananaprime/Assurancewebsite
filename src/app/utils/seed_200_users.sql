CREATE EXTENSION IF NOT EXISTS pgcrypto;


-- USER 0
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ffb2eb2f-2c89-4ff3-88fd-f442ade56d97','user0@test.com',crypt('test123', gen_salt('bf')),'client','2022-04-11');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('ffb2eb2f-2c89-4ff3-88fd-f442ade56d97','Mickael','Rabe','034000000','Antananarivo','2022-04-11');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('03d1e6e1-120e-40a2-8e00-e47019526f0e','Q-0-0','ffb2eb2f-2c89-4ff3-88fd-f442ade56d97','auto',60,'2023-01-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('e7e3f0e3-5eaf-47a2-a27e-03561e2a0251','POL-0-0','ffb2eb2f-2c89-4ff3-88fd-f442ade56d97','03d1e6e1-120e-40a2-8e00-e47019526f0e','auto','2023-01-07','2024-01-07',60,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('6c08a439-691e-4fc5-b2fa-f929f492cd25','Q-0-1','ffb2eb2f-2c89-4ff3-88fd-f442ade56d97','auto',132,'2020-03-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('c6e188f6-93cc-4947-b8a0-9f5a4829c7ec','POL-0-1','ffb2eb2f-2c89-4ff3-88fd-f442ade56d97','6c08a439-691e-4fc5-b2fa-f929f492cd25','auto','2020-03-10','2021-03-10',132,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('7673dd81-0643-4281-90a7-13b59ad2a20b','INC-0-1-0','c6e188f6-93cc-4947-b8a0-9f5a4829c7ec','ffb2eb2f-2c89-4ff3-88fd-f442ade56d97','Accident','Collision mineure','2020-12-26','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('7145732c-d9b9-45bc-a3f1-6890f5ccd973','INC-0-1-1','c6e188f6-93cc-4947-b8a0-9f5a4829c7ec','ffb2eb2f-2c89-4ff3-88fd-f442ade56d97','Accident','Collision mineure','2020-07-15','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a324bffe-0b0c-4307-91fa-291dfb78d309','Q-0-2','ffb2eb2f-2c89-4ff3-88fd-f442ade56d97','auto',361,'2022-10-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('cc5be5e4-4c3f-4c9a-9998-152bae31e61b','POL-0-2','ffb2eb2f-2c89-4ff3-88fd-f442ade56d97','a324bffe-0b0c-4307-91fa-291dfb78d309','auto','2022-10-06','2023-10-06',361,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('604da50e-f6c7-47ce-b3e8-ff1f86d8f9ef','INC-0-2-0','cc5be5e4-4c3f-4c9a-9998-152bae31e61b','ffb2eb2f-2c89-4ff3-88fd-f442ade56d97','Accident','Collision mineure','2020-05-18','auto');


-- USER 1
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('04532b7a-8142-403e-84dc-65eeec775160','user1@test.com',crypt('test123', gen_salt('bf')),'client','2024-05-11');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('04532b7a-8142-403e-84dc-65eeec775160','Mickael','Razaf','034000001','Antananarivo','2024-05-11');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('56587378-986e-4888-9a1a-37859a9c999a','Q-1-0','04532b7a-8142-403e-84dc-65eeec775160','auto',132,'2020-06-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('0bc5a392-9404-434b-9dff-0e6d8a90ed1b','POL-1-0','04532b7a-8142-403e-84dc-65eeec775160','56587378-986e-4888-9a1a-37859a9c999a','auto','2020-06-25','2021-06-25',132,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('a198302a-23d0-429b-9a3f-ededb778819b','INC-1-0-0','0bc5a392-9404-434b-9dff-0e6d8a90ed1b','04532b7a-8142-403e-84dc-65eeec775160','Accident','Collision mineure','2020-05-14','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('985f9fe8-1c2a-413e-b844-fa7979c81715','04532b7a-8142-403e-84dc-65eeec775160','Service','Bon service',2);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('b4a5abf4-46cc-4841-96e7-0a3f2ebfa578','04532b7a-8142-403e-84dc-65eeec775160','Service','Bon service',3);


-- USER 2
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('1afd3730-48b7-493f-b46a-1fd9b4c2de1b','user2@test.com',crypt('test123', gen_salt('bf')),'client','2020-04-29');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('1afd3730-48b7-493f-b46a-1fd9b4c2de1b','Marie','Raharison','034000002','Antananarivo','2020-04-29');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ac9ec04a-28e1-47ce-8788-41d3a4ead9a1','Q-2-0','1afd3730-48b7-493f-b46a-1fd9b4c2de1b','auto',180,'2024-07-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('07442b44-0dd5-49ae-bc75-a7144d7fb424','POL-2-0','1afd3730-48b7-493f-b46a-1fd9b4c2de1b','ac9ec04a-28e1-47ce-8788-41d3a4ead9a1','auto','2024-07-02','2025-07-02',180,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('f78626cf-6841-47ce-a857-c1515af20d6c','INC-2-0-0','07442b44-0dd5-49ae-bc75-a7144d7fb424','1afd3730-48b7-493f-b46a-1fd9b4c2de1b','Accident','Collision mineure','2022-01-16','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('e4e807a7-0827-49ff-b164-c508180d0838','INC-2-0-1','07442b44-0dd5-49ae-bc75-a7144d7fb424','1afd3730-48b7-493f-b46a-1fd9b4c2de1b','Accident','Collision mineure','2023-05-03','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a86bf6c6-a36f-4b83-8cb0-b445cb142787','Q-2-1','1afd3730-48b7-493f-b46a-1fd9b4c2de1b','auto',321,'2020-08-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('be9c76fd-5fe1-4eac-9535-bcba05931ccb','POL-2-1','1afd3730-48b7-493f-b46a-1fd9b4c2de1b','a86bf6c6-a36f-4b83-8cb0-b445cb142787','auto','2020-08-26','2021-08-26',321,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('60dd5441-5306-4c3e-87bd-034d769b7745','Q-2-2','1afd3730-48b7-493f-b46a-1fd9b4c2de1b','auto',458,'2021-05-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('b4530823-7099-4183-9ebf-c8e20069affd','POL-2-2','1afd3730-48b7-493f-b46a-1fd9b4c2de1b','60dd5441-5306-4c3e-87bd-034d769b7745','auto','2021-05-13','2022-05-13',458,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('d96128ad-9608-4f01-a9ba-7d31eea431f4','1afd3730-48b7-493f-b46a-1fd9b4c2de1b','Service','Bon service',2);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('9e570300-5faf-4191-b9ad-54b200c2a556','1afd3730-48b7-493f-b46a-1fd9b4c2de1b','Service','Bon service',3);


-- USER 3
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a72716bb-5b3c-47f4-87de-ec06d564bd9b','user3@test.com',crypt('test123', gen_salt('bf')),'client','2021-02-23');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('a72716bb-5b3c-47f4-87de-ec06d564bd9b','Aina','Rakotovao','034000003','Antananarivo','2021-02-23');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('194a08d7-18aa-4141-a46b-0c8a416a78f4','Q-3-0','a72716bb-5b3c-47f4-87de-ec06d564bd9b','auto',173,'2023-07-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('f87b1037-1102-4485-982e-b8bd1994ed58','POL-3-0','a72716bb-5b3c-47f4-87de-ec06d564bd9b','194a08d7-18aa-4141-a46b-0c8a416a78f4','auto','2023-07-16','2024-07-16',173,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('7de245fa-5ac5-4f60-81e3-6c0c00fa273c','INC-3-0-0','f87b1037-1102-4485-982e-b8bd1994ed58','a72716bb-5b3c-47f4-87de-ec06d564bd9b','Accident','Collision mineure','2024-11-06','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('91444ab1-5234-478e-9f96-6b66921a5a33','INC-3-0-1','f87b1037-1102-4485-982e-b8bd1994ed58','a72716bb-5b3c-47f4-87de-ec06d564bd9b','Accident','Collision mineure','2025-12-18','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2b7245b7-c25f-4dc9-96b4-5c6bdbf9391d','Q-3-1','a72716bb-5b3c-47f4-87de-ec06d564bd9b','auto',303,'2022-11-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('cd641268-cd18-4569-8c04-8e2222df6ac3','POL-3-1','a72716bb-5b3c-47f4-87de-ec06d564bd9b','2b7245b7-c25f-4dc9-96b4-5c6bdbf9391d','auto','2022-11-02','2023-11-02',303,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('6170534e-b4f4-49f9-9cb5-6a2b81f7d19b','INC-3-1-0','cd641268-cd18-4569-8c04-8e2222df6ac3','a72716bb-5b3c-47f4-87de-ec06d564bd9b','Accident','Collision mineure','2025-12-05','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('bfe5bd44-bb4e-481e-b4ee-6cde0ffa6ea5','INC-3-1-1','cd641268-cd18-4569-8c04-8e2222df6ac3','a72716bb-5b3c-47f4-87de-ec06d564bd9b','Accident','Collision mineure','2020-11-08','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('99af914a-a66a-4efe-91ec-897659578c4c','a72716bb-5b3c-47f4-87de-ec06d564bd9b','Service','Bon service',2);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('3e286d10-f4c0-4199-8cb5-0282bd467163','a72716bb-5b3c-47f4-87de-ec06d564bd9b','Service','Bon service',4);


-- USER 4
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('2fb42fa6-e199-4bc4-b326-4a1ff0f6a3c9','user4@test.com',crypt('test123', gen_salt('bf')),'client','2020-10-10');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('2fb42fa6-e199-4bc4-b326-4a1ff0f6a3c9','Sofia','Rasoa','034000004','Antananarivo','2020-10-10');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3019cc6c-33f3-48ff-953e-07cff33817c1','Q-4-0','2fb42fa6-e199-4bc4-b326-4a1ff0f6a3c9','auto',86,'2020-11-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('31ca2cf0-9a5f-42f6-b96a-f175afc6f949','POL-4-0','2fb42fa6-e199-4bc4-b326-4a1ff0f6a3c9','3019cc6c-33f3-48ff-953e-07cff33817c1','auto','2020-11-08','2021-11-08',86,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('e8df53ec-8415-4322-a014-0e08a388ab30','INC-4-0-0','31ca2cf0-9a5f-42f6-b96a-f175afc6f949','2fb42fa6-e199-4bc4-b326-4a1ff0f6a3c9','Accident','Collision mineure','2023-01-13','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e8b0cf22-7f39-439e-927e-fd65d4e12329','Q-4-1','2fb42fa6-e199-4bc4-b326-4a1ff0f6a3c9','auto',73,'2026-01-18');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('b754567d-22af-4363-a4e8-d3601d2c7ca9','POL-4-1','2fb42fa6-e199-4bc4-b326-4a1ff0f6a3c9','e8b0cf22-7f39-439e-927e-fd65d4e12329','auto','2026-01-18','2027-01-18',73,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('6f78e1d0-c4ef-4100-a2b4-aed603c4097b','INC-4-1-0','b754567d-22af-4363-a4e8-d3601d2c7ca9','2fb42fa6-e199-4bc4-b326-4a1ff0f6a3c9','Accident','Collision mineure','2021-05-30','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('603d9ee7-aa3e-44eb-aa84-64ccf1cd343f','Q-4-2','2fb42fa6-e199-4bc4-b326-4a1ff0f6a3c9','auto',97,'2020-01-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('0b3e120f-df35-487d-a1de-dce5cfb351f5','POL-4-2','2fb42fa6-e199-4bc4-b326-4a1ff0f6a3c9','603d9ee7-aa3e-44eb-aa84-64ccf1cd343f','auto','2020-01-12','2021-01-12',97,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('16450004-bddd-4d1f-9edd-88adc7a56d69','INC-4-2-0','0b3e120f-df35-487d-a1de-dce5cfb351f5','2fb42fa6-e199-4bc4-b326-4a1ff0f6a3c9','Accident','Collision mineure','2025-04-15','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('e67f03bb-7732-4b8a-85ef-9623da1a36ab','2fb42fa6-e199-4bc4-b326-4a1ff0f6a3c9','Service','Bon service',4);


-- USER 5
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('fef281a7-eaef-4462-b567-70558d2790fe','user5@test.com',crypt('test123', gen_salt('bf')),'client','2021-12-28');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('fef281a7-eaef-4462-b567-70558d2790fe','Aina','Randria','034000005','Antananarivo','2021-12-28');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ee35288e-3d9b-4e42-ab75-d82dee13d8aa','Q-5-0','fef281a7-eaef-4462-b567-70558d2790fe','auto',467,'2021-08-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('3b4dccb1-fcbc-4652-b5c8-881369628255','POL-5-0','fef281a7-eaef-4462-b567-70558d2790fe','ee35288e-3d9b-4e42-ab75-d82dee13d8aa','auto','2021-08-27','2022-08-27',467,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3f6fb311-64b0-4788-86b5-12f7c23803c5','Q-5-1','fef281a7-eaef-4462-b567-70558d2790fe','auto',386,'2022-02-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('0ec6ce09-277c-4995-a722-4d0394e0e50f','POL-5-1','fef281a7-eaef-4462-b567-70558d2790fe','3f6fb311-64b0-4788-86b5-12f7c23803c5','auto','2022-02-25','2023-02-25',386,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d98a5eef-e602-4f21-b74b-2533d2dd2117','Q-5-2','fef281a7-eaef-4462-b567-70558d2790fe','auto',455,'2021-02-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('bbe3be2f-ed22-4ca5-b5e0-9ed83abe821d','POL-5-2','fef281a7-eaef-4462-b567-70558d2790fe','d98a5eef-e602-4f21-b74b-2533d2dd2117','auto','2021-02-25','2022-02-25',455,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('5fd82740-190a-4894-9eb2-5e108e09a938','INC-5-2-0','bbe3be2f-ed22-4ca5-b5e0-9ed83abe821d','fef281a7-eaef-4462-b567-70558d2790fe','Accident','Collision mineure','2023-12-01','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('f82fd9c0-47be-4354-b219-2a4bf2895080','INC-5-2-1','bbe3be2f-ed22-4ca5-b5e0-9ed83abe821d','fef281a7-eaef-4462-b567-70558d2790fe','Accident','Collision mineure','2020-01-01','auto');


-- USER 6
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('c9e49613-695c-4c09-bfb8-7677d83f8a6d','user6@test.com',crypt('test123', gen_salt('bf')),'client','2025-02-24');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('c9e49613-695c-4c09-bfb8-7677d83f8a6d','Hery','Rakoto','034000006','Antananarivo','2025-02-24');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e38100e5-91ae-4507-8b2f-d68a42a7192a','Q-6-0','c9e49613-695c-4c09-bfb8-7677d83f8a6d','auto',285,'2024-09-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('81c1e04a-beca-41c3-b79d-a9a26038bc51','POL-6-0','c9e49613-695c-4c09-bfb8-7677d83f8a6d','e38100e5-91ae-4507-8b2f-d68a42a7192a','auto','2024-09-28','2025-09-28',285,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('b8865cd2-bd4a-48db-b359-63f57c1bd4eb','c9e49613-695c-4c09-bfb8-7677d83f8a6d','Service','Bon service',3);


-- USER 7
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a6a938c0-d6b2-42f1-8030-2f6229981f5e','user7@test.com',crypt('test123', gen_salt('bf')),'client','2020-11-08');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('a6a938c0-d6b2-42f1-8030-2f6229981f5e','Mickael','Rasoa','034000007','Antananarivo','2020-11-08');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ef90a4b4-05be-4033-824c-463f19620347','Q-7-0','a6a938c0-d6b2-42f1-8030-2f6229981f5e','auto',393,'2023-02-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('31ab6c0b-e61b-4973-b158-e02629d613ba','POL-7-0','a6a938c0-d6b2-42f1-8030-2f6229981f5e','ef90a4b4-05be-4033-824c-463f19620347','auto','2023-02-11','2024-02-11',393,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('00a9c1bd-74b1-44e2-b5fd-f1141becf071','INC-7-0-0','31ab6c0b-e61b-4973-b158-e02629d613ba','a6a938c0-d6b2-42f1-8030-2f6229981f5e','Accident','Collision mineure','2022-08-03','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('1eee5aeb-7423-48df-a755-fffc0d948d15','INC-7-0-1','31ab6c0b-e61b-4973-b158-e02629d613ba','a6a938c0-d6b2-42f1-8030-2f6229981f5e','Accident','Collision mineure','2020-11-20','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('08a39c95-5d26-4750-b76f-5aec00180f37','Q-7-1','a6a938c0-d6b2-42f1-8030-2f6229981f5e','auto',356,'2024-02-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('6f02080f-ab01-47fb-82d9-5e3f0f90c717','POL-7-1','a6a938c0-d6b2-42f1-8030-2f6229981f5e','08a39c95-5d26-4750-b76f-5aec00180f37','auto','2024-02-03','2025-02-03',356,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('2573ef46-cfd9-49b0-b736-ddc42ad2a3bf','INC-7-1-0','6f02080f-ab01-47fb-82d9-5e3f0f90c717','a6a938c0-d6b2-42f1-8030-2f6229981f5e','Accident','Collision mineure','2020-07-01','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('92e582b1-690f-47ed-b7e4-e57534e93159','a6a938c0-d6b2-42f1-8030-2f6229981f5e','Service','Bon service',3);


-- USER 8
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('2a251a92-2b9d-4fc1-9f3d-46b8f0a78168','user8@test.com',crypt('test123', gen_salt('bf')),'client','2020-02-03');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('2a251a92-2b9d-4fc1-9f3d-46b8f0a78168','Paul','Rakoto','034000008','Antananarivo','2020-02-03');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('91398636-3acf-49a5-9b95-515fee585c84','Q-8-0','2a251a92-2b9d-4fc1-9f3d-46b8f0a78168','auto',404,'2021-08-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('7c0b232b-1752-4be8-8694-45810c429061','POL-8-0','2a251a92-2b9d-4fc1-9f3d-46b8f0a78168','91398636-3acf-49a5-9b95-515fee585c84','auto','2021-08-14','2022-08-14',404,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('1d1214f6-b146-41bc-bf3f-b33193dbf194','INC-8-0-0','7c0b232b-1752-4be8-8694-45810c429061','2a251a92-2b9d-4fc1-9f3d-46b8f0a78168','Accident','Collision mineure','2024-02-03','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('589753ca-8013-4c37-b85f-45d1d94c084a','Q-8-1','2a251a92-2b9d-4fc1-9f3d-46b8f0a78168','auto',453,'2025-09-29');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('bb59c37a-350f-4cc2-81af-f8d968ea4d5a','POL-8-1','2a251a92-2b9d-4fc1-9f3d-46b8f0a78168','589753ca-8013-4c37-b85f-45d1d94c084a','auto','2025-09-29','2026-09-29',453,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9e50a076-136d-4efa-b5de-7871a85b848d','Q-8-2','2a251a92-2b9d-4fc1-9f3d-46b8f0a78168','auto',265,'2022-12-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('fbc98567-3ec2-4554-8f91-f661d4dffa04','POL-8-2','2a251a92-2b9d-4fc1-9f3d-46b8f0a78168','9e50a076-136d-4efa-b5de-7871a85b848d','auto','2022-12-01','2023-12-01',265,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('e31ed228-8df8-4a37-b701-4ef23e132ee2','INC-8-2-0','fbc98567-3ec2-4554-8f91-f661d4dffa04','2a251a92-2b9d-4fc1-9f3d-46b8f0a78168','Accident','Collision mineure','2023-12-07','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('d1f4e608-24a8-459f-8d4f-c37f7d7718a8','INC-8-2-1','fbc98567-3ec2-4554-8f91-f661d4dffa04','2a251a92-2b9d-4fc1-9f3d-46b8f0a78168','Accident','Collision mineure','2023-12-28','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('4183107c-ad9e-4ece-89d3-06e0f0f49f92','2a251a92-2b9d-4fc1-9f3d-46b8f0a78168','Service','Bon service',4);


-- USER 9
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('4bcf4dcc-cded-4525-986c-6d5d0e973a3b','user9@test.com',crypt('test123', gen_salt('bf')),'client','2023-05-08');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('4bcf4dcc-cded-4525-986c-6d5d0e973a3b','Marie','Randria','034000009','Antananarivo','2023-05-08');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0ea21ef9-a433-4698-b775-f9da3da4a58e','Q-9-0','4bcf4dcc-cded-4525-986c-6d5d0e973a3b','auto',158,'2024-11-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('330b0cd3-c1da-4eb4-b44a-b82d61510558','POL-9-0','4bcf4dcc-cded-4525-986c-6d5d0e973a3b','0ea21ef9-a433-4698-b775-f9da3da4a58e','auto','2024-11-22','2025-11-22',158,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('4410f33d-c06f-445c-aa2b-69acb20abe56','Q-9-1','4bcf4dcc-cded-4525-986c-6d5d0e973a3b','auto',347,'2022-01-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('98528a5a-a8d8-4f5b-baa0-2e8bbb15c237','POL-9-1','4bcf4dcc-cded-4525-986c-6d5d0e973a3b','4410f33d-c06f-445c-aa2b-69acb20abe56','auto','2022-01-04','2023-01-04',347,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('013322f7-be43-4652-af2a-44eb67b59f18','Q-9-2','4bcf4dcc-cded-4525-986c-6d5d0e973a3b','auto',289,'2020-02-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('1ca595b6-558b-441f-9e97-de0c8dd74818','POL-9-2','4bcf4dcc-cded-4525-986c-6d5d0e973a3b','013322f7-be43-4652-af2a-44eb67b59f18','auto','2020-02-24','2021-02-24',289,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('a0c233a0-ae10-4cfb-832f-d9060bd4d4b7','INC-9-2-0','1ca595b6-558b-441f-9e97-de0c8dd74818','4bcf4dcc-cded-4525-986c-6d5d0e973a3b','Accident','Collision mineure','2024-03-05','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('f363f52c-5ef3-47a4-8ed9-e5a1e9512dfc','4bcf4dcc-cded-4525-986c-6d5d0e973a3b','Service','Bon service',5);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('46cce22b-56d7-4cd0-985b-f9fc8d1f32ff','4bcf4dcc-cded-4525-986c-6d5d0e973a3b','Service','Bon service',5);


-- USER 10
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('5fa3c0a2-d614-4fd1-a312-6ff33cd86893','user10@test.com',crypt('test123', gen_salt('bf')),'client','2021-08-20');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('5fa3c0a2-d614-4fd1-a312-6ff33cd86893','Paul','Razaf','034000010','Antananarivo','2021-08-20');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('df7ffa70-a130-46d9-b1d1-214bc9c8d785','Q-10-0','5fa3c0a2-d614-4fd1-a312-6ff33cd86893','auto',450,'2024-12-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('90829fa2-5e62-4464-b468-716c3071c7ac','POL-10-0','5fa3c0a2-d614-4fd1-a312-6ff33cd86893','df7ffa70-a130-46d9-b1d1-214bc9c8d785','auto','2024-12-21','2025-12-21',450,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('f5d522bc-b8df-4e33-9c93-18dca6f8faa6','INC-10-0-0','90829fa2-5e62-4464-b468-716c3071c7ac','5fa3c0a2-d614-4fd1-a312-6ff33cd86893','Accident','Collision mineure','2020-10-25','auto');


-- USER 11
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('0a548d02-676e-4a7a-9837-8bea59bcaf91','user11@test.com',crypt('test123', gen_salt('bf')),'client','2022-12-28');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('0a548d02-676e-4a7a-9837-8bea59bcaf91','Paul','Randria','034000011','Antananarivo','2022-12-28');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('07f3e51e-7167-4fcf-9338-44bad56a5d2b','Q-11-0','0a548d02-676e-4a7a-9837-8bea59bcaf91','auto',317,'2021-12-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('2d4e12f8-790f-4fe4-b6e5-14450406d40e','POL-11-0','0a548d02-676e-4a7a-9837-8bea59bcaf91','07f3e51e-7167-4fcf-9338-44bad56a5d2b','auto','2021-12-09','2022-12-09',317,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('6fa33d67-fc0f-4256-b7d7-8d86e9873cd9','INC-11-0-0','2d4e12f8-790f-4fe4-b6e5-14450406d40e','0a548d02-676e-4a7a-9837-8bea59bcaf91','Accident','Collision mineure','2024-12-09','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('eb119d3c-66dc-4d14-83b7-59cdb73df11d','INC-11-0-1','2d4e12f8-790f-4fe4-b6e5-14450406d40e','0a548d02-676e-4a7a-9837-8bea59bcaf91','Accident','Collision mineure','2023-01-27','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d590af06-01c6-4f25-a8a0-6ff795ea8617','Q-11-1','0a548d02-676e-4a7a-9837-8bea59bcaf91','auto',458,'2026-01-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('e5c87e2c-3bd1-4c18-87d1-3d2003c11bf0','POL-11-1','0a548d02-676e-4a7a-9837-8bea59bcaf91','d590af06-01c6-4f25-a8a0-6ff795ea8617','auto','2026-01-12','2027-01-12',458,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('117ddb17-bda9-4fc9-9c1d-f54175903115','0a548d02-676e-4a7a-9837-8bea59bcaf91','Service','Bon service',2);


-- USER 12
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('74c5bbd3-c973-4350-b875-ab0d5d9e6eba','user12@test.com',crypt('test123', gen_salt('bf')),'client','2025-06-09');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('74c5bbd3-c973-4350-b875-ab0d5d9e6eba','Marie','Razaf','034000012','Antananarivo','2025-06-09');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f47acecd-5d9c-445a-8983-1d34220d5128','Q-12-0','74c5bbd3-c973-4350-b875-ab0d5d9e6eba','auto',323,'2025-03-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('129b32d5-b65e-43fe-b341-c4f88e5f6581','POL-12-0','74c5bbd3-c973-4350-b875-ab0d5d9e6eba','f47acecd-5d9c-445a-8983-1d34220d5128','auto','2025-03-13','2026-03-13',323,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('da842932-7277-4267-9383-3cdab3e6624b','Q-12-1','74c5bbd3-c973-4350-b875-ab0d5d9e6eba','auto',479,'2023-06-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('19f4fc9d-117c-4c67-9456-09c5d8f0e70a','POL-12-1','74c5bbd3-c973-4350-b875-ab0d5d9e6eba','da842932-7277-4267-9383-3cdab3e6624b','auto','2023-06-03','2024-06-03',479,10,'full');


-- USER 13
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ec93f0e3-fb78-4cf2-b64b-1338ec21e4d3','user13@test.com',crypt('test123', gen_salt('bf')),'client','2023-09-07');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('ec93f0e3-fb78-4cf2-b64b-1338ec21e4d3','Lucas','Razaf','034000013','Antananarivo','2023-09-07');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ddf9fac1-2b60-4736-8c1d-4127d9ae217d','Q-13-0','ec93f0e3-fb78-4cf2-b64b-1338ec21e4d3','auto',311,'2021-04-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('74e9f900-bb03-4d37-bd22-748941248677','POL-13-0','ec93f0e3-fb78-4cf2-b64b-1338ec21e4d3','ddf9fac1-2b60-4736-8c1d-4127d9ae217d','auto','2021-04-04','2022-04-04',311,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('df956773-f113-45f3-b933-23956cc5c8ab','INC-13-0-0','74e9f900-bb03-4d37-bd22-748941248677','ec93f0e3-fb78-4cf2-b64b-1338ec21e4d3','Accident','Collision mineure','2025-07-03','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('af0f8ba0-2d6b-4dbc-80dc-ba3130ffd950','ec93f0e3-fb78-4cf2-b64b-1338ec21e4d3','Service','Bon service',2);


-- USER 14
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('0f670f2a-3b05-436d-8c13-4f887ad2339a','user14@test.com',crypt('test123', gen_salt('bf')),'client','2023-06-29');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('0f670f2a-3b05-436d-8c13-4f887ad2339a','Jean','Rabe','034000014','Antananarivo','2023-06-29');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7497fc56-a10d-4e58-883b-05d6c255e7c8','Q-14-0','0f670f2a-3b05-436d-8c13-4f887ad2339a','auto',106,'2020-02-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('8f5680c4-73d5-4b44-94da-684d9dccab13','POL-14-0','0f670f2a-3b05-436d-8c13-4f887ad2339a','7497fc56-a10d-4e58-883b-05d6c255e7c8','auto','2020-02-08','2021-02-08',106,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('74ee1c2e-53e5-4a88-adf5-c609293122f8','INC-14-0-0','8f5680c4-73d5-4b44-94da-684d9dccab13','0f670f2a-3b05-436d-8c13-4f887ad2339a','Accident','Collision mineure','2024-05-31','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c587f6b2-aba9-4b35-a9df-b100f2e414ff','Q-14-1','0f670f2a-3b05-436d-8c13-4f887ad2339a','auto',489,'2022-04-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('691344f3-f06b-40dd-95f9-bfbc646dbdfe','POL-14-1','0f670f2a-3b05-436d-8c13-4f887ad2339a','c587f6b2-aba9-4b35-a9df-b100f2e414ff','auto','2022-04-28','2023-04-28',489,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('f8fd970a-be67-41cd-8cc7-7ebaaa66efc4','INC-14-1-0','691344f3-f06b-40dd-95f9-bfbc646dbdfe','0f670f2a-3b05-436d-8c13-4f887ad2339a','Accident','Collision mineure','2022-01-31','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('d5996059-830c-4cbe-bd20-f551178ec793','0f670f2a-3b05-436d-8c13-4f887ad2339a','Service','Bon service',2);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('1c946bfd-1b80-40a1-80b8-0252d6f35c7a','0f670f2a-3b05-436d-8c13-4f887ad2339a','Service','Bon service',3);


-- USER 15
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('57b51216-95a7-411a-a4fb-b6458c76d4e4','user15@test.com',crypt('test123', gen_salt('bf')),'client','2024-10-30');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('57b51216-95a7-411a-a4fb-b6458c76d4e4','Aina','Rasoa','034000015','Antananarivo','2024-10-30');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('46d6d3b4-3889-4b99-a5c4-a71a5b8bc25c','Q-15-0','57b51216-95a7-411a-a4fb-b6458c76d4e4','auto',299,'2020-01-18');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('f7a8ca5a-23b0-4b30-99fc-af30908d7539','POL-15-0','57b51216-95a7-411a-a4fb-b6458c76d4e4','46d6d3b4-3889-4b99-a5c4-a71a5b8bc25c','auto','2020-01-18','2021-01-18',299,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('257cb290-4dd7-486a-8aa2-632a3953a178','INC-15-0-0','f7a8ca5a-23b0-4b30-99fc-af30908d7539','57b51216-95a7-411a-a4fb-b6458c76d4e4','Accident','Collision mineure','2020-10-21','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('50a9046b-d4ca-419e-a100-235d83f6a7be','INC-15-0-1','f7a8ca5a-23b0-4b30-99fc-af30908d7539','57b51216-95a7-411a-a4fb-b6458c76d4e4','Accident','Collision mineure','2025-11-09','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('53b3fd6a-5467-486a-aa3f-c358e9faa2a0','Q-15-1','57b51216-95a7-411a-a4fb-b6458c76d4e4','auto',230,'2021-10-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('d2511315-e826-495e-b4f4-fe3b1ecdb9a3','POL-15-1','57b51216-95a7-411a-a4fb-b6458c76d4e4','53b3fd6a-5467-486a-aa3f-c358e9faa2a0','auto','2021-10-26','2022-10-26',230,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('2411c61a-72e8-4b4f-baf3-bf46fff19870','INC-15-1-0','d2511315-e826-495e-b4f4-fe3b1ecdb9a3','57b51216-95a7-411a-a4fb-b6458c76d4e4','Accident','Collision mineure','2025-05-24','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2bf85fd8-0b0e-463e-a0c9-8fc2e2f39dc0','Q-15-2','57b51216-95a7-411a-a4fb-b6458c76d4e4','auto',226,'2021-04-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('5596329c-b324-4f9e-b2ae-faa6f1bc8b6d','POL-15-2','57b51216-95a7-411a-a4fb-b6458c76d4e4','2bf85fd8-0b0e-463e-a0c9-8fc2e2f39dc0','auto','2021-04-30','2022-04-30',226,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('59febcb5-aa86-4337-bfc2-c5f65311b329','INC-15-2-0','5596329c-b324-4f9e-b2ae-faa6f1bc8b6d','57b51216-95a7-411a-a4fb-b6458c76d4e4','Accident','Collision mineure','2025-04-30','auto');


-- USER 16
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('6eb34d82-534e-4be0-acf4-3f838b911097','user16@test.com',crypt('test123', gen_salt('bf')),'client','2022-01-02');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('6eb34d82-534e-4be0-acf4-3f838b911097','Marie','Rasoa','034000016','Antananarivo','2022-01-02');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('6a1f021a-4253-4b31-b424-3771c7f215e6','Q-16-0','6eb34d82-534e-4be0-acf4-3f838b911097','auto',97,'2025-03-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('97fdf21d-68c4-4cc6-945f-5ee97c285e5d','POL-16-0','6eb34d82-534e-4be0-acf4-3f838b911097','6a1f021a-4253-4b31-b424-3771c7f215e6','auto','2025-03-08','2026-03-08',97,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('4d5e03b9-3dea-4769-bfde-c908649bc802','INC-16-0-0','97fdf21d-68c4-4cc6-945f-5ee97c285e5d','6eb34d82-534e-4be0-acf4-3f838b911097','Accident','Collision mineure','2022-12-17','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3dba86df-1406-4fee-9fd6-90fb8b75cf64','Q-16-1','6eb34d82-534e-4be0-acf4-3f838b911097','auto',339,'2024-11-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('8e5ea765-07f0-4ca2-86f4-7dbedc0cd0ed','POL-16-1','6eb34d82-534e-4be0-acf4-3f838b911097','3dba86df-1406-4fee-9fd6-90fb8b75cf64','auto','2024-11-17','2025-11-17',339,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('b153bfbf-3e83-47c5-aa8a-5c07e84675c3','INC-16-1-0','8e5ea765-07f0-4ca2-86f4-7dbedc0cd0ed','6eb34d82-534e-4be0-acf4-3f838b911097','Accident','Collision mineure','2020-02-22','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('97dbd2a8-f487-4a58-a0a6-93d68fa6c519','INC-16-1-1','8e5ea765-07f0-4ca2-86f4-7dbedc0cd0ed','6eb34d82-534e-4be0-acf4-3f838b911097','Accident','Collision mineure','2020-08-14','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('b8a0905f-c76a-4ef8-9aa7-3621188095da','6eb34d82-534e-4be0-acf4-3f838b911097','Service','Bon service',3);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('46de4056-3d06-4fb8-9291-3cc37dcee212','6eb34d82-534e-4be0-acf4-3f838b911097','Service','Bon service',5);


-- USER 17
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('e37afdbd-de10-4683-8394-7083b48b7d1c','user17@test.com',crypt('test123', gen_salt('bf')),'client','2022-02-26');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('e37afdbd-de10-4683-8394-7083b48b7d1c','Hery','Rabe','034000017','Antananarivo','2022-02-26');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b3c23e83-f80b-4f65-b1ef-c614bea02656','Q-17-0','e37afdbd-de10-4683-8394-7083b48b7d1c','auto',291,'2020-12-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('51695c2b-bd9b-441d-af40-60b15f7c5b3a','POL-17-0','e37afdbd-de10-4683-8394-7083b48b7d1c','b3c23e83-f80b-4f65-b1ef-c614bea02656','auto','2020-12-14','2021-12-14',291,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('ab2a37ae-8822-4ede-8213-d994d3476c11','INC-17-0-0','51695c2b-bd9b-441d-af40-60b15f7c5b3a','e37afdbd-de10-4683-8394-7083b48b7d1c','Accident','Collision mineure','2022-11-09','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('a361b0b2-0e03-4376-97fb-b832489919a1','INC-17-0-1','51695c2b-bd9b-441d-af40-60b15f7c5b3a','e37afdbd-de10-4683-8394-7083b48b7d1c','Accident','Collision mineure','2020-11-09','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a4f91f37-a716-4782-910f-13db6565b6a2','Q-17-1','e37afdbd-de10-4683-8394-7083b48b7d1c','auto',368,'2023-11-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('d9422fe5-bad8-4a9b-9f4b-c93b6137a392','POL-17-1','e37afdbd-de10-4683-8394-7083b48b7d1c','a4f91f37-a716-4782-910f-13db6565b6a2','auto','2023-11-25','2024-11-25',368,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('4df402df-59c3-483e-9d4e-f3a3295740f7','e37afdbd-de10-4683-8394-7083b48b7d1c','Service','Bon service',3);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('ad797dcf-7c6d-4186-9413-c58e9be758a8','e37afdbd-de10-4683-8394-7083b48b7d1c','Service','Bon service',2);


-- USER 18
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('3a199699-4d4a-4a74-b458-657bfa600504','user18@test.com',crypt('test123', gen_salt('bf')),'client','2020-10-15');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('3a199699-4d4a-4a74-b458-657bfa600504','Hery','Razaf','034000018','Antananarivo','2020-10-15');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a801fd9e-936c-45ff-b8fa-9828f7f9af1f','Q-18-0','3a199699-4d4a-4a74-b458-657bfa600504','auto',446,'2023-10-31');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('06a975f3-d07e-41b9-a776-dd7a1cc4115d','POL-18-0','3a199699-4d4a-4a74-b458-657bfa600504','a801fd9e-936c-45ff-b8fa-9828f7f9af1f','auto','2023-10-31','2024-10-31',446,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('cbfb662f-b9a3-4c5f-b284-c3b1933b6c6e','INC-18-0-0','06a975f3-d07e-41b9-a776-dd7a1cc4115d','3a199699-4d4a-4a74-b458-657bfa600504','Accident','Collision mineure','2021-05-31','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('5062c2b5-4e88-4eb2-bad1-4e64eccc2706','INC-18-0-1','06a975f3-d07e-41b9-a776-dd7a1cc4115d','3a199699-4d4a-4a74-b458-657bfa600504','Accident','Collision mineure','2023-03-13','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c5a80530-62d2-4d1c-8ac3-8b5465ab7f5a','Q-18-1','3a199699-4d4a-4a74-b458-657bfa600504','auto',179,'2023-09-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('e0997e98-3881-4ab6-b293-d5ae86ee715c','POL-18-1','3a199699-4d4a-4a74-b458-657bfa600504','c5a80530-62d2-4d1c-8ac3-8b5465ab7f5a','auto','2023-09-19','2024-09-19',179,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('5f2749ff-6634-4bed-ac33-d1c500b54085','INC-18-1-0','e0997e98-3881-4ab6-b293-d5ae86ee715c','3a199699-4d4a-4a74-b458-657bfa600504','Accident','Collision mineure','2025-02-27','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('137976e5-741c-48d4-a91b-e36508053e1d','Q-18-2','3a199699-4d4a-4a74-b458-657bfa600504','auto',269,'2021-02-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('108f24e9-316f-4734-9761-fc66411e83f8','POL-18-2','3a199699-4d4a-4a74-b458-657bfa600504','137976e5-741c-48d4-a91b-e36508053e1d','auto','2021-02-04','2022-02-04',269,10,'full');


-- USER 19
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('3b1fd0ff-f42f-4bb2-9be5-71105548fdb0','user19@test.com',crypt('test123', gen_salt('bf')),'client','2020-11-12');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('3b1fd0ff-f42f-4bb2-9be5-71105548fdb0','Tiana','Raharison','034000019','Antananarivo','2020-11-12');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8962e38b-e00e-43e2-9c35-9ee6354014fa','Q-19-0','3b1fd0ff-f42f-4bb2-9be5-71105548fdb0','auto',331,'2026-04-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('0eec07d3-7cb0-4b82-b774-fcdb2ba61b2e','POL-19-0','3b1fd0ff-f42f-4bb2-9be5-71105548fdb0','8962e38b-e00e-43e2-9c35-9ee6354014fa','auto','2026-04-02','2027-04-02',331,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('55e0861d-9b3d-4021-b729-ffa5d92fc72a','INC-19-0-0','0eec07d3-7cb0-4b82-b774-fcdb2ba61b2e','3b1fd0ff-f42f-4bb2-9be5-71105548fdb0','Accident','Collision mineure','2024-01-23','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('e13599d1-d196-45f9-b122-6cf0b53e3eb6','INC-19-0-1','0eec07d3-7cb0-4b82-b774-fcdb2ba61b2e','3b1fd0ff-f42f-4bb2-9be5-71105548fdb0','Accident','Collision mineure','2022-03-05','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('809fe26f-15d7-4e3e-9b40-3805cf60e025','Q-19-1','3b1fd0ff-f42f-4bb2-9be5-71105548fdb0','auto',181,'2024-05-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('d7dd6c22-5256-4649-8aa1-086f861b58ce','POL-19-1','3b1fd0ff-f42f-4bb2-9be5-71105548fdb0','809fe26f-15d7-4e3e-9b40-3805cf60e025','auto','2024-05-12','2025-05-12',181,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('dd969421-c9ba-4b44-9a04-69614289a995','3b1fd0ff-f42f-4bb2-9be5-71105548fdb0','Service','Bon service',5);


-- USER 20
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a652c88c-78bd-4dfe-b575-20dff4f9e498','user20@test.com',crypt('test123', gen_salt('bf')),'client','2020-09-08');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('a652c88c-78bd-4dfe-b575-20dff4f9e498','Sofia','Randria','034000020','Antananarivo','2020-09-08');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a44d261d-a0a7-4058-890c-56394a0f7374','Q-20-0','a652c88c-78bd-4dfe-b575-20dff4f9e498','auto',113,'2025-07-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('5d8a602a-71ed-431e-a1ec-a7c3ea693bd3','POL-20-0','a652c88c-78bd-4dfe-b575-20dff4f9e498','a44d261d-a0a7-4058-890c-56394a0f7374','auto','2025-07-06','2026-07-06',113,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('6ad1c3d6-af00-4e57-a180-daf7836e6044','INC-20-0-0','5d8a602a-71ed-431e-a1ec-a7c3ea693bd3','a652c88c-78bd-4dfe-b575-20dff4f9e498','Accident','Collision mineure','2022-05-07','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8ee63918-d78f-445a-aec4-bdd67b219c5e','Q-20-1','a652c88c-78bd-4dfe-b575-20dff4f9e498','auto',85,'2023-02-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('f4403be8-6689-4acf-8e98-148c52e71893','POL-20-1','a652c88c-78bd-4dfe-b575-20dff4f9e498','8ee63918-d78f-445a-aec4-bdd67b219c5e','auto','2023-02-03','2024-02-03',85,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('64abf212-c377-4800-ac15-46aa80e4f273','INC-20-1-0','f4403be8-6689-4acf-8e98-148c52e71893','a652c88c-78bd-4dfe-b575-20dff4f9e498','Accident','Collision mineure','2020-03-23','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c2674c36-3dd2-433f-a3d0-32008e591b4d','Q-20-2','a652c88c-78bd-4dfe-b575-20dff4f9e498','auto',114,'2021-05-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('b08dbc07-d6ab-4c9a-81b4-c312ec74950d','POL-20-2','a652c88c-78bd-4dfe-b575-20dff4f9e498','c2674c36-3dd2-433f-a3d0-32008e591b4d','auto','2021-05-03','2022-05-03',114,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('66c9b755-c4b9-484a-b696-2b8a28711e8a','INC-20-2-0','b08dbc07-d6ab-4c9a-81b4-c312ec74950d','a652c88c-78bd-4dfe-b575-20dff4f9e498','Accident','Collision mineure','2024-04-21','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('cb9745d5-f463-4114-a49a-d130da28203c','INC-20-2-1','b08dbc07-d6ab-4c9a-81b4-c312ec74950d','a652c88c-78bd-4dfe-b575-20dff4f9e498','Accident','Collision mineure','2020-11-21','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('96c33794-d1df-4482-9034-e499a27826fd','a652c88c-78bd-4dfe-b575-20dff4f9e498','Service','Bon service',2);


-- USER 21
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('516de4a6-d7b1-41ee-90de-03521257ecc3','user21@test.com',crypt('test123', gen_salt('bf')),'client','2020-02-26');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('516de4a6-d7b1-41ee-90de-03521257ecc3','Sofia','Andri','034000021','Antananarivo','2020-02-26');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d6e2287e-fe4a-49d6-bbad-2ec287bb0f28','Q-21-0','516de4a6-d7b1-41ee-90de-03521257ecc3','auto',451,'2021-09-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('0cadb10f-7620-47c1-965f-058f4366d434','POL-21-0','516de4a6-d7b1-41ee-90de-03521257ecc3','d6e2287e-fe4a-49d6-bbad-2ec287bb0f28','auto','2021-09-19','2022-09-19',451,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('84c4b7f3-31e1-4459-bf18-c57febf1b9c7','Q-21-1','516de4a6-d7b1-41ee-90de-03521257ecc3','auto',341,'2025-08-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('4a124f3e-804f-4312-9c8d-7b13245aa791','POL-21-1','516de4a6-d7b1-41ee-90de-03521257ecc3','84c4b7f3-31e1-4459-bf18-c57febf1b9c7','auto','2025-08-10','2026-08-10',341,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('1fb8138f-da0d-4257-a016-fe54ac49b9df','INC-21-1-0','4a124f3e-804f-4312-9c8d-7b13245aa791','516de4a6-d7b1-41ee-90de-03521257ecc3','Accident','Collision mineure','2024-12-01','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('20aff55e-9a7c-416a-a442-b76975f062c1','INC-21-1-1','4a124f3e-804f-4312-9c8d-7b13245aa791','516de4a6-d7b1-41ee-90de-03521257ecc3','Accident','Collision mineure','2021-02-03','auto');


-- USER 22
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('b993b5ac-dc34-48ab-a447-af73f4e83b4f','user22@test.com',crypt('test123', gen_salt('bf')),'client','2022-10-11');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('b993b5ac-dc34-48ab-a447-af73f4e83b4f','Hery','Andri','034000022','Antananarivo','2022-10-11');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b931af29-8117-42ca-84c5-abca0080ef7b','Q-22-0','b993b5ac-dc34-48ab-a447-af73f4e83b4f','auto',400,'2023-08-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('da8475c7-5588-47b5-8913-7ad9823395fb','POL-22-0','b993b5ac-dc34-48ab-a447-af73f4e83b4f','b931af29-8117-42ca-84c5-abca0080ef7b','auto','2023-08-05','2024-08-05',400,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('4ac624ad-6765-474a-a58f-d423d6f724dc','INC-22-0-0','da8475c7-5588-47b5-8913-7ad9823395fb','b993b5ac-dc34-48ab-a447-af73f4e83b4f','Accident','Collision mineure','2023-02-06','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('f501285a-2e55-4736-ae07-931b191f5c8e','INC-22-0-1','da8475c7-5588-47b5-8913-7ad9823395fb','b993b5ac-dc34-48ab-a447-af73f4e83b4f','Accident','Collision mineure','2025-11-27','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('dd40d902-7db8-44fa-ae40-376f24c11879','b993b5ac-dc34-48ab-a447-af73f4e83b4f','Service','Bon service',5);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('86f50112-2d78-4ce9-8c56-9f7a074e4ec2','b993b5ac-dc34-48ab-a447-af73f4e83b4f','Service','Bon service',4);


-- USER 23
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('f8391e59-fd26-44ae-8858-9a2d38b55a0d','user23@test.com',crypt('test123', gen_salt('bf')),'client','2021-11-13');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('f8391e59-fd26-44ae-8858-9a2d38b55a0d','Sofia','Rasoa','034000023','Antananarivo','2021-11-13');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('96e0e7eb-4572-4603-869e-1260d07f577a','Q-23-0','f8391e59-fd26-44ae-8858-9a2d38b55a0d','auto',390,'2022-07-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('c3ca4989-202c-4705-a590-e1d5b227258d','POL-23-0','f8391e59-fd26-44ae-8858-9a2d38b55a0d','96e0e7eb-4572-4603-869e-1260d07f577a','auto','2022-07-27','2023-07-27',390,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('9befdd49-f5b2-4a41-8277-a58bce54d058','INC-23-0-0','c3ca4989-202c-4705-a590-e1d5b227258d','f8391e59-fd26-44ae-8858-9a2d38b55a0d','Accident','Collision mineure','2020-01-03','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('d18cdf12-85bd-4d2c-98d5-3b8fd74b71f4','INC-23-0-1','c3ca4989-202c-4705-a590-e1d5b227258d','f8391e59-fd26-44ae-8858-9a2d38b55a0d','Accident','Collision mineure','2021-01-31','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f717f7e9-d348-4cfc-bccd-c256cef3a471','Q-23-1','f8391e59-fd26-44ae-8858-9a2d38b55a0d','auto',471,'2026-04-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('2f643077-c8ec-4f79-8705-54fdf4194800','POL-23-1','f8391e59-fd26-44ae-8858-9a2d38b55a0d','f717f7e9-d348-4cfc-bccd-c256cef3a471','auto','2026-04-22','2027-04-22',471,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('9a3a9823-5c44-497c-a1fd-08c51469b974','INC-23-1-0','2f643077-c8ec-4f79-8705-54fdf4194800','f8391e59-fd26-44ae-8858-9a2d38b55a0d','Accident','Collision mineure','2026-01-16','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('47dd4fd9-4e88-4275-bf46-4bfee6e84941','INC-23-1-1','2f643077-c8ec-4f79-8705-54fdf4194800','f8391e59-fd26-44ae-8858-9a2d38b55a0d','Accident','Collision mineure','2021-07-12','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1dc8dd21-c553-4be8-a82a-637ce59e4381','Q-23-2','f8391e59-fd26-44ae-8858-9a2d38b55a0d','auto',297,'2025-10-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('521a0111-f563-40d1-953b-0977df960ad6','POL-23-2','f8391e59-fd26-44ae-8858-9a2d38b55a0d','1dc8dd21-c553-4be8-a82a-637ce59e4381','auto','2025-10-28','2026-10-28',297,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('3eb491d4-c63a-450d-9612-77d9f931e3e2','INC-23-2-0','521a0111-f563-40d1-953b-0977df960ad6','f8391e59-fd26-44ae-8858-9a2d38b55a0d','Accident','Collision mineure','2024-08-25','auto');


-- USER 24
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('1eef0367-3e71-4ed1-a71b-44453c4074b7','user24@test.com',crypt('test123', gen_salt('bf')),'client','2025-08-04');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('1eef0367-3e71-4ed1-a71b-44453c4074b7','Lina','Andri','034000024','Antananarivo','2025-08-04');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8d46d096-063a-4cf4-958d-894fa7bc6c91','Q-24-0','1eef0367-3e71-4ed1-a71b-44453c4074b7','auto',339,'2022-10-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('55096066-3b21-40a2-bca3-1f7c50efa4de','POL-24-0','1eef0367-3e71-4ed1-a71b-44453c4074b7','8d46d096-063a-4cf4-958d-894fa7bc6c91','auto','2022-10-13','2023-10-13',339,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('2a847858-0e81-4fe1-b9a7-3de0c8356965','INC-24-0-0','55096066-3b21-40a2-bca3-1f7c50efa4de','1eef0367-3e71-4ed1-a71b-44453c4074b7','Accident','Collision mineure','2024-11-22','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('0f6b4e49-b568-4432-8198-fb1710deab75','INC-24-0-1','55096066-3b21-40a2-bca3-1f7c50efa4de','1eef0367-3e71-4ed1-a71b-44453c4074b7','Accident','Collision mineure','2021-01-17','auto');


-- USER 25
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('87137836-2eb4-4024-849b-d0051e98f24d','user25@test.com',crypt('test123', gen_salt('bf')),'client','2025-04-06');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('87137836-2eb4-4024-849b-d0051e98f24d','Marie','Razaf','034000025','Antananarivo','2025-04-06');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d2423379-54ca-403c-8334-90c19571ba12','Q-25-0','87137836-2eb4-4024-849b-d0051e98f24d','auto',296,'2020-07-29');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('c84c8c1f-18fc-493e-a81e-be7183be3e6b','POL-25-0','87137836-2eb4-4024-849b-d0051e98f24d','d2423379-54ca-403c-8334-90c19571ba12','auto','2020-07-29','2021-07-29',296,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('9ed9cf4d-2d30-4c03-ab60-9540aa725a95','INC-25-0-0','c84c8c1f-18fc-493e-a81e-be7183be3e6b','87137836-2eb4-4024-849b-d0051e98f24d','Accident','Collision mineure','2023-11-15','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('87b403e6-1a10-46b7-a4cb-1bde45e3cea0','Q-25-1','87137836-2eb4-4024-849b-d0051e98f24d','auto',419,'2021-01-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('71aa8660-d0cd-431e-b4d3-77216c523987','POL-25-1','87137836-2eb4-4024-849b-d0051e98f24d','87b403e6-1a10-46b7-a4cb-1bde45e3cea0','auto','2021-01-05','2022-01-05',419,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('75354de8-34ae-4cc3-bb04-06a0930dcea7','INC-25-1-0','71aa8660-d0cd-431e-b4d3-77216c523987','87137836-2eb4-4024-849b-d0051e98f24d','Accident','Collision mineure','2021-04-08','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('04703b1e-2307-4b5b-839b-4b5b3e79d91e','INC-25-1-1','71aa8660-d0cd-431e-b4d3-77216c523987','87137836-2eb4-4024-849b-d0051e98f24d','Accident','Collision mineure','2024-06-12','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0b582621-0563-4927-8ed4-6e68bf416c9f','Q-25-2','87137836-2eb4-4024-849b-d0051e98f24d','auto',245,'2021-11-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('c71a0335-2782-4999-94d9-173851895ff4','POL-25-2','87137836-2eb4-4024-849b-d0051e98f24d','0b582621-0563-4927-8ed4-6e68bf416c9f','auto','2021-11-13','2022-11-13',245,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('85dab6aa-2c40-4e10-8577-a6b8bcf3766c','INC-25-2-0','c71a0335-2782-4999-94d9-173851895ff4','87137836-2eb4-4024-849b-d0051e98f24d','Accident','Collision mineure','2021-01-17','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('53a65d89-650a-45a3-a764-796c07eb67d6','INC-25-2-1','c71a0335-2782-4999-94d9-173851895ff4','87137836-2eb4-4024-849b-d0051e98f24d','Accident','Collision mineure','2023-07-19','auto');


-- USER 26
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('97dee037-cb88-432b-9cfd-cb8be5da118c','user26@test.com',crypt('test123', gen_salt('bf')),'client','2025-02-10');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('97dee037-cb88-432b-9cfd-cb8be5da118c','Hery','Raharison','034000026','Antananarivo','2025-02-10');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('46e1d84d-e991-4e64-9e86-08cd8a181951','Q-26-0','97dee037-cb88-432b-9cfd-cb8be5da118c','auto',187,'2021-04-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('fb7aa761-a963-411a-8a34-b65d903d5a09','POL-26-0','97dee037-cb88-432b-9cfd-cb8be5da118c','46e1d84d-e991-4e64-9e86-08cd8a181951','auto','2021-04-21','2022-04-21',187,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('9dc7911f-4fd7-4e46-994f-c97a2d09cf65','INC-26-0-0','fb7aa761-a963-411a-8a34-b65d903d5a09','97dee037-cb88-432b-9cfd-cb8be5da118c','Accident','Collision mineure','2023-08-05','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('4c78241f-b599-4fc7-a843-67ea67a5d013','97dee037-cb88-432b-9cfd-cb8be5da118c','Service','Bon service',4);


-- USER 27
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ff0b751e-7c68-4269-9b79-196ad34d72a6','user27@test.com',crypt('test123', gen_salt('bf')),'client','2020-03-08');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('ff0b751e-7c68-4269-9b79-196ad34d72a6','Lina','Razaf','034000027','Antananarivo','2020-03-08');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('6a73f31e-1ce5-44ae-95a6-9a2362a12eb1','Q-27-0','ff0b751e-7c68-4269-9b79-196ad34d72a6','auto',405,'2026-04-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('aabe2b01-0d8c-4d23-a209-90bdf22de662','POL-27-0','ff0b751e-7c68-4269-9b79-196ad34d72a6','6a73f31e-1ce5-44ae-95a6-9a2362a12eb1','auto','2026-04-13','2027-04-13',405,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('664213c9-25eb-4926-b646-e690e5c4e2b0','INC-27-0-0','aabe2b01-0d8c-4d23-a209-90bdf22de662','ff0b751e-7c68-4269-9b79-196ad34d72a6','Accident','Collision mineure','2020-07-24','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('dec1e233-de8e-4dd8-84ca-edce72f6a3b8','Q-27-1','ff0b751e-7c68-4269-9b79-196ad34d72a6','auto',310,'2025-05-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('9040a4e7-a48d-44b4-a480-ddbff919f6b5','POL-27-1','ff0b751e-7c68-4269-9b79-196ad34d72a6','dec1e233-de8e-4dd8-84ca-edce72f6a3b8','auto','2025-05-05','2026-05-05',310,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('1186cc97-2d3d-45ae-88e3-437f9986e3ee','ff0b751e-7c68-4269-9b79-196ad34d72a6','Service','Bon service',4);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('45a9851a-73e7-4eb0-8f9b-c8060665be41','ff0b751e-7c68-4269-9b79-196ad34d72a6','Service','Bon service',5);


-- USER 28
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ccfd4df7-b4b0-4461-8cdd-f9a1673db1da','user28@test.com',crypt('test123', gen_salt('bf')),'client','2021-06-24');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('ccfd4df7-b4b0-4461-8cdd-f9a1673db1da','Lucas','Andri','034000028','Antananarivo','2021-06-24');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('6b4e6cae-84ad-4f8c-ab33-2d2ed48d5866','Q-28-0','ccfd4df7-b4b0-4461-8cdd-f9a1673db1da','auto',146,'2021-06-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('44286cdb-94aa-4017-9c08-5d72696b53b4','POL-28-0','ccfd4df7-b4b0-4461-8cdd-f9a1673db1da','6b4e6cae-84ad-4f8c-ab33-2d2ed48d5866','auto','2021-06-02','2022-06-02',146,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d06cba52-6fab-4704-96aa-8820a2eca425','Q-28-1','ccfd4df7-b4b0-4461-8cdd-f9a1673db1da','auto',382,'2023-05-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('668fc8d2-6450-450c-bae3-d491be6d20b3','POL-28-1','ccfd4df7-b4b0-4461-8cdd-f9a1673db1da','d06cba52-6fab-4704-96aa-8820a2eca425','auto','2023-05-03','2024-05-03',382,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('37ef7bf7-b91b-4b3b-b859-5d5be341e3b5','INC-28-1-0','668fc8d2-6450-450c-bae3-d491be6d20b3','ccfd4df7-b4b0-4461-8cdd-f9a1673db1da','Accident','Collision mineure','2022-05-16','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('844f771d-6f0a-414c-9d0a-69ab84b79f87','Q-28-2','ccfd4df7-b4b0-4461-8cdd-f9a1673db1da','auto',70,'2022-04-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('3dd1469c-00c6-4c02-86a5-b9aeb6acf2dd','POL-28-2','ccfd4df7-b4b0-4461-8cdd-f9a1673db1da','844f771d-6f0a-414c-9d0a-69ab84b79f87','auto','2022-04-06','2023-04-06',70,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('fe14991d-aba8-4b0a-b4ac-c2a2b0186269','INC-28-2-0','3dd1469c-00c6-4c02-86a5-b9aeb6acf2dd','ccfd4df7-b4b0-4461-8cdd-f9a1673db1da','Accident','Collision mineure','2025-11-14','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('fb21c5aa-9c17-4f48-9ace-c272d411988d','INC-28-2-1','3dd1469c-00c6-4c02-86a5-b9aeb6acf2dd','ccfd4df7-b4b0-4461-8cdd-f9a1673db1da','Accident','Collision mineure','2023-11-18','auto');


-- USER 29
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('7b991f30-0df3-4688-94e3-fe54081c7c27','user29@test.com',crypt('test123', gen_salt('bf')),'client','2021-07-03');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('7b991f30-0df3-4688-94e3-fe54081c7c27','Lina','Rakoto','034000029','Antananarivo','2021-07-03');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1eddb618-b30e-485f-88c4-6ee6450f5f1b','Q-29-0','7b991f30-0df3-4688-94e3-fe54081c7c27','auto',361,'2020-10-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('3ea58749-386d-4910-9b10-a7ad19717e19','POL-29-0','7b991f30-0df3-4688-94e3-fe54081c7c27','1eddb618-b30e-485f-88c4-6ee6450f5f1b','auto','2020-10-21','2021-10-21',361,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('03db9c8c-1bb0-4d9f-9f57-239932988aca','Q-29-1','7b991f30-0df3-4688-94e3-fe54081c7c27','auto',215,'2021-09-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('ed9b6cb0-5954-4015-9214-f2207ef34374','POL-29-1','7b991f30-0df3-4688-94e3-fe54081c7c27','03db9c8c-1bb0-4d9f-9f57-239932988aca','auto','2021-09-24','2022-09-24',215,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('8de49898-6f09-4022-8795-8b355ebf30ee','INC-29-1-0','ed9b6cb0-5954-4015-9214-f2207ef34374','7b991f30-0df3-4688-94e3-fe54081c7c27','Accident','Collision mineure','2026-02-06','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('e5c40a6b-6b28-4ba4-ac99-626de3205f0f','INC-29-1-1','ed9b6cb0-5954-4015-9214-f2207ef34374','7b991f30-0df3-4688-94e3-fe54081c7c27','Accident','Collision mineure','2022-10-08','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7cf93779-5b4f-413e-8448-a2dae51301cf','Q-29-2','7b991f30-0df3-4688-94e3-fe54081c7c27','auto',383,'2020-12-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('c42cb020-3532-435c-aaac-f66b8d7fd037','POL-29-2','7b991f30-0df3-4688-94e3-fe54081c7c27','7cf93779-5b4f-413e-8448-a2dae51301cf','auto','2020-12-26','2021-12-26',383,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('53ebcc42-5bc8-4ba5-80f1-d81e1ae7697f','7b991f30-0df3-4688-94e3-fe54081c7c27','Service','Bon service',5);


-- USER 30
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('7d0bceca-263c-4fc7-981a-8f7dd6f8e6b9','user30@test.com',crypt('test123', gen_salt('bf')),'client','2024-07-20');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('7d0bceca-263c-4fc7-981a-8f7dd6f8e6b9','Sofia','Razaf','034000030','Antananarivo','2024-07-20');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b798ea77-caf1-4950-b9d1-f7d0821e0925','Q-30-0','7d0bceca-263c-4fc7-981a-8f7dd6f8e6b9','auto',427,'2021-05-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('eeab8cbc-ac8b-4824-9408-6a216cf5d79d','POL-30-0','7d0bceca-263c-4fc7-981a-8f7dd6f8e6b9','b798ea77-caf1-4950-b9d1-f7d0821e0925','auto','2021-05-13','2022-05-13',427,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ec0a34c9-6595-495c-870f-c886cf59fe31','Q-30-1','7d0bceca-263c-4fc7-981a-8f7dd6f8e6b9','auto',88,'2023-06-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('90c7ef20-3dfc-417e-a574-2c6a51e9039b','POL-30-1','7d0bceca-263c-4fc7-981a-8f7dd6f8e6b9','ec0a34c9-6595-495c-870f-c886cf59fe31','auto','2023-06-05','2024-06-05',88,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('145c61d8-69b8-4589-904f-45201b15e21e','INC-30-1-0','90c7ef20-3dfc-417e-a574-2c6a51e9039b','7d0bceca-263c-4fc7-981a-8f7dd6f8e6b9','Accident','Collision mineure','2024-02-02','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('28502bf3-2ec1-41fd-93a5-e5e2abed9632','INC-30-1-1','90c7ef20-3dfc-417e-a574-2c6a51e9039b','7d0bceca-263c-4fc7-981a-8f7dd6f8e6b9','Accident','Collision mineure','2020-04-23','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('bcf475da-f3b2-4de2-9d3e-ac260f0b0f88','Q-30-2','7d0bceca-263c-4fc7-981a-8f7dd6f8e6b9','auto',411,'2022-12-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('83d551ef-6b2f-4de0-96ec-8a263e7e4e25','POL-30-2','7d0bceca-263c-4fc7-981a-8f7dd6f8e6b9','bcf475da-f3b2-4de2-9d3e-ac260f0b0f88','auto','2022-12-12','2023-12-12',411,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('b56f8917-7b29-48be-9202-db213f9e6382','INC-30-2-0','83d551ef-6b2f-4de0-96ec-8a263e7e4e25','7d0bceca-263c-4fc7-981a-8f7dd6f8e6b9','Accident','Collision mineure','2020-08-21','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('abc75c68-cec8-44cc-a7c5-8c9741850d32','INC-30-2-1','83d551ef-6b2f-4de0-96ec-8a263e7e4e25','7d0bceca-263c-4fc7-981a-8f7dd6f8e6b9','Accident','Collision mineure','2025-06-19','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('9ff68945-e6b1-4238-bdaa-1f0aa40b2f5c','7d0bceca-263c-4fc7-981a-8f7dd6f8e6b9','Service','Bon service',4);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('61b95352-f497-4a64-a870-6dd913945f36','7d0bceca-263c-4fc7-981a-8f7dd6f8e6b9','Service','Bon service',2);


-- USER 31
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('75c14c06-ab9a-428f-bdcd-bb38811762d6','user31@test.com',crypt('test123', gen_salt('bf')),'client','2024-12-31');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('75c14c06-ab9a-428f-bdcd-bb38811762d6','Hery','Rakoto','034000031','Antananarivo','2024-12-31');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8496f6dd-be47-41df-b282-848402dff303','Q-31-0','75c14c06-ab9a-428f-bdcd-bb38811762d6','auto',374,'2022-09-15');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('b461616e-9f48-460e-9cb6-34cb5301a548','POL-31-0','75c14c06-ab9a-428f-bdcd-bb38811762d6','8496f6dd-be47-41df-b282-848402dff303','auto','2022-09-15','2023-09-15',374,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('c202ed77-0f76-4e7b-b64e-8eb102470fcd','INC-31-0-0','b461616e-9f48-460e-9cb6-34cb5301a548','75c14c06-ab9a-428f-bdcd-bb38811762d6','Accident','Collision mineure','2025-01-05','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('72f5d682-303e-425d-87f9-1bda6acd6bc8','INC-31-0-1','b461616e-9f48-460e-9cb6-34cb5301a548','75c14c06-ab9a-428f-bdcd-bb38811762d6','Accident','Collision mineure','2023-07-23','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2fdd4ca8-0d84-4952-996a-108825e62ca2','Q-31-1','75c14c06-ab9a-428f-bdcd-bb38811762d6','auto',370,'2024-08-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('25340e27-e498-4fc2-a664-90d08191e641','POL-31-1','75c14c06-ab9a-428f-bdcd-bb38811762d6','2fdd4ca8-0d84-4952-996a-108825e62ca2','auto','2024-08-01','2025-08-01',370,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('9ab07bfd-9552-4038-b7c3-fe6eb55cb8dd','INC-31-1-0','25340e27-e498-4fc2-a664-90d08191e641','75c14c06-ab9a-428f-bdcd-bb38811762d6','Accident','Collision mineure','2026-03-03','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('e1acbf28-d0ae-4d6c-b0ef-b03d499595b7','INC-31-1-1','25340e27-e498-4fc2-a664-90d08191e641','75c14c06-ab9a-428f-bdcd-bb38811762d6','Accident','Collision mineure','2022-08-16','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e6492953-ed17-4fb2-804c-ea6c42d2c471','Q-31-2','75c14c06-ab9a-428f-bdcd-bb38811762d6','auto',166,'2026-04-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('fbca7a2c-f363-4f78-9b51-943210f60e8f','POL-31-2','75c14c06-ab9a-428f-bdcd-bb38811762d6','e6492953-ed17-4fb2-804c-ea6c42d2c471','auto','2026-04-24','2027-04-24',166,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('ad4e7c0b-47bb-4039-bb2a-0298fd0b5890','INC-31-2-0','fbca7a2c-f363-4f78-9b51-943210f60e8f','75c14c06-ab9a-428f-bdcd-bb38811762d6','Accident','Collision mineure','2025-02-26','auto');


-- USER 32
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('b363a094-618b-4a9e-9861-a9fd494e5de1','user32@test.com',crypt('test123', gen_salt('bf')),'client','2025-07-01');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('b363a094-618b-4a9e-9861-a9fd494e5de1','Tiana','Rakotovao','034000032','Antananarivo','2025-07-01');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('edcbffda-0e3c-464e-a59a-1bca2cf0edba','Q-32-0','b363a094-618b-4a9e-9861-a9fd494e5de1','auto',403,'2024-06-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('658feaf7-2a83-4656-9576-69b9bd5d7f37','POL-32-0','b363a094-618b-4a9e-9861-a9fd494e5de1','edcbffda-0e3c-464e-a59a-1bca2cf0edba','auto','2024-06-19','2025-06-19',403,10,'full');


-- USER 33
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('4707e957-0580-43ce-b7cf-e368e9d616f3','user33@test.com',crypt('test123', gen_salt('bf')),'client','2022-08-04');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('4707e957-0580-43ce-b7cf-e368e9d616f3','Mickael','Randria','034000033','Antananarivo','2022-08-04');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('6f17011b-2f58-423d-9f7e-7f695af94061','Q-33-0','4707e957-0580-43ce-b7cf-e368e9d616f3','auto',56,'2024-07-31');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('f06a30ba-c01f-457d-9669-c2133b39f04d','POL-33-0','4707e957-0580-43ce-b7cf-e368e9d616f3','6f17011b-2f58-423d-9f7e-7f695af94061','auto','2024-07-31','2025-07-31',56,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('efdfa5bc-2a50-4153-8c52-78ad88314ea7','INC-33-0-0','f06a30ba-c01f-457d-9669-c2133b39f04d','4707e957-0580-43ce-b7cf-e368e9d616f3','Accident','Collision mineure','2021-07-09','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('638bb13e-be9b-4aae-ad2a-797f3ff378da','INC-33-0-1','f06a30ba-c01f-457d-9669-c2133b39f04d','4707e957-0580-43ce-b7cf-e368e9d616f3','Accident','Collision mineure','2026-03-20','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1ffaf2b9-5db6-4a35-bbe7-480af5c5b330','Q-33-1','4707e957-0580-43ce-b7cf-e368e9d616f3','auto',496,'2025-01-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('09c46cc2-9c84-4970-845e-44c1016c56cd','POL-33-1','4707e957-0580-43ce-b7cf-e368e9d616f3','1ffaf2b9-5db6-4a35-bbe7-480af5c5b330','auto','2025-01-02','2026-01-02',496,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('b36a9aaa-6887-402a-a3f5-89dace6ff1e2','INC-33-1-0','09c46cc2-9c84-4970-845e-44c1016c56cd','4707e957-0580-43ce-b7cf-e368e9d616f3','Accident','Collision mineure','2025-06-08','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('d0778518-1ef5-4c03-9c9b-2d4e32301f75','4707e957-0580-43ce-b7cf-e368e9d616f3','Service','Bon service',2);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('d63b99af-5d75-41a6-b3f6-9107c8bcbb93','4707e957-0580-43ce-b7cf-e368e9d616f3','Service','Bon service',3);


-- USER 34
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('900be2e7-3a5a-44df-aec7-f2848b593333','user34@test.com',crypt('test123', gen_salt('bf')),'client','2020-03-21');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('900be2e7-3a5a-44df-aec7-f2848b593333','Hery','Rabe','034000034','Antananarivo','2020-03-21');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b3ae6153-51d1-41c7-b15b-531bc8bfd853','Q-34-0','900be2e7-3a5a-44df-aec7-f2848b593333','auto',327,'2020-08-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('b43d2c63-52cb-44e1-8870-7d391bd80ad7','POL-34-0','900be2e7-3a5a-44df-aec7-f2848b593333','b3ae6153-51d1-41c7-b15b-531bc8bfd853','auto','2020-08-05','2021-08-05',327,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('40824bff-2e78-4142-b523-81d08d24e25e','INC-34-0-0','b43d2c63-52cb-44e1-8870-7d391bd80ad7','900be2e7-3a5a-44df-aec7-f2848b593333','Accident','Collision mineure','2022-02-28','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('2196d758-127a-47a4-b35b-a7b7faef2ee2','INC-34-0-1','b43d2c63-52cb-44e1-8870-7d391bd80ad7','900be2e7-3a5a-44df-aec7-f2848b593333','Accident','Collision mineure','2024-07-08','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('84a6847f-ec58-4f54-84c9-3e78c8cc2270','Q-34-1','900be2e7-3a5a-44df-aec7-f2848b593333','auto',324,'2024-05-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('fccb73a7-8f27-4281-b25b-c7c61784f4e0','POL-34-1','900be2e7-3a5a-44df-aec7-f2848b593333','84a6847f-ec58-4f54-84c9-3e78c8cc2270','auto','2024-05-28','2025-05-28',324,10,'full');


-- USER 35
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ec464617-3887-48a4-b5dd-c58d1384a69d','user35@test.com',crypt('test123', gen_salt('bf')),'client','2021-10-28');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('ec464617-3887-48a4-b5dd-c58d1384a69d','Sofia','Randria','034000035','Antananarivo','2021-10-28');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e0a4315c-e6b1-48bc-9068-40334284efa9','Q-35-0','ec464617-3887-48a4-b5dd-c58d1384a69d','auto',118,'2024-09-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('c125fb1e-c786-42f0-8c20-6412629a014c','POL-35-0','ec464617-3887-48a4-b5dd-c58d1384a69d','e0a4315c-e6b1-48bc-9068-40334284efa9','auto','2024-09-17','2025-09-17',118,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('88ef048a-f5bd-497d-a1b8-aff9d6ef40c4','INC-35-0-0','c125fb1e-c786-42f0-8c20-6412629a014c','ec464617-3887-48a4-b5dd-c58d1384a69d','Accident','Collision mineure','2022-09-03','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7b4c6a81-f144-4155-b724-bed9e74d323a','Q-35-1','ec464617-3887-48a4-b5dd-c58d1384a69d','auto',53,'2021-11-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('2f6b2870-c967-41c5-9aa2-0b94f3a42eb1','POL-35-1','ec464617-3887-48a4-b5dd-c58d1384a69d','7b4c6a81-f144-4155-b724-bed9e74d323a','auto','2021-11-19','2022-11-19',53,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('f850aadb-3a57-4c54-8de5-9feba7bbbf55','INC-35-1-0','2f6b2870-c967-41c5-9aa2-0b94f3a42eb1','ec464617-3887-48a4-b5dd-c58d1384a69d','Accident','Collision mineure','2021-12-01','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('f0bd282c-8d76-46c9-8ae2-3f9e014c441d','INC-35-1-1','2f6b2870-c967-41c5-9aa2-0b94f3a42eb1','ec464617-3887-48a4-b5dd-c58d1384a69d','Accident','Collision mineure','2021-03-17','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d44a159b-fb77-4a52-b27d-86fa3691a449','Q-35-2','ec464617-3887-48a4-b5dd-c58d1384a69d','auto',52,'2020-12-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('7033e19b-b34a-4427-ba00-989a235e5357','POL-35-2','ec464617-3887-48a4-b5dd-c58d1384a69d','d44a159b-fb77-4a52-b27d-86fa3691a449','auto','2020-12-01','2021-12-01',52,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('b57d4340-d49f-4a86-a199-2e6b98f5fb02','ec464617-3887-48a4-b5dd-c58d1384a69d','Service','Bon service',3);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('1c801b6c-9c42-4bf7-8452-89673c936d13','ec464617-3887-48a4-b5dd-c58d1384a69d','Service','Bon service',3);


-- USER 36
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('d3d7b09b-9c9c-4a93-9e49-3369f8d15c22','user36@test.com',crypt('test123', gen_salt('bf')),'client','2020-09-03');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('d3d7b09b-9c9c-4a93-9e49-3369f8d15c22','Aina','Razaf','034000036','Antananarivo','2020-09-03');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b4c42e03-93cb-4b73-a62c-52c2d162c230','Q-36-0','d3d7b09b-9c9c-4a93-9e49-3369f8d15c22','auto',151,'2025-06-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('23f0655a-0f31-411e-ad4c-5644c214e44d','POL-36-0','d3d7b09b-9c9c-4a93-9e49-3369f8d15c22','b4c42e03-93cb-4b73-a62c-52c2d162c230','auto','2025-06-02','2026-06-02',151,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('80c30a28-eb61-48c4-ab19-a93d79a0a7c2','d3d7b09b-9c9c-4a93-9e49-3369f8d15c22','Service','Bon service',3);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('40025ba4-fb06-4129-b912-a55bb7ffe490','d3d7b09b-9c9c-4a93-9e49-3369f8d15c22','Service','Bon service',3);


-- USER 37
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('19929c5c-9f61-455b-af19-43f6ca4b6d9f','user37@test.com',crypt('test123', gen_salt('bf')),'client','2020-07-13');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('19929c5c-9f61-455b-af19-43f6ca4b6d9f','Paul','Razaf','034000037','Antananarivo','2020-07-13');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2738b3fa-d12e-4f07-a4f1-4f1d48f8e151','Q-37-0','19929c5c-9f61-455b-af19-43f6ca4b6d9f','auto',126,'2026-01-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('da7c0347-1451-4d5b-8014-3aa2d26179af','POL-37-0','19929c5c-9f61-455b-af19-43f6ca4b6d9f','2738b3fa-d12e-4f07-a4f1-4f1d48f8e151','auto','2026-01-08','2027-01-08',126,10,'full');


-- USER 38
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('7a5eac84-b6f2-453c-b095-ac049303090e','user38@test.com',crypt('test123', gen_salt('bf')),'client','2020-12-05');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('7a5eac84-b6f2-453c-b095-ac049303090e','Tiana','Raharison','034000038','Antananarivo','2020-12-05');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('19afab13-faf3-4466-80e8-fd8347c67981','Q-38-0','7a5eac84-b6f2-453c-b095-ac049303090e','auto',421,'2026-02-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('25a2162d-fc02-4fdd-b6c5-aed69c1f4a0f','POL-38-0','7a5eac84-b6f2-453c-b095-ac049303090e','19afab13-faf3-4466-80e8-fd8347c67981','auto','2026-02-25','2027-02-25',421,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('61f8e7fc-cf38-474f-a7b5-70246fdcedd1','INC-38-0-0','25a2162d-fc02-4fdd-b6c5-aed69c1f4a0f','7a5eac84-b6f2-453c-b095-ac049303090e','Accident','Collision mineure','2021-05-10','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('92d0dea4-e51a-459a-8d69-bf2cbd091d39','INC-38-0-1','25a2162d-fc02-4fdd-b6c5-aed69c1f4a0f','7a5eac84-b6f2-453c-b095-ac049303090e','Accident','Collision mineure','2025-11-14','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('122c8f17-e1db-4f55-83aa-0146bbf2fb8e','Q-38-1','7a5eac84-b6f2-453c-b095-ac049303090e','auto',405,'2022-04-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('213172c6-2fea-4f07-9af6-da45ec50e9e3','POL-38-1','7a5eac84-b6f2-453c-b095-ac049303090e','122c8f17-e1db-4f55-83aa-0146bbf2fb8e','auto','2022-04-20','2023-04-20',405,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('96d6f524-f77d-4b8a-8ad2-d8e1a168967a','INC-38-1-0','213172c6-2fea-4f07-9af6-da45ec50e9e3','7a5eac84-b6f2-453c-b095-ac049303090e','Accident','Collision mineure','2023-02-09','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('3824ca67-6151-482f-a9b4-51407d7e86ff','INC-38-1-1','213172c6-2fea-4f07-9af6-da45ec50e9e3','7a5eac84-b6f2-453c-b095-ac049303090e','Accident','Collision mineure','2023-10-08','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('c3e544e1-864f-42c3-9480-4d93a4fac396','7a5eac84-b6f2-453c-b095-ac049303090e','Service','Bon service',5);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('7bcb4486-b7ea-42e4-81cf-99230dcacda8','7a5eac84-b6f2-453c-b095-ac049303090e','Service','Bon service',4);


-- USER 39
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('4a85091e-c78b-4408-a69b-3cf2b119612f','user39@test.com',crypt('test123', gen_salt('bf')),'client','2023-04-04');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('4a85091e-c78b-4408-a69b-3cf2b119612f','Mickael','Razaf','034000039','Antananarivo','2023-04-04');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('76a040d3-7c68-47ee-8d92-13c3982ca3e3','Q-39-0','4a85091e-c78b-4408-a69b-3cf2b119612f','auto',350,'2026-01-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('58f130a4-2fec-4501-9810-a663951a8c9e','POL-39-0','4a85091e-c78b-4408-a69b-3cf2b119612f','76a040d3-7c68-47ee-8d92-13c3982ca3e3','auto','2026-01-09','2027-01-09',350,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e000ae17-b72d-4659-af12-713c903710ec','Q-39-1','4a85091e-c78b-4408-a69b-3cf2b119612f','auto',350,'2021-04-29');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('4e7c86c8-c944-4436-9f57-7147b6099290','POL-39-1','4a85091e-c78b-4408-a69b-3cf2b119612f','e000ae17-b72d-4659-af12-713c903710ec','auto','2021-04-29','2022-04-29',350,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('4178108b-9543-47fa-bea5-0bb765f17532','4a85091e-c78b-4408-a69b-3cf2b119612f','Service','Bon service',5);


-- USER 40
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('fc66c979-b749-4d37-9957-cdc4cb2499f7','user40@test.com',crypt('test123', gen_salt('bf')),'client','2022-05-22');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('fc66c979-b749-4d37-9957-cdc4cb2499f7','Lucas','Rakotovao','034000040','Antananarivo','2022-05-22');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ac295ed0-d267-46e9-8d92-d09164a4a5b3','Q-40-0','fc66c979-b749-4d37-9957-cdc4cb2499f7','auto',305,'2023-06-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('3c038563-9752-4b4b-8283-2a8c14594018','POL-40-0','fc66c979-b749-4d37-9957-cdc4cb2499f7','ac295ed0-d267-46e9-8d92-d09164a4a5b3','auto','2023-06-12','2024-06-12',305,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('03dd9c16-5fc3-46bc-89ff-1f122654b3ca','INC-40-0-0','3c038563-9752-4b4b-8283-2a8c14594018','fc66c979-b749-4d37-9957-cdc4cb2499f7','Accident','Collision mineure','2023-11-26','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b6e8fa3a-7a73-43a3-901d-7c30f2576e96','Q-40-1','fc66c979-b749-4d37-9957-cdc4cb2499f7','auto',207,'2022-12-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('ba5721f6-2fa2-4cf0-bec8-77a462bc00a2','POL-40-1','fc66c979-b749-4d37-9957-cdc4cb2499f7','b6e8fa3a-7a73-43a3-901d-7c30f2576e96','auto','2022-12-19','2023-12-19',207,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f92fa176-d34c-49ba-b5d4-274b32d1c1f1','Q-40-2','fc66c979-b749-4d37-9957-cdc4cb2499f7','auto',424,'2025-10-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('dcaf5e44-6455-4847-95d8-2a54b23c3e31','POL-40-2','fc66c979-b749-4d37-9957-cdc4cb2499f7','f92fa176-d34c-49ba-b5d4-274b32d1c1f1','auto','2025-10-04','2026-10-04',424,10,'full');


-- USER 41
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('6448ada6-83a4-4ecc-891f-5572081f091f','user41@test.com',crypt('test123', gen_salt('bf')),'client','2025-01-27');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('6448ada6-83a4-4ecc-891f-5572081f091f','Marie','Rabe','034000041','Antananarivo','2025-01-27');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d301643b-310f-4d42-befa-9d5daab47c39','Q-41-0','6448ada6-83a4-4ecc-891f-5572081f091f','auto',199,'2020-03-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('6080811b-e216-4eb8-8aa9-4716459fafeb','POL-41-0','6448ada6-83a4-4ecc-891f-5572081f091f','d301643b-310f-4d42-befa-9d5daab47c39','auto','2020-03-19','2021-03-19',199,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ebafab39-d904-449e-bf24-e1c9e76364eb','Q-41-1','6448ada6-83a4-4ecc-891f-5572081f091f','auto',361,'2025-05-31');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('f58a34cb-0533-4ae5-847d-6260401ca0d8','POL-41-1','6448ada6-83a4-4ecc-891f-5572081f091f','ebafab39-d904-449e-bf24-e1c9e76364eb','auto','2025-05-31','2026-05-31',361,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('5cfaaa9d-949a-4710-8810-c36afc08f5ec','INC-41-1-0','f58a34cb-0533-4ae5-847d-6260401ca0d8','6448ada6-83a4-4ecc-891f-5572081f091f','Accident','Collision mineure','2022-06-25','auto');


-- USER 42
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('fba95a05-9939-4d54-bcd2-b3716b1a185e','user42@test.com',crypt('test123', gen_salt('bf')),'client','2020-01-13');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('fba95a05-9939-4d54-bcd2-b3716b1a185e','Lucas','Raharison','034000042','Antananarivo','2020-01-13');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('678b42d3-f913-4023-9c04-220c5ea6dd42','Q-42-0','fba95a05-9939-4d54-bcd2-b3716b1a185e','auto',163,'2020-02-18');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('caf733de-7835-49fa-ad89-e237bbf9eb86','POL-42-0','fba95a05-9939-4d54-bcd2-b3716b1a185e','678b42d3-f913-4023-9c04-220c5ea6dd42','auto','2020-02-18','2021-02-18',163,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('ae0f99c5-30f0-4652-b8c3-22aa2d8d25a5','INC-42-0-0','caf733de-7835-49fa-ad89-e237bbf9eb86','fba95a05-9939-4d54-bcd2-b3716b1a185e','Accident','Collision mineure','2026-04-01','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('b603beaf-b15d-4dc7-8d7a-52dfea29a198','fba95a05-9939-4d54-bcd2-b3716b1a185e','Service','Bon service',2);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('91bace91-008f-4ca6-973a-abae6d2018c4','fba95a05-9939-4d54-bcd2-b3716b1a185e','Service','Bon service',2);


-- USER 43
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('5755484d-3caa-4d41-80e2-cd9533d190be','user43@test.com',crypt('test123', gen_salt('bf')),'client','2025-09-22');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('5755484d-3caa-4d41-80e2-cd9533d190be','Marie','Andri','034000043','Antananarivo','2025-09-22');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e1e6e895-b0c2-49ac-acdb-3e7eaf20e0a7','Q-43-0','5755484d-3caa-4d41-80e2-cd9533d190be','auto',249,'2026-04-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('6dfdde29-97ce-417c-af5f-5864170f7021','POL-43-0','5755484d-3caa-4d41-80e2-cd9533d190be','e1e6e895-b0c2-49ac-acdb-3e7eaf20e0a7','auto','2026-04-23','2027-04-23',249,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('333a141e-53dd-4d93-b7f0-5463a6ba7c36','5755484d-3caa-4d41-80e2-cd9533d190be','Service','Bon service',5);


-- USER 44
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('790ad098-bb89-435d-b4e8-6225eb2753a7','user44@test.com',crypt('test123', gen_salt('bf')),'client','2024-09-12');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('790ad098-bb89-435d-b4e8-6225eb2753a7','Sofia','Rakoto','034000044','Antananarivo','2024-09-12');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('cb1f0707-b5c7-401f-be30-81e9cc70ccb4','Q-44-0','790ad098-bb89-435d-b4e8-6225eb2753a7','auto',199,'2020-05-15');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('fc5c2cd8-0b2b-4ff4-ba10-b8b590bebe29','POL-44-0','790ad098-bb89-435d-b4e8-6225eb2753a7','cb1f0707-b5c7-401f-be30-81e9cc70ccb4','auto','2020-05-15','2021-05-15',199,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('c5612148-5373-4515-a848-896de36a978b','INC-44-0-0','fc5c2cd8-0b2b-4ff4-ba10-b8b590bebe29','790ad098-bb89-435d-b4e8-6225eb2753a7','Accident','Collision mineure','2020-06-06','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('254447a8-d90f-4eea-8d5e-b12e43531b9e','Q-44-1','790ad098-bb89-435d-b4e8-6225eb2753a7','auto',282,'2021-10-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('b1a99460-da16-4510-b44e-7db470801269','POL-44-1','790ad098-bb89-435d-b4e8-6225eb2753a7','254447a8-d90f-4eea-8d5e-b12e43531b9e','auto','2021-10-24','2022-10-24',282,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('0b22af53-6cba-4799-985b-123468990c10','INC-44-1-0','b1a99460-da16-4510-b44e-7db470801269','790ad098-bb89-435d-b4e8-6225eb2753a7','Accident','Collision mineure','2021-09-20','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('c9fe213d-e363-47dc-b8e7-13186728a509','INC-44-1-1','b1a99460-da16-4510-b44e-7db470801269','790ad098-bb89-435d-b4e8-6225eb2753a7','Accident','Collision mineure','2023-05-04','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('05655e55-b555-439a-b4f0-592072b31b91','Q-44-2','790ad098-bb89-435d-b4e8-6225eb2753a7','auto',380,'2024-05-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('49f02921-617d-466f-b21a-295596ac793e','POL-44-2','790ad098-bb89-435d-b4e8-6225eb2753a7','05655e55-b555-439a-b4f0-592072b31b91','auto','2024-05-06','2025-05-06',380,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('f845d773-abdd-4871-93d3-e6c8000bdba2','INC-44-2-0','49f02921-617d-466f-b21a-295596ac793e','790ad098-bb89-435d-b4e8-6225eb2753a7','Accident','Collision mineure','2024-06-20','auto');


-- USER 45
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('93cd423f-ad7a-4d63-8d80-21fa911f7563','user45@test.com',crypt('test123', gen_salt('bf')),'client','2024-09-16');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('93cd423f-ad7a-4d63-8d80-21fa911f7563','Aina','Rakotovao','034000045','Antananarivo','2024-09-16');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('779c85ad-8a98-478a-a397-f5b2e3c354d5','Q-45-0','93cd423f-ad7a-4d63-8d80-21fa911f7563','auto',392,'2021-09-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('c906a7c5-bda0-4be9-9477-cdc0118bbd3b','POL-45-0','93cd423f-ad7a-4d63-8d80-21fa911f7563','779c85ad-8a98-478a-a397-f5b2e3c354d5','auto','2021-09-19','2022-09-19',392,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('280d177c-69c6-4bb7-ac74-f728361e5f5c','INC-45-0-0','c906a7c5-bda0-4be9-9477-cdc0118bbd3b','93cd423f-ad7a-4d63-8d80-21fa911f7563','Accident','Collision mineure','2024-11-15','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('943d85a1-8642-44c0-98ce-5dd6c16c2fd8','93cd423f-ad7a-4d63-8d80-21fa911f7563','Service','Bon service',3);


-- USER 46
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('d51532dc-9848-473a-b18f-6bf6afbe0c23','user46@test.com',crypt('test123', gen_salt('bf')),'client','2025-02-09');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('d51532dc-9848-473a-b18f-6bf6afbe0c23','Paul','Rakoto','034000046','Antananarivo','2025-02-09');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('769274fe-6f51-4d38-9e2f-89aeda13e472','Q-46-0','d51532dc-9848-473a-b18f-6bf6afbe0c23','auto',165,'2026-03-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('58f584d5-4b9b-4a16-986e-d2088d15a174','POL-46-0','d51532dc-9848-473a-b18f-6bf6afbe0c23','769274fe-6f51-4d38-9e2f-89aeda13e472','auto','2026-03-13','2027-03-13',165,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('99db66f2-f28c-466a-9f52-9ac453d3f288','INC-46-0-0','58f584d5-4b9b-4a16-986e-d2088d15a174','d51532dc-9848-473a-b18f-6bf6afbe0c23','Accident','Collision mineure','2024-02-28','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('eeb3429a-4622-4220-a849-a9d51842df6c','INC-46-0-1','58f584d5-4b9b-4a16-986e-d2088d15a174','d51532dc-9848-473a-b18f-6bf6afbe0c23','Accident','Collision mineure','2022-12-28','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('4925244e-7841-474b-ae8f-398c89aa4c9d','Q-46-1','d51532dc-9848-473a-b18f-6bf6afbe0c23','auto',211,'2025-09-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('896dc8d5-2381-404e-8509-df7295f5c9be','POL-46-1','d51532dc-9848-473a-b18f-6bf6afbe0c23','4925244e-7841-474b-ae8f-398c89aa4c9d','auto','2025-09-01','2026-09-01',211,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('9751594d-0cbe-4b6b-bbbc-dad44ab7edba','INC-46-1-0','896dc8d5-2381-404e-8509-df7295f5c9be','d51532dc-9848-473a-b18f-6bf6afbe0c23','Accident','Collision mineure','2026-02-20','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('d8c0545d-b655-4ef0-8bde-5135b91f413a','INC-46-1-1','896dc8d5-2381-404e-8509-df7295f5c9be','d51532dc-9848-473a-b18f-6bf6afbe0c23','Accident','Collision mineure','2020-12-12','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c59d2da0-9805-4050-bd8d-fa581e04fde6','Q-46-2','d51532dc-9848-473a-b18f-6bf6afbe0c23','auto',109,'2025-08-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('48f7b80c-e01c-4e79-9091-644ab67ce8e0','POL-46-2','d51532dc-9848-473a-b18f-6bf6afbe0c23','c59d2da0-9805-4050-bd8d-fa581e04fde6','auto','2025-08-14','2026-08-14',109,10,'full');


-- USER 47
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('79e0d8a3-8141-487c-9f96-b3dd1ba27c61','user47@test.com',crypt('test123', gen_salt('bf')),'client','2025-05-01');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('79e0d8a3-8141-487c-9f96-b3dd1ba27c61','Hery','Andri','034000047','Antananarivo','2025-05-01');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8b5c821c-7085-4ed3-a858-7f8b2d3882c4','Q-47-0','79e0d8a3-8141-487c-9f96-b3dd1ba27c61','auto',108,'2020-12-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('2a46ad19-495f-4b73-8153-7c81f4818266','POL-47-0','79e0d8a3-8141-487c-9f96-b3dd1ba27c61','8b5c821c-7085-4ed3-a858-7f8b2d3882c4','auto','2020-12-17','2021-12-17',108,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('d49bd0c1-197c-4048-b54c-a77d8a9ab389','79e0d8a3-8141-487c-9f96-b3dd1ba27c61','Service','Bon service',5);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('65cdff21-84b3-4647-91cd-1053d650b2ec','79e0d8a3-8141-487c-9f96-b3dd1ba27c61','Service','Bon service',4);


-- USER 48
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('195cec2b-8741-461a-9db9-180e50a6092a','user48@test.com',crypt('test123', gen_salt('bf')),'client','2024-12-26');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('195cec2b-8741-461a-9db9-180e50a6092a','Sofia','Randria','034000048','Antananarivo','2024-12-26');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('22548317-c08d-4665-8c3f-2831d49b59dc','Q-48-0','195cec2b-8741-461a-9db9-180e50a6092a','auto',291,'2024-07-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('26c5a729-5a36-4de4-b3a2-3f22ea03fe0d','POL-48-0','195cec2b-8741-461a-9db9-180e50a6092a','22548317-c08d-4665-8c3f-2831d49b59dc','auto','2024-07-27','2025-07-27',291,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('a9f0cea8-b508-4b87-9000-eadcbd72faef','INC-48-0-0','26c5a729-5a36-4de4-b3a2-3f22ea03fe0d','195cec2b-8741-461a-9db9-180e50a6092a','Accident','Collision mineure','2021-03-04','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('beeb5251-b074-4f7a-a7cc-1e07abcad322','Q-48-1','195cec2b-8741-461a-9db9-180e50a6092a','auto',492,'2022-09-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('e21f7f51-7a82-4083-9714-7bfc112430db','POL-48-1','195cec2b-8741-461a-9db9-180e50a6092a','beeb5251-b074-4f7a-a7cc-1e07abcad322','auto','2022-09-23','2023-09-23',492,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('62f51726-444c-45c7-a9c4-385242ceb0db','Q-48-2','195cec2b-8741-461a-9db9-180e50a6092a','auto',219,'2020-06-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('7a52b0fe-807a-448b-a646-77302e8e33f2','POL-48-2','195cec2b-8741-461a-9db9-180e50a6092a','62f51726-444c-45c7-a9c4-385242ceb0db','auto','2020-06-14','2021-06-14',219,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('c7cdaaac-53f9-4a1b-8ba6-789f49271090','INC-48-2-0','7a52b0fe-807a-448b-a646-77302e8e33f2','195cec2b-8741-461a-9db9-180e50a6092a','Accident','Collision mineure','2022-09-26','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('64ec2f2c-bb6a-4f1f-9e90-70bbcf714397','INC-48-2-1','7a52b0fe-807a-448b-a646-77302e8e33f2','195cec2b-8741-461a-9db9-180e50a6092a','Accident','Collision mineure','2025-09-14','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('005fee90-ecc5-4f22-9a49-51ce9cf3385d','195cec2b-8741-461a-9db9-180e50a6092a','Service','Bon service',5);


-- USER 49
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('69544a26-d414-488d-8aec-bb42c8deb05d','user49@test.com',crypt('test123', gen_salt('bf')),'client','2024-02-01');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('69544a26-d414-488d-8aec-bb42c8deb05d','Paul','Raharison','034000049','Antananarivo','2024-02-01');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3c0ad5e6-ae81-4abf-b4ff-0673e1a73951','Q-49-0','69544a26-d414-488d-8aec-bb42c8deb05d','auto',146,'2021-03-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('17726702-1b75-4fc5-bc2f-d7e888d69845','POL-49-0','69544a26-d414-488d-8aec-bb42c8deb05d','3c0ad5e6-ae81-4abf-b4ff-0673e1a73951','auto','2021-03-16','2022-03-16',146,10,'full');


-- USER 50
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('10dad8ff-3be2-44a1-8966-31966a350acb','user50@test.com',crypt('test123', gen_salt('bf')),'client','2023-01-09');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('10dad8ff-3be2-44a1-8966-31966a350acb','Aina','Andri','034000050','Antananarivo','2023-01-09');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('6f982956-d54d-4637-bf0c-8370059c52bb','Q-50-0','10dad8ff-3be2-44a1-8966-31966a350acb','auto',431,'2021-05-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('5c64c7ca-8c5e-4bb6-bad2-3ad5962f6aee','POL-50-0','10dad8ff-3be2-44a1-8966-31966a350acb','6f982956-d54d-4637-bf0c-8370059c52bb','auto','2021-05-20','2022-05-20',431,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('b323e325-e8a6-43b2-b85c-eef4c21de00f','INC-50-0-0','5c64c7ca-8c5e-4bb6-bad2-3ad5962f6aee','10dad8ff-3be2-44a1-8966-31966a350acb','Accident','Collision mineure','2026-04-04','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('7a540944-0818-4ba0-a774-a067b63d6a0f','INC-50-0-1','5c64c7ca-8c5e-4bb6-bad2-3ad5962f6aee','10dad8ff-3be2-44a1-8966-31966a350acb','Accident','Collision mineure','2025-06-04','auto');


-- USER 51
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('5e719424-fc69-466a-ba29-75be28dfaf71','user51@test.com',crypt('test123', gen_salt('bf')),'client','2021-06-27');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('5e719424-fc69-466a-ba29-75be28dfaf71','Hery','Randria','034000051','Antananarivo','2021-06-27');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('06240958-67b1-4bd6-acd0-86fe52c6f930','Q-51-0','5e719424-fc69-466a-ba29-75be28dfaf71','auto',477,'2022-08-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('12885820-33d4-4b45-bda2-1e5a142750a7','POL-51-0','5e719424-fc69-466a-ba29-75be28dfaf71','06240958-67b1-4bd6-acd0-86fe52c6f930','auto','2022-08-14','2023-08-14',477,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('aa651339-20c3-4d2e-8e3e-bb11ce340ae9','5e719424-fc69-466a-ba29-75be28dfaf71','Service','Bon service',5);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('3c8ea204-52f9-4712-9d1c-1b16c32e7f53','5e719424-fc69-466a-ba29-75be28dfaf71','Service','Bon service',3);


-- USER 52
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('169a4503-98b2-4f74-986f-0ee8b77be6db','user52@test.com',crypt('test123', gen_salt('bf')),'client','2024-06-24');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('169a4503-98b2-4f74-986f-0ee8b77be6db','Marie','Rakoto','034000052','Antananarivo','2024-06-24');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1b100cc1-6011-4c2c-8855-0b0f36dd8cdc','Q-52-0','169a4503-98b2-4f74-986f-0ee8b77be6db','auto',133,'2024-04-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('fa5ef590-e85a-420a-919c-3570d90270d9','POL-52-0','169a4503-98b2-4f74-986f-0ee8b77be6db','1b100cc1-6011-4c2c-8855-0b0f36dd8cdc','auto','2024-04-01','2025-04-01',133,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('7ce4e385-e878-4eae-8e65-70383fa9f6c1','INC-52-0-0','fa5ef590-e85a-420a-919c-3570d90270d9','169a4503-98b2-4f74-986f-0ee8b77be6db','Accident','Collision mineure','2026-02-18','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('40dce176-f20a-4a9b-8c13-63997fd516db','INC-52-0-1','fa5ef590-e85a-420a-919c-3570d90270d9','169a4503-98b2-4f74-986f-0ee8b77be6db','Accident','Collision mineure','2023-09-29','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('cfa34e98-8dee-4623-8777-7b9eb4e49d37','Q-52-1','169a4503-98b2-4f74-986f-0ee8b77be6db','auto',118,'2025-08-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('6e72f144-aa8e-4876-8f96-1534385bb79b','POL-52-1','169a4503-98b2-4f74-986f-0ee8b77be6db','cfa34e98-8dee-4623-8777-7b9eb4e49d37','auto','2025-08-27','2026-08-27',118,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('ed0119eb-d1a6-41c2-bdf2-310dbc92052a','INC-52-1-0','6e72f144-aa8e-4876-8f96-1534385bb79b','169a4503-98b2-4f74-986f-0ee8b77be6db','Accident','Collision mineure','2021-11-01','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('b729075a-0229-40b5-a8f0-698bfbbc098f','INC-52-1-1','6e72f144-aa8e-4876-8f96-1534385bb79b','169a4503-98b2-4f74-986f-0ee8b77be6db','Accident','Collision mineure','2024-11-05','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('74b016a6-1862-4d91-9640-e4c38f8aa005','169a4503-98b2-4f74-986f-0ee8b77be6db','Service','Bon service',5);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('c03ff2e3-5bab-432a-81cb-e1dafcec24c9','169a4503-98b2-4f74-986f-0ee8b77be6db','Service','Bon service',4);


-- USER 53
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('e0355dce-81a9-49fc-9147-f5939285ed08','user53@test.com',crypt('test123', gen_salt('bf')),'client','2025-02-02');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('e0355dce-81a9-49fc-9147-f5939285ed08','Aina','Raharison','034000053','Antananarivo','2025-02-02');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('6414df82-7bd7-4749-a588-a169c285a2ac','Q-53-0','e0355dce-81a9-49fc-9147-f5939285ed08','auto',391,'2020-09-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('438ff672-dcd6-400d-8109-ddf8812f3308','POL-53-0','e0355dce-81a9-49fc-9147-f5939285ed08','6414df82-7bd7-4749-a588-a169c285a2ac','auto','2020-09-23','2021-09-23',391,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8ab63875-73a2-4231-a929-de524a90ebde','Q-53-1','e0355dce-81a9-49fc-9147-f5939285ed08','auto',211,'2022-03-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('352f3097-7f61-42df-a16d-b872b10b328f','POL-53-1','e0355dce-81a9-49fc-9147-f5939285ed08','8ab63875-73a2-4231-a929-de524a90ebde','auto','2022-03-02','2023-03-02',211,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('771ee12c-41b5-416f-930c-62b7901d1bad','INC-53-1-0','352f3097-7f61-42df-a16d-b872b10b328f','e0355dce-81a9-49fc-9147-f5939285ed08','Accident','Collision mineure','2022-07-26','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('c588fb8d-ce2a-4d90-902e-9d41c637e94f','INC-53-1-1','352f3097-7f61-42df-a16d-b872b10b328f','e0355dce-81a9-49fc-9147-f5939285ed08','Accident','Collision mineure','2025-06-06','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('54125f02-6c81-4b43-a72a-09688c74b068','e0355dce-81a9-49fc-9147-f5939285ed08','Service','Bon service',2);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('96013521-1dac-4507-bb0e-1cacee3182b1','e0355dce-81a9-49fc-9147-f5939285ed08','Service','Bon service',2);


-- USER 54
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('6192f3d0-8e07-46eb-b5fe-76f093ef3c12','user54@test.com',crypt('test123', gen_salt('bf')),'client','2022-07-08');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('6192f3d0-8e07-46eb-b5fe-76f093ef3c12','Tiana','Rakotovao','034000054','Antananarivo','2022-07-08');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('55617efd-6114-4f8a-abf5-d6e292e5a45e','Q-54-0','6192f3d0-8e07-46eb-b5fe-76f093ef3c12','auto',346,'2024-07-31');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('b59d1e0e-8b8a-41b3-a168-1fe85829a731','POL-54-0','6192f3d0-8e07-46eb-b5fe-76f093ef3c12','55617efd-6114-4f8a-abf5-d6e292e5a45e','auto','2024-07-31','2025-07-31',346,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('44e545fb-4b02-4a40-9be8-0311b1b175e7','INC-54-0-0','b59d1e0e-8b8a-41b3-a168-1fe85829a731','6192f3d0-8e07-46eb-b5fe-76f093ef3c12','Accident','Collision mineure','2021-07-21','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('75ea527b-5303-423b-b0c3-ee9c8b043c2c','Q-54-1','6192f3d0-8e07-46eb-b5fe-76f093ef3c12','auto',54,'2020-09-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('24a8dd37-4354-4735-8bf1-e29fd58b5388','POL-54-1','6192f3d0-8e07-46eb-b5fe-76f093ef3c12','75ea527b-5303-423b-b0c3-ee9c8b043c2c','auto','2020-09-28','2021-09-28',54,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('cde078a3-894c-4233-aadb-bddb210a530f','INC-54-1-0','24a8dd37-4354-4735-8bf1-e29fd58b5388','6192f3d0-8e07-46eb-b5fe-76f093ef3c12','Accident','Collision mineure','2023-10-04','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('5b7cef0c-5fea-45a9-bd6a-4e33d793615d','INC-54-1-1','24a8dd37-4354-4735-8bf1-e29fd58b5388','6192f3d0-8e07-46eb-b5fe-76f093ef3c12','Accident','Collision mineure','2023-04-16','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('6505d227-1d79-418b-90a0-2ec295eb8048','6192f3d0-8e07-46eb-b5fe-76f093ef3c12','Service','Bon service',3);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('d450413a-b100-4c0c-9cdf-aea76eb2c61b','6192f3d0-8e07-46eb-b5fe-76f093ef3c12','Service','Bon service',3);


-- USER 55
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('97b99fd2-9b59-4e17-ac55-3a9d0441f9c4','user55@test.com',crypt('test123', gen_salt('bf')),'client','2020-04-14');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('97b99fd2-9b59-4e17-ac55-3a9d0441f9c4','Lina','Razaf','034000055','Antananarivo','2020-04-14');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('5b5bef94-d267-4b56-b035-8474becde0eb','Q-55-0','97b99fd2-9b59-4e17-ac55-3a9d0441f9c4','auto',498,'2026-04-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('96f549d7-903a-4ffa-9b7f-6e16469a8590','POL-55-0','97b99fd2-9b59-4e17-ac55-3a9d0441f9c4','5b5bef94-d267-4b56-b035-8474becde0eb','auto','2026-04-10','2027-04-10',498,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('b9f0359f-441b-4367-b89a-9314261035fd','INC-55-0-0','96f549d7-903a-4ffa-9b7f-6e16469a8590','97b99fd2-9b59-4e17-ac55-3a9d0441f9c4','Accident','Collision mineure','2024-09-06','auto');


-- USER 56
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('78e72a3d-3b6b-4e5a-997b-39618e14bbbf','user56@test.com',crypt('test123', gen_salt('bf')),'client','2024-09-07');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('78e72a3d-3b6b-4e5a-997b-39618e14bbbf','Jean','Rabe','034000056','Antananarivo','2024-09-07');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ae803499-fe29-481a-955c-52b8c9eab75c','Q-56-0','78e72a3d-3b6b-4e5a-997b-39618e14bbbf','auto',263,'2023-03-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('a2e360fa-20fe-4af8-888f-2a3ddcef6254','POL-56-0','78e72a3d-3b6b-4e5a-997b-39618e14bbbf','ae803499-fe29-481a-955c-52b8c9eab75c','auto','2023-03-24','2024-03-24',263,10,'full');


-- USER 57
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('69854360-faf6-4f8d-b031-9f123e10340a','user57@test.com',crypt('test123', gen_salt('bf')),'client','2022-04-11');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('69854360-faf6-4f8d-b031-9f123e10340a','Lina','Randria','034000057','Antananarivo','2022-04-11');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('90fd451b-2ee9-4970-9087-50055bd15f0e','Q-57-0','69854360-faf6-4f8d-b031-9f123e10340a','auto',388,'2020-11-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('174cc2e1-68d2-4db8-b17c-c20bfa057319','POL-57-0','69854360-faf6-4f8d-b031-9f123e10340a','90fd451b-2ee9-4970-9087-50055bd15f0e','auto','2020-11-25','2021-11-25',388,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9ebfebf6-b500-4efa-9faa-850d506b2642','Q-57-1','69854360-faf6-4f8d-b031-9f123e10340a','auto',231,'2023-12-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('64423f19-2e22-4b1d-ac40-66c3f6c64069','POL-57-1','69854360-faf6-4f8d-b031-9f123e10340a','9ebfebf6-b500-4efa-9faa-850d506b2642','auto','2023-12-08','2024-12-08',231,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('732093d2-ea77-4924-813c-84bbe09c60f3','69854360-faf6-4f8d-b031-9f123e10340a','Service','Bon service',2);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('856e638b-cb90-45c7-b6a8-4a025214faa9','69854360-faf6-4f8d-b031-9f123e10340a','Service','Bon service',4);


-- USER 58
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('5ad6feed-5b9a-4cd2-a172-acbe493187c0','user58@test.com',crypt('test123', gen_salt('bf')),'client','2021-05-23');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('5ad6feed-5b9a-4cd2-a172-acbe493187c0','Tiana','Randria','034000058','Antananarivo','2021-05-23');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f03cb527-2aa6-4949-bebf-ff8638353840','Q-58-0','5ad6feed-5b9a-4cd2-a172-acbe493187c0','auto',364,'2022-12-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('449d17cf-5046-4301-8b63-7fdc0cd9b04e','POL-58-0','5ad6feed-5b9a-4cd2-a172-acbe493187c0','f03cb527-2aa6-4949-bebf-ff8638353840','auto','2022-12-10','2023-12-10',364,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('a8ad8af0-ebc6-4e6d-a2aa-c547f77f67c2','INC-58-0-0','449d17cf-5046-4301-8b63-7fdc0cd9b04e','5ad6feed-5b9a-4cd2-a172-acbe493187c0','Accident','Collision mineure','2025-01-20','auto');


-- USER 59
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ffeee912-21ae-4ba5-8cc6-a3a8a7a631bf','user59@test.com',crypt('test123', gen_salt('bf')),'client','2020-06-15');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('ffeee912-21ae-4ba5-8cc6-a3a8a7a631bf','Mickael','Rakoto','034000059','Antananarivo','2020-06-15');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('55587463-18fb-4a6f-80cc-a8e07117b788','Q-59-0','ffeee912-21ae-4ba5-8cc6-a3a8a7a631bf','auto',480,'2023-08-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('78c7e9ee-bf6a-436b-add7-a897e9268efe','POL-59-0','ffeee912-21ae-4ba5-8cc6-a3a8a7a631bf','55587463-18fb-4a6f-80cc-a8e07117b788','auto','2023-08-25','2024-08-25',480,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('72a45cf6-9e3e-46a5-afa3-ce3807f3ed3b','Q-59-1','ffeee912-21ae-4ba5-8cc6-a3a8a7a631bf','auto',60,'2022-05-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('f27a04f3-f12c-4fc1-b4f2-e60a17b5b370','POL-59-1','ffeee912-21ae-4ba5-8cc6-a3a8a7a631bf','72a45cf6-9e3e-46a5-afa3-ce3807f3ed3b','auto','2022-05-24','2023-05-24',60,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('e7a57005-64f6-4ee9-8bcb-3612debdaf30','INC-59-1-0','f27a04f3-f12c-4fc1-b4f2-e60a17b5b370','ffeee912-21ae-4ba5-8cc6-a3a8a7a631bf','Accident','Collision mineure','2025-10-21','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('2d6be4ad-f806-43cb-9197-516cfd49604f','INC-59-1-1','f27a04f3-f12c-4fc1-b4f2-e60a17b5b370','ffeee912-21ae-4ba5-8cc6-a3a8a7a631bf','Accident','Collision mineure','2021-05-10','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d5029cc5-380a-495d-88b9-33651510d860','Q-59-2','ffeee912-21ae-4ba5-8cc6-a3a8a7a631bf','auto',424,'2024-07-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('01c1f0de-2c44-43f8-be4a-acb80b1d356a','POL-59-2','ffeee912-21ae-4ba5-8cc6-a3a8a7a631bf','d5029cc5-380a-495d-88b9-33651510d860','auto','2024-07-27','2025-07-27',424,10,'full');


-- USER 60
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('bacd1f64-a7da-4b39-b842-016a2bf5e8af','user60@test.com',crypt('test123', gen_salt('bf')),'client','2025-10-08');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('bacd1f64-a7da-4b39-b842-016a2bf5e8af','Mickael','Rakotovao','034000060','Antananarivo','2025-10-08');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('61332bde-812c-43a6-a83d-4a1735eac6b4','Q-60-0','bacd1f64-a7da-4b39-b842-016a2bf5e8af','auto',57,'2023-05-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('c503cb27-f073-44ba-ae4f-fe829d8655e2','POL-60-0','bacd1f64-a7da-4b39-b842-016a2bf5e8af','61332bde-812c-43a6-a83d-4a1735eac6b4','auto','2023-05-23','2024-05-23',57,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('ba0065a9-e0dd-487c-babd-909087490520','INC-60-0-0','c503cb27-f073-44ba-ae4f-fe829d8655e2','bacd1f64-a7da-4b39-b842-016a2bf5e8af','Accident','Collision mineure','2024-12-03','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d8f04b6c-2838-493b-8836-8df987ee5550','Q-60-1','bacd1f64-a7da-4b39-b842-016a2bf5e8af','auto',241,'2020-03-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('e9164252-0c09-40d7-a9f1-dd74f368187f','POL-60-1','bacd1f64-a7da-4b39-b842-016a2bf5e8af','d8f04b6c-2838-493b-8836-8df987ee5550','auto','2020-03-28','2021-03-28',241,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('743c0303-702f-4999-a6e9-62d45d2e2be1','Q-60-2','bacd1f64-a7da-4b39-b842-016a2bf5e8af','auto',499,'2023-03-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('35231935-3cd1-4c41-85cc-aba27bc774bc','POL-60-2','bacd1f64-a7da-4b39-b842-016a2bf5e8af','743c0303-702f-4999-a6e9-62d45d2e2be1','auto','2023-03-12','2024-03-12',499,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('d28f1ba7-f4cc-4fe0-8472-aa70e6913d77','INC-60-2-0','35231935-3cd1-4c41-85cc-aba27bc774bc','bacd1f64-a7da-4b39-b842-016a2bf5e8af','Accident','Collision mineure','2021-08-12','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('d65706ec-1017-47da-b828-365a9d55480e','INC-60-2-1','35231935-3cd1-4c41-85cc-aba27bc774bc','bacd1f64-a7da-4b39-b842-016a2bf5e8af','Accident','Collision mineure','2023-06-20','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('604f6469-ac82-4823-a9f7-ae63e04e56bf','bacd1f64-a7da-4b39-b842-016a2bf5e8af','Service','Bon service',3);


-- USER 61
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('cd20652b-1939-4a3a-b6b9-e6c996f3feb8','user61@test.com',crypt('test123', gen_salt('bf')),'client','2022-01-10');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('cd20652b-1939-4a3a-b6b9-e6c996f3feb8','Lina','Andri','034000061','Antananarivo','2022-01-10');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('6ce81f5b-3117-440f-9e79-eb21fe9f172b','Q-61-0','cd20652b-1939-4a3a-b6b9-e6c996f3feb8','auto',109,'2024-12-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('84d5d2a5-ac5e-4ee7-abdb-6dc3193d1e32','POL-61-0','cd20652b-1939-4a3a-b6b9-e6c996f3feb8','6ce81f5b-3117-440f-9e79-eb21fe9f172b','auto','2024-12-03','2025-12-03',109,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('cde839fd-cf93-46f1-a929-3bf26e6907da','INC-61-0-0','84d5d2a5-ac5e-4ee7-abdb-6dc3193d1e32','cd20652b-1939-4a3a-b6b9-e6c996f3feb8','Accident','Collision mineure','2024-02-13','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('e3c91c42-8e0d-4805-9013-787917406925','INC-61-0-1','84d5d2a5-ac5e-4ee7-abdb-6dc3193d1e32','cd20652b-1939-4a3a-b6b9-e6c996f3feb8','Accident','Collision mineure','2024-04-23','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('92b82fac-f224-4271-86ef-558200b4d817','Q-61-1','cd20652b-1939-4a3a-b6b9-e6c996f3feb8','auto',435,'2020-06-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('959abefc-6b25-4913-b13b-5856eca00ee9','POL-61-1','cd20652b-1939-4a3a-b6b9-e6c996f3feb8','92b82fac-f224-4271-86ef-558200b4d817','auto','2020-06-17','2021-06-17',435,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('16f86256-0602-4ea8-a959-47c4bdb3029a','cd20652b-1939-4a3a-b6b9-e6c996f3feb8','Service','Bon service',2);


-- USER 62
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('4111618b-29fb-453e-8677-9e9f6f0e5443','user62@test.com',crypt('test123', gen_salt('bf')),'client','2024-04-28');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('4111618b-29fb-453e-8677-9e9f6f0e5443','Tiana','Andri','034000062','Antananarivo','2024-04-28');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e73cc95d-c6dd-46f8-985c-e54169c88dec','Q-62-0','4111618b-29fb-453e-8677-9e9f6f0e5443','auto',374,'2020-03-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('ab2b99e1-5556-4fbe-8162-26961588d913','POL-62-0','4111618b-29fb-453e-8677-9e9f6f0e5443','e73cc95d-c6dd-46f8-985c-e54169c88dec','auto','2020-03-09','2021-03-09',374,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('6681a89c-87c8-4906-a6a3-c901bb8646c5','Q-62-1','4111618b-29fb-453e-8677-9e9f6f0e5443','auto',498,'2023-07-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('b4195c1f-31fd-44eb-a8f1-9b8b851334a6','POL-62-1','4111618b-29fb-453e-8677-9e9f6f0e5443','6681a89c-87c8-4906-a6a3-c901bb8646c5','auto','2023-07-09','2024-07-09',498,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('271afdb1-ad40-4cb6-8262-95f5375dcc50','INC-62-1-0','b4195c1f-31fd-44eb-a8f1-9b8b851334a6','4111618b-29fb-453e-8677-9e9f6f0e5443','Accident','Collision mineure','2020-01-25','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('be511306-8219-4dee-9ee1-146057d06ca0','INC-62-1-1','b4195c1f-31fd-44eb-a8f1-9b8b851334a6','4111618b-29fb-453e-8677-9e9f6f0e5443','Accident','Collision mineure','2020-12-03','auto');


-- USER 63
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('e476edf5-1566-4255-9dc0-ba6cc8e9f2f5','user63@test.com',crypt('test123', gen_salt('bf')),'client','2024-07-10');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('e476edf5-1566-4255-9dc0-ba6cc8e9f2f5','Mickael','Andri','034000063','Antananarivo','2024-07-10');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('38e7c03f-525d-40d2-9b57-b9aca9b7dbe6','Q-63-0','e476edf5-1566-4255-9dc0-ba6cc8e9f2f5','auto',311,'2024-10-18');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('e388927c-ef3a-4788-9c69-15dd3b6f37a2','POL-63-0','e476edf5-1566-4255-9dc0-ba6cc8e9f2f5','38e7c03f-525d-40d2-9b57-b9aca9b7dbe6','auto','2024-10-18','2025-10-18',311,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('7102b9b1-faff-4f32-984a-c29fe9ff3d62','INC-63-0-0','e388927c-ef3a-4788-9c69-15dd3b6f37a2','e476edf5-1566-4255-9dc0-ba6cc8e9f2f5','Accident','Collision mineure','2020-10-27','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('604ba05c-2692-4225-ad29-d4fdc05a4594','INC-63-0-1','e388927c-ef3a-4788-9c69-15dd3b6f37a2','e476edf5-1566-4255-9dc0-ba6cc8e9f2f5','Accident','Collision mineure','2020-10-16','auto');


-- USER 64
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a4c81f7d-003c-4e5e-86e1-eab7d3f591a6','user64@test.com',crypt('test123', gen_salt('bf')),'client','2022-02-03');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('a4c81f7d-003c-4e5e-86e1-eab7d3f591a6','Hery','Rabe','034000064','Antananarivo','2022-02-03');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d69bff1a-e0db-4374-80c7-911b6092f8be','Q-64-0','a4c81f7d-003c-4e5e-86e1-eab7d3f591a6','auto',281,'2020-04-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('a95d191a-b6d9-480e-9370-b6ae41bd7956','POL-64-0','a4c81f7d-003c-4e5e-86e1-eab7d3f591a6','d69bff1a-e0db-4374-80c7-911b6092f8be','auto','2020-04-17','2021-04-17',281,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f3d78936-83dc-4ab6-93c1-efd11d895fbe','Q-64-1','a4c81f7d-003c-4e5e-86e1-eab7d3f591a6','auto',461,'2024-08-31');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('333ca489-948b-4f0a-bc7a-e378c48fb1e7','POL-64-1','a4c81f7d-003c-4e5e-86e1-eab7d3f591a6','f3d78936-83dc-4ab6-93c1-efd11d895fbe','auto','2024-08-31','2025-08-31',461,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('b00c38a7-29da-413a-abbf-c55b10618514','INC-64-1-0','333ca489-948b-4f0a-bc7a-e378c48fb1e7','a4c81f7d-003c-4e5e-86e1-eab7d3f591a6','Accident','Collision mineure','2023-08-21','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('b8af0f1c-e8f2-48a5-af03-42afcb0fc179','INC-64-1-1','333ca489-948b-4f0a-bc7a-e378c48fb1e7','a4c81f7d-003c-4e5e-86e1-eab7d3f591a6','Accident','Collision mineure','2021-02-19','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('0e439b9d-ffbc-4996-abd0-03ddd9fff537','a4c81f7d-003c-4e5e-86e1-eab7d3f591a6','Service','Bon service',5);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('6a4e5840-cda7-42fa-a383-9ad3915a9d9c','a4c81f7d-003c-4e5e-86e1-eab7d3f591a6','Service','Bon service',4);


-- USER 65
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('87bc8201-c3b5-44ab-aab8-43ad28884570','user65@test.com',crypt('test123', gen_salt('bf')),'client','2025-10-18');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('87bc8201-c3b5-44ab-aab8-43ad28884570','Aina','Randria','034000065','Antananarivo','2025-10-18');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c64913a4-9298-4dc7-b08f-02c076ecb93a','Q-65-0','87bc8201-c3b5-44ab-aab8-43ad28884570','auto',71,'2021-10-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('3a0f8ee4-7348-4f57-9fa1-4a3781e14ba7','POL-65-0','87bc8201-c3b5-44ab-aab8-43ad28884570','c64913a4-9298-4dc7-b08f-02c076ecb93a','auto','2021-10-21','2022-10-21',71,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('2eaa8f2e-747e-4045-9f25-87ee2f245c88','87bc8201-c3b5-44ab-aab8-43ad28884570','Service','Bon service',2);


-- USER 66
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('22ca2601-26fb-469d-9a94-e9601bee7533','user66@test.com',crypt('test123', gen_salt('bf')),'client','2023-04-28');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('22ca2601-26fb-469d-9a94-e9601bee7533','Hery','Rakotovao','034000066','Antananarivo','2023-04-28');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('db7578c6-a560-447a-b1fb-214eb1fe97fc','Q-66-0','22ca2601-26fb-469d-9a94-e9601bee7533','auto',336,'2024-09-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('ab2cd9d2-1042-4662-a8cd-5b1055d2f382','POL-66-0','22ca2601-26fb-469d-9a94-e9601bee7533','db7578c6-a560-447a-b1fb-214eb1fe97fc','auto','2024-09-11','2025-09-11',336,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('c5c59cdd-b450-4dce-8644-91979964a969','INC-66-0-0','ab2cd9d2-1042-4662-a8cd-5b1055d2f382','22ca2601-26fb-469d-9a94-e9601bee7533','Accident','Collision mineure','2022-07-09','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('de537c3c-09bb-48de-9d00-9e71eefe72cc','INC-66-0-1','ab2cd9d2-1042-4662-a8cd-5b1055d2f382','22ca2601-26fb-469d-9a94-e9601bee7533','Accident','Collision mineure','2023-10-14','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('ad80c055-75fb-4dce-92b7-24fb52621ae9','22ca2601-26fb-469d-9a94-e9601bee7533','Service','Bon service',5);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('54f24f0a-bbcf-481c-bbf3-b9294c6a21e1','22ca2601-26fb-469d-9a94-e9601bee7533','Service','Bon service',5);


-- USER 67
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('42895b0d-ded1-482d-87ad-b46daaa1fe5e','user67@test.com',crypt('test123', gen_salt('bf')),'client','2020-06-05');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('42895b0d-ded1-482d-87ad-b46daaa1fe5e','Aina','Andri','034000067','Antananarivo','2020-06-05');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7a64c0c9-a82c-4de5-85a1-1ebc1d39ecea','Q-67-0','42895b0d-ded1-482d-87ad-b46daaa1fe5e','auto',375,'2025-10-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('56c3ad2a-6922-4325-90b7-e469ee799694','POL-67-0','42895b0d-ded1-482d-87ad-b46daaa1fe5e','7a64c0c9-a82c-4de5-85a1-1ebc1d39ecea','auto','2025-10-14','2026-10-14',375,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('6f64f5f6-94d7-4143-a8d9-75a23ede420c','Q-67-1','42895b0d-ded1-482d-87ad-b46daaa1fe5e','auto',285,'2024-01-15');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('6ab450fa-1114-46b2-b855-fd4944d0ecbf','POL-67-1','42895b0d-ded1-482d-87ad-b46daaa1fe5e','6f64f5f6-94d7-4143-a8d9-75a23ede420c','auto','2024-01-15','2025-01-15',285,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('06bf4a31-e90f-4103-95ce-e59e6bb5bc71','42895b0d-ded1-482d-87ad-b46daaa1fe5e','Service','Bon service',5);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('a1bc25f4-d66a-40c2-8cf9-247a90feb1a3','42895b0d-ded1-482d-87ad-b46daaa1fe5e','Service','Bon service',4);


-- USER 68
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('4b988457-6231-4efd-917b-1fc42cca9ac5','user68@test.com',crypt('test123', gen_salt('bf')),'client','2024-07-05');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('4b988457-6231-4efd-917b-1fc42cca9ac5','Mickael','Rabe','034000068','Antananarivo','2024-07-05');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c8f96aac-c3bd-47da-8d59-de905524d318','Q-68-0','4b988457-6231-4efd-917b-1fc42cca9ac5','auto',242,'2022-01-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('f5cddeff-fe2c-4fbc-92b7-68e56606c79d','POL-68-0','4b988457-6231-4efd-917b-1fc42cca9ac5','c8f96aac-c3bd-47da-8d59-de905524d318','auto','2022-01-21','2023-01-21',242,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('fdd52876-2959-4ff4-9f80-1cc8ec13944b','INC-68-0-0','f5cddeff-fe2c-4fbc-92b7-68e56606c79d','4b988457-6231-4efd-917b-1fc42cca9ac5','Accident','Collision mineure','2024-07-28','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('e80acb45-3027-4ba0-aaa5-f5e6bf8c0fae','INC-68-0-1','f5cddeff-fe2c-4fbc-92b7-68e56606c79d','4b988457-6231-4efd-917b-1fc42cca9ac5','Accident','Collision mineure','2023-11-05','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('dd134add-0e2f-4776-bdc5-bd2c6f95d840','Q-68-1','4b988457-6231-4efd-917b-1fc42cca9ac5','auto',208,'2022-01-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('3dab5520-ef58-447a-ac3d-d9f11dac5e6f','POL-68-1','4b988457-6231-4efd-917b-1fc42cca9ac5','dd134add-0e2f-4776-bdc5-bd2c6f95d840','auto','2022-01-27','2023-01-27',208,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('03871aa8-b47d-4215-9587-47e174e23139','INC-68-1-0','3dab5520-ef58-447a-ac3d-d9f11dac5e6f','4b988457-6231-4efd-917b-1fc42cca9ac5','Accident','Collision mineure','2025-10-27','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('1bcd48d2-fba0-42ff-b16e-65b70642ae26','4b988457-6231-4efd-917b-1fc42cca9ac5','Service','Bon service',3);


-- USER 69
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('30cfe98d-d222-4d64-9252-c55e4e642b5a','user69@test.com',crypt('test123', gen_salt('bf')),'client','2021-12-19');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('30cfe98d-d222-4d64-9252-c55e4e642b5a','Aina','Razaf','034000069','Antananarivo','2021-12-19');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b8ff894f-ec50-441e-94f7-8c27d11d81f5','Q-69-0','30cfe98d-d222-4d64-9252-c55e4e642b5a','auto',215,'2024-07-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('1a4e6cb1-b52a-49ca-854b-a4e1c2d2820b','POL-69-0','30cfe98d-d222-4d64-9252-c55e4e642b5a','b8ff894f-ec50-441e-94f7-8c27d11d81f5','auto','2024-07-10','2025-07-10',215,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('5badcaa9-1cd7-4c6c-97b8-a2550d51d0e2','30cfe98d-d222-4d64-9252-c55e4e642b5a','Service','Bon service',5);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('e86a6fe3-2540-4af9-b570-0e43108dec22','30cfe98d-d222-4d64-9252-c55e4e642b5a','Service','Bon service',2);


-- USER 70
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('9796f0f2-8877-4c5c-a764-5a2fca87dc42','user70@test.com',crypt('test123', gen_salt('bf')),'client','2025-03-26');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('9796f0f2-8877-4c5c-a764-5a2fca87dc42','Tiana','Razaf','034000070','Antananarivo','2025-03-26');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d4256662-6cc7-4f08-91f4-53736c00f85b','Q-70-0','9796f0f2-8877-4c5c-a764-5a2fca87dc42','auto',151,'2023-01-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('93a4010d-ecdc-4f9b-ad25-c83b7189ceb6','POL-70-0','9796f0f2-8877-4c5c-a764-5a2fca87dc42','d4256662-6cc7-4f08-91f4-53736c00f85b','auto','2023-01-12','2024-01-12',151,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('06f166c8-e1de-47ad-bfa8-8fce79edf080','Q-70-1','9796f0f2-8877-4c5c-a764-5a2fca87dc42','auto',311,'2020-03-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('77d017aa-4fa3-46af-8bb6-8bd30bf31a70','POL-70-1','9796f0f2-8877-4c5c-a764-5a2fca87dc42','06f166c8-e1de-47ad-bfa8-8fce79edf080','auto','2020-03-11','2021-03-11',311,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('423aa461-2a04-49b8-ab3a-d4808a4844c0','INC-70-1-0','77d017aa-4fa3-46af-8bb6-8bd30bf31a70','9796f0f2-8877-4c5c-a764-5a2fca87dc42','Accident','Collision mineure','2020-02-02','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('7520b915-ff1d-490b-a876-8f20e17d1357','9796f0f2-8877-4c5c-a764-5a2fca87dc42','Service','Bon service',3);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('8fba5731-8f73-41c2-ae61-1239bd54cf81','9796f0f2-8877-4c5c-a764-5a2fca87dc42','Service','Bon service',4);


-- USER 71
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('e1693086-c212-4b7a-bc97-ba1302db9cf7','user71@test.com',crypt('test123', gen_salt('bf')),'client','2025-04-09');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('e1693086-c212-4b7a-bc97-ba1302db9cf7','Lucas','Rasoa','034000071','Antananarivo','2025-04-09');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7890a9d2-efbb-4ebf-b4a7-8ee16620e60e','Q-71-0','e1693086-c212-4b7a-bc97-ba1302db9cf7','auto',341,'2020-02-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('24ac60d5-1e52-45b2-8c47-c012742528f3','POL-71-0','e1693086-c212-4b7a-bc97-ba1302db9cf7','7890a9d2-efbb-4ebf-b4a7-8ee16620e60e','auto','2020-02-08','2021-02-08',341,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('c12c1bfa-9e05-4b2e-831c-a4d42a21038f','INC-71-0-0','24ac60d5-1e52-45b2-8c47-c012742528f3','e1693086-c212-4b7a-bc97-ba1302db9cf7','Accident','Collision mineure','2025-08-03','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('06f1d301-900b-4be4-b1b4-78f0da806185','Q-71-1','e1693086-c212-4b7a-bc97-ba1302db9cf7','auto',460,'2023-01-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('e18554db-3ee0-47b6-b9b6-fcb95f555331','POL-71-1','e1693086-c212-4b7a-bc97-ba1302db9cf7','06f1d301-900b-4be4-b1b4-78f0da806185','auto','2023-01-24','2024-01-24',460,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('a9b1a483-63aa-44c8-a33a-e2026c52ea41','INC-71-1-0','e18554db-3ee0-47b6-b9b6-fcb95f555331','e1693086-c212-4b7a-bc97-ba1302db9cf7','Accident','Collision mineure','2025-03-10','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('4f80c7d1-bb85-432e-a8ed-aab66837da71','Q-71-2','e1693086-c212-4b7a-bc97-ba1302db9cf7','auto',251,'2025-12-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('f6d52e41-6e6d-4096-9e31-81bcb72412bd','POL-71-2','e1693086-c212-4b7a-bc97-ba1302db9cf7','4f80c7d1-bb85-432e-a8ed-aab66837da71','auto','2025-12-22','2026-12-22',251,10,'full');


-- USER 72
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('d3ca88f7-d57b-489f-a5b6-1e1c24227fdf','user72@test.com',crypt('test123', gen_salt('bf')),'client','2022-10-20');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('d3ca88f7-d57b-489f-a5b6-1e1c24227fdf','Sofia','Razaf','034000072','Antananarivo','2022-10-20');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('4a764aa7-54b7-401b-9e37-c9bff27fa31a','Q-72-0','d3ca88f7-d57b-489f-a5b6-1e1c24227fdf','auto',125,'2024-04-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('4bfe5461-8406-418f-96ba-645ac71a1e60','POL-72-0','d3ca88f7-d57b-489f-a5b6-1e1c24227fdf','4a764aa7-54b7-401b-9e37-c9bff27fa31a','auto','2024-04-24','2025-04-24',125,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('77fa78b3-25d9-4ffb-ab33-71614de20a1b','INC-72-0-0','4bfe5461-8406-418f-96ba-645ac71a1e60','d3ca88f7-d57b-489f-a5b6-1e1c24227fdf','Accident','Collision mineure','2023-03-21','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('024733b3-e819-4783-b353-f92e88f97f90','INC-72-0-1','4bfe5461-8406-418f-96ba-645ac71a1e60','d3ca88f7-d57b-489f-a5b6-1e1c24227fdf','Accident','Collision mineure','2024-04-25','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('80e2e49a-e7f9-4c85-9484-852cddb94ad2','Q-72-1','d3ca88f7-d57b-489f-a5b6-1e1c24227fdf','auto',407,'2023-05-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('377e67ae-f9ca-448a-83f9-b7324cd7ec70','POL-72-1','d3ca88f7-d57b-489f-a5b6-1e1c24227fdf','80e2e49a-e7f9-4c85-9484-852cddb94ad2','auto','2023-05-10','2024-05-10',407,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('684a9975-3c10-4b9e-a67e-f95a82d23778','INC-72-1-0','377e67ae-f9ca-448a-83f9-b7324cd7ec70','d3ca88f7-d57b-489f-a5b6-1e1c24227fdf','Accident','Collision mineure','2022-08-08','auto');


-- USER 73
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('271c216d-5d38-48ca-8db8-a1cd9199bd0e','user73@test.com',crypt('test123', gen_salt('bf')),'client','2022-04-01');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('271c216d-5d38-48ca-8db8-a1cd9199bd0e','Lucas','Rakoto','034000073','Antananarivo','2022-04-01');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('21158f0a-9fef-4126-ab55-544b9bf02776','Q-73-0','271c216d-5d38-48ca-8db8-a1cd9199bd0e','auto',431,'2024-01-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('f0d3af08-3816-423a-9179-d3bf64db6f80','POL-73-0','271c216d-5d38-48ca-8db8-a1cd9199bd0e','21158f0a-9fef-4126-ab55-544b9bf02776','auto','2024-01-10','2025-01-10',431,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('8ea92891-84b1-4477-a9e4-f02700967a5e','INC-73-0-0','f0d3af08-3816-423a-9179-d3bf64db6f80','271c216d-5d38-48ca-8db8-a1cd9199bd0e','Accident','Collision mineure','2023-08-16','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b73c8f11-b12d-48ff-8d19-68040baad529','Q-73-1','271c216d-5d38-48ca-8db8-a1cd9199bd0e','auto',327,'2020-03-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('eea690ea-ad59-4a82-bbdb-138efe95fb1c','POL-73-1','271c216d-5d38-48ca-8db8-a1cd9199bd0e','b73c8f11-b12d-48ff-8d19-68040baad529','auto','2020-03-07','2021-03-07',327,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8dcae83d-cb94-4770-abed-428691d102f5','Q-73-2','271c216d-5d38-48ca-8db8-a1cd9199bd0e','auto',368,'2021-10-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('2e9781c3-8195-4ee0-a033-99e3a11dd7f9','POL-73-2','271c216d-5d38-48ca-8db8-a1cd9199bd0e','8dcae83d-cb94-4770-abed-428691d102f5','auto','2021-10-22','2022-10-22',368,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('5f6ccfaf-10b9-4784-bf54-a30e8226609c','INC-73-2-0','2e9781c3-8195-4ee0-a033-99e3a11dd7f9','271c216d-5d38-48ca-8db8-a1cd9199bd0e','Accident','Collision mineure','2020-06-11','auto');


-- USER 74
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('e1140cee-b80b-475b-b1a0-c71637ba3535','user74@test.com',crypt('test123', gen_salt('bf')),'client','2020-03-01');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('e1140cee-b80b-475b-b1a0-c71637ba3535','Sofia','Rasoa','034000074','Antananarivo','2020-03-01');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('49b3d87a-5016-4aa7-8dff-0d07eb8cca12','Q-74-0','e1140cee-b80b-475b-b1a0-c71637ba3535','auto',191,'2024-05-29');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('ef19e640-e41d-43ee-94f3-1a933d8880dc','POL-74-0','e1140cee-b80b-475b-b1a0-c71637ba3535','49b3d87a-5016-4aa7-8dff-0d07eb8cca12','auto','2024-05-29','2025-05-29',191,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('56301fe6-ce70-4900-9519-5b6c9d1620c8','INC-74-0-0','ef19e640-e41d-43ee-94f3-1a933d8880dc','e1140cee-b80b-475b-b1a0-c71637ba3535','Accident','Collision mineure','2020-10-30','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('89c714d9-5270-4e62-a032-3592e02fbdfe','e1140cee-b80b-475b-b1a0-c71637ba3535','Service','Bon service',3);


-- USER 75
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('5e798b6e-f061-4491-9187-58fdb4a00f29','user75@test.com',crypt('test123', gen_salt('bf')),'client','2021-04-28');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('5e798b6e-f061-4491-9187-58fdb4a00f29','Jean','Andri','034000075','Antananarivo','2021-04-28');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('fea6d74d-5260-4bb3-9e0b-c99fbc658c65','Q-75-0','5e798b6e-f061-4491-9187-58fdb4a00f29','auto',372,'2023-03-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('aa668a08-a43d-4049-9db3-ce6abe3b9bd1','POL-75-0','5e798b6e-f061-4491-9187-58fdb4a00f29','fea6d74d-5260-4bb3-9e0b-c99fbc658c65','auto','2023-03-04','2024-03-04',372,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('60a51943-9c92-428c-beb5-1ea0c9691045','Q-75-1','5e798b6e-f061-4491-9187-58fdb4a00f29','auto',246,'2020-03-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('17db4d02-c61b-4248-ad4b-0347b0d62a5e','POL-75-1','5e798b6e-f061-4491-9187-58fdb4a00f29','60a51943-9c92-428c-beb5-1ea0c9691045','auto','2020-03-13','2021-03-13',246,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('41370662-58c2-46b1-a303-ce320df0a6e1','Q-75-2','5e798b6e-f061-4491-9187-58fdb4a00f29','auto',421,'2020-07-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('1cffb74f-c02d-4bf2-81f6-9b0a262671da','POL-75-2','5e798b6e-f061-4491-9187-58fdb4a00f29','41370662-58c2-46b1-a303-ce320df0a6e1','auto','2020-07-13','2021-07-13',421,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('1e07a7c4-18b4-4971-ab44-8ae3f11162ae','5e798b6e-f061-4491-9187-58fdb4a00f29','Service','Bon service',4);


-- USER 76
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('491dcaf9-d55c-488a-8cf5-3c5068f854e1','user76@test.com',crypt('test123', gen_salt('bf')),'client','2022-05-12');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('491dcaf9-d55c-488a-8cf5-3c5068f854e1','Aina','Rakoto','034000076','Antananarivo','2022-05-12');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('98d80aab-8d4f-40ac-ad6a-cd930ec85cac','Q-76-0','491dcaf9-d55c-488a-8cf5-3c5068f854e1','auto',141,'2024-02-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('9dd46513-aff1-4235-ac67-b53e014da66b','POL-76-0','491dcaf9-d55c-488a-8cf5-3c5068f854e1','98d80aab-8d4f-40ac-ad6a-cd930ec85cac','auto','2024-02-13','2025-02-13',141,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('513468de-766b-4379-9f7c-6cc701f95a33','INC-76-0-0','9dd46513-aff1-4235-ac67-b53e014da66b','491dcaf9-d55c-488a-8cf5-3c5068f854e1','Accident','Collision mineure','2026-01-05','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('191c5e28-c944-4e06-87b5-a7d075957ed5','Q-76-1','491dcaf9-d55c-488a-8cf5-3c5068f854e1','auto',116,'2023-03-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('8187b486-99a6-44f8-87d0-b66d2a613fc1','POL-76-1','491dcaf9-d55c-488a-8cf5-3c5068f854e1','191c5e28-c944-4e06-87b5-a7d075957ed5','auto','2023-03-27','2024-03-27',116,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('0ca6e831-002e-45f4-b196-755df2bc1718','INC-76-1-0','8187b486-99a6-44f8-87d0-b66d2a613fc1','491dcaf9-d55c-488a-8cf5-3c5068f854e1','Accident','Collision mineure','2023-06-20','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('485b2cf2-1f22-4c29-bc89-b8def4a35a7a','491dcaf9-d55c-488a-8cf5-3c5068f854e1','Service','Bon service',3);


-- USER 77
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('9427fc06-fd6e-4262-99a2-21c341c7d8b7','user77@test.com',crypt('test123', gen_salt('bf')),'client','2020-09-29');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('9427fc06-fd6e-4262-99a2-21c341c7d8b7','Mickael','Razaf','034000077','Antananarivo','2020-09-29');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f23a3311-a9d2-4196-b161-9629a8dabbfe','Q-77-0','9427fc06-fd6e-4262-99a2-21c341c7d8b7','auto',59,'2024-08-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('9c81fdf5-a373-4f5e-a077-63b09c34344a','POL-77-0','9427fc06-fd6e-4262-99a2-21c341c7d8b7','f23a3311-a9d2-4196-b161-9629a8dabbfe','auto','2024-08-06','2025-08-06',59,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('a598be7b-31d2-4e7d-b502-8c94031c989d','INC-77-0-0','9c81fdf5-a373-4f5e-a077-63b09c34344a','9427fc06-fd6e-4262-99a2-21c341c7d8b7','Accident','Collision mineure','2022-06-06','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('07a8cee4-b695-472c-a24b-0240c0ad4477','9427fc06-fd6e-4262-99a2-21c341c7d8b7','Service','Bon service',5);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('34d00cfc-e8b7-4c6e-92ae-611a249ae171','9427fc06-fd6e-4262-99a2-21c341c7d8b7','Service','Bon service',4);


-- USER 78
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('cc18bcbc-012d-4e1c-bdea-298ca5c5fa8f','user78@test.com',crypt('test123', gen_salt('bf')),'client','2023-01-30');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('cc18bcbc-012d-4e1c-bdea-298ca5c5fa8f','Jean','Razaf','034000078','Antananarivo','2023-01-30');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2085fc78-ab65-4661-8277-41cda59526ee','Q-78-0','cc18bcbc-012d-4e1c-bdea-298ca5c5fa8f','auto',486,'2021-09-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('ecdb6896-2b77-4ec8-b214-621d1e2a502a','POL-78-0','cc18bcbc-012d-4e1c-bdea-298ca5c5fa8f','2085fc78-ab65-4661-8277-41cda59526ee','auto','2021-09-09','2022-09-09',486,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('44146e6e-4a97-45a3-96ca-58f7e08c78a1','INC-78-0-0','ecdb6896-2b77-4ec8-b214-621d1e2a502a','cc18bcbc-012d-4e1c-bdea-298ca5c5fa8f','Accident','Collision mineure','2026-04-24','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ae9fabb3-b8f8-4df1-9576-702869886ad3','Q-78-1','cc18bcbc-012d-4e1c-bdea-298ca5c5fa8f','auto',271,'2020-08-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('c5eb6a3c-e9f5-4cc6-82ba-29b5345837d4','POL-78-1','cc18bcbc-012d-4e1c-bdea-298ca5c5fa8f','ae9fabb3-b8f8-4df1-9576-702869886ad3','auto','2020-08-07','2021-08-07',271,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('10419bce-e91b-4ddf-90de-1d99c2df82fd','INC-78-1-0','c5eb6a3c-e9f5-4cc6-82ba-29b5345837d4','cc18bcbc-012d-4e1c-bdea-298ca5c5fa8f','Accident','Collision mineure','2023-04-21','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('3cc6d585-8646-48d5-a267-38f9613b1933','cc18bcbc-012d-4e1c-bdea-298ca5c5fa8f','Service','Bon service',4);


-- USER 79
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('3358caf3-b635-492e-ad06-6e924391d319','user79@test.com',crypt('test123', gen_salt('bf')),'client','2023-07-13');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('3358caf3-b635-492e-ad06-6e924391d319','Jean','Randria','034000079','Antananarivo','2023-07-13');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1b5bada2-3e5f-4aed-bda7-bc0c69a008fa','Q-79-0','3358caf3-b635-492e-ad06-6e924391d319','auto',71,'2020-06-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('ff4fd155-5b07-49e0-8022-7579dc3f60d9','POL-79-0','3358caf3-b635-492e-ad06-6e924391d319','1b5bada2-3e5f-4aed-bda7-bc0c69a008fa','auto','2020-06-07','2021-06-07',71,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('5dac5df6-bed3-4404-ba4f-ffa8e22a153a','INC-79-0-0','ff4fd155-5b07-49e0-8022-7579dc3f60d9','3358caf3-b635-492e-ad06-6e924391d319','Accident','Collision mineure','2023-01-03','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('0c9656b8-188b-4dcd-87d8-063dc12ed381','3358caf3-b635-492e-ad06-6e924391d319','Service','Bon service',5);


-- USER 80
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('b28e0c59-6eb4-43fb-98b1-7933720fc782','user80@test.com',crypt('test123', gen_salt('bf')),'client','2022-06-15');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('b28e0c59-6eb4-43fb-98b1-7933720fc782','Aina','Randria','034000080','Antananarivo','2022-06-15');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b07f3f70-3cdd-4142-81bb-e194631f5df6','Q-80-0','b28e0c59-6eb4-43fb-98b1-7933720fc782','auto',331,'2024-12-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('858281fa-cfbb-4862-a717-bf449e4a5da6','POL-80-0','b28e0c59-6eb4-43fb-98b1-7933720fc782','b07f3f70-3cdd-4142-81bb-e194631f5df6','auto','2024-12-30','2025-12-30',331,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('83cadcd4-86d4-42db-8955-dec840dac4e5','INC-80-0-0','858281fa-cfbb-4862-a717-bf449e4a5da6','b28e0c59-6eb4-43fb-98b1-7933720fc782','Accident','Collision mineure','2024-02-21','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('b2cf533e-e3d7-42b7-af39-344924629ca7','INC-80-0-1','858281fa-cfbb-4862-a717-bf449e4a5da6','b28e0c59-6eb4-43fb-98b1-7933720fc782','Accident','Collision mineure','2023-12-31','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1e115760-eb98-4c6d-96be-cd33fb25f9b1','Q-80-1','b28e0c59-6eb4-43fb-98b1-7933720fc782','auto',459,'2022-04-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('4d28d9e0-7ff4-4d5d-ad1a-fa9c0e7c6238','POL-80-1','b28e0c59-6eb4-43fb-98b1-7933720fc782','1e115760-eb98-4c6d-96be-cd33fb25f9b1','auto','2022-04-03','2023-04-03',459,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('afc4e4a5-2d16-4eb4-8ab4-41b32ebecbca','INC-80-1-0','4d28d9e0-7ff4-4d5d-ad1a-fa9c0e7c6238','b28e0c59-6eb4-43fb-98b1-7933720fc782','Accident','Collision mineure','2026-04-23','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('dcb55a83-6b16-4f3f-adda-636133a57258','b28e0c59-6eb4-43fb-98b1-7933720fc782','Service','Bon service',2);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('d136b6da-0beb-4771-973d-324c72d0071e','b28e0c59-6eb4-43fb-98b1-7933720fc782','Service','Bon service',4);


-- USER 81
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('bf609a04-1a08-49d7-bb32-21da721054df','user81@test.com',crypt('test123', gen_salt('bf')),'client','2026-03-17');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('bf609a04-1a08-49d7-bb32-21da721054df','Lucas','Razaf','034000081','Antananarivo','2026-03-17');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('918d1c38-420f-48c0-b97e-67b9b6693874','Q-81-0','bf609a04-1a08-49d7-bb32-21da721054df','auto',154,'2026-02-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('a9815828-b37f-4117-b7ad-883a205f776b','POL-81-0','bf609a04-1a08-49d7-bb32-21da721054df','918d1c38-420f-48c0-b97e-67b9b6693874','auto','2026-02-17','2027-02-17',154,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('47f83915-bd68-4c1f-8f0c-5e4e58f37b25','INC-81-0-0','a9815828-b37f-4117-b7ad-883a205f776b','bf609a04-1a08-49d7-bb32-21da721054df','Accident','Collision mineure','2023-08-24','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('e995fae2-3008-4009-b2c5-177f7fe8b799','INC-81-0-1','a9815828-b37f-4117-b7ad-883a205f776b','bf609a04-1a08-49d7-bb32-21da721054df','Accident','Collision mineure','2020-07-23','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('fd46d741-1f01-431a-8861-0e78dfc3b9ff','Q-81-1','bf609a04-1a08-49d7-bb32-21da721054df','auto',67,'2020-03-31');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('62361eb7-1189-4007-9427-9e2471d3c0c9','POL-81-1','bf609a04-1a08-49d7-bb32-21da721054df','fd46d741-1f01-431a-8861-0e78dfc3b9ff','auto','2020-03-31','2021-03-31',67,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('75e8e638-10a0-4147-8755-b102562818b8','INC-81-1-0','62361eb7-1189-4007-9427-9e2471d3c0c9','bf609a04-1a08-49d7-bb32-21da721054df','Accident','Collision mineure','2025-07-10','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('603cf660-0f2a-49aa-b8be-e101f9458f9b','INC-81-1-1','62361eb7-1189-4007-9427-9e2471d3c0c9','bf609a04-1a08-49d7-bb32-21da721054df','Accident','Collision mineure','2023-06-03','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('42f6ce53-ba07-4df5-817c-1d9506c0da20','bf609a04-1a08-49d7-bb32-21da721054df','Service','Bon service',3);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('f92faf7d-9f09-42ba-9e85-c35804503d9a','bf609a04-1a08-49d7-bb32-21da721054df','Service','Bon service',3);


-- USER 82
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('292d96f2-1c1b-4f92-a692-8cccb18fc8bd','user82@test.com',crypt('test123', gen_salt('bf')),'client','2023-10-24');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('292d96f2-1c1b-4f92-a692-8cccb18fc8bd','Lucas','Rasoa','034000082','Antananarivo','2023-10-24');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7d97a69a-07d6-48d3-8ac4-cbc6ef3df496','Q-82-0','292d96f2-1c1b-4f92-a692-8cccb18fc8bd','auto',486,'2020-09-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('07deac98-1143-442a-990c-9c1540dd6242','POL-82-0','292d96f2-1c1b-4f92-a692-8cccb18fc8bd','7d97a69a-07d6-48d3-8ac4-cbc6ef3df496','auto','2020-09-06','2021-09-06',486,10,'full');


-- USER 83
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('01dfcce2-7169-43d9-95f7-ea056759ddba','user83@test.com',crypt('test123', gen_salt('bf')),'client','2022-04-24');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('01dfcce2-7169-43d9-95f7-ea056759ddba','Hery','Rasoa','034000083','Antananarivo','2022-04-24');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('95ae97af-c8d8-4b65-96ab-b74c843d7cdb','Q-83-0','01dfcce2-7169-43d9-95f7-ea056759ddba','auto',195,'2021-03-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('a17d4fa1-af67-44f1-ab7b-55b025ae33e8','POL-83-0','01dfcce2-7169-43d9-95f7-ea056759ddba','95ae97af-c8d8-4b65-96ab-b74c843d7cdb','auto','2021-03-27','2022-03-27',195,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('505f15ac-05cb-47eb-bbe0-6acfad870ae2','INC-83-0-0','a17d4fa1-af67-44f1-ab7b-55b025ae33e8','01dfcce2-7169-43d9-95f7-ea056759ddba','Accident','Collision mineure','2023-06-28','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('db7bc147-488f-429a-8ca3-cf9fa2d642de','01dfcce2-7169-43d9-95f7-ea056759ddba','Service','Bon service',3);


-- USER 84
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('5c373340-0c56-4f30-8af2-c850073184e7','user84@test.com',crypt('test123', gen_salt('bf')),'client','2025-12-29');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('5c373340-0c56-4f30-8af2-c850073184e7','Lucas','Rasoa','034000084','Antananarivo','2025-12-29');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('05752a5c-d067-470d-969a-49600b9848dd','Q-84-0','5c373340-0c56-4f30-8af2-c850073184e7','auto',451,'2020-07-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('63544387-48cb-4a5c-bc0b-6631cbe96d26','POL-84-0','5c373340-0c56-4f30-8af2-c850073184e7','05752a5c-d067-470d-969a-49600b9848dd','auto','2020-07-22','2021-07-22',451,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('86f2c8f1-7c99-45bc-9e9a-9c718389a4e4','5c373340-0c56-4f30-8af2-c850073184e7','Service','Bon service',5);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('bc4d6386-0737-4771-ac11-314e90eb5e1d','5c373340-0c56-4f30-8af2-c850073184e7','Service','Bon service',2);


-- USER 85
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('1d23eda2-8ff9-4b60-a3ff-7b687b4e6509','user85@test.com',crypt('test123', gen_salt('bf')),'client','2021-11-02');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('1d23eda2-8ff9-4b60-a3ff-7b687b4e6509','Sofia','Razaf','034000085','Antananarivo','2021-11-02');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2771ad7c-ca2e-48db-bc38-47bdc43d3be2','Q-85-0','1d23eda2-8ff9-4b60-a3ff-7b687b4e6509','auto',475,'2022-04-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('edc33cff-16b9-4262-b4ba-7d64c572ec77','POL-85-0','1d23eda2-8ff9-4b60-a3ff-7b687b4e6509','2771ad7c-ca2e-48db-bc38-47bdc43d3be2','auto','2022-04-27','2023-04-27',475,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('f1e7bdda-a35c-49d1-8663-41a435ed87c8','INC-85-0-0','edc33cff-16b9-4262-b4ba-7d64c572ec77','1d23eda2-8ff9-4b60-a3ff-7b687b4e6509','Accident','Collision mineure','2022-03-07','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('76eaf5a2-f00b-45c4-97eb-c1f467163155','1d23eda2-8ff9-4b60-a3ff-7b687b4e6509','Service','Bon service',5);


-- USER 86
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('4c784aaa-af72-4497-8b83-7171420458e9','user86@test.com',crypt('test123', gen_salt('bf')),'client','2025-07-10');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('4c784aaa-af72-4497-8b83-7171420458e9','Jean','Randria','034000086','Antananarivo','2025-07-10');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ed3c4329-1946-4d03-98c2-7001635f6450','Q-86-0','4c784aaa-af72-4497-8b83-7171420458e9','auto',460,'2023-05-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('58b76ca0-9867-4f37-9b7e-7c325ad2ae41','POL-86-0','4c784aaa-af72-4497-8b83-7171420458e9','ed3c4329-1946-4d03-98c2-7001635f6450','auto','2023-05-16','2024-05-16',460,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('58a66063-61b6-4b9d-90b3-b91227266e69','INC-86-0-0','58b76ca0-9867-4f37-9b7e-7c325ad2ae41','4c784aaa-af72-4497-8b83-7171420458e9','Accident','Collision mineure','2024-02-21','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2a5a02f0-4bda-49b3-b960-4a8eddde7f60','Q-86-1','4c784aaa-af72-4497-8b83-7171420458e9','auto',365,'2020-04-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('336b4d41-b13e-47cf-8dc2-f033a5b74cdf','POL-86-1','4c784aaa-af72-4497-8b83-7171420458e9','2a5a02f0-4bda-49b3-b960-4a8eddde7f60','auto','2020-04-07','2021-04-07',365,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('3ffa37ee-042f-4a77-9ed3-af37e32d22c0','INC-86-1-0','336b4d41-b13e-47cf-8dc2-f033a5b74cdf','4c784aaa-af72-4497-8b83-7171420458e9','Accident','Collision mineure','2022-09-17','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('22216a0c-22b1-4a47-9ace-93d3817623b4','INC-86-1-1','336b4d41-b13e-47cf-8dc2-f033a5b74cdf','4c784aaa-af72-4497-8b83-7171420458e9','Accident','Collision mineure','2022-07-11','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('8cf396d6-7c7e-453d-922e-b2155225e8aa','4c784aaa-af72-4497-8b83-7171420458e9','Service','Bon service',2);


-- USER 87
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('7a97a1a9-2070-4c44-9570-be5e1c8e65bd','user87@test.com',crypt('test123', gen_salt('bf')),'client','2025-05-07');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('7a97a1a9-2070-4c44-9570-be5e1c8e65bd','Lucas','Raharison','034000087','Antananarivo','2025-05-07');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7d4bfffb-5fa8-41bb-97fc-a5c1e2ff2705','Q-87-0','7a97a1a9-2070-4c44-9570-be5e1c8e65bd','auto',341,'2021-02-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('89efaeb8-b7b1-4862-a5b6-4166fb36415e','POL-87-0','7a97a1a9-2070-4c44-9570-be5e1c8e65bd','7d4bfffb-5fa8-41bb-97fc-a5c1e2ff2705','auto','2021-02-05','2022-02-05',341,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('961ceab0-deba-4c57-b91a-e4e54f8f4c13','7a97a1a9-2070-4c44-9570-be5e1c8e65bd','Service','Bon service',5);


-- USER 88
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('b5be1b95-8708-4427-83f4-08a2d2497853','user88@test.com',crypt('test123', gen_salt('bf')),'client','2021-12-29');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('b5be1b95-8708-4427-83f4-08a2d2497853','Sofia','Raharison','034000088','Antananarivo','2021-12-29');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('eea7d4cf-c707-4b68-9969-5619c52a7c68','Q-88-0','b5be1b95-8708-4427-83f4-08a2d2497853','auto',258,'2026-04-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('faef8e45-c6a3-49e6-a854-a3ab78a4f7eb','POL-88-0','b5be1b95-8708-4427-83f4-08a2d2497853','eea7d4cf-c707-4b68-9969-5619c52a7c68','auto','2026-04-09','2027-04-09',258,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('87f1a949-6e3f-475e-8a08-8ab161f24f8b','INC-88-0-0','faef8e45-c6a3-49e6-a854-a3ab78a4f7eb','b5be1b95-8708-4427-83f4-08a2d2497853','Accident','Collision mineure','2024-11-01','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('5f3d6297-0323-48bc-812f-d392222f22aa','Q-88-1','b5be1b95-8708-4427-83f4-08a2d2497853','auto',312,'2021-11-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('23e9c3a0-d21e-4ce2-ae95-f09ed304c90a','POL-88-1','b5be1b95-8708-4427-83f4-08a2d2497853','5f3d6297-0323-48bc-812f-d392222f22aa','auto','2021-11-20','2022-11-20',312,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('d2325ddf-5c62-4614-a5a2-6e48eb99d7b1','INC-88-1-0','23e9c3a0-d21e-4ce2-ae95-f09ed304c90a','b5be1b95-8708-4427-83f4-08a2d2497853','Accident','Collision mineure','2022-10-12','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8cba4429-9898-4f39-8e9d-5245f96dfba2','Q-88-2','b5be1b95-8708-4427-83f4-08a2d2497853','auto',270,'2024-04-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('f710960d-f0c1-41ae-bbc9-7de90cdf42bd','POL-88-2','b5be1b95-8708-4427-83f4-08a2d2497853','8cba4429-9898-4f39-8e9d-5245f96dfba2','auto','2024-04-27','2025-04-27',270,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('2fd492b4-060f-470d-8739-c475e0f66722','INC-88-2-0','f710960d-f0c1-41ae-bbc9-7de90cdf42bd','b5be1b95-8708-4427-83f4-08a2d2497853','Accident','Collision mineure','2022-08-25','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('14c76e55-153b-44d0-9038-e1efa0684e2a','b5be1b95-8708-4427-83f4-08a2d2497853','Service','Bon service',4);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('9f4be15b-55ab-4f98-981a-9f64eb5b0ae2','b5be1b95-8708-4427-83f4-08a2d2497853','Service','Bon service',5);


-- USER 89
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('d7127121-74a3-46a8-8cf8-45aa095b49ff','user89@test.com',crypt('test123', gen_salt('bf')),'client','2024-10-12');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('d7127121-74a3-46a8-8cf8-45aa095b49ff','Aina','Rakotovao','034000089','Antananarivo','2024-10-12');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('073fc96e-f655-4d65-b5d6-bb459b499c46','Q-89-0','d7127121-74a3-46a8-8cf8-45aa095b49ff','auto',176,'2024-03-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('82b87b5f-eca5-495b-bedd-c2fc4d86b00a','POL-89-0','d7127121-74a3-46a8-8cf8-45aa095b49ff','073fc96e-f655-4d65-b5d6-bb459b499c46','auto','2024-03-11','2025-03-11',176,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('a462e817-d1ca-4133-9ed4-04aab43216c6','INC-89-0-0','82b87b5f-eca5-495b-bedd-c2fc4d86b00a','d7127121-74a3-46a8-8cf8-45aa095b49ff','Accident','Collision mineure','2021-03-08','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('40719bc0-38e1-4148-9370-fc8a697a21e4','Q-89-1','d7127121-74a3-46a8-8cf8-45aa095b49ff','auto',88,'2024-03-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('fb4b70cc-725c-4783-af66-89ef791d4a01','POL-89-1','d7127121-74a3-46a8-8cf8-45aa095b49ff','40719bc0-38e1-4148-9370-fc8a697a21e4','auto','2024-03-30','2025-03-30',88,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('e641b6aa-8e26-4e31-91ec-e14abdf4c4b1','INC-89-1-0','fb4b70cc-725c-4783-af66-89ef791d4a01','d7127121-74a3-46a8-8cf8-45aa095b49ff','Accident','Collision mineure','2020-04-29','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('f15a3b91-cf4b-4665-b526-0d7e21051308','INC-89-1-1','fb4b70cc-725c-4783-af66-89ef791d4a01','d7127121-74a3-46a8-8cf8-45aa095b49ff','Accident','Collision mineure','2023-08-01','auto');


-- USER 90
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a1ee9a44-2f86-45e2-b621-1ed38e655de8','user90@test.com',crypt('test123', gen_salt('bf')),'client','2025-10-11');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('a1ee9a44-2f86-45e2-b621-1ed38e655de8','Lucas','Andri','034000090','Antananarivo','2025-10-11');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3c5a92ad-b0b2-454c-9df4-a295caf395f5','Q-90-0','a1ee9a44-2f86-45e2-b621-1ed38e655de8','auto',208,'2021-05-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('fcc5b310-b7e3-408b-8b3a-a5fe4647f2da','POL-90-0','a1ee9a44-2f86-45e2-b621-1ed38e655de8','3c5a92ad-b0b2-454c-9df4-a295caf395f5','auto','2021-05-04','2022-05-04',208,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('016290c9-ebad-45d9-a054-f2d46c5b4241','INC-90-0-0','fcc5b310-b7e3-408b-8b3a-a5fe4647f2da','a1ee9a44-2f86-45e2-b621-1ed38e655de8','Accident','Collision mineure','2020-08-01','auto');


-- USER 91
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('08098433-18df-4d02-9697-8076b24ad0f9','user91@test.com',crypt('test123', gen_salt('bf')),'client','2022-03-23');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('08098433-18df-4d02-9697-8076b24ad0f9','Jean','Rakoto','034000091','Antananarivo','2022-03-23');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('783757d9-97a3-4e9d-a1b4-f7e8caaa8c43','Q-91-0','08098433-18df-4d02-9697-8076b24ad0f9','auto',73,'2025-07-29');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('662c2cb9-e290-44ad-adf0-912c89a68eba','POL-91-0','08098433-18df-4d02-9697-8076b24ad0f9','783757d9-97a3-4e9d-a1b4-f7e8caaa8c43','auto','2025-07-29','2026-07-29',73,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('61c8d64a-a6c5-4055-8873-9260a9f1cab8','INC-91-0-0','662c2cb9-e290-44ad-adf0-912c89a68eba','08098433-18df-4d02-9697-8076b24ad0f9','Accident','Collision mineure','2022-08-23','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('eb1bff15-84f8-42b9-9d67-1b5c5da354af','Q-91-1','08098433-18df-4d02-9697-8076b24ad0f9','auto',222,'2022-05-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('f0f2aa25-95c8-4c67-b2d4-cdf8617a6b65','POL-91-1','08098433-18df-4d02-9697-8076b24ad0f9','eb1bff15-84f8-42b9-9d67-1b5c5da354af','auto','2022-05-24','2023-05-24',222,10,'full');


-- USER 92
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('481e7fe2-e7ec-41f7-a15c-43166a8cd976','user92@test.com',crypt('test123', gen_salt('bf')),'client','2021-09-04');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('481e7fe2-e7ec-41f7-a15c-43166a8cd976','Sofia','Andri','034000092','Antananarivo','2021-09-04');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b2224c82-69e2-424b-b589-bc5523fc46de','Q-92-0','481e7fe2-e7ec-41f7-a15c-43166a8cd976','auto',330,'2022-08-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('b412e7aa-fce9-4711-a065-84fd81a5431d','POL-92-0','481e7fe2-e7ec-41f7-a15c-43166a8cd976','b2224c82-69e2-424b-b589-bc5523fc46de','auto','2022-08-13','2023-08-13',330,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('9d5157e4-9a12-4e05-a662-7c69d1357c40','INC-92-0-0','b412e7aa-fce9-4711-a065-84fd81a5431d','481e7fe2-e7ec-41f7-a15c-43166a8cd976','Accident','Collision mineure','2021-04-18','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('8d8176f2-83a8-4ccf-90bd-ff75e339e349','INC-92-0-1','b412e7aa-fce9-4711-a065-84fd81a5431d','481e7fe2-e7ec-41f7-a15c-43166a8cd976','Accident','Collision mineure','2023-11-08','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('af512c4a-8827-448a-a36a-62713f57af82','Q-92-1','481e7fe2-e7ec-41f7-a15c-43166a8cd976','auto',365,'2021-02-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('525cea86-b681-4720-ae76-530d2b4e302e','POL-92-1','481e7fe2-e7ec-41f7-a15c-43166a8cd976','af512c4a-8827-448a-a36a-62713f57af82','auto','2021-02-10','2022-02-10',365,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('8ebe7e53-c70d-44b0-b609-6284ab21e2c1','INC-92-1-0','525cea86-b681-4720-ae76-530d2b4e302e','481e7fe2-e7ec-41f7-a15c-43166a8cd976','Accident','Collision mineure','2020-05-21','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f1ee501e-e59f-4198-aa43-ffa95aca656d','Q-92-2','481e7fe2-e7ec-41f7-a15c-43166a8cd976','auto',74,'2020-12-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('e52f9e88-018e-4cf4-be64-d3901d365229','POL-92-2','481e7fe2-e7ec-41f7-a15c-43166a8cd976','f1ee501e-e59f-4198-aa43-ffa95aca656d','auto','2020-12-25','2021-12-25',74,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('39d8dee6-c6dc-4485-b599-af95f6924a69','481e7fe2-e7ec-41f7-a15c-43166a8cd976','Service','Bon service',3);


-- USER 93
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('0153f3e3-659f-4f98-90b7-fbe905caf010','user93@test.com',crypt('test123', gen_salt('bf')),'client','2024-10-10');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('0153f3e3-659f-4f98-90b7-fbe905caf010','Paul','Rasoa','034000093','Antananarivo','2024-10-10');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('507fbb3a-6b3f-4de3-9bd6-7a7c7b164371','Q-93-0','0153f3e3-659f-4f98-90b7-fbe905caf010','auto',358,'2023-11-18');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('3f2f58f0-dfc1-4311-be2f-1fee275bba37','POL-93-0','0153f3e3-659f-4f98-90b7-fbe905caf010','507fbb3a-6b3f-4de3-9bd6-7a7c7b164371','auto','2023-11-18','2024-11-18',358,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('86e5c4b1-08f2-407e-84c8-6f8a93d31871','Q-93-1','0153f3e3-659f-4f98-90b7-fbe905caf010','auto',296,'2023-12-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('cf41c101-10f6-42f3-b867-94829ace1a06','POL-93-1','0153f3e3-659f-4f98-90b7-fbe905caf010','86e5c4b1-08f2-407e-84c8-6f8a93d31871','auto','2023-12-23','2024-12-23',296,10,'full');


-- USER 94
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('848b731e-5513-4fb1-8dc4-b61ab02cea97','user94@test.com',crypt('test123', gen_salt('bf')),'client','2025-02-21');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('848b731e-5513-4fb1-8dc4-b61ab02cea97','Paul','Randria','034000094','Antananarivo','2025-02-21');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('4557c256-a20c-415b-b033-eddbccb3ef77','Q-94-0','848b731e-5513-4fb1-8dc4-b61ab02cea97','auto',234,'2023-04-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('17c8dae3-c0f3-4760-929d-89dc288194a5','POL-94-0','848b731e-5513-4fb1-8dc4-b61ab02cea97','4557c256-a20c-415b-b033-eddbccb3ef77','auto','2023-04-01','2024-04-01',234,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('4e7c6d93-11ee-40c1-ab96-eb50fc98663f','INC-94-0-0','17c8dae3-c0f3-4760-929d-89dc288194a5','848b731e-5513-4fb1-8dc4-b61ab02cea97','Accident','Collision mineure','2021-04-27','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('c65b455b-db48-4974-b902-c532a0e80143','INC-94-0-1','17c8dae3-c0f3-4760-929d-89dc288194a5','848b731e-5513-4fb1-8dc4-b61ab02cea97','Accident','Collision mineure','2021-11-24','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('184a4f3b-37e6-4b32-bdc3-54130174b7fe','Q-94-1','848b731e-5513-4fb1-8dc4-b61ab02cea97','auto',72,'2021-07-18');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('3b3238fe-4d60-431f-9d75-dbb09648051f','POL-94-1','848b731e-5513-4fb1-8dc4-b61ab02cea97','184a4f3b-37e6-4b32-bdc3-54130174b7fe','auto','2021-07-18','2022-07-18',72,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('1ae775a9-f28f-4196-82b7-d6b89ad1ab6e','INC-94-1-0','3b3238fe-4d60-431f-9d75-dbb09648051f','848b731e-5513-4fb1-8dc4-b61ab02cea97','Accident','Collision mineure','2022-12-14','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('ef3ae73d-ec76-42dd-9b5a-0aac420e7f2b','848b731e-5513-4fb1-8dc4-b61ab02cea97','Service','Bon service',3);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('d459a6c1-8cc2-456b-bcf9-aac26d329c15','848b731e-5513-4fb1-8dc4-b61ab02cea97','Service','Bon service',4);


-- USER 95
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('3aa69ba6-0766-40ac-a1a3-9243957709fe','user95@test.com',crypt('test123', gen_salt('bf')),'client','2023-07-26');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('3aa69ba6-0766-40ac-a1a3-9243957709fe','Aina','Rabe','034000095','Antananarivo','2023-07-26');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8ab5ee28-5d9c-4141-a3e6-3b8a7153bbf0','Q-95-0','3aa69ba6-0766-40ac-a1a3-9243957709fe','auto',384,'2021-11-15');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('120ee28b-96df-4dfc-9a6e-8bbf68d49f2a','POL-95-0','3aa69ba6-0766-40ac-a1a3-9243957709fe','8ab5ee28-5d9c-4141-a3e6-3b8a7153bbf0','auto','2021-11-15','2022-11-15',384,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('7e4a88d8-665b-4a04-a33c-178abfa37a84','INC-95-0-0','120ee28b-96df-4dfc-9a6e-8bbf68d49f2a','3aa69ba6-0766-40ac-a1a3-9243957709fe','Accident','Collision mineure','2024-07-29','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('6383dac4-2f0a-42a8-82bd-763ee3919586','INC-95-0-1','120ee28b-96df-4dfc-9a6e-8bbf68d49f2a','3aa69ba6-0766-40ac-a1a3-9243957709fe','Accident','Collision mineure','2024-10-31','auto');


-- USER 96
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('2afa0946-3815-47b5-ac1e-a6f7c1b8acb0','user96@test.com',crypt('test123', gen_salt('bf')),'client','2022-08-12');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('2afa0946-3815-47b5-ac1e-a6f7c1b8acb0','Aina','Rakoto','034000096','Antananarivo','2022-08-12');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a04a8653-1261-40cf-88dc-fce5ee43d035','Q-96-0','2afa0946-3815-47b5-ac1e-a6f7c1b8acb0','auto',220,'2022-03-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('d8952b19-f995-421d-a3d2-b008637d953f','POL-96-0','2afa0946-3815-47b5-ac1e-a6f7c1b8acb0','a04a8653-1261-40cf-88dc-fce5ee43d035','auto','2022-03-20','2023-03-20',220,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('f8e8dd30-6126-452b-af4d-4a70ebaaba56','INC-96-0-0','d8952b19-f995-421d-a3d2-b008637d953f','2afa0946-3815-47b5-ac1e-a6f7c1b8acb0','Accident','Collision mineure','2024-06-24','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('666f1fce-c522-4dfa-bd6d-4a875689f206','INC-96-0-1','d8952b19-f995-421d-a3d2-b008637d953f','2afa0946-3815-47b5-ac1e-a6f7c1b8acb0','Accident','Collision mineure','2021-12-18','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b1f86cd6-4bdf-4f94-bedf-e1b51ed65650','Q-96-1','2afa0946-3815-47b5-ac1e-a6f7c1b8acb0','auto',447,'2020-01-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('70861936-2e70-4b33-bc5e-11ebd5436f31','POL-96-1','2afa0946-3815-47b5-ac1e-a6f7c1b8acb0','b1f86cd6-4bdf-4f94-bedf-e1b51ed65650','auto','2020-01-06','2021-01-06',447,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('da5d3ee6-c89b-4bed-9384-a2176578df01','INC-96-1-0','70861936-2e70-4b33-bc5e-11ebd5436f31','2afa0946-3815-47b5-ac1e-a6f7c1b8acb0','Accident','Collision mineure','2022-05-22','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('1068c502-8ae1-4562-8b18-cb99bc859e4d','INC-96-1-1','70861936-2e70-4b33-bc5e-11ebd5436f31','2afa0946-3815-47b5-ac1e-a6f7c1b8acb0','Accident','Collision mineure','2022-10-13','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('2d2c85fa-ce9f-4093-bd83-1545d2181beb','2afa0946-3815-47b5-ac1e-a6f7c1b8acb0','Service','Bon service',4);


-- USER 97
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('4f25a9ec-0790-416f-b6ef-fb3ad1a6d7f7','user97@test.com',crypt('test123', gen_salt('bf')),'client','2024-04-02');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('4f25a9ec-0790-416f-b6ef-fb3ad1a6d7f7','Hery','Randria','034000097','Antananarivo','2024-04-02');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('4ea77f0f-8baa-4ef4-b34b-f5ca2dcb7b51','Q-97-0','4f25a9ec-0790-416f-b6ef-fb3ad1a6d7f7','auto',468,'2025-07-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('ca2c83ff-075e-45ec-8f68-741f594aaed6','POL-97-0','4f25a9ec-0790-416f-b6ef-fb3ad1a6d7f7','4ea77f0f-8baa-4ef4-b34b-f5ca2dcb7b51','auto','2025-07-10','2026-07-10',468,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('e7de6719-433a-4815-be33-56ab53f58f30','INC-97-0-0','ca2c83ff-075e-45ec-8f68-741f594aaed6','4f25a9ec-0790-416f-b6ef-fb3ad1a6d7f7','Accident','Collision mineure','2023-01-03','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('a2856a4c-81cc-412d-be58-7d39c373fed0','4f25a9ec-0790-416f-b6ef-fb3ad1a6d7f7','Service','Bon service',4);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('e73d7bf4-2c6b-4fa2-8bd9-843b4c838a93','4f25a9ec-0790-416f-b6ef-fb3ad1a6d7f7','Service','Bon service',3);


-- USER 98
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('efb43ee2-625d-4ad8-ac41-147c58f0ca02','user98@test.com',crypt('test123', gen_salt('bf')),'client','2024-12-25');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('efb43ee2-625d-4ad8-ac41-147c58f0ca02','Jean','Raharison','034000098','Antananarivo','2024-12-25');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('94c6f2fc-9532-4ccd-b072-110d9ccf35e8','Q-98-0','efb43ee2-625d-4ad8-ac41-147c58f0ca02','auto',494,'2022-11-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('a17a011f-ff7b-485d-ae00-6e2888323616','POL-98-0','efb43ee2-625d-4ad8-ac41-147c58f0ca02','94c6f2fc-9532-4ccd-b072-110d9ccf35e8','auto','2022-11-21','2023-11-21',494,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('452e6c42-a724-451f-8c2a-7abf23f5da1e','INC-98-0-0','a17a011f-ff7b-485d-ae00-6e2888323616','efb43ee2-625d-4ad8-ac41-147c58f0ca02','Accident','Collision mineure','2024-03-18','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ec6bd7e0-fc75-4ae4-ad15-571f7b920ce0','Q-98-1','efb43ee2-625d-4ad8-ac41-147c58f0ca02','auto',421,'2020-10-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('c764b418-83e5-4925-ae28-59eabee543d6','POL-98-1','efb43ee2-625d-4ad8-ac41-147c58f0ca02','ec6bd7e0-fc75-4ae4-ad15-571f7b920ce0','auto','2020-10-05','2021-10-05',421,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('6e988c10-59d0-44c7-a5b3-32cffa6925e3','INC-98-1-0','c764b418-83e5-4925-ae28-59eabee543d6','efb43ee2-625d-4ad8-ac41-147c58f0ca02','Accident','Collision mineure','2024-08-30','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('1aea12de-03a6-4340-b65a-c0ef1c42f780','INC-98-1-1','c764b418-83e5-4925-ae28-59eabee543d6','efb43ee2-625d-4ad8-ac41-147c58f0ca02','Accident','Collision mineure','2024-10-09','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('1557feae-c7ef-43e8-a72b-832f193f45bf','efb43ee2-625d-4ad8-ac41-147c58f0ca02','Service','Bon service',4);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('575dfd42-3f4d-4719-918d-d520ecdacc2f','efb43ee2-625d-4ad8-ac41-147c58f0ca02','Service','Bon service',2);


-- USER 99
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('0ed6d20d-7812-4fed-a410-c27e8f3f19f1','user99@test.com',crypt('test123', gen_salt('bf')),'client','2024-01-02');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('0ed6d20d-7812-4fed-a410-c27e8f3f19f1','Paul','Rasoa','034000099','Antananarivo','2024-01-02');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('43c10cc9-dc65-4db6-b633-71875b30a16f','Q-99-0','0ed6d20d-7812-4fed-a410-c27e8f3f19f1','auto',286,'2022-01-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('0252d74c-60c4-4c54-a9da-982839a709b7','POL-99-0','0ed6d20d-7812-4fed-a410-c27e8f3f19f1','43c10cc9-dc65-4db6-b633-71875b30a16f','auto','2022-01-23','2023-01-23',286,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a71bb2b8-f520-47dc-b329-e15ccf27232a','Q-99-1','0ed6d20d-7812-4fed-a410-c27e8f3f19f1','auto',72,'2022-10-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('ba8af64d-7187-4c65-b9c2-15e3bf43a896','POL-99-1','0ed6d20d-7812-4fed-a410-c27e8f3f19f1','a71bb2b8-f520-47dc-b329-e15ccf27232a','auto','2022-10-07','2023-10-07',72,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('43d6132f-4282-4637-adda-371a7aac29c6','INC-99-1-0','ba8af64d-7187-4c65-b9c2-15e3bf43a896','0ed6d20d-7812-4fed-a410-c27e8f3f19f1','Accident','Collision mineure','2023-04-22','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('9e4b7f54-856b-441e-9432-9d5d4fba9d44','INC-99-1-1','ba8af64d-7187-4c65-b9c2-15e3bf43a896','0ed6d20d-7812-4fed-a410-c27e8f3f19f1','Accident','Collision mineure','2024-09-08','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('054fd7bb-540a-438a-aa31-6f672fa55871','Q-99-2','0ed6d20d-7812-4fed-a410-c27e8f3f19f1','auto',445,'2020-01-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('df61865e-69f2-413c-a122-711511090dc6','POL-99-2','0ed6d20d-7812-4fed-a410-c27e8f3f19f1','054fd7bb-540a-438a-aa31-6f672fa55871','auto','2020-01-27','2021-01-27',445,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('d37554e7-6dc8-40c3-8a53-7fc6bd287fb3','INC-99-2-0','df61865e-69f2-413c-a122-711511090dc6','0ed6d20d-7812-4fed-a410-c27e8f3f19f1','Accident','Collision mineure','2020-12-13','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('5a69ec9b-ee72-4688-83f2-b3b30fc83741','INC-99-2-1','df61865e-69f2-413c-a122-711511090dc6','0ed6d20d-7812-4fed-a410-c27e8f3f19f1','Accident','Collision mineure','2021-08-07','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('50877e33-d7d5-4340-901b-ace04a1789b8','0ed6d20d-7812-4fed-a410-c27e8f3f19f1','Service','Bon service',2);


-- USER 100
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('32229e27-1a13-460d-8dcb-f39006d14fff','user100@test.com',crypt('test123', gen_salt('bf')),'client','2025-11-11');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('32229e27-1a13-460d-8dcb-f39006d14fff','Aina','Rakoto','034000100','Antananarivo','2025-11-11');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('079f562e-8cad-42c0-ad40-531051e8e4ab','Q-100-0','32229e27-1a13-460d-8dcb-f39006d14fff','auto',245,'2020-10-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('06b1b820-fdb0-4182-90ad-d5a6be38cfce','POL-100-0','32229e27-1a13-460d-8dcb-f39006d14fff','079f562e-8cad-42c0-ad40-531051e8e4ab','auto','2020-10-16','2021-10-16',245,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('0daf243a-380b-4e14-92fa-512315a17f12','INC-100-0-0','06b1b820-fdb0-4182-90ad-d5a6be38cfce','32229e27-1a13-460d-8dcb-f39006d14fff','Accident','Collision mineure','2021-08-27','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('d95b7dd5-053c-4fd0-a729-b5db43bd6bfb','INC-100-0-1','06b1b820-fdb0-4182-90ad-d5a6be38cfce','32229e27-1a13-460d-8dcb-f39006d14fff','Accident','Collision mineure','2021-04-07','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('99381797-5c6a-47ab-bf66-349a8a967eea','Q-100-1','32229e27-1a13-460d-8dcb-f39006d14fff','auto',146,'2025-07-18');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('9c53cc9c-1eeb-4dac-a886-82ed854b44d8','POL-100-1','32229e27-1a13-460d-8dcb-f39006d14fff','99381797-5c6a-47ab-bf66-349a8a967eea','auto','2025-07-18','2026-07-18',146,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('765e7ae7-1dd8-42d6-adc0-9e4ffcccb062','INC-100-1-0','9c53cc9c-1eeb-4dac-a886-82ed854b44d8','32229e27-1a13-460d-8dcb-f39006d14fff','Accident','Collision mineure','2022-10-26','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('e34baf2e-8a9d-444e-96fe-dff475d08073','INC-100-1-1','9c53cc9c-1eeb-4dac-a886-82ed854b44d8','32229e27-1a13-460d-8dcb-f39006d14fff','Accident','Collision mineure','2021-07-07','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('10b509ba-4390-4b9e-b1aa-124eab14937e','Q-100-2','32229e27-1a13-460d-8dcb-f39006d14fff','auto',407,'2020-09-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('d73007ed-2c41-4a3d-a303-c9d1a1fd38ae','POL-100-2','32229e27-1a13-460d-8dcb-f39006d14fff','10b509ba-4390-4b9e-b1aa-124eab14937e','auto','2020-09-25','2021-09-25',407,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('7056a9a4-9057-4cb1-8c4d-daad86d91a73','INC-100-2-0','d73007ed-2c41-4a3d-a303-c9d1a1fd38ae','32229e27-1a13-460d-8dcb-f39006d14fff','Accident','Collision mineure','2024-05-29','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('e0bd1c2c-0d6a-4f11-bcc5-3599e1e497cc','32229e27-1a13-460d-8dcb-f39006d14fff','Service','Bon service',4);


-- USER 101
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('d7779e21-0d08-432e-ab08-102650a540d0','user101@test.com',crypt('test123', gen_salt('bf')),'client','2020-05-10');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('d7779e21-0d08-432e-ab08-102650a540d0','Lucas','Rakotovao','034000101','Antananarivo','2020-05-10');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('196ab8eb-f06f-4612-8a1b-898391704042','Q-101-0','d7779e21-0d08-432e-ab08-102650a540d0','auto',439,'2022-01-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('301d574f-52eb-48b1-8518-012cc24a7dad','POL-101-0','d7779e21-0d08-432e-ab08-102650a540d0','196ab8eb-f06f-4612-8a1b-898391704042','auto','2022-01-22','2023-01-22',439,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('52f37fd1-d772-43f6-ac0a-4585e16707d7','INC-101-0-0','301d574f-52eb-48b1-8518-012cc24a7dad','d7779e21-0d08-432e-ab08-102650a540d0','Accident','Collision mineure','2026-01-18','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b85d308b-a852-4efe-b3cf-83fd5fc84bcf','Q-101-1','d7779e21-0d08-432e-ab08-102650a540d0','auto',232,'2020-12-29');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('f43a1521-b932-4640-910d-9f5b41c797be','POL-101-1','d7779e21-0d08-432e-ab08-102650a540d0','b85d308b-a852-4efe-b3cf-83fd5fc84bcf','auto','2020-12-29','2021-12-29',232,10,'full');


-- USER 102
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('38e52f32-c0ff-4e04-9e38-33be022aef5d','user102@test.com',crypt('test123', gen_salt('bf')),'client','2022-10-31');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('38e52f32-c0ff-4e04-9e38-33be022aef5d','Jean','Rabe','034000102','Antananarivo','2022-10-31');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('09b01e77-6e4f-4b6d-8911-e5cbad140dee','Q-102-0','38e52f32-c0ff-4e04-9e38-33be022aef5d','auto',478,'2020-09-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('4a36c50c-e40d-428e-b913-f68c0b3ddf22','POL-102-0','38e52f32-c0ff-4e04-9e38-33be022aef5d','09b01e77-6e4f-4b6d-8911-e5cbad140dee','auto','2020-09-19','2021-09-19',478,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('6b874aa4-eaba-4202-b7b7-63c5edf5cd30','Q-102-1','38e52f32-c0ff-4e04-9e38-33be022aef5d','auto',247,'2023-01-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('9324564a-655e-43b3-aa66-8917cabc4dbc','POL-102-1','38e52f32-c0ff-4e04-9e38-33be022aef5d','6b874aa4-eaba-4202-b7b7-63c5edf5cd30','auto','2023-01-20','2024-01-20',247,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('e0203ef9-e179-402a-b464-1e19394a8c77','INC-102-1-0','9324564a-655e-43b3-aa66-8917cabc4dbc','38e52f32-c0ff-4e04-9e38-33be022aef5d','Accident','Collision mineure','2026-01-27','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('5e73dca2-bebc-4cf5-a6df-ef9908acbeea','Q-102-2','38e52f32-c0ff-4e04-9e38-33be022aef5d','auto',454,'2022-03-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('5346a36b-20a9-4844-8758-8ba111f711e0','POL-102-2','38e52f32-c0ff-4e04-9e38-33be022aef5d','5e73dca2-bebc-4cf5-a6df-ef9908acbeea','auto','2022-03-14','2023-03-14',454,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('2555d001-5b2f-428f-86ea-e9f89867bea8','INC-102-2-0','5346a36b-20a9-4844-8758-8ba111f711e0','38e52f32-c0ff-4e04-9e38-33be022aef5d','Accident','Collision mineure','2023-11-08','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('8d5936df-9ac5-4fbf-b7b9-d64c5129c1a0','INC-102-2-1','5346a36b-20a9-4844-8758-8ba111f711e0','38e52f32-c0ff-4e04-9e38-33be022aef5d','Accident','Collision mineure','2025-08-16','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('00902c59-3aac-4d98-9ecd-f0f30e68b2e3','38e52f32-c0ff-4e04-9e38-33be022aef5d','Service','Bon service',4);


-- USER 103
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('9d181f8f-6c71-485d-a480-7b9066c5815c','user103@test.com',crypt('test123', gen_salt('bf')),'client','2020-03-13');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('9d181f8f-6c71-485d-a480-7b9066c5815c','Jean','Rakoto','034000103','Antananarivo','2020-03-13');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e1362976-ef65-4c88-8100-4ea91ae7185d','Q-103-0','9d181f8f-6c71-485d-a480-7b9066c5815c','auto',434,'2021-02-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('a1721503-619b-4775-bf26-735dc0c0e950','POL-103-0','9d181f8f-6c71-485d-a480-7b9066c5815c','e1362976-ef65-4c88-8100-4ea91ae7185d','auto','2021-02-17','2022-02-17',434,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('bc31e2ee-fc48-4a29-9f9c-325d9fcef8c8','INC-103-0-0','a1721503-619b-4775-bf26-735dc0c0e950','9d181f8f-6c71-485d-a480-7b9066c5815c','Accident','Collision mineure','2024-07-18','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('9c2568c9-37d7-4e2a-abd8-dc3335b549ed','INC-103-0-1','a1721503-619b-4775-bf26-735dc0c0e950','9d181f8f-6c71-485d-a480-7b9066c5815c','Accident','Collision mineure','2022-10-30','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('5991448c-36f4-4c0f-9349-fd2a169ba86a','Q-103-1','9d181f8f-6c71-485d-a480-7b9066c5815c','auto',260,'2023-02-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('9b11b4f7-d1f8-41ca-b178-dedf0b380a6b','POL-103-1','9d181f8f-6c71-485d-a480-7b9066c5815c','5991448c-36f4-4c0f-9349-fd2a169ba86a','auto','2023-02-06','2024-02-06',260,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('6ec55241-4ef8-41a5-a42a-da7cf5e53360','INC-103-1-0','9b11b4f7-d1f8-41ca-b178-dedf0b380a6b','9d181f8f-6c71-485d-a480-7b9066c5815c','Accident','Collision mineure','2021-02-03','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('1c36ce3a-be92-412b-91f5-99746d524498','9d181f8f-6c71-485d-a480-7b9066c5815c','Service','Bon service',5);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('e5fb64bc-715b-46c1-9a75-57417fc1db8b','9d181f8f-6c71-485d-a480-7b9066c5815c','Service','Bon service',5);


-- USER 104
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('2698f509-2d2c-48d8-9c99-ae34032458c7','user104@test.com',crypt('test123', gen_salt('bf')),'client','2024-09-24');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('2698f509-2d2c-48d8-9c99-ae34032458c7','Mickael','Rakoto','034000104','Antananarivo','2024-09-24');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('878eef87-312f-4f9e-a8d3-23e3d2d32b22','Q-104-0','2698f509-2d2c-48d8-9c99-ae34032458c7','auto',277,'2023-10-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('f06a05c9-2a05-4139-bdc9-c2ac5839584f','POL-104-0','2698f509-2d2c-48d8-9c99-ae34032458c7','878eef87-312f-4f9e-a8d3-23e3d2d32b22','auto','2023-10-02','2024-10-02',277,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('6d25f40a-761b-45ad-99e1-320d9223b06e','INC-104-0-0','f06a05c9-2a05-4139-bdc9-c2ac5839584f','2698f509-2d2c-48d8-9c99-ae34032458c7','Accident','Collision mineure','2022-01-05','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('b008e5e7-4858-42c2-a0b7-f4f880bd0d43','INC-104-0-1','f06a05c9-2a05-4139-bdc9-c2ac5839584f','2698f509-2d2c-48d8-9c99-ae34032458c7','Accident','Collision mineure','2021-05-30','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('faf0136e-5b8c-4e60-89d1-b11d0eba96e0','Q-104-1','2698f509-2d2c-48d8-9c99-ae34032458c7','auto',133,'2021-07-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('3fd873c6-e966-4434-a24d-875000d8e523','POL-104-1','2698f509-2d2c-48d8-9c99-ae34032458c7','faf0136e-5b8c-4e60-89d1-b11d0eba96e0','auto','2021-07-13','2022-07-13',133,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('7d5ec145-a20c-4eb2-82e3-b7e7520897ca','Q-104-2','2698f509-2d2c-48d8-9c99-ae34032458c7','auto',273,'2021-02-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('a21bd4cb-f910-4e58-8b7e-f24e994c4055','POL-104-2','2698f509-2d2c-48d8-9c99-ae34032458c7','7d5ec145-a20c-4eb2-82e3-b7e7520897ca','auto','2021-02-10','2022-02-10',273,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('2956adb6-ffdc-49a0-a7ac-c5fb52ebbf89','INC-104-2-0','a21bd4cb-f910-4e58-8b7e-f24e994c4055','2698f509-2d2c-48d8-9c99-ae34032458c7','Accident','Collision mineure','2024-08-12','auto');


-- USER 105
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('31730ea3-4d33-4175-8fac-bc3e5c452f1a','user105@test.com',crypt('test123', gen_salt('bf')),'client','2021-09-08');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('31730ea3-4d33-4175-8fac-bc3e5c452f1a','Lucas','Andri','034000105','Antananarivo','2021-09-08');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c480f5d9-2dbf-4f7a-a158-e19e124f051a','Q-105-0','31730ea3-4d33-4175-8fac-bc3e5c452f1a','auto',297,'2020-08-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('1dd25516-f353-42b8-829b-e174d32a3044','POL-105-0','31730ea3-4d33-4175-8fac-bc3e5c452f1a','c480f5d9-2dbf-4f7a-a158-e19e124f051a','auto','2020-08-05','2021-08-05',297,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('807c4a95-8617-4661-9370-93eb4859e515','INC-105-0-0','1dd25516-f353-42b8-829b-e174d32a3044','31730ea3-4d33-4175-8fac-bc3e5c452f1a','Accident','Collision mineure','2026-01-21','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('227a89db-e197-45b5-b3de-977ed0ceb1e6','INC-105-0-1','1dd25516-f353-42b8-829b-e174d32a3044','31730ea3-4d33-4175-8fac-bc3e5c452f1a','Accident','Collision mineure','2024-11-11','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('11c0afcf-43ce-4e51-98da-b38375615082','31730ea3-4d33-4175-8fac-bc3e5c452f1a','Service','Bon service',2);


-- USER 106
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('59a58ad1-3c4f-4058-ab0c-d35e186fa07a','user106@test.com',crypt('test123', gen_salt('bf')),'client','2024-12-27');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('59a58ad1-3c4f-4058-ab0c-d35e186fa07a','Jean','Raharison','034000106','Antananarivo','2024-12-27');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('6e9c085f-6f71-4655-87c1-3a8250b7dc43','Q-106-0','59a58ad1-3c4f-4058-ab0c-d35e186fa07a','auto',253,'2025-10-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('6b25ca7c-76e6-4aee-b3d9-1a6921388c34','POL-106-0','59a58ad1-3c4f-4058-ab0c-d35e186fa07a','6e9c085f-6f71-4655-87c1-3a8250b7dc43','auto','2025-10-23','2026-10-23',253,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('36e8055a-eb63-48f1-a966-8694a6da7363','INC-106-0-0','6b25ca7c-76e6-4aee-b3d9-1a6921388c34','59a58ad1-3c4f-4058-ab0c-d35e186fa07a','Accident','Collision mineure','2022-08-29','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('b65eb004-3b9d-44d0-b06d-1907ef8e1672','INC-106-0-1','6b25ca7c-76e6-4aee-b3d9-1a6921388c34','59a58ad1-3c4f-4058-ab0c-d35e186fa07a','Accident','Collision mineure','2020-03-20','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('fcac8d23-c3fa-4a18-a097-51ae7d09493b','Q-106-1','59a58ad1-3c4f-4058-ab0c-d35e186fa07a','auto',435,'2026-01-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('11b95a45-ff0e-413f-b2f3-3e7a799a39f6','POL-106-1','59a58ad1-3c4f-4058-ab0c-d35e186fa07a','fcac8d23-c3fa-4a18-a097-51ae7d09493b','auto','2026-01-17','2027-01-17',435,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('354e7d0e-fe70-4892-86c0-e7a61dd031cb','INC-106-1-0','11b95a45-ff0e-413f-b2f3-3e7a799a39f6','59a58ad1-3c4f-4058-ab0c-d35e186fa07a','Accident','Collision mineure','2024-07-22','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('c15a8a3e-1912-49ae-a3a3-67b30e20da1c','INC-106-1-1','11b95a45-ff0e-413f-b2f3-3e7a799a39f6','59a58ad1-3c4f-4058-ab0c-d35e186fa07a','Accident','Collision mineure','2022-01-08','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('d5a722f0-5df3-4467-a1ba-8db30f257b47','59a58ad1-3c4f-4058-ab0c-d35e186fa07a','Service','Bon service',5);


-- USER 107
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('b25692d9-0149-483b-95a1-2014adeaae6a','user107@test.com',crypt('test123', gen_salt('bf')),'client','2024-04-22');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('b25692d9-0149-483b-95a1-2014adeaae6a','Sofia','Randria','034000107','Antananarivo','2024-04-22');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('5325f032-32ba-481c-b3a2-3fdad5c6f770','Q-107-0','b25692d9-0149-483b-95a1-2014adeaae6a','auto',168,'2023-08-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('8038cae0-0ad7-44c5-b8bb-55923c033ff8','POL-107-0','b25692d9-0149-483b-95a1-2014adeaae6a','5325f032-32ba-481c-b3a2-3fdad5c6f770','auto','2023-08-25','2024-08-25',168,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('78d61e54-fc1a-4489-a818-67a420cf0629','Q-107-1','b25692d9-0149-483b-95a1-2014adeaae6a','auto',360,'2025-06-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('22408778-c271-4c03-a003-6e121b879c6f','POL-107-1','b25692d9-0149-483b-95a1-2014adeaae6a','78d61e54-fc1a-4489-a818-67a420cf0629','auto','2025-06-17','2026-06-17',360,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('81d1c00f-f3e2-47af-bdaa-92e856154810','INC-107-1-0','22408778-c271-4c03-a003-6e121b879c6f','b25692d9-0149-483b-95a1-2014adeaae6a','Accident','Collision mineure','2021-01-16','auto');


-- USER 108
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('190ef0c9-c79b-40d8-96f6-52c4ae0e8346','user108@test.com',crypt('test123', gen_salt('bf')),'client','2022-08-11');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('190ef0c9-c79b-40d8-96f6-52c4ae0e8346','Marie','Raharison','034000108','Antananarivo','2022-08-11');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('da6c09d7-3e3a-4df5-adc9-8c09efaaa649','Q-108-0','190ef0c9-c79b-40d8-96f6-52c4ae0e8346','auto',306,'2024-01-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('dc918460-8a36-45f4-9f10-7655f5808124','POL-108-0','190ef0c9-c79b-40d8-96f6-52c4ae0e8346','da6c09d7-3e3a-4df5-adc9-8c09efaaa649','auto','2024-01-28','2025-01-28',306,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('1e870684-9b18-40b1-b2f5-d8d102d54fff','190ef0c9-c79b-40d8-96f6-52c4ae0e8346','Service','Bon service',5);


-- USER 109
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('2e0b140f-0dd7-4b6c-911e-51d9c672cca3','user109@test.com',crypt('test123', gen_salt('bf')),'client','2022-12-01');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('2e0b140f-0dd7-4b6c-911e-51d9c672cca3','Aina','Rasoa','034000109','Antananarivo','2022-12-01');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3adb23d8-f0dd-4bc1-bf50-3b4472b718e8','Q-109-0','2e0b140f-0dd7-4b6c-911e-51d9c672cca3','auto',298,'2022-06-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('54b222ff-9b92-4a50-b814-325a2860ed42','POL-109-0','2e0b140f-0dd7-4b6c-911e-51d9c672cca3','3adb23d8-f0dd-4bc1-bf50-3b4472b718e8','auto','2022-06-07','2023-06-07',298,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('fd0139de-aa02-462e-bded-23afc16c5ed9','INC-109-0-0','54b222ff-9b92-4a50-b814-325a2860ed42','2e0b140f-0dd7-4b6c-911e-51d9c672cca3','Accident','Collision mineure','2024-09-29','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('61735904-3561-4d1f-8bc8-4fb9d892e139','Q-109-1','2e0b140f-0dd7-4b6c-911e-51d9c672cca3','auto',446,'2024-08-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('270ea23c-c8de-44e2-a1e4-5cd1ad8514e8','POL-109-1','2e0b140f-0dd7-4b6c-911e-51d9c672cca3','61735904-3561-4d1f-8bc8-4fb9d892e139','auto','2024-08-20','2025-08-20',446,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('b24787a8-ed6a-40ee-8f15-e2de85fcb3c1','INC-109-1-0','270ea23c-c8de-44e2-a1e4-5cd1ad8514e8','2e0b140f-0dd7-4b6c-911e-51d9c672cca3','Accident','Collision mineure','2020-12-17','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('289b4f23-6a68-4166-8d5c-0fc3706a98d8','2e0b140f-0dd7-4b6c-911e-51d9c672cca3','Service','Bon service',5);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('29c228e0-a873-4097-af1f-16b5482e034b','2e0b140f-0dd7-4b6c-911e-51d9c672cca3','Service','Bon service',2);


-- USER 110
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('e8647b74-01b6-4fdf-bd0d-f6f594cee461','user110@test.com',crypt('test123', gen_salt('bf')),'client','2023-02-04');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('e8647b74-01b6-4fdf-bd0d-f6f594cee461','Paul','Randria','034000110','Antananarivo','2023-02-04');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('844cfad1-148d-48ac-b78c-df709e44e981','Q-110-0','e8647b74-01b6-4fdf-bd0d-f6f594cee461','auto',266,'2024-06-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('b8ef4f15-be68-4330-92ca-b67016696b42','POL-110-0','e8647b74-01b6-4fdf-bd0d-f6f594cee461','844cfad1-148d-48ac-b78c-df709e44e981','auto','2024-06-19','2025-06-19',266,10,'full');


-- USER 111
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('125f51a2-c880-4c44-9966-4207e2fa3564','user111@test.com',crypt('test123', gen_salt('bf')),'client','2022-12-06');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('125f51a2-c880-4c44-9966-4207e2fa3564','Aina','Raharison','034000111','Antananarivo','2022-12-06');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0880ab82-f0d3-4659-8164-fbb71d393a34','Q-111-0','125f51a2-c880-4c44-9966-4207e2fa3564','auto',53,'2024-11-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('c9e7cd48-b01d-4677-961a-ab912b6c3309','POL-111-0','125f51a2-c880-4c44-9966-4207e2fa3564','0880ab82-f0d3-4659-8164-fbb71d393a34','auto','2024-11-08','2025-11-08',53,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e640c689-5bf2-4b3c-840f-1549fa67df32','Q-111-1','125f51a2-c880-4c44-9966-4207e2fa3564','auto',348,'2020-03-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('bb55ee54-c4b9-4a8c-9021-3b17cd34336e','POL-111-1','125f51a2-c880-4c44-9966-4207e2fa3564','e640c689-5bf2-4b3c-840f-1549fa67df32','auto','2020-03-26','2021-03-26',348,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('b7cb48a9-6442-4549-bf8d-5b8442369790','125f51a2-c880-4c44-9966-4207e2fa3564','Service','Bon service',4);


-- USER 112
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('484261ea-8e84-4000-9bc1-6519626fe042','user112@test.com',crypt('test123', gen_salt('bf')),'client','2022-12-02');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('484261ea-8e84-4000-9bc1-6519626fe042','Lina','Randria','034000112','Antananarivo','2022-12-02');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('79c0c9ee-e01b-49d7-816d-e1e49111df06','Q-112-0','484261ea-8e84-4000-9bc1-6519626fe042','auto',372,'2023-08-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('8851a247-69f5-4907-8787-5e67ec7b9fea','POL-112-0','484261ea-8e84-4000-9bc1-6519626fe042','79c0c9ee-e01b-49d7-816d-e1e49111df06','auto','2023-08-08','2024-08-08',372,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('4f7b72da-426c-4b5d-a57e-91d7874b20ee','INC-112-0-0','8851a247-69f5-4907-8787-5e67ec7b9fea','484261ea-8e84-4000-9bc1-6519626fe042','Accident','Collision mineure','2023-02-09','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('11fb15ca-20bb-49db-ab67-569d86eff9e1','Q-112-1','484261ea-8e84-4000-9bc1-6519626fe042','auto',83,'2023-01-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('68aabae2-f635-47d6-82cf-9c28a5e1f692','POL-112-1','484261ea-8e84-4000-9bc1-6519626fe042','11fb15ca-20bb-49db-ab67-569d86eff9e1','auto','2023-01-08','2024-01-08',83,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('5fd1cce4-f86e-43ad-bff0-e91b52a6c5a2','INC-112-1-0','68aabae2-f635-47d6-82cf-9c28a5e1f692','484261ea-8e84-4000-9bc1-6519626fe042','Accident','Collision mineure','2025-10-31','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('bbb45a1c-5356-4201-aaad-bf91f397f343','484261ea-8e84-4000-9bc1-6519626fe042','Service','Bon service',4);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('d2b07a01-d219-4c2a-8232-8958774bd9ab','484261ea-8e84-4000-9bc1-6519626fe042','Service','Bon service',3);


-- USER 113
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a0b25386-d947-48d9-b7c0-ce26dc3ed1b5','user113@test.com',crypt('test123', gen_salt('bf')),'client','2023-01-06');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('a0b25386-d947-48d9-b7c0-ce26dc3ed1b5','Hery','Razaf','034000113','Antananarivo','2023-01-06');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('cc54c097-1d3f-4e2f-8bbb-ea5ec6c427fc','Q-113-0','a0b25386-d947-48d9-b7c0-ce26dc3ed1b5','auto',392,'2021-11-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('8f589fec-c857-4264-b210-631df70c588b','POL-113-0','a0b25386-d947-48d9-b7c0-ce26dc3ed1b5','cc54c097-1d3f-4e2f-8bbb-ea5ec6c427fc','auto','2021-11-28','2022-11-28',392,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('073db46d-8cdc-40a7-a38f-ae37202f7c3a','INC-113-0-0','8f589fec-c857-4264-b210-631df70c588b','a0b25386-d947-48d9-b7c0-ce26dc3ed1b5','Accident','Collision mineure','2020-12-03','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ed49f5de-fb77-4572-804c-f67937f9dedd','Q-113-1','a0b25386-d947-48d9-b7c0-ce26dc3ed1b5','auto',383,'2021-10-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('fe96117e-42fd-4f62-9d87-a16d674e1609','POL-113-1','a0b25386-d947-48d9-b7c0-ce26dc3ed1b5','ed49f5de-fb77-4572-804c-f67937f9dedd','auto','2021-10-04','2022-10-04',383,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('bf5d333e-1252-41ad-823b-6e8d63a44e9b','INC-113-1-0','fe96117e-42fd-4f62-9d87-a16d674e1609','a0b25386-d947-48d9-b7c0-ce26dc3ed1b5','Accident','Collision mineure','2023-10-01','auto');


-- USER 114
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a379fcb4-41dd-46b8-8d60-31ad24f20279','user114@test.com',crypt('test123', gen_salt('bf')),'client','2025-04-08');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('a379fcb4-41dd-46b8-8d60-31ad24f20279','Jean','Andri','034000114','Antananarivo','2025-04-08');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ab83bf16-2995-4ad2-81e8-36a15a7b330e','Q-114-0','a379fcb4-41dd-46b8-8d60-31ad24f20279','auto',231,'2023-05-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('56d05202-8243-4180-847c-7428fe548129','POL-114-0','a379fcb4-41dd-46b8-8d60-31ad24f20279','ab83bf16-2995-4ad2-81e8-36a15a7b330e','auto','2023-05-25','2024-05-25',231,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('8f6c35c4-0377-48c7-ae48-86056ea48ad2','INC-114-0-0','56d05202-8243-4180-847c-7428fe548129','a379fcb4-41dd-46b8-8d60-31ad24f20279','Accident','Collision mineure','2023-09-25','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('b538ff40-d321-4277-b81b-85f96713b924','INC-114-0-1','56d05202-8243-4180-847c-7428fe548129','a379fcb4-41dd-46b8-8d60-31ad24f20279','Accident','Collision mineure','2023-09-24','auto');


-- USER 115
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('e35c5b72-24ea-4e30-b6d4-5678a0b0ee4e','user115@test.com',crypt('test123', gen_salt('bf')),'client','2024-01-27');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('e35c5b72-24ea-4e30-b6d4-5678a0b0ee4e','Lina','Razaf','034000115','Antananarivo','2024-01-27');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('6eff2f49-629f-4b77-a9de-80bfedc9a5e9','Q-115-0','e35c5b72-24ea-4e30-b6d4-5678a0b0ee4e','auto',489,'2022-03-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('a460a441-ae2f-465c-873c-e9188b0173a4','POL-115-0','e35c5b72-24ea-4e30-b6d4-5678a0b0ee4e','6eff2f49-629f-4b77-a9de-80bfedc9a5e9','auto','2022-03-17','2023-03-17',489,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('e3156bda-ae89-4008-982d-2a52b6219b88','e35c5b72-24ea-4e30-b6d4-5678a0b0ee4e','Service','Bon service',2);


-- USER 116
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('30b48134-0362-4770-83c2-68124f48253b','user116@test.com',crypt('test123', gen_salt('bf')),'client','2024-06-13');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('30b48134-0362-4770-83c2-68124f48253b','Tiana','Rabe','034000116','Antananarivo','2024-06-13');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8b556239-1d4a-4377-affc-0572835c6375','Q-116-0','30b48134-0362-4770-83c2-68124f48253b','auto',406,'2021-03-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('9265f8ed-ad61-457f-95b8-e8cec9660149','POL-116-0','30b48134-0362-4770-83c2-68124f48253b','8b556239-1d4a-4377-affc-0572835c6375','auto','2021-03-03','2022-03-03',406,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('d18cddcd-c677-4429-b180-004cb7adbfe4','INC-116-0-0','9265f8ed-ad61-457f-95b8-e8cec9660149','30b48134-0362-4770-83c2-68124f48253b','Accident','Collision mineure','2023-04-29','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('6d2eb558-597c-4b93-bf73-8672f2cb6bcc','INC-116-0-1','9265f8ed-ad61-457f-95b8-e8cec9660149','30b48134-0362-4770-83c2-68124f48253b','Accident','Collision mineure','2024-03-22','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('155aa10e-0b18-486b-94a9-c90c18c10060','Q-116-1','30b48134-0362-4770-83c2-68124f48253b','auto',371,'2025-07-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('5b8f614f-8cb5-4a75-93f4-49e7705df0c7','POL-116-1','30b48134-0362-4770-83c2-68124f48253b','155aa10e-0b18-486b-94a9-c90c18c10060','auto','2025-07-10','2026-07-10',371,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('875b472d-aa95-47c1-945d-54f5b8d5a15c','30b48134-0362-4770-83c2-68124f48253b','Service','Bon service',2);


-- USER 117
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('55484450-7c91-4881-b119-6e0ed95b0cf3','user117@test.com',crypt('test123', gen_salt('bf')),'client','2021-09-06');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('55484450-7c91-4881-b119-6e0ed95b0cf3','Sofia','Rabe','034000117','Antananarivo','2021-09-06');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('472f316d-34d9-477f-9963-128c46540d96','Q-117-0','55484450-7c91-4881-b119-6e0ed95b0cf3','auto',418,'2020-10-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('8db8f373-0e92-4398-86d1-7caecc63112b','POL-117-0','55484450-7c91-4881-b119-6e0ed95b0cf3','472f316d-34d9-477f-9963-128c46540d96','auto','2020-10-16','2021-10-16',418,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('6c37c235-01a6-4d7d-a826-7b684a9560fc','55484450-7c91-4881-b119-6e0ed95b0cf3','Service','Bon service',5);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('b7ce1033-f665-42d5-aaea-51bbc643eeac','55484450-7c91-4881-b119-6e0ed95b0cf3','Service','Bon service',4);


-- USER 118
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('9253997c-b5f1-4055-a152-14bb13edcc4d','user118@test.com',crypt('test123', gen_salt('bf')),'client','2021-01-30');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('9253997c-b5f1-4055-a152-14bb13edcc4d','Sofia','Rasoa','034000118','Antananarivo','2021-01-30');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d10923f6-cb59-4f14-b757-7e09472a9ecf','Q-118-0','9253997c-b5f1-4055-a152-14bb13edcc4d','auto',239,'2020-12-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('9f104f49-e88b-47ca-8b79-86124c3f5dc7','POL-118-0','9253997c-b5f1-4055-a152-14bb13edcc4d','d10923f6-cb59-4f14-b757-7e09472a9ecf','auto','2020-12-23','2021-12-23',239,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('d67b7d2f-0032-477b-821c-37b767299019','INC-118-0-0','9f104f49-e88b-47ca-8b79-86124c3f5dc7','9253997c-b5f1-4055-a152-14bb13edcc4d','Accident','Collision mineure','2024-01-19','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2c684d2d-90f4-422e-8ad1-cf05d5f5bf42','Q-118-1','9253997c-b5f1-4055-a152-14bb13edcc4d','auto',248,'2021-04-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('457c05c2-5278-481f-b4b4-bb0502fc5081','POL-118-1','9253997c-b5f1-4055-a152-14bb13edcc4d','2c684d2d-90f4-422e-8ad1-cf05d5f5bf42','auto','2021-04-26','2022-04-26',248,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('16cb668d-becf-4682-bd21-4224dc08cab4','INC-118-1-0','457c05c2-5278-481f-b4b4-bb0502fc5081','9253997c-b5f1-4055-a152-14bb13edcc4d','Accident','Collision mineure','2023-07-03','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('ac342b1a-7687-4940-80c2-67182abc7258','9253997c-b5f1-4055-a152-14bb13edcc4d','Service','Bon service',2);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('9818812f-cebf-4514-93e2-3a79cd61626f','9253997c-b5f1-4055-a152-14bb13edcc4d','Service','Bon service',3);


-- USER 119
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('255f7247-6133-4684-8029-2c099d3ff754','user119@test.com',crypt('test123', gen_salt('bf')),'client','2022-07-28');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('255f7247-6133-4684-8029-2c099d3ff754','Sofia','Rasoa','034000119','Antananarivo','2022-07-28');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('df299344-d3a3-48d2-a59b-9f634be3195b','Q-119-0','255f7247-6133-4684-8029-2c099d3ff754','auto',254,'2023-05-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('a340433c-7369-4a78-b420-ae9882fa6451','POL-119-0','255f7247-6133-4684-8029-2c099d3ff754','df299344-d3a3-48d2-a59b-9f634be3195b','auto','2023-05-26','2024-05-26',254,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ab4fa544-31bf-4ee6-9c72-bc913c308056','Q-119-1','255f7247-6133-4684-8029-2c099d3ff754','auto',386,'2024-10-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('4dabe486-532f-41e0-8f47-b786af92be3b','POL-119-1','255f7247-6133-4684-8029-2c099d3ff754','ab4fa544-31bf-4ee6-9c72-bc913c308056','auto','2024-10-11','2025-10-11',386,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('f8c3e2f7-9113-4034-8e8d-466f36780877','INC-119-1-0','4dabe486-532f-41e0-8f47-b786af92be3b','255f7247-6133-4684-8029-2c099d3ff754','Accident','Collision mineure','2024-02-29','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('baa47ff3-4fcd-4298-8a37-b573246388fe','Q-119-2','255f7247-6133-4684-8029-2c099d3ff754','auto',481,'2024-09-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('a1175cf4-c6da-4d48-9f6f-c71ce66d99aa','POL-119-2','255f7247-6133-4684-8029-2c099d3ff754','baa47ff3-4fcd-4298-8a37-b573246388fe','auto','2024-09-08','2025-09-08',481,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('e27d7fcf-22f1-40ee-9974-487089a40cd1','255f7247-6133-4684-8029-2c099d3ff754','Service','Bon service',3);


-- USER 120
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('6bce8afa-162e-4fac-8b6f-95a8a577c309','user120@test.com',crypt('test123', gen_salt('bf')),'client','2021-04-13');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('6bce8afa-162e-4fac-8b6f-95a8a577c309','Aina','Rakoto','034000120','Antananarivo','2021-04-13');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1f2d83e4-6fb0-480f-9947-2dc53ffde822','Q-120-0','6bce8afa-162e-4fac-8b6f-95a8a577c309','auto',89,'2021-12-31');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('c2256ded-44a3-4769-b104-c962a5210ce7','POL-120-0','6bce8afa-162e-4fac-8b6f-95a8a577c309','1f2d83e4-6fb0-480f-9947-2dc53ffde822','auto','2021-12-31','2022-12-31',89,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8728496b-3b66-42ba-b022-a2a08feacf22','Q-120-1','6bce8afa-162e-4fac-8b6f-95a8a577c309','auto',276,'2026-03-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('b323ec84-a653-441b-9e61-75a9a72628c3','POL-120-1','6bce8afa-162e-4fac-8b6f-95a8a577c309','8728496b-3b66-42ba-b022-a2a08feacf22','auto','2026-03-24','2027-03-24',276,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('2d4e55bc-362e-4d19-8ac9-5a033444f502','INC-120-1-0','b323ec84-a653-441b-9e61-75a9a72628c3','6bce8afa-162e-4fac-8b6f-95a8a577c309','Accident','Collision mineure','2020-12-24','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('87c44972-e2ff-4805-9f3a-acc50c54c2c0','INC-120-1-1','b323ec84-a653-441b-9e61-75a9a72628c3','6bce8afa-162e-4fac-8b6f-95a8a577c309','Accident','Collision mineure','2024-08-02','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('22762ec5-2a40-4fff-87e3-3a3e52ac2722','Q-120-2','6bce8afa-162e-4fac-8b6f-95a8a577c309','auto',154,'2024-11-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('1d0a28ef-61aa-4501-94b2-7e1bd2d595c0','POL-120-2','6bce8afa-162e-4fac-8b6f-95a8a577c309','22762ec5-2a40-4fff-87e3-3a3e52ac2722','auto','2024-11-03','2025-11-03',154,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('cf2be16a-d53a-4e2c-a5c4-60178a49edc5','INC-120-2-0','1d0a28ef-61aa-4501-94b2-7e1bd2d595c0','6bce8afa-162e-4fac-8b6f-95a8a577c309','Accident','Collision mineure','2026-04-01','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('4519c321-f87d-4688-b883-f1287dc18665','INC-120-2-1','1d0a28ef-61aa-4501-94b2-7e1bd2d595c0','6bce8afa-162e-4fac-8b6f-95a8a577c309','Accident','Collision mineure','2023-12-22','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('a7149b3d-efa4-4fa3-a1ba-16ccc6a533aa','6bce8afa-162e-4fac-8b6f-95a8a577c309','Service','Bon service',2);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('4e4ab950-c33e-4b49-bbb2-e734bafc4c30','6bce8afa-162e-4fac-8b6f-95a8a577c309','Service','Bon service',5);


-- USER 121
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('462d9fa7-2462-4b17-afbb-6afce7de63ee','user121@test.com',crypt('test123', gen_salt('bf')),'client','2024-06-14');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('462d9fa7-2462-4b17-afbb-6afce7de63ee','Sofia','Rasoa','034000121','Antananarivo','2024-06-14');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('5c61dc8e-4f37-4606-a40d-7107d44b4fd4','Q-121-0','462d9fa7-2462-4b17-afbb-6afce7de63ee','auto',325,'2021-10-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('f9b44a3e-88f9-4fb5-9adc-bdf15f603f23','POL-121-0','462d9fa7-2462-4b17-afbb-6afce7de63ee','5c61dc8e-4f37-4606-a40d-7107d44b4fd4','auto','2021-10-22','2022-10-22',325,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b16393d4-e905-4ad1-b36a-825cfb7c5e61','Q-121-1','462d9fa7-2462-4b17-afbb-6afce7de63ee','auto',188,'2020-03-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('933cadbf-8412-4b09-a9f4-d1bd769dbf28','POL-121-1','462d9fa7-2462-4b17-afbb-6afce7de63ee','b16393d4-e905-4ad1-b36a-825cfb7c5e61','auto','2020-03-11','2021-03-11',188,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('ab67c631-707e-4cfe-a63a-e4eba9e78efc','INC-121-1-0','933cadbf-8412-4b09-a9f4-d1bd769dbf28','462d9fa7-2462-4b17-afbb-6afce7de63ee','Accident','Collision mineure','2020-04-05','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('c8d5d124-452f-4fd3-96f2-1c104d6a128d','462d9fa7-2462-4b17-afbb-6afce7de63ee','Service','Bon service',2);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('b2282910-86cb-4388-b6a6-397cac9b9fbb','462d9fa7-2462-4b17-afbb-6afce7de63ee','Service','Bon service',5);


-- USER 122
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('53925a7d-e2a2-48c6-8a1a-c33cceec2368','user122@test.com',crypt('test123', gen_salt('bf')),'client','2025-11-17');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('53925a7d-e2a2-48c6-8a1a-c33cceec2368','Marie','Rakoto','034000122','Antananarivo','2025-11-17');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e9b07194-ba94-47fc-89c4-e9f09ab5a8bb','Q-122-0','53925a7d-e2a2-48c6-8a1a-c33cceec2368','auto',389,'2024-02-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('e0967d03-aa44-4261-92b5-fa0653e11cad','POL-122-0','53925a7d-e2a2-48c6-8a1a-c33cceec2368','e9b07194-ba94-47fc-89c4-e9f09ab5a8bb','auto','2024-02-12','2025-02-12',389,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('2a94093e-27f2-46ce-a09f-0afe71c72695','INC-122-0-0','e0967d03-aa44-4261-92b5-fa0653e11cad','53925a7d-e2a2-48c6-8a1a-c33cceec2368','Accident','Collision mineure','2022-09-08','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b878f0c0-2618-4e5e-823a-fc003d661724','Q-122-1','53925a7d-e2a2-48c6-8a1a-c33cceec2368','auto',393,'2021-06-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('b14cae83-432c-42b0-b86d-2ebac3f7d79f','POL-122-1','53925a7d-e2a2-48c6-8a1a-c33cceec2368','b878f0c0-2618-4e5e-823a-fc003d661724','auto','2021-06-20','2022-06-20',393,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('aaafd7ec-8420-4d0b-b0ef-440c7d57f1b7','Q-122-2','53925a7d-e2a2-48c6-8a1a-c33cceec2368','auto',411,'2026-04-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('cb8bc50f-5621-4bc7-95ea-a8a0accf719a','POL-122-2','53925a7d-e2a2-48c6-8a1a-c33cceec2368','aaafd7ec-8420-4d0b-b0ef-440c7d57f1b7','auto','2026-04-26','2027-04-26',411,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('f2e19c49-1a30-4ceb-b910-2072948de802','INC-122-2-0','cb8bc50f-5621-4bc7-95ea-a8a0accf719a','53925a7d-e2a2-48c6-8a1a-c33cceec2368','Accident','Collision mineure','2022-10-03','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('d81a1ffa-67c5-4483-8df7-03ece2b40128','53925a7d-e2a2-48c6-8a1a-c33cceec2368','Service','Bon service',5);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('fd862a5a-56d8-4199-af2e-3512e48940ae','53925a7d-e2a2-48c6-8a1a-c33cceec2368','Service','Bon service',3);


-- USER 123
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('eba3b134-a72e-4738-ba10-678184536e6d','user123@test.com',crypt('test123', gen_salt('bf')),'client','2022-01-02');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('eba3b134-a72e-4738-ba10-678184536e6d','Lucas','Randria','034000123','Antananarivo','2022-01-02');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('260e6c0a-cb4c-4e12-bf55-452e39fde295','Q-123-0','eba3b134-a72e-4738-ba10-678184536e6d','auto',287,'2023-04-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('16a19e34-2060-44a4-813f-58c0439f3581','POL-123-0','eba3b134-a72e-4738-ba10-678184536e6d','260e6c0a-cb4c-4e12-bf55-452e39fde295','auto','2023-04-04','2024-04-04',287,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8908c59b-ba86-4c6f-b226-d211613ee62b','Q-123-1','eba3b134-a72e-4738-ba10-678184536e6d','auto',478,'2021-04-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('8390ec78-61bc-488b-973d-4d428752bf1c','POL-123-1','eba3b134-a72e-4738-ba10-678184536e6d','8908c59b-ba86-4c6f-b226-d211613ee62b','auto','2021-04-02','2022-04-02',478,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f917a5a8-dfda-4232-8df6-6a1ac1d4065e','Q-123-2','eba3b134-a72e-4738-ba10-678184536e6d','auto',360,'2021-08-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('aa680542-071a-4362-91b3-92c743c75229','POL-123-2','eba3b134-a72e-4738-ba10-678184536e6d','f917a5a8-dfda-4232-8df6-6a1ac1d4065e','auto','2021-08-24','2022-08-24',360,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('285b8b6b-715e-4711-ba28-dfcdcc9ccdd1','INC-123-2-0','aa680542-071a-4362-91b3-92c743c75229','eba3b134-a72e-4738-ba10-678184536e6d','Accident','Collision mineure','2025-05-28','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('17b895ce-bd64-42f0-8d39-fcdb5df234ca','INC-123-2-1','aa680542-071a-4362-91b3-92c743c75229','eba3b134-a72e-4738-ba10-678184536e6d','Accident','Collision mineure','2022-04-21','auto');


-- USER 124
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ea693525-addd-4131-bdf3-8f99ca5deb3e','user124@test.com',crypt('test123', gen_salt('bf')),'client','2026-01-31');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('ea693525-addd-4131-bdf3-8f99ca5deb3e','Jean','Razaf','034000124','Antananarivo','2026-01-31');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3cda8a6e-eace-412a-aaed-0de48f41baec','Q-124-0','ea693525-addd-4131-bdf3-8f99ca5deb3e','auto',441,'2021-01-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('0d91941a-6f21-4535-8fd4-6b45bdb9a5ac','POL-124-0','ea693525-addd-4131-bdf3-8f99ca5deb3e','3cda8a6e-eace-412a-aaed-0de48f41baec','auto','2021-01-11','2022-01-11',441,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('d5677725-da91-4bbc-8394-899de2a84d42','INC-124-0-0','0d91941a-6f21-4535-8fd4-6b45bdb9a5ac','ea693525-addd-4131-bdf3-8f99ca5deb3e','Accident','Collision mineure','2023-06-11','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('334dd1f8-f34c-4224-bdf3-72d768b0f2f5','INC-124-0-1','0d91941a-6f21-4535-8fd4-6b45bdb9a5ac','ea693525-addd-4131-bdf3-8f99ca5deb3e','Accident','Collision mineure','2023-02-05','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('985f8f37-305d-441a-aae9-7f8f5e2c5878','Q-124-1','ea693525-addd-4131-bdf3-8f99ca5deb3e','auto',437,'2020-03-15');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('4fe3bf50-0fd2-4686-94ed-457698681f70','POL-124-1','ea693525-addd-4131-bdf3-8f99ca5deb3e','985f8f37-305d-441a-aae9-7f8f5e2c5878','auto','2020-03-15','2021-03-15',437,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('c4c30a0d-953e-48df-b537-2295483bdc9d','INC-124-1-0','4fe3bf50-0fd2-4686-94ed-457698681f70','ea693525-addd-4131-bdf3-8f99ca5deb3e','Accident','Collision mineure','2026-01-31','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('b3382ae2-33b3-4c88-9cc7-e739e9ab5a68','ea693525-addd-4131-bdf3-8f99ca5deb3e','Service','Bon service',5);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('dd155485-8e6b-4a1f-954c-940c41ef9485','ea693525-addd-4131-bdf3-8f99ca5deb3e','Service','Bon service',5);


-- USER 125
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('2eb41d71-5497-4a96-8d33-7e20551650d1','user125@test.com',crypt('test123', gen_salt('bf')),'client','2020-09-05');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('2eb41d71-5497-4a96-8d33-7e20551650d1','Hery','Rakoto','034000125','Antananarivo','2020-09-05');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8ee6e25d-0b64-4079-b76f-73f768589ae0','Q-125-0','2eb41d71-5497-4a96-8d33-7e20551650d1','auto',480,'2021-04-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('9210c42a-0416-407d-9e6c-f6f7ee8e1802','POL-125-0','2eb41d71-5497-4a96-8d33-7e20551650d1','8ee6e25d-0b64-4079-b76f-73f768589ae0','auto','2021-04-27','2022-04-27',480,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('983986cc-d77d-4e02-bfca-86cf32ea46bf','INC-125-0-0','9210c42a-0416-407d-9e6c-f6f7ee8e1802','2eb41d71-5497-4a96-8d33-7e20551650d1','Accident','Collision mineure','2022-09-09','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('c638ac21-786d-4863-9769-dabff20ccf9a','INC-125-0-1','9210c42a-0416-407d-9e6c-f6f7ee8e1802','2eb41d71-5497-4a96-8d33-7e20551650d1','Accident','Collision mineure','2025-10-30','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('087c30b5-1561-4310-8eff-3e0cf7a1502d','Q-125-1','2eb41d71-5497-4a96-8d33-7e20551650d1','auto',214,'2025-06-18');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('c527a310-9e9d-47fb-8d5e-b9ae7bca0ec4','POL-125-1','2eb41d71-5497-4a96-8d33-7e20551650d1','087c30b5-1561-4310-8eff-3e0cf7a1502d','auto','2025-06-18','2026-06-18',214,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('c77d39a1-1f09-4f88-9be1-49174d68957e','INC-125-1-0','c527a310-9e9d-47fb-8d5e-b9ae7bca0ec4','2eb41d71-5497-4a96-8d33-7e20551650d1','Accident','Collision mineure','2025-02-11','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('d0be303c-736b-4eb8-8549-3dfaea818c7d','INC-125-1-1','c527a310-9e9d-47fb-8d5e-b9ae7bca0ec4','2eb41d71-5497-4a96-8d33-7e20551650d1','Accident','Collision mineure','2021-08-05','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f7ff14fd-f8d0-4bd6-8034-7f0cef82c10d','Q-125-2','2eb41d71-5497-4a96-8d33-7e20551650d1','auto',245,'2021-08-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('1fcb546a-964f-4521-86b8-3ad30393aba2','POL-125-2','2eb41d71-5497-4a96-8d33-7e20551650d1','f7ff14fd-f8d0-4bd6-8034-7f0cef82c10d','auto','2021-08-28','2022-08-28',245,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('fd8a2f91-f7b4-4d6c-947c-f66a21e37729','INC-125-2-0','1fcb546a-964f-4521-86b8-3ad30393aba2','2eb41d71-5497-4a96-8d33-7e20551650d1','Accident','Collision mineure','2021-01-19','auto');


-- USER 126
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('d8d53981-d11e-43c1-b7b4-59089d736e27','user126@test.com',crypt('test123', gen_salt('bf')),'client','2024-02-16');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('d8d53981-d11e-43c1-b7b4-59089d736e27','Mickael','Raharison','034000126','Antananarivo','2024-02-16');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('70523ded-3a86-48ae-8d98-d6fcdcfa099a','Q-126-0','d8d53981-d11e-43c1-b7b4-59089d736e27','auto',71,'2022-01-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('53c3ea88-802a-4719-8a2c-c56b6a19a1f3','POL-126-0','d8d53981-d11e-43c1-b7b4-59089d736e27','70523ded-3a86-48ae-8d98-d6fcdcfa099a','auto','2022-01-22','2023-01-22',71,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('4ea6b494-e50b-49c3-a106-64faad48d6e7','INC-126-0-0','53c3ea88-802a-4719-8a2c-c56b6a19a1f3','d8d53981-d11e-43c1-b7b4-59089d736e27','Accident','Collision mineure','2021-08-18','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('677b89be-1840-4345-a9db-559e99eb8bf4','INC-126-0-1','53c3ea88-802a-4719-8a2c-c56b6a19a1f3','d8d53981-d11e-43c1-b7b4-59089d736e27','Accident','Collision mineure','2023-07-18','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('826be872-b851-4d72-978a-ee804e99e2e9','d8d53981-d11e-43c1-b7b4-59089d736e27','Service','Bon service',4);


-- USER 127
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('b36efd16-9baa-4243-939e-40f19792d623','user127@test.com',crypt('test123', gen_salt('bf')),'client','2020-03-31');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('b36efd16-9baa-4243-939e-40f19792d623','Lucas','Rabe','034000127','Antananarivo','2020-03-31');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('278ae46f-d5dd-40c2-be4b-19da11f3f12e','Q-127-0','b36efd16-9baa-4243-939e-40f19792d623','auto',176,'2025-11-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('1c8a6c7b-670c-4f5b-8695-631cd2ce56f5','POL-127-0','b36efd16-9baa-4243-939e-40f19792d623','278ae46f-d5dd-40c2-be4b-19da11f3f12e','auto','2025-11-13','2026-11-13',176,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('670d3c82-f680-419e-b8b2-041e0fa37e52','INC-127-0-0','1c8a6c7b-670c-4f5b-8695-631cd2ce56f5','b36efd16-9baa-4243-939e-40f19792d623','Accident','Collision mineure','2022-07-25','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('6d9fa96a-d34e-400b-9b20-9bf7b6a2ff9c','b36efd16-9baa-4243-939e-40f19792d623','Service','Bon service',5);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('e2b6ec0c-8dec-4f5d-b20c-1b1689d678df','b36efd16-9baa-4243-939e-40f19792d623','Service','Bon service',2);


-- USER 128
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('f19838d3-f0eb-4ec0-9ed1-13da78ed8f1a','user128@test.com',crypt('test123', gen_salt('bf')),'client','2024-01-15');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('f19838d3-f0eb-4ec0-9ed1-13da78ed8f1a','Jean','Razaf','034000128','Antananarivo','2024-01-15');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('462873ee-2d3c-4347-8bc6-dbf470a7d494','Q-128-0','f19838d3-f0eb-4ec0-9ed1-13da78ed8f1a','auto',461,'2021-04-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('d1a48975-a7c6-4ea3-ada0-5ba08f2ed954','POL-128-0','f19838d3-f0eb-4ec0-9ed1-13da78ed8f1a','462873ee-2d3c-4347-8bc6-dbf470a7d494','auto','2021-04-28','2022-04-28',461,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('cff46b89-fc8f-4e63-9036-b1365fbd08a1','INC-128-0-0','d1a48975-a7c6-4ea3-ada0-5ba08f2ed954','f19838d3-f0eb-4ec0-9ed1-13da78ed8f1a','Accident','Collision mineure','2025-01-05','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('1f725bb5-664f-4cde-896e-61d24d2d3e6c','INC-128-0-1','d1a48975-a7c6-4ea3-ada0-5ba08f2ed954','f19838d3-f0eb-4ec0-9ed1-13da78ed8f1a','Accident','Collision mineure','2025-05-10','auto');


-- USER 129
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('d96cb54f-4e42-47d8-9a28-4df0134d57f4','user129@test.com',crypt('test123', gen_salt('bf')),'client','2021-01-12');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('d96cb54f-4e42-47d8-9a28-4df0134d57f4','Lucas','Rasoa','034000129','Antananarivo','2021-01-12');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0cb2925e-2c00-42c0-baa8-68f4c85d9114','Q-129-0','d96cb54f-4e42-47d8-9a28-4df0134d57f4','auto',190,'2021-09-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('d6aa915a-4c95-4d3e-af33-7371ee1b224a','POL-129-0','d96cb54f-4e42-47d8-9a28-4df0134d57f4','0cb2925e-2c00-42c0-baa8-68f4c85d9114','auto','2021-09-20','2022-09-20',190,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('49f24190-b875-42d5-9826-3e74c27efb71','INC-129-0-0','d6aa915a-4c95-4d3e-af33-7371ee1b224a','d96cb54f-4e42-47d8-9a28-4df0134d57f4','Accident','Collision mineure','2025-05-28','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('cf9ceca1-1a00-49b0-b427-47dfca430750','INC-129-0-1','d6aa915a-4c95-4d3e-af33-7371ee1b224a','d96cb54f-4e42-47d8-9a28-4df0134d57f4','Accident','Collision mineure','2024-09-09','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9482ba17-0b6b-4329-a637-a1c64bbb1d0c','Q-129-1','d96cb54f-4e42-47d8-9a28-4df0134d57f4','auto',183,'2020-03-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('6a89bbd7-ec21-4d88-a15e-9f60f7e03e5e','POL-129-1','d96cb54f-4e42-47d8-9a28-4df0134d57f4','9482ba17-0b6b-4329-a637-a1c64bbb1d0c','auto','2020-03-07','2021-03-07',183,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('2d2b63e8-cb8a-4653-bf1d-34976850125b','INC-129-1-0','6a89bbd7-ec21-4d88-a15e-9f60f7e03e5e','d96cb54f-4e42-47d8-9a28-4df0134d57f4','Accident','Collision mineure','2025-02-17','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('ede3f06b-109d-402c-ba3a-f6a68daf3825','INC-129-1-1','6a89bbd7-ec21-4d88-a15e-9f60f7e03e5e','d96cb54f-4e42-47d8-9a28-4df0134d57f4','Accident','Collision mineure','2026-04-01','auto');


-- USER 130
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('e1bfd67e-055d-424c-9e4a-c06bbec8db00','user130@test.com',crypt('test123', gen_salt('bf')),'client','2025-12-22');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('e1bfd67e-055d-424c-9e4a-c06bbec8db00','Marie','Randria','034000130','Antananarivo','2025-12-22');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('da0c42f6-0a72-4e71-b548-28068fee9736','Q-130-0','e1bfd67e-055d-424c-9e4a-c06bbec8db00','auto',304,'2023-10-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('18e2e85e-a44c-4b38-bf9a-6db4b86c9001','POL-130-0','e1bfd67e-055d-424c-9e4a-c06bbec8db00','da0c42f6-0a72-4e71-b548-28068fee9736','auto','2023-10-22','2024-10-22',304,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('e3f3ed94-8296-4862-9035-04a9f6cd4508','INC-130-0-0','18e2e85e-a44c-4b38-bf9a-6db4b86c9001','e1bfd67e-055d-424c-9e4a-c06bbec8db00','Accident','Collision mineure','2021-06-11','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('f3319d63-8060-4b2e-99ec-4aeb96142c23','e1bfd67e-055d-424c-9e4a-c06bbec8db00','Service','Bon service',5);


-- USER 131
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('6a4dd691-43ac-4185-8b1e-e767e29c8769','user131@test.com',crypt('test123', gen_salt('bf')),'client','2021-09-02');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('6a4dd691-43ac-4185-8b1e-e767e29c8769','Mickael','Rasoa','034000131','Antananarivo','2021-09-02');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b3d56303-6cc0-481c-b89c-243a9e61a0e5','Q-131-0','6a4dd691-43ac-4185-8b1e-e767e29c8769','auto',130,'2022-12-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('c87203b0-e2de-474a-801a-bfc12109657c','POL-131-0','6a4dd691-43ac-4185-8b1e-e767e29c8769','b3d56303-6cc0-481c-b89c-243a9e61a0e5','auto','2022-12-26','2023-12-26',130,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('d7027fe7-e89f-453f-b916-fedd8680b87f','INC-131-0-0','c87203b0-e2de-474a-801a-bfc12109657c','6a4dd691-43ac-4185-8b1e-e767e29c8769','Accident','Collision mineure','2023-04-20','auto');


-- USER 132
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('75a57788-1b8c-4c51-9fe6-fc37bef1ffe3','user132@test.com',crypt('test123', gen_salt('bf')),'client','2020-05-31');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('75a57788-1b8c-4c51-9fe6-fc37bef1ffe3','Mickael','Rabe','034000132','Antananarivo','2020-05-31');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('5f9b756b-9c4c-4201-8ec4-17f320fd6032','Q-132-0','75a57788-1b8c-4c51-9fe6-fc37bef1ffe3','auto',244,'2020-12-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('b9ec7759-7616-4115-9e25-81593b0adba2','POL-132-0','75a57788-1b8c-4c51-9fe6-fc37bef1ffe3','5f9b756b-9c4c-4201-8ec4-17f320fd6032','auto','2020-12-21','2021-12-21',244,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('9548c113-f3a5-4342-9dc6-e7f68752b136','INC-132-0-0','b9ec7759-7616-4115-9e25-81593b0adba2','75a57788-1b8c-4c51-9fe6-fc37bef1ffe3','Accident','Collision mineure','2023-08-26','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('a8b5a576-3cba-4bda-912c-f6be429f91ba','75a57788-1b8c-4c51-9fe6-fc37bef1ffe3','Service','Bon service',2);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('0d027dab-97f1-470a-9cb1-09bc3f7d28d5','75a57788-1b8c-4c51-9fe6-fc37bef1ffe3','Service','Bon service',3);


-- USER 133
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('84b83f06-3f2b-4239-a8fb-1971cc17802f','user133@test.com',crypt('test123', gen_salt('bf')),'client','2024-01-05');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('84b83f06-3f2b-4239-a8fb-1971cc17802f','Aina','Randria','034000133','Antananarivo','2024-01-05');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('509b8133-1269-4d76-a9b9-c37cc3ca6f8d','Q-133-0','84b83f06-3f2b-4239-a8fb-1971cc17802f','auto',488,'2024-11-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('068aa561-f45b-4d12-9bea-3398f25610e5','POL-133-0','84b83f06-3f2b-4239-a8fb-1971cc17802f','509b8133-1269-4d76-a9b9-c37cc3ca6f8d','auto','2024-11-20','2025-11-20',488,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('dac3038c-0198-4776-b07f-58eba71ed243','Q-133-1','84b83f06-3f2b-4239-a8fb-1971cc17802f','auto',224,'2020-09-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('4bc051b9-844d-4126-ae5d-8bed3c19280f','POL-133-1','84b83f06-3f2b-4239-a8fb-1971cc17802f','dac3038c-0198-4776-b07f-58eba71ed243','auto','2020-09-09','2021-09-09',224,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('6b8a9680-4c62-4e88-a2ce-45372553f251','INC-133-1-0','4bc051b9-844d-4126-ae5d-8bed3c19280f','84b83f06-3f2b-4239-a8fb-1971cc17802f','Accident','Collision mineure','2025-03-28','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('57b4da76-555a-4311-bb7d-32a104d76ec9','INC-133-1-1','4bc051b9-844d-4126-ae5d-8bed3c19280f','84b83f06-3f2b-4239-a8fb-1971cc17802f','Accident','Collision mineure','2020-11-10','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('78e3fa32-5ae6-4c10-b8e6-f5461322493e','84b83f06-3f2b-4239-a8fb-1971cc17802f','Service','Bon service',5);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('419251e4-8eda-48db-85ee-433643ca39b5','84b83f06-3f2b-4239-a8fb-1971cc17802f','Service','Bon service',5);


-- USER 134
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('c5c43a88-0764-4e0c-8382-4020c9f40bd9','user134@test.com',crypt('test123', gen_salt('bf')),'client','2025-10-11');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('c5c43a88-0764-4e0c-8382-4020c9f40bd9','Hery','Rabe','034000134','Antananarivo','2025-10-11');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('76544ee7-09b4-4a19-83c3-1e64fcda297e','Q-134-0','c5c43a88-0764-4e0c-8382-4020c9f40bd9','auto',153,'2022-07-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('df2ec1ff-d734-4ead-90ee-bec29c4d8999','POL-134-0','c5c43a88-0764-4e0c-8382-4020c9f40bd9','76544ee7-09b4-4a19-83c3-1e64fcda297e','auto','2022-07-16','2023-07-16',153,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('875a64b1-c40b-43f3-8bca-228abe42bb9a','INC-134-0-0','df2ec1ff-d734-4ead-90ee-bec29c4d8999','c5c43a88-0764-4e0c-8382-4020c9f40bd9','Accident','Collision mineure','2020-08-08','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('8b515d56-2b8f-4ad5-846d-b0b57782552f','INC-134-0-1','df2ec1ff-d734-4ead-90ee-bec29c4d8999','c5c43a88-0764-4e0c-8382-4020c9f40bd9','Accident','Collision mineure','2023-01-21','auto');


-- USER 135
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('afc0438b-a2db-4679-a830-56f71b024e5c','user135@test.com',crypt('test123', gen_salt('bf')),'client','2025-07-22');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('afc0438b-a2db-4679-a830-56f71b024e5c','Mickael','Rabe','034000135','Antananarivo','2025-07-22');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ea6edca9-cbb8-49d2-9e19-a0b5a7a7aa7b','Q-135-0','afc0438b-a2db-4679-a830-56f71b024e5c','auto',263,'2022-10-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('16a9ebb5-4cda-4c23-bf85-f8759e194075','POL-135-0','afc0438b-a2db-4679-a830-56f71b024e5c','ea6edca9-cbb8-49d2-9e19-a0b5a7a7aa7b','auto','2022-10-26','2023-10-26',263,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('1ac23293-2a26-45f6-adfa-46f9d27160e9','afc0438b-a2db-4679-a830-56f71b024e5c','Service','Bon service',3);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('2a3b8dd5-4109-4226-8018-03b0a994978f','afc0438b-a2db-4679-a830-56f71b024e5c','Service','Bon service',2);


-- USER 136
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('2fcd58bf-53f7-458d-945d-22b7e1b923a4','user136@test.com',crypt('test123', gen_salt('bf')),'client','2022-09-28');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('2fcd58bf-53f7-458d-945d-22b7e1b923a4','Tiana','Raharison','034000136','Antananarivo','2022-09-28');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('fb0b033f-9c62-4713-8d9b-c48aa834d2b0','Q-136-0','2fcd58bf-53f7-458d-945d-22b7e1b923a4','auto',473,'2023-07-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('f721b137-12e3-4bc4-8a08-a79fc6f4c380','POL-136-0','2fcd58bf-53f7-458d-945d-22b7e1b923a4','fb0b033f-9c62-4713-8d9b-c48aa834d2b0','auto','2023-07-30','2024-07-30',473,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('5e83ac5d-8248-45bc-a88b-f4f0b5c9bb78','INC-136-0-0','f721b137-12e3-4bc4-8a08-a79fc6f4c380','2fcd58bf-53f7-458d-945d-22b7e1b923a4','Accident','Collision mineure','2024-11-26','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('88090625-b655-460e-a896-b24cad354beb','Q-136-1','2fcd58bf-53f7-458d-945d-22b7e1b923a4','auto',196,'2022-02-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('30cfe6b7-3122-4b21-8ad1-671997009052','POL-136-1','2fcd58bf-53f7-458d-945d-22b7e1b923a4','88090625-b655-460e-a896-b24cad354beb','auto','2022-02-14','2023-02-14',196,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b9c38bcd-ea02-42f8-b815-6ab127cef9ff','Q-136-2','2fcd58bf-53f7-458d-945d-22b7e1b923a4','auto',487,'2024-06-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('c00a11ec-d596-4092-b486-56e3295cae4b','POL-136-2','2fcd58bf-53f7-458d-945d-22b7e1b923a4','b9c38bcd-ea02-42f8-b815-6ab127cef9ff','auto','2024-06-27','2025-06-27',487,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('a0d740a8-93c6-41ef-9fa4-fd0c6c2d2805','INC-136-2-0','c00a11ec-d596-4092-b486-56e3295cae4b','2fcd58bf-53f7-458d-945d-22b7e1b923a4','Accident','Collision mineure','2026-01-18','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('d1d78a30-ef1a-4936-b8b7-1f09ff35ab8c','INC-136-2-1','c00a11ec-d596-4092-b486-56e3295cae4b','2fcd58bf-53f7-458d-945d-22b7e1b923a4','Accident','Collision mineure','2024-03-24','auto');


-- USER 137
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('68486fe6-b32a-441b-b84d-300014e13d16','user137@test.com',crypt('test123', gen_salt('bf')),'client','2020-01-30');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('68486fe6-b32a-441b-b84d-300014e13d16','Tiana','Raharison','034000137','Antananarivo','2020-01-30');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('cf0aafb7-11da-4a7d-8d82-9705ff662deb','Q-137-0','68486fe6-b32a-441b-b84d-300014e13d16','auto',184,'2024-10-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('abfb46b4-458c-48fc-bb29-f697229106f4','POL-137-0','68486fe6-b32a-441b-b84d-300014e13d16','cf0aafb7-11da-4a7d-8d82-9705ff662deb','auto','2024-10-19','2025-10-19',184,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('844d9faa-598a-4354-82d1-442e32ac0db6','INC-137-0-0','abfb46b4-458c-48fc-bb29-f697229106f4','68486fe6-b32a-441b-b84d-300014e13d16','Accident','Collision mineure','2020-07-09','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('ccbc92dd-80c4-459e-93d1-b0f84af41130','INC-137-0-1','abfb46b4-458c-48fc-bb29-f697229106f4','68486fe6-b32a-441b-b84d-300014e13d16','Accident','Collision mineure','2020-09-16','auto');


-- USER 138
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('9cb12313-99fe-41ff-99c7-cb2f0d25f07c','user138@test.com',crypt('test123', gen_salt('bf')),'client','2023-12-17');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('9cb12313-99fe-41ff-99c7-cb2f0d25f07c','Lina','Rakoto','034000138','Antananarivo','2023-12-17');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9cfcdb86-87fe-483e-aadd-9fb37f12f5f1','Q-138-0','9cb12313-99fe-41ff-99c7-cb2f0d25f07c','auto',361,'2023-12-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('3867045d-46df-4fc4-b253-4cbad30eef6d','POL-138-0','9cb12313-99fe-41ff-99c7-cb2f0d25f07c','9cfcdb86-87fe-483e-aadd-9fb37f12f5f1','auto','2023-12-26','2024-12-26',361,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f33b0262-75b6-4e97-8a1d-eac5a6255484','Q-138-1','9cb12313-99fe-41ff-99c7-cb2f0d25f07c','auto',347,'2021-01-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('8b1d6bbc-3647-4453-bf1b-9a8fe61c3e8f','POL-138-1','9cb12313-99fe-41ff-99c7-cb2f0d25f07c','f33b0262-75b6-4e97-8a1d-eac5a6255484','auto','2021-01-30','2022-01-30',347,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('37103ae5-0b6b-41b6-ab4b-5bd5586707ee','INC-138-1-0','8b1d6bbc-3647-4453-bf1b-9a8fe61c3e8f','9cb12313-99fe-41ff-99c7-cb2f0d25f07c','Accident','Collision mineure','2024-11-22','auto');


-- USER 139
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('5fa50e0e-7422-4068-9158-30cc1398dc64','user139@test.com',crypt('test123', gen_salt('bf')),'client','2022-03-21');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('5fa50e0e-7422-4068-9158-30cc1398dc64','Paul','Rakotovao','034000139','Antananarivo','2022-03-21');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c8a0306c-ac3e-428b-8b95-3598990bf7d9','Q-139-0','5fa50e0e-7422-4068-9158-30cc1398dc64','auto',378,'2023-03-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('8cfb8b28-4198-44b2-98a3-390e6ed1023f','POL-139-0','5fa50e0e-7422-4068-9158-30cc1398dc64','c8a0306c-ac3e-428b-8b95-3598990bf7d9','auto','2023-03-27','2024-03-27',378,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('ccce1ece-e727-469c-8344-df6bc94b7f6f','INC-139-0-0','8cfb8b28-4198-44b2-98a3-390e6ed1023f','5fa50e0e-7422-4068-9158-30cc1398dc64','Accident','Collision mineure','2023-01-18','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('774a5546-bc58-444a-8bdb-a64050a457ba','INC-139-0-1','8cfb8b28-4198-44b2-98a3-390e6ed1023f','5fa50e0e-7422-4068-9158-30cc1398dc64','Accident','Collision mineure','2020-10-09','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('6f81af89-b5f1-4664-b1b1-d37ff38b71b1','5fa50e0e-7422-4068-9158-30cc1398dc64','Service','Bon service',2);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('a8f04d48-106f-4952-800e-6be6b9d2cdb3','5fa50e0e-7422-4068-9158-30cc1398dc64','Service','Bon service',2);


-- USER 140
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('8ba9f049-14fb-4a14-a102-5a3b7a9d38f4','user140@test.com',crypt('test123', gen_salt('bf')),'client','2025-08-31');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('8ba9f049-14fb-4a14-a102-5a3b7a9d38f4','Jean','Rasoa','034000140','Antananarivo','2025-08-31');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2e6126b2-0350-464d-a03b-96464a13881b','Q-140-0','8ba9f049-14fb-4a14-a102-5a3b7a9d38f4','auto',355,'2025-06-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('ed7272bf-48fb-4ddb-b6c5-27067ace90af','POL-140-0','8ba9f049-14fb-4a14-a102-5a3b7a9d38f4','2e6126b2-0350-464d-a03b-96464a13881b','auto','2025-06-20','2026-06-20',355,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('00e37da9-c38c-4bbc-8be2-0f56949bf03b','INC-140-0-0','ed7272bf-48fb-4ddb-b6c5-27067ace90af','8ba9f049-14fb-4a14-a102-5a3b7a9d38f4','Accident','Collision mineure','2020-04-01','auto');


-- USER 141
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('8c35b267-eed7-4067-9f46-8a0a4decb677','user141@test.com',crypt('test123', gen_salt('bf')),'client','2021-07-04');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('8c35b267-eed7-4067-9f46-8a0a4decb677','Lina','Rakoto','034000141','Antananarivo','2021-07-04');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c94f6338-737c-4959-816d-c2a0033c0bd6','Q-141-0','8c35b267-eed7-4067-9f46-8a0a4decb677','auto',227,'2021-01-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('ace5d515-a360-4831-9f0e-0251d726bc8e','POL-141-0','8c35b267-eed7-4067-9f46-8a0a4decb677','c94f6338-737c-4959-816d-c2a0033c0bd6','auto','2021-01-24','2022-01-24',227,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('9a378062-67cf-4bde-8c7d-b0b2d4b19a1b','INC-141-0-0','ace5d515-a360-4831-9f0e-0251d726bc8e','8c35b267-eed7-4067-9f46-8a0a4decb677','Accident','Collision mineure','2023-11-08','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('150a5edc-01f4-431f-92b8-ef8153a2fc3f','INC-141-0-1','ace5d515-a360-4831-9f0e-0251d726bc8e','8c35b267-eed7-4067-9f46-8a0a4decb677','Accident','Collision mineure','2022-09-30','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8d89a1da-4199-4b45-8b13-9d49710910b5','Q-141-1','8c35b267-eed7-4067-9f46-8a0a4decb677','auto',160,'2025-10-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('c8d3fb2e-32d7-4005-ab4f-0fcd88c4f8cb','POL-141-1','8c35b267-eed7-4067-9f46-8a0a4decb677','8d89a1da-4199-4b45-8b13-9d49710910b5','auto','2025-10-19','2026-10-19',160,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('c1c290e3-12b8-4075-8b82-8fa7854d253c','INC-141-1-0','c8d3fb2e-32d7-4005-ab4f-0fcd88c4f8cb','8c35b267-eed7-4067-9f46-8a0a4decb677','Accident','Collision mineure','2025-05-10','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('96f4c5d5-888e-4307-9938-139edb1e7e43','Q-141-2','8c35b267-eed7-4067-9f46-8a0a4decb677','auto',185,'2020-09-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('6a125198-60e9-4c3e-9f26-f6da5a14bb4d','POL-141-2','8c35b267-eed7-4067-9f46-8a0a4decb677','96f4c5d5-888e-4307-9938-139edb1e7e43','auto','2020-09-04','2021-09-04',185,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('54cfa68d-2bbd-4d11-aa3b-43b207ca0b34','INC-141-2-0','6a125198-60e9-4c3e-9f26-f6da5a14bb4d','8c35b267-eed7-4067-9f46-8a0a4decb677','Accident','Collision mineure','2023-11-16','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('cf826152-f94c-4e15-a186-403d00a2f67e','8c35b267-eed7-4067-9f46-8a0a4decb677','Service','Bon service',3);


-- USER 142
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('e71988c3-4026-4efd-8039-9406b9bb3bcc','user142@test.com',crypt('test123', gen_salt('bf')),'client','2023-10-29');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('e71988c3-4026-4efd-8039-9406b9bb3bcc','Sofia','Razaf','034000142','Antananarivo','2023-10-29');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f8f3e145-23d6-446e-97ed-b4d9b067add6','Q-142-0','e71988c3-4026-4efd-8039-9406b9bb3bcc','auto',224,'2025-09-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('18a63a87-09fe-4afb-9965-b357ce095f4d','POL-142-0','e71988c3-4026-4efd-8039-9406b9bb3bcc','f8f3e145-23d6-446e-97ed-b4d9b067add6','auto','2025-09-20','2026-09-20',224,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('8ea0a083-c9a5-457a-bbd3-618fd7ece1e5','INC-142-0-0','18a63a87-09fe-4afb-9965-b357ce095f4d','e71988c3-4026-4efd-8039-9406b9bb3bcc','Accident','Collision mineure','2023-03-04','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ccf70d3f-0493-4cf6-84dc-436acd39f008','Q-142-1','e71988c3-4026-4efd-8039-9406b9bb3bcc','auto',493,'2025-04-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('abeebe92-1491-4a7f-bc6a-8e339829c77e','POL-142-1','e71988c3-4026-4efd-8039-9406b9bb3bcc','ccf70d3f-0493-4cf6-84dc-436acd39f008','auto','2025-04-30','2026-04-30',493,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('5ac95586-3ffe-4fe3-9b4c-cc7799763993','INC-142-1-0','abeebe92-1491-4a7f-bc6a-8e339829c77e','e71988c3-4026-4efd-8039-9406b9bb3bcc','Accident','Collision mineure','2023-12-22','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('5652be15-a962-4929-8008-f9e27aa64baf','INC-142-1-1','abeebe92-1491-4a7f-bc6a-8e339829c77e','e71988c3-4026-4efd-8039-9406b9bb3bcc','Accident','Collision mineure','2023-03-19','auto');


-- USER 143
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('22ab2625-27db-40cc-88de-a1f292241147','user143@test.com',crypt('test123', gen_salt('bf')),'client','2024-03-19');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('22ab2625-27db-40cc-88de-a1f292241147','Mickael','Andri','034000143','Antananarivo','2024-03-19');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1e006f27-7a07-408e-826e-28e1298d3266','Q-143-0','22ab2625-27db-40cc-88de-a1f292241147','auto',491,'2024-08-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('5a91462e-bd78-4444-aa29-10bbc9280304','POL-143-0','22ab2625-27db-40cc-88de-a1f292241147','1e006f27-7a07-408e-826e-28e1298d3266','auto','2024-08-20','2025-08-20',491,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('4bfcaa47-e633-44a3-9b3a-1f2de4d94108','Q-143-1','22ab2625-27db-40cc-88de-a1f292241147','auto',274,'2023-12-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('4d17ed1b-ad19-4fb0-98b3-ad935591126f','POL-143-1','22ab2625-27db-40cc-88de-a1f292241147','4bfcaa47-e633-44a3-9b3a-1f2de4d94108','auto','2023-12-30','2024-12-30',274,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('b3da504b-c898-45a0-9b90-032a905d5f14','INC-143-1-0','4d17ed1b-ad19-4fb0-98b3-ad935591126f','22ab2625-27db-40cc-88de-a1f292241147','Accident','Collision mineure','2023-06-13','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0dfd79f0-8455-4966-b25d-ae3c545a3bd7','Q-143-2','22ab2625-27db-40cc-88de-a1f292241147','auto',186,'2020-03-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('90609b56-850d-4311-ba8e-d0552e85614c','POL-143-2','22ab2625-27db-40cc-88de-a1f292241147','0dfd79f0-8455-4966-b25d-ae3c545a3bd7','auto','2020-03-17','2021-03-17',186,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('5314f650-3162-4256-afaf-f8002d5d5223','INC-143-2-0','90609b56-850d-4311-ba8e-d0552e85614c','22ab2625-27db-40cc-88de-a1f292241147','Accident','Collision mineure','2021-09-16','auto');


-- USER 144
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('c73119b8-beeb-430e-b0dc-a6fb9b4a99ec','user144@test.com',crypt('test123', gen_salt('bf')),'client','2022-08-26');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('c73119b8-beeb-430e-b0dc-a6fb9b4a99ec','Sofia','Rasoa','034000144','Antananarivo','2022-08-26');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8ffe107d-b505-440d-89fc-c691f8d8c0fe','Q-144-0','c73119b8-beeb-430e-b0dc-a6fb9b4a99ec','auto',257,'2023-09-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('ef4bc90d-872a-4348-ab98-31c623f8d795','POL-144-0','c73119b8-beeb-430e-b0dc-a6fb9b4a99ec','8ffe107d-b505-440d-89fc-c691f8d8c0fe','auto','2023-09-14','2024-09-14',257,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('80c60761-817c-41b7-adc8-dfa8efc0fb32','Q-144-1','c73119b8-beeb-430e-b0dc-a6fb9b4a99ec','auto',413,'2025-12-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('67e835f6-df04-4c0e-8387-f3031aefb3de','POL-144-1','c73119b8-beeb-430e-b0dc-a6fb9b4a99ec','80c60761-817c-41b7-adc8-dfa8efc0fb32','auto','2025-12-01','2026-12-01',413,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('2ce9de17-0e95-4bb1-9c76-b2b53ffd0ab9','INC-144-1-0','67e835f6-df04-4c0e-8387-f3031aefb3de','c73119b8-beeb-430e-b0dc-a6fb9b4a99ec','Accident','Collision mineure','2022-02-17','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('cb3c877f-2c72-4717-816d-b4c408af5bf7','INC-144-1-1','67e835f6-df04-4c0e-8387-f3031aefb3de','c73119b8-beeb-430e-b0dc-a6fb9b4a99ec','Accident','Collision mineure','2024-11-03','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('29af36cc-e407-4b4f-87ba-567af853f9b5','c73119b8-beeb-430e-b0dc-a6fb9b4a99ec','Service','Bon service',5);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('b4953997-1bfd-4ef2-822c-b80bc14ced1e','c73119b8-beeb-430e-b0dc-a6fb9b4a99ec','Service','Bon service',3);


-- USER 145
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('7b49c5a5-6cc3-4fa6-aac5-c6363ba3c261','user145@test.com',crypt('test123', gen_salt('bf')),'client','2023-09-16');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('7b49c5a5-6cc3-4fa6-aac5-c6363ba3c261','Jean','Raharison','034000145','Antananarivo','2023-09-16');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('6f5b05ca-d787-4a0e-83e3-47c61fdaef94','Q-145-0','7b49c5a5-6cc3-4fa6-aac5-c6363ba3c261','auto',466,'2024-12-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('b5081344-2baa-4740-8725-9aa198c9a327','POL-145-0','7b49c5a5-6cc3-4fa6-aac5-c6363ba3c261','6f5b05ca-d787-4a0e-83e3-47c61fdaef94','auto','2024-12-13','2025-12-13',466,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('4a0abc46-ac03-42a9-9d00-42820ce3802a','Q-145-1','7b49c5a5-6cc3-4fa6-aac5-c6363ba3c261','auto',295,'2026-02-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('5768e3bb-2e0b-4262-b6c9-d6d61b296005','POL-145-1','7b49c5a5-6cc3-4fa6-aac5-c6363ba3c261','4a0abc46-ac03-42a9-9d00-42820ce3802a','auto','2026-02-11','2027-02-11',295,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('26656b06-db4f-4c7f-917d-c91f6e8ac3e9','INC-145-1-0','5768e3bb-2e0b-4262-b6c9-d6d61b296005','7b49c5a5-6cc3-4fa6-aac5-c6363ba3c261','Accident','Collision mineure','2024-06-09','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('891b0591-870f-47cd-82c8-08b31e7cf9b0','Q-145-2','7b49c5a5-6cc3-4fa6-aac5-c6363ba3c261','auto',270,'2021-05-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('3b009f70-c91b-4da9-88df-4e30855ee8cd','POL-145-2','7b49c5a5-6cc3-4fa6-aac5-c6363ba3c261','891b0591-870f-47cd-82c8-08b31e7cf9b0','auto','2021-05-11','2022-05-11',270,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('e4ac510c-4410-49b7-919e-e209d471c805','INC-145-2-0','3b009f70-c91b-4da9-88df-4e30855ee8cd','7b49c5a5-6cc3-4fa6-aac5-c6363ba3c261','Accident','Collision mineure','2023-12-31','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('26f8f69b-667d-4a72-b033-415fd1fb03c7','7b49c5a5-6cc3-4fa6-aac5-c6363ba3c261','Service','Bon service',2);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('91862ac8-92c9-42a7-8f75-574ccd448d39','7b49c5a5-6cc3-4fa6-aac5-c6363ba3c261','Service','Bon service',3);


-- USER 146
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('0c1c28ac-2533-469f-a8b3-c1a6e39ad1d2','user146@test.com',crypt('test123', gen_salt('bf')),'client','2020-01-07');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('0c1c28ac-2533-469f-a8b3-c1a6e39ad1d2','Paul','Rakoto','034000146','Antananarivo','2020-01-07');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('90f755e3-a86d-49f9-aafc-138c21740fd8','Q-146-0','0c1c28ac-2533-469f-a8b3-c1a6e39ad1d2','auto',140,'2023-09-18');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('5f105cad-c933-4a68-8bc1-ec3dfca4fcc1','POL-146-0','0c1c28ac-2533-469f-a8b3-c1a6e39ad1d2','90f755e3-a86d-49f9-aafc-138c21740fd8','auto','2023-09-18','2024-09-18',140,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('8953b057-330e-41e4-9baf-7a866c05080f','INC-146-0-0','5f105cad-c933-4a68-8bc1-ec3dfca4fcc1','0c1c28ac-2533-469f-a8b3-c1a6e39ad1d2','Accident','Collision mineure','2022-03-15','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('6a99484b-c68d-4f6d-8001-40887b1d1539','0c1c28ac-2533-469f-a8b3-c1a6e39ad1d2','Service','Bon service',3);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('aa2dd68d-1f18-4df6-b7cf-545f777eb461','0c1c28ac-2533-469f-a8b3-c1a6e39ad1d2','Service','Bon service',2);


-- USER 147
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('04b99e7b-f2c6-434e-a03e-b09e95a705a8','user147@test.com',crypt('test123', gen_salt('bf')),'client','2022-07-25');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('04b99e7b-f2c6-434e-a03e-b09e95a705a8','Hery','Randria','034000147','Antananarivo','2022-07-25');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('97e7e734-79c7-4c6c-9c38-489e1dc124bf','Q-147-0','04b99e7b-f2c6-434e-a03e-b09e95a705a8','auto',64,'2025-10-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('af2915ff-f473-44a9-8446-793677cf4703','POL-147-0','04b99e7b-f2c6-434e-a03e-b09e95a705a8','97e7e734-79c7-4c6c-9c38-489e1dc124bf','auto','2025-10-02','2026-10-02',64,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('97264e77-e329-4f7c-97b5-e6188795f7a5','Q-147-1','04b99e7b-f2c6-434e-a03e-b09e95a705a8','auto',198,'2023-01-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('80b770bd-5d69-4cb7-80e3-2d229f9b05bd','POL-147-1','04b99e7b-f2c6-434e-a03e-b09e95a705a8','97264e77-e329-4f7c-97b5-e6188795f7a5','auto','2023-01-08','2024-01-08',198,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('68e02d65-542e-4b60-8b6d-35d7ec5467d1','INC-147-1-0','80b770bd-5d69-4cb7-80e3-2d229f9b05bd','04b99e7b-f2c6-434e-a03e-b09e95a705a8','Accident','Collision mineure','2025-12-12','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('e6cfe53d-1e51-49b4-9337-a00abc60d966','INC-147-1-1','80b770bd-5d69-4cb7-80e3-2d229f9b05bd','04b99e7b-f2c6-434e-a03e-b09e95a705a8','Accident','Collision mineure','2024-08-14','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('20d23075-c3e1-4a90-bc02-e4c564623c13','04b99e7b-f2c6-434e-a03e-b09e95a705a8','Service','Bon service',2);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('fdad75cd-0d9a-4763-80c7-7d4793f8a103','04b99e7b-f2c6-434e-a03e-b09e95a705a8','Service','Bon service',2);


-- USER 148
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('b771d1ff-21f5-45e1-b3bf-de4e6ab0cd5a','user148@test.com',crypt('test123', gen_salt('bf')),'client','2024-01-23');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('b771d1ff-21f5-45e1-b3bf-de4e6ab0cd5a','Hery','Rakotovao','034000148','Antananarivo','2024-01-23');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('6da3f682-f4f1-4b16-941f-a73bed064df8','Q-148-0','b771d1ff-21f5-45e1-b3bf-de4e6ab0cd5a','auto',379,'2025-01-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('4fefcee7-89de-4b0f-b646-e329041dd428','POL-148-0','b771d1ff-21f5-45e1-b3bf-de4e6ab0cd5a','6da3f682-f4f1-4b16-941f-a73bed064df8','auto','2025-01-27','2026-01-27',379,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9bb439ec-e356-42ee-9cc1-9af4f78f075f','Q-148-1','b771d1ff-21f5-45e1-b3bf-de4e6ab0cd5a','auto',66,'2023-11-18');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('babafb7c-5073-4b8d-9017-142f6b780801','POL-148-1','b771d1ff-21f5-45e1-b3bf-de4e6ab0cd5a','9bb439ec-e356-42ee-9cc1-9af4f78f075f','auto','2023-11-18','2024-11-18',66,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('34633790-1761-4cfa-9578-d63df74c2325','INC-148-1-0','babafb7c-5073-4b8d-9017-142f6b780801','b771d1ff-21f5-45e1-b3bf-de4e6ab0cd5a','Accident','Collision mineure','2022-08-28','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('ee887ae9-2e8f-4fb4-9147-9cb6444efa63','INC-148-1-1','babafb7c-5073-4b8d-9017-142f6b780801','b771d1ff-21f5-45e1-b3bf-de4e6ab0cd5a','Accident','Collision mineure','2024-12-13','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('c90a98a1-34e2-4b28-8c26-91305bb0a85b','b771d1ff-21f5-45e1-b3bf-de4e6ab0cd5a','Service','Bon service',5);


-- USER 149
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('031cda7f-2d19-426f-b410-54a8c6fcfa96','user149@test.com',crypt('test123', gen_salt('bf')),'client','2026-04-24');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('031cda7f-2d19-426f-b410-54a8c6fcfa96','Aina','Raharison','034000149','Antananarivo','2026-04-24');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1a3e5120-3397-464d-b1ec-1b0cc5e872f3','Q-149-0','031cda7f-2d19-426f-b410-54a8c6fcfa96','auto',198,'2024-10-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('4923568d-390e-4a0c-b63f-4299dbfef647','POL-149-0','031cda7f-2d19-426f-b410-54a8c6fcfa96','1a3e5120-3397-464d-b1ec-1b0cc5e872f3','auto','2024-10-12','2025-10-12',198,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('342b903d-51aa-4f36-8980-fdeeee7ec184','INC-149-0-0','4923568d-390e-4a0c-b63f-4299dbfef647','031cda7f-2d19-426f-b410-54a8c6fcfa96','Accident','Collision mineure','2023-08-06','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('166a92a4-a76b-4bd1-bb46-51772b50e016','Q-149-1','031cda7f-2d19-426f-b410-54a8c6fcfa96','auto',369,'2024-07-26');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('29f581c7-69b8-4f30-b3cf-5d49e933f704','POL-149-1','031cda7f-2d19-426f-b410-54a8c6fcfa96','166a92a4-a76b-4bd1-bb46-51772b50e016','auto','2024-07-26','2025-07-26',369,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('f436c172-21ef-462a-8fdf-5258fefc446a','INC-149-1-0','29f581c7-69b8-4f30-b3cf-5d49e933f704','031cda7f-2d19-426f-b410-54a8c6fcfa96','Accident','Collision mineure','2021-08-18','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('2791ae8a-f7cf-42cf-9085-31563c164fed','INC-149-1-1','29f581c7-69b8-4f30-b3cf-5d49e933f704','031cda7f-2d19-426f-b410-54a8c6fcfa96','Accident','Collision mineure','2023-12-27','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('7002f609-7b8b-45b1-acfc-856e38c70c88','031cda7f-2d19-426f-b410-54a8c6fcfa96','Service','Bon service',3);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('8851be1f-db03-4651-9c2d-931ba0a0469e','031cda7f-2d19-426f-b410-54a8c6fcfa96','Service','Bon service',5);


-- USER 150
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('5eea800f-2d31-44f0-8be1-c8922566aa49','user150@test.com',crypt('test123', gen_salt('bf')),'client','2024-01-28');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('5eea800f-2d31-44f0-8be1-c8922566aa49','Lucas','Rabe','034000150','Antananarivo','2024-01-28');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e37bb4d6-8ccd-4a22-9e73-c40cc985a2a6','Q-150-0','5eea800f-2d31-44f0-8be1-c8922566aa49','auto',353,'2025-04-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('2b081ef8-e981-486a-a3e8-2f64ef008705','POL-150-0','5eea800f-2d31-44f0-8be1-c8922566aa49','e37bb4d6-8ccd-4a22-9e73-c40cc985a2a6','auto','2025-04-10','2026-04-10',353,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('f4f7daf6-93f4-4893-ad18-d16cbe5cd78b','INC-150-0-0','2b081ef8-e981-486a-a3e8-2f64ef008705','5eea800f-2d31-44f0-8be1-c8922566aa49','Accident','Collision mineure','2020-04-16','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8169a859-ba24-4ac8-acbb-8b04a213b8ba','Q-150-1','5eea800f-2d31-44f0-8be1-c8922566aa49','auto',483,'2020-06-29');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('76bcf95e-535a-44ba-8f57-d879cd5b7ff5','POL-150-1','5eea800f-2d31-44f0-8be1-c8922566aa49','8169a859-ba24-4ac8-acbb-8b04a213b8ba','auto','2020-06-29','2021-06-29',483,10,'full');


-- USER 151
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('6b782790-5c0f-4d01-990e-856d1d799735','user151@test.com',crypt('test123', gen_salt('bf')),'client','2021-11-27');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('6b782790-5c0f-4d01-990e-856d1d799735','Paul','Randria','034000151','Antananarivo','2021-11-27');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d062c498-a614-45ca-bce7-5898c8bc268d','Q-151-0','6b782790-5c0f-4d01-990e-856d1d799735','auto',406,'2025-02-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('6c4ba8ed-76df-47da-8070-4cee44e9c9e8','POL-151-0','6b782790-5c0f-4d01-990e-856d1d799735','d062c498-a614-45ca-bce7-5898c8bc268d','auto','2025-02-27','2026-02-27',406,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('774ddae2-fdd5-41ed-a522-113b1f8350e6','INC-151-0-0','6c4ba8ed-76df-47da-8070-4cee44e9c9e8','6b782790-5c0f-4d01-990e-856d1d799735','Accident','Collision mineure','2022-02-28','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('d25bce44-2cce-47b5-a9ef-796fd0f3ec6c','INC-151-0-1','6c4ba8ed-76df-47da-8070-4cee44e9c9e8','6b782790-5c0f-4d01-990e-856d1d799735','Accident','Collision mineure','2024-08-07','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('92e26101-996d-4692-a80d-c18c3448fa50','Q-151-1','6b782790-5c0f-4d01-990e-856d1d799735','auto',231,'2024-12-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('7e2d232d-6109-4997-8a4f-8e90fa652859','POL-151-1','6b782790-5c0f-4d01-990e-856d1d799735','92e26101-996d-4692-a80d-c18c3448fa50','auto','2024-12-20','2025-12-20',231,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('8d384886-c6f4-4d29-8925-da0d5a90081a','INC-151-1-0','7e2d232d-6109-4997-8a4f-8e90fa652859','6b782790-5c0f-4d01-990e-856d1d799735','Accident','Collision mineure','2022-05-18','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('c4fbf7f4-ef96-436c-a015-60605b08564a','INC-151-1-1','7e2d232d-6109-4997-8a4f-8e90fa652859','6b782790-5c0f-4d01-990e-856d1d799735','Accident','Collision mineure','2020-02-27','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('5ed2f426-932a-4d0c-a8c7-f75581bc88da','Q-151-2','6b782790-5c0f-4d01-990e-856d1d799735','auto',481,'2020-06-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('39b508f9-d5b3-4127-812b-1312335d88a5','POL-151-2','6b782790-5c0f-4d01-990e-856d1d799735','5ed2f426-932a-4d0c-a8c7-f75581bc88da','auto','2020-06-25','2021-06-25',481,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('eaedcc12-416b-4138-bb41-46264ca87344','INC-151-2-0','39b508f9-d5b3-4127-812b-1312335d88a5','6b782790-5c0f-4d01-990e-856d1d799735','Accident','Collision mineure','2021-02-03','auto');


-- USER 152
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('ed4e24c2-33c4-40ab-8eb7-5b5e23c7a26c','user152@test.com',crypt('test123', gen_salt('bf')),'client','2022-10-17');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('ed4e24c2-33c4-40ab-8eb7-5b5e23c7a26c','Hery','Razaf','034000152','Antananarivo','2022-10-17');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('cb3bfcb3-ad13-4eb5-b87c-07600c2f038a','Q-152-0','ed4e24c2-33c4-40ab-8eb7-5b5e23c7a26c','auto',453,'2021-06-27');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('abbc0a7e-d18f-45a1-a1c0-2dfa0580967d','POL-152-0','ed4e24c2-33c4-40ab-8eb7-5b5e23c7a26c','cb3bfcb3-ad13-4eb5-b87c-07600c2f038a','auto','2021-06-27','2022-06-27',453,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('6fd2e029-fb74-4558-afcc-d23a322eb1dd','INC-152-0-0','abbc0a7e-d18f-45a1-a1c0-2dfa0580967d','ed4e24c2-33c4-40ab-8eb7-5b5e23c7a26c','Accident','Collision mineure','2024-09-14','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('8ef44e4b-c22e-4a71-bfdd-b6ca6d358859','INC-152-0-1','abbc0a7e-d18f-45a1-a1c0-2dfa0580967d','ed4e24c2-33c4-40ab-8eb7-5b5e23c7a26c','Accident','Collision mineure','2020-04-25','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('4ab16d69-27e5-4918-a4df-dad3ea91a684','ed4e24c2-33c4-40ab-8eb7-5b5e23c7a26c','Service','Bon service',4);


-- USER 153
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('796cc44c-e377-41e0-979d-00df5987a137','user153@test.com',crypt('test123', gen_salt('bf')),'client','2024-07-07');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('796cc44c-e377-41e0-979d-00df5987a137','Tiana','Randria','034000153','Antananarivo','2024-07-07');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('64c8e3ce-bcca-49f2-84bc-1b2c648f5953','Q-153-0','796cc44c-e377-41e0-979d-00df5987a137','auto',352,'2025-09-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('82f95985-85b7-4dc9-b057-4d66bcf96d65','POL-153-0','796cc44c-e377-41e0-979d-00df5987a137','64c8e3ce-bcca-49f2-84bc-1b2c648f5953','auto','2025-09-14','2026-09-14',352,10,'full');


-- USER 154
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('c7fd6387-2947-4d24-96b6-383101452081','user154@test.com',crypt('test123', gen_salt('bf')),'client','2022-05-30');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('c7fd6387-2947-4d24-96b6-383101452081','Marie','Randria','034000154','Antananarivo','2022-05-30');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f5077aca-5909-4c2e-a17e-cd272ef2575e','Q-154-0','c7fd6387-2947-4d24-96b6-383101452081','auto',378,'2024-07-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('3093fd9c-c12b-4424-aadf-4a0adb6b0cf0','POL-154-0','c7fd6387-2947-4d24-96b6-383101452081','f5077aca-5909-4c2e-a17e-cd272ef2575e','auto','2024-07-07','2025-07-07',378,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('19329892-249e-44d5-88c2-b3b30b661ced','INC-154-0-0','3093fd9c-c12b-4424-aadf-4a0adb6b0cf0','c7fd6387-2947-4d24-96b6-383101452081','Accident','Collision mineure','2023-12-01','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b077ce8a-7688-41de-8d41-a762e781b1b0','Q-154-1','c7fd6387-2947-4d24-96b6-383101452081','auto',347,'2026-01-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('97a1e804-110f-4020-bed4-340a5f17cc51','POL-154-1','c7fd6387-2947-4d24-96b6-383101452081','b077ce8a-7688-41de-8d41-a762e781b1b0','auto','2026-01-05','2027-01-05',347,10,'full');


-- USER 155
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('91112ae4-d282-4b0f-8178-b462251cd68f','user155@test.com',crypt('test123', gen_salt('bf')),'client','2022-12-23');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('91112ae4-d282-4b0f-8178-b462251cd68f','Lucas','Rakotovao','034000155','Antananarivo','2022-12-23');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8f27ca40-fa9c-45ef-a2ae-b6a1686101f7','Q-155-0','91112ae4-d282-4b0f-8178-b462251cd68f','auto',482,'2025-08-18');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('a3ab8188-0e78-4130-b78e-7b04ed4e713a','POL-155-0','91112ae4-d282-4b0f-8178-b462251cd68f','8f27ca40-fa9c-45ef-a2ae-b6a1686101f7','auto','2025-08-18','2026-08-18',482,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('428e8662-b4d8-4075-9a73-6992eee23c72','Q-155-1','91112ae4-d282-4b0f-8178-b462251cd68f','auto',287,'2025-02-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('54b0aed3-acdb-496a-a23a-b72c91185e30','POL-155-1','91112ae4-d282-4b0f-8178-b462251cd68f','428e8662-b4d8-4075-9a73-6992eee23c72','auto','2025-02-11','2026-02-11',287,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('171a966c-cf78-4c05-a295-6f68dbfb4058','Q-155-2','91112ae4-d282-4b0f-8178-b462251cd68f','auto',229,'2022-01-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('663ebc8d-a188-451a-b10a-32d9c38ec59a','POL-155-2','91112ae4-d282-4b0f-8178-b462251cd68f','171a966c-cf78-4c05-a295-6f68dbfb4058','auto','2022-01-02','2023-01-02',229,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('6c8e85cb-8e07-4f39-aae1-12e4eb022bf0','INC-155-2-0','663ebc8d-a188-451a-b10a-32d9c38ec59a','91112ae4-d282-4b0f-8178-b462251cd68f','Accident','Collision mineure','2025-12-18','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('bc03969e-00a0-4fb6-b9d0-70f746ef4d1a','INC-155-2-1','663ebc8d-a188-451a-b10a-32d9c38ec59a','91112ae4-d282-4b0f-8178-b462251cd68f','Accident','Collision mineure','2021-10-03','auto');


-- USER 156
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('d84bffcf-113a-4596-b4ac-a23afe10944e','user156@test.com',crypt('test123', gen_salt('bf')),'client','2026-02-25');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('d84bffcf-113a-4596-b4ac-a23afe10944e','Tiana','Andri','034000156','Antananarivo','2026-02-25');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d8e1aaab-b0cb-4cdc-87ab-096cbd8cb2d3','Q-156-0','d84bffcf-113a-4596-b4ac-a23afe10944e','auto',349,'2024-08-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('e1ab9dbe-fae0-42ab-80f8-570565b5a892','POL-156-0','d84bffcf-113a-4596-b4ac-a23afe10944e','d8e1aaab-b0cb-4cdc-87ab-096cbd8cb2d3','auto','2024-08-06','2025-08-06',349,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('f7704a0c-7680-4f3b-9edd-d17823b9c576','INC-156-0-0','e1ab9dbe-fae0-42ab-80f8-570565b5a892','d84bffcf-113a-4596-b4ac-a23afe10944e','Accident','Collision mineure','2024-03-31','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('2d1951bd-a82a-491c-a51a-23f7554d5237','INC-156-0-1','e1ab9dbe-fae0-42ab-80f8-570565b5a892','d84bffcf-113a-4596-b4ac-a23afe10944e','Accident','Collision mineure','2023-02-08','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('79acd44e-4447-4285-b37b-ea2340ef2749','Q-156-1','d84bffcf-113a-4596-b4ac-a23afe10944e','auto',475,'2023-10-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('d97cf7fd-60b7-4277-a3e1-323b738e72f0','POL-156-1','d84bffcf-113a-4596-b4ac-a23afe10944e','79acd44e-4447-4285-b37b-ea2340ef2749','auto','2023-10-19','2024-10-19',475,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('49506afe-0921-490c-8a4f-34c55c6d5ed1','INC-156-1-0','d97cf7fd-60b7-4277-a3e1-323b738e72f0','d84bffcf-113a-4596-b4ac-a23afe10944e','Accident','Collision mineure','2024-09-11','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('77ab778e-ceae-4f42-be89-09836f241cd5','INC-156-1-1','d97cf7fd-60b7-4277-a3e1-323b738e72f0','d84bffcf-113a-4596-b4ac-a23afe10944e','Accident','Collision mineure','2024-08-07','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('d2e198f1-12c8-4de5-a4ba-2a355171c4ad','d84bffcf-113a-4596-b4ac-a23afe10944e','Service','Bon service',5);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('22b6f640-08ef-403b-90b4-76e2c1d5a67c','d84bffcf-113a-4596-b4ac-a23afe10944e','Service','Bon service',3);


-- USER 157
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('36d4fb74-996c-45fb-b519-e1991b528387','user157@test.com',crypt('test123', gen_salt('bf')),'client','2022-02-11');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('36d4fb74-996c-45fb-b519-e1991b528387','Mickael','Rakotovao','034000157','Antananarivo','2022-02-11');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8b954446-3ebf-425e-9f51-2e0f9a537fd5','Q-157-0','36d4fb74-996c-45fb-b519-e1991b528387','auto',242,'2023-03-15');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('623d2deb-98b7-4c62-946d-c26e537d4e32','POL-157-0','36d4fb74-996c-45fb-b519-e1991b528387','8b954446-3ebf-425e-9f51-2e0f9a537fd5','auto','2023-03-15','2024-03-15',242,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('5bb415b5-2a28-4277-93f3-0c6effea5eed','INC-157-0-0','623d2deb-98b7-4c62-946d-c26e537d4e32','36d4fb74-996c-45fb-b519-e1991b528387','Accident','Collision mineure','2022-07-26','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f10e734f-3857-4e49-abde-6f3c51966e33','Q-157-1','36d4fb74-996c-45fb-b519-e1991b528387','auto',440,'2021-10-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('21966e45-22a2-4918-811c-06a46529eb1b','POL-157-1','36d4fb74-996c-45fb-b519-e1991b528387','f10e734f-3857-4e49-abde-6f3c51966e33','auto','2021-10-14','2022-10-14',440,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('129ef021-59ab-4de1-9606-3dc4516111d7','INC-157-1-0','21966e45-22a2-4918-811c-06a46529eb1b','36d4fb74-996c-45fb-b519-e1991b528387','Accident','Collision mineure','2024-06-12','auto');


-- USER 158
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a9de0ed3-5f77-4d1c-96a5-c3269b08a130','user158@test.com',crypt('test123', gen_salt('bf')),'client','2025-11-11');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('a9de0ed3-5f77-4d1c-96a5-c3269b08a130','Aina','Andri','034000158','Antananarivo','2025-11-11');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('cdbe037c-a4a7-4520-a261-e9874efb9647','Q-158-0','a9de0ed3-5f77-4d1c-96a5-c3269b08a130','auto',75,'2020-05-18');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('d6028875-2647-4407-9516-85dcdf5a66e3','POL-158-0','a9de0ed3-5f77-4d1c-96a5-c3269b08a130','cdbe037c-a4a7-4520-a261-e9874efb9647','auto','2020-05-18','2021-05-18',75,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('554ec2bc-9c5d-4af5-99eb-2ae40bc3bc1a','INC-158-0-0','d6028875-2647-4407-9516-85dcdf5a66e3','a9de0ed3-5f77-4d1c-96a5-c3269b08a130','Accident','Collision mineure','2020-03-01','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e8527063-b3dc-4136-bc2c-cd19537491c3','Q-158-1','a9de0ed3-5f77-4d1c-96a5-c3269b08a130','auto',384,'2024-08-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('ed3eb125-62cd-4862-827e-e7603f5b74af','POL-158-1','a9de0ed3-5f77-4d1c-96a5-c3269b08a130','e8527063-b3dc-4136-bc2c-cd19537491c3','auto','2024-08-30','2025-08-30',384,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('881c1296-2f14-4e84-b05d-318a301d076f','a9de0ed3-5f77-4d1c-96a5-c3269b08a130','Service','Bon service',4);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('5009778e-9d41-4f86-98d2-9cdfc61c932c','a9de0ed3-5f77-4d1c-96a5-c3269b08a130','Service','Bon service',5);


-- USER 159
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('5fee349f-4365-4fec-80af-fcea7ce3ee9d','user159@test.com',crypt('test123', gen_salt('bf')),'client','2026-04-08');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('5fee349f-4365-4fec-80af-fcea7ce3ee9d','Paul','Randria','034000159','Antananarivo','2026-04-08');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b5e748d6-6617-4932-88cf-10e572836778','Q-159-0','5fee349f-4365-4fec-80af-fcea7ce3ee9d','auto',316,'2021-06-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('412b4140-d983-48dd-9377-4c2e480d15fe','POL-159-0','5fee349f-4365-4fec-80af-fcea7ce3ee9d','b5e748d6-6617-4932-88cf-10e572836778','auto','2021-06-28','2022-06-28',316,10,'full');


-- USER 160
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a70f8705-6495-42d0-a19f-cedae9ecc110','user160@test.com',crypt('test123', gen_salt('bf')),'client','2021-04-09');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('a70f8705-6495-42d0-a19f-cedae9ecc110','Aina','Rasoa','034000160','Antananarivo','2021-04-09');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2aeb470b-7845-4a98-b1c9-36d1accc3aaf','Q-160-0','a70f8705-6495-42d0-a19f-cedae9ecc110','auto',422,'2025-05-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('af18424f-9781-45a2-8189-a48d2bd892cc','POL-160-0','a70f8705-6495-42d0-a19f-cedae9ecc110','2aeb470b-7845-4a98-b1c9-36d1accc3aaf','auto','2025-05-16','2026-05-16',422,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('72fe520e-982a-478f-a4e6-6f9afb97dc5c','INC-160-0-0','af18424f-9781-45a2-8189-a48d2bd892cc','a70f8705-6495-42d0-a19f-cedae9ecc110','Accident','Collision mineure','2022-07-13','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('bea19d6e-911b-4aea-9814-ce2510116221','INC-160-0-1','af18424f-9781-45a2-8189-a48d2bd892cc','a70f8705-6495-42d0-a19f-cedae9ecc110','Accident','Collision mineure','2023-02-02','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('e6ee7c17-5224-41e1-958b-103e526b9c4e','a70f8705-6495-42d0-a19f-cedae9ecc110','Service','Bon service',4);


-- USER 161
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('93e4d8a9-4198-4060-91be-a6828c8af94b','user161@test.com',crypt('test123', gen_salt('bf')),'client','2023-03-18');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('93e4d8a9-4198-4060-91be-a6828c8af94b','Aina','Raharison','034000161','Antananarivo','2023-03-18');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9990520e-fd89-4e92-8ffd-4e2a02d05cf3','Q-161-0','93e4d8a9-4198-4060-91be-a6828c8af94b','auto',391,'2024-10-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('2771a6d4-111a-44e4-98f2-1d5130abb08c','POL-161-0','93e4d8a9-4198-4060-91be-a6828c8af94b','9990520e-fd89-4e92-8ffd-4e2a02d05cf3','auto','2024-10-06','2025-10-06',391,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('552eef6d-5ad9-47d9-9737-27a666901bc0','INC-161-0-0','2771a6d4-111a-44e4-98f2-1d5130abb08c','93e4d8a9-4198-4060-91be-a6828c8af94b','Accident','Collision mineure','2020-05-13','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('ace60e0b-1990-4d4b-ac36-8e304da06978','INC-161-0-1','2771a6d4-111a-44e4-98f2-1d5130abb08c','93e4d8a9-4198-4060-91be-a6828c8af94b','Accident','Collision mineure','2021-03-29','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d532ebfb-0319-461c-9267-91f113e9dc90','Q-161-1','93e4d8a9-4198-4060-91be-a6828c8af94b','auto',113,'2025-08-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('cea5e512-1a4c-41f5-a132-e4163adc1069','POL-161-1','93e4d8a9-4198-4060-91be-a6828c8af94b','d532ebfb-0319-461c-9267-91f113e9dc90','auto','2025-08-25','2026-08-25',113,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('768957f7-0d22-4023-b812-9c716070fb64','INC-161-1-0','cea5e512-1a4c-41f5-a132-e4163adc1069','93e4d8a9-4198-4060-91be-a6828c8af94b','Accident','Collision mineure','2025-12-05','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('5b572dbe-bed7-44f6-8d1a-2ad1312c0218','Q-161-2','93e4d8a9-4198-4060-91be-a6828c8af94b','auto',236,'2021-06-10');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('edc394b9-6b3b-4ccb-9b3a-6e45be020418','POL-161-2','93e4d8a9-4198-4060-91be-a6828c8af94b','5b572dbe-bed7-44f6-8d1a-2ad1312c0218','auto','2021-06-10','2022-06-10',236,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('562875d0-f29b-465f-82cf-0d9186277f28','93e4d8a9-4198-4060-91be-a6828c8af94b','Service','Bon service',5);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('c940b4b1-daed-492c-b511-152246a86284','93e4d8a9-4198-4060-91be-a6828c8af94b','Service','Bon service',5);


-- USER 162
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('e6e91fe6-9dfe-43ba-ac3e-36d44e7752c9','user162@test.com',crypt('test123', gen_salt('bf')),'client','2021-01-04');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('e6e91fe6-9dfe-43ba-ac3e-36d44e7752c9','Hery','Rakoto','034000162','Antananarivo','2021-01-04');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8c7607ec-40f8-4c0e-a2fa-dfa6607ae671','Q-162-0','e6e91fe6-9dfe-43ba-ac3e-36d44e7752c9','auto',474,'2024-06-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('750d98dc-7276-4595-9faa-c32f88329f2b','POL-162-0','e6e91fe6-9dfe-43ba-ac3e-36d44e7752c9','8c7607ec-40f8-4c0e-a2fa-dfa6607ae671','auto','2024-06-04','2025-06-04',474,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('35357046-55d3-4f21-b1d8-49aa4771b127','Q-162-1','e6e91fe6-9dfe-43ba-ac3e-36d44e7752c9','auto',159,'2024-12-15');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('4db1151a-505b-44b2-b403-468db62d014c','POL-162-1','e6e91fe6-9dfe-43ba-ac3e-36d44e7752c9','35357046-55d3-4f21-b1d8-49aa4771b127','auto','2024-12-15','2025-12-15',159,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('5ce447e0-0bde-43bc-8c1b-73110735ac95','INC-162-1-0','4db1151a-505b-44b2-b403-468db62d014c','e6e91fe6-9dfe-43ba-ac3e-36d44e7752c9','Accident','Collision mineure','2023-01-05','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('de0e80ff-c44b-4ec5-aff6-4e2676abdf46','Q-162-2','e6e91fe6-9dfe-43ba-ac3e-36d44e7752c9','auto',124,'2025-02-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('e3aa1838-9694-4f22-95b1-876d8845fa3c','POL-162-2','e6e91fe6-9dfe-43ba-ac3e-36d44e7752c9','de0e80ff-c44b-4ec5-aff6-4e2676abdf46','auto','2025-02-07','2026-02-07',124,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('e98d37b0-dabd-472e-8706-04f39478aabe','INC-162-2-0','e3aa1838-9694-4f22-95b1-876d8845fa3c','e6e91fe6-9dfe-43ba-ac3e-36d44e7752c9','Accident','Collision mineure','2023-07-10','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('aa7827b1-9374-4120-b81b-fa0397f92eff','e6e91fe6-9dfe-43ba-ac3e-36d44e7752c9','Service','Bon service',4);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('286eb82e-2dff-4667-b5e8-eab3c74c903b','e6e91fe6-9dfe-43ba-ac3e-36d44e7752c9','Service','Bon service',5);


-- USER 163
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('3aa7c81a-d5f2-48d0-84eb-4f8a3d2a67c0','user163@test.com',crypt('test123', gen_salt('bf')),'client','2026-02-26');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('3aa7c81a-d5f2-48d0-84eb-4f8a3d2a67c0','Jean','Rasoa','034000163','Antananarivo','2026-02-26');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c365a788-cc1b-4f56-831a-951bee41af20','Q-163-0','3aa7c81a-d5f2-48d0-84eb-4f8a3d2a67c0','auto',199,'2025-05-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('8fb2978c-ed9e-4bbf-8a75-076ace879e87','POL-163-0','3aa7c81a-d5f2-48d0-84eb-4f8a3d2a67c0','c365a788-cc1b-4f56-831a-951bee41af20','auto','2025-05-01','2026-05-01',199,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('876e8e9c-1c20-47fe-8c60-d5c5f5f04d3e','INC-163-0-0','8fb2978c-ed9e-4bbf-8a75-076ace879e87','3aa7c81a-d5f2-48d0-84eb-4f8a3d2a67c0','Accident','Collision mineure','2021-01-28','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('56ec0af5-75e1-4852-8534-138f7709beb2','Q-163-1','3aa7c81a-d5f2-48d0-84eb-4f8a3d2a67c0','auto',266,'2023-08-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('ce1ccd86-2b93-4caa-ba38-779c7fe12f0a','POL-163-1','3aa7c81a-d5f2-48d0-84eb-4f8a3d2a67c0','56ec0af5-75e1-4852-8534-138f7709beb2','auto','2023-08-23','2024-08-23',266,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3f2e336b-0c7a-4e1f-924d-ac577bf0d2d0','Q-163-2','3aa7c81a-d5f2-48d0-84eb-4f8a3d2a67c0','auto',197,'2021-04-11');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('dafbf671-ff82-4d91-96d1-f8f61bd82107','POL-163-2','3aa7c81a-d5f2-48d0-84eb-4f8a3d2a67c0','3f2e336b-0c7a-4e1f-924d-ac577bf0d2d0','auto','2021-04-11','2022-04-11',197,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('84d6ac42-cbfa-4931-9eca-d86b1a3cc32a','3aa7c81a-d5f2-48d0-84eb-4f8a3d2a67c0','Service','Bon service',4);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('1952c7a7-879f-4487-b271-e72ea67a66a6','3aa7c81a-d5f2-48d0-84eb-4f8a3d2a67c0','Service','Bon service',2);


-- USER 164
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a3d809e2-96e4-44cc-b77a-e0c7b1f1b4cb','user164@test.com',crypt('test123', gen_salt('bf')),'client','2020-02-17');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('a3d809e2-96e4-44cc-b77a-e0c7b1f1b4cb','Sofia','Randria','034000164','Antananarivo','2020-02-17');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a93da0b2-2d08-45db-9cdf-fff2b2834513','Q-164-0','a3d809e2-96e4-44cc-b77a-e0c7b1f1b4cb','auto',281,'2024-08-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('494000b2-9d9b-4932-8c8d-e97deb6e8185','POL-164-0','a3d809e2-96e4-44cc-b77a-e0c7b1f1b4cb','a93da0b2-2d08-45db-9cdf-fff2b2834513','auto','2024-08-20','2025-08-20',281,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('93da1bfe-9321-4685-8a98-5ad7f0d98f73','INC-164-0-0','494000b2-9d9b-4932-8c8d-e97deb6e8185','a3d809e2-96e4-44cc-b77a-e0c7b1f1b4cb','Accident','Collision mineure','2024-12-07','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('23865aa7-280e-4410-ab81-8a86674d4079','INC-164-0-1','494000b2-9d9b-4932-8c8d-e97deb6e8185','a3d809e2-96e4-44cc-b77a-e0c7b1f1b4cb','Accident','Collision mineure','2022-03-24','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d554a5f3-998a-44ce-b4f8-b7da0647c141','Q-164-1','a3d809e2-96e4-44cc-b77a-e0c7b1f1b4cb','auto',119,'2021-08-31');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('8ceee5f0-da56-4b65-86b7-17e67b2f9d65','POL-164-1','a3d809e2-96e4-44cc-b77a-e0c7b1f1b4cb','d554a5f3-998a-44ce-b4f8-b7da0647c141','auto','2021-08-31','2022-08-31',119,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('5f8a0f2a-6cf3-49ba-bd7a-a9bbdac3ac4d','INC-164-1-0','8ceee5f0-da56-4b65-86b7-17e67b2f9d65','a3d809e2-96e4-44cc-b77a-e0c7b1f1b4cb','Accident','Collision mineure','2023-10-30','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('89dffc4e-2dba-4298-b4c8-6f1cc1948840','INC-164-1-1','8ceee5f0-da56-4b65-86b7-17e67b2f9d65','a3d809e2-96e4-44cc-b77a-e0c7b1f1b4cb','Accident','Collision mineure','2025-10-25','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('33acc393-f9fd-492c-96bd-e975de43ddc8','Q-164-2','a3d809e2-96e4-44cc-b77a-e0c7b1f1b4cb','auto',301,'2025-01-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('ae7edd6e-35fd-4c55-ab25-9d3af7667fd7','POL-164-2','a3d809e2-96e4-44cc-b77a-e0c7b1f1b4cb','33acc393-f9fd-492c-96bd-e975de43ddc8','auto','2025-01-23','2026-01-23',301,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('a1b92a96-e63a-45a8-866d-07baa29a0ff1','a3d809e2-96e4-44cc-b77a-e0c7b1f1b4cb','Service','Bon service',2);


-- USER 165
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('d5a25b7a-21d4-46c9-b816-07b5a7842137','user165@test.com',crypt('test123', gen_salt('bf')),'client','2022-04-04');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('d5a25b7a-21d4-46c9-b816-07b5a7842137','Aina','Andri','034000165','Antananarivo','2022-04-04');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f509662c-2e40-4c7b-86b7-873ddd13e956','Q-165-0','d5a25b7a-21d4-46c9-b816-07b5a7842137','auto',100,'2024-01-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('fe15b02c-b0ea-4444-bf41-c83a8cd2e70a','POL-165-0','d5a25b7a-21d4-46c9-b816-07b5a7842137','f509662c-2e40-4c7b-86b7-873ddd13e956','auto','2024-01-25','2025-01-25',100,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('dd00b77b-fa00-4189-b7ed-94800f543f7b','INC-165-0-0','fe15b02c-b0ea-4444-bf41-c83a8cd2e70a','d5a25b7a-21d4-46c9-b816-07b5a7842137','Accident','Collision mineure','2020-06-07','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('5da7a478-c13f-4557-b4be-3307e0bf10ca','Q-165-1','d5a25b7a-21d4-46c9-b816-07b5a7842137','auto',290,'2025-03-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('7b13e5dd-92a8-4d24-ad7f-c33d7bb307c2','POL-165-1','d5a25b7a-21d4-46c9-b816-07b5a7842137','5da7a478-c13f-4557-b4be-3307e0bf10ca','auto','2025-03-01','2026-03-01',290,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('79a64f43-2ab5-49bc-a70f-f2086e5610ed','Q-165-2','d5a25b7a-21d4-46c9-b816-07b5a7842137','auto',373,'2023-03-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('505a5489-7a11-463f-993b-2fcf217ab90c','POL-165-2','d5a25b7a-21d4-46c9-b816-07b5a7842137','79a64f43-2ab5-49bc-a70f-f2086e5610ed','auto','2023-03-16','2024-03-16',373,10,'full');


-- USER 166
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('5962cf12-ebb0-4c89-9e07-3cf7ca08222f','user166@test.com',crypt('test123', gen_salt('bf')),'client','2024-03-05');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('5962cf12-ebb0-4c89-9e07-3cf7ca08222f','Jean','Andri','034000166','Antananarivo','2024-03-05');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('6231e5d3-ff41-48c6-851d-d33e92ba831b','Q-166-0','5962cf12-ebb0-4c89-9e07-3cf7ca08222f','auto',152,'2024-01-15');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('73895d2e-2eae-496b-8c78-03f5703afffa','POL-166-0','5962cf12-ebb0-4c89-9e07-3cf7ca08222f','6231e5d3-ff41-48c6-851d-d33e92ba831b','auto','2024-01-15','2025-01-15',152,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('659cf22a-3061-4aff-b0c5-7df456f98c67','INC-166-0-0','73895d2e-2eae-496b-8c78-03f5703afffa','5962cf12-ebb0-4c89-9e07-3cf7ca08222f','Accident','Collision mineure','2021-08-30','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('0c89da21-d685-485f-b789-ad3f8a608b10','INC-166-0-1','73895d2e-2eae-496b-8c78-03f5703afffa','5962cf12-ebb0-4c89-9e07-3cf7ca08222f','Accident','Collision mineure','2022-09-30','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('f74000be-002e-4071-a3a2-90bbc826fdcd','5962cf12-ebb0-4c89-9e07-3cf7ca08222f','Service','Bon service',3);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('19cec1e5-388e-47e8-a419-4d114cd152f4','5962cf12-ebb0-4c89-9e07-3cf7ca08222f','Service','Bon service',3);


-- USER 167
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('2035fe94-2653-4dc9-adbb-4bc87ddf1b92','user167@test.com',crypt('test123', gen_salt('bf')),'client','2026-03-14');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('2035fe94-2653-4dc9-adbb-4bc87ddf1b92','Lina','Rasoa','034000167','Antananarivo','2026-03-14');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('85effd43-a3c4-4fb0-b278-684c679089b9','Q-167-0','2035fe94-2653-4dc9-adbb-4bc87ddf1b92','auto',333,'2022-10-15');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('8ab4bebd-ba1e-4b44-892e-30e19e824115','POL-167-0','2035fe94-2653-4dc9-adbb-4bc87ddf1b92','85effd43-a3c4-4fb0-b278-684c679089b9','auto','2022-10-15','2023-10-15',333,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('37764873-a918-469d-9c20-f4982260403d','INC-167-0-0','8ab4bebd-ba1e-4b44-892e-30e19e824115','2035fe94-2653-4dc9-adbb-4bc87ddf1b92','Accident','Collision mineure','2025-12-09','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('36470929-e494-4bdc-be47-9594ce823d2b','INC-167-0-1','8ab4bebd-ba1e-4b44-892e-30e19e824115','2035fe94-2653-4dc9-adbb-4bc87ddf1b92','Accident','Collision mineure','2021-03-20','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3fb8b9a8-27ac-4eb9-ba3a-97236290a910','Q-167-1','2035fe94-2653-4dc9-adbb-4bc87ddf1b92','auto',218,'2021-11-15');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('1cba84a5-5b24-420b-9aa4-207920882e69','POL-167-1','2035fe94-2653-4dc9-adbb-4bc87ddf1b92','3fb8b9a8-27ac-4eb9-ba3a-97236290a910','auto','2021-11-15','2022-11-15',218,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('351a7b6c-55c0-4570-a2f5-05e853c0774d','Q-167-2','2035fe94-2653-4dc9-adbb-4bc87ddf1b92','auto',247,'2022-06-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('aad4887d-8ee2-463d-bee8-6d7672ce980c','POL-167-2','2035fe94-2653-4dc9-adbb-4bc87ddf1b92','351a7b6c-55c0-4570-a2f5-05e853c0774d','auto','2022-06-14','2023-06-14',247,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('697ea131-12e7-4968-91a7-64f4fe6a3159','2035fe94-2653-4dc9-adbb-4bc87ddf1b92','Service','Bon service',3);


-- USER 168
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('9f198760-7d94-41fd-8df2-3488aa8a1768','user168@test.com',crypt('test123', gen_salt('bf')),'client','2022-03-17');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('9f198760-7d94-41fd-8df2-3488aa8a1768','Hery','Raharison','034000168','Antananarivo','2022-03-17');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('57f8ade8-de5d-43fe-b702-4e0965cff5e5','Q-168-0','9f198760-7d94-41fd-8df2-3488aa8a1768','auto',76,'2023-09-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('b95c1a23-72a1-4edb-b632-adcbd8b7b1c4','POL-168-0','9f198760-7d94-41fd-8df2-3488aa8a1768','57f8ade8-de5d-43fe-b702-4e0965cff5e5','auto','2023-09-28','2024-09-28',76,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('a72589cc-ad86-4b83-9d71-b2b9c1e9a29d','INC-168-0-0','b95c1a23-72a1-4edb-b632-adcbd8b7b1c4','9f198760-7d94-41fd-8df2-3488aa8a1768','Accident','Collision mineure','2022-03-04','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('de2b807e-19db-47d1-8ec1-e8575c558f74','INC-168-0-1','b95c1a23-72a1-4edb-b632-adcbd8b7b1c4','9f198760-7d94-41fd-8df2-3488aa8a1768','Accident','Collision mineure','2021-09-06','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d9b3933b-f2e3-4844-8cb3-243f7cb2eca7','Q-168-1','9f198760-7d94-41fd-8df2-3488aa8a1768','auto',110,'2021-12-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('0d8868f1-e230-4ee1-939f-1107fe94aa77','POL-168-1','9f198760-7d94-41fd-8df2-3488aa8a1768','d9b3933b-f2e3-4844-8cb3-243f7cb2eca7','auto','2021-12-24','2022-12-24',110,10,'full');


-- USER 169
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('eeefdd0c-331f-42ef-a4b6-c28be1e650a9','user169@test.com',crypt('test123', gen_salt('bf')),'client','2021-12-31');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('eeefdd0c-331f-42ef-a4b6-c28be1e650a9','Paul','Raharison','034000169','Antananarivo','2021-12-31');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9f3a48b3-4188-468e-b125-1155f5e42ba5','Q-169-0','eeefdd0c-331f-42ef-a4b6-c28be1e650a9','auto',391,'2024-05-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('e05ca9d2-4a6e-4656-9685-897618e2fd2b','POL-169-0','eeefdd0c-331f-42ef-a4b6-c28be1e650a9','9f3a48b3-4188-468e-b125-1155f5e42ba5','auto','2024-05-06','2025-05-06',391,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('1b8d907c-af2b-4277-8e23-1d39149f2c48','Q-169-1','eeefdd0c-331f-42ef-a4b6-c28be1e650a9','auto',497,'2020-11-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('421ce67e-4868-4c50-a636-91fc5341e9c5','POL-169-1','eeefdd0c-331f-42ef-a4b6-c28be1e650a9','1b8d907c-af2b-4277-8e23-1d39149f2c48','auto','2020-11-22','2021-11-22',497,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('5c480f8b-1e9c-44a2-a886-921b8aa680aa','eeefdd0c-331f-42ef-a4b6-c28be1e650a9','Service','Bon service',4);


-- USER 170
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('b1f14b12-8d2f-437a-af90-99895e481343','user170@test.com',crypt('test123', gen_salt('bf')),'client','2020-12-16');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('b1f14b12-8d2f-437a-af90-99895e481343','Tiana','Randria','034000170','Antananarivo','2020-12-16');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('b88ada1e-7f52-4bdb-8573-ee841c4864dd','Q-170-0','b1f14b12-8d2f-437a-af90-99895e481343','auto',433,'2023-06-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('b8291ee4-d258-4cdc-ae05-0cb265ef395f','POL-170-0','b1f14b12-8d2f-437a-af90-99895e481343','b88ada1e-7f52-4bdb-8573-ee841c4864dd','auto','2023-06-07','2024-06-07',433,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('fcc4155c-a117-4c22-b7fe-39a40409c280','INC-170-0-0','b8291ee4-d258-4cdc-ae05-0cb265ef395f','b1f14b12-8d2f-437a-af90-99895e481343','Accident','Collision mineure','2024-05-09','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('7fa539f7-bd98-488e-87da-cb21267ea4d8','INC-170-0-1','b8291ee4-d258-4cdc-ae05-0cb265ef395f','b1f14b12-8d2f-437a-af90-99895e481343','Accident','Collision mineure','2026-01-14','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('383ba192-78aa-4885-b51a-96feb75984a8','Q-170-1','b1f14b12-8d2f-437a-af90-99895e481343','auto',263,'2023-05-12');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('62374df5-877a-489d-b076-6bb2beba91b2','POL-170-1','b1f14b12-8d2f-437a-af90-99895e481343','383ba192-78aa-4885-b51a-96feb75984a8','auto','2023-05-12','2024-05-12',263,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('bf7c48c0-4745-4797-8c53-26b711729509','Q-170-2','b1f14b12-8d2f-437a-af90-99895e481343','auto',203,'2025-03-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('a2f9bf19-7116-40b7-bf07-f6a8c8225ca1','POL-170-2','b1f14b12-8d2f-437a-af90-99895e481343','bf7c48c0-4745-4797-8c53-26b711729509','auto','2025-03-24','2026-03-24',203,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('afdda655-d888-4b05-bf28-72f652e64b12','INC-170-2-0','a2f9bf19-7116-40b7-bf07-f6a8c8225ca1','b1f14b12-8d2f-437a-af90-99895e481343','Accident','Collision mineure','2021-01-27','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('aed71cec-da2d-4504-b5fd-cf6040480fed','INC-170-2-1','a2f9bf19-7116-40b7-bf07-f6a8c8225ca1','b1f14b12-8d2f-437a-af90-99895e481343','Accident','Collision mineure','2023-01-15','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('e4dc847d-8249-4415-b19f-acd9df4e5997','b1f14b12-8d2f-437a-af90-99895e481343','Service','Bon service',2);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('30e47f6f-38c2-4308-9ae9-cc09eef1bcc5','b1f14b12-8d2f-437a-af90-99895e481343','Service','Bon service',2);


-- USER 171
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('2031dada-7178-4b5e-88d8-6fefbac33343','user171@test.com',crypt('test123', gen_salt('bf')),'client','2022-10-06');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('2031dada-7178-4b5e-88d8-6fefbac33343','Marie','Rabe','034000171','Antananarivo','2022-10-06');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('109e9a86-d9f6-4b88-bb6b-57f9862a871d','Q-171-0','2031dada-7178-4b5e-88d8-6fefbac33343','auto',252,'2023-10-18');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('c017232f-1b8f-4b6e-93eb-fd7448de18e3','POL-171-0','2031dada-7178-4b5e-88d8-6fefbac33343','109e9a86-d9f6-4b88-bb6b-57f9862a871d','auto','2023-10-18','2024-10-18',252,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('4ce3908d-f312-46be-92d6-8ab7b3b674da','Q-171-1','2031dada-7178-4b5e-88d8-6fefbac33343','auto',411,'2021-05-08');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('33814fb5-5f05-4969-8de3-f3cd932eac4d','POL-171-1','2031dada-7178-4b5e-88d8-6fefbac33343','4ce3908d-f312-46be-92d6-8ab7b3b674da','auto','2021-05-08','2022-05-08',411,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('44838253-f64c-4d68-9cae-ef1469605f90','Q-171-2','2031dada-7178-4b5e-88d8-6fefbac33343','auto',158,'2021-05-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('644f883d-fcdb-4a45-9b46-18c0231551df','POL-171-2','2031dada-7178-4b5e-88d8-6fefbac33343','44838253-f64c-4d68-9cae-ef1469605f90','auto','2021-05-22','2022-05-22',158,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('7a6f9b95-860f-4813-b19a-49f2972da965','INC-171-2-0','644f883d-fcdb-4a45-9b46-18c0231551df','2031dada-7178-4b5e-88d8-6fefbac33343','Accident','Collision mineure','2022-05-01','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('0f026e74-f265-43bd-a909-f940d67e87f9','INC-171-2-1','644f883d-fcdb-4a45-9b46-18c0231551df','2031dada-7178-4b5e-88d8-6fefbac33343','Accident','Collision mineure','2022-10-06','auto');


-- USER 172
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('b6f2c320-f46c-4e99-83c6-3af24feea6c6','user172@test.com',crypt('test123', gen_salt('bf')),'client','2020-05-03');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('b6f2c320-f46c-4e99-83c6-3af24feea6c6','Sofia','Rakoto','034000172','Antananarivo','2020-05-03');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('a7336ba0-2073-46f2-92c1-70e3e80840e7','Q-172-0','b6f2c320-f46c-4e99-83c6-3af24feea6c6','auto',159,'2021-08-04');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('8e330f35-6160-4d33-a0c2-54dfae312cf3','POL-172-0','b6f2c320-f46c-4e99-83c6-3af24feea6c6','a7336ba0-2073-46f2-92c1-70e3e80840e7','auto','2021-08-04','2022-08-04',159,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('2223dd79-6965-4773-9788-f6440d842e2a','INC-172-0-0','8e330f35-6160-4d33-a0c2-54dfae312cf3','b6f2c320-f46c-4e99-83c6-3af24feea6c6','Accident','Collision mineure','2023-12-12','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('ae094fd5-462b-41d0-b455-992f2666211f','INC-172-0-1','8e330f35-6160-4d33-a0c2-54dfae312cf3','b6f2c320-f46c-4e99-83c6-3af24feea6c6','Accident','Collision mineure','2025-02-15','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8192af4c-c17a-4aeb-a738-7147c51ee17d','Q-172-1','b6f2c320-f46c-4e99-83c6-3af24feea6c6','auto',301,'2025-05-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('aff0472f-146d-44a1-99ef-6c514e75da73','POL-172-1','b6f2c320-f46c-4e99-83c6-3af24feea6c6','8192af4c-c17a-4aeb-a738-7147c51ee17d','auto','2025-05-28','2026-05-28',301,10,'full');


-- USER 173
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('1201ad92-ad91-4888-b56a-66df7a22e6e6','user173@test.com',crypt('test123', gen_salt('bf')),'client','2020-09-13');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('1201ad92-ad91-4888-b56a-66df7a22e6e6','Lucas','Razaf','034000173','Antananarivo','2020-09-13');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0466604d-48af-439e-866d-eb1c547fe6e9','Q-173-0','1201ad92-ad91-4888-b56a-66df7a22e6e6','auto',335,'2021-06-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('5dfbbd72-730d-46ed-b728-9dfe17d3d1c1','POL-173-0','1201ad92-ad91-4888-b56a-66df7a22e6e6','0466604d-48af-439e-866d-eb1c547fe6e9','auto','2021-06-03','2022-06-03',335,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('0f359a61-13e6-4668-8088-11b1160572ac','INC-173-0-0','5dfbbd72-730d-46ed-b728-9dfe17d3d1c1','1201ad92-ad91-4888-b56a-66df7a22e6e6','Accident','Collision mineure','2021-09-24','auto');


-- USER 174
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('e8df0317-75fb-4b13-8c87-bd330fa217b4','user174@test.com',crypt('test123', gen_salt('bf')),'client','2020-01-07');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('e8df0317-75fb-4b13-8c87-bd330fa217b4','Hery','Rasoa','034000174','Antananarivo','2020-01-07');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('9dfd0f1d-8305-46c1-b98e-66c58c1e7d06','Q-174-0','e8df0317-75fb-4b13-8c87-bd330fa217b4','auto',203,'2022-11-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('9c2caf84-9138-4745-8bfc-202eaf77c6eb','POL-174-0','e8df0317-75fb-4b13-8c87-bd330fa217b4','9dfd0f1d-8305-46c1-b98e-66c58c1e7d06','auto','2022-11-03','2023-11-03',203,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('7c0033fe-8c06-49ec-a29a-ea9c4ef25e38','INC-174-0-0','9c2caf84-9138-4745-8bfc-202eaf77c6eb','e8df0317-75fb-4b13-8c87-bd330fa217b4','Accident','Collision mineure','2021-07-23','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('853fbaf4-5d75-41d7-86ed-8e9d62cdcb99','INC-174-0-1','9c2caf84-9138-4745-8bfc-202eaf77c6eb','e8df0317-75fb-4b13-8c87-bd330fa217b4','Accident','Collision mineure','2024-03-20','auto');


-- USER 175
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('6d1e1936-4639-4167-bb28-ce30547a66cd','user175@test.com',crypt('test123', gen_salt('bf')),'client','2020-03-17');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('6d1e1936-4639-4167-bb28-ce30547a66cd','Marie','Razaf','034000175','Antananarivo','2020-03-17');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c3263d21-0f27-4244-9db2-bfdd878183f3','Q-175-0','6d1e1936-4639-4167-bb28-ce30547a66cd','auto',94,'2024-02-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('4ba868a2-1874-45c7-b752-7f4f1852dc94','POL-175-0','6d1e1936-4639-4167-bb28-ce30547a66cd','c3263d21-0f27-4244-9db2-bfdd878183f3','auto','2024-02-21','2025-02-21',94,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('a89c79d5-1226-497a-a364-b0e24690a212','INC-175-0-0','4ba868a2-1874-45c7-b752-7f4f1852dc94','6d1e1936-4639-4167-bb28-ce30547a66cd','Accident','Collision mineure','2020-08-31','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('ae3987a8-f8ff-4b4c-8296-fae86441ee8f','INC-175-0-1','4ba868a2-1874-45c7-b752-7f4f1852dc94','6d1e1936-4639-4167-bb28-ce30547a66cd','Accident','Collision mineure','2023-02-01','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2317d85b-7f1f-4ad9-b452-1e59d2588709','Q-175-1','6d1e1936-4639-4167-bb28-ce30547a66cd','auto',111,'2023-02-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('284ce179-ba27-4c87-8efc-c827fc05dcd5','POL-175-1','6d1e1936-4639-4167-bb28-ce30547a66cd','2317d85b-7f1f-4ad9-b452-1e59d2588709','auto','2023-02-09','2024-02-09',111,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('141c88a8-e175-4f43-8313-5f1151212e38','6d1e1936-4639-4167-bb28-ce30547a66cd','Service','Bon service',2);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('e24f9d63-c07e-49aa-8463-8debecacca50','6d1e1936-4639-4167-bb28-ce30547a66cd','Service','Bon service',3);


-- USER 176
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('cee5bed6-f45f-4ab4-86fa-6c0fd1609a51','user176@test.com',crypt('test123', gen_salt('bf')),'client','2024-08-15');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('cee5bed6-f45f-4ab4-86fa-6c0fd1609a51','Mickael','Rakoto','034000176','Antananarivo','2024-08-15');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8e08b284-86f6-442d-9f11-315f868d47ed','Q-176-0','cee5bed6-f45f-4ab4-86fa-6c0fd1609a51','auto',347,'2020-05-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('7e801bf0-6d6d-4115-9d8d-416ae2cd12fe','POL-176-0','cee5bed6-f45f-4ab4-86fa-6c0fd1609a51','8e08b284-86f6-442d-9f11-315f868d47ed','auto','2020-05-14','2021-05-14',347,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('021d2b1f-98fd-437d-abab-6cf609ef8366','INC-176-0-0','7e801bf0-6d6d-4115-9d8d-416ae2cd12fe','cee5bed6-f45f-4ab4-86fa-6c0fd1609a51','Accident','Collision mineure','2022-05-13','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('422d9c1c-c97a-4fd5-99f6-6d32d69c9b06','INC-176-0-1','7e801bf0-6d6d-4115-9d8d-416ae2cd12fe','cee5bed6-f45f-4ab4-86fa-6c0fd1609a51','Accident','Collision mineure','2022-11-02','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('bfea65a8-6a78-4321-85d7-c7494e7edcd1','cee5bed6-f45f-4ab4-86fa-6c0fd1609a51','Service','Bon service',4);


-- USER 177
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('1443fb53-be53-41e4-8293-539f78d0a10f','user177@test.com',crypt('test123', gen_salt('bf')),'client','2021-09-30');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('1443fb53-be53-41e4-8293-539f78d0a10f','Lucas','Rasoa','034000177','Antananarivo','2021-09-30');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('65dd4f8c-dc59-4453-8d35-ad2e72e2a659','Q-177-0','1443fb53-be53-41e4-8293-539f78d0a10f','auto',366,'2021-06-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('569c891b-dca6-4e82-b594-41e9666eaec6','POL-177-0','1443fb53-be53-41e4-8293-539f78d0a10f','65dd4f8c-dc59-4453-8d35-ad2e72e2a659','auto','2021-06-03','2022-06-03',366,10,'full');


-- USER 178
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('d169d847-0552-4b2d-b921-2a8f065386bc','user178@test.com',crypt('test123', gen_salt('bf')),'client','2020-04-13');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('d169d847-0552-4b2d-b921-2a8f065386bc','Hery','Rakotovao','034000178','Antananarivo','2020-04-13');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('78e3d8be-aa31-4667-9ff3-539daebeb09c','Q-178-0','d169d847-0552-4b2d-b921-2a8f065386bc','auto',149,'2021-01-09');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('fca92e0a-5da1-410d-ada7-518c21826152','POL-178-0','d169d847-0552-4b2d-b921-2a8f065386bc','78e3d8be-aa31-4667-9ff3-539daebeb09c','auto','2021-01-09','2022-01-09',149,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('4a5b54b8-843d-4073-8c49-c01885aa45e9','Q-178-1','d169d847-0552-4b2d-b921-2a8f065386bc','auto',300,'2020-05-15');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('3ccbf8c2-88bc-4cd5-a6e6-262f47194368','POL-178-1','d169d847-0552-4b2d-b921-2a8f065386bc','4a5b54b8-843d-4073-8c49-c01885aa45e9','auto','2020-05-15','2021-05-15',300,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('217dbfa6-6ec9-4bff-bf82-fccc80af5e95','INC-178-1-0','3ccbf8c2-88bc-4cd5-a6e6-262f47194368','d169d847-0552-4b2d-b921-2a8f065386bc','Accident','Collision mineure','2025-01-25','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('48b45fce-dcd9-4eba-bf49-2738e1faf5ff','Q-178-2','d169d847-0552-4b2d-b921-2a8f065386bc','auto',307,'2022-08-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('c25997d6-4b3e-4c85-9845-6cc40c9ceaca','POL-178-2','d169d847-0552-4b2d-b921-2a8f065386bc','48b45fce-dcd9-4eba-bf49-2738e1faf5ff','auto','2022-08-28','2023-08-28',307,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('5de0d630-f987-4a65-9efd-2201791e48bf','INC-178-2-0','c25997d6-4b3e-4c85-9845-6cc40c9ceaca','d169d847-0552-4b2d-b921-2a8f065386bc','Accident','Collision mineure','2023-04-30','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('3aca5c21-86db-4e85-af34-44507a3b91b5','INC-178-2-1','c25997d6-4b3e-4c85-9845-6cc40c9ceaca','d169d847-0552-4b2d-b921-2a8f065386bc','Accident','Collision mineure','2024-03-21','auto');


-- USER 179
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('4256f287-2a12-4e4f-aad5-3aeb28e55299','user179@test.com',crypt('test123', gen_salt('bf')),'client','2022-04-01');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('4256f287-2a12-4e4f-aad5-3aeb28e55299','Lina','Razaf','034000179','Antananarivo','2022-04-01');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('05300739-f62f-49cd-b32d-b475a9bc4ba9','Q-179-0','4256f287-2a12-4e4f-aad5-3aeb28e55299','auto',152,'2024-08-07');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('edbf49d2-1bf4-43b1-9ffb-b5a4fc7d14fb','POL-179-0','4256f287-2a12-4e4f-aad5-3aeb28e55299','05300739-f62f-49cd-b32d-b475a9bc4ba9','auto','2024-08-07','2025-08-07',152,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('de6984ec-3554-43d2-8b4b-4d2f0989f390','INC-179-0-0','edbf49d2-1bf4-43b1-9ffb-b5a4fc7d14fb','4256f287-2a12-4e4f-aad5-3aeb28e55299','Accident','Collision mineure','2022-07-23','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('3f23c434-f70f-4ffa-9651-6455b33e55d9','INC-179-0-1','edbf49d2-1bf4-43b1-9ffb-b5a4fc7d14fb','4256f287-2a12-4e4f-aad5-3aeb28e55299','Accident','Collision mineure','2022-01-08','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('f48c9fcc-346c-4043-95f6-2531c54d16ca','Q-179-1','4256f287-2a12-4e4f-aad5-3aeb28e55299','auto',140,'2020-09-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('bac49685-5f3f-4de1-b632-52b9ada6856f','POL-179-1','4256f287-2a12-4e4f-aad5-3aeb28e55299','f48c9fcc-346c-4043-95f6-2531c54d16ca','auto','2020-09-02','2021-09-02',140,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('ae97941a-51e2-4709-9af8-7a4df1cbc612','INC-179-1-0','bac49685-5f3f-4de1-b632-52b9ada6856f','4256f287-2a12-4e4f-aad5-3aeb28e55299','Accident','Collision mineure','2025-02-24','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('bcd38523-4604-4812-a231-af51a7991252','INC-179-1-1','bac49685-5f3f-4de1-b632-52b9ada6856f','4256f287-2a12-4e4f-aad5-3aeb28e55299','Accident','Collision mineure','2022-02-09','auto');


-- USER 180
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('a147998c-685b-4378-9a4d-e8120e47e236','user180@test.com',crypt('test123', gen_salt('bf')),'client','2022-11-08');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('a147998c-685b-4378-9a4d-e8120e47e236','Jean','Andri','034000180','Antananarivo','2022-11-08');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('eeda1913-599a-4bdf-8feb-667c3afe179d','Q-180-0','a147998c-685b-4378-9a4d-e8120e47e236','auto',246,'2020-02-25');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('9b86bd0d-0df5-4dff-b928-ea11ba74584a','POL-180-0','a147998c-685b-4378-9a4d-e8120e47e236','eeda1913-599a-4bdf-8feb-667c3afe179d','auto','2020-02-25','2021-02-25',246,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('30cfe537-51ff-4987-9fed-6f1b4dff7caf','INC-180-0-0','9b86bd0d-0df5-4dff-b928-ea11ba74584a','a147998c-685b-4378-9a4d-e8120e47e236','Accident','Collision mineure','2024-10-13','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('5d55f5f7-05e0-4339-831a-0bfade635343','Q-180-1','a147998c-685b-4378-9a4d-e8120e47e236','auto',128,'2025-01-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('5ec8aaa5-b1c1-41f0-9751-13eec475144d','POL-180-1','a147998c-685b-4378-9a4d-e8120e47e236','5d55f5f7-05e0-4339-831a-0bfade635343','auto','2025-01-20','2026-01-20',128,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('ee6f42e9-54b3-4aba-9453-1e78deed47c4','INC-180-1-0','5ec8aaa5-b1c1-41f0-9751-13eec475144d','a147998c-685b-4378-9a4d-e8120e47e236','Accident','Collision mineure','2020-05-01','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('6c375438-7c41-40ac-bdfc-444afcc79a1c','a147998c-685b-4378-9a4d-e8120e47e236','Service','Bon service',3);


-- USER 181
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('43a29a9f-75d4-415c-b2e6-a1d3aa4d39dd','user181@test.com',crypt('test123', gen_salt('bf')),'client','2020-02-09');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('43a29a9f-75d4-415c-b2e6-a1d3aa4d39dd','Mickael','Raharison','034000181','Antananarivo','2020-02-09');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('176bcd35-0b62-4e39-a731-18f76054d3eb','Q-181-0','43a29a9f-75d4-415c-b2e6-a1d3aa4d39dd','auto',93,'2023-05-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('d53b7077-b445-4578-bf52-8e441a4061b3','POL-181-0','43a29a9f-75d4-415c-b2e6-a1d3aa4d39dd','176bcd35-0b62-4e39-a731-18f76054d3eb','auto','2023-05-02','2024-05-02',93,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('57975dfc-9c4e-4f44-ad6c-b7f7b23f15b0','43a29a9f-75d4-415c-b2e6-a1d3aa4d39dd','Service','Bon service',2);


-- USER 182
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('d4bcfdfa-1db5-42e9-b2ed-6ef616b1b5f9','user182@test.com',crypt('test123', gen_salt('bf')),'client','2022-12-17');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('d4bcfdfa-1db5-42e9-b2ed-6ef616b1b5f9','Lina','Randria','034000182','Antananarivo','2022-12-17');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('3576f7d6-a466-441f-97ee-91f1dfb447f5','Q-182-0','d4bcfdfa-1db5-42e9-b2ed-6ef616b1b5f9','auto',295,'2020-04-28');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('ff53077d-e9d9-4d1b-b0dc-3655f29dae51','POL-182-0','d4bcfdfa-1db5-42e9-b2ed-6ef616b1b5f9','3576f7d6-a466-441f-97ee-91f1dfb447f5','auto','2020-04-28','2021-04-28',295,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('7267ad0c-5c1b-4592-acf9-13f9bb4b96f5','INC-182-0-0','ff53077d-e9d9-4d1b-b0dc-3655f29dae51','d4bcfdfa-1db5-42e9-b2ed-6ef616b1b5f9','Accident','Collision mineure','2023-04-09','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('0ca4d8b3-c3a3-4b50-b72c-6d78c26eb198','Q-182-1','d4bcfdfa-1db5-42e9-b2ed-6ef616b1b5f9','auto',272,'2021-12-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('22912040-e94d-48cc-a628-77c34d5029e7','POL-182-1','d4bcfdfa-1db5-42e9-b2ed-6ef616b1b5f9','0ca4d8b3-c3a3-4b50-b72c-6d78c26eb198','auto','2021-12-19','2022-12-19',272,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('e3cdf1ed-6916-4005-9bf8-7977ce793532','INC-182-1-0','22912040-e94d-48cc-a628-77c34d5029e7','d4bcfdfa-1db5-42e9-b2ed-6ef616b1b5f9','Accident','Collision mineure','2024-11-17','auto');


-- USER 183
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('3281e7ec-f66c-4603-8e63-1e3b94971ddd','user183@test.com',crypt('test123', gen_salt('bf')),'client','2022-08-31');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('3281e7ec-f66c-4603-8e63-1e3b94971ddd','Lina','Andri','034000183','Antananarivo','2022-08-31');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('71920dcf-a13d-4828-a770-78ade205a51f','Q-183-0','3281e7ec-f66c-4603-8e63-1e3b94971ddd','auto',117,'2025-03-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('ac7c2f6e-e667-442c-9d6f-d73244543a39','POL-183-0','3281e7ec-f66c-4603-8e63-1e3b94971ddd','71920dcf-a13d-4828-a770-78ade205a51f','auto','2025-03-03','2026-03-03',117,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('ee3d4694-d9f9-4d9a-8ed6-7b0cf02ae02a','INC-183-0-0','ac7c2f6e-e667-442c-9d6f-d73244543a39','3281e7ec-f66c-4603-8e63-1e3b94971ddd','Accident','Collision mineure','2021-05-19','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('58be8e09-0380-41ac-9d74-808c3d36f82c','INC-183-0-1','ac7c2f6e-e667-442c-9d6f-d73244543a39','3281e7ec-f66c-4603-8e63-1e3b94971ddd','Accident','Collision mineure','2023-02-19','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('fcbfd689-76a2-422e-9f2d-bd897a266cf4','Q-183-1','3281e7ec-f66c-4603-8e63-1e3b94971ddd','auto',253,'2024-05-23');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('c79d1548-8c92-4f75-be41-30b777360807','POL-183-1','3281e7ec-f66c-4603-8e63-1e3b94971ddd','fcbfd689-76a2-422e-9f2d-bd897a266cf4','auto','2024-05-23','2025-05-23',253,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('0bd11255-6926-45bd-96b8-433b3edc2ba5','INC-183-1-0','c79d1548-8c92-4f75-be41-30b777360807','3281e7ec-f66c-4603-8e63-1e3b94971ddd','Accident','Collision mineure','2024-08-19','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('8d768a52-dc92-4246-9b2b-c64a5f177bce','3281e7ec-f66c-4603-8e63-1e3b94971ddd','Service','Bon service',2);


-- USER 184
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('6d1e74b7-2678-4fc8-9879-3c9beda3a7f2','user184@test.com',crypt('test123', gen_salt('bf')),'client','2024-07-04');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('6d1e74b7-2678-4fc8-9879-3c9beda3a7f2','Lina','Rabe','034000184','Antananarivo','2024-07-04');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('8697f8dc-780c-4c80-9776-211ee36a8518','Q-184-0','6d1e74b7-2678-4fc8-9879-3c9beda3a7f2','auto',210,'2022-11-05');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('e1034546-0421-412a-9e5c-99e57721c946','POL-184-0','6d1e74b7-2678-4fc8-9879-3c9beda3a7f2','8697f8dc-780c-4c80-9776-211ee36a8518','auto','2022-11-05','2023-11-05',210,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('5e49f568-3fa5-4775-b39b-8909e60b840e','INC-184-0-0','e1034546-0421-412a-9e5c-99e57721c946','6d1e74b7-2678-4fc8-9879-3c9beda3a7f2','Accident','Collision mineure','2024-10-26','auto');


-- USER 185
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('00d5809e-df46-4266-941c-55094680ea0c','user185@test.com',crypt('test123', gen_salt('bf')),'client','2022-12-11');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('00d5809e-df46-4266-941c-55094680ea0c','Jean','Raharison','034000185','Antananarivo','2022-12-11');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2f271ca1-d939-416f-9843-c1ce682e1146','Q-185-0','00d5809e-df46-4266-941c-55094680ea0c','auto',496,'2020-02-16');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('01d6ea1b-14c2-4538-8dc6-a9adc1e60c34','POL-185-0','00d5809e-df46-4266-941c-55094680ea0c','2f271ca1-d939-416f-9843-c1ce682e1146','auto','2020-02-16','2021-02-16',496,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e0197c65-470e-47e0-bf75-32c96fed345e','Q-185-1','00d5809e-df46-4266-941c-55094680ea0c','auto',464,'2025-10-20');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('308fde06-5911-4d57-884e-907768b48f23','POL-185-1','00d5809e-df46-4266-941c-55094680ea0c','e0197c65-470e-47e0-bf75-32c96fed345e','auto','2025-10-20','2026-10-20',464,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('c32f1162-7944-4667-94d5-07a6fe8c68bb','INC-185-1-0','308fde06-5911-4d57-884e-907768b48f23','00d5809e-df46-4266-941c-55094680ea0c','Accident','Collision mineure','2021-05-10','auto');


-- USER 186
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('57b5454f-d471-4c17-8ce6-6170869c1f86','user186@test.com',crypt('test123', gen_salt('bf')),'client','2022-03-24');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('57b5454f-d471-4c17-8ce6-6170869c1f86','Sofia','Raharison','034000186','Antananarivo','2022-03-24');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('36eca7df-d5ae-4dcd-ac3b-6c795d45b30b','Q-186-0','57b5454f-d471-4c17-8ce6-6170869c1f86','auto',83,'2022-06-17');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('b57ca5a7-09f4-4b20-94a1-2e5ab27f0d28','POL-186-0','57b5454f-d471-4c17-8ce6-6170869c1f86','36eca7df-d5ae-4dcd-ac3b-6c795d45b30b','auto','2022-06-17','2023-06-17',83,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('5c8010fe-43fd-4ca4-80bf-e0e149498ef7','INC-186-0-0','b57ca5a7-09f4-4b20-94a1-2e5ab27f0d28','57b5454f-d471-4c17-8ce6-6170869c1f86','Accident','Collision mineure','2022-04-12','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('5c970e45-2e21-4119-ac19-6594e1240ff5','INC-186-0-1','b57ca5a7-09f4-4b20-94a1-2e5ab27f0d28','57b5454f-d471-4c17-8ce6-6170869c1f86','Accident','Collision mineure','2021-11-15','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('568ae860-08d4-4c86-a6be-24848dec9ef0','Q-186-1','57b5454f-d471-4c17-8ce6-6170869c1f86','auto',156,'2022-01-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('0868b74b-1d2b-4ac7-aadf-91ebbb92d933','POL-186-1','57b5454f-d471-4c17-8ce6-6170869c1f86','568ae860-08d4-4c86-a6be-24848dec9ef0','auto','2022-01-30','2023-01-30',156,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('cf00fc2b-ae51-4fbb-8c3e-6bfb1b493e5c','INC-186-1-0','0868b74b-1d2b-4ac7-aadf-91ebbb92d933','57b5454f-d471-4c17-8ce6-6170869c1f86','Accident','Collision mineure','2023-05-16','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('e5519c9e-1d44-42ee-a87b-973db22f0113','Q-186-2','57b5454f-d471-4c17-8ce6-6170869c1f86','auto',337,'2023-09-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('42f49b34-d1f4-4284-93f5-cacdac340aa3','POL-186-2','57b5454f-d471-4c17-8ce6-6170869c1f86','e5519c9e-1d44-42ee-a87b-973db22f0113','auto','2023-09-21','2024-09-21',337,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('b0ca31e7-eccf-4db8-a350-643dc734b5af','INC-186-2-0','42f49b34-d1f4-4284-93f5-cacdac340aa3','57b5454f-d471-4c17-8ce6-6170869c1f86','Accident','Collision mineure','2025-07-23','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('c6da6cfc-a264-472d-bdff-2bbc4bb5bbec','57b5454f-d471-4c17-8ce6-6170869c1f86','Service','Bon service',4);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('cdedb74b-7aba-409e-a29a-cc9449ddf1bc','57b5454f-d471-4c17-8ce6-6170869c1f86','Service','Bon service',4);


-- USER 187
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('41fd219b-f924-45d0-aeef-114a4b029692','user187@test.com',crypt('test123', gen_salt('bf')),'client','2026-03-04');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('41fd219b-f924-45d0-aeef-114a4b029692','Paul','Rakoto','034000187','Antananarivo','2026-03-04');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c09c071c-4ad4-46e2-ac01-639ec544603a','Q-187-0','41fd219b-f924-45d0-aeef-114a4b029692','auto',301,'2026-02-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('f404c794-720d-4a4c-be5a-3743113722eb','POL-187-0','41fd219b-f924-45d0-aeef-114a4b029692','c09c071c-4ad4-46e2-ac01-639ec544603a','auto','2026-02-13','2027-02-13',301,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('dcfccec6-7557-40c9-b60c-36778c37bc4b','INC-187-0-0','f404c794-720d-4a4c-be5a-3743113722eb','41fd219b-f924-45d0-aeef-114a4b029692','Accident','Collision mineure','2025-05-29','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('95b33051-cc73-427f-bfc7-0fdd567f87ae','INC-187-0-1','f404c794-720d-4a4c-be5a-3743113722eb','41fd219b-f924-45d0-aeef-114a4b029692','Accident','Collision mineure','2022-02-22','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('50ecc2ea-6764-48cf-92dd-3537d38031a5','41fd219b-f924-45d0-aeef-114a4b029692','Service','Bon service',4);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('2cf3ec79-7132-49a0-ad3a-0683d639825b','41fd219b-f924-45d0-aeef-114a4b029692','Service','Bon service',5);


-- USER 188
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('727e76ba-81e0-44ca-aef9-fc4c68a86629','user188@test.com',crypt('test123', gen_salt('bf')),'client','2021-11-24');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('727e76ba-81e0-44ca-aef9-fc4c68a86629','Mickael','Andri','034000188','Antananarivo','2021-11-24');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('677248d8-ee73-4214-829e-079a7e532051','Q-188-0','727e76ba-81e0-44ca-aef9-fc4c68a86629','auto',327,'2022-08-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('79fcf1a8-edad-4c55-b0ad-3be261a4cad5','POL-188-0','727e76ba-81e0-44ca-aef9-fc4c68a86629','677248d8-ee73-4214-829e-079a7e532051','auto','2022-08-19','2023-08-19',327,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('557bc54c-d8f8-4160-8f73-94c615fcd8a3','727e76ba-81e0-44ca-aef9-fc4c68a86629','Service','Bon service',2);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('d5cea608-d6e3-4235-9f8c-7188c91081a0','727e76ba-81e0-44ca-aef9-fc4c68a86629','Service','Bon service',5);


-- USER 189
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('68be6e2c-ab55-4d22-a86d-879a840b6dd0','user189@test.com',crypt('test123', gen_salt('bf')),'client','2022-07-10');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('68be6e2c-ab55-4d22-a86d-879a840b6dd0','Hery','Raharison','034000189','Antananarivo','2022-07-10');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('dbc17bb2-c3bf-44ad-bb4b-3478765d272d','Q-189-0','68be6e2c-ab55-4d22-a86d-879a840b6dd0','auto',93,'2024-05-19');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('fb139c6e-fa1d-4dd2-9fcd-4820baf995eb','POL-189-0','68be6e2c-ab55-4d22-a86d-879a840b6dd0','dbc17bb2-c3bf-44ad-bb4b-3478765d272d','auto','2024-05-19','2025-05-19',93,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('9dfd967f-f069-4d15-aa7a-55deb1c4d782','INC-189-0-0','fb139c6e-fa1d-4dd2-9fcd-4820baf995eb','68be6e2c-ab55-4d22-a86d-879a840b6dd0','Accident','Collision mineure','2024-09-18','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('39c47934-3281-45f2-95aa-b4229da3d34d','INC-189-0-1','fb139c6e-fa1d-4dd2-9fcd-4820baf995eb','68be6e2c-ab55-4d22-a86d-879a840b6dd0','Accident','Collision mineure','2020-04-14','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('e25812f7-189e-4cbf-9166-15325025229b','68be6e2c-ab55-4d22-a86d-879a840b6dd0','Service','Bon service',2);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('a1eb9460-cf39-4ecf-bd99-d187d682a4a4','68be6e2c-ab55-4d22-a86d-879a840b6dd0','Service','Bon service',3);


-- USER 190
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('7169b95b-ec2f-4ede-a096-ab57bb16eb09','user190@test.com',crypt('test123', gen_salt('bf')),'client','2026-03-19');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('7169b95b-ec2f-4ede-a096-ab57bb16eb09','Marie','Rakotovao','034000190','Antananarivo','2026-03-19');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('bcc2af4f-dc37-4e19-a716-79e675dbfdf4','Q-190-0','7169b95b-ec2f-4ede-a096-ab57bb16eb09','auto',271,'2024-01-22');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('ea0b9c36-33fd-4738-abb2-186fff86318e','POL-190-0','7169b95b-ec2f-4ede-a096-ab57bb16eb09','bcc2af4f-dc37-4e19-a716-79e675dbfdf4','auto','2024-01-22','2025-01-22',271,10,'full');


-- USER 191
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('b0b5761c-ccb1-4c17-a722-d64b29cd31c0','user191@test.com',crypt('test123', gen_salt('bf')),'client','2024-07-20');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('b0b5761c-ccb1-4c17-a722-d64b29cd31c0','Marie','Rasoa','034000191','Antananarivo','2024-07-20');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('5447c310-90a1-40d8-b1ad-27db2d07aec8','Q-191-0','b0b5761c-ccb1-4c17-a722-d64b29cd31c0','auto',101,'2023-02-02');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('18a1eb54-6e5e-477a-97c7-359ced5a0d39','POL-191-0','b0b5761c-ccb1-4c17-a722-d64b29cd31c0','5447c310-90a1-40d8-b1ad-27db2d07aec8','auto','2023-02-02','2024-02-02',101,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('0a210976-8fdf-4f6c-8803-a1f90d7c929f','INC-191-0-0','18a1eb54-6e5e-477a-97c7-359ced5a0d39','b0b5761c-ccb1-4c17-a722-d64b29cd31c0','Accident','Collision mineure','2024-06-07','auto');


-- USER 192
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('fc4e09d1-6ce2-4599-9381-dfa4e6d2f695','user192@test.com',crypt('test123', gen_salt('bf')),'client','2021-07-31');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('fc4e09d1-6ce2-4599-9381-dfa4e6d2f695','Jean','Rabe','034000192','Antananarivo','2021-07-31');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2235921c-d29d-4947-aac5-86d5bbf99fae','Q-192-0','fc4e09d1-6ce2-4599-9381-dfa4e6d2f695','auto',239,'2025-12-24');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('92365a87-55c1-4652-9f32-7a4e77716ee1','POL-192-0','fc4e09d1-6ce2-4599-9381-dfa4e6d2f695','2235921c-d29d-4947-aac5-86d5bbf99fae','auto','2025-12-24','2026-12-24',239,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('aa97a6e2-c9f3-4641-9fcb-fa464dc90ba9','INC-192-0-0','92365a87-55c1-4652-9f32-7a4e77716ee1','fc4e09d1-6ce2-4599-9381-dfa4e6d2f695','Accident','Collision mineure','2026-01-23','auto');


-- USER 193
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('59b73413-f907-4369-838c-8e29563ab83e','user193@test.com',crypt('test123', gen_salt('bf')),'client','2025-09-12');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('59b73413-f907-4369-838c-8e29563ab83e','Marie','Rasoa','034000193','Antananarivo','2025-09-12');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('cd3ac790-9d96-4d6c-8b5f-306edd5224fc','Q-193-0','59b73413-f907-4369-838c-8e29563ab83e','auto',499,'2024-08-31');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('eeadc4b5-2c26-41f4-b9cc-d4291e55c2a8','POL-193-0','59b73413-f907-4369-838c-8e29563ab83e','cd3ac790-9d96-4d6c-8b5f-306edd5224fc','auto','2024-08-31','2025-08-31',499,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('0db16fbb-7e5d-4c6f-b295-0fda3c979d56','INC-193-0-0','eeadc4b5-2c26-41f4-b9cc-d4291e55c2a8','59b73413-f907-4369-838c-8e29563ab83e','Accident','Collision mineure','2023-10-06','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('e1763bad-c6d0-49ef-89a7-caebd7331ffc','59b73413-f907-4369-838c-8e29563ab83e','Service','Bon service',2);


-- USER 194
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('8e144433-d9a5-43cc-96ba-c026ddd1f858','user194@test.com',crypt('test123', gen_salt('bf')),'client','2025-04-17');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('8e144433-d9a5-43cc-96ba-c026ddd1f858','Lina','Rakotovao','034000194','Antananarivo','2025-04-17');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('46c4f231-ced3-4da9-8816-1a780a3db5c2','Q-194-0','8e144433-d9a5-43cc-96ba-c026ddd1f858','auto',63,'2025-03-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('fdeb63c0-5470-4838-9bd7-f804c80d2152','POL-194-0','8e144433-d9a5-43cc-96ba-c026ddd1f858','46c4f231-ced3-4da9-8816-1a780a3db5c2','auto','2025-03-06','2026-03-06',63,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('17e7ff8f-81b6-4f38-b19e-f84e41ad58d6','INC-194-0-0','fdeb63c0-5470-4838-9bd7-f804c80d2152','8e144433-d9a5-43cc-96ba-c026ddd1f858','Accident','Collision mineure','2025-09-04','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('97541389-838b-41e6-9abc-36da3850d7b4','INC-194-0-1','fdeb63c0-5470-4838-9bd7-f804c80d2152','8e144433-d9a5-43cc-96ba-c026ddd1f858','Accident','Collision mineure','2023-04-04','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('042fd283-4394-41e4-8042-cf44deded5cf','Q-194-1','8e144433-d9a5-43cc-96ba-c026ddd1f858','auto',122,'2022-02-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('e122a32c-1bbf-454f-bae7-00f8d1b4d54e','POL-194-1','8e144433-d9a5-43cc-96ba-c026ddd1f858','042fd283-4394-41e4-8042-cf44deded5cf','auto','2022-02-06','2023-02-06',122,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('8073fff0-3287-4a7f-835f-37e5d07b3d2e','INC-194-1-0','e122a32c-1bbf-454f-bae7-00f8d1b4d54e','8e144433-d9a5-43cc-96ba-c026ddd1f858','Accident','Collision mineure','2020-01-18','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d137648d-fb93-4809-b4e5-e965e8b59248','Q-194-2','8e144433-d9a5-43cc-96ba-c026ddd1f858','auto',259,'2023-02-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('62a4151e-6858-4a86-afab-bbbe19c130f5','POL-194-2','8e144433-d9a5-43cc-96ba-c026ddd1f858','d137648d-fb93-4809-b4e5-e965e8b59248','auto','2023-02-21','2024-02-21',259,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('fbb7c21d-b936-40d5-9552-b147f325bcd6','INC-194-2-0','62a4151e-6858-4a86-afab-bbbe19c130f5','8e144433-d9a5-43cc-96ba-c026ddd1f858','Accident','Collision mineure','2024-08-21','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('26ba047b-7510-428e-b0bd-137d76eb2249','8e144433-d9a5-43cc-96ba-c026ddd1f858','Service','Bon service',4);


-- USER 195
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('f4f34e8c-411a-43ad-b1a3-8aa97a4078f1','user195@test.com',crypt('test123', gen_salt('bf')),'client','2023-08-12');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('f4f34e8c-411a-43ad-b1a3-8aa97a4078f1','Hery','Raharison','034000195','Antananarivo','2023-08-12');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('58bc77f9-236f-465d-be76-3a5ca5862a52','Q-195-0','f4f34e8c-411a-43ad-b1a3-8aa97a4078f1','auto',434,'2025-01-21');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('bda7cf8f-6bda-427b-a548-de4a7db63905','POL-195-0','f4f34e8c-411a-43ad-b1a3-8aa97a4078f1','58bc77f9-236f-465d-be76-3a5ca5862a52','auto','2025-01-21','2026-01-21',434,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('ef996473-2f0d-4a97-91cd-2cb7a85abe2d','Q-195-1','f4f34e8c-411a-43ad-b1a3-8aa97a4078f1','auto',108,'2021-07-18');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('055a6ccc-090b-40a5-9e92-310dbc21a54c','POL-195-1','f4f34e8c-411a-43ad-b1a3-8aa97a4078f1','ef996473-2f0d-4a97-91cd-2cb7a85abe2d','auto','2021-07-18','2022-07-18',108,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('342c3b51-536b-4a84-9c08-f703d02d9808','INC-195-1-0','055a6ccc-090b-40a5-9e92-310dbc21a54c','f4f34e8c-411a-43ad-b1a3-8aa97a4078f1','Accident','Collision mineure','2020-11-05','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('13863c85-3ae3-43d3-8c5b-2092178b6447','INC-195-1-1','055a6ccc-090b-40a5-9e92-310dbc21a54c','f4f34e8c-411a-43ad-b1a3-8aa97a4078f1','Accident','Collision mineure','2024-10-31','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('5a28f966-3fe8-4be8-a141-bf7483e27aac','f4f34e8c-411a-43ad-b1a3-8aa97a4078f1','Service','Bon service',5);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('6ea35e5d-749a-4082-b1c4-bebfb0009951','f4f34e8c-411a-43ad-b1a3-8aa97a4078f1','Service','Bon service',5);


-- USER 196
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('261f8d21-e7dd-4683-aed0-1e090b179377','user196@test.com',crypt('test123', gen_salt('bf')),'client','2023-09-24');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('261f8d21-e7dd-4683-aed0-1e090b179377','Marie','Randria','034000196','Antananarivo','2023-09-24');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('5e0484d3-92ae-4673-b85c-c054237ec262','Q-196-0','261f8d21-e7dd-4683-aed0-1e090b179377','auto',129,'2020-03-03');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('0d965a28-86b5-48cf-ae60-2be94310eedd','POL-196-0','261f8d21-e7dd-4683-aed0-1e090b179377','5e0484d3-92ae-4673-b85c-c054237ec262','auto','2020-03-03','2021-03-03',129,10,'full');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('795e0d5b-0db8-42da-856e-5b42317d5376','261f8d21-e7dd-4683-aed0-1e090b179377','Service','Bon service',4);


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('125dc84b-2dbf-4688-91b9-9b8b57800e8a','261f8d21-e7dd-4683-aed0-1e090b179377','Service','Bon service',5);


-- USER 197
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('e7bb2e4a-3ca5-4b16-b7bf-8de0cad3c87b','user197@test.com',crypt('test123', gen_salt('bf')),'client','2021-11-09');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('e7bb2e4a-3ca5-4b16-b7bf-8de0cad3c87b','Tiana','Andri','034000197','Antananarivo','2021-11-09');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('35b51a26-366f-4375-b6f3-b2e4db3fa609','Q-197-0','e7bb2e4a-3ca5-4b16-b7bf-8de0cad3c87b','auto',292,'2025-01-14');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('569cb44d-eb16-4aa4-bfdd-50037127520a','POL-197-0','e7bb2e4a-3ca5-4b16-b7bf-8de0cad3c87b','35b51a26-366f-4375-b6f3-b2e4db3fa609','auto','2025-01-14','2026-01-14',292,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('e213e2c1-4294-447b-892f-86a53812321a','INC-197-0-0','569cb44d-eb16-4aa4-bfdd-50037127520a','e7bb2e4a-3ca5-4b16-b7bf-8de0cad3c87b','Accident','Collision mineure','2020-01-25','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('c8db6c1e-370e-4294-aa4e-c36a07f64972','Q-197-1','e7bb2e4a-3ca5-4b16-b7bf-8de0cad3c87b','auto',451,'2026-01-06');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('ed92bd23-b4a1-434e-99a1-b6bd5863aee9','POL-197-1','e7bb2e4a-3ca5-4b16-b7bf-8de0cad3c87b','c8db6c1e-370e-4294-aa4e-c36a07f64972','auto','2026-01-06','2027-01-06',451,10,'full');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('be5defce-f914-4f2c-a790-e75251a3d52c','Q-197-2','e7bb2e4a-3ca5-4b16-b7bf-8de0cad3c87b','auto',439,'2023-11-18');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('3a75b5c9-975a-4416-979b-ca758b6322cd','POL-197-2','e7bb2e4a-3ca5-4b16-b7bf-8de0cad3c87b','be5defce-f914-4f2c-a790-e75251a3d52c','auto','2023-11-18','2024-11-18',439,10,'full');


-- USER 198
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('2be05e9d-23ed-48d0-873a-25bc419da6c4','user198@test.com',crypt('test123', gen_salt('bf')),'client','2020-12-18');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('2be05e9d-23ed-48d0-873a-25bc419da6c4','Hery','Rakoto','034000198','Antananarivo','2020-12-18');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('64dbf5ff-b832-49f9-ae8c-5f914e2bf3f0','Q-198-0','2be05e9d-23ed-48d0-873a-25bc419da6c4','auto',203,'2024-07-30');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('403ce260-8314-4eba-970f-2bf63ad4883b','POL-198-0','2be05e9d-23ed-48d0-873a-25bc419da6c4','64dbf5ff-b832-49f9-ae8c-5f914e2bf3f0','auto','2024-07-30','2025-07-30',203,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('0acc2d06-2a4d-44cb-a3c0-3e3811a46f79','INC-198-0-0','403ce260-8314-4eba-970f-2bf63ad4883b','2be05e9d-23ed-48d0-873a-25bc419da6c4','Accident','Collision mineure','2026-02-13','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('2e4a3961-84b0-4839-aa80-826efe502ed7','Q-198-1','2be05e9d-23ed-48d0-873a-25bc419da6c4','auto',475,'2020-12-31');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('573cd234-5fd3-4649-9808-359166464329','POL-198-1','2be05e9d-23ed-48d0-873a-25bc419da6c4','2e4a3961-84b0-4839-aa80-826efe502ed7','auto','2020-12-31','2021-12-31',475,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('e1192b47-8c9d-4b8d-9b2b-40c3fd526083','INC-198-1-0','573cd234-5fd3-4649-9808-359166464329','2be05e9d-23ed-48d0-873a-25bc419da6c4','Accident','Collision mineure','2026-01-31','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('d94e105e-442d-4e39-9a68-b13f120445f5','INC-198-1-1','573cd234-5fd3-4649-9808-359166464329','2be05e9d-23ed-48d0-873a-25bc419da6c4','Accident','Collision mineure','2020-04-26','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('afc9816c-284f-45f1-8ac6-b8f919c65abc','2be05e9d-23ed-48d0-873a-25bc419da6c4','Service','Bon service',2);


-- USER 199
INSERT INTO users (id,email,password_hash,role,created_at)
VALUES ('3b70dd04-be9f-457b-aae9-b898ca19b777','user199@test.com',crypt('test123', gen_salt('bf')),'client','2023-12-28');

INSERT INTO profiles (user_id,first_name,last_name,phone,address,join_date)
VALUES ('3b70dd04-be9f-457b-aae9-b898ca19b777','Lucas','Rakotovao','034000199','Antananarivo','2023-12-28');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('d787b18c-af95-430d-ba4c-d5d39b31ea99','Q-199-0','3b70dd04-be9f-457b-aae9-b898ca19b777','auto',457,'2021-12-01');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('b88c31ed-a0d1-47f5-be57-273626534102','POL-199-0','3b70dd04-be9f-457b-aae9-b898ca19b777','d787b18c-af95-430d-ba4c-d5d39b31ea99','auto','2021-12-01','2022-12-01',457,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('72d8468e-0185-4a9a-90f0-9704575a5910','INC-199-0-0','b88c31ed-a0d1-47f5-be57-273626534102','3b70dd04-be9f-457b-aae9-b898ca19b777','Accident','Collision mineure','2022-02-12','auto');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('f14314bd-a719-41ca-a070-4b78bfa99665','INC-199-0-1','b88c31ed-a0d1-47f5-be57-273626534102','3b70dd04-be9f-457b-aae9-b898ca19b777','Accident','Collision mineure','2021-02-07','auto');


INSERT INTO quotes (id,reference,client_id,type,amount,created_at)
VALUES ('cea9f1be-abbe-4800-a8f9-c0eb6654d4ac','Q-199-1','3b70dd04-be9f-457b-aae9-b898ca19b777','auto',375,'2026-03-13');

INSERT INTO contracts (id,policy_number,client_id,quote_id,type,start_date,end_date,annual_amount,deductible,coverage)
VALUES ('23fbb3d4-8d5d-4b1f-8f6f-cd423a4b66b9','POL-199-1','3b70dd04-be9f-457b-aae9-b898ca19b777','cea9f1be-abbe-4800-a8f9-c0eb6654d4ac','auto','2026-03-13','2027-03-13',375,10,'full');


INSERT INTO incidents (id,reference,contract_id,client_id,title,description,date,type)
VALUES ('c2dbb52b-e7d7-476f-98bb-49d14e094417','INC-199-1-0','23fbb3d4-8d5d-4b1f-8f6f-cd423a4b66b9','3b70dd04-be9f-457b-aae9-b898ca19b777','Accident','Collision mineure','2025-05-17','auto');


INSERT INTO feedbacks (id,client_id,subject,message,rating)
VALUES ('3ab36b43-5890-4178-a5a6-1a7ec3625def','3b70dd04-be9f-457b-aae9-b898ca19b777','Service','Bon service',3);
