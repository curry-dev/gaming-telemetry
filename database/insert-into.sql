INSERT INTO core.users (username, email, dob)
VALUES
('alice01', 'alice@gmail.com', '1999-04-12'),
('bob99', 'bob@gmail.com', '1998-11-23'),
('charlie_dev', 'charlie@gmail.com', '2000-01-05'),
('diana_x', 'diana@gmail.com', '1997-07-19');

INSERT INTO core.games (game_name)
VALUES
('BattleQuest'),
('SpaceRacer');

INSERT INTO core.rewards (xp, coins)
VALUES
(100, 50),
(250, 100),
(500, 250);

INSERT INTO core.levels (level_id, xp_required, reward_id)
VALUES
(1, 0, 1),
(2, 500, 2),
(3, 1200, 3);

INSERT INTO core.players (user_id, game_id, level_id, xp, coins, last_session)
VALUES
(1, 100, 1, 120, 60, GETDATE()),
(2, 100, 2, 650, 140, GETDATE()),
(3, 200, 1, 80, 30, GETDATE()),
(4, 200, 3, 1300, 400, GETDATE());



INSERT INTO infra.devices (player_id, device_type, last_session)
VALUES
(1, 'PC', GETDATE()),
(2, 'Console', GETDATE()),
(3, 'Mobile', GETDATE()),
(4, 'PC', GETDATE());

INSERT INTO infra.regions (player_id, region, last_session)
VALUES
(1, 'NA', GETDATE()),
(2, 'EU', GETDATE()),
(3, 'ASIA', GETDATE()),
(4, 'NA', GETDATE());

INSERT INTO infra.audit_log (table_name, operation, changed_by)
VALUES
('players', 'Insert', 1),
('match_results', 'Insert', 2),
('player_reports', 'Insert', 4);



INSERT INTO engagement.purchases (player_id, reward_id)
VALUES
(1, 1),
(2, 2),
(4, 3);

INSERT INTO engagement.achievements (game_id, description, reward_id)
VALUES
(100, 'First Blood', 1),
(100, 'Win 10 Matches', 2),
(200, 'Speed Runner', 3);

INSERT INTO engagement.player_achievements (player_id, achievement_id, achieved_at)
VALUES
(1, 1, GETDATE()),
(2, 2, GETDATE()),
(4, 3, GETDATE());

INSERT INTO engagement.report_types (report_name, report_description)
VALUES
('Cheating', 'Using unfair advantages'),
('Abusive Language', 'Toxic behavior in chat');

INSERT INTO engagement.player_reports (reported_player_id, reported_by_player_id, report_id, reported_at)
VALUES
(2, 1, 1, GETDATE()),
(3, 4, 2, GETDATE());



INSERT INTO telemetry.matches (game_id, start_time, end_time)
VALUES
(100, DATEADD(MINUTE, -15, GETDATE()), GETDATE()),
(200, DATEADD(MINUTE, -10, GETDATE()), GETDATE());

INSERT INTO telemetry.match_results (match_id, player_id, xp_earned, coins_earned, outcome)
VALUES
(1, 1, 120, 40, 'Win'),
(1, 2, 80, 20, 'Loss'),
(2, 3, 60, 15, 'Loss'),
(2, 4, 150, 60, 'Win');

INSERT INTO telemetry.event_types (event_name, event_description)
VALUES
('Kill', 'Player killed an opponent'),
('Death', 'Player died'),
('LapComplete', 'Completed a lap');

INSERT INTO telemetry.player_events (player_id, event_id, match_id)
VALUES
(1, 1, 1),
(1, 1, 1),
(2, 2, 1),
(4, 3, 2),
(3, 2, 2);







SELECT * FROM core.users
SELECT * FROM core.games
SELECT * FROM core.rewards
SELECT * FROM core.levels
SELECT * FROM core.players

SELECT * FROM infra.devices
SELECT * FROM infra.regions
SELECT * FROM infra.audit_log

SELECT * FROM engagement.purchases
SELECT * FROM engagement.achievements
SELECT * FROM engagement.player_achievements
SELECT * FROM engagement.report_types
SELECT * FROM engagement.player_reports

SELECT * FROM telemetry.matches
SELECT * FROM telemetry.match_results
SELECT * FROM telemetry.player_events
