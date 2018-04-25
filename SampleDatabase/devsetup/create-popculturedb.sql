SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `tBands`;
CREATE TABLE `tBands`  (
  `BandID` int(11) NOT NULL AUTO_INCREMENT,
  `BandName` varchar(64),
  `Genre` varchar(32),
  PRIMARY KEY (`BandID`) USING BTREE
);

INSERT INTO `tBands` VALUES ( 1, 'The Beatles', 'British Invasion' );
INSERT INTO `tBands` VALUES ( 2, 'Depeche Mode', 'New Wave' );
INSERT INTO `tBands` VALUES ( 3, 'Green Day', 'Punk Rock' );
INSERT INTO `tBands` VALUES ( 4, '7 Seconds', 'Punk Rock' );
INSERT INTO `tBands` VALUES ( 5, 'Operation Ivy', 'Punk Rock' );
INSERT INTO `tBands` VALUES ( 6, 'Cream', 'British Invasion' );
INSERT INTO `tBands` VALUES ( 7, 'Yazoo', 'New Wave' );
INSERT INTO `tBands` VALUES ( 8, 'Far', 'Emo / Post Hardcore' );
INSERT INTO `tBands` VALUES ( 9, 'The Promise Ring', 'Emo / Post Hardcore' );
INSERT INTO `tBands` VALUES ( 10, 'Sunny Day Real Estate', 'Emo / Post Hardcore' );
INSERT INTO `tBands` VALUES ( 11, 'Slayer', 'Metal' );
INSERT INTO `tBands` VALUES ( 12, 'Megadeth', 'Metal' );

DROP TABLE IF EXISTS `tMusicians`;
CREATE TABLE `tMusicians`  (
  `MusicianID` int(11) NOT NULL AUTO_INCREMENT,
  `MusicianName` varchar(32),
  `Age` int(11) NULL,
  `BandID` int(11) NULL,
  PRIMARY KEY (`MusicianID`) USING BTREE,
  CONSTRAINT `musicians_ibfk_1` FOREIGN KEY (`BandID`) REFERENCES `tBands` (`BandID`) ON DELETE RESTRICT ON UPDATE RESTRICT
);

INSERT INTO `tMusicians` VALUES( 1, 'John Lennon', 64, 1 );
INSERT INTO `tMusicians` VALUES( 2, 'Paul McCartney', 71, 1 );
INSERT INTO `tMusicians` VALUES( 3, 'George Harrison', 63, 1 );
INSERT INTO `tMusicians` VALUES( 4, 'Ringo Starr', 65, 1 );
INSERT INTO `tMusicians` VALUES( 5, 'Pete Best', 70, 1 );

INSERT INTO `tMusicians` VALUES( 6, 'Dave Gahan', 48, 2 );
INSERT INTO `tMusicians` VALUES( 7, 'Martin Gore', 45, 2 );
INSERT INTO `tMusicians` VALUES( 8, 'Andy Fletcher', 47, 2 );
INSERT INTO `tMusicians` VALUES( 9, 'Alan Wilder', 47, 2 );

INSERT INTO `tMusicians` VALUES( 10, 'Billie Joe Armstrong', 44, 3 );
INSERT INTO `tMusicians` VALUES( 11, 'Mike Dirnt', 44, 3 );
INSERT INTO `tMusicians` VALUES( 12, 'Tre Cool', 39, 3 );
INSERT INTO `tMusicians` VALUES( 13, 'Jason White', 40, 3 );
INSERT INTO `tMusicians` VALUES( 14, 'Jason Freese', NULL, 3 );

INSERT INTO `tMusicians` VALUES( 15, 'Kevin Seconds', 53, 4 );
INSERT INTO `tMusicians` VALUES( 16, 'Troy Mowatt', 51, 4 );
INSERT INTO `tMusicians` VALUES( 17, 'Steve Youth', 51, 4 );
INSERT INTO `tMusicians` VALUES( 18, 'Bobby Adams', 48, 4 );

INSERT INTO `tMusicians` VALUES( 19, 'Jesse Michaels', NULL, 5 );
INSERT INTO `tMusicians` VALUES( 20, 'Bret Reid', NULL, 5 );
INSERT INTO `tMusicians` VALUES( 21, 'Tim Armstrong', NULL, 5 );

INSERT INTO `tMusicians` VALUES( 22, 'Eric Clapton', 70, 6 );
INSERT INTO `tMusicians` VALUES( 23, 'Jack Bruce', 70, 6 );
INSERT INTO `tMusicians` VALUES( 24, 'Ginger Baker', 71, 6 );

INSERT INTO `tMusicians` VALUES( 25, 'Vince Clarke', 51, 7 );
INSERT INTO `tMusicians` VALUES( 26, 'Allison Moyet', NULL, 7 );

INSERT INTO `tMusicians` VALUES( 27, 'Jonah Matranga', 44, 8 );
INSERT INTO `tMusicians` VALUES( 28, 'Shaun Lopez', 44, 8 );
INSERT INTO `tMusicians` VALUES( 29, 'John Guttenberger', 44, 8 );
INSERT INTO `tMusicians` VALUES( 30, 'Chris Robyn', 42, 8 );

INSERT INTO `tMusicians` VALUES( 31, 'Jason Gnewikow', NULL, 9 );
INSERT INTO `tMusicians` VALUES( 32, 'Davey von Bohlen', NULL, 9 );
INSERT INTO `tMusicians` VALUES( 33, 'Dan Didier', NULL, 9 );
INSERT INTO `tMusicians` VALUES( 34, 'Scott Schoenbeck', NULL, 9 );

INSERT INTO `tMusicians` VALUES( 35, 'Jeremy Enigk', NULL, 10 );
INSERT INTO `tMusicians` VALUES( 36, 'Dan Hoerner', NULL, 10 );
INSERT INTO `tMusicians` VALUES( 37, 'William Goldsmith', NULL, 10 );
INSERT INTO `tMusicians` VALUES( 38, 'Nate Mendel', NULL, 10 );

INSERT INTO `tMusicians` VALUES( 39, 'Tom Araya', NULL, 11 );
INSERT INTO `tMusicians` VALUES( 40, 'Kerry King', NULL, 11 );
INSERT INTO `tMusicians` VALUES( 41, 'Dave Lombardo', NULL, 11 );
INSERT INTO `tMusicians` VALUES( 42, 'Jeff Hanneman', NULL, 11 );

INSERT INTO `tMusicians` VALUES( 43, 'Dave Mustaine', NULL, 12 );
INSERT INTO `tMusicians` VALUES( 44, 'David Ellefson', NULL, 12 );
INSERT INTO `tMusicians` VALUES( 45, 'Kiko Loureiro', NULL, 12 );
INSERT INTO `tMusicians` VALUES( 46, 'Dirk Verbeuren', NULL, 12 );

