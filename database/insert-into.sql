INSERT INTO core.users (username, email, dob)
VALUES
('alice01', 'alice@gmail.com', '1999-04-12'),
('bob99', 'bob@gmail.com', '1998-11-23'),
('charlie_dev', 'charlie@gmail.com', '2000-01-05'),
('diana_x', 'diana@gmail.com', '1997-07-19'),
('eve_gamer', 'eve@gmail.com', '2001-03-14'),
('frank007', 'frank@gmail.com', '1996-09-02'),
('grace_playz', 'grace@gmail.com', '1999-12-30'),
('henry_xp', 'henry@gmail.com', '1995-05-21');

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
(4, 200, 3, 1300, 400, GETDATE()),
(5, 100, 1, 50, 20, GETDATE()),
(6, 100, 2, 720, 180, GETDATE()),
(7, 200, 1, 110, 35, GETDATE()),
(8, 200, 2, 540, 120, GETDATE());



INSERT INTO infra.devices (player_id, device_type, last_session)
VALUES
(1, 'PC', GETDATE()),
(2, 'Console', GETDATE()),
(3, 'Mobile', GETDATE()),
(4, 'PC', GETDATE()),
(5, 'Mobile', GETDATE()),
(6, 'PC', GETDATE()),
(7, 'Console', GETDATE()),
(8, 'Mobile', GETDATE());

INSERT INTO infra.regions (player_id, region, last_session)
VALUES
(1, 'NA', GETDATE()),
(2, 'EU', GETDATE()),
(3, 'ASIA', GETDATE()),
(4, 'NA', GETDATE()),
(5, 'EU', GETDATE()),
(6, 'NA', GETDATE()),
(7, 'ASIA', GETDATE()),
(8, 'EU', GETDATE());

INSERT INTO infra.audit_log (table_name, operation, changed_by)
VALUES
('players', 'Insert', 1),
('match_results', 'Insert', 2),
('player_reports', 'Insert', 4),
('players', 'Update', 2),
('purchases', 'Insert', 5),
('player_achievements', 'Insert', 6),
('match_results', 'Update', 1);



INSERT INTO engagement.purchases (player_id, reward_id)
VALUES
(1, 1),
(2, 2),
(4, 3),
(3, 1),
(5, 2),
(6, 3),
(8, 1);

INSERT INTO engagement.achievements (game_id, description, reward_id)
VALUES
(100, 'First Blood', 1),
(100, 'Win 10 Matches', 2),
(200, 'Speed Runner', 3),
(100, 'Play 5 Matches', 1),
(200, 'Win First Race', 2);

INSERT INTO engagement.player_achievements (player_id, achievement_id, achieved_at)
VALUES
(1, 1, GETDATE()),
(2, 2, GETDATE()),
(4, 3, GETDATE()),
(3, 4, GETDATE()),
(5, 1, GETDATE()),
(6, 2, GETDATE()),
(8, 5, GETDATE());


INSERT INTO engagement.report_types (report_name, report_description)
VALUES
('Cheating', 'Using unfair advantages'),
('Abusive Language', 'Toxic behavior in chat');

INSERT INTO engagement.player_reports (reported_player_id, reported_by_player_id, report_id, reported_at)
VALUES
(2, 1, 1, GETDATE()),
(3, 4, 2, GETDATE()),
(4, 2, 1, GETDATE()),
(6, 5, 2, GETDATE());



INSERT INTO telemetry.matches (game_id, start_time, end_time)
VALUES
(100, DATEADD(MINUTE, -15, GETDATE()), GETDATE()),
(200, DATEADD(MINUTE, -10, GETDATE()), GETDATE()),
(100, DATEADD(MINUTE, -20, GETDATE()), DATEADD(MINUTE, -5, GETDATE())),
(200, DATEADD(MINUTE, -30, GETDATE()), DATEADD(MINUTE, -12, GETDATE()));


INSERT INTO telemetry.match_results (match_id, player_id, xp_earned, coins_earned, outcome)
VALUES
(1, 1, 120, 40, 'Win'),
(1, 2, 80, 20, 'Loss'),
(2, 3, 60, 15, 'Loss'),
(2, 4, 150, 60, 'Win'),
(3, 5, 70, 25, 'Loss'),
(3, 6, 140, 50, 'Win'),
(4, 7, 90, 30, 'Loss'),
(4, 8, 160, 70, 'Win');

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
(3, 2, 2),
(5, 2, 3),
(6, 1, 3),
(6, 1, 3),
(7, 2, 4),
(8, 3, 4),
(8, 1, 4);



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


