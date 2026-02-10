CREATE TRIGGER telemetry.trg_players_audit
ON core.players
AFTER UPDATE
AS
BEGIN
    INSERT INTO telemetry.audit_log
        (table_name, record_id, action_type, old_values, new_values, changed_by)
    SELECT
        'players',
        i.player_id,
        'UPDATE',
        CONCAT('xp=', d.xp, ', coins=', d.coins),
        CONCAT('xp=', i.xp, ', coins=', i.coins),
        i.user_id
    FROM inserted i
    JOIN deleted d
        ON i.player_id = d.player_id;
END;