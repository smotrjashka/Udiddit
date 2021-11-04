CREATE INDEX user_names_idx ON good_users(username);

CREATE INDEX topic_name_idx ON good_topics(topic_name);

CREATE INDEX url_idx ON good_posts(url);

CREATE INDEX post_topic_idx ON good_posts(topic_id);

CREATE INDEX post_user_idx ON good_posts(user_id);

CREATE INDEX low_level_comments_on_post_idx ON good_comments (post_id, associated_comment);

CREATE INDEX comment_thread_idx ON good_comments(associated_comment);

CREATE INDEX comment_user_idx ON good_comments(user_id);

CREATE INDEX votes_idx ON good_votes(posr_id, vote);
