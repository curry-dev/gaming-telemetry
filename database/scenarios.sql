-- CTE
-- find the top 5 players per game with XP > 500
WITH TopPlayers AS (
    SELECT p.player_id, u.username, p.game_id, p.xp,
        DENSE_RANK() OVER(PARTITION BY p.game_id ORDER BY p.xp DESC) AS drnk
    FROM core.players p
    JOIN core.users u ON p.user_id = u.user_id
    WHERE p.xp > 500
)
SELECT * FROM TopPlayers WHERE drnk <= 5;



-- recursive cte
-- Determine xp required for all levels (running total of xp)
WITH LevelUnlocks AS (
    SELECT l.level_id, l.xp_required
    FROM core.levels l
    WHERE l.level_id = 1

    UNION ALL

    SELECT l.level_id, l.xp_required
    FROM core.levels l
    JOIN LevelUnlocks lu ON l.level_id = lu.level_id + 1
)
SELECT * FROM LevelUnlocks;



-- dynamic sql
-- Game admin wants a custom report for any table (players, matches, match_results)
-- Column selection or table name is determined at runtime
DECLARE @tableName NVARCHAR(50) = 'core.players';
DECLARE @sql NVARCHAR(MAX);
SET @sql = N'SELECT TOP 10 * FROM ' + @tableName + ' ORDER BY xp DESC';
EXEC sp_executesql @sql;

-- Vulnerable!
SET @sql = 'SELECT * FROM core.users WHERE username = ''' + @username + '''';
EXEC(@sql);

-- prevention
SET @sql = N'SELECT * FROM core.users WHERE username = @u';
EXEC sp_executesql @sql, N'@u NVARCHAR(50)', @u=@username;



-- CONTROL FLOW

-- Reward a player differently based on level
DECLARE @level INT = 2;
DECLARE @reward INT;
IF @level >= 10
    SET @reward = 1000
ELSE
    SET @reward = 500
SELECT @reward;

-- Calculate leaderboard tier
SELECT player_id, xp,
    CASE
        WHEN xp >= 1000 THEN 'Diamond'
        WHEN xp >= 500 THEN 'Gold'
        ELSE 'Silver'
    END AS tier
FROM core.players;



-- temporary tables
-- Calculate leaderboard temporarily

SELECT player_id, SUM(xp_earned) AS total_xp
INTO #leaderboard
FROM telemetry.match_results
GROUP BY player_id;

SELECT TOP 5 * FROM #leaderboard ORDER BY total_xp DESC;
DROP TABLE #leaderboard;



-- TABLE variable
-- Calculate XP earned by a player

DECLARE @SessionXP TABLE (
    match_id INT,
    xp_earned INT
);

INSERT INTO @SessionXP
SELECT match_id, xp_earned
FROM telemetry.match_results
WHERE player_id = 1;

SELECT SUM(xp_earned) AS total_session_xp
FROM @SessionXP;



-- set
-- Players who either won a match or earned an achievement - are active
SELECT player_id
FROM telemetry.match_results
WHERE outcome = 'Win'

UNION

SELECT player_id
FROM engagement.player_achievements;
