use espn;


CREATE TABLE IF NOT EXISTS `interview` (
  `id` INT UNSIGNED NOT NULL auto_increment,
  `user_id` INT NULL,
  `league_name` VARCHAR(32) NULL,
  `manager_name` VARCHAR(150) NULL,
  `email` VARCHAR(160) NULL,
  `type` CHAR(1) NOT NULL,
  `media_count` CHAR(1) NOT NULL DEFAULT "0",
  `video_status` CHAR(1) NOT NULL DEFAULT "1",
  `s3_url` TEXT NULL,
  `youtube_url` VARCHAR(160) NULL,
  `youtube_id` VARCHAR(16) NULL,
  `moderation_status` CHAR(1) NULL,
  `youtube_public` CHAR(1) NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `video_completed_at` TIMESTAMP NULL,
  
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES `users`(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `interview_media` (
  `id` INT UNSIGNED NOT NULL auto_increment,
  `interview_id` INT UNSIGNED NOT NULL,
  `media_type` CHAR(1) NULL,
  `encoding_id` BIGINT UNSIGNED NULL,
  `question_number` CHAR(1) NOT NULL DEFAULT "0",
  `media_length` TINYINT NULL,
  `s3_url` TEXT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  
  PRIMARY KEY (id),
  FOREIGN KEY (interview_id) REFERENCES `interview`(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS `video_status_type` (
  `id` TINYINT UNSIGNED NOT NULL auto_increment,
  `type` VARCHAR(10) NOT NULL,

  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

INSERT INTO `video_status_type` VALUES(1, 'NEW');
INSERT INTO `video_status_type` VALUES(2, 'WAITING');
INSERT INTO `video_status_type` VALUES(3, 'COMPLETED');
INSERT INTO `video_status_type` VALUES(4, 'REJECTED');
