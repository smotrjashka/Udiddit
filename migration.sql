WITH usernames AS
(SELECT DISTINCT(username) FROM bad_posts 
UNION 
SELECT DISTINCT(username) FROM bad_comments) 
INSERT INTO good_users (username)
SELECT * FROM usernames; 
---we lest users who only votes for next time---


INSERT INTO good_topics (topic_name) SELECT DISTINCT(topic) FROM bad_posts;

INSERT INTO good_posts (title, topic_id, user_id, url, text_content)
SELECT substring(bad_posts.title from 0 for 100), good_topics.id, good_users.id,  bad_posts.url, bad_posts.text_content 
FROM bad_posts 
JOIN good_users ON bad_posts.username=good_users.username
JOIN good_topics ON bad_posts.topic=good_topics.topic_name;
