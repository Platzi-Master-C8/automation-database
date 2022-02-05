 
-- -----------------------------------------------------
-- Table "professionals"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "professionals" (  
  "professional_id" INT NOT NULL  ,
  "user_id" INT NOT NULL  ,
  "location" INT NOT NULL  ,
  "first_name" VARCHAR(45) NOT NULL,
  "last_name" VARCHAR(45) NOT NULL,
  "birth_date" VARCHAR(45) NOT NULL,
  "gender" VARCHAR(45) NULL,
  "phone_number" VARCHAR(45) NULL,
  "english_level" VARCHAR(45) NOT NULL,
  "subdomain" VARCHAR(45) NULL,
  "description" VARCHAR(45) NULL,
  "looking_job" BOOLEAN NULL,
  "location_preference" VARCHAR(45) NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "created_by" INT NOT NULL,
  "updated_at" TIMESTAMP NOT NULL,
  "updated_by" INT NOT NULL,
  PRIMARY KEY ("professional_id"));


-- -----------------------------------------------------
-- Table "countries"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "countries" (
  "country_id" INT NOT NULL,
  "name" VARCHAR(45) NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "created_by" INT NOT NULL,
  "updated_at" TIMESTAMP NOT NULL,
  "updated_by" INT NOT NULL,
  PRIMARY KEY ("country_id"));
 

-- -----------------------------------------------------
-- Table "cities"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "cities" (
  "city_id" INT NOT NULL,
  "name" VARCHAR(45) NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "created_by" INT NOT NULL,
  "updated_at" TIMESTAMP NOT NULL,
  "updated_by" INT NOT NULL,
  PRIMARY KEY ("city_id"));
 

-- -----------------------------------------------------
-- Table "templates"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "templates" (
  "template_id" INT NOT NULL,
  "template_name" VARCHAR(45) NOT NULL,
  "template_type" VARCHAR(45) NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "created_by" INT NOT NULL,
  "updated_at" TIMESTAMP NOT NULL,
  "updated_by" INT NOT NULL,
  PRIMARY KEY ("template_id"));
 

-- -----------------------------------------------------
-- Table "roles"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "roles" (
  "role_id" INT NOT NULL  ,
  "role_name" VARCHAR(45) NOT NULL,
  "role_description" VARCHAR(45) NOT NULL,
  "active" BOOLEAN NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "created_by" INT NOT NULL,
  "updated_at" TIMESTAMP NOT NULL,
  "updated_by" INT NOT NULL,
  PRIMARY KEY ("role_id"));


-- -----------------------------------------------------
-- Table "users"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "users" (
  "user_id" INT NOT NULL,
  "role_id" INT NOT NULL,
  "name" VARCHAR(45) NOT NULL,
  "email" VARCHAR(45) NOT NULL,
  "password" VARCHAR(45) NOT NULL,
  "profile_picture" BYTEA NULL,
  "active" BOOLEAN NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "created_by" INT NOT NULL,
  "updated_at" TIMESTAMP NOT NULL,
  "updated_by" INT NOT NULL,
  PRIMARY KEY ("user_id"));
 

-- -----------------------------------------------------
-- Table "sessions"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "sessions" (
  "session_id" INT NOT NULL,
  "user_id" INT NOT NULL,
  "ip_address" VARCHAR(45) NOT NULL,
  "devices" VARCHAR(45) NOT NULL,
  "OS" VARCHAR(45) NOT NULL,
  "browser" VARCHAR(45) NOT NULL,
  "date_login" TIMESTAMP NOT NULL,
  "date_logout" TIMESTAMP NOT NULL,
  PRIMARY KEY ("session_id"));
 

-- -----------------------------------------------------
-- Table "skills"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "skills" (
  "skill_id" INT NOT NULL,
  "skill_name" VARCHAR(45) NOT NULL,
  "seniority" VARCHAR(45) NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "created_by" INT NOT NULL,
  "updated_at" TIMESTAMP NOT NULL,
  "updated_by" INT NOT NULL,
  PRIMARY KEY ("skill_id"));
 

-- -----------------------------------------------------
-- Table "education"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "education" (
  "education_id" INT NOT NULL,
  "description" VARCHAR(45) NULL,
  "created_at" TIMESTAMP NOT NULL,
  "created_by" INT NOT NULL,
  "updated_at" TIMESTAMP NOT NULL,
  "updated_by" INT NOT NULL,
  PRIMARY KEY ("education_id"));
 

-- -----------------------------------------------------
-- Table "components"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "components" (
  "component_id" INT NOT NULL,
  "template_id" INT NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "created_by" INT NOT NULL,
  "updated_at" TIMESTAMP NOT NULL,
  "updated_by" INT NOT NULL,
  PRIMARY KEY ("component_id"));
 

-- -----------------------------------------------------
-- Table "permissions"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "permissions" (
  "permission_id" INT NOT NULL  ,
  "permission_description" VARCHAR(45) NOT NULL,
  "permission_to_create" BOOLEAN NOT NULL,
  "permission_to_read" BOOLEAN NOT NULL,
  "permission_to_update" BOOLEAN NOT NULL,
  "permission_to_delete" BOOLEAN NOT NULL,
  "active" BOOLEAN NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "created_by" INT NOT NULL,
  "updated_at" TIMESTAMP NOT NULL,
  "updated_by" INT NOT NULL,
  PRIMARY KEY ("permission_id"));


-- -----------------------------------------------------
-- many-to-many relationships
-- -----------------------------------------------------

CREATE TABLE "roles_permissions" (
  "role_id" INT REFERENCES "roles" ("role_id"),
  "permission_id" INT REFERENCES "permissions" ("permission_id"),
  CONSTRAINT "roles_permissions_id" PRIMARY KEY ("role_id", "permission_id"));


CREATE TABLE "professionals_education" (
  "professional_id" INT REFERENCES "professionals" ("professional_id"),
  "education_id" INT REFERENCES "education" ("education_id"),
  CONSTRAINT "professionals_education_id" PRIMARY KEY ("professional_id", "education_id"));


CREATE TABLE "professionals_skills" (
  "professional_id" INT REFERENCES "professionals" ("professional_id"),
  "skill_id" INT REFERENCES "skills" ("skill_id"),
  CONSTRAINT "professionals_skill_id" PRIMARY KEY ("professional_id", "skill_id"));


CREATE TABLE "countries_cities" (
  "country_id" INT REFERENCES "countries" ("country_id"),
  "city_id" INT REFERENCES "cities" ("city_id"),
  CONSTRAINT "countries_cities_id" PRIMARY KEY ("country_id", "city_id"));


CREATE TABLE "users_templates" (
  "user_id" INT REFERENCES "users" ("user_id"),
  "template_id" INT REFERENCES "templates" ("template_id"),
  CONSTRAINT "users_templates_id" PRIMARY KEY ("user_id", "template_id"));


-- -----------------------------------------------------
-- one-to-many relationships
-- -----------------------------------------------------

ALTER TABLE "users"
    ADD CONSTRAINT "user_role_id" 
    FOREIGN KEY ("role_id")
    REFERENCES "roles"("role_id");


ALTER TABLE "professionals"
    ADD CONSTRAINT "professional_location_id" 
    FOREIGN KEY ("location")
    REFERENCES "countries"("country_id");


ALTER TABLE "professionals"
    ADD CONSTRAINT "professional_user_id" 
    FOREIGN KEY ("user_id")
    REFERENCES "users"("user_id");


ALTER TABLE "sessions"
    ADD CONSTRAINT "session_user_id" 
    FOREIGN KEY ("user_id")
    REFERENCES "users"("user_id");


ALTER TABLE "components"
    ADD CONSTRAINT "component_template_id" 
    FOREIGN KEY ("template_id")
    REFERENCES "templates"("template_id");