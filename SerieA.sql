CREATE DATABASE SERIE_A;
USE SERIE_A;

CREATE TABLE equipos (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(50) NOT NULL,
    ciudad_equipo VARCHAR(50) NOT NULL,
    estadio_equipo VARCHAR(50) NOT NULL,
    nombre_entrenador VARCHAR(50) NOT NULL
);
CREATE TABLE jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre_jugador VARCHAR(100) NOT NULL,
    apellido_jugador VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    nacionalidad_jugador VARCHAR(50) NOT NULL,
    id_equipo INT,
    CONSTRAINT fk_equipo_jugador FOREIGN KEY (id_equipo) REFERENCES equipos(id_equipo)
);
CREATE TABLE partidos (
    id_partido INT AUTO_INCREMENT PRIMARY KEY,
    fecha_partido DATE NOT NULL,
    equipo_local_id INT,
    equipo_visitante_id INT,
    goles_local INT,
    goles_visitante INT,
    arbitro_partido INT,
    CONSTRAINT fk_equipo_local FOREIGN KEY (equipo_local_id) REFERENCES equipos(id_equipo),
    CONSTRAINT fk_equipo_visitante FOREIGN KEY (equipo_visitante_id) REFERENCES equipos(id_equipo),
    CONSTRAINT fk_arbitro_partido FOREIGN KEY (arbitro_partido) REFERENCES arbitros(id_arbitro)
);
CREATE TABLE arbitros (
    id_arbitro INT AUTO_INCREMENT PRIMARY KEY,
    nombre_arbitro VARCHAR(100) NOT NULL,
    apellido_arbitro VARCHAR(100) NOT NULL,
    nacionalidad_arbitro VARCHAR(50),
    fecha_nacimiento_arbitro DATE
);
CREATE TABLE plantillas (
    id_plantilla INT AUTO_INCREMENT PRIMARY KEY,
    equipo_id INT,
    jugador_id INT,
    tipo ENUM('Oficial', 'Reservas') NOT NULL,
    CONSTRAINT fk_plantilla_equipo FOREIGN KEY (equipo_id) REFERENCES equipos(id_equipo),
    CONSTRAINT fk_plantilla_jugador FOREIGN KEY (jugador_id) REFERENCES jugadores(id_jugador)
);

INSERT INTO equipos (id_equipo, nombre_equipo, ciudad_equipo, estadio_equipo, nombre_entrenador) VALUES
(1, 'Juventus', 'Turín', 'Allianz Stadium', 'Massimiliano Allegri'),
(2, 'AC Milan', 'Milán', 'San Siro', 'Stefano Pioli'),
(3, 'Inter de Milán', 'Milán', 'San Siro', 'Simone Inzaghi'),
(4, 'AS Roma', 'Roma', 'Stadio Olimpico', 'José Mourinho'),
(5, 'Napoli', 'Nápoles', 'Stadio Diego Armando Maradona', 'Rudi Garcia'),
(6, 'Lazio', 'Roma', 'Stadio Olimpico', 'Maurizio Sarri'),
(7, 'Fiorentina', 'Florencia', 'Stadio Artemio Franchi', 'Vincenzo Italiano'),
(8, 'Atalanta', 'Bérgamo', 'Gewiss Stadium', 'Gian Piero Gasperini'),
(9, 'Torino', 'Turín', 'Stadio Olimpico Grande Torino', 'Ivan Jurić'),
(10, 'Sampdoria', 'Génova', 'Stadio Luigi Ferraris', 'Marco Giampaolo'),
(11, 'Genoa', 'Génova', 'Stadio Luigi Ferraris', 'Alexander Blessin'),
(12, 'Bologna', 'Bolonia', 'Stadio Renato DallAra', 'Thiago Motta'),
(13, 'Sassuolo', 'Reggio Emilia', 'Mapei Stadium', 'Alessio Dionisi'),
(14, 'Verona', 'Verona', 'Stadio Marcantonio Bentegodi', 'Marco Zaffaroni'),
(15, 'Empoli', 'Empoli', 'Stadio Carlo Castellani', 'Paolo Zanetti'),
(16, 'Salernitana', 'Salerno', 'Stadio Arechi', 'Paolo Sousa'),
(17, 'Udinese', 'Udine', 'Dacia Arena', 'Andrea Sottil'),
(18, 'Lecce', 'Lecce', 'Stadio Via del Mare', 'Marco Baroni'),
(19, 'Monza', 'Monza', 'U-Power Stadium', 'Raffaele Palladino'),
(20, 'Cagliari', 'Cagliari', 'Unipol Domus', 'Fabio Liverani');

INSERT INTO jugadores (id_jugador, nombre_jugador, apellido_jugador, fecha_nacimiento, nacionalidad_jugador, id_equipo) VALUES
(101, 'Gianluigi', 'Buffon', '1978-01-28', 'Italiano', 1),
(102, 'Leonardo', 'Bonucci', '1987-05-01', 'Italiano', 1),
(103, 'Paulo', 'Dybala', '1993-11-15', 'Argentino', 1),
(104, 'Cristiano', 'Ronaldo', '1985-02-05', 'Portugués', 1),
(105, 'Federico', 'Chiesa', '1997-10-25', 'Italiano', 1),
(106, 'Adrien', 'Rabiot', '1995-04-03', 'Francés', 1),
(107, 'Dusan', 'Vlahovic', '2000-01-28', 'Serbio', 1),
(108, 'Weston', 'McKennie', '1998-08-28', 'Americano', 1),
(109, 'Mattia', 'De Sciglio', '1993-10-20', 'Italiano', 1),
(110, 'Miretti', 'Fabio', '2003-02-03', 'Italiano', 1),
(111, 'Danilo', 'Luis', '1991-07-15', 'Brasileño', 1),
(112, 'Alex', 'Sandro', '1991-01-26', 'Brasileño', 1),
(113, 'Moise', 'Kean', '2000-02-28', 'Italiano', 1),
(114, 'Matthijs', 'de Ligt', '1999-08-12', 'Holandés', 1),
(115, 'Federico', 'Bernardeschi', '1994-02-16', 'Italiano', 1),
(116, 'Leonardo', 'Spinazzola', '1993-03-25', 'Italiano', 1),
(117, 'Juan', 'Cuadrado', '1988-05-26', 'Colombiano', 1),
(118, 'Nicolo', 'Fagioli', '2001-03-12', 'Italiano', 1),
(119, 'Sandro', 'Tonali', '2000-01-08', 'Italiano', 1),
(120, 'Aaron', 'Ramsey', '1990-12-26', 'Gales', 1);

INSERT INTO jugadores (id_jugador, nombre_jugador, apellido_jugador, fecha_nacimiento, nacionalidad_jugador, id_equipo) VALUES
(201, 'Mike', 'Maignan', '1995-07-03', 'Francés', 2),
(202, 'Davide', 'Calabria', '1996-12-06', 'Italiano', 2),
(203, 'Fikayo', 'Tomori', '1997-12-19', 'Inglés', 2),
(204, 'Simon', 'Kjaer', '1989-03-26', 'Danés', 2),
(205, 'Theo', 'Hernández', '1997-10-06', 'Francés', 2),
(206, 'Sandro', 'Tonali', '2000-01-08', 'Italiano', 2),
(207, 'Brahim', 'Díaz', '1999-08-03', 'Español', 2),
(208, 'Ismaël', 'Bennacer', '1997-12-01', 'Argelino', 2),
(209, 'Rafael', 'Leão', '1999-06-10', 'Portugués', 2),
(210, 'Olivier', 'Giroud', '1986-09-30', 'Francés', 2),
(211, 'Ante', 'Rebić', '1993-09-21', 'Croata', 2),
(212, 'Alexis', 'Saelemaekers', '1999-06-22', 'Belga', 2),
(213, 'Theo', 'Hernández', '1997-10-06', 'Francés', 2),
(214, 'Samu', 'Castillejo', '1995-01-18', 'Español', 2),
(215, 'Krzysztof', 'Piatek', '1995-07-01', 'Polaco', 2),
(216, 'Rade', 'Krunić', '1993-05-02', 'Bosnio', 2),
(217, 'Milan', 'Škriniar', '1995-02-11', 'Eslovaco', 2),
(218, 'Léo', 'Dubois', '1995-09-14', 'Francés', 2),
(219, 'Fodé', 'Ballo-Touré', '1997-01-12', 'Senegalés', 2),
(220, 'Daniel', 'Maldini', '2001-10-26', 'Italiano', 2);

INSERT INTO jugadores (id_jugador, nombre_jugador, apellido_jugador, fecha_nacimiento, nacionalidad_jugador, id_equipo) VALUES
(301, 'Samir', 'Handanović', '1984-07-14', 'Esloveno', 3),
(302, 'Milan', 'Škriniar', '1995-02-11', 'Eslovaco', 3),
(303, 'Stefan', 'de Vrij', '1992-02-05', 'Holandés', 3),
(304, 'Alessandro', 'Bastoni', '1999-04-13', 'Italiano', 3),
(305, 'Matteo', 'Darmian', '1989-02-02', 'Italiano', 3),
(306, 'Nicolo', 'Barella', '1997-02-07', 'Italiano', 3),
(307, 'Marcelo', 'Brozović', '1992-07-16', 'Croata', 3),
(308, 'Hakan', 'Çalhanoğlu', '1994-02-08', 'Turco', 3),
(309, 'Lautaro', 'Martínez', '1997-08-22', 'Argentino', 3),
(310, 'Romelu', 'Lukaku', '1993-05-13', 'Belga', 3),
(311, 'Joaquín', 'Correa', '1994-08-13', 'Argentino', 3),
(312, 'Edin', 'Džeko', '1986-03-17', 'Bosnio', 3),
(313, 'Denzel', 'Dumfries', '1996-04-18', 'Neerlandés', 3),
(314, 'Ivan', 'Perišić', '1989-02-02', 'Croata', 3),
(315, 'Federico', 'Dimarco', '1992-11-10', 'Italiano', 3),
(316, 'Stefano', 'Sensi', '1995-08-05', 'Italiano', 3),
(317, 'Roberto', 'Gagliardini', '1993-07-07', 'Italiano', 3),
(318, 'Simone', 'Inzaghi', '1976-04-05', 'Italiano', 3),
(319, 'Andrea', 'Ranocchia', '1988-02-16', 'Italiano', 3),
(320, 'Daniloo', 'DAmbrosio', '1988-09-09','Italiano', 3);

INSERT INTO jugadores (id_jugador, nombre_jugador, apellido_jugador, fecha_nacimiento, nacionalidad_jugador, id_equipo) VALUES
(401, 'Rui', 'Patrício', '1988-02-15', 'Portugués', 4),
(402, 'Gianluca', 'Mancini', '1996-04-17', 'Italiano', 4),
(403, 'Chris', 'Smalling', '1989-11-22', 'Inglés', 4),
(404, 'Leonardo', 'Spinazzola', '1993-03-25', 'Italiano', 4),
(405, 'Federico', 'Fazio', '1987-03-17', 'Argentino', 4),
(406, 'Nicola', 'Zalewski', '2002-01-03', 'Polaco', 4),
(407, 'Bryan', 'Cristante', '1995-03-19', 'Italiano', 4),
(408, 'Gianluca', 'Pellegrini', '1996-06-19', 'Italiano', 4),
(409, 'Jordan', 'Veretout', '1993-03-01', 'Francés', 4),
(410, 'Henrikh', 'Mkhitaryan', '1989-01-21', 'Armenio', 4),
(411, 'Tammy', 'Abraham', '1997-10-02', 'Inglés', 4),
(412, 'Ainsley', 'Maitland-Niles', '1997-08-25', 'Inglés', 4),
(413, 'Eldor', 'Shomurodov', '1995-06-29', 'Uzbeco', 4),
(414, 'Riccardo', 'Calafiori', '2002-09-19', 'Italiano', 4),
(415, 'Sergio', 'Oliveira', '1992-06-02', 'Portugués', 4),
(416, 'Felix', 'Afena-Gyan', '2002-01-19', 'Ghanés', 4),
(417, 'Stephan', 'El Shaarawy', '1992-10-27', 'Italiano', 4),
(418, 'Bruno', 'Peres', '1990-03-01', 'Brasileño', 4),
(419, 'Edoardo', 'Bove', '2002-01-28', 'Italiano', 4),
(420, 'Cristian', 'Volpato', '2003-01-10', 'Italiano', 4);

INSERT INTO jugadores (id_jugador, nombre_jugador, apellido_jugador, fecha_nacimiento, nacionalidad_jugador, id_equipo) VALUES
(501, 'Alex', 'Meret', '1997-03-22', 'Italiano', 5),
(502, 'Giovanni', 'Di Lorenzo', '1993-08-04', 'Italiano', 5),
(503, 'Kostas', 'Manolas', '1991-04-14', 'Griego', 5),
(504, 'Kalidou', 'Koulibaly', '1991-06-20', 'Senegalés', 5),
(505, 'Mario', 'Rui', '1990-05-02', 'Portugués', 5),
(506, 'Fabian', 'Ruiz', '1996-04-03', 'Español', 5),
(507, 'Piotr', 'Zielinski', '1994-05-20', 'Polaco', 5),
(508, 'Lorenzo', 'Insigne', '1991-06-04', 'Italiano', 5),
(509, 'Victor', 'Osimhen', '1998-12-29', 'Nigeriano', 5),
(510, 'Dries', 'Mertens', '1987-05-06', 'Belga', 5),
(511, 'Hirving', 'Lozano', '1995-07-30', 'Mexicano', 5),
(512, 'Elif', 'Elmas', '1999-09-24', 'Turco', 5),
(513, 'Demme', 'Diego', '1991-11-21', 'Alemán', 5),
(514, 'André', 'Frank', '1995-05-30', 'Camerunés', 5),
(515, 'Kvaratskhelia', 'Khvicha', '2001-02-12', 'Georgiano', 5),
(516, 'Giacomo', 'Raspadori', '2000-02-18', 'Italiano', 5),
(517, 'Matteo', 'Politano', '1994-08-15', 'Italiano', 5),
(518, 'Tanguy', 'Ndombele', '1996-12-28', 'Francés', 5),
(519, 'Malcuit', 'Kevin', '1991-07-30', 'Francés', 5),
(520, 'Simeone', 'Gianluca', '1995-08-05', 'Italiano', 5);

INSERT INTO jugadores (id_jugador, nombre_jugador, apellido_jugador, fecha_nacimiento, nacionalidad_jugador, id_equipo) VALUES
(601, 'Thomas', 'Strakosha', '1995-03-19', 'Albanés', 6),
(602, 'Stefan', 'Radu', '1986-10-22', 'Rumano', 6),
(603, 'Francesco', 'Acerbi', '1988-02-10', 'Italiano', 6),
(604, 'Luiz', 'Felipe', '1997-03-22', 'Brasileño', 6),
(605, 'Joaquín', 'Correa', '1994-08-13', 'Argentino', 6),
(606, 'Sergej', 'Milinković-Savić', '1995-02-27', 'Serbio', 6),
(607, 'Ciro', 'Immobile', '1990-02-20', 'Italiano', 6),
(608, 'Luis', 'Alberto', '1992-08-28', 'Español', 6),
(609, 'Manuel', 'Lazzari', '1993-03-29', 'Italiano', 6),
(610, 'Andreas', 'Pereira', '1996-01-01', 'Brasileño', 6),
(611, 'Felipe', 'Anderson', '1993-04-15', 'Brasileño', 6),
(612, 'Adam', 'Marušić', '1992-01-01', 'Montenegrino', 6),
(613, 'Mattia', 'Zaccagni', '1995-06-16', 'Italiano', 6),
(614, 'Patrik', 'Schick', '1996-01-24', 'Checo', 6),
(615, 'Romulo', 'Mourão', '1987-05-29', 'Brasileño', 6),
(616, 'Danilo', 'Cataldi', '1994-01-06', 'Italiano', 6),
(617, 'Ciprian', 'Tătărușanu', '1985-02-09', 'Rumano', 6),
(618, 'Marco', 'Parolo', '1985-01-25', 'Italiano', 6),
(619, 'Gonzalo', 'Escalante', '1993-01-05', 'Argentino', 6),
(620, 'Toma', 'Baldé', '1995-01-05', 'Senegalés', 6);

INSERT INTO jugadores (id_jugador, nombre_jugador, apellido_jugador, fecha_nacimiento, nacionalidad_jugador, id_equipo) VALUES
(701, 'Bartłomiej', 'Drągowski', '1997-01-19', 'Polaco', 7),
(702, 'Nikola', 'Milenković', '1997-10-12', 'Serbio', 7),
(703, 'Cristiano', 'Biraghi', '1992-09-01', 'Italiano', 7),
(704, 'Germán', 'Pezzella', '1991-05-27', 'Argentino', 7),
(705, 'Alfonso', 'Ramsés', '1993-01-18', 'Español', 7),
(706, 'Sofyan', 'Amrabat', '1996-08-21', 'Marroquí', 7),
(707, 'Lucas', 'Martínez', '1996-05-21', 'Argentino', 7),
(708, 'Dusan', 'Vlahovic', '2000-01-28', 'Serbio', 7),
(709, 'Riccardo', 'Saponara', '1991-01-21', 'Italiano', 7),
(710, 'Nicolas', 'Gonzalez', '1998-04-06', 'Argentino', 7),
(711, 'Gaetano', 'Castrovilli', '1997-06-17', 'Italiano', 7),
(712, 'Jonathan', 'Ikoné', '1998-05-02', 'Francés', 7),
(713, 'Krzysztof', 'Piatek', '1995-07-01', 'Polaco', 7),
(714, 'Alberto', 'Ferrari', '1996-03-12', 'Italiano', 7),
(715, 'Riccardo', 'Bennacer', '1997-02-05', 'Argelino', 7),
(716, 'Gonzalo', 'Higuaín', '1987-12-10', 'Argentino', 7),
(717, 'Cecchiare', 'Antonio', '1995-11-20', 'Italiano', 7),
(718, 'Emanuel', 'Vignato', '2000-02-04', 'Italiano', 7),
(719, 'Mattia', 'Destro', '1990-03-20', 'Italiano', 7),
(720, 'Salvatore', 'Sirigu', '1987-01-12', 'Italiano', 7);

INSERT INTO jugadores (id_jugador, nombre_jugador, apellido_jugador, fecha_nacimiento, nacionalidad_jugador, id_equipo) VALUES
(801, 'Juan', 'Musso', '1994-05-06', 'Argentino', 8),
(802, 'Hans', 'Hateboer', '1994-01-30', 'Neerlandés', 8),
(803, 'Cristian', 'Romero', '1998-04-27', 'Argentino', 8),
(804, 'Merih', 'Demiral', '1998-03-05', 'Turco', 8),
(805, 'Giorgio', 'Scalvini', '2003-04-11', 'Italiano', 8),
(806, 'Teun', 'Koopmeiners', '1998-02-04', 'Neerlandés', 8),
(807, 'Martín', 'De Roon', '1991-03-21', 'Neerlandés', 8),
(808, 'Ruslan', 'Malinovskyi', '1993-12-04', 'Ucraniano', 8),
(809, 'Mario', 'Pašalić', '1995-02-20', 'Croata', 8),
(810, 'Duván', 'Zapata', '1991-04-01', 'Colombiano', 8),
(811, 'Luis', 'Muriel', '1991-05-16', 'Colombiano', 8),
(812, 'Alejandro', 'Gómez', '1988-02-15', 'Argentino', 8),
(813, 'Josip', 'Iličić', '1987-01-29', 'Esloveno', 8),
(814, 'Brahim', 'Diaz', '1999-08-03', 'Español', 8),
(815, 'Matteo', 'Pessina', '1997-04-21', 'Italiano', 8),
(816, 'Gianluca', 'Gasperini', '1958-08-26', 'Italiano', 8),
(817, 'Francesco', 'Rientola', '1998-10-13', 'Italiano', 8),
(818, 'Khalid', 'Al-Muwallad', '1989-08-14', 'Saudita', 8),
(819, 'Sergio', 'Dest', '2000-11-03', 'Americano', 8),
(820, 'Stefano', 'Sensi', '1995-08-05', 'Italiano', 8);

INSERT INTO jugadores (id_jugador, nombre_jugador, apellido_jugador, fecha_nacimiento, nacionalidad_jugador, id_equipo) VALUES
(901, 'Etrit', 'Berisha', '1994-03-10', 'Albanés', 9),
(902, 'Wilfried', 'Singo', '2000-01-25', 'Marfileño', 9),
(903, 'Gleison', 'Bremer', '1997-03-18', 'Brasileño', 9),
(904, 'Gian Marco', 'Ferrari', '1995-01-08', 'Italiano', 9),
(905, 'Armando', 'Izzo', '1992-03-02', 'Italiano', 9),
(906, 'Soualiho', 'Meïté', '1994-03-17', 'Francés', 9),
(907, 'Daniele', 'Baselli', '1992-05-09', 'Italiano', 9),
(908, 'Tommaso', 'Boffi', '2001-02-21', 'Italiano', 9),
(909, 'Andrea', 'Belotti', '1993-12-20', 'Italiano', 9),
(910, 'Simone', 'Zaza', '1991-06-25', 'Italiano', 9),
(911, 'Federico', 'Bonazzoli', '1997-12-09', 'Italiano', 9),
(912, 'Nicolás', 'Sánchez', '1993-11-21', 'Argentino', 9),
(913, 'Davide', 'Zappacosta', '1992-06-11', 'Italiano', 9),
(914, 'Sasa', 'Lukic', '1996-05-30', 'Serbio', 9),
(915, 'Alessandro', 'Buongiorno', '1999-02-05', 'Italiano', 9),
(916, 'Lorenzo', 'De Silvestri', '1988-05-23', 'Italiano', 9),
(917, 'Milan', 'Jovancic', '1995-01-09', 'Serbio', 9),
(918, 'Christian', 'Djidji', '1993-01-31', 'Francés', 9),
(919, 'Cristian', 'Molinaro', '1985-02-07', 'Italiano', 9),
(920, 'Emiliano', 'Moretti', '1980-01-25', 'Italiano', 9);

INSERT INTO jugadores (id_jugador, nombre_jugador, apellido_jugador, fecha_nacimiento, nacionalidad_jugador, id_equipo) VALUES
(1001, 'Emil', 'Audero', '1997-01-18', 'Italiano', 10),
(1002, 'Bartosz', 'Bereszynski', '1992-06-12', 'Polaco', 10),
(1003, 'Omar', 'Colley', '1993-12-24', 'Gambiano', 10),
(1004, 'Alex', 'Ferrari', '1993-05-01', 'Italiano', 10),
(1005, 'Maya', 'Yoshida', '1988-08-24', 'Japonés', 10),
(1006, 'Vasco', 'Ramis', '1988-09-09', 'Italiano', 10),
(1007, 'Gaston', 'Ramírez', '1990-06-02', 'Uruguayo', 10),
(1008, 'Antonio', 'Candreva', '1987-02-28', 'Italiano', 10),
(1009, 'Filip', 'Djuricic', '1992-01-30', 'Serbio', 10),
(1010, 'Albin', 'Ekdal', '1989-07-28', 'Sueco', 10),
(1011, 'Mikkel', 'Damsgaard', '2000-07-03', 'Danés', 10),
(1012, 'Francesco', 'Caputo', '1987-08-30', 'Italiano', 10),
(1013, 'Keita', 'Balde', '1995-03-10', 'Senegalés', 10),
(1014, 'Gianluca', 'Caprari', '1993-07-30', 'Italiano', 10),
(1015, 'Simone', 'Verdi', '1992-07-12', 'Italiano', 10),
(1016, 'Manolo', 'Gabbiadini', '1991-11-26', 'Italiano', 10),
(1017, 'Lorenzo', 'Tonelli', '1989-05-02', 'Italiano', 10),
(1018, 'Andrea', 'Conti', '1993-03-02', 'Italiano', 10),
(1019, 'Sebastiano', 'Luperto', '1996-03-20', 'Italiano', 10),
(1020, 'Marco', 'DAversa', '1975-08-15', 'Italiano', 10);

INSERT INTO jugadores (id_jugador, nombre_jugador, apellido_jugador, fecha_nacimiento, nacionalidad_jugador, id_equipo) VALUES
(1101, 'Salvatore', 'Sirigu', '1987-01-12', 'Italiano', 11),
(1102, 'Alberto', 'Paleari', '1994-05-25', 'Italiano', 11),
(1103, 'Mattia', 'Bani', '1994-04-20', 'Italiano', 11),
(1104, 'Nikola', 'Vazquez', '1997-06-05', 'Serbio', 11),
(1105, 'Andrea', 'Masiello', '1986-10-05', 'Italiano', 11),
(1106, 'Felice', 'Masucci', '1990-02-08', 'Italiano', 11),
(1107, 'Luca', 'Vignali', '1996-02-12', 'Italiano', 11),
(1108, 'Stefano', 'Sturaro', '1993-01-09', 'Italiano', 11),
(1109, 'Nicolas', 'Burdisso', '1981-04-12', 'Argentino', 11),
(1110, 'Francesco', 'Cassata', '1997-01-12', 'Italiano', 11),
(1111, 'Goran', 'Pandev', '1983-07-27', 'Macedonio', 11),
(1112, 'Mattia', 'Destro', '1990-03-20', 'Italiano', 11),
(1113, 'Filip', 'Jagiello', '1998-01-29', 'Polaco', 11),
(1114, 'Sandro', 'Tonali', '2000-05-08', 'Italiano', 11),
(1115, 'Davide', 'Zappacosta', '1992-06-11', 'Italiano', 11),
(1116, 'Christian', 'Agudelo', '1997-05-15', 'Colombiano', 11),
(1117, 'Lorenzo', 'Lollo', '1991-11-10', 'Italiano', 11),
(1118, 'Benedikt', 'Giménez', '1996-02-05', 'Alemán', 11),
(1119, 'Emil', 'Audero', '1997-01-18', 'Italiano', 11),
(1120, 'Matteo', 'Politano', '1994-08-15', 'Italiano', 11);

INSERT INTO jugadores (id_jugador, nombre_jugador, apellido_jugador, fecha_nacimiento, nacionalidad_jugador, id_equipo) VALUES
(1201, 'Łukasz', 'Skorupski', '1990-05-05', 'Polaco', 12),
(1202, 'Takehiro', 'Tomiyasu', '1998-11-05', 'Japonés', 12),
(1203, 'Gianluca', 'Milan', '1994-04-04', 'Italiano', 12),
(1204, 'Adama', 'Soumaoro', '1993-01-13', 'Maliense', 12),
(1205, 'Aaron', 'Hickey', '2002-06-10', 'Escocés', 12),
(1206, 'Nicolás', 'Domínguez', '1998-01-06', 'Argentino', 12),
(1207, 'Mattias', 'Svanberg', '1999-07-05', 'Sueco', 12),
(1208, 'Musa', 'Barrow', '1998-09-14', 'Gambiano', 12),
(1209, 'Riccardo', 'Orsolini', '1997-01-24', 'Italiano', 12),
(1210, 'Marko', 'Arnautović', '1989-04-19', 'Austríaco', 12),
(1211, 'Federico', 'Santander', '1991-12-05', 'Paraguayo', 12),
(1212, 'Roberto', 'Soriano', '1990-02-25', 'Italiano', 12),
(1213, 'Lorenzo', 'De Silvestri', '1988-05-02', 'Italiano', 12),
(1214, 'Jerdy', 'Schouten', '1995-02-26', 'Neerlandés', 12),
(1215, 'Andrea', 'Skov Olsen', '1999-07-29', 'Danés', 12),
(1216, 'Bartosz', 'Bereszyński', '1992-06-12', 'Polaco', 12),
(1217, 'Stefano', 'Denswil', '1994-01-02', 'Neerlandés', 12),
(1218, 'Samuele', 'Casti', '1999-09-15', 'Italiano', 12),
(1219, 'Kevin', 'Bonifazi', '1996-01-21', 'Italiano', 12),
(1220, 'Alberto', 'Frison', '1989-01-01', 'Italiano', 12);

INSERT INTO jugadores (id_jugador, nombre_jugador, apellido_jugador, fecha_nacimiento, nacionalidad_jugador, id_equipo) VALUES
(1301, 'Andrea', 'Consigli', '1987-01-27', 'Italiano', 13),
(1302, 'Gianmarco', 'Ferrari', '1993-05-01', 'Italiano', 13),
(1303, 'Kaan', 'Ayhan', '1995-11-10', 'Turco', 13),
(1304, 'Mert', 'Muldur', '1999-02-20', 'Turco', 13),
(1305, 'Roger', 'Cappai', '1994-06-10', 'Italiano', 13),
(1306, 'Filip', 'Djuricic', '1992-01-30', 'Serbio', 13),
(1307, 'Giovanni', 'Simeone', '1995-07-05', 'Argentino', 13),
(1308, 'Nicolas', 'Duncan', '1996-03-06', 'Ghanés', 13),
(1309, 'Giacomo', 'Raspadori', '2000-02-18', 'Italiano', 13),
(1310, 'Maxime', 'Lopez', '1999-09-15', 'Francés', 13),
(1311, 'Hamed', 'Traoré', '1999-02-13', 'Marfileño', 13),
(1312, 'Francesco', 'Caputo', '1987-08-30', 'Italiano', 13),
(1313, 'Luca', 'Haraslin', '1997-04-24', 'Eslovaco', 13),
(1314, 'Emmanuel', 'Riviere', '1990-12-15', 'Francés', 13),
(1315, 'Gianluca', 'Frabotta', '1999-03-04', 'Italiano', 13),
(1316, 'Nico', 'Rovella', '2002-01-17', 'Italiano', 13),
(1317, 'Davide', 'Frattesi', '1999-09-22', 'Italiano', 13),
(1318, 'Alfred', 'Duncan', '1993-12-10', 'Ghanés', 13),
(1319, 'Riccardo', 'Pellegrini', '1999-02-16', 'Italiano', 13),
(1320, 'Filippo', 'Bandinelli', '1996-09-12', 'Italiano', 13);

INSERT INTO jugadores (id_jugador, nombre_jugador, apellido_jugador, fecha_nacimiento, nacionalidad_jugador, id_equipo) VALUES
(1401, 'Marco', 'Silvestri', '1990-03-02', 'Italiano', 14),
(1402, 'Pawel', 'Walukiewicz', '1998-06-02', 'Polaco', 14),
(1403, 'Alessandro', 'Acerbi', '1988-02-10', 'Italiano', 14),
(1404, 'Giovanni', 'Gunter', '1993-03-01', 'Italiano', 14),
(1405, 'Darko', ' Lazović', '1990-10-15', 'Serbio', 14),
(1406, 'Milan', 'Jovanović', '1999-01-03', 'Serbio', 14),
(1407, 'Daniel', 'Bessa', '1993-10-28', 'Brasileño', 14),
(1408, 'Matteo', 'Pessina', '1997-04-21', 'Italiano', 14),
(1409, 'Kevin', 'Lasagna', '1993-08-10', 'Italiano', 14),
(1410, 'Samuel', 'Di Carmine', '1990-11-28', 'Italiano', 14),
(1411, 'Miguel', 'Veloso', '1985-05-11', 'Portugués', 14),
(1412, 'Sergio', 'Vignato', '2000-02-01', 'Italiano', 14),
(1413, 'Edoardo', 'Tercero', '1994-06-01', 'Italiano', 14),
(1414, 'Michele', 'Vitali', '1996-09-18', 'Italiano', 14),
(1415, 'Giovanni', 'Simeone', '1995-07-05', 'Argentino', 14),
(1416, 'Giorgio', 'Chiellini', '1984-08-14', 'Italiano', 14),
(1417, 'Federico', 'Gatti', '1993-01-15', 'Italiano', 14),
(1418, 'Marco', 'Faraoni', '1991-06-05', 'Italiano', 14),
(1419, 'Emanuele', 'Cancellieri', '2002-10-01', 'Italiano', 14),
(1420, 'Vladislav', 'Goncharov', '1998-04-02', 'Ucraniano', 14);

INSERT INTO jugadores (id_jugador, nombre_jugador, apellido_jugador, fecha_nacimiento, nacionalidad_jugador, id_equipo) VALUES
(1501, 'Guglielmo', 'Vicario', '1996-07-07', 'Italiano', 15),
(1502, 'Nicolás', 'Hernández', '1998-05-09', 'Argentino', 15),
(1503, 'Simone', 'Romagnoli', '1994-04-17', 'Italiano', 15),
(1504, 'Federico', 'Di Francesco', '1994-02-02', 'Italiano', 15),
(1505, 'Mattia', 'Destro', '1990-03-20', 'Italiano', 15),
(1506, 'Razvan', 'Marin', '1995-01-24', 'Rumano', 15),
(1507, 'Sandro', 'Tonali', '2000-05-08', 'Italiano', 15),
(1508, 'Sergio', 'Ramos', '1992-10-25', 'Español', 15),
(1509, 'Rafael', 'Poehls', '1997-09-12', 'Brasileño', 15),
(1510, 'Mattia', 'Valoti', '1993-02-22', 'Italiano', 15),
(1511, 'Alfred', 'Duncan', '1993-12-10', 'Ghanés', 15),
(1512, 'Andrea', 'Pinamonti', '1999-05-19', 'Italiano', 15),
(1513, 'Leonardo', 'Stulac', '1996-05-25', 'Italiano', 15),
(1514, 'Luca', 'Donnarumma', '2002-02-02', 'Italiano', 15),
(1515, 'Francesco', 'Caputo', '1987-08-30', 'Italiano', 15),
(1516, 'Gianluca', 'Cavion', '1996-09-06', 'Italiano', 15),
(1517, 'Matteo', 'Brighi', '1984-07-21', 'Italiano', 15),
(1518, 'Mattia', 'Pellegrini', '1999-02-12', 'Italiano', 15),
(1519, 'Simone', 'Bologna', '2001-11-21', 'Italiano', 15),
(1520, 'Francesco', 'Vives', '1995-03-14', 'Italiano', 15);

INSERT INTO jugadores (id_jugador, nombre_jugador, apellido_jugador, fecha_nacimiento, nacionalidad_jugador, id_equipo) VALUES
(1601, 'Luis', 'Milinkovic-Savic', '1997-01-02', 'Serbio', 16),
(1602, 'Vid Belec', 'Belec', '1990-10-07', 'Esloveno', 16),
(1603, 'Franco', 'Vázquez', '1989-02-22', 'Argentino', 16),
(1604, 'Gianluca', 'Caprari', '1993-07-30', 'Italiano', 16),
(1605, 'Pasquale', 'Mazzocchi', '1995-09-21', 'Italiano', 16),
(1606, 'Ruggero', 'Ruggeri', '1997-09-09', 'Italiano', 16),
(1607, 'Diego', 'Costa', '1988-01-07', 'Español', 16),
(1608, 'Milan', 'Djuric', '1991-02-15', 'Bosnio', 16),
(1609, 'Nicolas', 'Schira', '1996-05-05', 'Italiano', 16),
(1610, 'Nicolò', 'Gonzalez', '1998-01-18', 'Argentino', 16),
(1611, 'Antonio', 'Candreva', '1987-02-28', 'Italiano', 16),
(1612, 'Federico', 'Bonazzoli', '1997-12-09', 'Italiano', 16),
(1613, 'Francesco', 'Di Tacchio', '1987-03-17', 'Italiano', 16),
(1614, 'Jean', 'Rondón', '1997-12-05', 'Venezolano', 16),
(1615, 'Simone', 'Verdi', '1992-07-12', 'Italiano', 16),
(1616, 'Luca', 'Ranieri', '1999-09-19', 'Italiano', 16),
(1617, 'Zeki', 'Amdouni', '1999-02-06', 'Suizo', 16),
(1618, 'Gennaro', 'Gattuso', '1977-01-09', 'Italiano', 16),
(1619, 'Marco', 'Milan', '2000-11-02', 'Italiano', 16),
(1620, 'Alessandro', 'Buongiorno', '1999-02-05', 'Italiano', 16);

INSERT INTO jugadores (id_jugador, nombre_jugador, apellido_jugador, fecha_nacimiento, nacionalidad_jugador, id_equipo) VALUES
(1701, 'Marco', 'Silvestri', '1990-03-02', 'Italiano', 17),
(1702, 'Rodrigo', 'De Paul', '1994-11-24', 'Argentino', 17),
(1703, 'Walace', 'Wellington', '1995-02-16', 'Brasileño', 17),
(1704, 'Ignacio', 'Pussetto', '1996-01-14', 'Argentino', 17),
(1705, 'Kevin', 'Lasagna', '1993-08-10', 'Italiano', 17),
(1706, 'Nahuel', 'Molinas', '1998-01-04', 'Argentino', 17),
(1707, 'Rodrigo', 'Pereyra', '1991-09-17', 'Argentino', 17),
(1708, 'Sandi', 'Lovric', '1998-01-17', 'Esloveno', 17),
(1709, 'Destiny', 'Udogie', '2002-11-24', 'Italiano', 17),
(1710, 'Daniele', 'Baselli', '1992-05-09', 'Italiano', 17),
(1711, 'Walace', 'Pereira', '1994-01-06', 'Brasileño', 17),
(1712, 'Samir', 'Handanovic', '1984-07-30', 'Esloveno', 17),
(1713, 'Gerard', 'Deulofeu', '1994-03-13', 'Español', 17),
(1714, 'Sergio', 'Florenzi', '1990-03-11', 'Italiano', 17),
(1715, 'Jakub', 'Jankto', '1996-01-19', 'Checo', 17),
(1716, 'Nicolas', 'Dominguez', '1998-06-06', 'Argentino', 17),
(1717, 'Giorgio', 'Chiellini', '1984-08-14', 'Italiano', 17),
(1718, 'Luca', 'Zanetti', '1995-12-21', 'Italiano', 17),
(1719, 'Marco', 'Davide', '1993-01-21', 'Italiano', 17),
(1720, 'Lorenzo', 'Lollo', '1991-11-10', 'Italiano', 17);

INSERT INTO jugadores (id_jugador, nombre_jugador, apellido_jugador, fecha_nacimiento, nacionalidad_jugador, id_equipo) VALUES
(1801, 'Wojciech', 'Szczesny', '1990-04-18', 'Polaco', 18),
(1802, 'Luca', 'Lezzerini', '1993-03-03', 'Italiano', 18),
(1803, 'Alessandro', 'Tuia', '1991-05-30', 'Italiano', 18),
(1804, 'Fabio', 'Lucioni', '1988-07-23', 'Italiano', 18),
(1805, 'Valerio', 'Verre', '1994-05-15', 'Italiano', 18),
(1806, 'Michele', 'Pisa', '1997-11-18', 'Italiano', 18),
(1807, 'Gabriel', 'Strefezza', '1997-05-23', 'Brasileño', 18),
(1808, 'Fioravante', 'Cecchini', '2000-06-15', 'Italiano', 18),
(1809, 'Lorenzo', 'Venuti', '1994-10-13', 'Italiano', 18),
(1810, 'Filippo', 'Falco', '1992-09-26', 'Italiano', 18),
(1811, 'Nicolò', 'Rovella', '2002-01-17', 'Italiano', 18),
(1812, 'Francesco', 'Rispoli', '1988-04-12', 'Italiano', 18),
(1813, 'Ciccio', 'Caputo', '1987-08-30', 'Italiano', 18),
(1814, 'Giovanni', 'Mancini', '1996-04-01', 'Italiano', 18),
(1815, 'Simone', 'Cruz', '1998-02-28', 'Argentino', 18),
(1816, 'Matteo', 'Cancellieri', '2002-10-01', 'Italiano', 18),
(1817, 'Alessandro', 'Rizzo', '1996-01-29', 'Italiano', 18),
(1818, 'Rafael', 'Strasser', '1994-09-15', 'Ghanés', 18),
(1819, 'Salvatore', 'Esposito', '1999-12-04', 'Italiano', 18),
(1820, 'Leonardo', 'Bonaventura', '1990-12-22', 'Italiano', 18);

INSERT INTO jugadores (id_jugador, nombre_jugador, apellido_jugador, fecha_nacimiento, nacionalidad_jugador, id_equipo) VALUES
(1901, 'Francesco', 'Di Gregorio', '1998-02-09', 'Italiano', 19),
(1902, 'Armando', 'Izzo', '1992-04-04', 'Italiano', 19),
(1903, 'Mario', 'Balotelli', '1990-02-12', 'Italiano', 19),
(1904, 'Mattia', 'Donnarumma', '1999-12-25', 'Italiano', 19),
(1905, 'Pablo', 'Mari', '1994-08-15', 'Español', 19),
(1906, 'Gianluca', 'Caprari', '1993-07-30', 'Italiano', 19),
(1907, 'Samuele', 'Ricci', '2001-11-10', 'Italiano', 19),
(1908, 'Andrea', 'Ranocchia', '1988-01-10', 'Italiano', 19),
(1909, 'Alfred', 'Duncan', '1993-12-10', 'Ghanés', 19),
(1910, 'Federico', 'Cahill', '1997-06-02', 'Italiano', 19),
(1911, 'Valter', 'Birsa', '1986-08-04', 'Esloveno', 19),
(1912, 'Daniele', 'Verde', '1997-06-15', 'Italiano', 19),
(1913, 'Kevin', 'Lasagna', '1993-08-10', 'Italiano', 19),
(1914, 'Giulio', 'Magari', '1997-09-12', 'Italiano', 19),
(1915, 'Gianluca', 'Busio', '2002-05-25', 'Americano', 19),
(1916, 'Alberto', 'Paleari', '1994-05-25', 'Italiano', 19),
(1917, 'Matteo', 'Pellegrini', '1999-02-12', 'Italiano', 19),
(1918, 'Luca', 'Donnarumma', '2002-02-02', 'Italiano', 19),
(1919, 'Edoardo', 'Bianchi', '2001-09-15', 'Italiano', 19),
(1920, 'Riccardo', 'Orsolini', '1997-01-24', 'Italiano', 19);

INSERT INTO jugadores (id_jugador, nombre_jugador, apellido_jugador, fecha_nacimiento, nacionalidad_jugador, id_equipo) VALUES
(2001, 'Giorgio', 'Cragno', '1994-07-18', 'Italiano', 20),
(2002, 'Andrea', 'Cossu', '1983-09-02', 'Italiano', 20),
(2003, 'Leonardo', 'Pavoletti', '1988-11-26', 'Italiano', 20),
(2004, 'Raul', 'Belloni', '1992-10-20', 'Italiano', 20),
(2005, 'Nicolò', 'Barella', '1997-02-07', 'Italiano', 20),
(2006, 'Diego', 'Farias', '1990-06-12', 'Brasileño', 20),
(2007, 'Alberto', 'Cacciatore', '1986-11-11', 'Italiano', 20),
(2008, 'Francesco', 'Crisetig', '1993-03-18', 'Italiano', 20),
(2009, 'Gabriele', 'Zappa', '1998-01-10', 'Italiano', 20),
(2010, 'Daniele', 'Ragatzu', '1992-04-10', 'Italiano', 20),
(2011, 'Matteo', 'Pellegrini', '1999-02-12', 'Italiano', 20),
(2012, 'Gianluca', 'Fiorini', '2000-11-05', 'Italiano', 20),
(2013, 'Alfred', 'Duncan', '1993-12-10', 'Ghanés', 20),
(2014, 'Mattia', 'Valoti', '1993-02-22', 'Italiano', 20),
(2015, 'Dario', 'Benevento', '1997-03-21', 'Italiano', 20),
(2016, 'Salvatore', 'Sirigu', '1987-01-12', 'Italiano', 20),
(2017, 'Luca', 'Gagliano', '1999-10-02', 'Italiano', 20),
(2018, 'Nicola', 'Murru', '1994-01-22', 'Italiano', 20),
(2019, 'Federico', 'Fornasier', '1993-03-16', 'Italiano', 20),
(2020, 'Simone', 'Ponzio', '1998-12-21', 'Italiano', 20);

INSERT INTO arbitros (id_arbitro, nombre_arbitro, apellido_arbitro, nacionalidad_arbitro, fecha_nacimiento_arbitro) VALUES
(1001, 'Paolo', 'Valeri', 'Italiano', '1977-07-13'),
(1002, 'Daniele', 'Orsato', 'Italiano', '1975-11-23'),
(1003, 'Fabio', 'Maresca', 'Italiano', '1981-05-26'),
(1004, 'Guido', 'DElia', 'Italiano', '1979-01-31'),
(1005, 'Marco', 'Guida', 'Italiano', '1982-12-07'),
(1006, 'Nicolò', 'Barbieri', 'Italiano', '1984-06-18'),
(1007, 'Mauro', 'Bergonzi', 'Italiano', '1981-02-02'),
(1008, 'Alessandro', 'Graziani', 'Italiano', '1983-03-15'),
(1009, 'Antonio', 'Giua', 'Italiano', '1984-04-07'),
(1010, 'Massimiliano', 'Irrati', 'Italiano', '1984-08-20');

INSERT INTO partidos (fecha_partido, equipo_local_id, equipo_visitante_id, goles_local, goles_visitante, arbitro_partido) VALUES
('2024-04-01', 1, 2, 1, 2, 1001),  -- Juventus vs AC Milan
('2024-04-01', 3, 4, 0, 1, 1002),  -- Inter de Milan vs Roma
('2024-04-01', 5, 6, 3, 1, 1003),  -- Napoli vs Lazio
('2024-04-01', 7, 8, 2, 3, 1004),  -- Fiorentina vs Atalanta
('2024-04-01', 9, 10, 1, 0, 1005), -- Torino vs Sampdoria

('2024-04-01', 11, 12, 2, 1, 1006), -- Genoa vs Bologna
('2024-04-01', 13, 14, 1, 2, 1007), -- Sassuolo vs Verona
('2024-04-01', 15, 16, 3, 0, 1008), -- Empoli vs Salernitana
('2024-04-01', 17, 18, 0, 1, 1009), -- Udinese vs Lecce
('2024-04-01', 19, 20, 2, 2, 1010); -- Monza vs Cagliari

INSERT INTO partidos (fecha_partido, equipo_local_id, equipo_visitante_id, goles_local, goles_visitante, arbitro_partido) VALUES
('2024-04-02', 1, 3, 2, 1, 1001),  -- Juventus vs Inter de Milan
('2024-04-02', 2, 4, 3, 2, 1002),  -- AC Milan vs Roma
('2024-04-02', 5, 7, 1, 0, 1003),  -- Napoli vs Fiorentina
('2024-04-02', 6, 8, 0, 1, 1004),  -- Lazio vs Atalanta
('2024-04-02', 9, 11, 1, 1, 1005), -- Torino vs Genoa

('2024-04-03', 10, 12, 2, 3, 1006), -- Sampdoria vs Bologna
('2024-04-03', 13, 15, 1, 1, 1007), -- Sassuolo vs Empoli
('2024-04-03', 14, 16, 0, 2, 1008), -- Verona vs Salernitana
('2024-04-03', 17, 18, 2, 2, 1009), -- Udinese vs Lecce
('2024-04-03', 19, 20, 3, 1, 1010), -- Monza vs Cagliari

('2024-04-04', 1, 5, 1, 2, 1001),  -- Juventus vs Napoli
('2024-04-04', 2, 6, 3, 1, 1002),  -- AC Milan vs Lazio
('2024-04-04', 3, 7, 0, 1, 1003),  -- Inter de Milan vs Fiorentina
('2024-04-04', 4, 8, 2, 0, 1004),  -- Roma vs Atalanta
('2024-04-04', 9, 10, 1, 3, 1005), -- Torino vs Sampdoria

('2024-04-05', 11, 13, 2, 2, 1006), -- Genoa vs Sassuolo
('2024-04-05', 12, 14, 3, 1, 1007), -- Bologna vs Verona
('2024-04-05', 15, 17, 1, 0, 1008), -- Empoli vs Udinese
('2024-04-05', 16, 18, 2, 3, 1009), -- Salernitana vs Lecce
('2024-04-05', 19, 1, 0, 4, 1010),  -- Monza vs Juventus

('2024-04-06', 3, 5, 1, 2, 1001),  -- Inter de Milan vs Napoli
('2024-04-06', 2, 8, 1, 1, 1002),  -- AC Milan vs Atalanta
('2024-04-06', 4, 10, 3, 2, 1003), -- Roma vs Sampdoria
('2024-04-06', 6, 9, 2, 0, 1004),  -- Lazio vs Torino
('2024-04-06', 7, 11, 0, 1, 1005), -- Fiorentina vs Genoa

('2024-04-07', 12, 15, 1, 1, 1006), -- Bologna vs Empoli
('2024-04-07', 14, 17, 2, 2, 1007), -- Verona vs Udinese
('2024-04-07', 13, 19, 0, 3, 1008), -- Sassuolo vs Monza
('2024-04-07', 18, 20, 1, 1, 1009), -- Lecce vs Cagliari
('2024-04-07', 5, 16, 2, 1, 1010);  -- Napoli vs Salernitana

INSERT INTO plantillas (equipo_id, jugador_id, tipo) VALUES
(1, 1001, 'Oficial'),  -- Jugador 1
(1, 1002, 'Oficial'),  -- Jugador 2
(1, 1003, 'Oficial'),  -- Jugador 3
(1, 1004, 'Oficial'),  -- Jugador 4
(1, 1005, 'Oficial'),  -- Jugador 5
(1, 1006, 'Oficial'),  -- Jugador 6
(1, 1007, 'Oficial'),  -- Jugador 7
(1, 1008, 'Oficial'),  -- Jugador 8
(1, 1009, 'Oficial'),  -- Jugador 9
(1, 1010, 'Oficial'),  -- Jugador 10
(1, 1011, 'Oficial'),  -- Jugador 11

(1, 1012, 'Reservas'),  -- Jugador Reserva 1
(1, 1013, 'Reservas'),  -- Jugador Reserva 2
(1, 1014, 'Reservas'),  -- Jugador Reserva 3
(1, 1015, 'Reservas'),  -- Jugador Reserva 4
(1, 1016, 'Reservas'),  -- Jugador Reserva 5
(1, 1017, 'Reservas'),  -- Jugador Reserva 6
(1, 1018, 'Reservas'),  -- Jugador Reserva 7
(1, 1019, 'Reservas'),  -- Jugador Reserva 8
(1, 1020, 'Reservas');  -- Jugador Reserva 9

INSERT INTO plantillas (equipo_id, jugador_id, tipo) VALUES
(2, 2001, 'Oficial'),  -- Jugador 1
(2, 2002, 'Oficial'),  -- Jugador 2
(2, 2003, 'Oficial'),  -- Jugador 3
(2, 2004, 'Oficial'),  -- Jugador 4
(2, 2005, 'Oficial'),  -- Jugador 5
(2, 2006, 'Oficial'),  -- Jugador 6
(2, 2007, 'Oficial'),  -- Jugador 7
(2, 2008, 'Oficial'),  -- Jugador 8
(2, 2009, 'Oficial'),  -- Jugador 9
(2, 2010, 'Oficial'),  -- Jugador 10
(2, 2011, 'Oficial'),  -- Jugador 11

(2, 2012, 'Reservas'),  -- Jugador Reserva 1
(2, 2013, 'Reservas'),  -- Jugador Reserva 2
(2, 2014, 'Reservas'),  -- Jugador Reserva 3
(2, 2015, 'Reservas'),  -- Jugador Reserva 4
(2, 2016, 'Reservas'),  -- Jugador Reserva 5
(2, 2017, 'Reservas'),  -- Jugador Reserva 6
(2, 2018, 'Reservas'),  -- Jugador Reserva 7
(2, 2019, 'Reservas'),  -- Jugador Reserva 8
(2, 2020, 'Reservas');  -- Jugador Reserva 9

INSERT INTO plantillas (equipo_id, jugador_id, tipo) VALUES
(3, 301, 'Oficial'),  -- Jugador 1
(3, 302, 'Oficial'),  -- Jugador 2
(3, 303, 'Oficial'),  -- Jugador 3
(3, 304, 'Oficial'),  -- Jugador 4
(3, 305, 'Oficial'),  -- Jugador 5
(3, 306, 'Oficial'),  -- Jugador 6
(3, 307, 'Oficial'),  -- Jugador 7
(3, 308, 'Oficial'),  -- Jugador 8
(3, 309, 'Oficial'),  -- Jugador 9
(3, 310, 'Oficial'),  -- Jugador 10
(3, 311, 'Oficial'),  -- Jugador 11

(3, 312, 'Reservas'),  -- Jugador Reserva 1
(3, 313, 'Reservas'),  -- Jugador Reserva 2
(3, 314, 'Reservas'),  -- Jugador Reserva 3
(3, 315, 'Reservas'),  -- Jugador Reserva 4
(3, 316, 'Reservas'),  -- Jugador Reserva 5
(3, 317, 'Reservas'),  -- Jugador Reserva 6
(3, 318, 'Reservas'),  -- Jugador Reserva 7
(3, 319, 'Reservas'),  -- Jugador Reserva 8
(3, 320, 'Reservas'); -- Jugador Reserva 9

INSERT INTO plantillas (equipo_id, jugador_id, tipo) VALUES
(4, 401, 'Oficial'),  -- Jugador 1
(4, 402, 'Oficial'),  -- Jugador 2
(4, 403, 'Oficial'),  -- Jugador 3
(4, 404, 'Oficial'),  -- Jugador 4
(4, 405, 'Oficial'),  -- Jugador 5
(4, 406, 'Oficial'),  -- Jugador 6
(4, 407, 'Oficial'),  -- Jugador 7
(4, 408, 'Oficial'),  -- Jugador 8
(4, 409, 'Oficial'),  -- Jugador 9
(4, 410, 'Oficial'),  -- Jugador 10
(4, 411, 'Oficial'),  -- Jugador 11

(4, 412, 'Reservas'),  -- Jugador Reserva 1
(4, 413, 'Reservas'),  -- Jugador Reserva 2
(4, 414, 'Reservas'),  -- Jugador Reserva 3
(4, 415, 'Reservas'),  -- Jugador Reserva 4
(4, 416, 'Reservas'),  -- Jugador Reserva 5
(4, 417, 'Reservas'),  -- Jugador Reserva 6
(4, 418, 'Reservas'),  -- Jugador Reserva 7
(4, 419, 'Reservas'),  -- Jugador Reserva 8
(4, 420, 'Reservas'); -- Jugador Reserva 9

INSERT INTO plantillas (equipo_id, jugador_id, tipo) VALUES
(5, 501, 'Oficial'),  -- Jugador 1
(5, 502, 'Oficial'),  -- Jugador 2
(5, 403, 'Oficial'),  -- Jugador 3
(5, 504, 'Oficial'),  -- Jugador 4
(5, 505, 'Oficial'),  -- Jugador 5
(5, 506, 'Oficial'),  -- Jugador 6
(5, 507, 'Oficial'),  -- Jugador 7
(5, 508, 'Oficial'),  -- Jugador 8
(5, 509, 'Oficial'),  -- Jugador 9
(5, 510, 'Oficial'),  -- Jugador 10
(5, 511, 'Oficial'),  -- Jugador 11

(5, 512, 'Reservas'),  -- Jugador Reserva 1
(5, 513, 'Reservas'),  -- Jugador Reserva 2
(5, 514, 'Reservas'),  -- Jugador Reserva 3
(5, 515, 'Reservas'),  -- Jugador Reserva 4
(5, 516, 'Reservas'),  -- Jugador Reserva 5
(5, 517, 'Reservas'),  -- Jugador Reserva 6
(5, 518, 'Reservas'),  -- Jugador Reserva 7
(5, 519, 'Reservas'),  -- Jugador Reserva 8
(5, 520, 'Reservas'); -- Jugador Reserva 9

INSERT INTO plantillas (equipo_id, jugador_id, tipo) VALUES
(6, 601, 'Oficial'),   -- Jugador 1
(6, 602, 'Oficial'),   -- Jugador 2
(6, 603, 'Oficial'),   -- Jugador 3
(6, 604, 'Oficial'),   -- Jugador 4
(6, 605, 'Oficial'),   -- Jugador 5
(6, 606, 'Oficial'),   -- Jugador 6
(6, 607, 'Oficial'),   -- Jugador 7
(6, 608, 'Oficial'),   -- Jugador 8
(6, 609, 'Oficial'),   -- Jugador 9
(6, 610, 'Oficial'),   -- Jugador 10
(6, 611, 'Oficial'),   -- Jugador 11

(6, 612, 'Reservas'),  -- Jugador Reserva 1
(6, 613, 'Reservas'),  -- Jugador Reserva 2
(6, 614, 'Reservas'),  -- Jugador Reserva 3
(6, 615, 'Reservas'),  -- Jugador Reserva 4
(6, 616, 'Reservas'),  -- Jugador Reserva 5
(6, 617, 'Reservas'),  -- Jugador Reserva 6
(6, 618, 'Reservas'),  -- Jugador Reserva 7
(6, 619, 'Reservas'),  -- Jugador Reserva 8
(6, 620, 'Reservas');  -- Jugador Reserva 9




























