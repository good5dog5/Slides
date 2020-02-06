CREATE TABLE post (
    post_id SERIAL PRIMARY KEY,
    thread_id INTEGER NOT NULL REFERENCES thread (thread_id),
    account_id INTEGER NOT NULL REFERENCES account (account_id),
    created TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    visible BOOLEAN NOT NULL DEFAULT TRUE,
    comment TEXT NOT NULL
);

CREATE TABLE account (
    account_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    dob DATE
);

CREATE TABLE thread (
    thread_id SERIAL PRIMARY KEY,
    account_id INTEGER NOT NULL REFERENCES account (account_id),
    title TEXT NOT NULL
);

