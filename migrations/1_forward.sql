/* tank auth schema */
USE espn;

CREATE TABLE IF NOT EXISTS `leagues` (
  `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `league_id` int NOT NULL,
  `league_status` varchar(128),
  `season_start_date` TIMESTAMP,
  `league_type` varchar(128),
  `league_location` varchar(128),
  `draft_dates` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

