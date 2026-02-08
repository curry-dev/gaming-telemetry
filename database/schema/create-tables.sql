CREATE DATABASE GamingTelemetry;
USE GamingTelemetry;



CREATE TABLE users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE CHECK(username NOT LIKE '% %'),
    email VARCHAR(100) NOT NULL UNIQUE CHECK(CHARINDEX('@', email) > 0 AND CHARINDEX('.', email) > CHARINDEX('@', email)),
    dob DATE,
    created DATETIME DEFAULT GETDATE()
);



CREATE TABLE rewards (
    reward_id INT IDENTITY(1,1) PRIMARY KEY,
    xp INT DEFAULT 0,
    coins INT DEFAULT 0
);


CREATE TABLE levels (
    level_id INT PRIMARY KEY,
    xp_required INT NOT NULL DEFAULT 0,
    reward_id INT NOT NULL,
    FOREIGN KEY (reward_id) REFERENCES rewards(reward_id)
);


CREATE TABLE games (
    game_id INT IDENTITY(100,100) PRIMARY KEY,
    game_name VARCHAR(100) NOT NULL UNIQUE
);



CREATE TABLE players (
    player_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    game_id INT NOT NULL,
    level_id INT NOT NULL,
    xp INT DEFAULT 0,
    coins INT DEFAULT 0,
    last_session DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (game_id) REFERENCES games(game_id),
    FOREIGN KEY (level_id) REFERENCES levels(level_id)
);



CREATE TABLE devices (
    device_id INT IDENTITY(1,1) PRIMARY KEY,
    player_id INT NOT NULL,
    device_type VARCHAR(50) CHECK (device_type IN ('PC', 'Console', 'Mobile', 'Tablet')),
    last_session DATETIME,
    FOREIGN KEY (player_id) REFERENCES players(player_id)
);



CREATE TABLE regions (
    region_id INT IDENTITY(1,1) PRIMARY KEY,
    player_id INT NOT NULL,
    region VARCHAR(50) CHECK (region IN ('NA', 'EU', 'ASIA', 'SA', 'AF', 'OCE')),
    last_session DATETIME,
    FOREIGN KEY (player_id) REFERENCES players(player_id)
);



CREATE TABLE purchases (
    purchase_id INT IDENTITY(1,1) PRIMARY KEY,
    player_id INT NOT NULL,
    reward_id INT NOT NULL,
    purchased_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (player_id) REFERENCES players(player_id),
    FOREIGN KEY (reward_id) REFERENCES rewards(reward_id)
);



CREATE TABLE matches (
    match_id INT IDENTITY(1,1) PRIMARY KEY,
    game_id INT NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME,
    FOREIGN KEY (game_id) REFERENCES games(game_id)
);



CREATE TABLE match_results (
    match_result_id INT IDENTITY(1,1) PRIMARY KEY,
    match_id INT NOT NULL,
    player_id INT NOT NULL,
    xp_earned INT DEFAULT 0,
    coins_earned INT DEFAULT 0,
    outcome VARCHAR(20) CHECK(outcome IN ('Win', 'Loss', 'Draw')),
    FOREIGN KEY (match_id) REFERENCES matches(match_id),
    FOREIGN KEY (player_id) REFERENCES players(player_id)
);



CREATE TABLE achievements (
    achievement_id INT IDENTITY(1,1) PRIMARY KEY,
    game_id INT NOT NULL,
    description VARCHAR(255),
    reward_id INT,
    FOREIGN KEY (game_id) REFERENCES games(game_id),
    FOREIGN KEY (reward_id) REFERENCES rewards(reward_id)
);



CREATE TABLE player_achievements (
    player_id INT NOT NULL,
    achievement_id INT NOT NULL,
    achieved_at DATETIME,
    PRIMARY KEY (player_id, achievement_id),
    FOREIGN KEY (player_id) REFERENCES players(player_id),
    FOREIGN KEY (achievement_id) REFERENCES achievements(achievement_id)
);



CREATE TABLE event_types (
    event_id INT IDENTITY(1,1) PRIMARY KEY,
    event_name VARCHAR(100) NOT NULL,
    event_description VARCHAR(255)
);



CREATE TABLE player_events (
    player_event_id INT IDENTITY(1,1) PRIMARY KEY,
    player_id INT NOT NULL,
    event_id INT NOT NULL,
    match_id INT,
    event_time DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (player_id) REFERENCES players(player_id),
    FOREIGN KEY (event_id) REFERENCES event_types(event_id),
    FOREIGN KEY (match_id) REFERENCES matches(match_id)
);



CREATE TABLE report_types (
    report_id INT IDENTITY(1,1) PRIMARY KEY,
    report_name VARCHAR(100) NOT NULL,
    report_description VARCHAR(255)
);



CREATE TABLE player_reports (
    player_report_id INT IDENTITY(1,1) PRIMARY KEY,
    reported_player_id INT NOT NULL,
    reported_by_player_id INT NOT NULL,
    report_id INT NOT NULL,
    reported_at DATETIME,
    FOREIGN KEY (reported_player_id) REFERENCES players(player_id),
    FOREIGN KEY (reported_by_player_id) REFERENCES players(player_id),
    FOREIGN KEY (report_id) REFERENCES report_types(report_id)
);



CREATE TABLE audit_log (
    audit_id INT IDENTITY(1,1) PRIMARY KEY,
    table_name VARCHAR(50),
    operation VARCHAR(10) CHECK(operation IN ('Insert', 'Update', 'Delete')),
    changed_at DATETIME DEFAULT GETDATE(),
    changed_by INT,
    FOREIGN KEY (changed_by) REFERENCES users(user_id)
);
