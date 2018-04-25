--------------------------------------------------------
-- Archivo creado  - miércoles-abril-25-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CUSTOMERS
--------------------------------------------------------

  CREATE TABLE "EJERCICIOS"."CUSTOMERS" 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(255), 
	"COUNTRY" VARCHAR2(255), 
	"GRADE" NUMBER(*,0), 
	"SALESMAN_ID" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------

  CREATE TABLE "EJERCICIOS"."ORDERS" 
   (	"ID" NUMBER(*,0), 
	"AMOUNT" NUMBER(8,2), 
	"ORDER_DATE" DATE, 
	"CUSTOMER_ID" NUMBER(*,0), 
	"SALESMAN_ID" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table SALESMAN
--------------------------------------------------------

  CREATE TABLE "EJERCICIOS"."SALESMAN" 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(255), 
	"COUNTRY" VARCHAR2(255), 
	"COMMISSION" NUMBER(5,2)
   )
--------------------------------------------------------
--  DDL for Index SYS_C007230
--------------------------------------------------------

  CREATE UNIQUE INDEX "EJERCICIOS"."SYS_C007230" ON "EJERCICIOS"."SALESMAN" ("ID")
--------------------------------------------------------
--  DDL for Index SYS_C007231
--------------------------------------------------------

  CREATE UNIQUE INDEX "EJERCICIOS"."SYS_C007231" ON "EJERCICIOS"."CUSTOMERS" ("ID")
--------------------------------------------------------
--  DDL for Index SYS_C007233
--------------------------------------------------------

  CREATE UNIQUE INDEX "EJERCICIOS"."SYS_C007233" ON "EJERCICIOS"."ORDERS" ("ID")
--------------------------------------------------------
--  Constraints for Table CUSTOMERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."CUSTOMERS" ADD PRIMARY KEY ("ID") ENABLE
--------------------------------------------------------
--  Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."ORDERS" ADD PRIMARY KEY ("ID") ENABLE
--------------------------------------------------------
--  Constraints for Table SALESMAN
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."SALESMAN" ADD PRIMARY KEY ("ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table CUSTOMERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."CUSTOMERS" ADD CONSTRAINT "SALESMAN_FK" FOREIGN KEY ("SALESMAN_ID")
	  REFERENCES "EJERCICIOS"."SALESMAN" ("ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."ORDERS" ADD CONSTRAINT "CUSTOMER_ORDER_FK" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "EJERCICIOS"."CUSTOMERS" ("ID") ENABLE
  ALTER TABLE "EJERCICIOS"."ORDERS" ADD CONSTRAINT "SALESMAN_ORDER_FK" FOREIGN KEY ("SALESMAN_ID")
	  REFERENCES "EJERCICIOS"."SALESMAN" ("ID") ENABLE

--------------------------------------------------------
--  DDL for View VIEW_1
--------------------------------------------------------

  CREATE OR REPLACE VIEW "EJERCICIOS"."VIEW_1" ("SALESMAN_ID", "SALESMAN_NAME", "CUSTOMER_ID", "CUSTOMER_NAME") AS 
  SELECT S.ID as salesman_id, S.NAME as salesman_name, C.ID as customer_id,C.NAME as customer_name
FROM SALESMAN S
INNER JOIN CUSTOMERS C ON S.ID = C.SALESMAN_ID
--------------------------------------------------------
--  DDL for View VIEW_3
--------------------------------------------------------

  CREATE OR REPLACE VIEW "EJERCICIOS"."VIEW_3" ("CUSTOMER_ID", "CUSTOMER_NAME", "SALESMAN_ID", "SALESMAN_NAME") AS 
  SELECT  C.ID as customer_id,C.NAME as customer_name,S.ID as salesman_id, S.NAME as salesman_name
FROM  CUSTOMERS C
LEFT  JOIN SALESMAN S   ON C.SALESMAN_ID =S.ID
where C.GRADE < 300
order by C.ID
--------------------------------------------------------
--  DDL for View VIEW_4
--------------------------------------------------------

  CREATE OR REPLACE VIEW "EJERCICIOS"."VIEW_4" ("SALESMAN_ID", "SALESMAN_NAME", "CUSTOMER_ID", "CUSTOMER_NAME") AS 
  SELECT S.ID as salesman_id, S.NAME as salesman_name, C.ID as customer_id,C.NAME as customer_name
FROM  SALESMAN S
Full outer JOIN CUSTOMERS C  ON C.SALESMAN_ID =S.ID
order by S.ID
