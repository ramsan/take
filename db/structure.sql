CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `header_file_name` varchar(255) DEFAULT NULL,
  `header_content_type` varchar(255) DEFAULT NULL,
  `header_file_size` int(11) DEFAULT NULL,
  `header_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

CREATE TABLE `categories_memories` (
  `category_id` int(11) DEFAULT NULL,
  `memory_id` int(11) DEFAULT NULL,
  UNIQUE KEY `index_categories_memories_on_category_id_and_memory_id` (`category_id`,`memory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `user_id` int(11) DEFAULT NULL,
  `memory_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `followings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `followee_id` int(11) DEFAULT NULL,
  `follower_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_followings_on_followee_id_and_follower_id` (`followee_id`,`follower_id`)
) ENGINE=InnoDB AUTO_INCREMENT=391 DEFAULT CHARSET=latin1;

CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_file_name` varchar(255) DEFAULT NULL,
  `image_content_type` varchar(255) DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `memory_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `google_thumb` varchar(255) DEFAULT NULL,
  `google_main` varchar(255) DEFAULT NULL,
  `caption` text,
  `user_id` int(11) DEFAULT NULL,
  `google_page_url` varchar(255) DEFAULT NULL,
  `external_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3061 DEFAULT CHARSET=latin1;

CREATE TABLE `invitations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fb_user` varchar(255) DEFAULT NULL,
  `fb_friend` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `host_user_id` int(11) DEFAULT NULL,
  `fb_processed_relationship` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_invitations_on_fb_user` (`fb_user`),
  KEY `index_invitations_on_fb_friend` (`fb_friend`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

CREATE TABLE `memories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  `decade` tinyint(4) DEFAULT NULL,
  `date_of_memory` date DEFAULT NULL,
  `is_anonymous` tinyint(1) DEFAULT '0',
  `related_memories_count` int(11) DEFAULT '0',
  `year` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `sale_link` varchar(255) DEFAULT NULL,
  `sale_price` decimal(8,2) DEFAULT NULL,
  `images_count` int(11) DEFAULT '0',
  `suspended` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1608 DEFAULT CHARSET=latin1;

CREATE TABLE `memories_users` (
  `memory_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  UNIQUE KEY `index_memories_users_on_memory_id_and_user_id` (`memory_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `rams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `uemail` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1;

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) NOT NULL,
  `data` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

CREATE TABLE `showdowns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) DEFAULT NULL,
  `memory_1` varchar(255) DEFAULT NULL,
  `memory_2` varchar(255) DEFAULT NULL,
  `memory_3` varchar(255) DEFAULT NULL,
  `memory_4` varchar(255) DEFAULT NULL,
  `memory_5` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `approved` tinyint(1) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `approved_on` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `image_m1_file_name` varchar(255) DEFAULT NULL,
  `image_m1_content_type` varchar(255) DEFAULT NULL,
  `image_m1_file_size` int(11) DEFAULT NULL,
  `image_m1_updated_at` datetime DEFAULT NULL,
  `image_m2_file_name` varchar(255) DEFAULT NULL,
  `image_m2_content_type` varchar(255) DEFAULT NULL,
  `image_m2_file_size` int(11) DEFAULT NULL,
  `image_m2_updated_at` datetime DEFAULT NULL,
  `image_m3_file_name` varchar(255) DEFAULT NULL,
  `image_m3_content_type` varchar(255) DEFAULT NULL,
  `image_m3_file_size` int(11) DEFAULT NULL,
  `image_m3_updated_at` datetime DEFAULT NULL,
  `image_m4_file_name` varchar(255) DEFAULT NULL,
  `image_m4_content_type` varchar(255) DEFAULT NULL,
  `image_m4_file_size` int(11) DEFAULT NULL,
  `image_m4_updated_at` datetime DEFAULT NULL,
  `image_m5_file_name` varchar(255) DEFAULT NULL,
  `image_m5_content_type` varchar(255) DEFAULT NULL,
  `image_m5_file_size` int(11) DEFAULT NULL,
  `image_m5_updated_at` datetime DEFAULT NULL,
  `image_1_google_thumb` varchar(255) DEFAULT NULL,
  `image_1_google_main` varchar(255) DEFAULT NULL,
  `image_1_google_page_url` varchar(255) DEFAULT NULL,
  `image_2_google_thumb` varchar(255) DEFAULT NULL,
  `image_2_google_main` varchar(255) DEFAULT NULL,
  `image_2_google_page_url` varchar(255) DEFAULT NULL,
  `image_3_google_thumb` varchar(255) DEFAULT NULL,
  `image_3_google_main` varchar(255) DEFAULT NULL,
  `image_3_google_page_url` varchar(255) DEFAULT NULL,
  `image_4_google_thumb` varchar(255) DEFAULT NULL,
  `image_4_google_main` varchar(255) DEFAULT NULL,
  `image_4_google_page_url` varchar(255) DEFAULT NULL,
  `image_5_google_thumb` varchar(255) DEFAULT NULL,
  `image_5_google_main` varchar(255) DEFAULT NULL,
  `image_5_google_page_url` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `decade` int(11) DEFAULT NULL,
  `votes_count` int(11) DEFAULT '0',
  `memory_1_votes_count` int(11) DEFAULT '0',
  `memory_2_votes_count` int(11) DEFAULT '0',
  `memory_3_votes_count` int(11) DEFAULT '0',
  `memory_4_votes_count` int(11) DEFAULT '0',
  `memory_5_votes_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_showdowns_on_question` (`question`),
  KEY `index_showdowns_on_image_1_google_thumb` (`image_1_google_thumb`),
  KEY `index_showdowns_on_image_1_google_main` (`image_1_google_main`),
  KEY `index_showdowns_on_image_1_google_page_url` (`image_1_google_page_url`),
  KEY `index_showdowns_on_image_2_google_thumb` (`image_2_google_thumb`),
  KEY `index_showdowns_on_image_2_google_main` (`image_2_google_main`),
  KEY `index_showdowns_on_image_2_google_page_url` (`image_2_google_page_url`),
  KEY `index_showdowns_on_image_3_google_thumb` (`image_3_google_thumb`),
  KEY `index_showdowns_on_image_3_google_main` (`image_3_google_main`),
  KEY `index_showdowns_on_image_3_google_page_url` (`image_3_google_page_url`),
  KEY `index_showdowns_on_image_4_google_thumb` (`image_4_google_thumb`),
  KEY `index_showdowns_on_image_4_google_main` (`image_4_google_main`),
  KEY `index_showdowns_on_image_4_google_page_url` (`image_4_google_page_url`),
  KEY `index_showdowns_on_image_5_google_thumb` (`image_5_google_thumb`),
  KEY `index_showdowns_on_image_5_google_main` (`image_5_google_main`),
  KEY `index_showdowns_on_image_5_google_page_url` (`image_5_google_page_url`),
  KEY `index_showdowns_on_memory_1_votes_count` (`memory_1_votes_count`),
  KEY `index_showdowns_on_memory_2_votes_count` (`memory_2_votes_count`),
  KEY `index_showdowns_on_memory_3_votes_count` (`memory_3_votes_count`),
  KEY `index_showdowns_on_memory_4_votes_count` (`memory_4_votes_count`),
  KEY `index_showdowns_on_memory_5_votes_count` (`memory_5_votes_count`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=latin1;

CREATE TABLE `sses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(128) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `haslocalpw` tinyint(1) NOT NULL DEFAULT '1',
  `profile_image_file_name` varchar(255) DEFAULT NULL,
  `profile_image_content_type` varchar(255) DEFAULT NULL,
  `profile_image_file_size` int(11) DEFAULT NULL,
  `profile_image_updated_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `birth_year` int(11) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `about_me` text,
  `fb_auth_token` varchar(255) DEFAULT NULL,
  `fb_picture` varchar(255) DEFAULT NULL,
  `notification_preferences` int(11) DEFAULT '15',
  `system_preferences` int(11) DEFAULT '0',
  `fb_identifier` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT '0',
  `votes_count` int(11) DEFAULT '0',
  `banned` tinyint(1) DEFAULT '0',
  `comment_preferences` tinyint(1) DEFAULT '0',
  `memories_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=latin1;

CREATE TABLE `visits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1327 DEFAULT CHARSET=latin1;

CREATE TABLE `votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `showdown_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `memory_1` tinyint(1) DEFAULT '0',
  `memory_2` tinyint(1) DEFAULT '0',
  `memory_3` tinyint(1) DEFAULT '0',
  `memory_4` tinyint(1) DEFAULT '0',
  `memory_5` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_votes_on_showdown_id` (`showdown_id`),
  KEY `index_votes_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=749 DEFAULT CHARSET=latin1;

CREATE TABLE `you_tube_videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `memory_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=latin1;

INSERT INTO schema_migrations (version) VALUES ('20110824053300');

INSERT INTO schema_migrations (version) VALUES ('20110824063025');

INSERT INTO schema_migrations (version) VALUES ('20110824063114');

INSERT INTO schema_migrations (version) VALUES ('20110824120003');

INSERT INTO schema_migrations (version) VALUES ('20110824172430');

INSERT INTO schema_migrations (version) VALUES ('20110824182749');

INSERT INTO schema_migrations (version) VALUES ('20110824183319');

INSERT INTO schema_migrations (version) VALUES ('20110824193700');

INSERT INTO schema_migrations (version) VALUES ('20110825142320');

INSERT INTO schema_migrations (version) VALUES ('20110825142434');

INSERT INTO schema_migrations (version) VALUES ('20110826215216');

INSERT INTO schema_migrations (version) VALUES ('20110829173538');

INSERT INTO schema_migrations (version) VALUES ('20110830012728');

INSERT INTO schema_migrations (version) VALUES ('20110831134005');

INSERT INTO schema_migrations (version) VALUES ('20111215044315');

INSERT INTO schema_migrations (version) VALUES ('20111215144921');

INSERT INTO schema_migrations (version) VALUES ('20111215145601');

INSERT INTO schema_migrations (version) VALUES ('20111215150709');

INSERT INTO schema_migrations (version) VALUES ('20111226234652');

INSERT INTO schema_migrations (version) VALUES ('20120404212043');

INSERT INTO schema_migrations (version) VALUES ('20120418041030');

INSERT INTO schema_migrations (version) VALUES ('20120419235701');

INSERT INTO schema_migrations (version) VALUES ('20120423220738');

INSERT INTO schema_migrations (version) VALUES ('20120426235813');

INSERT INTO schema_migrations (version) VALUES ('20120427113505');

INSERT INTO schema_migrations (version) VALUES ('20120429191032');

INSERT INTO schema_migrations (version) VALUES ('20120430144502');

INSERT INTO schema_migrations (version) VALUES ('20120502121710');

INSERT INTO schema_migrations (version) VALUES ('20120503203352');

INSERT INTO schema_migrations (version) VALUES ('20120517021355');

INSERT INTO schema_migrations (version) VALUES ('20120522060621');

INSERT INTO schema_migrations (version) VALUES ('20120603193424');

INSERT INTO schema_migrations (version) VALUES ('20120608050503');

INSERT INTO schema_migrations (version) VALUES ('20120608180844');

INSERT INTO schema_migrations (version) VALUES ('20120611042732');

INSERT INTO schema_migrations (version) VALUES ('20120616022032');

INSERT INTO schema_migrations (version) VALUES ('20120625002355');

INSERT INTO schema_migrations (version) VALUES ('20120625003738');

INSERT INTO schema_migrations (version) VALUES ('20120625191448');

INSERT INTO schema_migrations (version) VALUES ('20120627223332');

INSERT INTO schema_migrations (version) VALUES ('20120627230433');

INSERT INTO schema_migrations (version) VALUES ('20120628213132');

INSERT INTO schema_migrations (version) VALUES ('20120628214745');

INSERT INTO schema_migrations (version) VALUES ('20120630184512');

INSERT INTO schema_migrations (version) VALUES ('20120702165911');

INSERT INTO schema_migrations (version) VALUES ('20120704220918');

INSERT INTO schema_migrations (version) VALUES ('20120708063516');

INSERT INTO schema_migrations (version) VALUES ('20120712025746');

INSERT INTO schema_migrations (version) VALUES ('20120712035647');

INSERT INTO schema_migrations (version) VALUES ('20120714174023');

INSERT INTO schema_migrations (version) VALUES ('20120714214627');

INSERT INTO schema_migrations (version) VALUES ('20120717182233');

INSERT INTO schema_migrations (version) VALUES ('20120717225232');

INSERT INTO schema_migrations (version) VALUES ('20120718205906');

INSERT INTO schema_migrations (version) VALUES ('20120801060211');

INSERT INTO schema_migrations (version) VALUES ('20120801071820');