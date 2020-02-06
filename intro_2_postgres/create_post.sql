CREATE TABLE post (
    post_id SERIAL PRIMARY KEY,
    thread_id INTEGER NOT NULL REFERENCES thread (thread_id),
    account_id INTEGER NOT NULL,
    created TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
    visible BOOLEAN NOT NULL DEFAULT TRUE,
    comment TEXT NOT NULL
);

