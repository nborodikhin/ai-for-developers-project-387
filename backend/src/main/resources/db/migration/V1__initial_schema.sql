CREATE TABLE event_types (
    id               INTEGER PRIMARY KEY AUTOINCREMENT,
    name             VARCHAR(255) NOT NULL,
    description      TEXT        NOT NULL,
    duration_minutes INTEGER     NOT NULL,
    deleted          BOOLEAN     NOT NULL DEFAULT FALSE
);

CREATE TABLE bookings (
    id               INTEGER PRIMARY KEY AUTOINCREMENT,
    event_type_id    INTEGER      NOT NULL REFERENCES event_types(id),
    event_type_name  VARCHAR(255) NOT NULL,
    guest_name       VARCHAR(255) NOT NULL,
    guest_email      VARCHAR(255) NOT NULL,
    comment          TEXT,
    start_time       VARCHAR(50)  NOT NULL,
    end_time         VARCHAR(50)  NOT NULL
);

CREATE TABLE settings (
    id       INTEGER PRIMARY KEY AUTOINCREMENT,
    timezone VARCHAR(100) NOT NULL DEFAULT 'UTC'
);

INSERT INTO settings (timezone) VALUES ('UTC');
