CREATE TABLE users (
	id INT NOT NULL AUTO_INCREMENT,
    user_id VARCHAR(32) NOT NULL,
    user_password VARCHAR(32) NOT NULL,
    user_nickname VARCHAR(32) NOT NULL,
    profile_image_link VARCHAR(256) NOT NULL,
    profile_state_message VARCHAR(64) NOT NULL,
    is_withdraw TINYINT NOT NULL DEFAULT 0,
    signup_date DATE NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE channels (
    id INT NOT NULL AUTO_INCREMENT,
    channel_name VARCHAR(32) NOT NULL,
    channel_made_user INT NOT NULL,
    channel_link VARCHAR(256) NOT NULL,
    channel_max_capacity INT NOT NULL,
    is_withdraw TINYINT NOT NULL DEFAULT 0,
    made_date DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (channer_made_user) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE chats (
	id INT NOT NULL AUTO_INCREMENT,
    chats_message VARCHAR(256) NOT NULL,
    chats_user INT NOT NULL,
    chats_channel INT NOT NULL,
    chats_made_date DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (chats_user) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (chats_ch) REFERENCES channels(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE follows (
	id INT NOT NULL AUTO_INCREMENT,
    follower INT NOT NULL,
    followee INT NOT NULL,
    followed_date DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (follower_user) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (followee_user) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE blocks (
	id INT NOT NULL AUTO_INCREMENT,
    user_who_blocked INT NOT NULL,
    blocked_user INT NOT NULL,
    blocked_date DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_who_blocked) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (blocked_user) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;