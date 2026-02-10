-- audit players

CREATE TRIGGER telemetry.trg_players_audit
ON core.players
AFTER UPDATE
AS
BEGIN
    INSERT INTO telemetry.audit_log
        (table_name, operation, changed_at, changed_by)
    SELECT
        'players',
        'UPDATE',
        GETDATE(),
        i.player_id
    FROM inserted i
    JOIN deleted d
        ON i.player_id = d.player_id;
END;
