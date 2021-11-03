CREATE TABLE good_users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(25) UNIQUE CHECK (LENGTH(TRIM(username)) > 0));

CREATE TABLE good_topics (
  id SERIAL PRIMARY KEY,
  topic_name VARCHAR(30) UNIQUE CHECK (LENGTH(TRIM(topic_name)) > 0),
  description VARCHAR(500) DEFAULT NULL);

CREATE TABLE good_posts (
  id BIGSERIAL PRIMARY KEY,
  title VARCHAR(100) CHECK (LENGTH(TRIM(title)) > 0),
  topic_id INTEGER REFERENCES "good_topics" ON DELETE CASCADE,
  user_id BIGINT REFERENCES "good_users" ON DELETE SET NULL,
  url VARCHAR(2048),
  text_content TEXT,
  CONSTRAINT "url_or_text" CHECK ((url IS NOT NULL AND text_content IS NULL) OR (url IS NULL AND text_content IS NOT NULL))
);

CREATE TABLE good_comments (
  id BIGSERIAL PRIMARY KEY,
  post_id BIGINT NOT NULL REFERENCES "good_posts" ON DELETE CASCADE,
  user_id BIGINT NOT NULL REFERENCES "good_users" ON DELETE SET NULL,
  associated_comment BIGINT DEFAULT NULL REFERENCES "good_comments" ON DELETE CASCADE,
  comment_content TEXT CHECK (LENGTH(TRIM(comment_content)) > 0),
  CONSTRAINT "associated_comment_valid_check" CHECK (associated_comment IS NULL OR (associated_comment>0 AND associated_comment<id) )
);

CREATE TABLE good_votes (
  id BIGSERIAL PRIMARY KEY,
  post_id BIGINT NOT NULL REFERENCES "good_posts" ON DELETE CASCADE,
  user_id INTEGER REFERENCES "good_users" ON DELETE SET NULL,
  vote SMALLINT NOT NULL,
  UNIQUE(id, post_id, user_id)
);
