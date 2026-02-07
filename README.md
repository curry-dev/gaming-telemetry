# Gaming Telemetry

An event-driven gaming telemetry and analytics platform designed to model, store, and analyze player activity data using a robust OLTP database design.

This project focuses on **data modeling, normalization, and advanced SQL programming**, simulating real-world event ingestion through stored procedures, triggers, and views. The system is built incrementally as a hands-on learning project for data engineering concepts.

---

## 🎯 Project Goals

- Design a **production-style OLTP schema** using normalized relational modeling
- Capture **session-based player activity** and in-game events
- Enforce data integrity using **constraints, stored procedures, and triggers**
- Simulate **real-time data ingestion** using synthetic event generation
- Build reusable **views for analytics and reporting**
- Serve as a foundation for future extensions into data warehousing, BI, and ML

---

## 🧠 Core Concepts

- Session-based gameplay modeling
- Event-driven data ingestion
- Append-only event tables
- Strong referential integrity
- Business logic inside the database
- Auditability and governance

---

## 🗂️ Project Structure

gaming-telemetry-platform/
│
├── schema/
│ ├── tables.sql
│ ├── constraints.sql
│ └── indexes.sql
│
├── stored-procedures/
│ └── ingestion/
│
├── triggers/
│
├── views/
│
├── seed-data/
│
├── docs/
│ ├── er-diagram.png
│ └── design-notes.md
│
└── README.md

---

## 🧱 Core Entities

- Player
- Session
- GameEvent
- EventType
- Purchase
- Achievement
- PlayerAchievement
- Device
- Region
- AuditLog
- AntiCheatFlag

The schema is intentionally designed to support **high-volume event data**, lifecycle tracking, and extensibility.

---

## 🔁 Data Ingestion Approach

All data is inserted through **stored procedures**, simulating real-time ingestion from a game client or API layer.

This ensures:
- Consistent validation
- Centralized business logic
- Automatic trigger execution
- Production-like data flow

Synthetic event generation is used to simulate player behavior for testing and demonstration.

---

## 🚀 Future Extensions (Planned)

- Data warehouse (star schema)
- ETL pipelines
- BI dashboards (Power BI / Tableau)
- ML-based churn and anomaly detection
- Cloud deployment (Azure / AWS / Snowflake)

---

## 📄 License

This project is licensed under the MIT License.
