CREATE DATABASE GamingTelemetry;
USE GamingTelemetry;



GO
CREATE SCHEMA core;
GO
CREATE SCHEMA telemetry;
GO
CREATE SCHEMA engagement;
GO
CREATE SCHEMA infra;
GO



CREATE TABLE core.users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE CHECK(username NOT LIKE '% %'),
    email VARCHAR(100) NOT NULL UNIQUE CHECK(CHARINDEX('@', email) > 0 AND CHARINDEX('.', email) > CHARINDEX('@', email)),
    dob DATE,
    created DATETIME DEFAULT GETDATE()
);



CREATE TABLE core.rewards (
    reward_id INT IDENTITY(1,1) PRIMARY KEY,
    xp INT DEFAULT 0,
    coins INT DEFAULT 0
);


CREATE TABLE core.levels (
    level_id INT PRIMARY KEY,
    xp_required INT NOT NULL DEFAULT 0,
    reward_id INT NOT NULL,
    FOREIGN KEY (reward_id) REFERENCES core.rewards(reward_id)
);


CREATE TABLE core.games (
    game_id INT IDENTITY(100,100) PRIMARY KEY,
    game_name VARCHAR(100) NOT NULL UNIQUE
);



CREATE TABLE core.players (
    player_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    game_id INT NOT NULL,
    level_id INT NOT NULL,
    xp INT DEFAULT 0,
    coins INT DEFAULT 0,
    last_session DATETIME,
    FOREIGN KEY (user_id) REFERENCES core.users(user_id),
    FOREIGN KEY (game_id) REFERENCES core.games(game_id),
    FOREIGN KEY (level_id) REFERENCES core.levels(level_id)
);



CREATE TABLE infra.devices (
    device_id INT IDENTITY(1,1) PRIMARY KEY,
    player_id INT NOT NULL,
    device_type VARCHAR(50) CHECK (device_type IN ('PC', 'Console', 'Mobile', 'Tablet')),
    last_session DATETIME,
    FOREIGN KEY (player_id) REFERENCES core.players(player_id)
);



CREATE TABLE infra.regions (
    region_id INT IDENTITY(1,1) PRIMARY KEY,
    player_id INT NOT NULL,
    region VARCHAR(50) CHECK (region IN ('NA', 'EU', 'ASIA', 'SA', 'AF', 'OCE')),
    last_session DATETIME,
    FOREIGN KEY (player_id) REFERENCES core.players(player_id)
);



CREATE TABLE engagement.purchases (
    purchase_id INT IDENTITY(1,1) PRIMARY KEY,
    player_id INT NOT NULL,
    reward_id INT NOT NULL,
    purchased_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (player_id) REFERENCES core.players(player_id),
    FOREIGN KEY (reward_id) REFERENCES core.rewards(reward_id)
);



CREATE TABLE telemetry.matches (
    match_id INT IDENTITY(1,1) PRIMARY KEY,
    game_id INT NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME,
    FOREIGN KEY (game_id) REFERENCES core.games(game_id)
);



CREATE TABLE telemetry.match_results (
    match_result_id INT IDENTITY(1,1) PRIMARY KEY,
    match_id INT NOT NULL,
    player_id INT NOT NULL,
    xp_earned INT DEFAULT 0,
    coins_earned INT DEFAULT 0,
    outcome VARCHAR(20) CHECK(outcome IN ('Win', 'Loss', 'Draw')),
    FOREIGN KEY (match_id) REFERENCES telemetry.matches(match_id),
    FOREIGN KEY (player_id) REFERENCES core.players(player_id)
);



CREATE TABLE engagement.achievements (
    achievement_id INT IDENTITY(1,1) PRIMARY KEY,
    game_id INT NOT NULL,
    description VARCHAR(255),
    reward_id INT NOT NULL,
    FOREIGN KEY (game_id) REFERENCES core.games(game_id),
    FOREIGN KEY (reward_id) REFERENCES core.rewards(reward_id)
);



CREATE TABLE engagement.player_achievements (
    player_id INT NOT NULL,
    achievement_id INT NOT NULL,
    achieved_at DATETIME,
    PRIMARY KEY (player_id, achievement_id),
    FOREIGN KEY (player_id) REFERENCES core.players(player_id),
    FOREIGN KEY (achievement_id) REFERENCES engagement.achievements(achievement_id)
);



CREATE TABLE telemetry.event_types (
    event_id INT IDENTITY(1,1) PRIMARY KEY,
    event_name VARCHAR(100) NOT NULL,
    event_description VARCHAR(255)
);



CREATE TABLE telemetry.player_events (
    player_event_id INT IDENTITY(1,1) PRIMARY KEY,
    player_id INT NOT NULL,
    event_id INT NOT NULL,
    match_id INT,
    event_time DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (player_id) REFERENCES core.players(player_id),
    FOREIGN KEY (event_id) REFERENCES telemetry.event_types(event_id),
    FOREIGN KEY (match_id) REFERENCES telemetry.matches(match_id)
);



CREATE TABLE engagement.report_types (
    report_id INT IDENTITY(1,1) PRIMARY KEY,
    report_name VARCHAR(100) NOT NULL,
    report_description VARCHAR(255)
);



CREATE TABLE engagement.player_reports (
    player_report_id INT IDENTITY(1,1) PRIMARY KEY,
    reported_player_id INT NOT NULL,
    reported_by_player_id INT NOT NULL,
    report_id INT NOT NULL,
    reported_at DATETIME,
    FOREIGN KEY (reported_player_id) REFERENCES core.players(player_id),
    FOREIGN KEY (reported_by_player_id) REFERENCES core.players(player_id),
    FOREIGN KEY (report_id) REFERENCES engagement.report_types(report_id)
);



CREATE TABLE infra.audit_log (
    audit_id INT IDENTITY(1,1) PRIMARY KEY,
    table_name VARCHAR(50),
    operation VARCHAR(10) CHECK(operation IN ('Insert', 'Update', 'Delete')),
    changed_at DATETIME DEFAULT GETDATE(),
    changed_by INT,
    FOREIGN KEY (changed_by) REFERENCES core.users(user_id)
);

