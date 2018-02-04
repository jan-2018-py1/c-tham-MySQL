use friendships;

SELECT * FROM friendships.users;
#'1','Chris','Baker','2018-01-30 17:47:46','2018-01-30 17:47:46'
#'2','Diana','Smith','2018-01-30 17:47:50','2018-01-30 17:47:50'
#'3','James','Johnson','2018-01-30 17:47:52','2018-01-30 17:47:52'
#'4','Jessica','Davidson','2018-01-30 17:47:53','2018-01-30 17:47:53'

INSERT INTO `friendships`.`users` (`first_name`, `last_name`, `created_at`, `updated_at`) VALUES ('Chris', 'Baker', now(), now());
INSERT INTO `friendships`.`users` (`first_name`, `last_name`, `created_at`, `updated_at`) VALUES ('Diana', 'Smith', now(), now());
INSERT INTO `friendships`.`users` (`first_name`, `last_name`, `created_at`, `updated_at`) VALUES ('James', 'Johnson', now(), now());
INSERT INTO `friendships`.`users` (`first_name`, `last_name`, `created_at`, `updated_at`) VALUES ('Jessica', 'Davidson', now(), now());

UPDATE `friendships`.`users` SET `first_name`='Diana' WHERE `id`='2';


SELECT * FROM friendships.friendships;
#'2','2018-01-30 17:54:41','2018-01-30 17:54:41','1','4'
#'3','2018-01-30 17:54:42','2018-01-30 17:54:42','1','3'
#'4','2018-01-30 17:54:43','2018-01-30 17:54:43','1','2'
#'5','2018-01-30 17:54:44','2018-01-30 17:54:44','2','1'
#'6','2018-01-30 17:54:44','2018-01-30 17:54:44','3','1'
#'7','2018-01-30 17:54:46','2018-01-30 17:54:46','4','1'

INSERT INTO `friendships`.`friendships` (`created_at`, `updated_at`, `user_id`, `friend_id`) VALUES (now(), now(), '1', '4');
INSERT INTO `friendships`.`friendships` (`created_at`, `updated_at`, `user_id`, `friend_id`) VALUES (now(), now(), '1', '3');
INSERT INTO `friendships`.`friendships` (`created_at`, `updated_at`, `user_id`, `friend_id`) VALUES (now(), now(), '1', '2');
INSERT INTO `friendships`.`friendships` (`created_at`, `updated_at`, `user_id`, `friend_id`) VALUES (now(), now(), '2', '1');
INSERT INTO `friendships`.`friendships` (`created_at`, `updated_at`, `user_id`, `friend_id`) VALUES (now(), now(), '3', '1');
INSERT INTO `friendships`.`friendships` (`created_at`, `updated_at`, `user_id`, `friend_id`) VALUES (now(), now(), '4', '1');

DELETE FROM `friendships`.`friendships` WHERE `id`='1';



SELECT u1.first_name, u1.last_name, u2.first_name as friend_first_name, u2.last_name as friend_last_name
FROM friendships f
join users u1 on f.user_id = u1.id
join users u2 on f.friend_id = u2.id
order by friend_last_name
;

SELECT u1.first_name, u1.last_name, u2.first_name as friend_first_name, u2.last_name as friend_last_name
FROM friendships f
left join users u1 on f.user_id = u1.id
left join users u2 on f.friend_id = u2.id
order by friend_last_name
;

-- Written by Todd Enders, 2017
SELECT users.first_name, users.last_name, user2.first_name AS friend_first_name, user2.last_name AS friend_last_name
FROM users
	LEFT JOIN friendships ON users.id = friendships.user_id
	LEFT JOIN users as user2 ON friendships.friend_id = user2.id;

#SELECT * FROM users 
#LEFT JOIN friendships ON ____=____ 
#LEFT JOIN users as user2 ON ____ = ____

#SELECT user2.first_name as friend_first_name, user2.last_name as friend_last_name, ...  FROM ...
