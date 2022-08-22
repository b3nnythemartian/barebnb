CREATE TABLE users (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    username VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
);

CREATE TABLE notifications (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    message VARCHAR(1024) NOT NULL,
    been_read bool NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE ON
);

CREATE TABLE bears (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    description TEXT NOT NULL DEFAULT '',
    price FLOAT NOT NULL,
    FOREIGN KEY (breed_id) REFERENCES breeds(id),
);

CREATE TABLE breeds (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL DEFAULT '',
);

CREATE TABLE ratings (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    rating INTEGER NOT NULL BETWEEN 0 and 5,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE availabilitys (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    date DATE NOT NULL,
    FOREIGN KEY (bear_id) REFERENCES bears(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
);

CREATE TABLE photos (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    filename VARCHAR(255) NOT NULL,
    FOREIGN KEY (bear_id) REFERENCES bears(id)
);