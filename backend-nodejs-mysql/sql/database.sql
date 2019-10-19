CREATE DATABASE whataboutyoudb;

USE whataboutyoudb;

CREATE TABLE users(
  id_user INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id_user),
  username VARCHAR(100) NOT NULL, 
  useremail VARCHAR(50) NOT NULL,
  userpassword VARCHAR(100) NOT NULL,
  userage INT,
  data_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE articles(
  id_article INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY ( id_article ),
  titlearticle VARCHAR(50) NOT NULL, 
  textarticle TEXT NOT NULL,
  autorarticle VARCHAR(50) NOT NULL,
  categoryarticle VARCHAR(50) NOT NULL,
  data_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  id_user INT,    
  FOREIGN KEY (id_user) REFERENCES users(id_user)
);
CREATE TABLE forumposts(
  id_forumpost INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id_forumpost),
  titleforumpost VARCHAR(50) NOT NULL, 
  textforumpost TEXT NOT NULL,
  autorforumpost VARCHAR(50) NOT NULL,
  data_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  id_user INT,
  FOREIGN KEY (id_user) REFERENCES users(id_user)
);

DESCRIBE users;

INSERT INTO users(username, useremail, userpassword, userage) values ('Juan', 'juan@hotmail.com', 'juan1234', '25');
INSERT INTO users(username, useremail, userpassword, userage) values ('Fran', 'fran@hotmail.com', 'fran1234', '22');
INSERT INTO users(username, useremail, userpassword, userage) values ('Carlos', 'carlos@hotmail.com', 'carlos1234', '29');

INSERT INTO articles(titlearticle, textarticle, autorarticle, categoryarticle, id_user) values ('La depresion', 'bla bla bla bla bla bla bla bla bla bla', 'Juan', 'Psychology', '1' );
INSERT INTO articles(titlearticle, textarticle, autorarticle, categoryarticle, id_user) values ('La esquizofrenia', 'bla bla bla bla bla bla bla bla bla bla', 'Juan', 'Psychology', '1');
INSERT INTO articles(titlearticle, textarticle, autorarticle, categoryarticle, id_user) values ('JavaScript and Vue', 'bla bla bla bla bla bla bla bla bla bla', 'Fran', 'Programming', '2');
INSERT INTO articles(titlearticle, textarticle, autorarticle, categoryarticle, id_user) values ('OVNII!!', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Mistery', '3');
INSERT INTO articles(titlearticle, textarticle, autorarticle, categoryarticle, id_user) values ('BigFOOT!!', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Mistery', '3');

INSERT INTO forumposts(titleforumpost, textforumpost, id_user) values ('Por que...', 'tra tra tra tra tra tra tra tra tra tra tra', '1');
INSERT INTO forumposts(titleforumpost, textforumpost, id_user) values ('Y si...', 'tra tra tra tra tra tra tra tra tra tra tra', '1');
INSERT INTO forumposts(titleforumpost, textforumpost, id_user) values ('Que piensan de...', 'tra tra tra tra tra tra tra tra tra tra tra', '2');

SHOW tables;

