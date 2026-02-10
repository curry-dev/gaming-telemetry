1. core schema – identity & progression
(foundational entities; referenced everywhere; slow-changing data)
-> core.users
-> core.players
-> core.games
-> core.levels
-> core.rewards

2. telemetry schema – gameplay & events
(high-volume, append-heavy tables; time-series-ish data; often queried differently (analytics))
-> telemetry.matches
-> telemetry.match_results
-> telemetry.event_types
-> telemetry.player_events

3. engagement schema – social & moderation
(player behavior, rewards, moderation; logically grouped business features)
-> engagement.achievements
-> engagement.player_achievements
-> engagement.purchases
-> engagement.report_types
-> engagement.player_reports

4. infra schema – environment & auditing
(metadata, environment, compliance; not gameplay logic)
-> infra.devices
-> infra.regions
-> infra.audit_log