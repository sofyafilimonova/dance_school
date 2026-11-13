-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Ноя 13 2026 г., 11:55
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `dance_school`
--

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `client_id` char(6) NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `level_code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`client_id`, `full_name`, `phone`, `birth_date`, `level_code`) VALUES
('000001', 'Смирнова Елена Андреевна', '+7 (900) 111-22-33', '2002-04-15', 'LV-01'),
('000002', 'Кузнецов Артем Игоревич', '+7 (900) 222-22-22', '1999-08-21', 'LV-02'),
('000003', 'Попова Дарья Сергеевна', '+7 (900) 333-33-33', '2005-02-10', 'LV-01'),
('000004', 'Волков Максим Олегович', '+7 (900) 444-44-44', '1997-11-03', 'LV-03'),
('000005', 'Морозова Алина Павловна', '+7 (900) 555-55-55', '2001-06-27', 'LV-02');

-- --------------------------------------------------------

--
-- Структура таблицы `directions`
--

CREATE TABLE `directions` (
  `direction_code` varchar(10) NOT NULL,
  `direction_name` varchar(100) NOT NULL,
  `trainer_id` varchar(10) NOT NULL,
  `hall_no` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `directions`
--

INSERT INTO `directions` (`direction_code`, `direction_name`, `trainer_id`, `hall_no`) VALUES
('DR-01', 'Бальные танцы', 'TCH-001', 'H-01'),
('DR-02', 'Растяжка', 'TCH-003', 'H-02'),
('DR-03', 'Современные танцы', 'TCH-002', 'H-03');

-- --------------------------------------------------------

--
-- Структура таблицы `halls`
--

CREATE TABLE `halls` (
  `hall_no` varchar(10) NOT NULL,
  `max_capacity` int(11) NOT NULL
) ;

--
-- Дамп данных таблицы `halls`
--

INSERT INTO `halls` (`hall_no`, `max_capacity`) VALUES
('H-01', 15),
('H-02', 12),
('H-03', 20);

-- --------------------------------------------------------

--
-- Структура таблицы `lesson_visits`
--

CREATE TABLE `lesson_visits` (
  `subscription_no` varchar(12) NOT NULL,
  `direction_code` varchar(10) NOT NULL,
  `lesson_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `lesson_visits`
--

INSERT INTO `lesson_visits` (`subscription_no`, `direction_code`, `lesson_date`) VALUES
('AB-00001', 'DR-01', '2026-09-02'),
('AB-00001', 'DR-01', '2026-09-04'),
('AB-00001', 'DR-02', '2026-09-06'),
('AB-00002', 'DR-03', '2026-09-06'),
('AB-00002', 'DR-03', '2026-09-08'),
('AB-00003', 'DR-01', '2026-10-20'),
('AB-00003', 'DR-02', '2026-09-11'),
('AB-00004', 'DR-01', '2026-09-13'),
('AB-00004', 'DR-03', '2026-09-15'),
('AB-00005', 'DR-02', '2026-10-02'),
('AB-00005', 'DR-02', '2026-10-04'),
('AB-00006', 'DR-01', '2026-10-16');

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `popular_directions`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `popular_directions` (
`direction_code` varchar(10)
,`direction_name` varchar(100)
,`visits_count` bigint(21)
);

-- --------------------------------------------------------

--
-- Структура таблицы `subscriptions`
--

CREATE TABLE `subscriptions` (
  `subscription_no` varchar(12) NOT NULL,
  `client_id` char(6) NOT NULL,
  `tariff_code` varchar(10) NOT NULL,
  `activation_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `subscriptions`
--

INSERT INTO `subscriptions` (`subscription_no`, `client_id`, `tariff_code`, `activation_date`) VALUES
('AB-00001', '000001', 'TR-02', '2026-09-01'),
('AB-00002', '000002', 'TR-03', '2026-09-05'),
('AB-00003', '000003', 'TR-01', '2026-09-10'),
('AB-00004', '000004', 'TR-02', '2026-09-12'),
('AB-00005', '000005', 'TR-03', '2026-10-01'),
('AB-00006', '000001', 'TR-01', '2026-10-15');

-- --------------------------------------------------------

--
-- Структура таблицы `tariffs`
--

CREATE TABLE `tariffs` (
  `tariff_code` varchar(10) NOT NULL,
  `tariff_name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ;

--
-- Дамп данных таблицы `tariffs`
--

INSERT INTO `tariffs` (`tariff_code`, `tariff_name`, `price`) VALUES
('TR-01', 'Разовое занятие', 700.00),
('TR-02', '8 занятий на 1 месяц', 4000.00),
('TR-03', 'Безлимит на 3 месяца', 10500.00);

-- --------------------------------------------------------

--
-- Структура таблицы `trainers`
--

CREATE TABLE `trainers` (
  `trainer_id` varchar(10) NOT NULL,
  `full_name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `trainers`
--

INSERT INTO `trainers` (`trainer_id`, `full_name`) VALUES
('TCH-001', 'Иванова Мария Сергеевна'),
('TCH-002', 'Петров Алексей Андреевич'),
('TCH-003', 'Соколова Анна Дмитриевна');

-- --------------------------------------------------------

--
-- Структура таблицы `training_levels`
--

CREATE TABLE `training_levels` (
  `level_code` varchar(10) NOT NULL,
  `level_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `training_levels`
--

INSERT INTO `training_levels` (`level_code`, `level_name`) VALUES
('LV-01', 'Начинающий'),
('LV-02', 'Продолжающий'),
('LV-03', 'Профессионал');

-- --------------------------------------------------------

--
-- Структура для представления `popular_directions`
--
DROP TABLE IF EXISTS `popular_directions`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `popular_directions`  AS SELECT `directions`.`direction_code` AS `direction_code`, `directions`.`direction_name` AS `direction_name`, count(`lesson_visits`.`subscription_no`) AS `visits_count` FROM (`directions` left join `lesson_visits` on(`directions`.`direction_code` = `lesson_visits`.`direction_code`)) GROUP BY `directions`.`direction_code`, `directions`.`direction_name` ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`),
  ADD KEY `fk_clients_level` (`level_code`),
  ADD KEY `idx_clients_full_name` (`full_name`);

--
-- Индексы таблицы `directions`
--
ALTER TABLE `directions`
  ADD PRIMARY KEY (`direction_code`),
  ADD KEY `fk_directions_trainer` (`trainer_id`),
  ADD KEY `fk_directions_hall` (`hall_no`);

--
-- Индексы таблицы `halls`
--
ALTER TABLE `halls`
  ADD PRIMARY KEY (`hall_no`);

--
-- Индексы таблицы `lesson_visits`
--
ALTER TABLE `lesson_visits`
  ADD PRIMARY KEY (`subscription_no`,`direction_code`,`lesson_date`),
  ADD KEY `fk_visits_direction` (`direction_code`),
  ADD KEY `idx_visits_lesson_date` (`lesson_date`);

--
-- Индексы таблицы `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`subscription_no`),
  ADD KEY `fk_subscriptions_client` (`client_id`),
  ADD KEY `fk_subscriptions_tariff` (`tariff_code`);

--
-- Индексы таблицы `tariffs`
--
ALTER TABLE `tariffs`
  ADD PRIMARY KEY (`tariff_code`);

--
-- Индексы таблицы `trainers`
--
ALTER TABLE `trainers`
  ADD PRIMARY KEY (`trainer_id`);

--
-- Индексы таблицы `training_levels`
--
ALTER TABLE `training_levels`
  ADD PRIMARY KEY (`level_code`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `fk_clients_level` FOREIGN KEY (`level_code`) REFERENCES `training_levels` (`level_code`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `directions`
--
ALTER TABLE `directions`
  ADD CONSTRAINT `fk_directions_hall` FOREIGN KEY (`hall_no`) REFERENCES `halls` (`hall_no`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_directions_trainer` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `lesson_visits`
--
ALTER TABLE `lesson_visits`
  ADD CONSTRAINT `fk_visits_direction` FOREIGN KEY (`direction_code`) REFERENCES `directions` (`direction_code`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_visits_subscription` FOREIGN KEY (`subscription_no`) REFERENCES `subscriptions` (`subscription_no`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `fk_subscriptions_client` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_subscriptions_tariff` FOREIGN KEY (`tariff_code`) REFERENCES `tariffs` (`tariff_code`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
