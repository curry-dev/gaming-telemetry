User & Player Model
1. A user must be registered before becoming a player.
2. A player represents a user in a specific game.
3. A user may have multiple player profiles, but only one per game.
4. Player progression (XP, coins, level) is tracked independently per game.

Gameplay & Matches
1. Each match belongs to exactly one game.
2. A match can have multiple players, but each player has only one result per match.
3. Match outcomes are limited to Win, Loss, or Draw.
4. XP and coins earned in a match are final once recorded.

Levels & Rewards
1. Levels are global across games or mapped consistently per game.
2. Each level grants exactly one reward.
3. Rewards consist only of XP and coins (no cosmetic or item rewards).
4. Rewards can be granted via levels, achievements, or purchases.

Achievements
1. Achievements are game-specific.
2. Achievements may grant rewards.

Events & Telemetry
1. Event types are predefined and static.
2. Player events occur within the context of a match.
3. Each event is associated with one player and one match.
4. Event timestamps reflect server time, not client time.

Devices & Regions
1. Each device record represents a player’s active device, not a device inventory.
2. A player is assumed to have one primary device at a time.
3. Regions represent logical or server regions, not physical locations.
4. Region data reflects the most recent session only.

Purchases
1. Purchases are non-refundable.
2. Each purchase grants exactly one reward.
3. Purchase timestamps reflect successful completion only.

Reports & Moderation
1. Players can report other players only (not system users).
2. Each report has one reporter and one reported player.
3. Report types are predefined and managed by administrators.
4. Reports are immutable once recorded.

Audit Logging
1. Audit logs are recorded only for critical tables.
2. Audit records are append-only and never updated or deleted.
3. Audit timestamps reflect database server time.
4. Old and new values are stored in human-readable format.

System & Technical
1. All timestamps are stored in UTC.
2. Referential integrity is enforced using foreign keys.
3. The database is optimized for read-heavy analytical queries.
