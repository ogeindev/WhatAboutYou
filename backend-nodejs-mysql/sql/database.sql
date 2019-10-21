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
  categoryarticle VARCHAR(50),
  tagsarticle VARCHAR(100),
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
  categoryforumpost VARCHAR(50) NOT NULL,
  data_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  id_user INT,
  FOREIGN KEY (id_user) REFERENCES users(id_user)
);

DESCRIBE users;

INSERT INTO users(username, useremail, userpassword,  userage) values ('Juan', 'juan@hotmail.com', 'juan1234', '25');
INSERT INTO users(username, useremail, userpassword, userage) values ('Fran', 'fran@hotmail.com', 'fran1234', '22');
INSERT INTO users(username, useremail, userpassword, userage) values ('Carlos', 'carlos@hotmail.com', 'carlos1234', '29');
INSERT INTO users(username, useremail, userpassword, userage) values ('Maria', 'maria@hotmail.com', 'maria1234', '39');
INSERT INTO users(username, useremail, userpassword, userage) values ('Elena', 'Elena@hotmail.com', 'Elena1234', '25');
INSERT INTO users(username, useremail, userpassword, userage) values ('Alberto', 'alberto@hotmail.com', 'alberto1234', '34');
INSERT INTO users(username, useremail, userpassword, userage) values ('Isabel', 'isabel@hotmail.com', 'isabel1234', '19');


INSERT INTO articles(titlearticle, textarticle, autorarticle, categoryarticle, id_user) values ('La depresion', 'bla bla bla bla bla bla bla bla bla bla', 'Juan', 'Psychology', '1' );
INSERT INTO articles(titlearticle, textarticle, autorarticle, categoryarticle, id_user) values ('La esquizofrenia', 'bla bla bla bla bla bla bla bla bla bla', 'Juan', 'Psychology', '1');
INSERT INTO articles(titlearticle, textarticle, autorarticle, categoryarticle, id_user) values ('JavaScript and Vue', 'bla bla bla bla bla bla bla bla bla bla', 'Fran', 'Programming', '2');
INSERT INTO articles(titlearticle, textarticle, autorarticle, categoryarticle, id_user) values ('OVNII!!', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Mistery', '3');
INSERT INTO articles(titlearticle, textarticle, autorarticle, categoryarticle, id_user) values ('BigFOOT!!', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Mistery', '3');
INSERT INTO articles(titlearticle, textarticle, autorarticle, categoryarticle, id_user) values ('APPEARS A NEW BLACK HOLE !!', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Physical', '3');
INSERT INTO articles(titlearticle, textarticle, autorarticle, categoryarticle, id_user) values ('CR7 breaks an eyebrow', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Social Life', '3');
INSERT INTO articles(titlearticle, textarticle, autorarticle, categoryarticle, id_user) values ('Tonsil and emotions', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Psychology', '3');
INSERT INTO articles(titlearticle, textarticle, autorarticle, categoryarticle, id_user) values ('Aprendizaje Vicario', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Psychology', '3');
INSERT INTO articles(titlearticle, textarticle, autorarticle, categoryarticle, id_user) values ('How to survive a zombie atack ', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Others', '3');
INSERT INTO articles(titlearticle, textarticle, autorarticle, categoryarticle, id_user) values ('Genius phrases', 'Simplicity is the ultimate sophistication -Leonardo Da Vinci- ', 'Maria', 'Others', '4');
INSERT INTO articles(titlearticle, textarticle, autorarticle, categoryarticle, id_user) values ('AJAX or FETCH?', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Programming', '3');
INSERT INTO articles(titlearticle, textarticle, autorarticle, categoryarticle, id_user) values ('Matias Prats do another joke!', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Social Life', '3');
INSERT INTO articles(titlearticle, textarticle, autorarticle, categoryarticle, id_user) values ('Quark or smaller?', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Physical', '3');
INSERT INTO articles(titlearticle, textarticle, autorarticle, categoryarticle, id_user) values ('MemoryUniverse', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Mistery', '3');
INSERT INTO articles(titlearticle, textarticle, autorarticle, categoryarticle, id_user) values ('short term memory', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Psychology', '3');
INSERT INTO articles(titlearticle, textarticle, autorarticle, categoryarticle, id_user) values ('Sex learning: Gen SRY', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Psychology', '3');
INSERT INTO articles(titlearticle, textarticle, autorarticle, categoryarticle, id_user) values ('El chupacabras!!', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Mistery', '3');
INSERT INTO articles(titlearticle, textarticle, autorarticle, categoryarticle, id_user) values ('Feel the flow: what it is?', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Psychology', '3');
INSERT INTO articles(titlearticle, textarticle, autorarticle, categoryarticle, id_user) values ('Body language!', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Psychology', '3');

INSERT INTO forumposts(titleforumpost, textforumpost, autorforumpost, categoryforumpost, id_user) values ('Por que...', 'tra tra tra tra tra tra tra tra tra tra tra', 'Juan', 'Psychology', '1');
INSERT INTO forumposts(titleforumpost, textforumpost, autorforumpost, categoryforumpost, id_user) values ('Y si...', 'tra tra tra tra tra tra tra tra tra tra tra', 'Juan', 'Mistery','1');
INSERT INTO forumposts(titleforumpost, textforumpost, autorforumpost, categoryforumpost, id_user) values ('Que piensan de...', 'tra tra tra tra tra tra tra tra tra tra tra', 'Fran', 'Others', '2');

SHOW tables;

