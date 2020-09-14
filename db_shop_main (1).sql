-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Июн 19 2019 г., 21:07
-- Версия сервера: 10.1.10-MariaDB
-- Версия PHP: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `db_shop_main`
--

-- --------------------------------------------------------

--
-- Структура таблицы `baskets`
--

CREATE TABLE `baskets` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `quantity` int(100) NOT NULL,
  `sum` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `baskets`
--

INSERT INTO `baskets` (`id`, `order_id`, `user_id`, `good_id`, `quantity`, `sum`) VALUES
(1, 1, 1, 2, 1, 4990),
(2, 1, 1, 5, 1, 17500),
(3, 2, 1, 9, 1, 27990),
(4, 2, 1, 12, 1, 5990),
(5, 2, 1, 13, 1, 10990);

-- --------------------------------------------------------

--
-- Структура таблицы `catalog`
--

CREATE TABLE `catalog` (
  `id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `size_id` int(10) NOT NULL,
  `quantity` int(100) NOT NULL,
  `art` varchar(120) NOT NULL,
  `category` int(1) NOT NULL,
  `price` int(100) NOT NULL,
  `img` varchar(256) NOT NULL,
  `rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `catalog`
--

INSERT INTO `catalog` (`id`, `name`, `size_id`, `quantity`, `art`, `category`, `price`, `img`, `rate`) VALUES
(1, 'Nike Air Force 1 Low', 10, 1, '1000012', 1, 6990, 'https://stockx.imgix.net/Nike-Air-Force-1-Low-Utility-White-Black-Product.jpg?fit=fill', 2),
(2, 'Nike Air Force 1', 11, 3, '1000013', 1, 4990, 'https://c.static-nike.com/a/images/t_PDP_1280_v1/f_auto/ijbiqmxnjg39vqy78nzc/%D0%BA%D1%80%D0%BE%D1%81%D1%81%D0%BE%D0%B2%D0%BA%D0%B8-air-force-1-mid-07-LBT9qno7.jpg', 1),
(3, 'Nike Air Max 90', 9, 5, '1000015', 1, 5990, 'https://www.flightclub.com/media/catalog/product/cache/1/image/1600x1140/9df78eab33525d08d6e5fb8d27136e95/0/5/052640_01.jpg', 0),
(4, 'CONVERSE ERX Impress', 11, 2, '163778C', 1, 7500, 'https://cdn-images.farfetch-contents.com/13/49/74/40/13497440_18827417_480.jpg', 0),
(5, 'Air Jordan 1 Retro', 8, 2, '10000213', 1, 17500, 'https://cdn-images.farfetch-contents.com/13/19/67/88/13196788_18822957_480.jpg', 1),
(8, 'Air Jordan 1 Retro''', 4, 2, '100246', 1, 29990, 'https://cdn-images.farfetch-contents.com/13/15/76/82/13157682_14718567_480.jpg', 0),
(9, 'Air Jordan 1 Mid', 10, 4, '100357', 1, 27990, 'https://cdn-images.farfetch-contents.com/13/03/15/29/13031529_18576008_1000.jpg', 1),
(10, 'BURBERRY', 8, 1, '100777', 1, 35000, 'https://cdn-images.farfetch-contents.com/14/10/12/26/14101226_18527053_480.jpg', 0),
(11, 'CALVIN KLEIN 205W39NYC', 6, 2, '100767', 1, 23000, 'https://cdn-images.farfetch-contents.com/13/34/37/45/13343745_16267975_480.jpg', 0),
(12, 'Adidas Stan Smith', 7, 4, '5860', 1, 5990, 'http://fireboxclub.com/i24i.php?connect=00000005456&foto=~1DSC_7578.jpg&razdel=tovar&h=300&w=700', 1),
(13, 'Vans Sk8-Hi', 4, 3, '4657', 1, 10990, 'http://fireboxclub.com/i24i.php?connect=00000008107&foto=~1va1.JPG&razdel=tovar&h=300&w=700', 1),
(14, 'Balenciaga Speed ', 5, 1, '100888', 1, 18990, 'http://fireboxclub.com/goodsimg/00000014012/~1DSC_1325.jpg', 0),
(15, 'Fila', 1, 1, '2345', 1, 4500, 'http://fireboxclub.com/i24i.php?connect=00000014467&foto=~1DSC_4287.jpg&razdel=tovar&h=300&w=700', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `address` varchar(256) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `sum` int(20) NOT NULL,
  `disc` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `customers`
--

INSERT INTO `customers` (`id`, `name`, `address`, `phone`, `sum`, `disc`) VALUES
(1, 'Хлебникова Елена', 'Иркутск, Байкальская 200, кв 2', '89996667771', 22490, 0),
(2, 'Бучнева Евгения', 'Иркутск, Лермонтова 333, кв 10', '89507778889', 0, 0),
(3, 'Юлия Цветаева', 'Первомайский 62, 35', '8900989009', 0, 0),
(4, 'Никита Раскольников', 'Иркутск, Вампилова 31, кв 99', '8900989001', 0, 0),
(5, 'УНИВЕРСАЛЬНЫЙ', 'УНИВЕРСАЛЬНЫЙ', '0', 44970, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `address` varchar(120) NOT NULL,
  `date` datetime NOT NULL,
  `state_id` int(11) NOT NULL,
  `additional` varchar(256) NOT NULL,
  `sum` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `courier_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `address`, `date`, `state_id`, `additional`, `sum`, `user_id`, `courier_id`) VALUES
(1, 1, 'Иркутск, Байкальская 200, кв 2', '2019-06-20 03:01:56', 2, 'Доставить в 13:00 20 Июня', 22490, 1, 6),
(2, 5, 'УНИВЕРСАЛЬНЫЙ', '2019-06-20 03:05:54', 3, '', 44970, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role` varchar(50) NOT NULL,
  `descr` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `role`, `descr`) VALUES
(1, 'admin', 'Администратор'),
(2, 'courier', 'Курьер'),
(3, 'manager', 'Менеджер по продажам'),
(4, 'clad', 'Кладовщик');

-- --------------------------------------------------------

--
-- Структура таблицы `sizes`
--

CREATE TABLE `sizes` (
  `id` int(11) NOT NULL,
  `size` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `sizes`
--

INSERT INTO `sizes` (`id`, `size`) VALUES
(1, 35),
(2, 36),
(3, 37),
(4, 38),
(5, 39),
(6, 40),
(7, 41),
(8, 42),
(9, 43),
(10, 44),
(11, 45),
(12, 46);

-- --------------------------------------------------------

--
-- Структура таблицы `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `descr` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `states`
--

INSERT INTO `states` (`id`, `descr`) VALUES
(1, 'Скомплектован'),
(2, 'Доставляется'),
(3, 'Доставлен'),
(4, 'Отменен');

-- --------------------------------------------------------

--
-- Структура таблицы `temp_baskets`
--

CREATE TABLE `temp_baskets` (
  `id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `login` varchar(120) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password` varchar(120) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `login`, `email`, `password`, `role_id`) VALUES
(1, 'Владимир Яшкин', 'admin', 'sportbet95@ya.ru', '21232f297a57a5a743894a0e4a801fc3', 1),
(2, 'Никита Тревц', 'Nikita', 'nickita@mail.ru', '21232f297a57a5a743894a0e4a801fc3', 4),
(3, 'Julia', 'Julia', 'test@rum.ru', '21232f297a57a5a743894a0e4a801fc3', 1),
(4, 'Иван Доставкин', 'ivan', 'ivan@mail.yu', '21232f297a57a5a743894a0e4a801fc3', 2),
(5, 'Кристина Петрова', 'login', 'dasd@dssa', '', 2),
(6, 'Кристал Курьеров', 'courier', 'mail@mail', '21232f297a57a5a743894a0e4a801fc3', 2),
(7, 'Петр Поставкин', 'store', 'store@store', '21232f297a57a5a743894a0e4a801fc3', 4);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `baskets`
--
ALTER TABLE `baskets`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `temp_baskets`
--
ALTER TABLE `temp_baskets`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `baskets`
--
ALTER TABLE `baskets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT для таблицы `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `temp_baskets`
--
ALTER TABLE `temp_baskets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
