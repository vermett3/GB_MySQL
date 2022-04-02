

2. Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке

use vk;
SELECT DISTINCT first_name FROM users; --вывод списка юзеров

SELECT DISTINCT first_name from users order by first_name ASC; -- вывод в алфавитном порядке

3. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = false). 
Предварительно добавить такое поле в таблицу profiles со значением по умолчанию = true (или 1)

-- добавление поля is_active в таблицу profiles со значение 1 по умолчанию
ALTER table profiles
add column is_active bit default 1;
-- отметим несовершеннолетних неактивными
UPDATE profiles 
set is_active = 0
WHERE birthday + INTERVAL 18 YEAR > NOW(); 

4. Написать скрипт, удаляющий сообщения «из будущего» (дата больше сегодняшней)

UPDATE messages 
set body = NULL 
where created_at > NOW();

5. 
