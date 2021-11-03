WITH usernames AS
(SELECT DISTINCT(username) FROM bad_posts 
UNION 
SELECT DISTINCT(username) FROM bad_comments) 
INSERT INTO good_users (username)
SELECT * FROM usernames; 
---we lest users who only votes for next time---


INSERT INTO good_topics (topic_name) SELECT DISTINCT(topic) FROM bad_posts;

SELECT count(*) FROM bad_posts WHERE url IS NOT NULL and text_content IS NOT NULL;
