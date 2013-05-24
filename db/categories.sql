-- MySQL dump 10.13  Distrib 5.1.66, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: thelife
-- ------------------------------------------------------
-- Server version	5.1.66-0+squeeze1
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` VALUES (6,'2013-05-23 21:21:11','2013-05-23 21:21:11');
INSERT INTO `categories` VALUES (7,'2013-05-23 21:21:56','2013-05-23 21:21:56');
INSERT INTO `categories` VALUES (8,'2013-05-23 21:23:31','2013-05-23 21:23:31');
INSERT INTO `categories` VALUES (9,'2013-05-23 21:24:03','2013-05-23 21:24:03');
INSERT INTO `categories` VALUES (10,'2013-05-23 21:24:48','2013-05-23 21:24:48');
INSERT INTO `categories` VALUES (11,'2013-05-23 21:25:14','2013-05-23 21:25:14');
INSERT INTO `categories` VALUES (12,'2013-05-23 21:25:36','2013-05-23 21:25:36');
INSERT INTO `categories` VALUES (13,'2013-05-23 21:26:05','2013-05-23 21:26:05');
INSERT INTO `categories` VALUES (14,'2013-05-23 21:26:32','2013-05-23 21:26:32');
INSERT INTO `categories` VALUES (15,'2013-05-23 21:27:02','2013-05-23 21:27:02');
INSERT INTO `categories` VALUES (16,'2013-05-23 21:27:23','2013-05-23 21:27:23');
INSERT INTO `categories` VALUES (17,'2013-05-23 21:28:05','2013-05-23 21:28:05');
INSERT INTO `categories` VALUES (18,'2013-05-23 21:28:26','2013-05-23 21:28:26');
INSERT INTO `categories` VALUES (19,'2013-05-23 21:29:06','2013-05-23 21:29:06');
INSERT INTO `categories` VALUES (20,'2013-05-23 21:29:27','2013-05-23 21:29:27');
INSERT INTO `categories` VALUES (21,'2013-05-23 21:30:04','2013-05-23 21:30:04');
INSERT INTO `categories` VALUES (22,'2013-05-23 21:30:26','2013-05-23 21:30:26');

--
-- Table structure for table `category_translations`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_translations` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_category_translations_on_category_id` (`category_id`),
  KEY `index_category_translations_on_locale` (`locale`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_translations`
--

INSERT INTO `category_translations` VALUES (6,6,'en','Here\'s how to pray for your friend at this threshold. Remember, it\'s God that changes our hearts, not clever strategies or great resources.','Pray','2013-05-23 21:21:11','2013-05-23 21:21:11');
INSERT INTO `category_translations` VALUES (7,6,'fr','Voici comment prier pour votre ami selon son seuil. N\'oubliez pas, c\'est Dieu qui change les cœurs, non pas nos stratégies ou même nos bonnes ressources.','Prier','2013-05-23 21:21:11','2013-05-24 15:46:21');
INSERT INTO `category_translations` VALUES (8,7,'en','Like any other relationship, spending time together doing things you both enjoy builds trust. In spending time with your friends, you don\'t want to have any agenda other than to love them. While it\'s important to connect in spiritual conversations, it\'s not necessary every time. Just have fun!','Friendship Building','2013-05-23 21:21:56','2013-05-23 21:21:56');
INSERT INTO `category_translations` VALUES (9,7,'fr','Comme n\'importe-quelle autre relation, passer du bon temps ensemble crée  de la confiance. En passant du temps avec vos amis, vous ne voulez pas avoir aucune motivation cachée à part de les aimer. C\'est bien important de connecter dans des conversations spirituelles, mais ce n\'est pas nécessaire à chaque fois. Tout simplement, amusez-vous!','Bâtir un amitié','2013-05-23 21:21:56','2013-05-24 15:45:33');
INSERT INTO `category_translations` VALUES (10,8,'en','A key principle in building trust is listening to your friends. Learn about who they are, where they come from, and what\'s important for them.\r\n\r\nAs you talk, don\'t argue, contradict, or get offended by things you may not agree with. Just listen, and be interested in the person.\r\n\r\nAlso take the time to look for common ground.\r\n\r\nWhatever perspectives and beliefs they hold, you will have certain things in common.\r\n\r\nIt may be a desire to live justly, a heart for the poor (or other social causes), or just a value for authenticity.\r\n\r\nKeep an eye out for these connections, and affirm them!','Learn','2013-05-23 21:23:31','2013-05-23 23:19:32');
INSERT INTO `category_translations` VALUES (11,8,'fr','Une des clés en bâtissant de la confiance, c\'est écouter vos amis. Demandez qui ils sont, d’où ils viennent, et ce qui leur est important.\r\n\r\nEn parlant, ne vous disputez pas, ne contraduisez pas, et ne soyez pas offensé par des désagréments. Tout simplement, écoutez, et intéressez-vous à eux.\r\n\r\nEn même temps, cherchez des points communs.\r\n\r\nPeu importe leurs perspective et croyances, il y aura des points de vue que vous avez en commun.\r\n\r\nC\'est peut-être un désire de vive de façon juste, de servir les pauvres, ou tout simplement une suif d\'authenticité.\r\n\r\nGardez un œil ouvert pour ces points de connexion, et relevez-les lorsque vous les voyez. ','Apprendre','2013-05-23 21:23:31','2013-05-24 15:44:02');
INSERT INTO `category_translations` VALUES (12,9,'en','Connecting our friends with other Christians can help them build trust as well.\r\n\r\nSpiritual activities like prayer groups or church services may not be helpful at this point, but arranging social settings where friends can interact with Christians, and see that we\'re normal people too, can be revolutionary.','Connect with Community','2013-05-23 21:24:03','2013-05-23 23:18:16');
INSERT INTO `category_translations` VALUES (13,9,'fr','Connecter nos amis avec une communauté d\'autres chrétiens peut les aider à développer de la confiance.\r\n\r\nLes activités spirituelles comme les groupes de prière ou des cultes d\'église ne sont pas nécessairement utile en ce moment, mais organiser des temps sociales où nos amis peuvent interagir avec d\'autres chrétiens, et voir que nous sommes des personnes normales, pourrait être révolutionnaire.\r\n','Connecter avec une communauté','2013-05-23 21:24:03','2013-05-24 15:42:35');
INSERT INTO `category_translations` VALUES (14,10,'en','Much of Jesus\' ministry was serving those around him. This is a great way to show love and build trust.\r\n\r\nServing our friends in out of the ordinary ways is also a great way to pique their curiosity.\r\n\r\nGoing out of our way to help others, especially in ways that require a culturally unusual sacrifice, will help get them wondering.\r\n\r\nBut be aware that this is rarely enough; we can\'t expect our friends to initiate spiritual conversations. We\'ll need to take the initiative too.','Acts of Service','2013-05-23 21:24:48','2013-05-23 21:24:48');
INSERT INTO `category_translations` VALUES (15,10,'fr','Jésus a passé beaucoup de temps à servir les personnes autour de lui. C\'est une très bonne façon de bâtir la confiance.\r\n\r\nServir nos amis, surtout en faisant des choses en dehors de l\'ordinaire, est également une bonne façon de piquer leur curiosité.\r\n\r\nSe mettre en quatre pour aider les autres, surtout en faisant des choses qui sont étrange dans notre culture, peut les faire se poser des questions.\r\n\r\nMais soyez conscient que c\'est rare que les actions suffisent. Nous ne pouvons pas s\'attendre que nos amis initieront des conversations spirituelles; il faut que nous prenions l\'initiative aussi.','Actes de service','2013-05-23 21:24:48','2013-05-24 15:41:14');
INSERT INTO `category_translations` VALUES (16,11,'en','Parables, or concrete stories, can be a great way to build curiosity. They can be drawn from Jesus\' life, from our daily lives, from recent news, or from film, music or television. You can look for themes of brokenness and redemption, or any number of fundamental human needs. Check out the information on cravings language for help on how to do this.','Parables','2013-05-23 21:25:14','2013-05-23 21:25:14');
INSERT INTO `category_translations` VALUES (17,11,'fr','Les paraboles, des histoires concrets, sont une bonne façon de piquer la curiosité. Vous pouvez les tirer de la vie de Jésus, de la vie quotidienne, de l\'actualité, ou des films, de la musique, ou de la télé. Soulignez des thèmes de la nature chuté, de la rédemption, ou d\'autres besoins fondamentaux. Regardes les infos sur les soifs pour de l\'aide sur comment le faire.','Les paraboles','2013-05-23 21:25:14','2013-05-24 15:39:49');
INSERT INTO `category_translations` VALUES (18,12,'en','Asking friends deep questions about their opinions, beliefs, and lives, can serve both to build trust as we listen to their hearts, and to build curiosity as we push them to think through their perspectives in new ways.','Deep Questions','2013-05-23 21:25:36','2013-05-23 21:25:36');
INSERT INTO `category_translations` VALUES (19,12,'fr','Poser des questions profondes sur les avis, les croyances, et les vies de nos amis peut servir à bâtir la confiance en écoutant leurs cœurs, et de créer la curiosité en les poussant à réfléchir à leurs idées d\'une nouvelle perspective.','Des questions profondes','2013-05-23 21:25:36','2013-05-24 15:38:15');
INSERT INTO `category_translations` VALUES (20,13,'en','People in all times and places are driven by a variety of cravings. These desires may seem superficial, like a craving for good marks or a boyfriend, but they tend to show deeper needs: for love, approval, or truth.\r\n\r\nSince we\'re all searching for ways to satisfy these fundamental needs, they\'re a great window to explore how and why God created us, how our natural ways of satisfying our cravings fall short, and how our ultimate satisfaction comes from Him.','Cravings','2013-05-23 21:26:05','2013-05-23 21:26:05');
INSERT INTO `category_translations` VALUES (21,13,'fr','À travers le fil de l\'histoire, et partout dans le monde, les soifs nous poussent à chercher. Même si certaines soifs, comme le désir de bonnes notes ou de relations amoureuses, ont l\'aire superficielles, souvent elles peuvent montrer des besoins plus profonds: l\'amour, l\'approbation, la vérité.\r\n\r\nNous cherchons tous des moyens de satisfaire à ces besoins fondamentaux, alors ils servent de porte d\'entrée pour explorer comment et pourquoi Dieu nous a créés, comment nos façons naturelles de les combler nous laissent insatisfaits, et comment la vrai satisfaction vient de Dieu.','Les Soifs','2013-05-23 21:26:05','2013-05-24 15:29:57');
INSERT INTO `category_translations` VALUES (22,14,'en','Often following Jesus is not so much taught, as caught. Allowing our friends see in us a deep desire to be transformed by Jesus, and showing them  our own weaknesses and share how God transforms us, can shine a light on their own need for change.','Model Openness','2013-05-23 21:26:32','2013-05-23 21:26:32');
INSERT INTO `category_translations` VALUES (23,14,'fr','Souvent, un désir de Jésus est moins quelque chose qu\'on apprend, mais quelque chose qu\'on attrape. Le fait de laisser nos amis voir, en nous, un désir profond de se faire transformer par Jésus -- de leur montrer nos faiblesses et de partager comment Dieu est en train de nous changer, peut éclairer leur propre besoin de changement.','Modeler l\'ouverture','2013-05-23 21:26:32','2013-05-24 15:28:24');
INSERT INTO `category_translations` VALUES (24,15,'en','<p>stub</p>','Life Evaluation','2013-05-23 21:27:02','2013-05-23 21:27:02');
INSERT INTO `category_translations` VALUES (25,15,'fr','','','2013-05-23 21:27:02','2013-05-23 21:27:02');
INSERT INTO `category_translations` VALUES (26,16,'en','<p>stub</p>','Challenge to Openness','2013-05-23 21:27:23','2013-05-23 21:27:23');
INSERT INTO `category_translations` VALUES (27,16,'fr','','','2013-05-23 21:27:23','2013-05-23 21:27:23');
INSERT INTO `category_translations` VALUES (28,17,'en','Inviting a friend to study the scriptures together can be very helpful at thresholds 3, 4, and 5.\r\n\r\nFor friends who are <b>curious</b>, seeing Jesus challenge others to openness can help our friends become open.\r\n\r\nFor those who are <b>open to change</b>, modelling how you seek God in His word can help them to start seeking.\r\n\r\nJesus often challenges <b>seekers</b> to make a decision. Look at these texts, and what he says about salvation.','Study the Scriptures','2013-05-23 21:28:05','2013-05-23 21:28:05');
INSERT INTO `category_translations` VALUES (29,17,'fr','Inviter un ami à étudier les écritures ensemble peut être très utile aux seuils 3, 4, et 5.\r\n\r\nPour ceux qui sont <b>curieux</b>, voir Jésus lancer un défi à l\'ouverture peut aider nos amis a s\'ouvrir.\r\n\r\nPour des amis qui sont <b>ouvert au changement</b>, modeler comment vous cherchez Dieu dans sa parole peut les aider à commencer a chercher.\r\n\r\nSouvent, Jésus demande des <b>chercheurs</b> à prendre une décision. Regarder ces textes, et ses enseignements sur le salut.','Étudier les écritures','2013-05-23 21:28:05','2013-05-24 15:25:20');
INSERT INTO `category_translations` VALUES (30,18,'en','<p>stub</p>','Share your Relationship with God','2013-05-23 21:28:26','2013-05-23 21:28:26');
INSERT INTO `category_translations` VALUES (31,18,'fr','','','2013-05-23 21:28:26','2013-05-23 21:28:26');
INSERT INTO `category_translations` VALUES (32,19,'en','For friends at thresholds four and five, compelling answers for their hesitations about faith can be crucial.\r\n\r\nHowever, this means a lot more than simply presenting well-reasoned or well-supported arguments.\r\n\r\nIn a post-modern culture, we need to show how our answers apply to our personal realities, and those of our friends, too.','Compelling Answers','2013-05-23 21:29:06','2013-05-23 21:29:06');
INSERT INTO `category_translations` VALUES (33,19,'fr','Pour les gens aux seuils quatre et cinq, des réponses persuasives à leurs hésitations sur la foi peuvent être cruciales.\r\n\r\nPourtant, ça comprend beaucoup plus que présenter des arguments bien raisonnés.\r\n\r\nDans une société poste-moderne, nous devons montrer comment ces réponses s\'appliquent à nos vies personnelles, et celles de nos amis aussi.','Des réponses interpellantes persuasives','2013-05-23 21:29:06','2013-05-24 15:22:31');
INSERT INTO `category_translations` VALUES (34,20,'en','<p>stub.</p>','Challenge to Seeking','2013-05-23 21:29:27','2013-05-23 21:29:27');
INSERT INTO `category_translations` VALUES (35,20,'fr','','','2013-05-23 21:29:27','2013-05-23 21:29:27');
INSERT INTO `category_translations` VALUES (36,21,'en','A Gospel summary or tract can be used at most thresholds, but they often have a very helpful feature for friends who are near to <b>entering the kingdom:</b> a clear call to decision.\r\n\r\nIf you use a gospel summary with a friend earlier in the process, it is probably not a good idea to repeatedly ask him to make a decision to follow Jesus. But with those who are actively searching, a clear call to decision is crucial.','Share a Gospel Summary','2013-05-23 21:30:04','2013-05-23 21:30:04');
INSERT INTO `category_translations` VALUES (37,21,'fr','Une résume de l\'Évangile ou un tract, peut être utile à tous les seuils, mais ils partagent une caractéristique qui est très utile pour les amis qui <b>s\'approche au Royaume</b> : un appel clair à une décision.\r\n\r\nSi vous utilisez un tract avec un ami plus tôt dans le processus, ce n\'est probablement pas une bonne idée de faire des appels répétés à suivre Jésus. Mais avec ceux qui sont activement <b>à la recherche de Dieu</b>, un appel clair à prendre une décision est crucial.','Partager une résumé de l\'évangile','2013-05-23 21:30:04','2013-05-24 15:17:49');
INSERT INTO `category_translations` VALUES (38,22,'en','Activities to help you use theLife App and understand its evangelism model.','Instructional','2013-05-23 21:30:26','2013-05-23 21:30:26');
INSERT INTO `category_translations` VALUES (39,22,'fr','Des activités pour vous aider à utiliser laVie Mobile et à mieux comprendre son approche d\'évangélisation.','Éducative','2013-05-23 21:30:26','2013-05-24 15:14:47');
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-24 12:19:39
