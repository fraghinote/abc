drop table CONSUMPTIONS;
CREATE TABLE CONSUMPTIONS
(	ID NUMBER,
     "CONSUMER_ID" VARCHAR2(20 BYTE),
     "PRODUCT_ID" VARCHAR2(20 BYTE),
     "DAY" DATE,
     primary key(ID)
)
   ;
