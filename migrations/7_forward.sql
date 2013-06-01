use espn;

SET foreign_key_checks = 0;
DROP TABLE IF EXISTS `interview_media`;
SET foreign_key_checks = 1;

CREATE TABLE IF NOT EXISTS `interview_media` (
  `id` INT UNSIGNED NOT NULL auto_increment,
  `interview_id` INT UNSIGNED NOT NULL,
  `media_type` CHAR(1) NULL,
  `encode_id` BIGINT UNSIGNED NULL,
  `question_number` TINYINT NOT NULL DEFAULT 0,
  `duration` TINYINT NULL,
  `url` TEXT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  
  PRIMARY KEY (id),
  FOREIGN KEY (interview_id) REFERENCES `interview`(id) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
