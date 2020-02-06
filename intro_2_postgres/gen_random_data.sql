DROP TABLE IF EXISTS words;
CREATE TABLE words (word TEXT);
\copy words (word) FROM '/usr/share/dict/words';

INSERT INTO account (name, dob)
SELECT 
    substring('AEIOU', (random()*4)::int + 1, 1) ||
    substring('ctdrdwftmkndnfnjnknsntnyprpsrdrgrkrmrnrzslstwl', (random()*22*2+1)::int + 1, 2) ||
    substring('aeiou', (random()*4+1)::int + 1, 1) ||
    substring('ctdrdwftmkndnfnjnknsntnyprpsrdrgrkrmrnrzslstwl', (random()*22*2+1)::int + 1, 2) ||
    substring('aeiou', (random()*4+1)::int, 1)
    ,
    NOW()  + ('1 days'::interval * random()*365)
FROM generate_series(1, 100)
;

INSERT INTO thread (account_id, title)
SELECT
    RANDOM() * 99 + 1,
    (
        SELECT initcap(string_agg(word, ' '))
        FROM (TABLE words ORDER BY random() * n LIMIT 5) AS words (word)
    )
FROM generate_series(1, 1000) AS s(n)
;

INSERT INTO post(thread_id, account_id, created, visible, comment)
SELECT
    RANDOM() * 999 + 1,
    RANDOM() * 99 + 1,
    NOW() - ('1 days'::interval * random() * 1000),
    CASE WHEN RANDOM() > 0.1 THEN TRUE ELSE FALSE END,
    (SELECT substr(concat(concat(md5(random()::text), md5(random()::text)), md5(random()::text)), 0, 150))
FROM generate_series(1, 100000) AS s(n)
;




