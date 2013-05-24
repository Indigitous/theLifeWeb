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
-- Table structure for table `active_admin_comments`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_admin_comments` (
  `id` int(11) NOT NULL,
  `resource_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `resource_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `namespace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_active_admin_comments_on_author_type_and_author_id` (`author_type`,`author_id`),
  KEY `index_active_admin_comments_on_namespace` (`namespace`),
  KEY `index_admin_notes_on_resource_type_and_resource_id` (`resource_type`,`resource_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_admin_comments`
--


--
-- Table structure for table `activities`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '10',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `has_threshold` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_activities_on_category_id` (`category_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` VALUES (1,NULL,'2013-05-23 19:41:53','2013-05-23 19:41:53',10,NULL,1);
INSERT INTO `activities` VALUES (4,7,'2013-05-23 21:48:55','2013-05-23 21:48:55',10,NULL,0);
INSERT INTO `activities` VALUES (5,9,'2013-05-23 21:53:45','2013-05-23 21:53:45',10,NULL,0);
INSERT INTO `activities` VALUES (6,21,'2013-05-23 21:55:44','2013-05-23 21:55:44',10,NULL,0);
INSERT INTO `activities` VALUES (7,9,'2013-05-23 21:56:44','2013-05-23 21:56:44',10,NULL,0);
INSERT INTO `activities` VALUES (8,7,'2013-05-23 21:57:33','2013-05-23 21:57:33',10,NULL,0);
INSERT INTO `activities` VALUES (9,7,'2013-05-23 21:58:23','2013-05-23 21:58:23',10,NULL,0);
INSERT INTO `activities` VALUES (10,7,'2013-05-23 21:59:07','2013-05-23 21:59:07',10,NULL,0);
INSERT INTO `activities` VALUES (11,13,'2013-05-23 22:00:15','2013-05-23 22:00:15',10,NULL,0);
INSERT INTO `activities` VALUES (12,12,'2013-05-23 22:01:50','2013-05-23 22:01:50',10,NULL,0);
INSERT INTO `activities` VALUES (13,21,'2013-05-23 22:02:59','2013-05-23 22:02:59',10,NULL,0);
INSERT INTO `activities` VALUES (14,19,'2013-05-23 22:03:56','2013-05-23 22:05:38',10,NULL,0);
INSERT INTO `activities` VALUES (15,14,'2013-05-23 22:06:50','2013-05-23 22:06:50',10,NULL,0);
INSERT INTO `activities` VALUES (16,13,'2013-05-23 22:09:33','2013-05-23 22:09:33',10,NULL,0);
INSERT INTO `activities` VALUES (17,6,'2013-05-23 22:10:33','2013-05-23 22:13:14',1,NULL,0);
INSERT INTO `activities` VALUES (18,6,'2013-05-23 22:11:29','2013-05-23 22:13:02',1,NULL,0);
INSERT INTO `activities` VALUES (19,6,'2013-05-23 22:12:38','2013-05-23 22:12:38',1,NULL,0);
INSERT INTO `activities` VALUES (20,6,'2013-05-23 22:14:25','2013-05-23 22:14:25',1,NULL,0);
INSERT INTO `activities` VALUES (21,6,'2013-05-23 22:15:12','2013-05-23 22:15:12',1,NULL,0);
INSERT INTO `activities` VALUES (22,6,'2013-05-23 22:16:03','2013-05-23 22:16:03',1,NULL,0);
INSERT INTO `activities` VALUES (23,12,'2013-05-23 22:17:18','2013-05-23 22:17:18',10,NULL,0);
INSERT INTO `activities` VALUES (24,17,'2013-05-23 22:19:03','2013-05-23 22:19:03',10,NULL,0);
INSERT INTO `activities` VALUES (25,17,'2013-05-23 22:20:23','2013-05-23 22:20:23',10,NULL,0);
INSERT INTO `activities` VALUES (26,20,'2013-05-23 22:23:57','2013-05-23 22:23:57',10,NULL,0);
INSERT INTO `activities` VALUES (27,13,'2013-05-23 22:25:24','2013-05-23 22:25:24',10,NULL,0);
INSERT INTO `activities` VALUES (28,13,'2013-05-23 22:27:27','2013-05-23 22:27:27',10,NULL,0);
INSERT INTO `activities` VALUES (29,13,'2013-05-23 22:29:16','2013-05-23 22:29:16',10,NULL,0);
INSERT INTO `activities` VALUES (30,22,'2013-05-23 22:32:19','2013-05-23 22:32:19',1,NULL,0);
INSERT INTO `activities` VALUES (31,21,'2013-05-23 22:33:12','2013-05-23 22:33:12',10,NULL,0);
INSERT INTO `activities` VALUES (32,19,'2013-05-23 22:34:16','2013-05-23 22:34:16',10,NULL,0);
INSERT INTO `activities` VALUES (33,7,'2013-05-23 22:35:00','2013-05-23 22:35:00',10,NULL,0);
INSERT INTO `activities` VALUES (34,NULL,'2013-05-23 22:36:03','2013-05-23 22:36:03',1,NULL,0);
INSERT INTO `activities` VALUES (35,NULL,'2013-05-23 22:36:57','2013-05-23 22:36:57',10,NULL,0);

--
-- Table structure for table `activities_thresholds`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activities_thresholds` (
  `activity_id` int(11) DEFAULT NULL,
  `threshold_id` int(11) DEFAULT NULL,
  KEY `index_activities_thresholds_on_activity_id_and_threshold_id` (`activity_id`,`threshold_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities_thresholds`
--

INSERT INTO `activities_thresholds` VALUES (1,1);
INSERT INTO `activities_thresholds` VALUES (1,2);
INSERT INTO `activities_thresholds` VALUES (1,3);
INSERT INTO `activities_thresholds` VALUES (1,4);
INSERT INTO `activities_thresholds` VALUES (1,5);
INSERT INTO `activities_thresholds` VALUES (1,6);
INSERT INTO `activities_thresholds` VALUES (1,7);
INSERT INTO `activities_thresholds` VALUES (4,2);
INSERT INTO `activities_thresholds` VALUES (5,2);
INSERT INTO `activities_thresholds` VALUES (6,3);
INSERT INTO `activities_thresholds` VALUES (6,4);
INSERT INTO `activities_thresholds` VALUES (6,5);
INSERT INTO `activities_thresholds` VALUES (6,6);
INSERT INTO `activities_thresholds` VALUES (7,2);
INSERT INTO `activities_thresholds` VALUES (8,2);
INSERT INTO `activities_thresholds` VALUES (9,2);
INSERT INTO `activities_thresholds` VALUES (10,2);
INSERT INTO `activities_thresholds` VALUES (11,3);
INSERT INTO `activities_thresholds` VALUES (12,2);
INSERT INTO `activities_thresholds` VALUES (12,3);
INSERT INTO `activities_thresholds` VALUES (12,4);
INSERT INTO `activities_thresholds` VALUES (13,5);
INSERT INTO `activities_thresholds` VALUES (13,6);
INSERT INTO `activities_thresholds` VALUES (14,5);
INSERT INTO `activities_thresholds` VALUES (15,2);
INSERT INTO `activities_thresholds` VALUES (15,3);
INSERT INTO `activities_thresholds` VALUES (15,4);
INSERT INTO `activities_thresholds` VALUES (15,5);
INSERT INTO `activities_thresholds` VALUES (16,3);
INSERT INTO `activities_thresholds` VALUES (16,4);
INSERT INTO `activities_thresholds` VALUES (17,2);
INSERT INTO `activities_thresholds` VALUES (18,3);
INSERT INTO `activities_thresholds` VALUES (19,4);
INSERT INTO `activities_thresholds` VALUES (20,5);
INSERT INTO `activities_thresholds` VALUES (21,6);
INSERT INTO `activities_thresholds` VALUES (22,7);
INSERT INTO `activities_thresholds` VALUES (23,2);
INSERT INTO `activities_thresholds` VALUES (23,3);
INSERT INTO `activities_thresholds` VALUES (24,4);
INSERT INTO `activities_thresholds` VALUES (24,5);
INSERT INTO `activities_thresholds` VALUES (25,6);
INSERT INTO `activities_thresholds` VALUES (25,7);
INSERT INTO `activities_thresholds` VALUES (26,3);
INSERT INTO `activities_thresholds` VALUES (26,4);
INSERT INTO `activities_thresholds` VALUES (27,2);
INSERT INTO `activities_thresholds` VALUES (27,3);
INSERT INTO `activities_thresholds` VALUES (28,3);
INSERT INTO `activities_thresholds` VALUES (29,4);
INSERT INTO `activities_thresholds` VALUES (30,1);
INSERT INTO `activities_thresholds` VALUES (31,5);
INSERT INTO `activities_thresholds` VALUES (31,6);
INSERT INTO `activities_thresholds` VALUES (32,5);
INSERT INTO `activities_thresholds` VALUES (32,6);
INSERT INTO `activities_thresholds` VALUES (33,2);
INSERT INTO `activities_thresholds` VALUES (34,2);
INSERT INTO `activities_thresholds` VALUES (34,3);
INSERT INTO `activities_thresholds` VALUES (35,4);
INSERT INTO `activities_thresholds` VALUES (35,5);
INSERT INTO `activities_thresholds` VALUES (35,6);
INSERT INTO `activities_thresholds` VALUES (35,7);

--
-- Table structure for table `activity_translations`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_translations` (
  `id` int(11) NOT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_activity_translations_on_activity_id` (`activity_id`),
  KEY `index_activity_translations_on_locale` (`locale`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_translations`
--

INSERT INTO `activity_translations` VALUES (1,1,'en','Change Threshold','$u has moved $f to $t','<p>Use this activity to move your friend to a new threshold.</p>\r\n','2013-05-23 19:41:53','2013-05-23 19:58:03');
INSERT INTO `activity_translations` VALUES (4,1,'fr','','','','2013-05-23 19:58:03','2013-05-23 19:58:03');
INSERT INTO `activity_translations` VALUES (5,4,'en','Invite for Dinner','$u had $f over for dinner','<p>Eating together is a great way to build a relationship. Inviting a friend for dinner, and cooking for them, is also a great way to serve.</p>\r\n','2013-05-23 21:48:55','2013-05-23 21:48:55');
INSERT INTO `activity_translations` VALUES (6,4,'fr','','','','2013-05-23 21:48:55','2013-05-23 21:48:55');
INSERT INTO `activity_translations` VALUES (7,5,'en','Board Games Night','$u had $f over for a board games night','<p>Invite a mixed group of Christians and non-Christians to play board games. Make sure the Christians understand that the point isn&#39;t to preach at their non-Christian friends, but just to build friendships.</p>\r\n','2013-05-23 21:53:45','2013-05-23 23:13:52');
INSERT INTO `activity_translations` VALUES (8,5,'fr','','','','2013-05-23 21:53:45','2013-05-23 21:53:45');
INSERT INTO `activity_translations` VALUES (9,6,'en','The Big Story Gospel Presentation','$u shared The Big Story Gospel presentation with $f','<p>The Big Story is a Gospel summary developped by IVCF. You can read about it in the book <a href=\"http://www.amazon.com/True-Story-Christianity-Worth-Believing/dp/0830836098\">True Story</a>, watch it on <a href=\"https://www.youtube.com/watch?v=kCVcSiUUMhY\">Youtube</a>, or download the &quot;New World&quot; app on <a href=\"https://play.google.com/store/apps/details?id=com.mmf.newworld\">Android</a> or <a href=\"http://itunes.apple.com/us/app/new-world-gospel-presentation/id586400975?mt=8\">iPhone</a> to help you share it with a friend.</p>\r\n\r\n<p>For friends in the Seeking God or Entering the Kingom thresholds, the <a href=\"https://www.youtube.com/watch?v=p4V60n6KiB8\">part 2</a>&nbsp; of the presentation offers some good challenges for next steps, but remember that pushing on these steps may not be helpful for friends earlier in their journey.</p>\r\n','2013-05-23 21:55:44','2013-05-24 00:03:54');
INSERT INTO `activity_translations` VALUES (10,6,'fr','','','','2013-05-23 21:55:44','2013-05-23 21:55:44');
INSERT INTO `activity_translations` VALUES (11,7,'en','Team Sports','$u played sports with $f','<p>Set up a pickup grame of basketball, soccer, street hockey, or whatever! Sports are a great way to bond with teammates.</p>\r\n','2013-05-23 21:56:44','2013-05-23 21:56:44');
INSERT INTO `activity_translations` VALUES (12,7,'fr','','','','2013-05-23 21:56:44','2013-05-23 21:56:44');
INSERT INTO `activity_translations` VALUES (13,8,'en','Jogging/Work out','$u worked out with $f','<p>If you&#39;re going to the gym or for a run, invite a friend! Working out together, and encouraging each other to go harder, really helps build trust.</p>\r\n','2013-05-23 21:57:33','2013-05-23 23:12:13');
INSERT INTO `activity_translations` VALUES (14,8,'fr','','','','2013-05-23 21:57:33','2013-05-23 21:57:33');
INSERT INTO `activity_translations` VALUES (15,9,'en','Social Outings','$u went out with $f','<p>Take your non-Christian friends out bowling, skating, to a show, to a movie, to play pool, or to do anything you&#39;d do with friends!</p>\r\n','2013-05-23 21:58:23','2013-05-24 00:08:57');
INSERT INTO `activity_translations` VALUES (16,9,'fr','','','','2013-05-23 21:58:23','2013-05-23 21:58:23');
INSERT INTO `activity_translations` VALUES (17,10,'en','Study Together','$u studied with $f','<p>Spend time together studying; being with others, and working on problems or projects together, builds friendship.</p>\r\n','2013-05-23 21:59:07','2013-05-23 21:59:07');
INSERT INTO `activity_translations` VALUES (18,10,'fr','','','','2013-05-23 21:59:07','2013-05-23 21:59:07');
INSERT INTO `activity_translations` VALUES (19,11,'en','Book Discussion: Soul Cravings','$u talked about Soul Cravings with $f','<p><a href=\"http://store.powertochange.org/p-2-soul-cravings-prequel.aspx\"><img src=\"https://srv1.thelifeapp.com/static/images/soul_cravings_prequil.jpg\" style=\"float:left\" /></a>God created us all with three profound cravings: for intimacy, for meaning, and for destiny. Erwin McManus&#39; book Soul Cravings explores how these cravings point us to the only thing that can ultimately fulfill them -- God.</p>\r\n\r\n<p>It&#39;s available as a short, <a href=\"http://store.powertochange.org/p-2-soul-cravings-prequel.aspx\">Prequel edition</a>, and a <a href=\"http://store.powertochange.org/p-332-soul-cravings.aspx\">full-length book</a>, which would be great for an ongoing book study with a friend.</p>\r\n','2013-05-23 22:00:15','2013-05-24 00:02:18');
INSERT INTO `activity_translations` VALUES (20,11,'fr','','','','2013-05-23 22:00:15','2013-05-23 22:00:15');
INSERT INTO `activity_translations` VALUES (21,12,'en','Soularium Photo Questionnaire','$u did a Soularium questionnaire with $f','<p><img src=\"https://srv1.thelifeapp.com/static/images/soularium.jpg\" style=\"float:left\" />Which of these photos best represents your life? Which represent what you want out of life? Which, for you, represent your conception of God?</p>\r\n\r\n<p>Soularium is a photo questionnaire, which speaks to creative personalities and serves as a great conversation starter. It&#39;s important to listen intently to your friend as you have this conversation, and can be a great springboard to share your own testimony using the same photos.</p>\r\n\r\n<p>Since the Soularium is just a conversation starter, it can be used at several different thresholds -- it really all depends on the conversation!</p>\r\n\r\n<p>It is available in several editions, including an iOS and <a href=\"https://play.google.com/store/apps/details?id=air.com.scm.soularium.english.ipad.v1\">Android</a> app. If you would like a hard copy, you can order it from <a href=\"http://store.powertochange.org/p-312-soularium-kit.aspx\">Power to Change&#39;s resource centre</a>.</p>\r\n','2013-05-23 22:01:50','2013-05-24 00:00:53');
INSERT INTO `activity_translations` VALUES (22,12,'fr','','','','2013-05-23 22:01:50','2013-05-23 22:01:50');
INSERT INTO `activity_translations` VALUES (23,13,'en','Knowing God Personally','$u shared Knowing God Personally with $f','<p><img src=\"https://srv1.thelifeapp.com/static/images/knowing_god_personally.jpg\" style=\"float:left\" />Knowing God Personally is a variation of the classic Four Spiritual Laws Gospel summary. It&#39;s available in several different printed versions, or as a part of the God Tools app for Android &amp; iOS. Using it can be as simple as sitting down and reading it with a friend.</p>\r\n','2013-05-23 22:02:59','2013-05-24 02:18:21');
INSERT INTO `activity_translations` VALUES (24,13,'fr','','','','2013-05-23 22:02:59','2013-05-23 22:02:59');
INSERT INTO `activity_translations` VALUES (25,14,'en','Ultimate Questions: Does God Exist?','$u shared Ultimate Questions: Does God Exist with $f','<p><a href=\"http://store.powertochange.org/p-19-ultimate-questions-does-god-exist.aspx\"><img src=\"https://srv1.thelifeapp.com/static/images/ultimate_questions.jpg\" style=\"float:left\" /></a> This is a great tool to start your friend thinking about the existence of God. But remember, we&#39;re going for deep interactions rather than arguments or just handing out literature. Make sure to really connect on the issues, and don&#39;t get combative or defensive. You can get hard copies at the <a href=\"http://store.powertochange.org/p-19-ultimate-questions-does-god-exist.aspx\">Power to Change Resource Centre</a> or check out <a href=\"http://www.ultimatequestions.org/\">ultimatequestions.org/</a></p>\r\n','2013-05-23 22:03:56','2013-05-24 01:50:49');
INSERT INTO `activity_translations` VALUES (26,14,'fr','','','','2013-05-23 22:03:56','2013-05-23 22:03:56');
INSERT INTO `activity_translations` VALUES (27,15,'en','Share your My Story Video','$u shared their My Story with $f','<p><img src=\"https://srv1.thelifeapp.com/static/images/my_story.jpg\" style=\"float:left\" />My Story is a small group training series that will invigorate your evangelism through the powerful intersection of social media, your personal story and the Gospel. With this cutting-edge video training series you will learn how to craft an authetic story of how Jesus has transformed your cravings and with the help of your group, post your story online to share with friends. Then use your My Story video to spark conversations about Jesus and our quest to meet our deepest cravings. Watch or order the video series on <a href=\"http://powertochange.com/students/my-story/\">powertochange.org/students</a>.</p>\r\n','2013-05-23 22:06:50','2013-05-23 23:56:14');
INSERT INTO `activity_translations` VALUES (28,15,'fr','','','','2013-05-23 22:06:50','2013-05-23 22:06:50');
INSERT INTO `activity_translations` VALUES (29,16,'en','Cravings Soularium','$u did a cravings-based Soularium questionnaire with $f','<p><img src=\"https://srv1.thelifeapp.com/static/images/soularium.jpg\" style=\"float:left\" />The <a href=\"http://store.powertochange.org/p-312-soularium-kit.aspx\">Soularium photo questionnaire</a> can be adjusted for a cravings-based conversation. After you&#39;ve identified a key craving in a friend&#39;s life, ask questions to underline:</p>\r\n\r\n<p>1) Your friend&#39;s view of that craving<br />\r\n2) How the craving shows brokenness in the world<br />\r\n3) How God views that craving</p>\r\n\r\n<p>Then share a Bible text that underlines how God&#39;s view of that craving radically breaks our expectations.</p>\r\n\r\n<p>For example, using a craving for love or justice:</p>\r\n\r\n<p>1) Which two or three photos represent love/ (or justice) for you?<br />\r\n2) Which represent the results of lack of love (or injustice) in the world (or in your life)?<br />\r\n3) Which represent how you think God feels about love (or justice)?</p>\r\n\r\n<p>For love, share 1 Corinthians 13:3-7, and ask, &quot;How does this compare to your experience of love? What keeps us from living this kind of love?&quot;</p>\r\n\r\n<p>For justice, explain that fasting is a spiritual exercise meant to please God, share Isaiah 58:6-8, and ask, &quot;How would the world be different if we lived this kind of justice? What is stopping us from doing so?&quot;</p>\r\n','2013-05-23 22:09:33','2013-05-23 23:55:03');
INSERT INTO `activity_translations` VALUES (30,16,'fr','','','','2013-05-23 22:09:33','2013-05-23 22:09:33');
INSERT INTO `activity_translations` VALUES (31,17,'en','Pray for Trust','$u prayed for $f','<p>Stub, describe prayer for Threshold 1.</p>\r\n','2013-05-23 22:10:33','2013-05-23 22:10:33');
INSERT INTO `activity_translations` VALUES (32,17,'fr','','','','2013-05-23 22:10:33','2013-05-23 22:10:33');
INSERT INTO `activity_translations` VALUES (33,18,'en','Pray for Curiosity','$u prayed for $f','<p>Stub, describe prayer for Threshold 2.</p>\r\n','2013-05-23 22:11:29','2013-05-23 22:11:29');
INSERT INTO `activity_translations` VALUES (34,18,'fr','','','','2013-05-23 22:11:29','2013-05-23 22:11:29');
INSERT INTO `activity_translations` VALUES (35,19,'en','Pray for Openness to Change','$u prayed for $f','<p>Stub, describe prayer for Threshold 3.</p>\r\n','2013-05-23 22:12:38','2013-05-23 22:12:38');
INSERT INTO `activity_translations` VALUES (36,19,'fr','','','','2013-05-23 22:12:38','2013-05-23 22:12:38');
INSERT INTO `activity_translations` VALUES (37,20,'en','Pray for Seeking','$u prayed for $f','<p>Stub, describe prayer for Threshold 4.</p>\r\n','2013-05-23 22:14:25','2013-05-23 22:14:25');
INSERT INTO `activity_translations` VALUES (38,20,'fr','','','','2013-05-23 22:14:25','2013-05-23 22:14:25');
INSERT INTO `activity_translations` VALUES (39,21,'en','Pray for Life Change','$u prayed for $f','<p>Stub, describe prayer for Threshold 5.</p>\r\n','2013-05-23 22:15:12','2013-05-23 22:15:12');
INSERT INTO `activity_translations` VALUES (40,21,'fr','','','','2013-05-23 22:15:12','2013-05-23 22:15:12');
INSERT INTO `activity_translations` VALUES (41,22,'en','Pray for Spiritual Growth','$u prayed for $f','<p>Stub, describe prayer for a new believer.</p>\r\n','2013-05-23 22:16:03','2013-05-23 22:16:03');
INSERT INTO `activity_translations` VALUES (42,22,'fr','','','','2013-05-23 22:16:03','2013-05-23 22:16:03');
INSERT INTO `activity_translations` VALUES (43,23,'en','Perspective Cards','$u discussed life using the Perspective cards with $f','<p><img src=\"https://srv1.thelifeapp.com/static/images/perspective_cards.jpg\" style=\"float:left\" />Perspective provides a disarming approach to a spiritual conversation, allowing others to share their perspective about five important topics: Nature of God, Human Nature, Meaning of Life, Identity of Jesus, and Source of Spiritual Truth. In each category, participants choose the card that best represents what they believe, and then they tell you why they believe it.</p>\r\n\r\n<p>You can <a href=\"http://vimeo.com/33418715#\">watch an introduction on Vimeo</a> or order a set of cards at the <a href=\"http://store.powertochange.org/p-583-perspective-cards.aspx\">Power to Change Resource Centre.</a></p>\r\n','2013-05-23 22:17:18','2013-05-23 23:50:47');
INSERT INTO `activity_translations` VALUES (44,23,'fr','','','','2013-05-23 22:17:18','2013-05-23 22:17:18');
INSERT INTO `activity_translations` VALUES (45,24,'en','Connect Study','$u did a Connect study with $f','<p>What is God like? Why does God matter? These are the first two studies in the Connect series. Invite your friend to do the first one together, as a way to start exploring who God is. If they enjoy it, ask if they&#39;d like to keep going.</p>\r\n\r\n<p>Connect is a six session series designed to introduce the central themes of the Christian faith by letting the Bible speak for itself. Written for those who want to find out more about Christianity (as well as for Christians who want to strengthen the foundations of their faith), Connect works great in a small group, or one-on-one!</p>\r\n\r\n<p>Connect is available for download on the <a href=\"http://www.agape.org.uk/resources/smallgroupstudies.aspx\">Agap&eacute; UK website</a>.</p>\r\n','2013-05-23 22:19:03','2013-05-24 02:28:35');
INSERT INTO `activity_translations` VALUES (46,24,'fr','','','','2013-05-23 22:19:03','2013-05-23 22:19:03');
INSERT INTO `activity_translations` VALUES (47,25,'en','Online Study','$u did an Online study with $f','<p>The Online study series covers some of the basics of the Christian faith. While it&#39;s made for Christians, the first few studies can be a great way to explain the basis of a relationship with Jesus, and the importance of making a decision, with someone who is seeking God. For a new Christain, it can really help lay the foundations of their faith.</p>\r\n\r\n<p>Invite your friend to get together for two or three weeks to do a few studies. After you have done the first studies again, depending on where your friend is, invite them to continue with you.</p>\r\n\r\n<p>Online is available for download on the <a href=\"http://www.agape.org.uk/resources/smallgroupstudies.aspx\">Agap&eacute; UK website</a>.</p>\r\n','2013-05-23 22:20:23','2013-05-24 02:29:08');
INSERT INTO `activity_translations` VALUES (48,25,'fr','','','','2013-05-23 22:20:23','2013-05-23 22:20:23');
INSERT INTO `activity_translations` VALUES (49,26,'en','Video: Crave Meaning','$u watched Crave: Meaning with $f','<p><a href=\"https://www.youtube.com/watch?v=BuTCW8dWQ84\"><img src=\"https://srv1.thelifeapp.com/static/images/video_crave_meaining.jpg\" style=\"float:left\" />Watch this short video</a> (1 minute 20) with your friend and talk about it. Here are a few example questions:</p>\r\n\r\n<p>Where do you find your meaning now?<br />\r\nErwin gave a pretty compelling challenge to look for meaning in God. How do you think God provides meaning in life?<br />\r\nWould you be interested in looking more deeply with me at how God can provide meaning in life?</p>\r\n\r\n<p>If your friend is interested, follow up by watching <a href=\"https://www.youtube.com/watch?v=ChgqoupvMo4\">Part 2</a>.</p>\r\n','2013-05-23 22:23:57','2013-05-23 23:48:54');
INSERT INTO `activity_translations` VALUES (50,26,'fr','','','','2013-05-23 22:23:57','2013-05-23 22:23:57');
INSERT INTO `activity_translations` VALUES (51,27,'en','Video: We All Crave','$u watched We All Crave with $f','<p><a href=\"https://www.youtube.com/watch?v=IgIRUo78F84\"><img src=\"https://srv1.thelifeapp.com/static/images/video_we_all_crave.jpg\" style=\"float:left\" />This short video</a> (1 minute 40), which introduces the concept of cravings, explains how God created us all with Cravings for good things, but we often seek after that which is destructive.</p>\r\n\r\n<p>Watch it with your friend, and talk about it. Here are a few questions you could ask:</p>\r\n\r\n<ul>\r\n	<li>Erwin spoke of cravings for love, destiny and meaning. Can you identify with these desires?</li>\r\n	<li>Does it makes sense to you that we often fill these cravings with harmful alternatives?</li>\r\n	<li>How can we change to start craving what is good and truly fulfilling?</li>\r\n</ul>\r\n','2013-05-23 22:25:24','2013-05-23 23:42:35');
INSERT INTO `activity_translations` VALUES (52,27,'fr','','','','2013-05-23 22:25:24','2013-05-23 22:25:24');
INSERT INTO `activity_translations` VALUES (53,28,'en','Video: Crave Intimacy','$u watched Crave Intimacy with $f','<p><a href=\"https://www.youtube.com/watch?v=8S4bhlhX728\"><img src=\"https://srv1.thelifeapp.com/static/images/video_crave_intimacy.jpg\" style=\"float:left\" />This short video</a> (1 minute 55) talks about how love is a profound need that everyone shares. Watch it with your friend, and talk about it.</p>\r\n\r\n<p>Here are some example questions:</p>\r\n\r\n<ul>\r\n	<li>Erwin said, &quot;Love is humanity&#39;s most dangerous condition.&quot; Do you agree with him? Have you felt that way?</li>\r\n	<li>Despite it being impossible to experience love without risking pain, Erwin says we all think it&#39;s worth the risk. Why is love such a compelling need?</li>\r\n</ul>\r\n\r\n<p>After talking, watch part 2 ( 1:11, <a href=\"https://www.youtube.com/watch?v=z64EbOvGAjM\">https://www.youtube.com/watch?v=z64EbOvGAjM</a> ).<br />\r\nAsk, How do you respond to the idea that God loves you?</p>\r\n','2013-05-23 22:27:27','2013-05-23 23:41:32');
INSERT INTO `activity_translations` VALUES (54,28,'fr','','','','2013-05-23 22:27:27','2013-05-23 22:27:27');
INSERT INTO `activity_translations` VALUES (55,29,'en','Video: Crave Destiny','$u watched Crave Destiny with $f','<p><a href=\"https://www.youtube.com/watch?v=Gb8Y1mRxb2k\"><img src=\"https://srv1.thelifeapp.com/static/images/video_crave_destiny.jpg\" style=\"float:left\" /></a>In <a href=\"https://www.youtube.com/watch?v=Gb8Y1mRxb2k\">this video</a> (2:10), Erwin McManus talks about our sense that we were made for something more -- for a greater destiny. Watch it with your friend, and talk about it.</p>\r\n\r\n<p>Here are some example questions:<br />\r\nDo you feel frustrated by the &quot;longing to become?&quot;<br />\r\nDo you feel hopeful about your destiny? Or apathetic?<br />\r\nDo you think that God has a more meaningful life set out for you?</p>\r\n\r\n<p>You can follow up with <a href=\"https://www.youtube.com/watch?v=Tm4Y_U7W0G0\">part 2 (2:30)</a> and ask, &quot;Do you think you matter to God?&quot;</p>\r\n','2013-05-23 22:29:16','2013-05-24 01:34:14');
INSERT INTO `activity_translations` VALUES (56,29,'fr','','','','2013-05-23 22:29:16','2013-05-23 22:29:16');
INSERT INTO `activity_translations` VALUES (57,30,'en','How to choose a threshold','$u did a threshold evaluation for $f','<p>Take a look at these descriptions of the thresholds. If you feel a description <strong>does not</strong><strong> yet apply</strong> to your friend, then that is his threshold. So, if you answer &quot;No&quot; to most of the questions under trust, then the friend&#39;s threshold is <strong>building trust.</strong></p>\r\n\r\n<p>How to discern if your friend&nbsp;:</p>\r\n\r\n<p><strong style=\"font-size:13px; line-height:1.6em\">Trusts You :</strong></p>\r\n\r\n<ul>\r\n	<li>They share personal feelings.</li>\r\n	<li>They initiate with you.</li>\r\n	<li>They value your perspective.</li>\r\n</ul>\r\n\r\n<p><strong>Is Curious about Jesus&nbsp;:</strong></p>\r\n\r\n<ul>\r\n	<li>They&#39;ve been surprised by something you said.</li>\r\n	<li>They want to know more about your faith.</li>\r\n	<li>Things you&#39;ve shared have broken their preconceptions of Christians.</li>\r\n</ul>\r\n\r\n<p><strong>Is Open&nbsp;to change:</strong></p>\r\n\r\n<ul>\r\n	<li>They ask or take your advice</li>\r\n	<li>They share their own brokenness</li>\r\n	<li>They&#39;ve expressed dissatisfaction with their life</li>\r\n</ul>\r\n\r\n<p><strong>Is Seeking&nbsp;God:</strong></p>\r\n\r\n<ul>\r\n	<li>They&#39;re driven to &laquo;&nbsp;figure this out&nbsp;&raquo;</li>\r\n	<li>They want to study the Bible and pray with you.</li>\r\n	<li>They&#39;re specifically examining Jesus.</li>\r\n	<li>They&#39;re connecting to Christian community.</li>\r\n</ul>\r\n\r\n<p><strong>Has Made a Decision&nbsp;:</strong></p>\r\n\r\n<ul>\r\n	<li>Their faith is influencing relationships and decisions.</li>\r\n	<li>They share how God is working in their life.</li>\r\n	<li>They speak about God as a person</li>\r\n	<li>They self-identify as a follower of Jesus.</li>\r\n</ul>\r\n','2013-05-23 22:32:19','2013-05-23 22:46:56');
INSERT INTO `activity_translations` VALUES (58,30,'fr','','','','2013-05-23 22:32:19','2013-05-23 22:32:19');
INSERT INTO `activity_translations` VALUES (59,31,'en','Backstory (Tablet Version)','$u shared Backstory with $f','<p><img src=\"https://srv1.thelifeapp.com/static/images/backstory.png\" /></p><p>&quot;Want to share the gospel but in a way that provides the greater context of theme of life&#39;s story? We all have the sense that there must be a larger story or narrative to which all our stories relate, one that makes sense of our shared experience -- a common Back Story.</p><p>Backstory explains the gospel message using seven key themes:<br />1. Intimacy: God created us to know him.<br />2. Betrayal: Humanity rebelled and sin seperated us from him.<br />3. Anticipation: The Scriptures promise of a coming Deliverer.<br />4. Pursuit: The coming of Christ.<br />5. Sacrifice: Jesus&#39; death and resurrection.<br />6. Invitation: God invites us to return to him.<br />7. Reunion: The age to come -- judgment and eternal life.&quot;</p><p><a href=\"http://crupressgreen.com/backstory-ipad-version/\">Get it as a PDF</a>, formatted for easy sharing on a tablet.</p>','2013-05-23 22:33:12','2013-05-24 01:39:26');
INSERT INTO `activity_translations` VALUES (60,31,'fr','','','','2013-05-23 22:33:12','2013-05-23 22:33:12');
INSERT INTO `activity_translations` VALUES (61,32,'en','Book Discussion: The Reason for God','$u shared The Reason for God with $f','<p>Tim Keller&#39;s book <a href=\"http://timothykeller.com/books/the_reason_for_god/\">The Reason for God</a> is a great resource answering some of the most common arguments against belief, such as, Why does God allow suffering in the world? How could a loving God send people to Hell? How can one religion be &ldquo;right&rdquo; and the others &ldquo;wrong&rdquo;? and Why have so many wars been fought in the name of God?</p>\r\n\r\n<p>The study guide on Keller&#39;s website offers ideas and questions to spark discussion on each chapter.</p>\r\n','2013-05-23 22:34:16','2013-05-24 01:41:28');
INSERT INTO `activity_translations` VALUES (62,32,'fr','','','','2013-05-23 22:34:16','2013-05-23 22:34:16');
INSERT INTO `activity_translations` VALUES (63,33,'en','Hang Out','$u hung out with $f','<p>Simply spending time together in a social setting is a great way to build trust.</p>\r\n','2013-05-23 22:35:00','2013-05-23 22:35:00');
INSERT INTO `activity_translations` VALUES (64,33,'fr','','','','2013-05-23 22:35:00','2013-05-23 22:35:00');
INSERT INTO `activity_translations` VALUES (65,34,'en','#p2cQEx Quebec Survey','$u did a #p2cQEx survey with $f','<p>The &quot;Getting to know Quebec&quot; survey from Quebec Experience 2013','2013-05-23 22:36:03','2013-05-23 22:36:03');
INSERT INTO `activity_translations` VALUES (66,34,'fr','','','','2013-05-23 22:36:03','2013-05-23 22:36:03');
INSERT INTO `activity_translations` VALUES (67,35,'en','Bring to Church','$u brought $f to church','<p>For friends who are curious, open to change or seeking God, bringing them to church with you is a great way to help them take the next step.</p>','2013-05-23 22:36:57','2013-05-23 22:36:57');
INSERT INTO `activity_translations` VALUES (68,35,'fr','','','','2013-05-23 22:36:57','2013-05-23 22:36:57');

--
-- Table structure for table `admin_users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admin_users_on_email` (`email`),
  UNIQUE KEY `index_admin_users_on_reset_password_token` (`reset_password_token`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` VALUES (1,'admin@ballistiq.com','$2a$10$WBPJJljqeDKFhRqUG4Cp5eHzIRDhGXgfgbDXSgeM41PH.Ps.5.c4.',NULL,NULL,NULL,1,'2013-05-23 19:44:51','2013-05-23 19:44:51','75.157.251.192','75.157.251.192','2013-05-23 19:41:53','2013-05-23 19:44:51');
INSERT INTO `admin_users` VALUES (2,'admin@p2c.com','$2a$10$v0RWo0mkO5tojrCnvptmjOIOTCkyTodX1gsIlIY73jeMCRBecQ6EG',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2013-05-23 19:41:53','2013-05-23 19:41:53');

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
INSERT INTO `category_translations` VALUES (7,6,'fr','','','2013-05-23 21:21:11','2013-05-23 21:21:11');
INSERT INTO `category_translations` VALUES (8,7,'en','Like any other relationship, spending time together doing things you both enjoy builds trust. In spending time with your friends, you don\'t want to have any agenda other than to love them. While it\'s important to connect in spiritual conversations, it\'s not necessary every time. Just have fun!','Friendship Building','2013-05-23 21:21:56','2013-05-23 21:21:56');
INSERT INTO `category_translations` VALUES (9,7,'fr','','','2013-05-23 21:21:56','2013-05-23 21:21:56');
INSERT INTO `category_translations` VALUES (10,8,'en','A key principle in building trust is listening to your friends. Learn about who they are, where they come from, and what\'s important for them.\r\n\r\nAs you talk, don\'t argue, contradict, or get offended by things you may not agree with. Just listen, and be interested in the person.\r\n\r\nAlso take the time to look for common ground.\r\n\r\nWhatever perspectives and beliefs they hold, you will have certain things in common.\r\n\r\nIt may be a desire to live justly, a heart for the poor (or other social causes), or just a value for authenticity.\r\n\r\nKeep an eye out for these connections, and affirm them!','Learn','2013-05-23 21:23:31','2013-05-23 23:19:32');
INSERT INTO `category_translations` VALUES (11,8,'fr','','','2013-05-23 21:23:31','2013-05-23 21:23:31');
INSERT INTO `category_translations` VALUES (12,9,'en','Connecting our friends with other Christians can help them build trust as well.\r\n\r\nSpiritual activities like prayer groups or church services may not be helpful at this point, but arranging social settings where friends can interact with Christians, and see that we\'re normal people too, can be revolutionary.','Connect with Community','2013-05-23 21:24:03','2013-05-23 23:18:16');
INSERT INTO `category_translations` VALUES (13,9,'fr','','','2013-05-23 21:24:03','2013-05-23 21:24:03');
INSERT INTO `category_translations` VALUES (14,10,'en','Much of Jesus\' ministry was serving those around him. This is a great way to show love and build trust.\r\n\r\nServing our friends in out of the ordinary ways is also a great way to pique their curiosity.\r\n\r\nGoing out of our way to help others, especially in ways that require a culturally unusual sacrifice, will help get them wondering.\r\n\r\nBut be aware that this is rarely enough; we can\'t expect our friends to initiate spiritual conversations. We\'ll need to take the initiative too.','Acts of Service','2013-05-23 21:24:48','2013-05-23 21:24:48');
INSERT INTO `category_translations` VALUES (15,10,'fr','','','2013-05-23 21:24:48','2013-05-23 21:24:48');
INSERT INTO `category_translations` VALUES (16,11,'en','Parables, or concrete stories, can be a great way to build curiosity. They can be drawn from Jesus\' life, from our daily lives, from recent news, or from film, music or television. You can look for themes of brokenness and redemption, or any number of fundamental human needs. Check out the information on cravings language for help on how to do this.','Parables','2013-05-23 21:25:14','2013-05-23 21:25:14');
INSERT INTO `category_translations` VALUES (17,11,'fr','','','2013-05-23 21:25:14','2013-05-23 21:25:14');
INSERT INTO `category_translations` VALUES (18,12,'en','Asking friends deep questions about their opinions, beliefs, and lives, can serve both to build trust as we listen to their hearts, and to build curiosity as we push them to think through their perspectives in new ways.','Deep Questions','2013-05-23 21:25:36','2013-05-23 21:25:36');
INSERT INTO `category_translations` VALUES (19,12,'fr','','','2013-05-23 21:25:36','2013-05-23 21:25:36');
INSERT INTO `category_translations` VALUES (20,13,'en','People in all times and places are driven by a variety of cravings. These desires may seem superficial, like a craving for good marks or a boyfriend, but they tend to show deeper needs: for love, approval, or truth.\r\n\r\nSince we\'re all searching for ways to satisfy these fundamental needs, they\'re a great window to explore how and why God created us, how our natural ways of satisfying our cravings fall short, and how our ultimate satisfaction comes from Him.','Cravings','2013-05-23 21:26:05','2013-05-23 21:26:05');
INSERT INTO `category_translations` VALUES (21,13,'fr','','','2013-05-23 21:26:05','2013-05-23 21:26:05');
INSERT INTO `category_translations` VALUES (22,14,'en','Often following Jesus is not so much taught, as caught. Allowing our friends see in us a deep desire to be transformed by Jesus, and showing them  our own weaknesses and share how God transforms us, can shine a light on their own need for change.','Model Openness','2013-05-23 21:26:32','2013-05-23 21:26:32');
INSERT INTO `category_translations` VALUES (23,14,'fr','','','2013-05-23 21:26:32','2013-05-23 21:26:32');
INSERT INTO `category_translations` VALUES (24,15,'en','<p>stub</p>','Life Evaluation','2013-05-23 21:27:02','2013-05-23 21:27:02');
INSERT INTO `category_translations` VALUES (25,15,'fr','','','2013-05-23 21:27:02','2013-05-23 21:27:02');
INSERT INTO `category_translations` VALUES (26,16,'en','<p>stub</p>','Challenge to Openness','2013-05-23 21:27:23','2013-05-23 21:27:23');
INSERT INTO `category_translations` VALUES (27,16,'fr','','','2013-05-23 21:27:23','2013-05-23 21:27:23');
INSERT INTO `category_translations` VALUES (28,17,'en','Inviting a friend to study the scriptures together can be very helpful at thresholds 3, 4, and 5.\r\n\r\nFor friends who are <b>curious</b>, seeing Jesus challenge others to openness can help our friends become open.\r\n\r\nFor those who are <b>open to change</b>, modelling how you seek God in His word can help them to start seeking.\r\n\r\nJesus often challenges <b>seekers</b> to make a decision. Look at these texts, and what he says about salvation.','Study the Scriptures','2013-05-23 21:28:05','2013-05-23 21:28:05');
INSERT INTO `category_translations` VALUES (29,17,'fr','','','2013-05-23 21:28:05','2013-05-23 21:28:05');
INSERT INTO `category_translations` VALUES (30,18,'en','<p>stub</p>','Share your Relationship with God','2013-05-23 21:28:26','2013-05-23 21:28:26');
INSERT INTO `category_translations` VALUES (31,18,'fr','','','2013-05-23 21:28:26','2013-05-23 21:28:26');
INSERT INTO `category_translations` VALUES (32,19,'en','For friends at thresholds four and five, compelling answers for their hesitations about faith can be crucial.\r\n\r\nHowever, this means a lot more than simply presenting well-reasoned or well-supported arguments.\r\n\r\nIn a post-modern culture, we need to show how our answers apply to our personal realities, and those of our friends, too.','Compelling Answers','2013-05-23 21:29:06','2013-05-23 21:29:06');
INSERT INTO `category_translations` VALUES (33,19,'fr','','','2013-05-23 21:29:06','2013-05-23 21:29:06');
INSERT INTO `category_translations` VALUES (34,20,'en','<p>stub.</p>','Challenge to Seeking','2013-05-23 21:29:27','2013-05-23 21:29:27');
INSERT INTO `category_translations` VALUES (35,20,'fr','','','2013-05-23 21:29:27','2013-05-23 21:29:27');
INSERT INTO `category_translations` VALUES (36,21,'en','A Gospel summary or tract can be used at most thresholds, but they often have a very helpful feature for friends who are near to <b>entering the kingdom:</b> a clear call to decision.\r\n\r\nIf you use a gospel summary with a friend earlier in the process, it is probably not a good idea to repeatedly ask him to make a decision to follow Jesus. But with those who are actively searching, a clear call to decision is crucial.','Share a Gospel Summary','2013-05-23 21:30:04','2013-05-23 21:30:04');
INSERT INTO `category_translations` VALUES (37,21,'fr','','','2013-05-23 21:30:04','2013-05-23 21:30:04');
INSERT INTO `category_translations` VALUES (38,22,'en','Activities to help you use theLife App and understand its evangelism model.','Instructional','2013-05-23 21:30:26','2013-05-23 21:30:26');
INSERT INTO `category_translations` VALUES (39,22,'fr','','','2013-05-23 21:30:26','2013-05-23 21:30:26');

--
-- Table structure for table `events`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `friend_id` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `prayer_requested` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `threshold_id` int(11) DEFAULT NULL,
  `target_event_id` int(11) DEFAULT NULL,
  `pledges_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_events_on_activity_id` (`activity_id`),
  KEY `index_events_on_friend_id` (`friend_id`),
  KEY `index_events_on_target_event_id` (`target_event_id`),
  KEY `index_events_on_threshold_id` (`threshold_id`),
  KEY `index_events_on_user_id` (`user_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--


--
-- Table structure for table `friends`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friends` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) DEFAULT NULL,
  `threshold_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_friends_on_threshold_id` (`threshold_id`),
  KEY `index_friends_on_user_id` (`user_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

INSERT INTO `friends` VALUES (4,'tt','gg',10,1,'2013-05-23 20:39:27','2013-05-23 20:39:27',NULL,NULL,NULL);
INSERT INTO `friends` VALUES (5,'t2','m',10,2,'2013-05-23 22:41:50','2013-05-23 22:41:50',NULL,NULL,NULL);
INSERT INTO `friends` VALUES (6,'f4','',10,4,'2013-05-23 23:00:48','2013-05-23 23:00:48',NULL,NULL,NULL);
INSERT INTO `friends` VALUES (7,'f6','',10,6,'2013-05-23 23:02:05','2013-05-23 23:02:05',NULL,NULL,NULL);
INSERT INTO `friends` VALUES (8,'ff','',10,4,'2013-05-24 00:31:33','2013-05-24 00:31:33',NULL,NULL,NULL);
INSERT INTO `friends` VALUES (9,'fcurious','',10,3,'2013-05-24 00:32:52','2013-05-24 00:32:52',NULL,NULL,NULL);
INSERT INTO `friends` VALUES (10,'fseeking','',10,5,'2013-05-24 00:37:05','2013-05-24 00:37:05',NULL,NULL,NULL);

--
-- Table structure for table `group_users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_users` (
  `id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_group_users_on_group_id_and_user_id` (`group_id`,`user_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_users`
--


--
-- Table structure for table `groups`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_groups_on_user_id` (`user_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--


--
-- Table structure for table `invite_requests`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invite_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sms` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kind` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'INVITE',
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DELIVERED',
  PRIMARY KEY (`id`),
  KEY `index_invite_requests_on_group_id` (`group_id`),
  KEY `index_invite_requests_on_user_id` (`user_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invite_requests`
--


--
-- Table structure for table `pledges`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pledges` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pledges_on_event_id` (`event_id`),
  KEY `index_pledges_on_user_id_and_event_id` (`user_id`,`event_id`),
  KEY `index_pledges_on_user_id` (`user_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pledges`
--

INSERT INTO `pledges` VALUES (1,8,2,'2013-05-23 20:00:44','2013-05-23 20:00:44');

--
-- Table structure for table `schema_migrations`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` VALUES ('20130319140714');
INSERT INTO `schema_migrations` VALUES ('20130320135330');
INSERT INTO `schema_migrations` VALUES ('20130320140110');
INSERT INTO `schema_migrations` VALUES ('20130320150903');
INSERT INTO `schema_migrations` VALUES ('20130322074546');
INSERT INTO `schema_migrations` VALUES ('20130322131801');
INSERT INTO `schema_migrations` VALUES ('20130326060801');
INSERT INTO `schema_migrations` VALUES ('20130327071605');
INSERT INTO `schema_migrations` VALUES ('20130327122931');
INSERT INTO `schema_migrations` VALUES ('20130327131537');
INSERT INTO `schema_migrations` VALUES ('20130403142711');
INSERT INTO `schema_migrations` VALUES ('20130404081212');
INSERT INTO `schema_migrations` VALUES ('20130404084118');
INSERT INTO `schema_migrations` VALUES ('20130405083959');
INSERT INTO `schema_migrations` VALUES ('20130408211719');
INSERT INTO `schema_migrations` VALUES ('20130408211724');
INSERT INTO `schema_migrations` VALUES ('20130408211725');
INSERT INTO `schema_migrations` VALUES ('20130410161707');
INSERT INTO `schema_migrations` VALUES ('20130412131137');
INSERT INTO `schema_migrations` VALUES ('20130416144941');
INSERT INTO `schema_migrations` VALUES ('20130417090307');
INSERT INTO `schema_migrations` VALUES ('20130417093545');
INSERT INTO `schema_migrations` VALUES ('20130417120413');
INSERT INTO `schema_migrations` VALUES ('20130418134045');
INSERT INTO `schema_migrations` VALUES ('20130419144652');
INSERT INTO `schema_migrations` VALUES ('20130422072353');
INSERT INTO `schema_migrations` VALUES ('20130422132533');
INSERT INTO `schema_migrations` VALUES ('20130422152737');
INSERT INTO `schema_migrations` VALUES ('20130423083529');
INSERT INTO `schema_migrations` VALUES ('20130425151757');
INSERT INTO `schema_migrations` VALUES ('20130426115223');
INSERT INTO `schema_migrations` VALUES ('20130426122510');
INSERT INTO `schema_migrations` VALUES ('20130429063515');
INSERT INTO `schema_migrations` VALUES ('20130430080124');
INSERT INTO `schema_migrations` VALUES ('20130503061231');

--
-- Table structure for table `settings`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_settings_on_key` (`key`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` VALUES (1,'max_users_in_group','15','2013-05-23 19:41:53','2013-05-23 19:41:53');

--
-- Table structure for table `thresholds`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thresholds` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thresholds`
--

INSERT INTO `thresholds` VALUES (1,'New contact','2013-05-23 19:41:52','2013-05-23 19:41:52');
INSERT INTO `thresholds` VALUES (2,'Trusting','2013-05-23 19:41:52','2013-05-23 19:41:52');
INSERT INTO `thresholds` VALUES (3,'Curious','2013-05-23 19:41:52','2013-05-23 19:41:52');
INSERT INTO `thresholds` VALUES (4,'Open','2013-05-23 19:41:52','2013-05-23 19:41:52');
INSERT INTO `thresholds` VALUES (5,'Seeking','2013-05-23 19:41:52','2013-05-23 19:41:52');
INSERT INTO `thresholds` VALUES (6,'Entering','2013-05-23 19:41:52','2013-05-23 19:41:52');
INSERT INTO `thresholds` VALUES (7,'Christian','2013-05-23 19:41:52','2013-05-23 19:41:52');

--
-- Table structure for table `users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authentication_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_authentication_token` (`authentication_token`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

INSERT INTO `users` VALUES (10,'clarence@ballistiq.com','$2a$10$rgouX6Wl9tWhlnuKEdW5QO.k23wQwIVZTVvB1Xx9dT2nCwWbNVU3q',NULL,NULL,NULL,5,'2013-05-24 01:51:41','2013-05-24 01:43:16','209.121.225.187','209.121.225.187','vEwU976SvaPtUc8LonSJ','2013-05-23 20:19:50','2013-05-24 01:51:41','Clarence','Martens','null','2635044cf29975e8.jpg','en');
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-23 21:29:51
