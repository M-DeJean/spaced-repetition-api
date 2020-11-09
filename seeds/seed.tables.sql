BEGIN;

TRUNCATE
  "word",
  "language",
  "user";

INSERT INTO "user" ("id", "username", "name", "password")
VALUES
  (
    1,
    'admin',
    'B2nyce Admin',
    -- password = "pass"
    '$2a$10$fCWkaGbt7ZErxaxclioLteLUgg4Q3Rp09WW0s/wSLxDKYsaGYUpjG'
  );

INSERT INTO "language" ("id", "name", "user_id")
VALUES
  (1, 'Portuguese', 1);

INSERT INTO "word" ("id", "language_id", "original", "translation", "next")
VALUES
  (1, 1, 'ola', 'hello', 2),
  (2, 1, 'brasileiro', 'brazilian', 3),
  (3, 1, 'sim', 'yes', 4),
  (4, 1, 'adeus', 'goodbye', 5),
  (5, 1, 'dezembro', 'december', 6),
  (6, 1, 'engenheiro', 'engineer', 7),
  (7, 1, 'programador', 'programmer', 8),
  (8, 1, 'hoje', 'today', null);

UPDATE "language" SET head = 1 WHERE id = 1;

-- because we explicitly set the id fields
-- update the sequencer for future automatic id setting
SELECT setval('word_id_seq', (SELECT MAX(id) from "word"));
SELECT setval('language_id_seq', (SELECT MAX(id) from "language"));
SELECT setval('user_id_seq', (SELECT MAX(id) from "user"));

COMMIT;
