-- leaderboard
CREATE VIEW core.v_leaderboard AS
SELECT p.player_id, u.username, p.xp, p.coins
FROM core.players p
JOIN core.users u ON p.user_id = u.user_id;
GO
SELECT * FROM core.v_leaderboard ORDER BY xp DESC;



GO



-- match summary
CREATE VIEW telemetry.v_match_summary AS
SELECT g.game_name, m.match_id, mr.player_id, mr.outcome, mr.xp_earned
FROM telemetry.match_results mr
JOIN telemetry.matches m ON mr.match_id = m.match_id
JOIN core.games g ON m.game_id = g.game_id;
GO
SELECT * FROM telemetry.v_match_summary
-- WHERE game_name = 'Space Invaders';



GO



-- achievement history
CREATE VIEW engagement.v_achievement_history AS
SELECT u.username, a.description, pa.achieved_at
FROM engagement.player_achievements pa
JOIN core.players p ON pa.player_id = p.player_id
JOIN core.users u ON p.user_id = u.user_id
JOIN engagement.achievements a ON pa.achievement_id = a.achievement_id;
GO
SELECT * FROM engagement.v_achievement_history ORDER BY achieved_at DESC;


