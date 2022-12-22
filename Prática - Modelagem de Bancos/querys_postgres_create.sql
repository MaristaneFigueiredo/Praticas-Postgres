CREATE TABLE "public.cias" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"sigla" TEXT NOT NULL,
	CONSTRAINT "cias_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.flights" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"sigla" TEXT NOT NULL,
	"cia_id" integer NOT NULL,
	CONSTRAINT "flights_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.aeroports" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"sigla" TEXT NOT NULL,
	CONSTRAINT "aeroports_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.trips" (
	"id" serial NOT NULL,
	"aeroportOrigin_id" integer NOT NULL,
	"aeroportDestination_id" integer NOT NULL,
	"flight_id" integer NOT NULL,
	"time_exit" TIME NOT NULL,
	"time_arrived" TIME NOT NULL,
	CONSTRAINT "trips_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "flights" ADD CONSTRAINT "flights_fk0" FOREIGN KEY ("cia_id") REFERENCES "cias"("id");


ALTER TABLE "trips" ADD CONSTRAINT "trips_fk0" FOREIGN KEY ("aeroportOrigin_id") REFERENCES "aeroports"("id");
ALTER TABLE "trips" ADD CONSTRAINT "trips_fk1" FOREIGN KEY ("aeroportDestination_id") REFERENCES "aeroports"("id");
ALTER TABLE "trips" ADD CONSTRAINT "trips_fk2" FOREIGN KEY ("flight_id") REFERENCES "flights"("id");





