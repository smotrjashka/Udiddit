WITH usernames AS
(SELECT DISTINCT(username) FROM bad_posts 
UNION 
SELECT DISTINCT(username) FROM bad_comments) 
INSERT INTO good_users (username)
SELECT * FROM usernames; 
---we lest users who only votes for next time---

