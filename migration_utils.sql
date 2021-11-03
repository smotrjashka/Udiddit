SELECT COUNT(*) FROM bad_posts WHERE LENGTH(TRIM(topic)) <1;

SELECT DISTINCT(topic) FROM bad_posts WHERE LENGTH(topic)>30 OR LENGTH(TRIM(topic))<1;

SELECT count(*) FROM bad_posts WHERE url IS NOT NULL and text_content IS NOT NULL;
