DROP DATABASE IF EXISTS hw3;

CREATE DATABASE IF NOT EXISTS hw3;

USE hw3;

CREATE TABLE IF NOT EXISTS staff
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    post VARCHAR(45),
    seniority INT,
    salary DECIMAL(8, 2),
    age INT
);

INSERT  staff (first_name, last_name, post, seniority, salary, age)
VALUES
	 ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
	 ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
	 ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
	 ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
	 ('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
	 ('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
	 ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
	 ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
	 ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
	 ('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
	 ('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
	 ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);

-- заработная плата по убыванию
SELECT id, first_name, last_name, post, seniority, salary, age
FROM staff
ORDER BY salary DESC;

-- заработная плата по возрастанию
SELECT id, first_name, last_name, post, seniority, salary, age
FROM staff
ORDER BY salary ASC;

-- заработная плата по убыванию внутри каждой группы
SELECT post,
	GROUP_CONCAT(first_name, ' ', last_name ORDER BY salary DESC SEPARATOR ', ') AS "workers"
FROM staff
GROUP BY post;

-- заработная плата по возрастанию внутри каждой группы
SELECT post,
	GROUP_CONCAT(first_name, ' ', last_name ORDER BY salary ASC SEPARATOR ', ') AS "workers"
FROM staff
GROUP BY post;

-- 5 максимальных заработных плат
SELECT DISTINCT salary
FROM staff
ORDER BY salary DESC
LIMIT 5;

-- суммарная зарплата по каждой специальности
SELECT 
	post,
	SUM(salary) AS "total_salary"
FROM staff
GROUP BY post;

-- топ 2 рабочих по зарплате
SELECT id, first_name, last_name, post, seniority, salary, age
FROM staff
WHERE post = "Рабочий"
ORDER BY salary DESC
LIMIT 2;

-- количество сотрудников со специальностью "рабочий" в возрасте от 24 до 49 лет включительно
SELECT
	COUNT(*) AS "worker_count"
FROM staff
WHERE post = "Рабочий" AND age BETWEEN 24 AND 49;

-- список сотрудников со специальностью "рабочий" в возрасте от 24 до 49 лет включительно
SELECT id, first_name, last_name, post, seniority, salary, age
FROM staff
WHERE post = "Рабочий" AND age BETWEEN 24 AND 49;

-- количество специальностей
SELECT
	COUNT(post) AS "post_count"
FROM staff;

-- уникальное количество специальностей
SELECT
	COUNT(DISTINCT post) AS "post_count"
FROM staff;

-- специальности, у которых средний возраст сотрудников меньше 30
SELECT post,
	ROUND(AVG(age)) AS "average_age"
FROM staff
GROUP BY post
HAVING average_age < 30;