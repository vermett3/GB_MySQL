Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение. Агрегация данных”. Работаем с БД vk и данными, которые вы сгенерировали ранее:

1) Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).

select first_name, last_name from users where id = (
select from_user_id
	from messages
	where to_user_id = 11
	group by from_user_id
	order by count(from_user_id) desc
	limit 1
)

2) Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.

SELECT COUNT(*) as 'общее кол-во лайков'
FROM posts_likes
WHERE user_id IN (
	SELECT user_id 
	FROM profiles
	WHERE TIMESTAMPDIFF(YEAR, birthday, NOW()) < 10)
;


3) Определить кто больше поставил лайков (всего): мужчины или женщины.

SELECT 
	gender,
	count(*)
FROM (
	SELECT 
		user_id AS USER,
		(
			SELECT gender 
			FROM profiles
			WHERE user_id = user
		) AS gender
	FROM posts_likes
) as test
GROUP BY gender;

товарищи знакомые подсказали, что вот так проще

SELECT COUNT(*) AS 'кол-во лайков', gender FROM posts_likes, profiles
WHERE posts_likes.user_id = profiles.user_id
GROUP BY gender;

