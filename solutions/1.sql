CREATE TABLE songs
(
id int NOT NULL AUTO_INCREMENT,
name varchar(255) NOT NULL,
length float NOT NULL,
album_id int NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY(album_id) REFERENCES albums(id)
);