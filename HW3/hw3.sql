DROP TABLE IF EXISTS online_status;
CREATE TABLE online_status(
	active_user_id BIGINT UNSIGNED NOT NULL,
	status_online_user ENUM('Online', 'MobileOnline', 'Ofline'),
	update_time DATETIME ON UPDATE CURRENT_TIMESTAMP,

	FOREIGN KEY (active_user_id) REFERENCES users(id)
	ON UPDATE CASCADE
	ON DELETE RESTRICT,
	INDEX (status_online_user),
	INDEX (update_time)
);


DROP TABLE IF EXISTS apps;
CREATE TABLE apps(
	id SERIAL,
	name VARCHAR(150),
	is_free ENUM('free', 'paid'),
	admin_user_id BIGINT UNSIGNED NOT NULL,
	INDEX apps_name_idx(name),
	FOREIGN KEY (admin_user_id) references users(id)
);

DROP TABLE IF EXISTS users_apps;
CREATE TABLE users_apps(
	user_id BIGINT UNSIGNED NOT NULL,
	apps_id BIGINT UNSIGNED NOT NULL,

	PRIMARY KEY (user_id, apps_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (apps_id) REFERENCES apps(id)
);