-- record match results

CREATE PROCEDURE telemetry.sp_record_match_result
    @match_id INT,
    @player_id INT,
    @xp_earned INT,
    @coins_earned INT,
    @outcome VARCHAR(10)
AS
BEGIN
    -- SET NOCOUNT ON;

    INSERT INTO telemetry.match_results
        (match_id, player_id, xp_earned, coins_earned, outcome)
    VALUES
        (@match_id, @player_id, @xp_earned, @coins_earned, @outcome);

    UPDATE core.players
    SET
        xp = xp + @xp_earned,
        coins = coins + @coins_earned,
        last_session = SYSDATETIME()
    WHERE player_id = @player_id;
END;