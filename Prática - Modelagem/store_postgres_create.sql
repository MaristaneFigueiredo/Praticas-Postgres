CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" varchar(100) NOT NULL,
	"email" TEXT NOT NULL,
	"rua" varchar(100) NOT NULL,
	"numero" integer(4) NOT NULL,
	"bairro" varchar(100) NOT NULL,
	"cidade" varchar(100) NOT NULL,
	"estado" varchar(2) NOT NULL,
	"cep" varchar(8) NOT NULL,
	"password" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" varchar(100) NOT NULL,
	"price" integer(6) NOT NULL,
	"category_id" integer NOT NULL,
	"size" varchar(1) NOT NULL UNIQUE DEFAULT 'P',
	"photo_main" varchar NOT NULL,
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
	CONSTRAINT "carts_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.shopping" (
	"id" serial NOT NULL,
	"cart_id" integer NOT NULL,
	"status" varchar(10) NOT NULL,
	"date" DATE NOT NULL DEFAULT 'current_date',
	CONSTRAINT "shopping_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("category_id") REFERENCES "categories"("id");


ALTER TABLE "photos_products" ADD CONSTRAINT "photos_products_fk0" FOREIGN KEY ("product_id") REFERENCES "products"("id");

ALTER TABLE "carts" ADD CONSTRAINT "carts_fk0" FOREIGN KEY ("product_id") REFERENCES "products"("id");
ALTER TABLE "carts" ADD CONSTRAINT "carts_fk1" FOREIGN KEY ("user_id") REFERENCES "users"("id");

ALTER TABLE "shopping" ADD CONSTRAINT "shopping_fk0" FOREIGN KEY ("cart_id") REFERENCES "carts"("id");







