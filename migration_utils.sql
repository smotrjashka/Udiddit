SELECT COUNT(*) FROM bad_posts WHERE LENGTH(TRIM(topic)) <1;

SELECT DISTINCT(topic) FROM bad_posts WHERE LENGTH(topic)>30;


