CREATE TABLE "public.states" (
	"id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	CONSTRAINT "states_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.cities" (
	"id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"stateId" integer NOT NULL,
	CONSTRAINT "cities_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.customers" (
	"id" serial NOT NULL,
	"fullName" varchar(100) NOT NULL UNIQUE,
	"cpf" varchar(11) NOT NULL,
	"email" varchar(50) NOT NULL,
	"password" varchar(20) NOT NULL,
	CONSTRAINT "customers_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.customerAdresses" (
	"id" serial NOT NULL,
	"street" varchar(50) NOT NULL,
	"number" varchar(4) NOT NULL,
	"complement" varchar(4) NOT NULL,
	"postalCode" varchar(4) NOT NULL,
	"cityId" integer NOT NULL,
	"customerId" integer NOT NULL,
	CONSTRAINT "customerAdresses_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.customerPhones" (
	"id" serial NOT NULL,
	"customerId" integer NOT NULL,
	"number" integer(11) NOT NULL,
	"type" varchar(15) NOT NULL,
	CONSTRAINT "customerPhones_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.transactions" (
	"id" serial NOT NULL,
	"bankAccountId" integer NOT NULL,
	"amount" integer NOT NULL,
	"type" varchar(15) NOT NULL,
	"time" integer NOT NULL,
	"description" TEXT NOT NULL,
	"cancelled" BOOLEAN(1) NOT NULL DEFAULT 'f'
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.bankAccount" (
	"id" serial NOT NULL,
	"customerId" integer NOT NULL,
	"agency" integer(5) NOT NULL,
	"openDate" DATE NOT NULL,
	"closeDate" DATE NOT NULL,
	CONSTRAINT "bankAccount_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.creditCards" (
	"id" serial NOT NULL,
	"bankAccountId" integer NOT NULL,
	"name" varchar(50) NOT NULL,
	"number" integer(20) NOT NULL,
	"securityCode" integer(3) NOT NULL,
	"expirationMonth" integer(2) NOT NULL,
	"expirationYear" integer(2) NOT NULL,
	"password" varchar(20) NOT NULL,
	"limit" integer NOT NULL,
	CONSTRAINT "creditCards_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "cities" ADD CONSTRAINT "cities_fk0" FOREIGN KEY ("stateId") REFERENCES "states"("id");


ALTER TABLE "customerAdresses" ADD CONSTRAINT "customerAdresses_fk0" FOREIGN KEY ("cityId") REFERENCES "cities"("id");
ALTER TABLE "customerAdresses" ADD CONSTRAINT "customerAdresses_fk1" FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "customerPhones" ADD CONSTRAINT "customerPhones_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "transactions" ADD CONSTRAINT "transactions_fk0" FOREIGN KEY ("id") REFERENCES "transactions"("");
ALTER TABLE "transactions" ADD CONSTRAINT "transactions_fk1" FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"("id");

ALTER TABLE "bankAccount" ADD CONSTRAINT "bankAccount_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "creditCards" ADD CONSTRAINT "creditCards_fk0" FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"("id");









