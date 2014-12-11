
CREATE TABLE IF NOT EXISTS clients (
	id int(11) NOT NULL AUTO_INCREMENT,
	name varchar(256) NOT NULL,
	address varchar(256),
	address2 varchar(256),
	city varchar(128),
	state varchar(128),
	zipcode varchar(12),
	phone varchar(256),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE IF NOT EXISTS orders (
	id int(11) NOT NULL AUTO_INCREMENT,
	status varchar(128) NOT NULL,
	date_created DATETIME,
	shipper_id int references clients(id),
	department varchar(256),
	origin_address varchar(256),
	origin_city varchar(128),
	origin_zipcode varchar(12),
	description varchar(512),
	pieces int,
	weight varchar(12),
	ready_time DATETIME,
	close_time DATETIME,
	additional varchar(512),
	fuel_surcharge float,
	payment_type int,
	third_party_address varchar(256),
	third_party_city varchar(128),
	third_party_zipcode varchar(12),
  PRIMARY KEY (id),
  KEY shipper_id (shipper_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

