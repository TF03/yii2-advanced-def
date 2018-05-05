-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Янв 15 2016 г., 14:05
-- Версия сервера: 5.5.46-0ubuntu0.14.04.2
-- Версия PHP: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `clien`
--

-- --------------------------------------------------------

--
-- Структура таблицы `site_admin_user`
--

CREATE TABLE IF NOT EXISTS `site_admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `login` varchar(256) NOT NULL,
  `name` varchar(512) NOT NULL,
  `pas` varchar(512) NOT NULL,
  `tip` int(11) NOT NULL,
  `logo` varchar(256) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `site_admin_user`
--

INSERT INTO `site_admin_user` (`id`, `pid`, `login`, `name`, `pas`, `tip`, `logo`, `sort`) VALUES
(1, 0, 'superadmin', 'SuperAdmin', '111', 1, 'large_1590.png', 1),
(2, 0, 'admin', 'admin', '222', 2, 'large_3206.png', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `site_amodules`
--

CREATE TABLE IF NOT EXISTS `site_amodules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(512) NOT NULL,
  `logo` varchar(126) NOT NULL,
  `url` varchar(512) NOT NULL,
  `en` tinyint(1) NOT NULL,
  `access` text NOT NULL,
  `pid` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=96 ;

--
-- Дамп данных таблицы `site_amodules`
--

INSERT INTO `site_amodules` (`id`, `name`, `logo`, `url`, `en`, `access`, `pid`, `sort`) VALUES
(4, 'Настройки', 'cog_3.png', '', 1, '1', 0, 9),
(5, 'AModuls', 'cog_4.png', '/admin/?r=amodul', 1, '1', 4, 1),
(9, 'Администраторы', 'admin_user.png', '/admin/?r=users/admin_users', 1, '1', 4, 3),
(10, 'Инстал модулей', 'dropbox.png', '/admin/?r=install', 1, '1', 1, 6),
(20, 'Типы админов', 'winner_podium.png', '/admin/?r=users/tip_admin_users', 1, '1', 4, 4),
(21, '2 таблицы', 'map.png', '/admin/?r=amod_and_tree', 1, '1', 1, 1),
(22, 'Настройки пользователя', 'electricity_input.png', '/admin/?r=users/admin_settings', 1, '1', 4, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `site_location`
--

CREATE TABLE IF NOT EXISTS `site_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `site_location`
--

INSERT INTO `site_location` (`id`, `name`) VALUES
(1, 'ru'),
(2, 'ua'),
(3, 'bel'),
(4, 'tenge');

-- --------------------------------------------------------

--
-- Структура таблицы `site_tip_admin`
--

CREATE TABLE IF NOT EXISTS `site_tip_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `site_tip_admin`
--

INSERT INTO `site_tip_admin` (`id`, `name`) VALUES
(1, 'Cупер администратор'),
(2, 'Администратор'),
(3, 'Менеджер'),
(4, 'Пользователь'),
(5, 'Аналитика'),
(6, 'Почасовик');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
