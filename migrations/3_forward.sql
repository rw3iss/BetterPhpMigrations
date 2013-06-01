/* tank auth schema */
USE espn;

CREATE TABLE IF NOT EXISTS `facebook_sync` (
  `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `league_id` int NOT NULL,
  `team_id` varchar(128),
  `sync_list` varchar(128),
  `last_updated` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE 'leagues';

CREATE TABLE IF NOT EXISTS `leagues` (
  `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `league_id` int NOT NULL,
  `league_type` varchar(128),
  `league_location` varchar(128),
  `vote_dates` text,
  `selected_draft_date` TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

