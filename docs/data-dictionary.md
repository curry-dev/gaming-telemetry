Users
Represents registered individuals in the system. A user owns an account and may participate in one or more games through associated player profiles.

Players
Represents a user’s in-game profile for a specific game. Tracks progression, experience points, in-game currency, and session activity.

Games
Represents games supported by the platform. Each game defines its own progression, achievements, and matches.

Levels
Represents progression tiers within a game. Levels define XP thresholds and the rewards granted upon reaching them.

Rewards
Represents incentives such as XP and in-game currency granted through gameplay, achievements, or purchases.

Achievements
Represents predefined milestones within a game that players can earn by completing specific objectives.

Player_Achievements
Associative entity that records when a player earns a specific achievement, including the timestamp of completion.

Matches
Represents individual gameplay sessions or competitions within a game, defined by start and end times.

Match_Results
Represents the outcome and performance metrics of a player within a specific match.

Event_Types
Represents predefined categories of gameplay events that can occur during a match (e.g., kills, deaths, objectives).

Player_Events
Represents individual occurrences of gameplay events performed by players during matches.

Purchases
Represents transactions where players acquire rewards using in-game or real currency.

Devices
Represents the hardware platform used by a player to access the game (e.g., PC, console, mobile).

Regions
Represents the geographical or server region associated with a player’s gameplay activity.

Report_Types
Represents predefined categories for player misconduct reports.

Player_Reports
Represents individual moderation reports filed by players against other players.

Audit_Log
Represents a historical record of changes made to critical database tables for tracking, accountability, and debugging purposes.
