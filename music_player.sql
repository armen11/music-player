/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : music_player

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2015-12-04 20:13:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for genre
-- ----------------------------
DROP TABLE IF EXISTS `genre`;
CREATE TABLE `genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of genre
-- ----------------------------
INSERT INTO `genre` VALUES ('1', 'Rock');
INSERT INTO `genre` VALUES ('2', 'Jazz');
INSERT INTO `genre` VALUES ('3', 'Hip Hop');

-- ----------------------------
-- Table structure for songs
-- ----------------------------
DROP TABLE IF EXISTS `songs`;
CREATE TABLE `songs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of songs
-- ----------------------------
INSERT INTO `songs` VALUES ('110', 'Big_Blood_-_01_-_Bah-num');
INSERT INTO `songs` VALUES ('111', 'Black_Ant_-_08_-_realest_year_9');
INSERT INTO `songs` VALUES ('112', 'David_H_Porter_-_Mozarts_Rondo_No_3_in_A_Minor_K_511');
INSERT INTO `songs` VALUES ('113', 'Fulgeance_-_Into_Infinity_ear_loop');
INSERT INTO `songs` VALUES ('114', 'Hard_TON_-_07_-_Choc-ice_Dance');
INSERT INTO `songs` VALUES ('115', 'John_Wesley_Coleman_-_07_-_Tequila_10_Seconds');
INSERT INTO `songs` VALUES ('116', 'Jon_Rose_-_03_-_Fly_Trapped_In_A_Violin');
INSERT INTO `songs` VALUES ('117', 'junior85_-_07_-_Function');
INSERT INTO `songs` VALUES ('118', 'Mahjongg_-_01_-__');
INSERT INTO `songs` VALUES ('119', 'Manueljgrotesque_-_24_-_grotesque25');
INSERT INTO `songs` VALUES ('120', 'Marco_Raaphorst_-_mafkees');
INSERT INTO `songs` VALUES ('121', 'Menstruation_Sisters_-_14_-_top_gun');
INSERT INTO `songs` VALUES ('122', 'Supercute_Bye_Byes_-_11_-_odd_number_six');
INSERT INTO `songs` VALUES ('123', 'The_Riffingtons_-_01_-_The_Mystery_Behind_the_Meat_Cloak');
INSERT INTO `songs` VALUES ('124', 'Whitman_-_Chicken_and_Cheese_2_Foot_Village_cover');
INSERT INTO `songs` VALUES ('125', '5unday5essions_-_01_-_Epic_intro');
INSERT INTO `songs` VALUES ('126', 'Cheapmachines_-_01_-_Display_00');
INSERT INTO `songs` VALUES ('127', 'Cindy_Sizer_-_09_-_Mario_Paint_Interlude');
INSERT INTO `songs` VALUES ('128', 'Computer_Jesus_Refrigerator_-_anbdfndf2');
INSERT INTO `songs` VALUES ('129', 'Dave_Girtsman_-_11_-_Goofy_Vocal_Groove');
INSERT INTO `songs` VALUES ('130', 'Ergo_Phizmiz_-_03_-_Wayne_The_Seagull');
INSERT INTO `songs` VALUES ('131', 'junior85_-_08_-_Re-Function');
INSERT INTO `songs` VALUES ('132', 'Lezet_-_48_-_57licking_doorknobs_is_stric');
INSERT INTO `songs` VALUES ('133', 'Staline_Mattin_-_02_-_j_aime_la_tarte_aux_poireaux__mais_j_en_mange_rarement');
INSERT INTO `songs` VALUES ('134', 'The_Books_-_clarinet_clock_loop');
INSERT INTO `songs` VALUES ('135', 'The_Discoghosts_-_07_-_Shortest_Techno');
INSERT INTO `songs` VALUES ('136', ' A Thing For Karen Carpenter');
INSERT INTO `songs` VALUES ('137', 'No Way to Wisdom');
INSERT INTO `songs` VALUES ('138', 'Blood Signature');
INSERT INTO `songs` VALUES ('139', 'Serenade to a Daredevil\'s Devil');

-- ----------------------------
-- Table structure for song_genre
-- ----------------------------
DROP TABLE IF EXISTS `song_genre`;
CREATE TABLE `song_genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `song_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `song_id` (`song_id`),
  KEY `genre_id` (`genre_id`),
  CONSTRAINT `song_genre_ibfk_1` FOREIGN KEY (`song_id`) REFERENCES `songs` (`id`),
  CONSTRAINT `song_genre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of song_genre
-- ----------------------------
INSERT INTO `song_genre` VALUES ('1', '110', '1');
INSERT INTO `song_genre` VALUES ('3', '111', '1');
INSERT INTO `song_genre` VALUES ('4', '112', '1');
INSERT INTO `song_genre` VALUES ('5', '113', '1');
INSERT INTO `song_genre` VALUES ('6', '114', '1');
INSERT INTO `song_genre` VALUES ('8', '115', '2');
INSERT INTO `song_genre` VALUES ('9', '116', '2');
INSERT INTO `song_genre` VALUES ('10', '117', '2');
INSERT INTO `song_genre` VALUES ('11', '118', '2');
INSERT INTO `song_genre` VALUES ('13', '119', '2');
INSERT INTO `song_genre` VALUES ('14', '120', '3');
INSERT INTO `song_genre` VALUES ('15', '121', '3');
INSERT INTO `song_genre` VALUES ('16', '122', '3');
INSERT INTO `song_genre` VALUES ('17', '123', '3');
INSERT INTO `song_genre` VALUES ('18', '124', '3');
INSERT INTO `song_genre` VALUES ('20', '125', '1');
INSERT INTO `song_genre` VALUES ('21', '126', '1');
INSERT INTO `song_genre` VALUES ('22', '127', '1');
INSERT INTO `song_genre` VALUES ('23', '128', '1');
INSERT INTO `song_genre` VALUES ('24', '129', '1');
INSERT INTO `song_genre` VALUES ('25', '130', '2');
INSERT INTO `song_genre` VALUES ('26', '131', '2');
INSERT INTO `song_genre` VALUES ('27', '132', '2');
INSERT INTO `song_genre` VALUES ('28', '133', '2');
INSERT INTO `song_genre` VALUES ('29', '134', '2');
INSERT INTO `song_genre` VALUES ('30', '135', '3');
INSERT INTO `song_genre` VALUES ('31', '136', '3');
INSERT INTO `song_genre` VALUES ('32', '137', '3');
INSERT INTO `song_genre` VALUES ('34', '138', '3');
INSERT INTO `song_genre` VALUES ('35', '139', '3');
