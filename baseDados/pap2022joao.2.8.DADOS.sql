/*
 Navicat Premium Data Transfer

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : 127.0.0.1:3306
 Source Schema         : pap2022joao

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 11/07/2022 16:43:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for clubes
-- ----------------------------
DROP TABLE IF EXISTS `clubes`;
CREATE TABLE `clubes`  (
  `clubeId` int(11) NOT NULL AUTO_INCREMENT,
  `clubeNome` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clubeLogoURL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clubeAnoFundacao` int(11) NOT NULL,
  `clubeFundadores` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clubeEstadio` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`clubeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clubes
-- ----------------------------
INSERT INTO `clubes` VALUES (6, 'Sport Lisboa e Benfica', 'images/ClubesNovo/benfica.jpg', 1904, ' ', 'EstÃ¡dio da Luz');
INSERT INTO `clubes` VALUES (7, 'Futebol Clube do Porto', 'images/ClubesNovo/porto.jpg', 2000, 'sei lÃ¡ eu', 'EstÃ¡dio do DragÃ£o');
INSERT INTO `clubes` VALUES (8, 'Sporting Clube de Portugal', 'images/ClubesNovo/sporting.jpg', 1906, 'uns cromos quaisquer', 'Alvalade XXI');
INSERT INTO `clubes` VALUES (9, 'Sporting Clube de Braga', 'images/ClubesNovo/braga.jpg', 1925, 'sfd', 'EstÃ¡dio da pedreira');

-- ----------------------------
-- Table structure for epocas
-- ----------------------------
DROP TABLE IF EXISTS `epocas`;
CREATE TABLE `epocas`  (
  `epocaId` int(11) NOT NULL AUTO_INCREMENT,
  `epocaNome` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '2021/2022',
  PRIMARY KEY (`epocaId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of epocas
-- ----------------------------
INSERT INTO `epocas` VALUES (1, '2022/2023');

-- ----------------------------
-- Table structure for jogadorclubes
-- ----------------------------
DROP TABLE IF EXISTS `jogadorclubes`;
CREATE TABLE `jogadorclubes`  (
  `jogadorClubeClubeId` int(11) NOT NULL,
  `jogadorClubeJogadorId` int(11) NOT NULL,
  `jogadorClubeEpocaId` int(11) NOT NULL,
  `jogadorClubeNumero` int(11) NOT NULL,
  PRIMARY KEY (`jogadorClubeClubeId`, `jogadorClubeJogadorId`, `jogadorClubeEpocaId`) USING BTREE,
  INDEX `fk_clubes_has_jogadores_jogadores1_idx`(`jogadorClubeJogadorId`) USING BTREE,
  INDEX `fk_clubes_has_jogadores_clubes_idx`(`jogadorClubeClubeId`) USING BTREE,
  INDEX `fk_clubes_has_jogadores_epocas1_idx`(`jogadorClubeEpocaId`) USING BTREE,
  CONSTRAINT `fk_clubes_has_jogadores_clubes` FOREIGN KEY (`jogadorClubeClubeId`) REFERENCES `clubes` (`clubeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_clubes_has_jogadores_epocas1` FOREIGN KEY (`jogadorClubeEpocaId`) REFERENCES `epocas` (`epocaId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_clubes_has_jogadores_jogadores1` FOREIGN KEY (`jogadorClubeJogadorId`) REFERENCES `jogadores` (`jogadorId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jogadorclubes
-- ----------------------------
INSERT INTO `jogadorclubes` VALUES (6, 3, 1, 125);
INSERT INTO `jogadorclubes` VALUES (6, 4, 1, 12);
INSERT INTO `jogadorclubes` VALUES (6, 5, 1, 1);
INSERT INTO `jogadorclubes` VALUES (6, 6, 1, 48);

-- ----------------------------
-- Table structure for jogadores
-- ----------------------------
DROP TABLE IF EXISTS `jogadores`;
CREATE TABLE `jogadores`  (
  `jogadorId` int(11) NOT NULL AUTO_INCREMENT,
  `jogadorNome` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jogadorFotoURL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jogadorDataNascimento` date NOT NULL,
  PRIMARY KEY (`jogadorId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jogadores
-- ----------------------------
INSERT INTO `jogadores` VALUES (3, 'Otamendiddd', 'images/jogadores/otamendi.jpg', '1989-07-07');
INSERT INTO `jogadores` VALUES (4, 'Odysseas Vlachodimos', 'images/jogadores/vlacodimos.png', '1997-08-15');
INSERT INTO `jogadores` VALUES (5, 'Helton Leite', 'images/jogadores/helton.png', '1990-03-19');
INSERT INTO `jogadores` VALUES (6, 'Mendes', 'images/jogadores/rioAve.jpg', '2016-07-05');

-- ----------------------------
-- Table structure for jogos
-- ----------------------------
DROP TABLE IF EXISTS `jogos`;
CREATE TABLE `jogos`  (
  `jogoId` int(11) NOT NULL AUTO_INCREMENT,
  `jogoCasaClubeId` int(11) NOT NULL,
  `jogoForaClubeId` int(11) NOT NULL,
  `jogoData` date NOT NULL,
  `jogoHora` time NOT NULL,
  PRIMARY KEY (`jogoId`) USING BTREE,
  INDEX `casa_idx`(`jogoCasaClubeId`) USING BTREE,
  INDEX `fora_idx`(`jogoForaClubeId`) USING BTREE,
  CONSTRAINT `casa` FOREIGN KEY (`jogoCasaClubeId`) REFERENCES `clubes` (`clubeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fora` FOREIGN KEY (`jogoForaClubeId`) REFERENCES `clubes` (`clubeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jogos
-- ----------------------------
INSERT INTO `jogos` VALUES (1, 6, 7, '2022-07-11', '20:00:00');
INSERT INTO `jogos` VALUES (2, 7, 8, '2022-07-12', '20:00:00');

-- ----------------------------
-- Table structure for noticias
-- ----------------------------
DROP TABLE IF EXISTS `noticias`;
CREATE TABLE `noticias`  (
  `noticiaId` int(11) NOT NULL AUTO_INCREMENT,
  `noticiaTitulo` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `noticiaData` date NOT NULL,
  `noticiaFotoURL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `noticiaDescricao` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`noticiaId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of noticias
-- ----------------------------
INSERT INTO `noticias` VALUES (3, 'Ricardo Horta assina por 3 Ã©pocas', '2022-07-11', 'images/noticias/noticia1.jpg', '<p style=\"text-align: justify;\">O Benfica recusou uma oferta do Rennes para a contrata&ccedil;&atilde;o de Morato. Quarto classificado na &uacute;ltima Ligue 1 e por isso qualificado para a fase de grupos da Liga Europa, o clube franc&ecirc;s ofereceu &euro;10 milh&otilde;es, com valor acrescido de objetivos, pelo defesa-central brasileiro de 21 anos. As &aacute;guias, por&eacute;m, consideram pouco &euro;10 milh&otilde;es por um jogador no qual investiram &euro;7,5 milh&otilde;es (85 por cento do passe), incluindo servi&ccedil;os de intermedia&ccedil;&atilde;o, no ver&atilde;o de 2019 e que j&aacute; respondeu bem ao mais alto n&iacute;vel.</p>\r\n<p style=\"text-align: justify;\">Na &uacute;ltima &eacute;poca, por exemplo, foi utilizado 25 vezes na equipa principal (20 como titular) e marcou um golo ao Bayern, na fase de grupos da Liga dos Campe&otilde;es, em Munique. Com excesso de defesas-centrais, o Benfica admite negociar Morato, desejado por Ant&oacute;nio Salvador, presidente do SC Braga, no neg&oacute;cio de eventual transfer&ecirc;ncia de Ricardo Horta para a Luz.</p>\r\n<p style=\"text-align: justify;\">O Rennes esteve perto de contratar Samuel Umtiti ao Barcelona, mas a transfer&ecirc;ncia n&atilde;o &eacute; consensual no clube, segundo o treinador Bruno Genesio. O Benfica poder&aacute; ser sens&iacute;vel a oferta de &euro;15 milh&otilde;es. E o Rennes estuda nesta momento a possibilidade de subir a parada para esse valor.</p>');
INSERT INTO `noticias` VALUES (4, 'Schmitd encanta a Luz', '2022-07-12', 'images/noticias/noticia2.jpg', '<p style=\"text-align: justify;\">Um carrossel em alta voltagem. &Agrave; medida que os treinos se intensificam come&ccedil;am a ficar claras e cada vez mais assimiladas as ideias de como Roger Schmidt, 55 anos, pretende ver o Benfica a jogar.</p>\r\n<p style=\"text-align: justify;\">Pela amostra do que aconteceu com o Reading, no s&aacute;bado, naquele que foi o primeiro jogo de treino da &eacute;poca, percebeu-se que os jogadores j&aacute; interiorizaram o que lhes &eacute; exigido. Ainda nem tudo sai na perfei&ccedil;&atilde;o, mas o trabalho leva &agrave; dignifica&ccedil;&atilde;o da tarefa.</p>\r\n<p style=\"text-align: justify;\">E nesse sentido h&aacute; um trio que come&ccedil;a a destacar-se e a ganhar protagonismo: David Neres, Jo&atilde;o M&aacute;rio e Rafa s&atilde;o os homens por quem Schmidt tem puxado para o carrossel ofensivo que quer ver funcionar nas costas do avan&ccedil;ado, que at&eacute; agora tem sido Henrique Ara&uacute;jo.</p>');

-- ----------------------------
-- Table structure for pontos
-- ----------------------------
DROP TABLE IF EXISTS `pontos`;
CREATE TABLE `pontos`  (
  `pontosId` int(11) NOT NULL AUTO_INCREMENT,
  `pontosJogoId` int(11) NOT NULL,
  `pontosClubeId` int(11) NOT NULL,
  `pontosResultado` enum('V','E','D') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'E',
  `pontosValor` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`pontosId`) USING BTREE,
  INDEX `fk_vitorias_jogos1_idx`(`pontosJogoId`) USING BTREE,
  INDEX `fk_vitorias_clubes1_idx`(`pontosClubeId`) USING BTREE,
  CONSTRAINT `fk_vitorias_clubes1` FOREIGN KEY (`pontosClubeId`) REFERENCES `clubes` (`clubeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_vitorias_jogos1` FOREIGN KEY (`pontosJogoId`) REFERENCES `jogos` (`jogoId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pontos
-- ----------------------------
INSERT INTO `pontos` VALUES (1, 1, 6, 'V', 3);
INSERT INTO `pontos` VALUES (2, 1, 7, 'D', 0);
INSERT INTO `pontos` VALUES (3, 2, 7, 'D', 0);
INSERT INTO `pontos` VALUES (4, 2, 8, 'V', 3);

-- ----------------------------
-- Table structure for resultados
-- ----------------------------
DROP TABLE IF EXISTS `resultados`;
CREATE TABLE `resultados`  (
  `resultadoJogoId` int(11) NOT NULL,
  `resultadoGolosCasa` int(11) NOT NULL,
  `resultadoGolosFora` int(11) NOT NULL,
  PRIMARY KEY (`resultadoJogoId`) USING BTREE,
  INDEX `fk_resultados_jogos1_idx`(`resultadoJogoId`) USING BTREE,
  CONSTRAINT `fk_resultados_jogos1` FOREIGN KEY (`resultadoJogoId`) REFERENCES `jogos` (`jogoId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resultados
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
