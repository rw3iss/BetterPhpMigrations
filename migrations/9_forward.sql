use espn;

ALTER TABLE  `interview` ADD  `is_featured` CHAR( 1 ) NOT NULL DEFAULT '0' AFTER  `youtube_public`;
ALTER TABLE  `interview` ADD  `is_league_manager` CHAR( 1 ) NOT NULL DEFAULT '0' AFTER  `youtube_public`;