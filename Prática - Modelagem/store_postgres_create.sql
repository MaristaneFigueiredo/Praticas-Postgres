CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" varchar(100) NOT NULL,
	"email" TEXT NOT NULL,
	"password" TEXT NOT NULL,
	"main_address_id" integer NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" varchar(100) NOT NULL,
	"current_price" integer NOT NULL,
	"category_id" integer NOT NULL,
	"size_id" integer(1) NOT NULL DEFAULT 'P',
	"main_photo_id" integer NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categories" (
	"id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.photos_products" (
	"id" serial NOT NULL,
	"product_id" integer NOT NULL,
	"url_photo" TEXT NOT NULL UNIQUE,
	CONSTRAINT "photos_products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.carts" (
	"id" serial NOT NULL,
	"product_id" integer NOT NULL,
	"user_id" integer NOT NULL,
	"amount" integer NOT NULL,
	"quantity" integer NOT NULL,
	"paidPrice" integer NOT NULL,
	CONSTRAINT "carts_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.shopping" (
	"id" serial NOT NULL,
	"cart_id" integer NOT NULL,
	"status" varchar(10) NOT NULL,
	"date" DATE NOT NULL DEFAULT 'current_date',
	"address-id" integer NOT NULL,
	CONSTRAINT "shopping_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.addresses" (
	"id" serial NOT NULL,
	"street" TEXT NOT NULL,
	"number" TEXT NOT NULL,
	"zipCode" TEXT NOT NULL,
	"complement" TEXT NOT NULL,
	"district" TEXT NOT NULL,
	"city-id" integer NOT NULL,
	"state" TEXT NOT NULL,
	"user-id" integer NOT NULL,
	CONSTRAINT "addresses_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.cities" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"state-id" integer NOT NULL,
	CONSTRAINT "cities_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.states" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "states_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sizes" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "sizes_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "users" ADD CONSTRAINT "users_fk0" FOREIGN KEY ("main_address_id") REFERENCES "addresses"("id");

ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("category_id") REFERENCES "categories"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("size_id") REFERENCES "sizes"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk2" FOREIGN KEY ("main_photo_id") REFERENCES "photos_products"("id");


ALTER TABLE "photos_products" ADD CONSTRAINT "photos_products_fk0" FOREIGN KEY ("product_id") REFERENCES "products"("id");

ALTER TABLE "carts" ADD CONSTRAINT "carts_fk0" FOREIGN KEY ("product_id") REFERENCES "products"("id");
ALTER TABLE "carts" ADD CONSTRAINT "carts_fk1" FOREIGN KEY ("user_id") REFERENCES "users"("id");

ALTER TABLE "shopping" ADD CONSTRAINT "shopping_fk0" FOREIGN KEY ("cart_id") REFERENCES "carts"("id");
ALTER TABLE "shopping" ADD CONSTRAINT "shopping_fk1" FOREIGN KEY ("address-id") REFERENCES "addresses"("id");

ALTER TABLE "addresses" ADD CONSTRAINT "addresses_fk0" FOREIGN KEY ("city-id") REFERENCES "cities"("id");
ALTER TABLE "addresses" ADD CONSTRAINT "addresses_fk1" FOREIGN KEY ("user-id") REFERENCES "users"("id");

ALTER TABLE "cities" ADD CONSTRAINT "cities_fk0" FOREIGN KEY ("state-id") REFERENCES "states"("id");













