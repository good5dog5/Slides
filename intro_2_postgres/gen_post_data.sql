INSERT INTO post(thread_id, account_id, created, visible, comment)
SELECT
    RANDOM() * 999 + 1,
    RANDOM() * 99 + 1,
    NOW() - ('1 days'::interval * random() * 1000),
    CASE WHEN RANDOM() > 0.1 THEN TRUE ELSE FALSE END,
    (SELECT substr(concat(concat(md5(random()::text), md5(random()::text)), md5(random()::text)), 0, 150))
FROM generate_series(1, 100000) AS s(n)
;




