BEGIN TRANSACTION;
DROP TABLE IF EXISTS user_diet;
DROP TABLE IF EXISTS dietary_restrictions;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS potluck;



CREATE TABLE users (
	user_id 		SERIAL NOT NULL,
	firstName		varchar(50)	not null,
	lastName		varchar(50)	not null,
	phone			varchar(50)	not null,
	email			varchar(50)	not null,
	username 		varchar(50) NOT NULL,
	password_hash 	varchar(200) NOT NULL,
	role 			varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

INSERT INTO users (firstName, lastName, phone, email, username,password_hash,role) VALUES ('firstName', 'lastName', 'phone', 'email','user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (firstName, lastName, phone, email,username,password_hash,role) VALUES ('John', 'Admin', 'phone', 'email','admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');



CREATE TABLE dietary_restrictions (
	dietary_id 			SERIAL NOT NULL,
	restriction_name	varchar(50),
	CONSTRAINT PK_dietary_id PRIMARY KEY (dietary_id)
);

INSERT INTO dietary_restrictions(restriction_name) VALUES ('Vegan' ),
														  ('Vegetarian'),
														  ('Lactose Intolerant'),
														  ('Nut Allergy'),
														  ('Gluten Allergy'),
														  ('Halal'), 
														  ('Kosher'),
														  ('Shellfish Allergy');
														  
CREATE TABLE user_diet (
	
	user_id  	 int NOT NULL,    
	dietary_id   int Not NULL,
	CONSTRAINT PK_user_diet_id PRIMARY KEY (user_id, dietary_id),
	CONSTRAINT fk_user_id foreign key (user_id) references users (user_id),
	CONSTRAINT fk_dietary_id foreign key (dietary_id) references dietary_restrictions (dietary_id)
	
);

CREATE TABLE potluck (
	potluck_id 		SERIAL NOT NULL,
	name			varchar(50)		NOT NULL,
	location		varchar(50)		NOT NULL,
	user_id 		int				NOT NULL,
	description		varchar(250)	NOT NULL,
	guests			int,
	appetizers		int,
	entrees			int,
	side_dishes		int,
	desserts        int,
	alcohol			int,
	non_alcohol     int,
	CONSTRAINT PK_potluck PRIMARY KEY (potluck_id)
);

COMMIT TRANSACTION;



