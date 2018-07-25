-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 13 2016 г., 19:34
-- Версия сервера: 5.5.48
-- Версия PHP: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


--
-- База данных: `demo_unishop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `answer_notifications`
--

DROP TABLE IF EXISTS `answer_notifications`;
CREATE TABLE IF NOT EXISTS `answer_notifications` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) CHARACTER SET utf8 NOT NULL,
  `name` varchar(25) CHARACTER SET utf8 NOT NULL,
  `message` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `answer_notifications`
--

INSERT INTO `answer_notifications` (`id`, `locale`, `name`, `message`) VALUES
(1, 'ua', 'incoming', '<h1>Дякуємо</h1>\n<div>В короткий час наші менеджери звяжуться з Вами</div>\n<div id="dc_vk_code" style="display: none;">&nbsp;</div>'),
(2, 'ua', 'callback', '<h1>Дякуємо</h1>\n<div>В короткий час наші менеджери звяжуться з Вами</div>\n<div id="dc_vk_code" style="display: none;">&nbsp;</div>'),
(3, 'ua', 'order', '<h1>Дякуємо</h1>\n<div>В короткий час наші менеджери звяжуться з Вами</div>\n<div id="dc_vk_code" style="display: none;">&nbsp;</div>'),
(4, 'ru', 'incoming', '<h1>Спасибо</h1>\r\n<div>В ближайшее время наши менеджеры свяжутся с Вами</div>'),
(5, 'ru', 'callback', '<p>Ваше сообщение успешно отправлено! Мы обязательно свяжемся с Вами в ближайшее время.</p>'),
(6, 'ru', 'order', '<h1>Спасибо</h1>\r\n<div>В ближайшее время наши менеджеры свяжутся с Вами</div>'),
(7, 'en', 'incoming', '<h1>Thank you</h1>\n<div>The store manager will contact you shortly</div>'),
(8, 'en', 'callback', '<h1>Thank you</h1>\n<div>The store manager will contact you shortly</div>'),
(9, 'en', 'order', '<h1>Thank you</h1>\n<div>The store manager will contact you shortly</div>');

-- --------------------------------------------------------

--
-- Структура таблицы `banners`
--

DROP TABLE IF EXISTS `banners`;
CREATE TABLE IF NOT EXISTS `banners` (
  `id` int(11) NOT NULL,
  `place` varchar(255) NOT NULL,
  `width` int(5) NOT NULL,
  `height` int(5) NOT NULL,
  `effects` text,
  `page_type` varchar(255) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `banners`
--

INSERT INTO `banners` (`id`, `place`, `width`, `height`, `effects`, `page_type`) VALUES
(39, 'main_banner_big', 940, 326, '{"autoplay":1,"autoplaySpeed":3,"arrows":0,"centerMode":0,"dots":1,"draggable":0,"fade":0,"easing":"","infinite":1,"pauseOnHover":0,"pauseOnDotsHover":0,"speed":0,"swipe":0,"touchMove":0,"vertical":0,"rtl":0,"scrollSpeed":"1"}', 'main'),
(40, 'main_banner_left', 315, 328, '{"autoplay":0,"autoplaySpeed":3,"arrows":1,"centerMode":0,"dots":0,"draggable":1,"fade":0,"easing":"linear","infinite":1,"pauseOnHover":1,"pauseOnDotsHover":0,"speed":1,"swipe":1,"touchMove":1,"vertical":0,"rtl":0,"scrollSpeed":"1"}', 'main'),
(41, 'main_banner_right_top', 630, 164, '{"autoplay":0,"autoplaySpeed":3,"arrows":1,"centerMode":0,"dots":0,"draggable":0,"fade":0,"easing":"","infinite":1,"pauseOnHover":0,"pauseOnDotsHover":0,"speed":0,"swipe":0,"touchMove":0,"vertical":0,"rtl":0,"scrollSpeed":"1"}', 'main'),
(42, 'main_banner_right_bot', 630, 164, '{"autoplay":0,"autoplaySpeed":3,"arrows":1,"centerMode":0,"dots":0,"draggable":1,"fade":0,"easing":"linear","infinite":1,"pauseOnHover":1,"pauseOnDotsHover":0,"speed":1,"swipe":1,"touchMove":1,"vertical":0,"rtl":0,"scrollSpeed":"1"}', 'main'),
(43, 'catalog_horisontal_banner', 850, 160, '{"autoplay":0,"autoplaySpeed":3,"arrows":1,"centerMode":0,"dots":0,"draggable":1,"fade":0,"easing":"linear","infinite":1,"pauseOnHover":1,"pauseOnDotsHover":0,"speed":1,"swipe":1,"touchMove":1,"vertical":0,"rtl":0,"scrollSpeed":"1"}', 'shop_category'),
(44, 'sidebar_banner', 260, 400, '{"autoplay":0,"autoplaySpeed":3,"arrows":1,"centerMode":0,"dots":0,"draggable":1,"fade":0,"easing":"linear","infinite":1,"pauseOnHover":1,"pauseOnDotsHover":0,"speed":1,"swipe":1,"touchMove":1,"vertical":0,"rtl":0,"scrollSpeed":"1"}', 'product');

-- --------------------------------------------------------

--
-- Структура таблицы `banners_i18n`
--

DROP TABLE IF EXISTS `banners_i18n`;
CREATE TABLE IF NOT EXISTS `banners_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'ru',
  `name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `banners_i18n`
--

INSERT INTO `banners_i18n` (`id`, `locale`, `name`) VALUES
(40, 'ru', 'Home left banner'),
(41, 'ru', 'Home right top banner'),
(42, 'ru', 'Home right bottom banner'),
(43, 'ru', 'Catalog horisontal banner'),
(44, 'ru', 'Sidebar banner'),
(39, 'ru', 'Home big banner');

-- --------------------------------------------------------

--
-- Структура таблицы `banner_image`
--

DROP TABLE IF EXISTS `banner_image`;
CREATE TABLE IF NOT EXISTS `banner_image` (
  `id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `target` int(2) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `allowed_page` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `active_from` int(11) DEFAULT NULL,
  `active_to` int(11) DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `permanent` int(1) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `banner_image`
--

INSERT INTO `banner_image` (`id`, `banner_id`, `target`, `url`, `allowed_page`, `position`, `active_from`, `active_to`, `active`, `permanent`) VALUES
(36, 39, 0, 'shop/category/mebel', 0, 2, NULL, NULL, 1, 1),
(37, 39, 0, '', 0, 0, NULL, NULL, 1, 1),
(38, 39, 0, 'shop/category/elektronika/planshety/brand-apple', 0, 1, NULL, NULL, 1, 1),
(39, 40, 0, 'shop/product/ipad-air', 0, 6, NULL, NULL, 1, 1),
(40, 41, 0, 'shop/category/detskie-tovary', 0, 7, NULL, NULL, 1, 1),
(41, 42, 0, 'shop/product/benzopila-stihl-ms-180', 0, 6, NULL, NULL, 1, 1),
(42, 44, 0, 'shop/brand/apple', 0, 4, NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `banner_image_i18n`
--

DROP TABLE IF EXISTS `banner_image_i18n`;
CREATE TABLE IF NOT EXISTS `banner_image_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'ru',
  `src` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `clicks` int(20) DEFAULT NULL,
  `description` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `banner_image_i18n`
--

INSERT INTO `banner_image_i18n` (`id`, `locale`, `src`, `name`, `clicks`, `description`) VALUES
(36, 'ru', '1463145920.jpg', 'Офисная мебель', 0, ''),
(37, 'ru', '1463145904.jpg', 'Grenell Kerri', 0, ''),
(38, 'ru', '1463145912.jpg', 'Apple iMac', 1, ''),
(39, 'ru', '1463147795.jpg', 'iPhone 6', 0, ''),
(40, 'ru', '1463147717.jpg', 'Teddy Bear', 0, ''),
(41, 'ru', '1463147729.jpg', 'Build tools', 0, ''),
(42, 'ru', '1463147840.jpg', 'iPad Pro', 0, '');

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `position` mediumint(5) NOT NULL DEFAULT '0',
  `name` varchar(160) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `short_desc` text NOT NULL,
  `url` varchar(300) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `keywords` text,
  `description` text,
  `fetch_pages` text NOT NULL,
  `main_tpl` varchar(50) NOT NULL,
  `tpl` varchar(50) DEFAULT NULL,
  `page_tpl` varchar(50) DEFAULT NULL,
  `per_page` smallint(5) NOT NULL,
  `order_by` varchar(25) NOT NULL,
  `sort_order` varchar(25) NOT NULL,
  `comments_default` tinyint(1) NOT NULL DEFAULT '0',
  `field_group` int(11) NOT NULL,
  `category_field_group` int(11) NOT NULL,
  `settings` varchar(10000) DEFAULT NULL,
  `created` int(11) NOT NULL,
  `updated` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `parent_id`, `position`, `name`, `title`, `short_desc`, `url`, `image`, `keywords`, `description`, `fetch_pages`, `main_tpl`, `tpl`, `page_tpl`, `per_page`, `order_by`, `sort_order`, `comments_default`, `field_group`, `category_field_group`, `settings`, `created`, `updated`) VALUES
(64, 0, 0, 'Блог', '', '', 'blog', '', '', '', 'a:3:{i:0;s:2:"67";i:1;s:2:"74";i:2;s:2:"69";}', '', '', '', 10, 'position', 'asc', 1, 11, -1, 'a:2:{s:26:"category_apply_for_subcats";b:0;s:17:"apply_for_subcats";s:1:"1";}', 1428164812, 1458576686),
(75, 0, 0, 'Преимущества', '', '', 'preimushchestva', '', '', '', 'b:0;', '', '', '', 15, 'publish_date', 'desc', 0, -1, -1, 'a:2:{s:26:"category_apply_for_subcats";b:0;s:17:"apply_for_subcats";b:0;}', 1441625834, 1441625834),
(66, 0, 4, 'Клиенты о нас', '', '', 'klienty-o-nas', '', '', '', 'b:0;', '', '', '', 15, 'publish_date', 'desc', 0, 12, -1, 'a:2:{s:26:"category_apply_for_subcats";b:0;s:17:"apply_for_subcats";b:0;}', 1429361818, 1439287112),
(67, 64, 1, 'Бизнес', '', '', 'biznes', '', '', '', 'b:0;', '', '', '', 15, 'publish_date', 'desc', 1, 11, -1, 'a:2:{s:26:"category_apply_for_subcats";b:0;s:17:"apply_for_subcats";b:0;}', 1429885611, 1441134640),
(74, 64, 2, 'Финансы', '', '', 'finansy', '', '', '', 'b:0;', '', '', '', 15, 'publish_date', 'desc', 0, 11, 11, 'a:2:{s:26:"category_apply_for_subcats";b:0;s:17:"apply_for_subcats";b:0;}', 1436384618, 1441134647),
(69, 64, 3, 'Экономика', '', '', 'ekonomika', '', '', '', 'b:0;', '', '', '', 15, 'publish_date', 'desc', 1, 11, -1, 'a:2:{s:26:"category_apply_for_subcats";b:0;s:17:"apply_for_subcats";b:0;}', 1429885646, 1441134655);

-- --------------------------------------------------------

--
-- Структура таблицы `category_translate`
--

DROP TABLE IF EXISTS `category_translate`;
CREATE TABLE IF NOT EXISTS `category_translate` (
  `id` int(11) NOT NULL,
  `alias` int(11) NOT NULL,
  `name` varchar(160) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `short_desc` text,
  `image` varchar(250) DEFAULT NULL,
  `keywords` text,
  `description` text,
  `lang` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category_translate`
--

INSERT INTO `category_translate` (`id`, `alias`, `name`, `title`, `short_desc`, `image`, `keywords`, `description`, `lang`) VALUES
(6, 64, 'Блог', '', '', '', '', '', 5),
(7, 66, 'Клієнти про нас', '', '', '', '', '', 5),
(10, 67, 'Бізнес', '', '', '', '', '', 5),
(11, 74, 'Фінанси', '', '', '', '', '', 5),
(12, 69, 'Економіка', '', '', '', '', '', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL,
  `module` varchar(25) NOT NULL DEFAULT 'core',
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_mail` varchar(50) NOT NULL,
  `user_site` varchar(250) NOT NULL,
  `item_id` bigint(11) NOT NULL,
  `text` text,
  `date` int(11) NOT NULL,
  `status` smallint(1) NOT NULL,
  `agent` varchar(250) NOT NULL,
  `user_ip` varchar(64) NOT NULL,
  `rate` int(11) NOT NULL,
  `text_plus` varchar(500) DEFAULT NULL,
  `text_minus` varchar(500) DEFAULT NULL,
  `like` int(11) NOT NULL,
  `disslike` int(11) NOT NULL,
  `parent` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `components`
--

DROP TABLE IF EXISTS `components`;
CREATE TABLE IF NOT EXISTS `components` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `identif` varchar(25) NOT NULL,
  `enabled` int(1) NOT NULL,
  `autoload` int(1) NOT NULL,
  `in_menu` int(1) NOT NULL DEFAULT '0',
  `settings` text,
  `position` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=396 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `components`
--

INSERT INTO `components` (`id`, `name`, `identif`, `enabled`, `autoload`, `in_menu`, `settings`, `position`) VALUES
(338, 'user_manager', 'user_manager', 0, 0, 0, NULL, 22),
(339, 'auth', 'auth', 1, 0, 0, NULL, 31),
(340, 'comments', 'comments', 1, 1, 1, 'a:6:{s:18:"max_comment_length";i:0;s:6:"period";i:0;s:11:"can_comment";i:0;s:11:"use_captcha";b:1;s:14:"use_moderation";b:1;s:8:"order_by";s:9:"date.desc";}', 12),
(341, 'navigation', 'navigation', 0, 0, 0, NULL, 32),
(342, 'tags', 'tags', 1, 1, 0, NULL, 30),
(343, 'gallery', 'gallery', 1, 0, 0, 'a:26:{s:14:"max_image_size";s:1:"5";s:9:"max_width";s:1:"0";s:10:"max_height";s:1:"0";s:7:"quality";s:2:"95";s:14:"maintain_ratio";b:1;s:19:"maintain_ratio_prev";b:1;s:19:"maintain_ratio_icon";b:1;s:4:"crop";b:0;s:9:"crop_prev";b:0;s:9:"crop_icon";b:0;s:14:"prev_img_width";s:3:"500";s:15:"prev_img_height";s:3:"500";s:11:"thumb_width";s:3:"100";s:12:"thumb_height";s:3:"100";s:14:"watermark_text";s:0:"";s:16:"wm_vrt_alignment";s:6:"bottom";s:16:"wm_hor_alignment";s:4:"left";s:19:"watermark_font_size";s:2:"14";s:15:"watermark_color";s:6:"ffffff";s:17:"watermark_padding";s:2:"-5";s:19:"watermark_font_path";s:25:"./uploads/defaultFont.ttf";s:15:"watermark_image";s:0:"";s:23:"watermark_image_opacity";s:2:"50";s:14:"watermark_type";s:4:"text";s:8:"order_by";s:4:"date";s:10:"sort_order";s:4:"desc";}', 16),
(344, 'rss', 'rss', 1, 0, 0, 'a:5:{s:5:"title";s:9:"Image CMS";s:11:"description";s:18:"Module RSS testing";s:10:"categories";b:0;s:9:"cache_ttl";i:60;s:11:"pages_count";i:10;}', 17),
(345, 'menu', 'menu', 0, 1, 1, NULL, 0),
(346, 'sitemap', 'sitemap', 1, 1, 0, 'a:6:{s:18:"main_page_priority";b:0;s:13:"cats_priority";b:0;s:14:"pages_priority";b:0;s:20:"main_page_changefreq";b:0;s:21:"categories_changefreq";b:0;s:16:"pages_changefreq";b:0;}', 18),
(347, 'search', 'search', 1, 0, 0, NULL, 25),
(348, 'feedback', 'feedback', 1, 0, 0, 'a:2:{s:5:"email";s:19:"admin@localhost.loc";s:15:"message_max_len";i:550;}', 28),
(349, 'template_editor', 'template_editor', 0, 0, 0, NULL, 20),
(350, 'group_mailer', 'group_mailer', 0, 0, 1, NULL, 13),
(351, 'filter', 'filter', 1, 1, 0, NULL, 33),
(352, 'cfcm', 'cfcm', 0, 0, 0, NULL, 19),
(353, 'shop', 'shop', 1, 0, 0, NULL, 17),
(354, 'sample_mail', 'sample_mail', 0, 0, 0, NULL, 23),
(355, 'mailer', 'mailer', 1, 0, 0, NULL, 24),
(356, 'share', 'share', 1, 0, 1, 'a:6:{s:5:"vkcom";s:1:"1";s:8:"facebook";s:1:"1";s:7:"twitter";s:1:"1";s:2:"gg";s:1:"1";s:4:"type";s:7:"counter";s:8:"vk_apiid";s:0:"";}', 11),
(357, 'banners', 'banners', 1, 0, 0, 'a:1:{s:8:"show_tpl";i:1;}', 1),
(358, 'new_level', 'new_level', 1, 1, 1, 'a:3:{s:15:"propertiesTypes";a:2:{i:0;s:6:"scroll";i:2;s:8:"dropDown";}s:7:"columns";a:4:{i:0;s:1:"1";i:1;s:1:"2";i:2;s:1:"3";i:3;s:1:"4";}s:5:"thema";s:18:"css/color_scheme_1";}', 9),
(359, 'shop_news', 'shop_news', 1, 1, 0, NULL, 27),
(360, 'categories_settings', 'categories_settings', 1, 1, 0, NULL, 7),
(361, 'wishlist', 'wishlist', 1, 1, 0, 'a:10:{s:11:"maxUserName";s:3:"256";s:11:"maxListName";s:3:"254";s:13:"maxListsCount";s:2:"10";s:13:"maxItemsCount";s:3:"100";s:16:"maxCommentLenght";s:3:"500";s:13:"maxDescLenght";s:4:"1000";s:15:"maxWLDescLenght";s:4:"1000";s:13:"maxImageWidth";s:3:"150";s:14:"maxImageHeight";s:3:"150";s:12:"maxImageSize";s:7:"2000000";}" }', 3),
(362, 'exchange', 'exchange', 1, 0, 1, 'a:13:{s:3:"zip";s:2:"no";s:8:"filesize";s:7:"2048000";s:7:"validIP";s:9:"127.0.0.1";s:5:"login";s:10:"ad@min.com";s:8:"password";s:5:"admin";s:11:"usepassword";s:2:"on";s:12:"userstatuses";N;s:10:"autoresize";N;s:5:"debug";N;s:5:"email";s:0:"";s:5:"brand";s:0:"";s:18:"userstatuses_after";s:1:"1";s:6:"backup";s:1:"1";}', 6),
(363, 'cmsemail', 'cmsemail', 1, 0, 1, 'a:3:{s:2:"ru";a:13:{s:4:"from";s:41:"Интернет-магазин ImageShop";s:10:"from_email";s:18:"noreplay@client.ru";s:11:"admin_email";s:14:"info@client.ru";s:5:"theme";s:41:"Интернет-магазин ImageShop";s:12:"wraper_activ";s:2:"on";s:6:"wraper";s:304:"<h2>Интернет-магазин "ImageShop"</h2>\n<div>$content</div>\n<hr />\n<p>С уважением, Интернет-магазин "ImageShop"</p>\n<p><small>Данное письмо создано автоматически, пожалуйста не отвечайте на него.</small></p>";s:8:"mailpath";s:0:"";s:8:"protocol";s:4:"mail";s:9:"smtp_host";s:0:"";s:9:"smtp_user";s:10:"ad@min.com";s:9:"smtp_pass";s:5:"admin";s:4:"port";s:0:"";s:10:"encryption";s:0:"";}s:2:"en";a:13:{s:4:"from";s:22:"Online store ImageShop";s:10:"from_email";s:19:"noreplay@client.com";s:11:"admin_email";s:15:"info@client.com";s:5:"theme";s:22:"Online store ImageShop";s:12:"wraper_activ";s:2:"on";s:6:"wraper";s:159:"<h2>Online store "ImageShop"</h2>\n<div>$content</div>\n<hr />\n<p>Sincerely, online store "ImageShop"</p>\n<p>This is an automated email, please do not reply.</p>";s:8:"mailpath";s:0:"";s:8:"protocol";s:4:"mail";s:9:"smtp_host";s:0:"";s:9:"smtp_user";s:10:"ad@min.com";s:9:"smtp_pass";s:5:"admin";s:4:"port";s:0:"";s:10:"encryption";s:0:"";}s:2:"ua";a:13:{s:4:"from";s:41:"Інтернет-магазин ImageShop";s:10:"from_email";s:22:"noreplay@client.com.ua";s:11:"admin_email";s:18:"info@client.com.ua";s:5:"theme";s:41:"Інтернет-магазин ImageShop";s:12:"wraper_activ";s:2:"on";s:6:"wraper";s:284:"<h2>Інтернет-магазин "ImageShop"</h2>\n<div>$content</div>\n<hr />\n<p>З повагою, Інтернет-магазин "ImageShop"</p>\n<p>Даний лист створено автоматично, будь ласка не відповідайте на нього.</p>";s:8:"mailpath";s:0:"";s:8:"protocol";s:4:"mail";s:9:"smtp_host";s:0:"";s:9:"smtp_user";s:10:"ad@min.com";s:9:"smtp_pass";s:5:"admin";s:4:"port";s:0:"";s:10:"encryption";s:0:"";}}', 4),
(364, 'mod_stats', 'mod_stats', 1, 1, 0, NULL, 4),
(365, 'mod_seo', 'mod_seo', 0, 1, 1, NULL, 5),
(366, 'mod_discount', 'mod_discount', 1, 1, 1, NULL, 2),
(393, 'smart_filter', 'smart_filter', 0, 1, 0, NULL, NULL),
(368, 'mobile', 'mobile', 1, 1, 0, 'a:5:{s:15:"MobileVersionON";s:1:"1";s:17:"MobileVersionSite";s:21:"demoshop.imagecms.net";s:20:"MobileVersionAddress";s:23:"m.demoshop.imagecms.net";s:18:"mobileTemplatePath";s:37:"./templates/commerce_mobiles/shop";s:6:"action";s:0:"";}', 10),
(369, 'trash', 'trash', 0, 1, 1, NULL, 8),
(370, 'language_switch', 'language_switch', 0, 0, 0, NULL, 26),
(371, 'star_rating', 'star_rating', 1, 0, 0, 'null', 15),
(372, 'translator', 'translator', 1, 1, 1, 'a:2:{s:11:"originsLang";s:2:"ru";s:12:"YandexApiKey";s:84:"trnsl.1.1.20160216T170823Z.6e57e5bb6bef47ad.06d1c056c65f2f1e08cc7d520ae1c21543b06a8d";}', 14),
(373, 'imagebox', 'imagebox', 0, 1, 0, NULL, 21),
(374, 'sample_module', 'sample_module', 1, 1, 0, NULL, 7),
(375, 'template_manager', 'template_manager', 1, 1, 1, NULL, NULL),
(376, 'payment_method_2checkout', 'payment_method_2checkout', 1, 0, 0, NULL, NULL),
(377, 'payment_method_oschadbank', 'payment_method_oschadbank', 1, 0, 0, NULL, NULL),
(378, 'payment_method_robokassa', 'payment_method_robokassa', 1, 0, 0, NULL, NULL),
(379, 'payment_method_webmoney', 'payment_method_webmoney', 1, 0, 0, NULL, NULL),
(380, 'payment_method_paypal', 'payment_method_paypal', 1, 0, 0, NULL, NULL),
(381, 'payment_method_liqpay', 'payment_method_liqpay', 1, 0, 0, NULL, NULL),
(382, 'payment_method_privat24', 'payment_method_privat24', 1, 0, 0, NULL, NULL),
(383, 'payment_method_sberbank', 'payment_method_sberbank', 1, 0, 0, NULL, NULL),
(384, 'payment_method_interkassa', 'payment_method_interkassa', 1, 0, 0, NULL, NULL),
(385, 'payment_method_yakassa', 'payment_method_yakassa', 1, 0, 0, NULL, NULL),
(386, 'import_export', 'import_export', 0, 0, 0, NULL, NULL),
(387, 'admin_menu', 'admin_menu', 1, 1, 0, NULL, NULL),
(388, 'related_products', 'related_products', 1, 1, 0, NULL, NULL),
(389, 'ymarket', 'ymarket', 1, 0, 0, NULL, NULL),
(390, 'ga_dashboard', 'ga_dashboard', 1, 1, 0, NULL, NULL),
(391, 'seo_snippets', 'seo_snippets', 1, 1, 0, NULL, NULL),
(392, 'xbanners', 'xbanners', 1, 1, 1, NULL, NULL),
(394, 'callbacks', 'callbacks', 1, 0, 0, NULL, NULL),
(395, 'git_templates', 'git_templates', 0, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `content`
--

DROP TABLE IF EXISTS `content`;
CREATE TABLE IF NOT EXISTS `content` (
  `id` bigint(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `meta_title` varchar(300) DEFAULT NULL,
  `url` varchar(500) NOT NULL,
  `cat_url` varchar(260) DEFAULT NULL,
  `keywords` text,
  `description` text,
  `prev_text` text,
  `full_text` longtext NOT NULL,
  `category` int(11) NOT NULL,
  `full_tpl` varchar(50) DEFAULT NULL,
  `main_tpl` varchar(50) NOT NULL,
  `position` smallint(5) NOT NULL,
  `comments_status` smallint(1) NOT NULL,
  `comments_count` int(9) DEFAULT '0',
  `post_status` varchar(15) NOT NULL,
  `author` varchar(50) NOT NULL,
  `publish_date` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  `updated` int(11) NOT NULL,
  `showed` int(11) NOT NULL,
  `lang` int(11) NOT NULL DEFAULT '0',
  `lang_alias` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `content`
--

INSERT INTO `content` (`id`, `title`, `meta_title`, `url`, `cat_url`, `keywords`, `description`, `prev_text`, `full_text`, `category`, `full_tpl`, `main_tpl`, `position`, `comments_status`, `comments_count`, `post_status`, `author`, `publish_date`, `created`, `updated`, `showed`, `lang`, `lang_alias`) VALUES
(87, 'Контакты', '', 'kontakty', '', 'контакты', 'Контакты', '<h3>Телефон горячей линии</h3>\n<p>8&nbsp;(800) 123-45-67</p>\n<h3><span>Телефоны нашего офиса</span></h3>\n<p><span>(044) 123-45-67</span></p>\n<p><span>(044) 123-45-67</span></p>\n<h3>Пишите нам на e-mail</h3>\n<p><span></span></p>\n<p>info@businessimage.com</p>\n<h3><span>Адрес нашего офиса</span></h3>\n<p>Минск, ул. Красочная 22а</p>', '', 0, 'contacts', '', 6, 0, 0, 'publish', 'admin', 1428165320, 1428165320, 1456244126, 135, 3, 0),
(89, 'Объективность как одна из самых важных составляющих', '', 'obektivnost-kak-odna-iz-samyh-vazhnyh-sostavliaiushchih', 'blog/biznes/', 'марта, года, архиве, электронных, препринтов, появилась, статья, хартмана, hartman, коллегами, посвященная, открытию, четырех, транзитных, планет, три, них, являются, горячими, юпитерами, одна, ndash, горячим, сатурном, hat, gsc, слегка, проэволюционировавшая, звезда, спектрального', '16 марта 2015 года в Архиве электронных препринтов появилась статья Дж. Хартмана (J. D. Hartman) с коллегами, посвященная открытию еще четырех транзитных планет. Три из них являются горячими юпитерами, еще одна  горячим сатурном. HAT-P-50 (GSC 0787-00340)', '<p><span>Эффективность принимаемых решений можно оценить только спустя какое-то время, и нередко нельзя точно определить, что явилось причиной улучшений или, наоборот,&nbsp;негативных изменений.</span></p>', '<p><img src="/uploads/images/articles/chair-designer-desk-4927.jpg" alt="" width="900" height="460" /></p>\n<p>Обычно под ненужной работой подразумевается &laquo;мы это могли сделать сами&raquo;. Ненужность также заключается в том, и это особенность самого консалтинга, что результаты работы консультантов зачастую сразу невидны. Эффективность принимаемых решений можно оценить только спустя какое-то время, и нередко нельзя точно определить, что явилось причиной улучшений. Руководству предприятия часто кажется, что это оно само смогло скорректировать и улучшить ситуацию, а консультанты здесь ни причем. В общем, это вопрос больше исторический, чем риторический.</p>\n<p>Не так&nbsp;далеки те времена, когда бизнес в нашей стране заключался в приобретении и наращивании активов и их последующей перепродаже. Некоторыми предприятиями услуги консалтинга по большому счету использовались как инструмент &laquo;отмывания&raquo; денег. Вот, типа, пришли консультанты, нарисовали бизнес-процессы за кругленькую сумму и ушли. Никому эти бизнес-процессы не нужны, они так и остались на бумаге, деньги &laquo;распилены&raquo; &ndash; все счастливы.</p>\n<p>С другой стороны (и это продолжается до сих пор) многие предприятия приглашают консультантов с целью &laquo;это модно&raquo; или для возможности помахать флагом (особенно, когда приглашают какую-нибудь западную и широкоизвестную компанию) - &laquo;у нас поработали консультанты, нарисовали процессы, а значит мы на мировом уровне&raquo;. В итоге получается забавная картина, когда говорят о бизнес-процессах, многие руководители представляет себе толстенную (и надо сказать дорогую) пачку бумаги с нарисованными квадратиками и стрелочками. Но ведь бизнес-процессы это не квадратики на бумаге, это реально работающие процессы на предприятии. Дальше нечестность порождает еще большую нечестность, у консультантов в голове крутятся доллары, бессмысленность и ненужность работы, и в итоге пошел процесс &laquo;нужно побольше придумать себе работы и побольше взять денег&raquo;. В итоге, получается, что мощный инструмент бизнес-консалтинга используется абсолютно не по назначению.</p>\n<p></p>', 67, '', '', 5, 1, 0, 'publish', 'admin', 1429529033, 1429529033, 1457801682, 338, 3, 0),
(90, 'Не откладывайте запуск лучших бизнес-идей', '', 'ne-otkladyvaite-zapusk-luchshih-biznes-idei', 'blog/biznes/', 'изучение, планетных, систем, звезд, различной, массы, находящихся, разных, стадиях, эволюции, позволяет, глубже, понимать, весь, комплекс, процессов, планетообразования, важной, частью, подобных, исследований, является, поиск, планет, промежуточной, массой, солнечных, будучи, главной, последовательности', 'Изучение планетных систем у звезд различной массы и находящихся на разных стадиях эволюции позволяет глубже понимать весь комплекс процессов планетообразования. Важной частью подобных исследований является поиск и изучение планет у звезд промежуточной мас', '<p>В прошлом году предприниматель и специалист по маркетингу Ной Каган бросил вызов самому себе, запустив бизнес и заработав первые $1000 в течение 24 часов. Тем самым он хотел доказать тот факт, что нет ни единой причины не начать свое предприятие именно сегодня.</p>', '<p><img src="/uploads/images/articles/chair-designer-desk-4929.jpg" alt="" width="900" height="460" /></p>\n<p>В прошлом году предприниматель и специалист по маркетингу Ной Каган бросил вызов самому себе, запустив бизнес и заработав первые $1000 в течение 24 часов. Тем самым он хотел доказать тот факт, что нет ни единой причины не начать свое предприятие именно сегодня. Используя только домен, наскоро созданную landing page и привлеченное к проекту внимание, Каган удивил скептиков и основал прибыльный стартап еще до того, как создал свой первый продукт.</p>\n<p>Лучшие бизнес идеи имеют свойство видоизменяться вместе с бизнес-ландшафтом, об этом стоит помнить. Чтобы быть успешным, не всегда следует оставаться упрямым. Потребуется мобилизация всех запасов смелости для отказа от первичного плана в пользу роста.</p>\n<p>Многие решения предпринимателей могут казаться со стороны безрассудными. Например, оффлайн-ритейлер Amerisleep в один момент полностью отказался от реальных магазинов, сделав ставку на электронную коммерцию. Руководство решило, что лучшие бизнес идеи могут быть воплощены в жизнь в контексте интернета. Потребители и конкуренты видели в этом необоснованный риск и отступление с занятых позиций. Жертвуя каналом сбыта, компания в то же время сбросила оковы территориальных ограничений, а также замедляющие рост арендные выплаты. Помните, стабильность и выгода в краткосрочной перспективе &mdash; главные враги развития и масштабирования бизнеса.</p>', 67, '', '', 4, 1, 2, 'publish', 'admin', 1423830381, 1423830381, 1457801643, 36, 3, 0),
(92, 'Андрей Павличенко', '', 'andrei-pavlichenko', 'klienty-o-nas/', 'компания, показала, себя, надежного, партнера, вовремя, были, сделаны, запланированные, работы, организованы, рекламные, кампании, чувствуется, профессионализм', 'Компания показала себя как надежного партнера, вовремя были сделаны все запланированные работы и организованы рекламные кампании, чувствуется профессионализм', 'Компания показала себя как надежного партнера, вовремя были сделаны все запланированные работы и организованы рекламные кампании, чувствуется профессионализм', '', 66, '', '', 3, 0, 0, 'publish', 'admin', 1429362249, 1429362249, 1457801723, 0, 3, 0),
(93, 'Артур Рудковский', '', 'artur-rudkovskii', 'klienty-o-nas/', 'выражаю, благодарность, компании, реализацию, проекта, повышению, эффективности, бизнес, процессов, нашей, проектированию, новой, организационной, структуры', 'Выражаю благодарность компании за реализацию проекта по повышению эффективности бизнес-процессов в нашей компании и проектированию новой организационной структуры.', '<p>Выражаю благодарность компании за реализацию проекта по повышению эффективности бизнес-процессов в нашей компании и проектированию новой организационной структуры.</p>', '', 66, '', '', 2, 0, 0, 'publish', 'admin', 1429362954, 1429362954, 1457801714, 5, 3, 0),
(129, 'Контакти', '', 'kontakty', '', '', '', '<h3>Телефон гарячої лінії</h3>\n<p>8&nbsp;(800) 269-12-42</p>\n<h3><span>Телефони нашого&nbsp;офісу</span></h3>\n<p><span>(044) 269-12-42</span></p>\n<p><span>(044) 269-12-43</span></p>\n<h3>Пишіть нам на e-mail</h3>\n<p>info@businessimage.com<br /><span></span></p>\n<h3><span>Адреса нашого офісу</span></h3>\n<p>Мінськ, вул. Барвиста 22а</p>', '', 0, '', '', 0, 0, 0, 'publish', 'Administrator', 1428165320, 1428165320, 1436777787, 4, 5, 87),
(136, 'Не відкладайте запуск кращих бізнес-ідей', '', 'ne-otkladyvaite-zapusk-luchshih-biznes-idei', 'blog/biznes/', '', '', '<p>Торік підприємець і фахівець з маркетингу Ной Каган кинув виклик самому собі, запустивши бізнес і заробивши перші $ 1000 протягом 24 годин. Тим самим він хотів довести той факт, що немає жодної причини не почати своє підприємство саме сьогодні.</p>', '<p><img src="/uploads/images/articles/chair-designer-desk-4929.jpg" alt="" width="900" height="460" /></p>\n<p>Торік підприємець і фахівець з маркетингу Ной Каган кинув виклик самому собі, запустивши бізнес і заробивши перші $ 1000 протягом 24 годин. Тим самим він хотів довести той факт, що немає жодної причини не почати своє підприємство саме сьогодні. Використовуючи тільки домен, нашвидку створену landing page і притягнуте до проекту увагу, Каган здивував скептиків і заснував прибутковий стартап ще до того, як створив свій перший продукт.</p>\n<p>Кращі бізнес ідеї мають властивість видозмінюватися разом з бізнес-ландшафтом, про це варто пам''ятати. Щоб бути успішним, не завжди слід залишатися впертим. Буде потрібно мобілізація всіх запасів сміливості для відмови від первинного плану на користь зростання.</p>\n<p>Багато рішень підприємців можуть здаватися з боку безрозсудними. Наприклад, оффлайн-рітейлер Amerisleep в один момент повністю відмовився від реальних магазинів, зробивши ставку на електронну комерцію. Керівництво вирішило, що кращі бізнес ідеї можуть бути втілені в життя в контексті інтернету. Споживачі і конкуренти бачили в цьому необгрунтований ризик і відступ із зайнятих позицій. Жертвуючи каналом збуту, компанія в той же час скинула окови територіальних обмежень, а також сповільнюють ріст орендні виплати. Пам''ятайте, стабільність і вигода в короткостроковій перспективі - головні вороги розвитку і масштабування бізнесу.</p>', 67, '', '', 0, 0, 0, 'publish', 'Administrator', 1423830381, 1423830381, 1436776826, 0, 5, 90),
(133, 'Артур Рудковський', '', 'artur-rudkovskii', 'klienty-o-nas/', '', '', '<p>Висловлюю подяку компанії за реалізацію проекту з підвищення ефективності бізнес-процесів в нашій компанії і проектування нової організаційної структури.</p>', '', 66, '', '', 0, 0, 0, 'publish', 'Administrator', 1429362954, 1429362954, 1436777676, 1, 5, 93),
(134, 'Андрій Павличенко', '', 'andrei-pavlichenko', 'klienty-o-nas/', '', '', '<p>Компанія показала себе як надійного партнера, вчасно були зроблені всі заплановані роботи і організовані рекламні кампанії, відчувається професіоналізм</p>', '', 66, '', '', 0, 0, 0, 'publish', 'Administrator', 1429362249, 1429362249, 1436386848, 1, 5, 92),
(135, '', NULL, 'andrei-pavlichenko', 'klienty-o-nas/', NULL, NULL, NULL, '', 66, '', '', 0, 0, 0, 'publish', 'Administrator', 1429362249, 1429362249, 0, 0, 33, 92),
(121, 'Оптимизация налогов и управление налоговыми рисками', '', 'optimizatsiia-nalogov-i-upravlenie-nalogovymi-riskami', 'blog/finansy/', 'марта, архиве, электронных, препринтов, появилась, статья, посвященная, итогам, мониторинга, наблюдательной, площадки, кампания, который, проводился, мая, августа, года, обнаружено, транзитных, кандидатов, звезды, прошли, процедуру, валидации, статистического, подтверждения, причем, ndash, впервые, достоверность', '26 марта в Архиве электронных препринтов появилась статья, посвященная итогам мониторинга 1-й наблюдательной площадки (Кампания 1), который проводился с 30 мая по 21 августа 2014 года. Обнаружено 36 транзитных кандидатов у 31 звезды. 18 кандидатов прошли', '<p>Реалии нашего бизнеса таковы, что стремление к снижению налоговой нагрузки присуще практически каждому предприятию, независимо от рода и географии его деятельности. Но почему при этом не использовать легальные способы оптимизации налогообложения?&nbsp;</p>', '<p><img src="/uploads/images/articles/woman-typing-writing-windows-4.jpg" alt="" width="900" height="460" /></p>\n<p>Как правило, общение с контролирующими органами не всегда является удовольствием для бухгалтеров или руководителей компаний. Почему так? Потому, что представитель налоговой инспекции приходит для того, чтобы найти ошибки в ведении бухгалтерского или налогового учета, а причина возникновения ошибки &ndash; случайно или специально &ndash; для налоговиков не имеет значения.</p>\n<p>Реалии нашего бизнеса таковы, что стремление к снижению налоговой нагрузки присуще практически каждому предприятию, независимо от рода и географии его деятельности. Но почему при этом не использовать легальные способы оптимизации налогообложения? Налоговая оптимизация &ndash; это легитимное, эффективное налоговое планирование начислений и уплат в бюджет. Использование легальной оптимизации налогов позволит избежать множества проблем и негативных последствий.</p>\n<p>Для того, чтобы правильно использовать методы минимизации налогов, следует ориентироваться на такие пункты налогового планирования, которые позволят составить индивидуальные схемы оптимизации налогообложения. На российском рынке можно встретить много различных предложений об оказании налоговых услуг. Но большинство из них помогают устранить только часть проблем, связанных с налогами. Поэтому необходимо обращаться к экспертам, которые комплексно подойдут к решению данной задачи.</p>', 74, '', '', 1, 1, 3, 'publish', 'admin', 1427887795, 1427887795, 1457801655, 121, 3, 0),
(124, 'О компании', '', 'o-kompanii', '', 'heading, lorem, ipsum, dolor, sit, amet, consectetuer, adipiscing, elit, aenean, commodo, ligula, eget, massa, cum, sociis, natoque, penatibus, text, level, semantics, this, should, hidden, all, bsysrowsers, apart, from, the, element', 'Heading 1 Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et m. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa', '<p>Компания&nbsp;<span>Business </span><span>Image&nbsp;</span>является передовым экспертом в области повышения эффективности ведения бизнеса и управления проектами. Мы разрабатываем и внедряем маркетинговые кейсы, предоставляя уникальное качество услуг бизнес консалтинга. Мы&nbsp;обладаем&nbsp;навыками системного мышления и многолетним опытом в реализации маркетинговых проектов.&nbsp;</p>\n<p>Нашей специализацией являются&nbsp;информационные технологии в связке с уникальными маркетинговыми инструментами. Мы полностью включаемся в проект и берем на себя его комплексное сопровождение, а не просто раздаем умные советы.&nbsp;</p>', '<p>Разработка стратегий и внедрение проектов по развитию бизнеса, повышению эффективности и автоматизации процессов&nbsp;&mdash; наш профиль.&nbsp;Превращаем свой опыт и знания в вашу прибыль&nbsp;и&nbsp;будем для вас надежным партнером в сфере услуг бизнес-консалтинга!</p>\n<h2>Специализация</h2>\n<p>Информационные технологии в связке с уникальными маркетинговыми инструментами являются нашим главным вектором. Наша отличительная черта &mdash; реализация проектов на основе методов процессного консалтинга, т.е. мы полностью включаемся в проект и берем на себя его комплексное сопровождение, а не просто раздаем умные советы. Мы действуем исключительно в рамках интереса клиента, используя только рабочие и эффективные решения.</p>\n<p>Компания Business Image&nbsp;является передовым экспертом в области повышения эффективности ведения бизнеса и управления проектами. Мы разрабатываем и внедряем передовые маркетинговые и ИТ кейсы, предоставляя уникальное качество услуг бизнес консалтинга. Мы &mdash; команда профессионалов, обладающая навыками системного мышления и многолетним опытом в реализации информационно-технических и маркетинговых проектов. Основная цель, которую мы преследуем &mdash; развитие бизнеса и достижение новых высот наших клиентов, путем разработки и внедрения сложных маркетинговых стратегий и передовых систем автоматизации.&nbsp;</p>\n<h2>Наши&nbsp;возможности</h2>\n<p>Если вы еще размышляете, прибегать к услугам нашей компании, обратиться к конкурентам, или же выполнять задачи собственными силами, мы можем продемонстрировать вам&nbsp;краткий перечень аргументов, которые позволят вам сделать правильный выбор.</p>\n<h4>Эффективные решения</h4>\n<p>Безусловно, наши решения отличаются свежестью и современностью, но в первую очередь они являются эффективными и приносящими реально ощутимую выгоду. Проверенные многолетним опытом и критическими ситуациями,&nbsp;наши решения помогут найти выход в любом положении и, кроме того, обеспечит устойчивое положение вашей компании в будущем.</p>\n<h4>Специалисты</h4>\n<p>Наши специалисты обладают особыми знаниями и навыками, которые практически невозможно получить выполняя задачи в рамках одной компании.&nbsp;Для реализации поставленной задачи вам требуется либо отвлечь Вашего штатного специалиста от текущих задач, либо нанять нового. Мы же готовы тратить столько времени, сколько необходимо, ни больше, ни меньше.</p>\n<h4>Консультанты</h4>\n<p>Наши консультанты всегда являются независимыми объективными экспертами, дающими свежий взгляд со стороны и остающимися беспристрастными в любой ситуации.&nbsp;Консультанты нашей компании, конечно, смогут подержать вас и выслушать, но их решение будет основано только на профессионализме и опыте, поэтому будьте готовы к решениям, которые не совсем отвечают вашим ожиданиям.&nbsp;</p>', 0, '', '', 0, 0, 0, 'publish', 'admin', 1433755063, 1433755063, 1439286289, 434, 3, 0),
(126, 'Про компанію', '', 'o-kompanii', '', '', '', '<p>Компанія Business Image є передовим експертом в галузі підвищення ефективності ведення бізнесу та управління проектами. Ми розробляємо і впроваджуємо маркетингові кейси, надаючи унікальну якість послуг бізнес консалтингу. Ми володіємо навичками системного мислення і багаторічним досвідом в реалізації маркетингових проектів.</p>\n<p>Нашою спеціалізацією є інформаційні технології в зв''язці з унікальними маркетинговими інструментами. Ми повністю включаємось в проект і беремо на себе його комплексний супровід, а не просто роздаємо розумні поради.</p>', '<p>Розробка стратегій та впровадження проектів з розвитку бізнесу, підвищенню ефективності та автоматизації процесів - наш профіль. Перетворюємо свій досвід і знання в вашу прибуток і будемо для вас надійним партнером у сфері послуг бізнес-консалтингу!</p>\n<h2>Спеціалізація</h2>\n<p>Інформаційні технології в зв''язці з унікальними маркетинговими інструментами є нашим головним вектором. Наша відмінна риса - реалізація проектів на основі методів процесного консалтингу, тобто ми повністю включаємось в проект і беремо на себе його комплексний супровід, а не просто роздаємо розумні поради. Ми діємо виключно в рамках інтересу клієнта, використовуючи тільки робітники і ефективні рішення.</p>\n<p>Компанія Business Image є передовим експертом в галузі підвищення ефективності ведення бізнесу та управління проектами. Ми розробляємо і впроваджуємо передові маркетингові та ІТ кейси, надаючи унікальну якість послуг бізнес консалтингу. Ми - команда професіоналів, що володіє навичками системного мислення і багаторічним досвідом в реалізації інформаційно-технічних і маркетингових проектів. Основна мета, яку ми переслідуємо - розвиток бізнесу і досягнення нових висот наших клієнтів, шляхом розробки та впровадження складних маркетингових стратегій і передових систем автоматизації.</p>\n<h2>Наші можливості</h2>\n<p>Якщо ви ще роздумуєте, вдаватися до послуг нашої компанії, звернутися до конкурентів, або ж виконувати завдання власними силами, ми можемо продемонструвати вам короткий перелік аргументів, які дозволять вам зробити правильний вибір.</p>\n<h4>Эфективні рішення</h4>\n<p>Безумовно, наші рішення відрізняються свіжістю і сучасністю, але в першу чергу вони є ефективними і приносять реально відчутну вигоду. Перевірені багаторічним досвідом і критичними ситуаціями, наші рішення допоможуть знайти вихід у будь-якому положенні і, крім того, забезпечить стійке положення вашої компанії в майбутньому.</p>\n<h4>Спеціалісти</h4>\n<p>Наші фахівці володіють особливими знаннями і навичками, які практично неможливо отримати виконуючи завдання в рамках однієї компанії. Для реалізації поставленого завдання вам потрібно або відвернути Вашої штатного фахівця від поточних завдань, або найняти нового. Ми ж готові витрачати стільки часу, скільки необхідно, ні більше, ні менше.</p>\n<h4>Консультанти</h4>\n<p>Наші консультанти завжди є незалежними об''єктивними експертами, що дають свіжий погляд з боку і залишаються неупередженими в будь-якій ситуації. Консультанти нашої компанії, звичайно, зможуть потримати вас і вислухати, але їхнє рішення буде засновано тільки на професіоналізм і досвід, тому будьте готові до рішень, які не зовсім відповідають вашим очікуванням.</p>', 0, '', '', 0, 0, 0, 'publish', 'Administrator', 1433755063, 1433755063, 1436779227, 13, 5, 124),
(137, 'Об''єктивність як одна з найважливіших складових', '', 'obektivnost-kak-odna-iz-samyh-vazhnyh-sostavliaiushchih', 'blog/biznes/', '', '', '<p>Ефективність прийнятих рішень можна оцінити тільки через якийсь час, і нерідко можна точно визначити, що стало причиною поліпшень або, навпаки, негативних змін.</p>', '<p><img src="/uploads/images/articles/chair-designer-desk-4927.jpg" alt="" width="900" height="460" /></p>\n<p>Зазвичай під непотрібною роботою мається на увазі &laquo;ми це могли зробити самі&raquo;. Непотрібність також полягає в тому, і це особливість самого консалтингу, що результати роботи консультантів найчастіше відразу невидно. Ефективність прийнятих рішень можна оцінити тільки через якийсь час, і нерідко можна точно визначити, що стало причиною поліпшень. Керівництву підприємства часто здається, що це воно саме змогло скорегувати й поліпшити ситуацію, а консультанти тут ні причому. Загалом, це питання більше історичний, ніж риторичне.</p>\n<p>Не так далекі ті часи, коли бізнес у нашій країні полягав у придбанні та нарощуванні активів та їх подальшої перепродажі. Деякими підприємствами послуги консалтингу за великим рахунком використовувалися як інструмент &laquo;відмивання&raquo; грошей. Ось, типу, прийшли консультанти, намалювали бізнес-процеси за кругленьку суму і пішли. Нікому ці бізнес-процеси не потрібні, вони так і залишилися на папері, гроші &laquo;розпиляні&raquo; - всі щасливі.</p>\n<p>З іншого боку (і це триває досі) багато підприємств запрошують консультантів з метою &laquo;це модно&raquo; або для можливості помахати прапором (особливо, коли запрошують якусь західну і широковідомих компанію) - &laquo;у нас попрацювали консультанти, намалювали процеси, а значить ми на світовому рівні &raquo;. У підсумку виходить кумедна картина, коли говорять про бізнес-процеси, багато керівників уявляє собі толстенную (і треба сказати дорогу) пачку паперу з намальованими квадратиками і стрілочками. Але ж бізнес-процеси це не квадратики на папері, це реально працюючі процеси на підприємстві. Далі нечесність породжує ще більшу нечесність, у консультантів в голові крутяться долари, безглуздість і непотрібність роботи, і в підсумку пішов процес &laquo;потрібно побільше придумати собі роботи і побільше взяти грошей&raquo;. У результаті, виходить, що потужний інструмент бізнес-консалтингу використовується абсолютно не за призначенням.</p>', 67, '', '', 0, 0, 0, 'publish', 'Administrator', 1429529033, 1429529033, 1436776981, 0, 5, 89),
(140, 'Оптимізація податків та управління податковими ризиками', '', 'optimizatsiia-nalogov-i-upravlenie-nalogovymi-riskami', 'blog/finansy/', '', '', '<p>Реалії нашого бізнесу такі, що прагнення до зниження податкового навантаження притаманне практично кожному підприємству, незалежно від роду та географії його діяльності. Але чому при цьому не використовувати легальні способи оптимізації оподаткування?</p>', '<p><img src="/uploads/images/articles/woman-typing-writing-windows-4.jpg" alt="" width="900" height="460" /></p>\n<p>Як правило, спілкування з контролюючими органами не завжди є задоволенням для бухгалтерів чи керівників компаній. Чому так? Тому, що представник податкової інспекції приходить для того, щоб знайти помилки у веденні бухгалтерського або податкового обліку, а причина виникнення помилки - випадково чи спеціально - для податківців не має значення.</p>\n<p>Реалії нашого бізнесу такі, що прагнення до зниження податкового навантаження притаманне практично кожному підприємству, незалежно від роду та географії його діяльності. Але чому при цьому не використовувати легальні способи оптимізації оподаткування? Податкова оптимізація - це легітимне, ефективне податкове планування нарахувань і сплат до бюджету. Використання легальної оптимізації податків дозволить уникнути безлічі проблем і негативних наслідків.</p>\n<p>Для того, щоб правильно використовувати методи мінімізації податків, слід орієнтуватися на такі пункти податкового планування, які дозволять скласти індивідуальні схеми оптимізації оподаткування. На російському ринку можна зустріти багато різних пропозицій про надання податкових послуг. Але більшість з них допомагають усунути тільки частина проблем, пов''язаних з податками. Тому необхідно звертатися до експертів, які комплексно підійдуть до вирішення даного завдання.</p>', 74, '', '', 0, 1, 0, 'publish', 'Administrator', 1427887795, 1427887795, 1436776332, 4, 5, 121),
(142, 'Доставка и оплата', '', 'dostavka-i-oplata', '', 'страница, стадии, разработки', 'Страница на стадии разработки', '<p>Страница на стадии разработки</p>', '', 0, '', '', 0, 0, 0, 'publish', 'admin', 1439286408, 1439286408, 0, 31, 3, 0),
(143, 'Универсальная страница', '', 'universalnaia-stranitsa', '', 'text, headings, heading, top, paragraphs, paragraph, from, the, greek, paragraphos, ldquo, write, beside, rdquo, written, self, contained, unit, discourse, writing, dealing, with, particular, point, idea, consists, one, more, sentences, though', 'Text   Headings   Heading 1 Heading 2 Heading 3 Heading 4 Heading 5 Heading 6   [Top]   Paragraphs   A paragraph (from the Greek paragraphos, to write beside or written beside) is a self-contained unit of a discourse in writing dealing with a particular', '<p>На этой странице выводятся все популярные элементы, которые используются на интернет-страницах. Вы можете посмотреть как они будут выглядеть, когда вы будете их использовать в своих статьях</p>\n<h1>Heading 1</h1>\n<h2>Heading 2</h2>\n<h3>Heading 3</h3>\n<h4>Heading 4</h4>\n<h5>Heading 5</h5>\n<h6>Heading 6</h6>\n<h1>Paragraph</h1>\n<p>A paragraph (from the Greek paragraphos, &ldquo;to write beside&rdquo; or &ldquo;written beside&rdquo;) is a self-contained unit of a discourse in writing dealing with a particular point or idea. A paragraph consists of one or more sentences. Though not required by the syntax of any language, paragraphs are usually an expected part of formal writing, used to organize longer prose.</p>\n<p>A paragraph consists of one or more sentences. Though not required by the syntax of any language, paragraphs are usually an expected part of formal writing, used to organize longer prose.</p>\n<h1>Blockquote</h1>\n<blockquote>\n<p>A block quotation (also known as a long quotation or extract) is a quotation in a written document, that is set off from the main text as a paragraph, or block of text. It is typically distinguished visually using indentation and a different typeface or smaller size quotation. It may or may not include a citation, usually placed at the bottom.</p>\n<cite>Said no one, ever.</cite></blockquote>\n<h1>Lists</h1>\n<h3>Definition list</h3>\n<dl>\n<dt>Definition List Title</dt>\n<dd>This is a definition list division.</dd>\n</dl>\n<h3>Ordered List</h3>\n<ol>\n<li>List Item</li>\n<li>List Item\n<ol>\n<li>Sublist</li>\n<li>Sublist</li>\n<li>Sublist\n<ol>\n<li>Sublist</li>\n<li>Sublist</li>\n<li>Sublist</li>\n</ol>\n</li>\n</ol>\n</li>\n<li>List Item</li>\n</ol>\n<h3>Unordered List</h3>\n<ul>\n<li>List Item</li>\n<li>List Item\n<ul>\n<li>Sublist</li>\n<li>Sublist</li>\n<li>Sublist\n<ul>\n<li>Sublist</li>\n<li>Sublist</li>\n<li>Sublist</li>\n</ul>\n</li>\n</ul>\n</li>\n<li>List Item</li>\n</ul>\n<h1>Tabular data</h1>\n<table><caption>Table Caption</caption>\n<thead>\n<tr>\n<th>Table Heading 1</th>\n<th>Table Heading 2</th>\n<th>Table Heading 3</th>\n<th>Table Heading 4</th>\n<th>Table Heading 5</th>\n</tr>\n</thead>\n<tfoot>\n<tr>\n<th>Table Footer 1</th>\n<th>Table Footer 2</th>\n<th>Table Footer 3</th>\n<th>Table Footer 4</th>\n<th>Table Footer 5</th>\n</tr>\n</tfoot>\n<tbody>\n<tr>\n<td>Table Cell 1</td>\n<td>Table Cell 2</td>\n<td>Table Cell 3</td>\n<td>Table Cell 4</td>\n<td>Table Cell 5</td>\n</tr>\n<tr>\n<td>Table Cell 1</td>\n<td>Table Cell 2</td>\n<td>Table Cell 3</td>\n<td>Table Cell 4</td>\n<td>Table Cell 5</td>\n</tr>\n<tr>\n<td>Table Cell 1</td>\n<td>Table Cell 2</td>\n<td>Table Cell 3</td>\n<td>Table Cell 4</td>\n<td>Table Cell 5</td>\n</tr>\n<tr>\n<td>Table Cell 1</td>\n<td>Table Cell 2</td>\n<td>Table Cell 3</td>\n<td>Table Cell 4</td>\n<td>Table Cell 5</td>\n</tr>\n</tbody>\n</table>\n<h1>Inline elements</h1>\n<p><a href="#!">This is a text link</a>.</p>\n<p><strong>Strong is used to indicate strong importance.</strong></p>\n<p><em>This text has added emphasis.</em></p>\n<p>The <b>b element</b> is stylistically different text from normal text, without any special importance.</p>\n<p>The <i>i element</i> is text that is offset from the normal text.</p>\n<p>The <u>u element</u> is text with an unarticulated, though explicitly rendered, non-textual annotation.</p>\n<p><del>This text is deleted</del> and <ins>This text is inserted</ins>.</p>\n<p><s>This text has a strikethrough</s>.</p>\n<p>Superscript<sup>&reg;</sup>.</p>\n<p>Subscript for things like H<sub>2</sub>O.</p>\n<p><small>This small text is small for for fine print, etc.</small></p>\n<p>Abbreviation: <abbr title="HyperText Markup Language">HTML</abbr></p>\n<p><q cite="https://developer.mozilla.org/en-US/docs/HTML/Element/q">This text is a short inline quotation.</q></p>\n<p><cite>This is a citation.</cite></p>\n<p>The <dfn>dfn element</dfn> indicates a definition.</p>\n<p>The <mark>mark element</mark> indicates a highlight.</p>\n<p>The <var>variable element</var>, such as <var>x</var> = <var>y</var>.</p>\n<p>The time element: <time datetime="2013-04-06T12:32+00:00">2 weeks ago</time></p>', '', 0, '', '', 0, 0, 0, 'publish', 'admin', 1441127594, 1441127594, 1441131399, 60, 3, 0),
(152, 'Консультирование по управлению компьютерной структурой', '', 'konsultirovanie-po-upravleniiu-kompiuternoi-strukturoi32', 'blog/ekonomika/', 'марта, архиве, электронных, препринтов, появилась, статья, посвященная, итогам, мониторинга, наблюдательной, площадки, кампания, который, проводился, мая, августа, года, обнаружено, транзитных, кандидатов, звезды, прошли, процедуру, валидации, статистического, подтверждения, причем, ndash, впервые, достоверность', '26 марта в Архиве электронных препринтов появилась статья, посвященная итогам мониторинга 1-й наблюдательной площадки (Кампания 1), который проводился с 30 мая по 21 августа 2014 года. Обнаружено 36 транзитных кандидатов у 31 звезды. 18 кандидатов прошли', '<p><span>Стремительный прогресс в области информационных технологий привел к тому, что они прочно вошли в нашу повседневную жизнь.&nbsp;</span><span>Сложно представить область человеческой деятельности, где бы информационные технологии не использовались в той или иной мере.&nbsp;</span></p>', '<p><img src="/uploads/images/articles/chair-designer-desk-4936.jpg" alt="" width="900" height="460" /></p>\n<p>Стремительный прогресс в области информационных технологий привел к тому, что они прочно вошли в нашу повседневную жизнь.&nbsp;Сложно представить область человеческой деятельности, где бы информационные технологии не использовались в той или иной мере.&nbsp;От того насколько квалифицированно решаются задачи в области ИТ напрямую зависит успешность и конкурентоспособность бизнеса.&nbsp;В наше время лавинообразного роста предложений на рынке ИТ услуг, появления большого колличества программных продуктов, технических решений от именитых так и не очень производителей зачастую приводит непосвященного в состояние полной неразберихи.&nbsp;Пытаясь принять решение, перед руководителем предприятия зачастую встают вопросы с чего начать,&nbsp;как делать&nbsp;и&nbsp;кому делать?<br /><br />Эти и многие другие вопросы возникают не только у начинающих руководителей малых и средних предприятий, но и у куда более опытных их коллег.&nbsp;Хорошо если рядом есть доверенный профессионал, который поможет советом и даст ответы на насущные вопросы квалифицированно и понятно.&nbsp;Наши консультанты готовы помочь вам. Имея многолетний практический опыт в предметных областях, предлагаем выверенные временем решения.<br /><br />Наша компания&nbsp;осуществляет консультирование предприятий по вопросам управления компьютерной структурой, автоматизации бизнес-процессов, выбора программных, аппаратных платформ и поставщиков оборудования.&nbsp;На основе многолетнего опыта работы предлагаем выверенные временем решения.</p>', 69, '', '', 0, 1, 0, 'publish', 'admin', 1427887795, 1427887795, 1441033799, 155, 3, 0),
(153, 'Консультування з управління комп''ютерної структурою', '', 'konsultirovanie-po-upravleniiu-kompiuternoi-strukturoi14412158371441215846', 'blog/ekonomika/', '', '', '<p>Стрімкий прогрес у галузі інформаційних технологій призвів до того, що вони міцно увійшли в наше повсякденне життя. Складно уявити галузь людської діяльності, де б інформаційні технології не використовувалися в тій чи іншій мірі.</p>', '<p><img src="/uploads/images/articles/chair-designer-desk-4936.jpg" alt="" width="900" height="460" /></p>\n<p>Стрімкий прогрес у галузі інформаційних технологій призвів до того, що вони міцно увійшли в наше повсякденне життя. Складно уявити галузь людської діяльності, де б інформаційні технології не використовувалися в тій чи іншій мірі. Від того наскільки кваліфіковано вирішуються завдання в галузі ІТ безпосередньо залежить успішність і конкурентоспроможність бізнесу. У наш час лавиноподібного зростання пропозицій на ринку ІТ послуг, появи безлічі програмних продуктів, технічних рішень від іменитих так і не дуже виробників часто призводить необізнаного в стан повної плутанини. Намагаючись прийняти рішення, перед керівником підприємства часто постають питання з чого почати, як робити і кому робити?</p>\n<p>Ці та багато інших питань виникають не тільки у початківців керівників малих і середніх підприємств, а й у куди більш досвідчених їхніх колег. Добре якщо поруч є довірений професіонал, який допоможе порадою і дасть відповіді на нагальні питання кваліфіковано і зрозуміло. Наші консультанти готові допомогти вам. Маючи багаторічний практичний досвід у предметних областях, пропонуємо вивірені часом рішення.</p>\n<p>Наша компанія здійснює консультування підприємств з питань управління комп''ютерною структурою, автоматизації бізнес-процесів, вибору програмних, апаратних платформ і постачальників устаткування. На основі багаторічного досвіду роботи пропонуємо вивірені часом рішення.</p>', 69, '', '', 0, 1, 0, 'publish', 'Administrator', 1427887795, 1427887795, 1436546533, 1, 5, 152),
(154, 'Главная вещь, которая стоит между вами и успехом', '', 'glavnaia-veshch-kotoraia-stoit-mezhdu-vami-i-uspehom32', 'blog/ekonomika/', 'марта, года, архиве, электронных, препринтов, появилась, статья, луиджи, манчини, luigi, mancini, коллегами, посвященная, открытию, двух, новых, экзопланет, hats, подавляющее, большинство, других, обнаруженных, наземными, транзитными, обзорами, обе, планеты, являются, горячими, юпитерами', '12 марта 2015 года в Архиве электронных препринтов появилась статья Луиджи Манчини (Luigi Mancini) с коллегами, посвященная открытию двух новых экзопланет HATS-13 b и HATS-14 b. Как и подавляющее большинство других экзопланет, обнаруженных наземными транз', '<p>Чтобы начать бизнес, нужно сделать очень много действительно важных вещей: исследовать рынок, найти целевую аудиторию, определить ее&nbsp;потребности, разработать удовлетворяющий их продукт, продумать маркетинг, посчитать бюджет.</p>', '<p><img src="/uploads/images/articles/chair-designer-desk-4928.jpg" alt="" width="900" height="460" /></p>\n<p>Мало кто был способен настолько метко формулировать великие мысли, как Генри Форд (Henry Ford), который подметил: &laquo;Верите вы, что сможете, либо верите, что не сможете &ndash; вы правы&raquo;. Kюди не пробуют! Многие талантливые и подающие надежды бизнесмены в самом начале своего пути не добиваются успеха, потому что не верят в свои силы и боятся рисковать. Предпосылки могут быть самые разные:&nbsp;Затянувшиеся размышления, после которых не остается сил &laquo;нажать на курок&raquo;, то есть начать действовать. Консервативные родственники, друзья или &laquo;советчики&raquo;, которые боятся сделать это сами и &laquo;предупреждают&raquo; других. Слишком долгая подготовка, которая не дает желаемого результата и дает преимущество тем, кто действует.</p>\n<p>Если у вас есть идея &mdash; реализуйте ее как можно скорее и с минимальными денежными вложениями. И наблюдайте за происходящим. Возможно, вы поймете, что на правильном пути. В большинстве случаев этот этап показывает, что нужно изменить и над чем поработать, чтобы развиваться в правильном направлении. Это естественно &mdash; и через это проходят все. И даже если у вас не получилось &mdash; в этом нет никакой катастрофы, ведь вы минимизировали свои затраты. Поэтому у вас еще должно остаться достаточно сил и средств на новые попытки.</p>\n<p>Главное препятствие к вашему успеху &mdash; страх. Чтобы добиться успеха в новом бизнесе, не бойтесь идти на риск. У баскетболистов и хоккеистов есть выражение: &laquo;Ты промахиваешься в 100% случаев, когда не пробуешь&raquo;. Думаем, оно лучше всего передает смысл нашего сегодняшнего материала. Действуйте!</p>', 69, '', '', 1, 1, 0, 'publish', 'admin', 1426335738, 1426335738, 1457801705, 30, 3, 0),
(155, 'Головна річ, яка стоїть між вами та успіхом', '', 'glavnaia-veshch-kotoraia-stoit-mezhdu-vami-i-uspehom32', 'blog/ekonomika/', '', '', '<p>Щоб розпочати бізнес, потрібно зробити дуже багато дійсно важливих речей: дослідити ринок, знайти цільову аудиторію, визначити її потреби, розробити зрозумілий для них&nbsp;продукт, продумати маркетинг, порахувати бюджет.</p>', '<p><img src="/uploads/images/articles/chair-designer-desk-4928.jpg" alt="" width="900" height="460" /></p>\n<p>Мало хто був здатний настільки влучно формулювати великі думки, як Генрі Форд (Henry Ford), який помітив: &laquo;Чи вірите ви, що зможете, або вірите, що не зможете - ви праві&raquo;. Люди не пробують! Багато талановитих і подають надії бізнесмени на самому початку свого шляху не домагаються успіху, бо не вірять у свої сили і бояться ризикувати. Передумови можуть бути самі різні: Тривалі роздуми, після яких не залишається сил &laquo;натиснути на курок&raquo;, тобто почати діяти. Консервативні родичі, друзі або &laquo;порадники&raquo;, які бояться зробити це самі і &laquo;попереджають&raquo; інших. Занадто довга підготовка, яка не дає бажаного результату і дає перевагу тим, хто діє.</p>\n<p>Якщо у вас є ідея - реалізуйте її якомога швидше і з мінімальними грошовими вкладеннями. І спостерігайте за подіями. Можливо, ви зрозумієте, що на правильному шляху. У більшості випадків цей етап показує, що потрібно змінити і над чим попрацювати, щоб розвиватися в правильному напрямку. Це природно - і через це проходять всі. І навіть якщо у вас не вийшло - в цьому немає ніякої катастрофи, адже ви мінімізували свої витрати. Тому у вас ще повинно залишитися достатньо сил і засобів на нові спроби.</p>\n<p>Головна перешкода до вашого успіху - страх. Щоб домогтися успіху в новому бізнесі, не бійтеся йти на ризик. У баскетболістів і хокеїстів є вираз: &laquo;Ти промахується в 100% випадках, коли не поробиш&raquo;. Думаємо, воно найкраще передає зміст нашого сьогоднішнього матеріалу. Дійте!</p>', 69, '', '', 0, 1, 0, 'publish', 'Administrator', 1426335738, 1426335738, 1436776661, 4, 5, 154),
(156, 'Быстрая доставка', '', 'bystraia-dostavka', 'preimushchestva/', 'кратчайшие, сроки, доставки', 'Кратчайшие сроки доставки', '<p>Кратчайшие сроки доставки</p>', '', 75, '', '', 0, 0, 0, 'publish', 'admin', 1441625862, 1441625862, 1457801572, 0, 3, 0),
(157, 'Гибкая система скидок', '', 'gibkaia-sistema-skidok', 'preimushchestva/', 'для, постоянных, покупателей', 'Для постоянных покупателей', '<p>Для постоянных покупателей</p>', '', 75, '', '', 0, 0, 0, 'publish', 'admin', 1441625987, 1441625987, 1457801561, 0, 3, 0),
(158, 'Полезная консультация', '', 'poleznaia-konsultatsiia', 'preimushchestva/', 'выбор, оптимальных, решений', 'Выбор оптимальных решений', '<p>Выбор оптимальных решений</p>', '', 75, '', '', 0, 0, 0, 'publish', 'admin', 1441626031, 1441626031, 1457801549, 0, 3, 0),
(159, 'Качественный сервис', '', 'kachestvennyi-servis', 'preimushchestva/', 'быстрая, обработка, заказа', 'Быстрая обработка заказа', '<p>Быстрая обработка заказа</p>', '', 75, '', '', 0, 0, 0, 'publish', 'admin', 1450788063, 1450788063, 1457801532, 2, 3, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `content_fields`
--

DROP TABLE IF EXISTS `content_fields`;
CREATE TABLE IF NOT EXISTS `content_fields` (
  `field_name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `weight` int(11) NOT NULL,
  `in_search` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `content_fields`
--

INSERT INTO `content_fields` (`field_name`, `type`, `label`, `data`, `weight`, `in_search`) VALUES
('field_url', 'text', 'URL-адрес', 'a:6:{s:5:"label";s:14:"URL-адрес";s:7:"initial";s:0:"";s:9:"help_text";s:0:"";s:4:"type";s:4:"text";s:10:"validation";s:0:"";s:6:"groups";a:1:{i:0;s:2:"12";}}', 2, 0),
('field_list_image', 'text', 'Изображение', 'a:7:{s:5:"label";s:22:"Изображение";s:7:"initial";s:0:"";s:9:"help_text";s:0:"";s:4:"type";s:4:"text";s:20:"enable_image_browser";i:1;s:10:"validation";s:0:"";s:6:"groups";a:3:{i:0;s:2:"-1";i:1;s:2:"11";i:2;s:2:"12";}}', 3, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `content_fields_data`
--

DROP TABLE IF EXISTS `content_fields_data`;
CREATE TABLE IF NOT EXISTS `content_fields_data` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_type` varchar(15) NOT NULL,
  `field_name` varchar(255) NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `content_fields_data`
--

INSERT INTO `content_fields_data` (`id`, `item_id`, `item_type`, `field_name`, `data`) VALUES
(22, 92, 'page', 'field_url', ''),
(24, 93, 'page', 'field_url', 'http://www.mysite.com'),
(65, 74, 'category', 'field_url', ''),
(36, 90, 'page', 'field_url', ''),
(70, 133, 'page', 'field_url', 'http://www.mysite.com'),
(128, 121, 'page', 'field_list_image', '/uploads/images/articles/woman-typing-writing-windows.jpg'),
(48, 121, 'page', 'field_url', ''),
(129, 89, 'page', 'field_list_image', '/uploads/images/articles/chair-designer-desk-3927.jpg'),
(53, 89, 'page', 'field_url', ''),
(72, 134, 'page', 'field_url', ''),
(132, 92, 'page', 'field_list_image', '/uploads/images/clients/client_tmp1.png'),
(131, 93, 'page', 'field_list_image', '/uploads/images/clients/client_tmp2.png'),
(75, 138, 'page', 'field_url', ''),
(78, 139, 'page', 'field_url', ''),
(80, 140, 'page', 'field_url', ''),
(82, 141, 'page', 'field_url', ''),
(84, 136, 'page', 'field_url', ''),
(86, 137, 'page', 'field_url', ''),
(98, 145, 'page', 'field_url', ''),
(102, 147, 'page', 'field_url', ''),
(106, 149, 'page', 'field_url', ''),
(110, 151, 'page', 'field_url', ''),
(112, 152, 'page', 'field_url', ''),
(114, 153, 'page', 'field_url', ''),
(130, 154, 'page', 'field_list_image', '/uploads/images/articles/chair-designer-desk-3928.jpg'),
(116, 154, 'page', 'field_url', ''),
(118, 155, 'page', 'field_url', ''),
(123, 90, 'page', 'field_list_image', '/uploads/images/articles/chair-designer-desk-3929.jpg'),
(124, 159, 'page', 'field_list_image', '/uploads/images/benefits/service.png'),
(125, 158, 'page', 'field_list_image', '/uploads/images/benefits/consulting.png'),
(126, 157, 'page', 'field_list_image', '/uploads/images/benefits/discount.png'),
(127, 156, 'page', 'field_list_image', '/uploads/images/benefits/delivery.png'),
(133, 64, 'category', 'field_list_image', '');

-- --------------------------------------------------------

--
-- Структура таблицы `content_fields_groups_relations`
--

DROP TABLE IF EXISTS `content_fields_groups_relations`;
CREATE TABLE IF NOT EXISTS `content_fields_groups_relations` (
  `field_name` varchar(64) NOT NULL,
  `group_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `content_fields_groups_relations`
--

INSERT INTO `content_fields_groups_relations` (`field_name`, `group_id`) VALUES
('field_doc', 9),
('field_url', 12),
('field_list_image', -1),
('field_list_image', 11),
('field_list_image', 12);

-- --------------------------------------------------------

--
-- Структура таблицы `content_field_groups`
--

DROP TABLE IF EXISTS `content_field_groups`;
CREATE TABLE IF NOT EXISTS `content_field_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `content_field_groups`
--

INSERT INTO `content_field_groups` (`id`, `name`, `description`) VALUES
(11, 'blog', 'Поля для категории новостей'),
(12, 'reviews', 'Поля для категории отзывов пользователей');

-- --------------------------------------------------------

--
-- Структура таблицы `content_permissions`
--

DROP TABLE IF EXISTS `content_permissions`;
CREATE TABLE IF NOT EXISTS `content_permissions` (
  `id` bigint(11) NOT NULL,
  `page_id` bigint(11) NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `content_tags`
--

DROP TABLE IF EXISTS `content_tags`;
CREATE TABLE IF NOT EXISTS `content_tags` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=373 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `content_tags`
--

INSERT INTO `content_tags` (`id`, `page_id`, `tag_id`) VALUES
(209, 138, 34),
(210, 138, 35),
(341, 110, 31),
(340, 110, 30),
(339, 110, 33),
(351, 139, 33),
(352, 139, 34),
(353, 139, 35),
(362, 140, 35),
(361, 140, 34),
(360, 140, 33),
(368, 141, 35),
(367, 141, 34),
(366, 141, 33),
(369, 136, 39),
(370, 137, 34),
(371, 137, 35),
(372, 137, 33);

-- --------------------------------------------------------

--
-- Структура таблицы `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
CREATE TABLE IF NOT EXISTS `custom_fields` (
  `id` int(11) NOT NULL,
  `field_type_id` int(11) NOT NULL,
  `field_name` varchar(64) NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '1',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `validators` varchar(255) DEFAULT NULL,
  `entity` varchar(32) DEFAULT NULL,
  `options` varchar(65) DEFAULT NULL,
  `classes` text,
  `position` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `custom_fields`
--

INSERT INTO `custom_fields` (`id`, `field_type_id`, `field_name`, `is_required`, `is_active`, `is_private`, `validators`, `entity`, `options`, `classes`, `position`) VALUES
(124, 0, 'city', 0, 1, 0, '', 'order', NULL, '', -124),
(123, 0, 'city', 0, 1, 0, '', 'user', NULL, '', -123);

-- --------------------------------------------------------

--
-- Структура таблицы `custom_fields_data`
--

DROP TABLE IF EXISTS `custom_fields_data`;
CREATE TABLE IF NOT EXISTS `custom_fields_data` (
  `id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `field_data` text,
  `locale` varchar(4) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=619 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `custom_fields_i18n`
--

DROP TABLE IF EXISTS `custom_fields_i18n`;
CREATE TABLE IF NOT EXISTS `custom_fields_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(4) NOT NULL,
  `field_label` varchar(255) DEFAULT NULL,
  `field_description` text,
  `possible_values` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `custom_fields_i18n`
--

INSERT INTO `custom_fields_i18n` (`id`, `locale`, `field_label`, `field_description`, `possible_values`) VALUES
(123, 'ru', 'Город', '', 'N;'),
(124, 'ru', 'Город', '', 'N;');

-- --------------------------------------------------------

--
-- Структура таблицы `emails`
--

DROP TABLE IF EXISTS `emails`;
CREATE TABLE IF NOT EXISTS `emails` (
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `template` text CHARACTER SET utf8 NOT NULL,
  `settings` text CHARACTER SET utf8 NOT NULL,
  `locale` varchar(5) CHARACTER SET utf8 NOT NULL,
  `description` text CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `emails`
--

INSERT INTO `emails` (`name`, `template`, `settings`, `locale`, `description`) VALUES
('wishListMail', 'Шановний %userName%. Ви створили наступний список побажань %wishKey%<br>Створений: %wishDateCreated%  ', 'a:4:{s:5:"theme";s:29:"Список побажань";s:4:"from";s:43:"Адміністрація магазину";s:9:"from_mail";s:19:"admin@localhost.loc";s:9:"variables";a:3:{i:0;s:10:"%userName%";i:1;s:9:"%wishKey%";i:2;s:17:"%wishDateCreated%";}}', 'ua', 'Лист про створений список побажань  '),
('wishListMail', '<h2> Уважаемый %userName%.</h2> Вы создали следующий список желаний %wishKey%<div>Ссылка на просмотр списка желаний -&nbsp;&nbsp; %wishLink% <br>Создан %wishDateCreated%   %orderId% </div>  ', 'a:5:{s:5:"theme";s:14:"Вишлист";s:4:"from";s:43:"Администрация магазина";s:9:"from_mail";s:19:"admin@localhost.loc";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Письмо о создании списка желаний.  '),
('noticeOfAppearance', 'Шаблон письма  ', 'a:5:{s:5:"theme";s:46:"Уведомлениен о появлении";s:4:"from";s:37:"Администрация сайта";s:9:"from_mail";s:0:"";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Шаблон письма об уведомлении о появлении  '),
('callBackNotification', 'Callback notification  ', 'a:5:{s:5:"theme";s:8:"Callback";s:4:"from";s:24:"Пользователь";s:10:"from_email";s:0:"";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Шаблон письма для callback  '),
('toAdminOrderNotification', 'Шаблон письма для администратора о совершении заказа  ', 'a:5:{s:5:"theme";s:59:"Уведомление о совершении заказа";s:4:"from";s:34:"Админ панель сайта";s:10:"from_email";s:0:"";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Шаблон письма для администратора о совершении заказа    '),
('toUserOrderNotification', 'Здравствуйте, %userName%.<br><br>Мы благодарны Вам за то, что совершили заказ в нашем магазине "ImageCMS Shop"<br><br>Вы указали следующие контактные данные:<br><br>Email адрес: %userEmail%<br><br>Номер телефона: %userPhone%<br><br>Адрес доставки: %userDeliver%<br><br>Менеджеры нашего магазина вскоре свяжутся с Вами и помогут с оформлением и оплатой товара.<br><br>Также, Вы можете всегда посмотреть за статусом Вашего заказа, перейдя по ссылке:&nbsp; %orderLink%.<br><br>Спасибо за ваш заказ, искренне Ваши, сотрудники ImageCMS Shop.<br><br>При возникновении любых вопросов, обращайтесь за телефонами:<br><br>+7 (095) 222-33-22 +38 (098) 222-33-22  ', 'a:5:{s:5:"theme";s:80:"Уведомление покупателя о совершении заказа";s:4:"from";b:0;s:9:"from_mail";s:21:"noreply@localhost.loc";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Уведомление покупателя о совершении заказа  '),
('toUserChangeOrderStatusNotification', 'Уведомление пользователя о смене статуса заказа    ', 'a:5:{s:5:"theme";s:89:"Уведомление пользователя о смене статуса заказа";s:4:"from";s:37:"Администрация сайта";s:10:"from_email";s:19:"admin@localhost.loc";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Уведомление пользователя о смене статуса заказа    '),
('afterOrderUserRegistration', 'Письмо о регистрации на сатйе после совершения заказа  ', 'a:5:{s:5:"theme";s:38:"Регистрация на сайте";s:4:"from";s:43:"Администрация магазина";s:10:"from_email";s:19:"admin@localhost.loc";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Письмо о регистрации на сатйе после совершения заказа    '),
('forgotPassword', 'Здравствуйте!<br><br>На сайте %webSiteName% создан запрос на восстановление пароля для Вашего аккаунта.<br><br>Для завершения процедуры восстановления пароля перейдите по ссылке %resetPasswordUri%<br><br>Ваш новый пароль для входа: %password%<br><br>Если это письмо попало к Вам по ошибке просто проигнорируйте его.<br><br>При возникновении любых вопросов, обращайтесь по телефонам:<br><br>(012)&nbsp; 345-67-89 , (012)&nbsp; 345-67-89<br><br>---<br><br>С уважением,<br><br>сотрудники службы продаж %webSiteName%  ', 'a:5:{s:5:"theme";s:41:"Восстановление пароля";s:4:"from";s:37:"Администрация сайта";s:9:"from_mail";s:0:"";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Шаблон письма о восстановлении пароля  '),
('wishListMail', 'Шановний %userName%. Ви створили наступний список побажань %wishKey%<br>Створений: %wishDateCreated%  ', 'a:4:{s:5:"theme";s:29:"Список побажань";s:4:"from";s:43:"Адміністрація магазину";s:9:"from_mail";s:19:"admin@localhost.loc";s:9:"variables";a:3:{i:0;s:10:"%userName%";i:1;s:9:"%wishKey%";i:2;s:17:"%wishDateCreated%";}}', 'ua', 'Лист про створений список побажань  '),
('wishListMail', '<h2> Уважаемый %userName%.</h2> Вы создали следующий список желаний %wishKey%<div>Ссылка на просмотр списка желаний -&nbsp;&nbsp; %wishLink% <br>Создан %wishDateCreated%   %orderId% </div>  ', 'a:5:{s:5:"theme";s:14:"Вишлист";s:4:"from";s:43:"Администрация магазина";s:9:"from_mail";s:19:"admin@localhost.loc";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Письмо о создании списка желаний.  '),
('noticeOfAppearance', 'Шаблон письма  ', 'a:5:{s:5:"theme";s:46:"Уведомлениен о появлении";s:4:"from";s:37:"Администрация сайта";s:9:"from_mail";s:0:"";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Шаблон письма об уведомлении о появлении  '),
('callBackNotification', 'Callback notification  ', 'a:5:{s:5:"theme";s:8:"Callback";s:4:"from";s:24:"Пользователь";s:10:"from_email";s:0:"";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Шаблон письма для callback  '),
('toAdminOrderNotification', 'Шаблон письма для администратора о совершении заказа  ', 'a:5:{s:5:"theme";s:59:"Уведомление о совершении заказа";s:4:"from";s:34:"Админ панель сайта";s:10:"from_email";s:0:"";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Шаблон письма для администратора о совершении заказа    '),
('toUserOrderNotification', 'Здравствуйте, %userName%.<br><br>Мы благодарны Вам за то, что совершили заказ в нашем магазине "ImageCMS Shop"<br><br>Вы указали следующие контактные данные:<br><br>Email адрес: %userEmail%<br><br>Номер телефона: %userPhone%<br><br>Адрес доставки: %userDeliver%<br><br>Менеджеры нашего магазина вскоре свяжутся с Вами и помогут с оформлением и оплатой товара.<br><br>Также, Вы можете всегда посмотреть за статусом Вашего заказа, перейдя по ссылке:&nbsp; %orderLink%.<br><br>Спасибо за ваш заказ, искренне Ваши, сотрудники ImageCMS Shop.<br><br>При возникновении любых вопросов, обращайтесь за телефонами:<br><br>+7 (095) 222-33-22 +38 (098) 222-33-22  ', 'a:5:{s:5:"theme";s:80:"Уведомление покупателя о совершении заказа";s:4:"from";b:0;s:9:"from_mail";s:21:"noreply@localhost.loc";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Уведомление покупателя о совершении заказа  '),
('toUserChangeOrderStatusNotification', 'Уведомление пользователя о смене статуса заказа    ', 'a:5:{s:5:"theme";s:89:"Уведомление пользователя о смене статуса заказа";s:4:"from";s:37:"Администрация сайта";s:10:"from_email";s:19:"admin@localhost.loc";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Уведомление пользователя о смене статуса заказа    '),
('afterOrderUserRegistration', 'Письмо о регистрации на сатйе после совершения заказа  ', 'a:5:{s:5:"theme";s:38:"Регистрация на сайте";s:4:"from";s:43:"Администрация магазина";s:10:"from_email";s:19:"admin@localhost.loc";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Письмо о регистрации на сатйе после совершения заказа    '),
('forgotPassword', 'Здравствуйте!<br><br>На сайте %webSiteName% создан запрос на восстановление пароля для Вашего аккаунта.<br><br>Для завершения процедуры восстановления пароля перейдите по ссылке %resetPasswordUri%<br><br>Ваш новый пароль для входа: %password%<br><br>Если это письмо попало к Вам по ошибке просто проигнорируйте его.<br><br>При возникновении любых вопросов, обращайтесь по телефонам:<br><br>(012)&nbsp; 345-67-89 , (012)&nbsp; 345-67-89<br><br>---<br><br>С уважением,<br><br>сотрудники службы продаж %webSiteName%  ', 'a:5:{s:5:"theme";s:41:"Восстановление пароля";s:4:"from";s:37:"Администрация сайта";s:9:"from_mail";s:0:"";s:9:"variables";b:0;s:9:"mail_type";s:4:"html";}', 'ru', 'Шаблон письма о восстановлении пароля  ');

-- --------------------------------------------------------

--
-- Структура таблицы `gallery_albums`
--

DROP TABLE IF EXISTS `gallery_albums`;
CREATE TABLE IF NOT EXISTS `gallery_albums` (
  `id`          INT(11)     NOT NULL AUTO_INCREMENT,
  `category_id` INT(11)     NOT NULL,
  `cover_id`    INT(11)     NOT NULL DEFAULT '0',
  `position`    INT(9)      NOT NULL DEFAULT '0',
  `created`     INT(11)     NOT NULL,
  `updated`     INT(11)     NOT NULL,
  `tpl_file`    VARCHAR(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `created` (`created`)
)
  ENGINE = MyISAM
  DEFAULT CHARSET = utf8
  AUTO_INCREMENT = 4;

--
-- Дамп данных таблицы `gallery_albums`
--

INSERT INTO `gallery_albums` (`id`, `category_id`, `cover_id`, `position`, `created`, `updated`, `tpl_file`) VALUES
  (5, 6,   163, 0, 1428422810, 1436514341, ''),
  (6, 6,   165, 1, 1428422886, 1436516014, ''),
  (7, 7,   154, 0, 1428423364, 1436513465, ''),
  (8, 7,   158, 3, 1428423407, 1436513812, ''),
  (10, 7,  162, 1, 1436513897, 1436513927, ''),
  (11, 7,  169, 2, 1436516700, 1436516924, '');

-- --------------------------------------------------------

--
-- Структура таблицы `gallery_albums_i18n`
--

DROP TABLE IF EXISTS `gallery_albums_i18n`;
CREATE TABLE IF NOT EXISTS `gallery_albums_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `description` text NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `gallery_albums_i18n`
--

INSERT INTO `gallery_albums_i18n` (`id`, `locale`, `description`, `name`) VALUES
(5, 'ru', '<p><span>Горы &ndash; территория тренировки на результат и успех. Горы - отличный повод отказаться от лени и неработающих разговоров. Здесь, как никогда, видно, что в команде зачет по последнему.&nbsp;</span></p>', 'Путешествие в горы'),
(6, 'ru', '<p>Озеро Атитлан является одной из визитных карточек Гватемалы, притягивающем в эту страну любителей медиативного отдыха, завораживающих видов и культуры коренных народов Центральной Америки.</p>', 'Озеро Атитлан'),
(11, 'ru', '<p>Несколько фотографий путешествия наших сотрудников вокруг света</p>', 'Вокруг света'),
(5, 'ua', '<p>Гори - територія тренування на результат і успіх. Гори - відмінний привід відмовитися від ліні і непрацюючих розмов. Тут, як ніколи, видно, що в команді залік за останнім.</p>', 'Подорож у гори'),
(7, 'ru', '<p>Впервые мы представляем новую технологию ведения и управления бизнеса</p>', 'Презентация проекта'),
(8, 'ru', '<p>Бизнес-проект для компании по организации&nbsp;технологического менеджмента</p>', 'Бизнес-проект'),
(10, 'ru', '<p>Разработка стратегии для маркетинговой компании</p>', 'Предложение по маркетингу'),
(6, 'ua', '<p>Озеро Атитлан є однією з візитних карток Гватемали, притягує в цю країну любителів медіативного відпочинку, що зачаровуються видами і культурою корінних народів Центральної Америки.</p>', 'Озеро Атитлан'),
(7, 'ua', '<p>Вперше ми представляємо нову технологію ведення та управління бізнесу</p>', 'Презентація проекту'),
(10, 'ua', '<p>Розробка стратегії для маркетингової компанії</p>', 'Пропозиція по маркетингу'),
(11, 'ua', '<p>Кілька фотографій подорожі наших співробітників навколо світу</p>', 'Навколо світу'),
(8, 'ua', '<p>Бізнес-проект для компанії з організації технологічного менеджменту</p>', 'Бізнес-проект');

-- --------------------------------------------------------

--
-- Структура таблицы `gallery_category`
--

DROP TABLE IF EXISTS `gallery_category`;
CREATE TABLE IF NOT EXISTS `gallery_category` (
  `id`       INT(11) NOT NULL AUTO_INCREMENT,
  `cover_id` INT(11) NOT NULL DEFAULT '0',
  `position` INT(9)  NOT NULL DEFAULT '0',
  `created`  INT(11) NOT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = MyISAM
  DEFAULT CHARSET = utf8
  AUTO_INCREMENT = 7;

--
-- Дамп данных таблицы `gallery_category`
--

INSERT INTO `gallery_category` (`id`, `cover_id`, `position`, `created`) VALUES
  (6, 0, 0, 1428422691),
  (7, 0, 0, 1428423332);

-- --------------------------------------------------------

--
-- Структура таблицы `gallery_category_i18n`
--

DROP TABLE IF EXISTS `gallery_category_i18n`;
CREATE TABLE IF NOT EXISTS `gallery_category_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `description` text,
  `name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `gallery_category_i18n`
--

INSERT INTO `gallery_category_i18n` (`id`, `locale`, `description`, `name`) VALUES
(6, 'ru', '<p>Мы дружная команда профессионалов, которая умеет не только качественно работать, но и отдыхать! Ведь хороший отдых &mdash; залог успешной работы. А хороший отдых всегда должен быть активным.</p>', 'Наша компания'),
(7, 'ru', '<p>Предлагаем просмотреть фотографии с наших последних презентаций,&nbsp;которые мы проводим для наших клиентов на всемирно&nbsp;известных форумах и выставках.&nbsp;Работа с иностранными заказчики помогает нам набраться еще большего опыта, исследовать разные ситуации в разных странах, что в целом повышает квалификацию нашей компании.</p>', 'Презентации'),
(6, 'ua', '<p>Ми дружна команда професіоналів, яка вміє не тільки якісно працювати, а й відпочивати! Адже хороший відпочинок - запорука успішної роботи. А хороший відпочинок завжди повинен бути активним.</p>', 'Наша компанія'),
(7, 'ua', '<p>Пропонуємо переглянути фотографії з наших останніх презентацій, які ми проводимо для наших клієнтів на всесвітньо відомих форумах і виставках. Робота з іноземними замовники допомагає нам набратися ще більшого досвіду, досліджувати різні ситуації в різних країнах, що в цілому підвищує кваліфікацію нашої компанії.</p>', 'Презентації');

-- --------------------------------------------------------

--
-- Структура таблицы `gallery_images`
--

DROP TABLE IF EXISTS `gallery_images`;
CREATE TABLE IF NOT EXISTS `gallery_images` (
  `id` int(11) NOT NULL,
  `album_id` int(11) DEFAULT NULL,
  `file_name` varchar(150) DEFAULT NULL,
  `file_ext` varchar(8) DEFAULT NULL,
  `file_size` varchar(20) DEFAULT NULL,
  `position` int(9) DEFAULT NULL,
  `width` int(6) DEFAULT NULL,
  `height` int(6) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `uploaded` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `gallery_images`
--

INSERT INTO `gallery_images` (`id`, `album_id`, `file_name`, `file_ext`, `file_size`, `position`, `width`, `height`, `description`, `uploaded`, `views`) VALUES
(149, 7, '871fbac6a42c05f5a22f8b913f349f3f', '.jpeg', '881.8 kilobyte_abbr', 1, 2507, 1674, NULL, 1433857897, 85),
(148, 6, '6f5762bcb3eda6a70c610a01a801b12f', '.jpeg', '450.7 kilobyte_abbr', 18, 2509, 1673, NULL, 1433857872, 0),
(166, 11, '3be099ecbc48c3a92597f836f46d98ef', '.jpg', '919.4 kilobyte_abbr', 36, 2580, 1716, NULL, 1436516920, 27),
(146, 6, 'f5d7d797b41b1409cdd3791fcbadb64e', '.jpeg', '881.8 kilobyte_abbr', 16, 2507, 1674, NULL, 1433857862, 0),
(152, 6, '2b004f8bc4195d7e03d3da3ace4ee5cf', '.jpeg', '5.9 megabyte_abbr', 22, 4000, 2667, NULL, 1436439453, 0),
(165, 6, '780549bdad49cf6e670acdc72d20aca9', '.jpg', '216.2 kilobyte_abbr', 35, 900, 600, NULL, 1436516014, 0),
(137, 5, '38af37da7a648eb9ed771d777bfcf07d', '.jpg', '919.4 kilobyte_abbr', 3, 2580, 1716, NULL, 1432914498, 3),
(138, 5, '05a672cf0fee47d300dba63eb0ce2ff7', '.jpg', '3.6 megabyte_abbr', 5, 5472, 3648, NULL, 1432914505, 0),
(164, 6, '4adfe6586bf5112b4c1ea780f7619c62', '.jpg', '421.5 kilobyte_abbr', 34, 900, 600, NULL, 1436516014, 0),
(163, 5, '6959cb6d4fb1df64e9db8c2b0794f18b', '.jpg', '142.3 kilobyte_abbr', 33, 900, 600, NULL, 1436514341, 0),
(141, 5, 'd994f7108b8b4fcf899be3cde29266c2', '.jpeg', '450.7 kilobyte_abbr', 11, 2509, 1673, NULL, 1432914517, 0),
(167, 11, '05420a1b196e16d21b19266def9825d7', '.jpg', '3.6 megabyte_abbr', 37, 5472, 3648, NULL, 1436516923, 0),
(143, 6, '0e153a7bbdea2f3df7c890c69aba27ce', '.jpg', '919.4 kilobyte_abbr', 13, 2580, 1716, NULL, 1433857849, 16),
(144, 6, 'c13ea30e08e26f9a696446fe6e3a1f0c', '.jpg', '3.6 megabyte_abbr', 14, 5472, 3648, NULL, 1433857855, 0),
(150, 7, '30526e4305ae53ac3b330cf09510ffa5', '.jpg', '12.1 megabyte_abbr', 3, 5616, 3744, NULL, 1433857905, 0),
(151, 7, '0796b80c02543659bd6b9dede9aa9515', '.jpeg', '450.7 kilobyte_abbr', 5, 2509, 1673, NULL, 1433857907, 0),
(153, 6, '9e8270a52a13050b725165739ae43d84', '.jpg', '3.3 megabyte_abbr', 23, 4000, 2667, NULL, 1436439662, 0),
(154, 7, '427cf6eb12e903d30d43b418dec3bf67', '.jpg', '352.1 kilobyte_abbr', 24, 900, 600, NULL, 1436513465, 0),
(155, 8, 'b10f60899afddf7db7318fff156c2705', '.jpg', '472.8 kilobyte_abbr', 25, 900, 600, NULL, 1436513811, 10),
(156, 8, 'd9201888c54090fd24c8be1a7f5dc181', '.jpg', '367.4 kilobyte_abbr', 26, 900, 600, NULL, 1436513811, 0),
(157, 8, 'bf8dab48331e368d80fc17d6e0e072a7', '.jpg', '333.8 kilobyte_abbr', 27, 900, 600, NULL, 1436513812, 0),
(158, 8, '865eba768a9642497808309b22d615f8', '.jpg', '398.6 kilobyte_abbr', 28, 900, 600, NULL, 1436513812, 0),
(159, 10, '920bda68d067982dbc958e3594c371c7', '.jpg', '333.8 kilobyte_abbr', 29, 900, 600, NULL, 1436513924, 21),
(160, 10, 'a694befe10283ed38bcc3edac546cded', '.jpg', '12.1 megabyte_abbr', 30, 5616, 3744, NULL, 1436513927, 0),
(161, 10, '79718f31bb96f751a95455adf894f22c', '.jpg', '280.2 kilobyte_abbr', 31, 900, 600, NULL, 1436513927, 0),
(162, 10, '0d9f970309fb252acbf6d2baed31b94e', '.jpg', '336.0 kilobyte_abbr', 32, 900, 600, NULL, 1436513927, 0),
(168, 11, '3dca83c68ff7f8006ce866631eb5a857', '.jpg', '142.3 kilobyte_abbr', 38, 900, 600, NULL, 1436516923, 0),
(169, 11, 'f3351562c25a58a7616e1a866af13f08', '.jpg', '421.5 kilobyte_abbr', 39, 900, 600, NULL, 1436516923, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `gallery_images_i18n`
--

DROP TABLE IF EXISTS `gallery_images_i18n`;
CREATE TABLE IF NOT EXISTS `gallery_images_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `description` text,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `gallery_images_i18n`
--

INSERT INTO `gallery_images_i18n` (`id`, `locale`, `description`, `title`) VALUES
(94, 'ru', 'Kepler 64 by Dirk Terrell, Boulder, CO', ''),
(95, 'ru', '<p>Starship arriving to Gliese 667C, by L. Nubian, NY, NY</p>', NULL),
(96, 'ru', '<p>3,000 light years, by Kilo Mora, Atlanta, GA</p>', NULL),
(97, 'ru', '<p>Kepler 64 Moon by D. Terrell, Boulder, CO</p>', NULL),
(98, 'ru', '<p>Pale Blue Dots by K. Mora, Atlanta, GA</p>', NULL),
(99, 'ru', '<p>Edge of Existence by L. Nendza, Leesburg, FL</p>', ''),
(102, 'ru', '<p>This image from NASA''s Kepler mission shows the telescope''s full field of view -- an expansive star-rich patch of sky in the constellations Cygnus and Lyra stretching across 100 square degrees, or the equivalent of two side-by-side dips of the Big Dipper.</p>', ''),
(103, 'ru', '<p>Inverted image (dark stars on light sky) Stars in the image are all brighter than magnitude 18.5. Stars brighter than 11.5 are "saturated" (all look the same brightness in the image).</p>', NULL),
(104, 'ru', '<p>This image from NASA''s Kepler mission shows the telescope''s full field of view -- an expansive star-rich patch of sky in the constellations Cygnus and Lyra stretching across 100 square degrees, or the equivalent of two side-by-side dips of the Big Dipper.</p>', NULL),
(105, 'ru', '<p>A single Kepler science module with two CCDs and a single field flattening lens mounted onto an Invar carrier. Each of the 21 CCD science modules are covered with lenses of sapphire.</p>', NULL),
(106, 'ru', '<p>The Kepler focal plane is approximately one foot square. It''s composed of 25 individually mounted modules. The four corner modules are used for fine guiding and the other 21 modules are used for science observing.</p>\n<p>Note that the four fine guidance modules in the corners of the focal plane are much smaller CCDs than the science modules. Each module and its electronics convert light into digital numbers that is analyzed for planet transits.</p>', ''),
(107, 'ru', '', ''),
(108, 'ru', '', ''),
(119, 'ru', '', ''),
(120, 'ru', '', ''),
(121, 'ru', '', ''),
(122, 'ru', '', ''),
(123, 'ru', '', ''),
(124, 'ru', '', ''),
(125, 'ru', '', ''),
(126, 'ru', '', ''),
(127, 'ru', '', ''),
(128, 'ru', '', ''),
(129, 'ru', '', ''),
(130, 'ru', '', ''),
(131, 'ru', '', ''),
(132, 'ru', '', ''),
(133, 'ru', '', ''),
(134, 'ru', '', ''),
(135, 'ru', '', ''),
(137, 'ru', '', ''),
(138, 'ru', '', ''),
(141, 'ru', '', ''),
(149, 'ru', '<p>Описание</p>', ''),
(150, 'ru', '', ''),
(154, 'ru', '', ''),
(158, 'ru', '', ''),
(162, 'ru', '', ''),
(163, 'ru', '', ''),
(165, 'ru', '', ''),
(169, 'ru', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(11) NOT NULL,
  `lang_name` varchar(100) NOT NULL,
  `identif` varchar(10) NOT NULL,
  `image` text NOT NULL,
  `folder` varchar(100) NOT NULL,
  `template` varchar(100) NOT NULL,
  `default` int(1) NOT NULL,
  `locale` varchar(100) NOT NULL,
  `active` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `languages`
--

INSERT INTO `languages` (`id`, `lang_name`, `identif`, `image`, `folder`, `template`, `default`, `locale`, `active`) VALUES
(3, 'Русский', 'ru', '', 'russian', 'light', 1, 'ru_RU', 1),
(4, 'English', 'en', '', 'english', 'light', 0, 'en_US', 1),
(5, 'Українська', 'ua', '', 'ukrainian', 'light', 0, 'uk_UA', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(40) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Структура таблицы `logs`
--

DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `message` text NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2932 DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Структура таблицы `mail`
--

DROP TABLE IF EXISTS `mail`;
CREATE TABLE IF NOT EXISTS `mail` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `date` int(15) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `main_title` varchar(300) NOT NULL,
  `tpl` varchar(255) DEFAULT NULL,
  `expand_level` int(255) DEFAULT NULL,
  `description` text,
  `created` varchar(50) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `menus`
--

INSERT INTO `menus` (`id`, `name`, `main_title`, `tpl`, `expand_level`, `description`, `created`) VALUES
(4, 'info_header', 'Header info menu', 'navs/info_header', 3, '', '2015-08-22 18:46:42'),
(13, 'info_footer', 'Footer info menu', 'navs/info_footer', 0, '', '2015-08-22 18:54:14'),
(14, 'info_mobile', 'Mobile info menu', 'navs/mobile_nav', 5, '', '2016-01-05 19:20:29');

-- --------------------------------------------------------

--
-- Структура таблицы `menus_data`
--

DROP TABLE IF EXISTS `menus_data`;
CREATE TABLE IF NOT EXISTS `menus_data` (
  `id` int(11) NOT NULL,
  `menu_id` int(9) NOT NULL,
  `item_id` int(9) NOT NULL,
  `item_type` varchar(15) NOT NULL,
  `item_image` varchar(255) DEFAULT NULL,
  `roles` text,
  `hidden` smallint(1) NOT NULL DEFAULT '0',
  `title` varchar(300) NOT NULL,
  `parent_id` int(9) NOT NULL,
  `position` smallint(5) DEFAULT NULL,
  `description` text,
  `add_data` text
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `menus_data`
--

INSERT INTO `menus_data` (`id`, `menu_id`, `item_id`, `item_type`, `item_image`, `roles`, `hidden`, `title`, `parent_id`, `position`, `description`, `add_data`) VALUES
(10, 1, 0, 'url', '', '', 0, 'Оплата', 0, 3, NULL, 'a:2:{s:3:"url";s:7:"/oplata";s:7:"newpage";s:1:"0";}'),
(8, 1, 0, 'url', '', '', 0, 'Главная', 0, 1, NULL, 'a:2:{s:3:"url";s:1:"/";s:7:"newpage";s:1:"0";}'),
(9, 1, 64, 'page', '', '', 0, 'О магазине', 0, 2, NULL, 'a:1:{s:7:"newpage";s:1:"0";}'),
(11, 1, 0, 'url', '', '', 0, 'Доставка', 0, 4, NULL, 'a:2:{s:3:"url";s:9:"/dostavka";s:7:"newpage";s:1:"0";}'),
(12, 1, 0, 'url', '', '', 0, 'Помощь', 0, 5, NULL, 'a:2:{s:3:"url";s:5:"/help";s:7:"newpage";s:1:"0";}'),
(13, 1, 0, 'url', '', '', 0, 'Контакты', 0, 6, NULL, 'a:2:{s:3:"url";s:11:"/contact_us";s:7:"newpage";s:1:"0";}'),
(57, 4, 69, 'category', '', '', 0, 'Экономика', 54, 6, NULL, 'a:1:{s:7:"newpage";i:0;}'),
(56, 4, 74, 'category', '', '', 0, 'Финансы', 54, 5, NULL, 'a:1:{s:7:"newpage";i:0;}'),
(55, 4, 67, 'category', '', '', 0, 'Бизнес', 54, 4, NULL, 'a:1:{s:7:"newpage";i:0;}'),
(52, 4, 124, 'page', NULL, '', 0, 'О компании', 0, 1, NULL, 'a:2:{s:4:"page";N;s:7:"newpage";i:0;}'),
(19, 5, 0, 'url', '', '', 0, 'Главная', 0, 1, NULL, 'a:2:{s:3:"url";s:1:"/";s:7:"newpage";s:1:"0";}'),
(20, 5, 0, 'url', '', '', 0, 'Видео', 0, 2, NULL, 'a:2:{s:3:"url";s:20:"/shop/category/video";s:7:"newpage";s:1:"0";}'),
(21, 5, 64, 'page', '', '', 0, 'О магазине', 0, 3, NULL, 'a:1:{s:7:"newpage";s:1:"0";}'),
(22, 5, 0, 'url', '', '', 0, 'Домашнее  аудио', 0, 4, NULL, 'a:2:{s:3:"url";s:30:"/shop/category/domashnee_audio";s:7:"newpage";s:1:"0";}'),
(23, 5, 66, 'page', '', '', 0, 'Доставка и оплата', 0, 5, NULL, 'a:1:{s:7:"newpage";s:1:"0";}'),
(24, 5, 0, 'url', '', '', 0, 'Фото и камеры', 0, 6, NULL, 'a:2:{s:3:"url";s:28:"/shop/category/foto_i_kamery";s:7:"newpage";s:1:"0";}'),
(25, 5, 67, 'page', '', '', 0, 'Помощь', 0, 7, NULL, 'a:1:{s:7:"newpage";s:1:"0";}'),
(26, 5, 0, 'url', '', '', 0, 'Домашняя электроника', 0, 8, NULL, 'a:2:{s:3:"url";s:38:"/shop/category/domashniaia_elektronika";s:7:"newpage";s:1:"0";}'),
(27, 5, 68, 'page', '', '', 0, 'Контакты', 0, 9, NULL, 'a:1:{s:7:"newpage";s:1:"0";}'),
(28, 5, 0, 'url', '', '', 0, 'Авто музыка и видео', 0, 10, NULL, 'a:2:{s:3:"url";s:34:"/shop/category/avto_muzyka_i_video";s:7:"newpage";s:1:"0";}'),
(54, 4, 64, 'category', NULL, '', 0, 'Блог', 52, 3, NULL, 'N;'),
(53, 4, 87, 'page', NULL, '', 0, 'Контакты', 0, 11, NULL, 'a:2:{s:4:"page";b:0;s:7:"newpage";i:0;}'),
(60, 4, 66, 'category', NULL, '', 0, 'Клиенты о нас', 52, 8, NULL, 'N;'),
(61, 4, 0, 'url', NULL, '', 0, 'Бренды', 0, 10, NULL, 'a:2:{s:3:"url";s:10:"shop/brand";s:7:"newpage";i:0;}'),
(62, 4, 142, 'page', NULL, '', 0, 'Доставка и оплата', 52, 7, NULL, 'a:2:{s:4:"page";b:0;s:7:"newpage";i:0;}'),
(63, 4, 0, 'module', NULL, '', 0, 'Галерея', 0, 9, NULL, 'a:3:{s:8:"mod_name";s:7:"gallery";s:6:"method";s:0:"";s:7:"newpage";i:0;}'),
(68, 13, 124, 'page', '', '', 0, 'О компании', 0, 1, NULL, 'a:1:{s:7:"newpage";i:0;}'),
(69, 13, 142, 'page', '', '', 0, 'Доставка и оплата', 0, 2, NULL, 'a:1:{s:7:"newpage";i:0;}'),
(70, 13, 87, 'page', '', '', 0, 'Контакты', 0, 7, NULL, 'a:1:{s:7:"newpage";i:0;}'),
(71, 4, 143, 'page', '', '', 0, 'Универсальная страница', 52, 2, NULL, 'a:1:{s:7:"newpage";i:0;}'),
(72, 14, 64, 'category', NULL, '', 0, 'Блог', 73, 3, NULL, 'N;'),
(73, 14, 124, 'page', '', '', 0, 'О компании', 0, 1, NULL, 'a:1:{s:7:"newpage";i:0;}'),
(74, 14, 67, 'category', NULL, '', 0, 'Бизнес', 72, 4, NULL, 'N;'),
(76, 14, 87, 'page', '', '', 0, 'Контакты', 0, 11, NULL, 'a:1:{s:7:"newpage";i:0;}'),
(77, 14, 0, 'url', '', '', 0, 'Бренды', 0, 10, NULL, 'a:2:{s:3:"url";s:10:"shop/brand";s:7:"newpage";i:0;}'),
(78, 14, 142, 'page', NULL, '', 0, 'Доставка и оплата', 73, 7, NULL, 'a:2:{s:4:"page";b:0;s:7:"newpage";i:0;}'),
(79, 14, 0, 'module', '', '', 0, 'Галерея', 0, 9, NULL, 'a:3:{s:8:"mod_name";s:7:"gallery";s:6:"method";s:0:"";s:7:"newpage";i:0;}'),
(80, 14, 74, 'category', '', '', 0, 'Финансы', 72, 5, NULL, 'a:1:{s:7:"newpage";i:0;}'),
(81, 14, 69, 'category', '', '', 0, 'Экономика', 72, 6, NULL, 'a:1:{s:7:"newpage";i:0;}'),
(82, 14, 66, 'category', NULL, '', 0, 'Клиенты о нас', 73, 8, NULL, 'N;'),
(83, 14, 143, 'page', '', '', 0, 'Универсальная страница', 73, 2, NULL, 'a:1:{s:7:"newpage";i:0;}'),
(85, 13, 0, 'module', '', '', 0, 'Галерея', 0, 5, NULL, 'a:3:{s:8:"mod_name";s:7:"gallery";s:6:"method";s:0:"";s:7:"newpage";i:0;}'),
(86, 13, 64, 'category', '', '', 0, 'Блог', 0, 4, NULL, 'a:1:{s:7:"newpage";i:0;}'),
(87, 13, 66, 'category', '', '', 0, 'Клиенты о нас', 0, 3, NULL, 'a:1:{s:7:"newpage";i:0;}'),
(88, 13, 0, 'url', '', '', 0, 'Бренды', 0, 6, NULL, 'a:2:{s:3:"url";s:10:"shop/brand";s:7:"newpage";i:0;}');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_translate`
--

DROP TABLE IF EXISTS `menu_translate`;
CREATE TABLE IF NOT EXISTS `menu_translate` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `menu_translate`
--

INSERT INTO `menu_translate` (`id`, `item_id`, `lang_id`, `title`) VALUES
(31, 8, 3, 'Главная'),
(5, 9, 3, 'О Магазине'),
(7, 13, 3, 'Контакты'),
(11, 10, 3, 'Оплата'),
(15, 12, 3, 'Помощь'),
(52, 14, 3, 'Главная'),
(55, 15, 3, 'О магазине'),
(58, 16, 3, 'Доставка и оплата'),
(64, 17, 3, 'Помощь'),
(70, 18, 3, 'Контакты'),
(29, 19, 3, 'Главная'),
(33, 20, 3, 'Видео'),
(36, 21, 3, 'О магазине'),
(38, 22, 3, 'Домашнее аудио'),
(40, 23, 3, 'Доставка и оплата'),
(42, 24, 3, 'Фото и камеры'),
(44, 25, 3, 'Помощь'),
(46, 26, 3, 'Домашняя электроника'),
(48, 27, 3, 'Контакты'),
(50, 28, 3, 'Авто музыка и видео'),
(53, 14, 4, 'Main'),
(54, 14, 5, 'Головна'),
(56, 15, 4, 'About store'),
(57, 15, 5, 'Про магазин'),
(59, 16, 4, 'Shipping'),
(60, 16, 5, 'Доставка'),
(61, 48, 3, 'Оплата'),
(62, 48, 4, 'Payment'),
(63, 48, 5, 'Оплата'),
(65, 17, 4, 'Help'),
(66, 17, 5, 'Допомога'),
(67, 40, 3, 'Новости'),
(68, 40, 4, 'News'),
(69, 40, 5, 'Новини'),
(71, 18, 4, 'Contact Information'),
(72, 18, 5, 'Контакты'),
(73, 41, 3, 'О магазине'),
(74, 41, 4, 'About'),
(75, 41, 5, 'Про магазин'),
(76, 42, 3, 'Доставка'),
(77, 42, 4, 'Shipping'),
(78, 42, 5, 'Доставка'),
(79, 50, 3, 'Оплата'),
(80, 50, 4, 'Payment'),
(81, 50, 5, 'Оплата'),
(82, 43, 3, 'Помощь'),
(83, 43, 4, 'Help'),
(84, 43, 5, 'Допомога'),
(85, 37, 3, 'Новости'),
(86, 37, 4, 'News'),
(87, 37, 5, 'Новини'),
(88, 49, 3, 'Контакты'),
(89, 49, 4, 'Contact Information'),
(90, 49, 5, 'Контакти'),
(91, 44, 3, 'Помощь'),
(92, 44, 4, 'Help'),
(93, 44, 5, 'Допомога'),
(94, 45, 3, 'Оплата'),
(95, 45, 4, 'Payment'),
(96, 45, 5, 'Оплата'),
(98, 47, 3, 'Доставка'),
(99, 47, 4, 'Shipping'),
(100, 47, 5, 'Доставка'),
(101, 46, 3, 'О сайте'),
(102, 46, 4, 'About'),
(103, 46, 5, 'Про сайт'),
(104, 51, 3, 'Бренды'),
(0, 52, 3, 'О компании'),
(0, 53, 3, 'Контакты'),
(0, 54, 3, 'Блог'),
(0, 55, 3, 'Бизнес'),
(0, 56, 3, 'Финансы'),
(0, 57, 3, 'Экономика'),
(0, 58, 3, 'Клиенты о нас'),
(0, 59, 3, 'Услуги'),
(0, 60, 3, 'Клиенты о нас'),
(0, 61, 3, 'Бренды'),
(0, 62, 3, 'Доставка и оплата'),
(0, 63, 3, 'Галерея'),
(0, 64, 3, 'Услуги адвоката'),
(0, 65, 3, 'Налоговые консультации'),
(0, 66, 3, 'Бизнес-консалтинг'),
(0, 67, 3, 'О компании'),
(0, 68, 3, 'О компании'),
(0, 69, 3, 'Доставка и оплата'),
(0, 70, 3, 'Контакты'),
(0, 71, 3, 'Универсальная страница'),
(0, 72, 3, 'Блог'),
(0, 73, 3, 'О компании'),
(0, 74, 3, 'Бизнес'),
(0, 75, 3, 'Галерея'),
(0, 76, 3, 'Контакты'),
(0, 77, 3, 'Бренды'),
(0, 78, 3, 'Доставка и оплата'),
(0, 79, 3, 'Галерея'),
(0, 80, 3, 'Финансы'),
(0, 81, 3, 'Экономика'),
(0, 82, 3, 'Клиенты о нас'),
(0, 83, 3, 'Универсальная страница'),
(0, 84, 3, 'Контакты'),
(0, 85, 3, 'Галерея'),
(0, 86, 3, 'Блог'),
(0, 87, 3, 'Клиенты о нас'),
(0, 88, 3, 'Бренды');

-- --------------------------------------------------------

--
-- Структура таблицы `mod_banner`
--

DROP TABLE IF EXISTS `mod_banner`;
CREATE TABLE IF NOT EXISTS `mod_banner` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `active_to` int(11) DEFAULT NULL,
  `where_show` text,
  `group` text,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mod_banner_groups`
--

DROP TABLE IF EXISTS `mod_banner_groups`;
CREATE TABLE IF NOT EXISTS `mod_banner_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mod_banner_groups`
--

INSERT INTO `mod_banner_groups` (`id`, `name`) VALUES
(2, 'benefits');

-- --------------------------------------------------------

--
-- Структура таблицы `mod_banner_i18n`
--

DROP TABLE IF EXISTS `mod_banner_i18n`;
CREATE TABLE IF NOT EXISTS `mod_banner_i18n` (
  `id` int(11) NOT NULL,
  `url` text,
  `locale` varchar(5) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `description` text,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mod_discount_all_order`
--

DROP TABLE IF EXISTS `mod_discount_all_order`;
CREATE TABLE IF NOT EXISTS `mod_discount_all_order` (
  `id` int(11) NOT NULL,
  `for_autorized` tinyint(4) DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `is_gift` tinyint(4) DEFAULT NULL,
  `begin_value` double(10,0) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Структура таблицы `mod_discount_brand`
--

DROP TABLE IF EXISTS `mod_discount_brand`;
CREATE TABLE IF NOT EXISTS `mod_discount_brand` (
  `id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mod_discount_category`
--

DROP TABLE IF EXISTS `mod_discount_category`;
CREATE TABLE IF NOT EXISTS `mod_discount_category` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `child` int(3) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mod_discount_comulativ`
--

DROP TABLE IF EXISTS `mod_discount_comulativ`;
CREATE TABLE IF NOT EXISTS `mod_discount_comulativ` (
  `id` int(11) NOT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `begin_value` int(11) DEFAULT NULL,
  `end_value` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mod_discount_group_user`
--

DROP TABLE IF EXISTS `mod_discount_group_user`;
CREATE TABLE IF NOT EXISTS `mod_discount_group_user` (
  `id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mod_discount_product`
--

DROP TABLE IF EXISTS `mod_discount_product`;
CREATE TABLE IF NOT EXISTS `mod_discount_product` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mod_discount_user`
--

DROP TABLE IF EXISTS `mod_discount_user`;
CREATE TABLE IF NOT EXISTS `mod_discount_user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mod_discount_user`
--

INSERT INTO `mod_discount_user` (`id`, `user_id`, `discount_id`) VALUES
(2, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `mod_email_paterns`
--

DROP TABLE IF EXISTS `mod_email_paterns`;
CREATE TABLE IF NOT EXISTS `mod_email_paterns` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `patern` text,
  `from` varchar(256) NOT NULL,
  `from_email` varchar(256) NOT NULL,
  `admin_email` varchar(256) NOT NULL,
  `type` enum('HTML','Text') NOT NULL DEFAULT 'HTML',
  `user_message_active` tinyint(1) NOT NULL,
  `admin_message_active` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mod_email_paterns`
--

INSERT INTO `mod_email_paterns` (`id`, `name`, `patern`, `from`, `from_email`, `admin_email`, `type`, `user_message_active`, `admin_message_active`) VALUES
(1, 'make_order', '', '', '', '', 'HTML', 1, 1),
(2, 'change_order_status', '', '', '', '', 'HTML', 1, 0),
(3, 'notification_email', '', '', '', '', 'HTML', 1, 0),
(4, 'create_user', '', '', '', '', 'HTML', 1, 0),
(5, 'forgot_password', '', '', '', '', 'HTML', 1, 0),
(6, 'change_password', '', '', '', '', 'HTML', 1, 0),
(7, 'price_change', '', '', '', '', 'HTML', 1, 0),
(8, 'wish_list', '', '', '', '', 'HTML', 0, 0),
(9, 'callback', '', '', '', '', 'HTML', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `mod_email_paterns_i18n`
--

DROP TABLE IF EXISTS `mod_email_paterns_i18n`;
CREATE TABLE IF NOT EXISTS `mod_email_paterns_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `theme` varchar(256) NOT NULL,
  `user_message` text NOT NULL,
  `admin_message` text NOT NULL,
  `description` text NOT NULL,
  `variables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mod_email_paterns_i18n`
--

INSERT INTO `mod_email_paterns_i18n` (`id`, `locale`, `theme`, `user_message`, `admin_message`, `description`, `variables`) VALUES
(1, 'ru', 'Заказ товара', '<p style="font-family: arial; font-size: 13px; margin-top: 10px;">Здравствуйте, $userName$!</p>\n<p style="font-family: arial; font-size: 13px; margin-top: 10px;">Мы благодарны Вам за то, что совершили заказ в нашем магазине.</p>\n<p style="font-family: arial; font-size: 13px; margin-top: 20px;">Вы указали следующие контактные данные:</p>\n<div style="font-family: arial; font-size: 13px; margin-top: 10px;"><span style="color: #666;">Email адрес: </span>$userEmail$</div>\n<div style="font-family: arial; font-size: 13px; margin-top: 10px;"><span style="color: #666;">Номер телефона: </span>$userPhone$</div>\n<div style="font-family: arial; font-size: 13px; margin-top: 10px;"><span style="color: #666;">Адрес доставки: </span>$userDeliver$</div>\n<p style="font-family: arial; font-size: 13px; margin-top: 20px;">Менеджеры нашего магазина вскоре свяжутся с Вами и помогут с оформлением и оплатой товара.</p>\n<p style="font-family: arial; font-size: 13px;">Также, Вы можете всегда посмотреть за статусом Вашего заказа, <a href="$orderLink$" target="_blank">перейдя по ссылке</a>.</p>', '<p>Пользователь&nbsp;$userName$ совершил заказ товара</p>\n<p>Email адрес: $userEmail$</p>\n<p>Номер телефона: $userPhone$</p>\n<p>Адрес доставки: $userDeliver$</p>', '<p><span>Уведомление покупателя о совершении заказа</span></p>', 'a:7:{s:10:"$userName$";s:31:"Имя пользователя";s:11:"$userEmail$";s:30:"Email Пользователя";s:11:"$userPhone$";s:39:"Телефон Пользователя";s:13:"$userDeliver$";s:27:"Адрес доставки";s:11:"$orderLink$";s:28:"Ссылка на заказ";s:16:"$deliveryMethod$";s:29:"Способ доставки";s:15:"$paymentMethod$";s:25:"Способ оплаты";}'),
(2, 'ru', 'Смена статуса заказа', '<p style="font-family: arial; font-size: 13px; margin-top: 10px;">Здравствуйте, $userName$!</p>\n<p style="font-family: arial; font-size: 13px; margin-top: 10px;">Статус вашего заказа изменен на <strong>$status$</strong></p>\n<p style="font-family: arial; font-size: 13px; margin-top: 20px;">Вы указали следующие контактные данные:</p>\n<div style="font-family: arial; font-size: 13px; margin-top: 10px;"><span style="color: #666;">Email адрес: </span>$userEmail$</div>\n<div style="font-family: arial; font-size: 13px; margin-top: 10px;"><span style="color: #666;">Номер телефона: </span>$userPhone$</div>\n<div style="font-family: arial; font-size: 13px; margin-top: 10px;"><span style="color: #666;">Адрес доставки: </span>$userDeliver$</div>\n<p style="font-family: arial; font-size: 13px; margin-top: 20px;">Менеджеры нашего магазина вскоре свяжутся с Вами и помогут с оформлением и оплатой товара.</p>\n<p style="font-family: arial; font-size: 13px;">Также, Вы можете всегда посмотреть за статусом Вашего заказа, <a href="$orderLink$" target="_blank">перейдя по ссылке</a>.</p>', '', '<p>Смена статуса заказа</p>', 'a:6:{s:10:"$userName$";s:31:"Имя пользователя";s:11:"$userEmail$";s:30:"Email Пользователя";s:11:"$orderLink$";s:28:"Ссылка на заказ";s:8:"$status$";s:25:"Статус заказа";s:11:"$userPhone$";s:39:"Телефон пользователя";s:13:"$userDeliver$";s:27:"Адрес доставки";}'),
(3, 'ru', 'Товар появился на складе!', '<p style="font-family: arial; font-size: 13px; margin-top: 10px;">Здравствуйте, $userName$!</p>\n<p style="font-family: arial; font-size: 13px; margin-top: 10px;">Товар&nbsp;<a href="$productLink$" target="_blank">$productName$</a>&nbsp;появился на складе. Вы можете его заказать.</p>', '', '<p>Уведомление о появлении</p>', 'a:5:{s:10:"$userName$";s:31:"Имя пользователя";s:11:"$userEmail$";s:30:"Email Пользователя";s:13:"$productName$";s:33:"Название продукта";s:8:"$status$";s:12:"Статус";s:13:"$productLink$";s:32:"Ссылка на продукт";}'),
(4, 'ru', 'Создание пользователя', '<p style="font-family: arial; font-size: 13px; margin-top: 10px;">Здравствуйте, $user_name$!</p>\n<p style="font-family: arial; font-size: 13px; margin-top: 10px;">Поздравляем! Ваша регистрация прошла успешно.</p>\n<p style="font-family: arial; font-size: 13px; margin-top: 20px;">Данные для входа в магазин:</p>\n<div style="font-family: arial; font-size: 13px; margin-top: 10px;"><span style="color: #666;">Email адрес: </span>$user_email$</div>\n<div style="font-family: arial; font-size: 13px; margin-top: 10px;"><span style="color: #666;">Пароль: </span>$user_password$</div>', '<p><span>Создан пользователь $user_name$:</span><br /><span>С паролем: $user_password$</span><br /><span>Адресом: &nbsp;$<span>user_</span>address$</span><br /><span>Email пользователя: $user_email$</span><br /><span>Телефон пользователя: $user_phone$</span></p>', '<p>Шаблон письма на создание пользователя</p>', 'a:5:{s:11:"$user_name$";s:31:"Имя пользователя";s:15:"$user_password$";s:12:"Пароль";s:14:"$user_address$";s:12:"Адресс";s:12:"$user_email$";s:5:"Email";s:12:"$user_phone$";s:14:"Телефон";}'),
(5, 'ru', 'Восстановление пароля', '<p><span>Здравствуйте!</span><br /><br /><span>На сайте $webSiteName$ создан запрос на восстановление пароля для Вашего аккаунта.</span><br /><br /><span>Для завершения процедуры восстановления пароля перейдите по ссылке $resetPasswordUri$</span><br /><br /><span>Ваш новый пароль для входа: $password$</span><br /><br /><span>Если это письмо попало к Вам по ошибке просто проигнорируйте его.</span><br /><br /><span>При возникновении любых вопросов, обращайтесь по телефонам:</span><br /><br /><span>(012)&nbsp; 345-67-89 , (012)&nbsp; 345-67-89</span><br /><br /><span>---</span><br /><br /><span>С уважением,</span><br /><br /><span>сотрудники службы продаж $webSiteName$</span></p>', '', 'Шаблон письма на  восстановление пароля', 'a:5:{s:13:"$webSiteName$";s:17:"Имя сайта";s:18:"$resetPasswordUri$";s:59:"Ссылка на восстановления пароля";s:10:"$password$";s:12:"Пароль";s:5:"$key$";s:8:"Ключ";s:16:"$webMasterEmail$";s:54:"Email сотрудников службы продаж";}'),
(6, 'ru', 'Смена пароля', '<p style="font-family: arial; font-size: 13px; margin-top: 10px;">Здравствуйте, $user_name$!</p>\n<p style="font-family: arial; font-size: 13px; margin-top: 10px;">Вы успешно изменили пароль</p>\n<p style="font-family: arial; font-size: 13px; margin-top: 20px;">Ваш новый пароль для входа: $password$</p>', '', '<p>Шаблон письма изменения пароля</p>', 'a:2:{s:11:"$user_name$";s:31:"Имя пользователя";s:10:"$password$";s:23:"Новый пароль";}'),
(7, 'ru', 'Изменение цены', '<p>Цена на $name$ за которым вы следите на сайте $server$ изменилась.</p>\n<p><a title="Посмотреть список слежения" href="$list_url_look$">Посмотреть список слежения</a></p>\n<p><a title="Отписатся от слежения" href="$delete_list_url_look$">Отписатся от слежения</a></p>', '<p>&nbsp;</p>\n<div id="dc_vk_code">&nbsp;</div>', '<p>Изменение цены</p>\n<div id="dc_vk_code" style="display: none;">&nbsp;</div>', ''),
(7, 'ua', 'Ціна змінилася', '<p>Ціна на $name$ за яким Ви слідкуєте на сайті $server$ змінилася.<br /> <a title="Переглянути список слідкувань" href="$list_url_look$">Переглянути список слідкувань</a><br /> <a title="Відписатися від слідкування" href="$delete_list_url_look$">Відписатися від слідкування</a></p>\n<div id="dc_vk_code"  none;">&nbsp;</div>', '<p>&nbsp;</p>\n<div id="dc_vk_code">&nbsp;</div>', '<p>Слідкування за ціною</p>\n<div id="dc_vk_code" style="display: none;">&nbsp;</div>', ''),
(8, 'ru', 'Список желаний', '<p style="font-family: arial; font-size: 13px; margin-top: 10px;">Здравствуйте, $userName$!</p>\n<p style="font-family: arial; font-size: 13px; margin-top: 10px;">Вы создали список желаний $wishName$</p>\n<p style="font-family: arial; font-size: 13px; margin-top: 10px;">Ссылка на просмотр списка желаний <a href="$wishLink$" target="_blank">$wishLink$</a></p>', '<p>Пользователь <span>$userName$ создал список желаний - $wishName$.<br /></span></p>\n<p><span><span> </span></span></p>', '<p><span>Уведомление о создании списка желаний</span></p>', 'a:4:{s:10:"$userName$";s:31:"Имя пользователя";s:10:"$wishName$";s:29:"Название списка";s:10:"$wishLink$";s:30:"Ссилка на список";s:15:"$wishListViews$";s:54:"Количество просмотров списка";}'),
(9, 'ru', 'Заказ звонка', '<p style="font-family: arial; font-size: 13px; margin-top: 10px;">Здравствуйте, $userName$!</p>\n<p style="font-family: arial; font-size: 13px; margin-top: 10px;">Вы заказали звонок в нашей компании<br />Менеджеры нашего магазина вскоре свяжутся с Вами.</p>\n<p style="font-family: arial; font-size: 13px; margin-top: 20px;">Вы указали следующие контактные данные:</p>\n<div style="font-family: arial; font-size: 13px; margin-top: 10px;"><span style="color: #666;">Телефон: </span>$userPhone$</div>\n<div style="font-family: arial; font-size: 13px; margin-top: 10px;"><span style="color: #666;">Коментарий: </span>$userComment$</div>', '<p style="font-family: arial; font-size: 13px; margin-top: 10px;">Новий запрос о Заказе дзвонка от $userName$</p>\n<div style="font-family: arial; font-size: 13px; margin-top: 10px;"><span style="color: #666;">Дата колбека: </span>$dateCreated$</div>\n<div style="font-family: arial; font-size: 13px; margin-top: 10px;"><span style="color: #666;">Телефон пользователя: </span>$userPhone$</div>\n<div style="font-family: arial; font-size: 13px; margin-top: 10px;"><span style="color: #666;">Коментарий пользователя: </span>$userComment$</div>', '<p>Шаблон заказа звонока</p>', 'a:6:{s:16:"$callbackStatus$";s:27:"Статус колбека";s:15:"$callbackTheme$";s:23:"Тема колбека";s:10:"$userName$";s:69:"Имя пользователя запросившего звонок";s:13:"$dateCreated$";s:23:"Дата колбека";s:13:"$userComment$";s:63:" Комментарии пользователя колбека";s:11:"$userPhone$";s:90:"Номер телефона пользователя запросившего колбек";}');

-- --------------------------------------------------------

--
-- Структура таблицы `mod_sample_settings`
--

DROP TABLE IF EXISTS `mod_sample_settings`;
CREATE TABLE IF NOT EXISTS `mod_sample_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mod_sample_settings`
--

INSERT INTO `mod_sample_settings` (`id`, `name`, `value`) VALUES
(1, 'mailTo', 'admin@site.com'),
(2, 'useEmailNotification', 'TRUE'),
(3, 'key', 'UUUsssTTTeee');

-- --------------------------------------------------------

--
-- Структура таблицы `mod_seo`
--

DROP TABLE IF EXISTS `mod_seo`;
CREATE TABLE IF NOT EXISTS `mod_seo` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) DEFAULT NULL,
  `settings` text
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mod_seo`
--

INSERT INTO `mod_seo` (`id`, `locale`, `settings`) VALUES
(1, 'ru', 'a:39:{s:9:"cms_token";s:32:"2e9e9193fe9802d01ecef7fc1ff0cf0c";s:15:"productTemplate";s:0:"";s:19:"productTemplateDesc";s:0:"";s:24:"productTemplateDescCount";s:0:"";s:18:"productTemplateKey";s:0:"";s:16:"categoryTemplate";s:0:"";s:20:"categoryTemplateDesc";s:0:"";s:25:"categoryTemplateDescCount";s:0:"";s:27:"categoryTemplateBrandsCount";s:0:"";s:19:"categoryTemplateKey";s:0:"";s:34:"categoryTemplatePaginationTemplate";s:0:"";s:19:"subcategoryTemplate";s:0:"";s:23:"subcategoryTemplateDesc";s:0:"";s:28:"subcategoryTemplateDescCount";s:0:"";s:30:"subcategoryTemplateBrandsCount";s:0:"";s:22:"subcategoryTemplateKey";s:0:"";s:37:"subcategoryTemplatePaginationTemplate";s:0:"";s:13:"brandTemplate";s:0:"";s:17:"brandTemplateDesc";s:0:"";s:23:"brandPaginationTemplate";s:0:"";s:22:"brandTemplateDescCount";s:0:"";s:16:"brandTemplateKey";s:0:"";s:18:"brandsListTemplate";s:0:"";s:22:"brandsListTemplateDesc";s:0:"";s:21:"brandsListTemplateKey";s:0:"";s:14:"searchTemplate";s:0:"";s:18:"searchTemplateDesc";s:0:"";s:17:"searchTemplateKey";s:0:"";s:17:"pageTemplateTitle";s:0:"";s:16:"pageTemplateDesc";s:0:"";s:21:"pageTemplateDescCount";s:0:"";s:15:"pageTemplateKey";s:0:"";s:25:"pageCategoryTemplateTitle";s:0:"";s:24:"pageCategoryTemplateDesc";s:0:"";s:29:"pageCategoryTemplateDescCount";s:0:"";s:23:"pageCategoryTemplateKey";s:0:"";s:38:"pageCategoryTemplatePaginationTemplate";s:0:"";s:12:"smart_filter";a:11:{s:8:"category";s:1:"0";s:2:"h1";s:0:"";s:10:"meta_title";s:0:"";s:13:"meta_keywords";s:0:"";s:16:"meta_description";s:0:"";s:2:"id";s:0:"";s:4:"type";s:0:"";s:9:"entity_id";s:0:"";s:11:"category_id";s:0:"";s:6:"active";s:2:"on";s:8:"seo_text";s:0:"";}s:8:"category";s:1:"0";}');

-- --------------------------------------------------------

--
-- Структура таблицы `mod_seo_inflect`
--

DROP TABLE IF EXISTS `mod_seo_inflect`;
CREATE TABLE IF NOT EXISTS `mod_seo_inflect` (
  `id` int(11) NOT NULL,
  `original` varchar(250) NOT NULL,
  `inflection_id` int(11) NOT NULL,
  `inflected` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mod_seo_products`
--

DROP TABLE IF EXISTS `mod_seo_products`;
CREATE TABLE IF NOT EXISTS `mod_seo_products` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `locale` varchar(5) DEFAULT NULL,
  `settings` text,
  `active` tinyint(4) DEFAULT NULL,
  `empty_meta` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mod_shop_discounts`
--

DROP TABLE IF EXISTS `mod_shop_discounts`;
CREATE TABLE IF NOT EXISTS `mod_shop_discounts` (
  `id` int(11) NOT NULL,
  `key` varchar(25) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `max_apply` int(11) DEFAULT NULL,
  `count_apply` int(11) DEFAULT NULL,
  `date_begin` int(11) DEFAULT NULL,
  `date_end` int(11) DEFAULT NULL,
  `type_value` tinyint(4) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `type_discount` varchar(15) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mod_shop_discounts_i18n`
--

DROP TABLE IF EXISTS `mod_shop_discounts_i18n`;
CREATE TABLE IF NOT EXISTS `mod_shop_discounts_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `name` varchar(150) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mod_shop_news`
--

DROP TABLE IF EXISTS `mod_shop_news`;
CREATE TABLE IF NOT EXISTS `mod_shop_news` (
  `content_id` int(11) NOT NULL,
  `shop_categories_ids` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mod_sitemap_blocked_urls`
--

DROP TABLE IF EXISTS `mod_sitemap_blocked_urls`;
CREATE TABLE IF NOT EXISTS `mod_sitemap_blocked_urls` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `robots_check` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mod_sitemap_changefreq`
--

DROP TABLE IF EXISTS `mod_sitemap_changefreq`;
CREATE TABLE IF NOT EXISTS `mod_sitemap_changefreq` (
  `id` int(11) NOT NULL,
  `main_page_changefreq` varchar(255) DEFAULT NULL,
  `pages_changefreq` varchar(255) DEFAULT NULL,
  `product_changefreq` varchar(255) DEFAULT NULL,
  `categories_changefreq` varchar(255) DEFAULT NULL,
  `products_categories_changefreq` varchar(255) DEFAULT NULL,
  `products_sub_categories_changefreq` varchar(255) DEFAULT NULL,
  `brands_changefreq` varchar(255) DEFAULT NULL,
  `sub_categories_changefreq` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mod_sitemap_changefreq`
--

INSERT INTO `mod_sitemap_changefreq` (`id`, `main_page_changefreq`, `pages_changefreq`, `product_changefreq`, `categories_changefreq`, `products_categories_changefreq`, `products_sub_categories_changefreq`, `brands_changefreq`, `sub_categories_changefreq`) VALUES
(1, 'weekly', 'weekly', 'weekly', 'weekly', 'weekly', 'weekly', 'weekly', 'weekly');

-- --------------------------------------------------------

--
-- Структура таблицы `mod_sitemap_priorities`
--

DROP TABLE IF EXISTS `mod_sitemap_priorities`;
CREATE TABLE IF NOT EXISTS `mod_sitemap_priorities` (
  `id` int(11) NOT NULL,
  `main_page_priority` float DEFAULT '1',
  `cats_priority` float DEFAULT '1',
  `pages_priority` float DEFAULT '1',
  `sub_cats_priority` float DEFAULT '1',
  `products_priority` float DEFAULT '1',
  `products_categories_priority` float DEFAULT '1',
  `products_sub_categories_priority` float DEFAULT '1',
  `brands_priority` float DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mod_sitemap_priorities`
--

INSERT INTO `mod_sitemap_priorities` (`id`, `main_page_priority`, `cats_priority`, `pages_priority`, `sub_cats_priority`, `products_priority`, `products_categories_priority`, `products_sub_categories_priority`, `brands_priority`) VALUES
(1, 1, 0.8, 0.9, 0.7, 0.4, 0.6, 0.5, 0.3);

-- --------------------------------------------------------

--
-- Структура таблицы `mod_stats_attendance`
--

DROP TABLE IF EXISTS `mod_stats_attendance`;
CREATE TABLE IF NOT EXISTS `mod_stats_attendance` (
  `id` int(11) NOT NULL,
  `id_user` int(5) NOT NULL,
  `type_id` int(2) NOT NULL,
  `id_entity` int(6) NOT NULL,
  `time_add` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3258 DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Структура таблицы `mod_stats_attendance_robots`
--

DROP TABLE IF EXISTS `mod_stats_attendance_robots`;
CREATE TABLE IF NOT EXISTS `mod_stats_attendance_robots` (
  `id` int(11) NOT NULL,
  `id_robot` int(5) NOT NULL,
  `type_id` int(2) NOT NULL,
  `id_entity` int(6) NOT NULL,
  `time_add` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mod_stats_search`
--

DROP TABLE IF EXISTS `mod_stats_search`;
CREATE TABLE IF NOT EXISTS `mod_stats_search` (
  `key` varchar(70) DEFAULT NULL,
  `date` int(11) DEFAULT NULL,
  `ac` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mod_stats_settings`
--

DROP TABLE IF EXISTS `mod_stats_settings`;
CREATE TABLE IF NOT EXISTS `mod_stats_settings` (
  `setting` varchar(70) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mod_stats_settings`
--

INSERT INTO `mod_stats_settings` (`setting`, `value`) VALUES
('save_search_results', '1'),
('save_users_attendance', '1');

-- --------------------------------------------------------

--
-- Структура таблицы `mod_wish_list`
--

DROP TABLE IF EXISTS `mod_wish_list`;
CREATE TABLE IF NOT EXISTS `mod_wish_list` (
  `id` int(11) NOT NULL,
  `title` varchar(254) NOT NULL,
  `description` text,
  `access` enum('public','private','shared') NOT NULL DEFAULT 'shared',
  `user_id` int(11) NOT NULL,
  `review_count` int(11) NOT NULL DEFAULT '0',
  `hash` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mod_wish_list_products`
--

DROP TABLE IF EXISTS `mod_wish_list_products`;
CREATE TABLE IF NOT EXISTS `mod_wish_list_products` (
  `id` int(11) NOT NULL,
  `wish_list_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `comment` text
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Структура таблицы `mod_wish_list_users`
--

DROP TABLE IF EXISTS `mod_wish_list_users`;
CREATE TABLE IF NOT EXISTS `mod_wish_list_users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(254) DEFAULT NULL,
  `user_image` text,
  `user_birthday` int(11) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mod_ymarket`
--

DROP TABLE IF EXISTS `mod_ymarket`;
CREATE TABLE IF NOT EXISTS `mod_ymarket` (
  `id` int(11) NOT NULL,
  `categories` text NOT NULL,
  `adult` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `mod_ymarket`
--

INSERT INTO `mod_ymarket` (`id`, `categories`, `adult`) VALUES
(1, '', '0');


-- --------------------------------------------------------

--
-- Структура таблицы `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE IF NOT EXISTS `rating` (
  `id` int(11) NOT NULL,
  `id_type` varchar(25) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `votes` int(11) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `search`
--

DROP TABLE IF EXISTS `search`;
CREATE TABLE IF NOT EXISTS `search` (
  `id` int(11) NOT NULL,
  `hash` varchar(264) NOT NULL,
  `datetime` int(11) NOT NULL,
  `where_array` text NOT NULL,
  `select_array` text NOT NULL,
  `table_name` varchar(100) NOT NULL,
  `order_by` text NOT NULL,
  `row_count` int(11) NOT NULL,
  `total_rows` int(11) NOT NULL,
  `ids` text NOT NULL,
  `search_title` varchar(250) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL,
  `s_name` varchar(50) NOT NULL,
  `create_keywords` varchar(25) NOT NULL,
  `create_description` varchar(25) NOT NULL,
  `create_cat_keywords` varchar(25) NOT NULL,
  `create_cat_description` varchar(25) NOT NULL,
  `add_site_name` int(1) NOT NULL,
  `add_site_name_to_cat` int(1) NOT NULL,
  `delimiter` varchar(5) NOT NULL,
  `editor_theme` varchar(10) NOT NULL,
  `site_template` varchar(50) NOT NULL,
  `site_offline` varchar(5) NOT NULL,
  `google_analytics_id` varchar(40) DEFAULT NULL,
  `main_type` varchar(50) NOT NULL,
  `main_page_id` int(11) NOT NULL,
  `main_page_cat` text NOT NULL,
  `main_page_module` varchar(50) NOT NULL,
  `sidepanel` varchar(5) NOT NULL,
  `lk` varchar(250) DEFAULT NULL,
  `lang_sel` varchar(15) NOT NULL DEFAULT 'russian_lang',
  `google_webmaster` varchar(200) DEFAULT NULL,
  `yandex_webmaster` varchar(200) DEFAULT NULL,
  `yandex_metric` varchar(200) NOT NULL,
  `ss` varchar(255) NOT NULL,
  `cat_list` varchar(10) NOT NULL,
  `text_editor` varchar(30) NOT NULL,
  `siteinfo` text NOT NULL,
  `update` text,
  `backup` text,
  `robots_status` int(1) NOT NULL,
  `robots_settings_status` smallint(1) NOT NULL DEFAULT '0',
  `robots_settings` text NOT NULL,
  `google_analytics_ee` int(1) NOT NULL DEFAULT '1',
  `www_redirect` varchar(100) NOT NULL,
  `users_registration_role_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `s_name`, `create_keywords`, `create_description`, `create_cat_keywords`, `create_cat_description`, `add_site_name`, `add_site_name_to_cat`, `delimiter`, `editor_theme`, `site_template`, `site_offline`, `google_analytics_id`, `main_type`, `main_page_id`, `main_page_cat`, `main_page_module`, `sidepanel`, `lk`, `lang_sel`, `google_webmaster`, `yandex_webmaster`, `yandex_metric`, `ss`, `cat_list`, `text_editor`, `siteinfo`, `update`, `backup`, `robots_status`, `robots_settings_status`, `robots_settings`, `google_analytics_ee`, `www_redirect`, `users_registration_role_id`) VALUES
(2, 'main', 'auto', 'auto', '0', '0', 1, 1, '/', '0', 'unishop', 'no', '', 'module', 124, '64', 'shop', '', '', 'ru_RU', '', '', '', '', 'yes', 'tinymce', 'a:5:{s:13:"siteinfo_logo";s:8:"logo.png";s:16:"siteinfo_favicon";s:11:"favicon.ico";s:2:"ru";a:5:{s:20:"siteinfo_companytype";s:82:"© 2015-2016, Интернет-магазин. Все права защищены.";s:16:"siteinfo_address";s:31:"ул. Набережная 22а";s:18:"siteinfo_mainphone";s:15:"0 800 567-43-21";s:19:"siteinfo_adminemail";s:19:"info@fullmarket.com";s:8:"contacts";a:8:{s:5:"Skype";s:10:"fullmarket";s:5:"Email";s:19:"info@fullmarket.com";s:7:"vk-link";s:1:"#";s:7:"fb-link";s:1:"#";s:11:"google-link";s:1:"#";s:8:"addphone";s:15:"0 800 567-43-21";s:3:"map";s:375:"<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d235195.97371835003!2d-43.44970300000001!3d-22.91569115!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x997efe4224b50b%3A0xf988253c846c59ee!2z0KDQuNC-LdC00LUt0JbQsNC90LXQudGA0L4sINCR0YDQsNC30LjQu9C40Y8!5e0!3m2!1sru!2sua!4v1429280340531" width="100%" height="350" frameborder="0" style="border:0"></iframe>";s:8:"schedule";s:45:"Пн–Сб 09:00–20:00, Вс 09:00–17:00";}}s:2:"en";a:5:{s:8:"contacts";a:8:{s:5:"Skype";s:0:"";s:5:"Email";s:0:"";s:7:"vk-link";s:1:"#";s:7:"fb-link";s:1:"#";s:8:"addphone";s:0:"";s:3:"map";s:0:"";s:11:"google-link";s:1:"#";s:8:"schedule";N;}s:20:"siteinfo_companytype";s:0:"";s:16:"siteinfo_address";s:0:"";s:18:"siteinfo_mainphone";s:0:"";s:19:"siteinfo_adminemail";s:0:"";}s:2:"ua";a:5:{s:8:"contacts";a:8:{s:5:"Skype";s:0:"";s:5:"Email";s:0:"";s:7:"vk-link";s:1:"#";s:7:"fb-link";s:1:"#";s:8:"addphone";s:0:"";s:3:"map";s:0:"";s:11:"google-link";s:1:"#";s:8:"schedule";N;}s:20:"siteinfo_companytype";s:0:"";s:16:"siteinfo_address";s:0:"";s:18:"siteinfo_mainphone";s:0:"";s:19:"siteinfo_adminemail";s:0:"";}}', '', NULL, 0, 0, '', 0, 'without', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `settings_i18n`
--

DROP TABLE IF EXISTS `settings_i18n`;
CREATE TABLE IF NOT EXISTS `settings_i18n` (
  `id` int(11) NOT NULL,
  `lang_ident` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `short_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `keywords` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `settings_i18n`
--

INSERT INTO `settings_i18n` (`id`, `lang_ident`, `name`, `short_name`, `description`, `keywords`) VALUES
(1, 3, 'Unishop - Бесплатный интернет магазин онлайн покупок', 'Unishop', 'Unishop - Бесплатный интернет магазин', 'бесплатный интернет магазин онлайн покупок');


-- --------------------------------------------------------

--
-- Структура таблицы `shop_brands`
--

DROP TABLE IF EXISTS `shop_brands`;
CREATE TABLE IF NOT EXISTS `shop_brands` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `position` smallint(6) NOT NULL,
  `created` int(11) NOT NULL,
  `updated` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=294 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_brands`
--

INSERT INTO `shop_brands` (`id`, `url`, `image`, `position`, `created`, `updated`) VALUES
(293, 'lovecarry', 'lovecarry.jpeg', 17, 1427880525, 1442489317),
(292, 'veres', 'veres.gif', 18, 1427807367, 1427807367),
(291, 'sadko', 'sadko.jpg', 16, 1427798454, 1427798454),
(290, 'stihl', NULL, 15, 1427797960, 1441111025),
(289, 'osprey', 'osprey.jpg', 14, 1427735369, 1441041552),
(288, 'adidas', 'adidas.png', 13, 1427728509, 1427728544),
(287, 'taranko', 'taranko.png', 12, 1427714634, 1427714638),
(286, 'miromark', 'miromark.png', 11, 1427714056, 1427714253),
(285, 'black-red-white', 'black-red-white.jpg', 10, 1427713950, 1427713957),
(284, 'lenovo', 'lenovo.png', 9, 1425570370, 1425570372),
(283, 'lg', 'lg.png', 8, 1425570326, 1425570343),
(282, 'samsung', 'samsung.png', 7, 1425570285, 1425570303),
(281, 'sony', 'sony.png', 6, 1425570251, 1425570271),
(280, 'htc', 'htc.jpg', 5, 1425570207, 1425570235),
(279, 'koss', 'koss.png', 4, 1425570172, 1425570193),
(278, 'goodram', 'goodram.jpg', 3, 1425570134, 1425570159),
(277, 'asus', 'asus.png', 2, 1425570097, 1425570119),
(276, 'apple', 'apple.png', 1, 1425570065, 1425570420),
(275, 'impression', 'impression.jpg', 0, 1425570041, 1425570045);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_brands_i18n`
--

DROP TABLE IF EXISTS `shop_brands_i18n`;
CREATE TABLE IF NOT EXISTS `shop_brands_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `name` varchar(500) NOT NULL,
  `description` text,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_brands_i18n`
--

INSERT INTO `shop_brands_i18n` (`id`, `locale`, `name`, `description`, `meta_title`, `meta_description`, `meta_keywords`) VALUES
(279, 'ru', 'Koss', '<p>Американская компания KOSS выпускает наушники и гарнитуры, которые на протяжении вот уже 50 лет пользуются заслуженной популярностью во всем мире.</p>\n<p>Первоклассный живой звук, удобство эксплуатации и стильный дизайн &ndash; вот основные преимущества продукции KOSS, будь то гарнитура или наушники. Компания выпускает надёжные устройства, предоставляя на них бессрочную гарантию. Разработчики KOSS стремятся создавать такие наушники и гарнитуры, которые предоставляют возможность наслаждаться творчеством других и творить самим.</p>', '', '', ''),
(278, 'ru', 'Goodram', '<p>Марка GOODRAM была создана в 2003 году компанией АО &laquo;Wilk Elektronik&raquo;. Однако, её история началась намного раньше, а именно в 1991 году, когда в городе Тыхи была основана наша фирма. С самого начала основной специализацией нашей деятельности были и остаются различные виды компьютерной памяти &ndash; вначале RAM, а с 2005 года также Flash.</p>', '', '', ''),
(276, 'ru', 'Apple', '<p>корпорация, производитель персональных и планшетных компьютеров, аудиоплееров, телефонов, программного обеспечения. Один из пионеров в области персональных компьютеров и современных многозадачных операционных систем с графическим интерфейсом.</p>\n<p>Благодаря инновационным технологиям и эстетичному дизайну, корпорация Apple создала уникальную репутацию, сравнимую с культом, в индустрии потребительской электроники. На 2014 год компания занимает первое место в мире по рыночной капитализации.</p>', '', '', ''),
(277, 'ru', 'Asus', '<p>Компания ASUS уделяет много внимания вопросам сохранения окружающей среды. Очень важно внедрить экологические принципы в каждом аспекте деятельности компании, поэтому в ASUS была разработана концепция Green ASUS, охватывающая важные экологические вопросы во всем комплексе &ndash; от административных бизнес-процессов до производства, от процессов разработки экологичной продукции до обучения персонала.</p>\n<p>ASUS первой в мире отказалась от использования свинца в производстве материнских плат и первой представила Full HD монитор, созданный с использованием безгалогенных технологий. Она является первым в мире производителем ноутбуков, получившим сертификаты Environmental Product Declaration (EPD) и EU Flower, а также первым производителем IT-оборудования из ведущей десятки, получившим сертификат Eco Mark (Япония).</p>', '', '', ''),
(275, 'ru', 'Impression', '<p>Контроль качества &mdash; главный принцип производства. Каждый готовый компьютер проходит тестирование в термокамере от 6 до 18 часов, что позволяет выявить большинство возможных дефектов. Для определения полной работоспособности компьютера проводится его тестирование с разной нагрузкой в течение 12-ти и более часов. Полученные результаты тестов хранятся в базе данных фабрики в течение всего гарантийного срока (2-3 года). Кроме того, после всех тестов ОТК выборочно тестирует 10% упакованных систем на работоспособность и полноту комплектации. Еще 5% компьютеров проходят выборочную полномасштабную проверку с переустановкой системы.</p>', '', '', ''),
(293, 'ru', 'Love&Carryp', 'Компания Love &amp; Carry ведет свою историю с 2009 г. Именно тогда на свет появилась девочка Лия, которая изменила мир нашей молодой и творческой семьи. Вместе с появлением долгожданной крохи, родилась и мечта &ndash; жить полной жизнью, беспрепятственно продолжать познавать мир, но уже в полной гармонии с малышом. Именно такие ощущения нам подарили слинги.', '', '', ''),
(292, 'ru', 'Veres', '<p>Заботясь о своей семье, мы выбираем только лучшее: натуральные продукты, качественную одежду, комфортную и надежную мебель.</p>\n<p>Отечественный производитель мебели и текстиля для новорожденных &laquo;Компания &laquo;ВЕРЕС&raquo; вместе с Вами обеспечит уют и комфорт Вашему ребенку с первых дней его жизни.</p>', '', '', ''),
(291, 'ru', 'SADKO', '<p>ТМ &laquo;SADKO&raquo; выпускает широкий ассортимент техники для сада и огорода, которая уверенно завоевывает известность и получает все большее признание среди потребителей. Современные технологии, отличное качество и конкурентоспособная цена позволяет нашей продукции достойно соперничать с именитыми марками.</p>\n<p>Продукция &laquo;SADKO&raquo; изготовляется на современных заводах, оснащенных компьютеризированными линиями, использующими самые передовые технологии сборки. Все заводы сертифицированы по ISO 9001. На предприятиях внедрено и успешно осуществляется эффективное управление качеством на всех стадиях производства. Это гарантия того, что завод производит только высококачественную продукцию.</p>', '', '', ''),
(290, 'ru', 'Stihl', 'Андреас Штиль, закончив в 1926 году факультет машиностроения в Штутгарте, основал фирму &laquo;A. Stihl Ingenieursb&uuml;ro&raquo; по производству паровых котлов и стиральных машин. Благодаря этому предприниматель заработал свои первые деньги для создания мотопилы и спустя некоторое время вывел товар на рынок. Первая пила весила 48 кг и должна была обслуживаться двумя работниками в силу своего немаленького веса. Эти пилы в больших количествах экспортировались в Россию, Канаду и США.', '', '', ''),
(288, 'ru', 'Adidas', 'Hемецкий промышленный концерн, специализирующийся на выпуске спортивной обуви, одежды и инвентаря. Генеральный директор компании - Герберт Хайнер. В настоящий момент компания ответственна за дистрибуцию продукции компаний Adidas, Reebok, Rockport, Y-3, RBK, CCM Hockey, а также Taylor-Made Golf.', '', '', ''),
(289, 'ru', 'Osprey', 'Osprey - американский производитель, который на протяжении 40-летней истории специализируется на производстве рюкзаков, опираясь на инновации, внимание к деталям, качество и авторский дизайн владельца компании.', '', '', ''),
(287, 'ru', 'Taranko', '<p>В производстве мебели фабрика Taranko использует только передовые современные технологии и натуральные экологически чистые материалы. Это позволяет создавать шедевры, которые придутся по вкусу настоящим гурманам и ценителям классической мебели. Также поражает чрезвычайно широкий выбор этой мебели. Компания Taranko производит около 30 коллекций мебели, которые отличаются друг от друга стилем и дизайном</p>', '', '', ''),
(286, 'ru', 'MiroMark', '<p>Фабрика регулярно внедряет в производство инновационные технологии своих иностранных коллег. Например, метод напылительного покрытия мебели высококачественными полиуретановыми красками позаимствован у итальянской фирмы с более чем 40-летним опытом работы I.C.A. (IndustriaChimicaAdriatica). Это всемирно известный авторитетный производитель красок и лаков для дерева. Дизайн для большинства мебельных серий &laquo;Миро-Марк&raquo; разрабатывают итальянские художники-конструкторы.</p>', '', '', ''),
(285, 'ru', 'Black Red White', '<p>Компания Black Red White SA была основана в 1989. На сегодняшний день - это крупнейший производитель мебели в Польше. Продукция компании экспортируется в более чем 20 стран мира, в том числе в США, Канаду, Германию, Австрию, Бельгию, Норвегию, Швецию, Израиль, Хорватию, Болгарию, Грецию, Венгрию, Словакию, Чехию, Румынию, Боснию и Герцеговину, Россию, Белоруссию, Литву, Латвию, Эстонию, Казахстан и Украина.</p>\n<p>Мебель, представленная брендом Black Red White, рассчитанные на потребителя со средним уровнем достатка.</p>', '', '', ''),
(284, 'ru', 'Lenovo', '<p>Компания основана в 1984 году группой китайских учёных на средства Китайской академии наук. Первоначально компания носила название New Technology Developer Incorporated (спустя два года — Legend) и специализировалась на поставках компьютерной техники в Китай, а также на разработке кодировок для иероглифов.</p>\n\n<p>В декабре 2004 года было заключено широкое многолетнее соглашение между корпорацией IBM и компанией Lenovo. В соответствии с этим соглашением компания Lenovo выкупила IBM Personal Systems Group — подразделение по производству персональных компьютеров за $1,25 млрд (сделка была завершена в мае 2005 года). По условиям сделки Lenovo могла использовать бренд IBM до 2010 года, а после этой даты продукты компании выпускаются только под маркой Lenovo. В соответствии с заключённым альянсом[1] обе компании взаимно дополняют друг друга и могут предлагать клиентам через свои дистрибьюторские каналы продукты обеих компаний: как IBM, так и Lenovo.</p>', '', '', ''),
(283, 'ru', 'LG', '<p> южнокорейская компания, один из крупнейших мировых производителей потребительской электроники и бытовой техники. Входит в состав конгломерата LG Group. Главный офис компании LG Electronics находится в Сеуле, Республика Корея, 120 представительств компании открыты в 95 странах мира. По состоянию на 2010 год сотрудниками компании являлись 90 578 человек. Общий оборот компании по состоянию на 2010 составил 48,2 млрд долларов.</p>', '', '', ''),
(281, 'ru', 'Sony', '<p>Миссия Sony &mdash; вдохновлять вас на новые открытия и радовать достижениями.</p>\n<p>Наша приверженность технологиям, созданию контента и разнообразных сервисов и наше неиссякаемое стремление к инновациям помогают нам придумывать удивительные технологии и развлечения, которые всегда были визитной карточкой Sony. Мы стоим у истоков создания новой культуры и уникального опыта.</p>', '', '', ''),
(282, 'ru', 'Samsung', '<p>Из маленькой торговой компании Samsung превратилась в корпорацию мирового класса, бизнес которой охватывает прогрессивные технологии, производство полупроводниковых устройств, строительство небоскребов и заводов, нефтехимию, моду, медицину, финансы, гостиничное дело и многое другое. Наши открытия, изобретения и инновационные продукты позволили нам стать лидером в этих отраслях, постоянно продвигая их вперед.</p>', '', '', ''),
(280, 'ru', 'HTC', '<p>Основанная в 1997 году компания HTC зарекомендовала себя в качестве "работающего за кадром" дизайнера и производителя многих из популярных мобильных устройств, выпускаемых на рынок под торговой маркой производителя оборудования.</p>\n<p>Начиная с 2007 года мы регулярно представляли многие одобренные экспертами мобильные устройства под нашей собственной торговой маркой, и теперь наш портфолио включает смартфоны и планшеты с операционными системами Android и Windows Phone.</p>', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_callbacks`
--

DROP TABLE IF EXISTS `shop_callbacks`;
CREATE TABLE IF NOT EXISTS `shop_callbacks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `theme_id` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text,
  `date` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_callbacks_statuses`
--

DROP TABLE IF EXISTS `shop_callbacks_statuses`;
CREATE TABLE IF NOT EXISTS `shop_callbacks_statuses` (
  `id` int(11) NOT NULL,
  `is_default` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_callbacks_statuses`
--

INSERT INTO `shop_callbacks_statuses` (`id`, `is_default`) VALUES
(1, 1),
(3, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_callbacks_statuses_i18n`
--

DROP TABLE IF EXISTS `shop_callbacks_statuses_i18n`;
CREATE TABLE IF NOT EXISTS `shop_callbacks_statuses_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `text` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_callbacks_statuses_i18n`
--

INSERT INTO `shop_callbacks_statuses_i18n` (`id`, `locale`, `text`) VALUES
(1, 'ru', 'Новый'),
(1, 'ua', 'Новий'),
(3, 'ru', 'Обработан'),
(3, 'ua', 'Оброблений'),
(1, 'en', 'New'),
(3, 'en', 'Processed');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_callbacks_themes`
--

DROP TABLE IF EXISTS `shop_callbacks_themes`;
CREATE TABLE IF NOT EXISTS `shop_callbacks_themes` (
  `id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_callbacks_themes`
--

INSERT INTO `shop_callbacks_themes` (`id`, `position`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_callbacks_themes_i18n`
--

DROP TABLE IF EXISTS `shop_callbacks_themes_i18n`;
CREATE TABLE IF NOT EXISTS `shop_callbacks_themes_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `text` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_callbacks_themes_i18n`
--

INSERT INTO `shop_callbacks_themes_i18n` (`id`, `locale`, `text`) VALUES
(1, 'ru', 'Консультация'),
(1, 'ua', 'Перша тема'),
(1, 'en', 'Consultation');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_category`
--

DROP TABLE IF EXISTS `shop_category`;
CREATE TABLE IF NOT EXISTS `shop_category` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `full_path` varchar(1000) DEFAULT NULL,
  `full_path_ids` varchar(250) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `tpl` varchar(250) DEFAULT NULL,
  `order_method` int(11) DEFAULT NULL,
  `showsitetitle` int(11) DEFAULT NULL,
  `created` int(11) NOT NULL,
  `updated` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3034 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_category`
--

INSERT INTO `shop_category` (`id`, `url`, `parent_id`, `position`, `full_path`, `full_path_ids`, `active`, `external_id`, `image`, `tpl`, `order_method`, `showsitetitle`, `created`, `updated`) VALUES
(3014, 'elektronika', 0, 1, 'elektronika', 'a:0:{}', 1, NULL, '', 'section', 0, 0, 1425574384, 1455721804),
(3015, 'planshety', 3014, 8, 'elektronika/planshety', 'a:1:{i:0;i:3014;}', 1, NULL, '/uploads/shop/products/medium/71be5c23123fd09f5926416f82b1a09a.png', '', 0, 0, 1425574412, 1455044158),
(3017, 'audio', 3014, 9, 'elektronika/audio', 'a:1:{i:0;i:3014;}', 1, NULL, '', '', 0, 0, 1425574445, 1427706535),
(3018, 'noutbuki', 3023, 4, 'elektronika/kompiutery/noutbuki', 'a:2:{i:0;i:3014;i:1;i:3023;}', 1, NULL, '', '', 0, 0, 1425574535, 1425576032),
(3019, 'hranenie-dannyh', 3014, 2, 'elektronika/hranenie-dannyh', 'a:1:{i:0;i:3014;}', 1, NULL, '/uploads/shop/products/medium/7d481bc091cd04cc80e1e0e860bd24da.jpg', '', 0, 0, 1425574633, 1455044108),
(3023, 'kompiutery', 3014, 3, 'elektronika/kompiutery', 'a:1:{i:0;i:3014;}', 1, NULL, '/uploads/shop/products/medium/bf1eb38ffa4fdb8986e044770fbade36.jpg', '', 0, 0, 1425575999, 1455044130),
(3024, 'planshetnye-kompiutery', 3023, 5, 'elektronika/kompiutery/planshetnye-kompiutery', 'a:2:{i:0;i:3014;i:1;i:3023;}', 1, NULL, '', '', 0, 0, 1425576061, 1425576061),
(3025, 'pk-monobloki', 3023, 6, 'elektronika/kompiutery/pk-monobloki', 'a:2:{i:0;i:3014;i:1;i:3023;}', 1, NULL, '', '', 0, 0, 1425576131, 1425576131),
(3026, 'noutbuki2', 3014, 7, 'elektronika/noutbuki2', 'a:1:{i:0;i:3014;}', 1, NULL, '/uploads/shop/products/medium/81128bf3852c8e280ace44a03fc8361c.jpg', '', 0, 0, 1425649108, 1455044175),
(3027, 'mebel', 0, 11, 'mebel', 'a:0:{}', 1, NULL, '', '', 0, 0, 1427714685, 1455721809),
(3028, 'sportivnye-tovary', 0, 12, 'sportivnye-tovary', 'a:0:{}', 1, NULL, '', '', 0, 0, 1427725735, 1451995417),
(3029, 'dom-i-sad', 0, 13, 'dom-i-sad', 'a:0:{}', 1, NULL, '', '', 0, 0, 1427794940, 1427794940),
(3030, 'detskie-tovary', 0, 14, 'detskie-tovary', 'a:0:{}', 1, NULL, '', '', 0, 0, 1427805256, 1427805256),
(3031, 'odezhda', 0, 15, 'odezhda', 'a:0:{}', 1, NULL, '', '', 0, 0, 1427810960, 1427812712);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_category_i18n`
--

DROP TABLE IF EXISTS `shop_category_i18n`;
CREATE TABLE IF NOT EXISTS `shop_category_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `h1` varchar(255) NOT NULL,
  `description` text,
  `meta_desc` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_keywords` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_category_i18n`
--

INSERT INTO `shop_category_i18n` (`id`, `locale`, `name`, `h1`, `description`, `meta_desc`, `meta_title`, `meta_keywords`) VALUES
(3014, 'ru', 'Электроника', '', '<h1>Возникновению электроники предшествовало изобретение радио.</h1>\n<p>Поскольку радиопередатчики сразу же нашли применение (в первую очередь на кораблях и в военном деле), для них потребовалась элементная база, созданием и изучением которой и занялась электроника. Элементная база первого поколения была основана на электронных лампах. Соответственно получила развитие вакуумная электроника. Её развитию способствовало также изобретение телевидения и радаров, которые нашли широкое применение во время Второй мировой войны.</p>\n<p>Но электронные лампы обладали существенными недостатками. Это прежде всего большие размеры и высокая потребляемая мощность (что было критичным для переносных устройств). Поэтому начала развиваться твердотельная электроника, а в качестве элементной базы стали применять диоды и транзисторы.</p>', '', '', ''),
(3015, 'ru', 'Планшеты', '', '', '', '', ''),
(3017, 'ru', 'Аудио', '', '', '', '', ''),
(3018, 'ru', 'Ноутбуки', '', '', '', '', ''),
(3019, 'ru', 'Хранение данных', '', '', '', '', ''),
(3027, 'ru', 'Мебель', '', '', '', '', ''),
(3028, 'ru', 'Спортивные товары', '', '', '', '', ''),
(3029, 'ru', 'Дом и сад', '', '', '', '', ''),
(3023, 'ru', 'Компьютеры', '', '', '', '', ''),
(3024, 'ru', 'Планшетные компьютеры', '', '', '', '', ''),
(3025, 'ru', 'ПК моноблоки', '', '', '', '', ''),
(3026, 'ru', 'Ноутбуки', '', '', '', '', ''),
(3030, 'ru', 'Детские товары', '', '', '', '', ''),
(3031, 'ru', 'Одежда', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_comulativ_discount`
--

DROP TABLE IF EXISTS `shop_comulativ_discount`;
CREATE TABLE IF NOT EXISTS `shop_comulativ_discount` (
  `id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `discount` int(3) DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `date` int(15) DEFAULT NULL,
  `total` int(255) DEFAULT NULL,
  `total_a` int(255) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_currencies`
--

DROP TABLE IF EXISTS `shop_currencies`;
CREATE TABLE IF NOT EXISTS `shop_currencies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `main` tinyint(1) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL,
  `symbol` varchar(5) DEFAULT NULL,
  `rate` double(14,8) DEFAULT '1.00000000',
  `showOnSite` int(1) DEFAULT '0',
  `currency_template` varchar(500) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_currencies`
--

INSERT INTO `shop_currencies` (`id`, `name`, `main`, `is_default`, `code`, `symbol`, `rate`, `showOnSite`, `currency_template`) VALUES
(1, 'Dollars', 1, 1, 'USD', '$', 1.00000000, 0, 'a:5:{s:19:"Thousands_separator";s:1:" ";s:14:"Separator_tens";s:1:",";s:14:"Decimal_places";s:1:"2";s:4:"Zero";s:1:"1";s:6:"Format";s:2:"$#";}'),
(2, 'Рубль', 0, 0, 'RUB', 'руб', 56.00000000, 0, 'a:5:{s:19:"Thousands_separator";s:0:"";s:14:"Separator_tens";s:1:".";s:14:"Decimal_places";s:1:"0";s:4:"Zero";s:1:"1";s:6:"Format";s:7:"#руб";}'),
(4, 'евро', 0, 0, 'EUR', '€', 0.76920000, 0, 'a:5:{s:19:"Thousands_separator";s:0:"";s:14:"Separator_tens";s:1:".";s:14:"Decimal_places";s:1:"1";s:4:"Zero";s:1:"1";s:6:"Format";s:4:"#€";}');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_delivery_methods`
--

DROP TABLE IF EXISTS `shop_delivery_methods`;
CREATE TABLE IF NOT EXISTS `shop_delivery_methods` (
  `id` int(11) NOT NULL,
  `price` double(20,5) NOT NULL,
  `free_from` double(20,5) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `is_price_in_percent` tinyint(1) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `delivery_sum_specified` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_delivery_methods`
--

INSERT INTO `shop_delivery_methods` (`id`, `price`, `free_from`, `enabled`, `is_price_in_percent`, `position`, `delivery_sum_specified`) VALUES
(5, 80.00000, 5000.00000, 1, 0, NULL, 0),
(6, 0.00000, 0.00000, 1, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_delivery_methods_i18n`
--

DROP TABLE IF EXISTS `shop_delivery_methods_i18n`;
CREATE TABLE IF NOT EXISTS `shop_delivery_methods_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `name` varchar(500) NOT NULL,
  `description` text,
  `pricedescription` text,
  `delivery_sum_specified_message` varchar(500) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_delivery_methods_i18n`
--

INSERT INTO `shop_delivery_methods_i18n` (`id`, `locale`, `name`, `description`, `pricedescription`, `delivery_sum_specified_message`) VALUES
(5, 'ru', 'Адресная доставка курьером', '<p>Сроки доставки: 1-2 дня</p>', '', ''),
(6, 'ru', 'Доставка экспресс службой', '<p>Сроки доставки: 2-3 дня</p>', '', 'Цена согласно тарифам перевозчиков');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_delivery_methods_systems`
--

DROP TABLE IF EXISTS `shop_delivery_methods_systems`;
CREATE TABLE IF NOT EXISTS `shop_delivery_methods_systems` (
  `delivery_method_id` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_delivery_methods_systems`
--

INSERT INTO `shop_delivery_methods_systems` (`delivery_method_id`, `payment_method_id`) VALUES
(5, 1),
(5, 10),
(6, 2),
(6, 3),
(6, 9),
(6, 10),
(6, 11),
(15, 1),
(16, 1),
(16, 2),
(16, 3),
(20, 1),
(20, 3),
(21, 2),
(23, 3),
(24, 3),
(25, 1),
(25, 2),
(25, 3),
(25, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_discounts`
--

DROP TABLE IF EXISTS `shop_discounts`;
CREATE TABLE IF NOT EXISTS `shop_discounts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `date_start` int(11) DEFAULT NULL,
  `date_stop` int(11) DEFAULT NULL,
  `discount` varchar(11) DEFAULT NULL,
  `min_price` float(10,2) DEFAULT NULL,
  `max_price` float(10,2) DEFAULT NULL,
  `categories` text,
  `products` text,
  `description` text,
  `user_group` varchar(255) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_gifts`
--

DROP TABLE IF EXISTS `shop_gifts`;
CREATE TABLE IF NOT EXISTS `shop_gifts` (
  `id` int(11) NOT NULL,
  `gift_key` varchar(255) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  `espdate` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Структура таблицы `shop_kit`
--

DROP TABLE IF EXISTS `shop_kit`;
CREATE TABLE IF NOT EXISTS `shop_kit` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `position` smallint(6) NOT NULL,
  `only_for_logged` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_kit`
--

INSERT INTO `shop_kit` (`id`, `product_id`, `active`, `position`, `only_for_logged`) VALUES
(17, 17234, 1, 0, 0),
(16, 17241, 1, 0, 0),
(18, 17242, 1, 0, 0),
(19, 17235, 1, 0, 0),
(20, 17247, 1, 0, 0),
(21, 17240, 1, 0, 0),
(22, 17259, 1, 0, 0),
(23, 17258, 1, 0, 0),
(24, 17261, 1, 0, 0),
(25, 17260, 1, 0, 0),
(26, 17252, 1, 0, 0),
(27, 17248, 1, 0, 0),
(28, 17253, 1, 0, 0),
(29, 17241, 1, 1, 0),
(30, 17241, 1, 2, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_kit_product`
--

DROP TABLE IF EXISTS `shop_kit_product`;
CREATE TABLE IF NOT EXISTS `shop_kit_product` (
  `product_id` int(11) NOT NULL,
  `kit_id` int(11) NOT NULL,
  `discount` varchar(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_kit_product`
--

INSERT INTO `shop_kit_product` (`product_id`, `kit_id`, `discount`) VALUES
(17234, 16, '20'),
(17236, 16, '10'),
(17236, 17, '10'),
(17236, 18, '20'),
(17234, 19, '30'),
(17233, 20, '10'),
(17236, 20, '20'),
(17236, 21, '15'),
(17258, 22, '20'),
(17259, 23, '20'),
(17260, 24, '25'),
(17236, 29, '1'),
(17253, 26, '15'),
(17235, 27, '10'),
(17252, 28, '20'),
(17237, 29, '3'),
(17258, 30, '6');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_notifications`
--

DROP TABLE IF EXISTS `shop_notifications`;
CREATE TABLE IF NOT EXISTS `shop_notifications` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_phone` varchar(100) DEFAULT NULL,
  `user_comment` varchar(500) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `date_created` int(11) NOT NULL,
  `active_to` int(11) NOT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `notified_by_email` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_notification_statuses`
--

DROP TABLE IF EXISTS `shop_notification_statuses`;
CREATE TABLE IF NOT EXISTS `shop_notification_statuses` (
  `id` int(11) NOT NULL,
  `position` smallint(6) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_notification_statuses`
--

INSERT INTO `shop_notification_statuses` (`id`, `position`) VALUES
(1, 1),
(2, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_notification_statuses_i18n`
--

DROP TABLE IF EXISTS `shop_notification_statuses_i18n`;
CREATE TABLE IF NOT EXISTS `shop_notification_statuses_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `name` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_notification_statuses_i18n`
--

INSERT INTO `shop_notification_statuses_i18n` (`id`, `locale`, `name`) VALUES
(1, 'ua', 'Новий'),
(2, 'ua', 'Виконаний'),
(1, 'ru', 'Новый'),
(2, 'ru', 'Выполнен'),
(1, 'en', 'New'),
(2, 'en', 'Executed');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_orders`
--

DROP TABLE IF EXISTS `shop_orders`;
CREATE TABLE IF NOT EXISTS `shop_orders` (
  `id` int(11) NOT NULL,
  `order_key` varchar(255) NOT NULL,
  `delivery_method` int(11) DEFAULT NULL,
  `delivery_price` double(20,5) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `paid` tinyint(1) DEFAULT NULL,
  `user_full_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  `user_deliver_to` varchar(500) DEFAULT NULL,
  `user_comment` varchar(1000) DEFAULT NULL,
  `date_created` int(11) DEFAULT NULL,
  `date_updated` int(11) DEFAULT NULL,
  `user_ip` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `payment_method` int(11) DEFAULT NULL,
  `total_price` double(20,5) DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `gift_cert_key` varchar(25) DEFAULT NULL,
  `gift_cert_price` double(20,5) DEFAULT NULL,
  `discount` double(20,5) DEFAULT NULL,
  `discount_info` text,
  `origin_price` double(20,5) DEFAULT NULL,
  `user_surname` varchar(255) DEFAULT NULL,
  `comulativ` double(20,5) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_orders_products`
--

DROP TABLE IF EXISTS `shop_orders_products`;
CREATE TABLE IF NOT EXISTS `shop_orders_products` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `variant_name` varchar(255) DEFAULT NULL,
  `price` double(20,5) DEFAULT NULL,
  `origin_price` double(20,5) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `kit_id` int(11) DEFAULT NULL,
  `is_main` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_orders_status_history`
--

DROP TABLE IF EXISTS `shop_orders_status_history`;
CREATE TABLE IF NOT EXISTS `shop_orders_status_history` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_created` int(11) DEFAULT NULL,
  `comment` varchar(1000) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_order_statuses`
--

DROP TABLE IF EXISTS `shop_order_statuses`;
CREATE TABLE IF NOT EXISTS `shop_order_statuses` (
  `id` int(11) NOT NULL,
  `position` smallint(6) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `fontcolor` varchar(255) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_order_statuses`
--

INSERT INTO `shop_order_statuses` (`id`, `position`, `color`, `fontcolor`) VALUES
(1, 0, '#5aad5a', '#ffffff'),
(2, 3, '#7d7c7d', '#ffffff');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_order_statuses_i18n`
--

DROP TABLE IF EXISTS `shop_order_statuses_i18n`;
CREATE TABLE IF NOT EXISTS `shop_order_statuses_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `name` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_order_statuses_i18n`
--

INSERT INTO `shop_order_statuses_i18n` (`id`, `locale`, `name`) VALUES
(1, 'ua', 'Новий'),
(2, 'ua', 'Доставлений'),
(1, 'ru', 'Новый'),
(2, 'ru', 'Доставлен'),
(2, 'en', 'Delivered'),
(1, 'en', 'New');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_payment_methods`
--

DROP TABLE IF EXISTS `shop_payment_methods`;
CREATE TABLE IF NOT EXISTS `shop_payment_methods` (
  `id` int(11) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `payment_system_name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_payment_methods`
--

INSERT INTO `shop_payment_methods` (`id`, `active`, `currency_id`, `position`, `payment_system_name`) VALUES
(1, 1, 1, 0, '0'),
(3, 1, 1, 3, 'payment_method_sberbank'),
(10, 1, 1, 5, 'payment_method_yakassa'),
(9, 1, 1, 4, 'payment_method_webmoney'),
(11, 1, 1, 1, '0'),
(2, 1, 1, 2, 'payment_method_oschadbank');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_payment_methods_i18n`
--

DROP TABLE IF EXISTS `shop_payment_methods_i18n`;
CREATE TABLE IF NOT EXISTS `shop_payment_methods_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_payment_methods_i18n`
--

INSERT INTO `shop_payment_methods_i18n` (`id`, `locale`, `name`, `description`) VALUES
(1, 'ru', 'Наличными курьеру', '<p>Оплата наличными курьеру</p>'),
(2, 'ru', 'Оплата через Банк', '<p>Оплата через ОщадБанк Украины</p>'),
(3, 'ru', 'СберБанк России', '<p>Оплата через СберБанк России</p>'),
(10, 'ru', 'Visa/Mastercard', '<p>Оплата картой через сервис Liqpay</p>'),
(1, 'en', 'Payment for the courier', ''),
(2, 'en', 'Payment by bank', ''),
(3, 'en', 'Sberbank of Russia', ''),
(9, 'ru', 'Webmoney', ''),
(11, 'ru', 'Наложенным платежем', '<p>Оплата наличными на складе экспресс службы</p>');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_products`
--

DROP TABLE IF EXISTS `shop_products`;
CREATE TABLE IF NOT EXISTS `shop_products` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `hit` tinyint(1) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `related_products` varchar(255) DEFAULT NULL,
  `created` int(11) NOT NULL,
  `updated` int(11) NOT NULL,
  `old_price` double(12,2) DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  `hot` tinyint(1) DEFAULT NULL,
  `action` tinyint(1) DEFAULT NULL,
  `added_to_cart_count` int(11) DEFAULT NULL,
  `enable_comments` tinyint(1) DEFAULT '1',
  `external_id` varchar(255) DEFAULT NULL,
  `tpl` varchar(250) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=17266 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_products`
--

INSERT INTO `shop_products` (`id`, `url`, `active`, `hit`, `brand_id`, `category_id`, `related_products`, `created`, `updated`, `old_price`, `views`, `hot`, `action`, `added_to_cart_count`, `enable_comments`, `external_id`, `tpl`, `user_id`) VALUES
(17233, 'koss-pro4s', 1, 0, 279, 3017, NULL, 1425640456, 1456318244, 0.00, 69, 0, 0, 0, 1, NULL, '', NULL),
(17234, 'koss-bt540i', 1, 0, 279, 3017, '17238,17236', 1425644183, 1456318218, 0.00, 61, 0, 0, 0, 1, NULL, '', NULL),
(17235, 'minisistema-mx-f730db', 1, 0, 282, 3017, '17233', 1425646676, 1456318067, 130.00, 60, 0, 1, 0, 1, NULL, '', NULL),
(17236, 'goodram-twister-30', 1, 0, 278, 3019, NULL, 1425649225, 1456318051, 0.00, 41, 0, 0, 0, 1, NULL, '', NULL),
(17237, 'goodram-ssd-c40', 1, 0, 0, 3019, NULL, 1425650054, 1456318034, 0.00, 12, 0, 0, 0, 1, NULL, '', NULL),
(17238, 'goodram-sd-uhs-1', 1, 1, 278, 3019, NULL, 1425651955, 1456318017, 0.00, 45, 1, 0, 0, 1, NULL, '', NULL),
(17239, 'impression-studio-al-2311', 1, 0, 275, 3025, NULL, 1425906865, 1456317942, 0.00, 10, 0, 0, 0, 1, NULL, '', NULL),
(17240, 'impad-0314', 1, 0, 275, 3015, NULL, 1425909060, 1456317925, 120.00, 57, 0, 1, 0, 1, NULL, '', NULL),
(17241, 'ipad-air', 1, 1, 276, 3015, NULL, 1425911422, 1456317901, 2440.00, 524, 0, 0, 0, 1, NULL, '', NULL),
(17242, 'nexus-9', 1, 1, 280, 3015, '17238,17234', 1425913547, 1456317870, 0.00, 59, 1, 0, 0, 1, NULL, '', NULL),
(17243, 'lenovo-ideapad-yoga', 1, 0, 284, 3026, NULL, 1425914940, 1456317834, 0.00, 65, 0, 0, 0, 1, NULL, '', NULL),
(17244, 'sony-vaio-svl2413m1r-b', 1, 0, 0, 3025, NULL, 1425918481, 1456317802, 0.00, 10, 0, 0, 0, 1, NULL, '', NULL),
(17245, 'lg-29v950', 1, 0, 283, 3025, NULL, 1425919606, 1456317775, 0.00, 8, 0, 0, 0, 1, NULL, '', NULL),
(17246, 'asus-x200ma-x200ma-kx506d', 1, 0, 277, 3018, NULL, 1425920971, 1456317757, 0.00, 30, 0, 0, 0, 1, NULL, '', NULL),
(17247, 'asus-transformer-book-t100ta', 1, 0, 277, 3018, '17242,17237', 1425921653, 1456317729, 240.00, 229, 1, 1, 0, 1, NULL, '', NULL),
(17248, 'ortopedicheskoe-ofisnoe-kreslo', 1, 1, 285, 3027, '17257,17250', 1427715900, 1456317695, 0.00, 35, 0, 0, 0, 1, NULL, '', NULL),
(17249, 'mini-divan', 1, 0, 286, 3027, '17259,17258', 1427719001, 1456317705, 120.00, 53, 0, 1, 0, 1, NULL, '', NULL),
(17250, 'kom4d', 1, 0, 287, 3027, '17259,17248', 1427721322, 1456317666, 0.00, 17, 0, 0, 0, 1, NULL, '', NULL),
(17251, 'lk-sport-cf-k', 1, 0, 288, 3028, '17260,17253', 1427728236, 1456317655, 0.00, 21, 1, 0, 0, 1, NULL, '', NULL),
(17252, 'adidas-weighted-west', 1, 0, 288, 3028, '17253,17251', 1427730618, 1456317634, 220.00, 33, 0, 1, 0, 1, NULL, '', NULL),
(17253, 'osprey-quantum-34', 1, 1, 289, 3028, '17251,17242,17233', 1427735387, 1456317568, 135.00, 341, 0, 1, 0, 1, NULL, '', NULL),
(17254, 'benzopila-stihl-ms-180', 1, 1, 290, 3029, '17256,17255', 1427796316, 1456317533, 0.00, 33, 0, 0, 0, 1, NULL, '', NULL),
(17255, 'kultivator-sadko-t-600', 1, 0, 291, 3029, '17256,17254', 1427798488, 1456317488, 0.00, 24, 1, 0, 0, 1, NULL, '', NULL),
(17256, 'forte-cl-16a', 1, 0, 291, 3029, '17255,17254', 1427800135, 1456317478, 0.00, 14, 0, 0, 0, 1, NULL, '', NULL),
(17257, 'futbol-nastolnyi', 1, 1, 292, 3030, '17250,17248', 1427806058, 1456317468, 0.00, 264, 1, 0, 0, 1, NULL, '', NULL),
(17258, 'detskaia-krovatka-sonia-ld', 1, 1, 292, 3030, '17262,17250,17249', 1427807401, 1456317447, 200.00, 804, 0, 1, 0, 1, NULL, '', NULL),
(17259, 'detskii-shkaf', 1, 0, 292, 3030, '17262,17258,17250', 1427809683, 1456317436, 0.00, 67, 0, 0, 0, 1, NULL, '', NULL),
(17260, 'dzhemper-s-kapiushonom', 1, 0, 288, 3031, '17261,17253,17251', 1427812985, 1456317421, 0.00, 36, 0, 0, 0, 1, NULL, '', NULL),
(17261, 'detskie-briuki', 1, 1, 288, 3031, '17260,17251', 1427815032, 1456317408, 0.00, 47, 0, 0, 0, 1, NULL, '', NULL),
(17262, 'sling-sharf-dlia-detei-do-3-h-let', 1, 1, 0, 3030, '17259,17258,17250', 1427819033, 1456317394, 0.00, 151, 0, 0, 0, 1, NULL, 'superlanding.tpl', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_products_i18n`
--

DROP TABLE IF EXISTS `shop_products_i18n`;
CREATE TABLE IF NOT EXISTS `shop_products_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `name` varchar(500) NOT NULL,
  `short_description` text,
  `full_description` text,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_products_i18n`
--

INSERT INTO `shop_products_i18n` (`id`, `locale`, `name`, `short_description`, `full_description`, `meta_title`, `meta_description`, `meta_keywords`) VALUES
(17233, 'ru', 'Наушники профессиональные KOSS Pro4S', 'Создай свой звук с мощными студийными наушниками Koss Pro4S! Модель снабжена 40-миллиметровыми драйверами SLX40, которые обеспечивают глубокие басы с четкой звукопередачей, а также чистые высокие частоты.', '<p>Наушники имеют легкую конструкцию и обладают улучшенной звукоизоляцией.</p>\r\n<p>Уникальные чашки D-образной формы плотно облегают уши, амбюшуры и оголовье выполнены из мягкой эко-кожи всё это дарит бесконечное чувство комфорта при длительном использовании. Оба наушника Koss Pro4S оборудованы разъемами для соединительного кабеля, в свободный разъем можно подключить вторые наушники для совместного прослушивания музыки.<br /><br /><iframe src="//www.youtube.com/embed/FPMBMMj6fI8" width="620" height="510"></iframe></p>', '', '', ''),
(17234, 'ru', 'Наушники профессиональные Koss BT540i', 'Полноразмерные наушники с возможностью беспроводной передачи аудиосигнала по Bluetooth- или NFC-соединению.', '<p>Модель имеет съёмный кабель и складную конструкцию, что удобно для хранения и транспортировки. Наушники отличаются комфортной посадкой за счет удобного оголовья, покрытого мягкой кожей сверху и приятным велюром с внутренней стороны.</p>\r\n<p>Ещё один важный момент: KOSS BT540i &mdash; не просто наушники, а гарнитура. На съёмном кабеле микрофонов нет, они находятся на правой чаше. Микрофонов два, что помогает отсекать внешний шум и повышает качество передачи речи. Основной микрофон &mdash; голосовой &mdash; расположен на чаше рядом с входом micro-USB. Второй, используемый в паре с основным для подавления внешних шумов, находится рядом с креплением чаши и выглядит, как небольшая полость в правом наушнике.<br /><br /><iframe src="//www.youtube.com/embed/lahJlYdVbTw" width="625" height="515"></iframe></p>', '', '', ''),
(17235, 'ru', 'Акустическая минисистема MX-F730DB', 'Дополните вашу мини-систему функцией Samsung Giga Sound Blast. Благодаря функции Giga Sound Blast, вы улучшите качество звука вашей мини-системы.', '<p>Пользуйтесь функцией записи радиопрограмм, встроенной в вашу мини-систему. Установив время записи радиопрограммы, вы можете записать передачу в течение любого периода времени, благодаря чему вы никогда не пропустите интересную передачу. Установите любое расписание для записи своих любимых радиопрограмм.</p>\r\n<p>Оцените быстроту и простоту создания MP3 файлов с любого источника музыки. Втроенная функция EZ MP3 Maker позволяет использовать вашу аудиосистему для перезаписи треков с CD дисков или записи музыкальных передач с FM радио или входа AUX. С помощью специального кабеля вы можете подключить деку для виниловых пластинок и переписать музыку на цифровой носитель. Теперь вы легко сможете перевести свою музыкальную коллекцию на виниловых пластинках в современный цифровой формат.</p>', '', '', ''),
(17248, 'ru', 'Ортопедическое кресло из экологически чистых материалов', '', '<p>Наличие подголовника - позволяет облокотиться и расслабить не только спину, но и шею, и частично плечи, что необходимо при длительной работе. Подголовники могут быть встроенными, либо приставными, некоторые кресла оснащены дополнительными возможностями регулировки подголовников по высоте или углу наклона.</p>\r\n<p>Профилированная спинка -спинка, имеющая анатомически правильную форму, повторяющая естественный изгиб позвоночника, создаваемый кривизной поясничной опоры и изгибом грудного отдела позвоночного столба. Такая спинка позволяет сохранять естественный кровоток для питания позвоночника и головного мозга. Что благотворно сказывается на здоровье и самочувствии.</p>\r\n<p>Состав - Хромированные детали , Каркас металлический; Ткань - Кожа , Эко кожа , Эко кожа перфорированная.</p>\r\n<ul>\r\n<li>Ширина раскладки - 70</li>\r\n<li>Ширина - 70</li>\r\n<li>Высота - 135 , 155</li>\r\n<li>Глубина - 70 , 100</li>\r\n<li>Гарантия качества - 12 месяцевх</li>\r\n</ul>\r\n<br /><iframe src="//www.youtube.com/embed/fbRccIgAEyU" width="625" height="515"></iframe>', '', '', ''),
(17236, 'ru', 'Устройство хранения данных, флеш накопитель GOODRAM Twister 3.0', '', 'Универсальность и функциональность &mdash; это важнейшие свойства GOODRAM Twister 3.0. Прочный корпус с металлической поворотной скобой не только превосходно защищает хранящиеся данные, но и позволяет не беспокоиться о колпачке, который может потеряться. GOODRAM Twister 3.0, в отличие от аналогичных продуктов на рынке, характеризуется фирменными компонентами и пожизненной гарантией а также быстрым интерфейсом 3.0.', '', '', ''),
(17237, 'ru', 'Устройство хранения данных, жесткий диск GOODRAM SSD C40', '', 'Диски C 50 оснащены надежными чипами памяти MLC марки Toshiba, контроллером PS3108, а также до 512 Мб памяти DDR3. В то же время диски серии C 50 являются, вероятно, одними из самых экономичных дисков SSD на рынке! Диски оснащены контроллером C3108, который по сравнению с другими популярных решениями, используемыми в дисках SSD, еще с большей производительностью обрабатывает несжимаемые файлы', '', '', ''),
(17238, 'ru', 'Устройство хранения данных, карта памяти GOODRAM SD UHS 1', '', '<p>Даже самое современное оборудование без надлежащей карты теряет свои возможности. Карта GOODRAM SDHC/SDXC UHS 1 предназначена для пользователей, которые хотят в полной мере использовать возможности своего фотоаппарата или камеры.</p>\r\n<p>Она применяется как в повседневных, так и в самых продвинутых приложениях. Технология UHS 1 обеспечивает самые лучшие параметры, а также стабильную и надежную работу вашего устройства. Теперь даже самые профессиональные операции выполняются без малейших проблем. Вы откроете для себя новые горизонты фотографии!</p>', '', '', ''),
(17239, 'ru', 'Мультимедийный моноблок - Impression Studio AL 2311', '', 'Impression Studio AL 2311 &mdash; это и мощный персональный компьютер и медиацентр одновременно, &nbsp;помещенные в стильный монитор толщиной всего 55 мм. Благодаря элегантному дизайну и эргономичности такой ПК украсит любое рабочеее место или домашний интерьер, занимая при этом минимум пространства. VESA-крепление позволит устройству легко разместиться и функционировать даже на стене вашего помещения. Идеален в качестве домашнего развлекательного центра (для просмотра телепередач, видео, различных игр).<br /><br /><iframe src="//www.youtube.com/embed/i1Bp8xYytZw" width="625" height="515"></iframe>', '', '', ''),
(17240, 'ru', 'Планшет на базе  Android - Impression ImPAD 0314', '', '<p>Планшет Impression ImPAD 5214 7" IPS (1024x600)//двухъядерный Rockchip 3026 (ядро ARM Cortex-A9) 1.0 ГГц//1024 MB DDR3//8 ГБ//Wi-Fi//Веб-камера 0.3 Мп, 2.0 Мп//Android 4.4.2//</p>\r\n<p>Гарантия 12 месяцев</p>\r\n<p><iframe src="//www.youtube.com/embed/rDj0empJ3vY" width="625" height="515"></iframe></p>', '', '', ''),
(17241, 'ru', 'Высокопроизводительный планшет на Mac OS - iPad Air', '', '<p>Первое, на что обращаешь внимание &mdash; насколько тонкое и лёгкое устройство у вас в руках. Толщина iPad Air 2 &mdash; всего 6,1 миллиметра. Это наш самый тонкий iPad. А весит он менее 450 грамм. Его ещё легче держать одной рукой и брать с собой повсюду.</p>\r\n<p>Самый первый iPad, представленный четыре года назад, задал стандарты толщины и веса. И с каждым разом мы делаем iPad ещё тоньше и ещё легче. Но при этом, благодаря алюминиевому корпусу iPad Air 2 остаётся таким же прочным. Стоит взять устройство в руки &mdash; и вы сразу поймёте, насколько он крепкий и монолитный.<br /><br /><iframe src="//www.youtube.com/embed/BCqJGoCMlVc" width="625" height="515"></iframe></p>', '', '', ''),
(17242, 'ru', 'Высокопроизводительный планшет Nexus 9', '', '<p>Созданный для работы и развлечений Nexus 9 имеет матовый металлический корпус с мягкой на ощупь крышкой и оснащен лучшим программным обеспечением Google и Android, предоставляющим практически безграничные возможности для развлечений и работы с бизнес-приложениями.</p>\r\n<p>Для активных и инициативных</p>\r\n<ul>\r\n<li>Экран 8,9 дюйма</li>\r\n<li>Вынесенные на переднюю панель стереодинамики</li>\r\n<li>Доступ более чем к миллиону приложений</li>\r\n<li>Автоматическое обновление ОС Android</li>\r\n<li>Легкая интеграция устройства</li>\r\n</ul>\r\n<iframe src="https://sketchfab.com/models/e70cfba33ab441409a43b0ab6cf360bd/embed" width="640" height="480" frameborder="0" allowfullscreen="allowfullscreen"></iframe>\r\n<p style="font-size: 13px; font-weight: normal; margin: 5px; color: #4a4a4a;"><a style="font-weight: bold; color: #1caad9;" href="https://sketchfab.com/models/e70cfba33ab441409a43b0ab6cf360bd?utm_source=oembed&amp;utm_medium=embed&amp;utm_campaign=e70cfba33ab441409a43b0ab6cf360bd" target="_blank">Google Nexus 9 - Sand</a> by <a style="font-weight: bold; color: #1caad9;" href="https://sketchfab.com/htc?utm_source=oembed&amp;utm_medium=embed&amp;utm_campaign=e70cfba33ab441409a43b0ab6cf360bd" target="_blank">HTC</a> on <a style="font-weight: bold; color: #1caad9;" href="https://sketchfab.com?utm_source=oembed&amp;utm_medium=embed&amp;utm_campaign=e70cfba33ab441409a43b0ab6cf360bd" target="_blank">Sketchfab</a></p>', '', '', ''),
(17243, 'ru', 'Мультимедийный центр - Lenovo IdeaPad Yoga', '', '<p>По сравнению с обычными трансформируемыми форм-факторами запатентованное шарнирное крепление дисплея Yoga отличается большей устойчивостью и прочностью, а ноутбук имеет более тонкий и лёгкий корпус. Yoga является самым тонким в мире трансформируемым ультрабуком. Его толщина составляет 15.6 мм, а вес равен 1.27 кг. Ноутбук Yoga оснащён процессором nVidia Tegra 3, поставляется с операционной системой Windows RT и может работать 13 часов без подзарядки аккумулятора. Объём оперативной памяти составляет 2 ГБ, а ёмкость твердотельного накопителя &mdash; 32 ГБ.</p>\r\n<p>Кроме того, этот полноформатный ноутбук с гибкой конструкцией имеет небольшие, но необходимые детали, такие как мягкое каучуковое покрытие на корпусе, предотвращающее скольжение устройства, кожаное покрытие на панели для опоры рук и боковые кнопки для удобства использования всех режимов.</p>\r\n<iframe src="//www.youtube.com/embed/gChMBcprtZI" width="625" height="515"></iframe>', '', '', ''),
(17244, 'ru', 'Высокопроизводительный моноблок - Sony VAIO SVL2413M1R/B', '', '<p>Универсальный компьютер с сенсорным экраном, оснащенным технологией Sony TV</p>\r\n<ul>\r\n<li>Компьютер с плоским сенсорным экраном для всех развлечений</li>\r\n<li>Получайте удовольствие от изображения и звука в режиме 3D без всяких очков</li>\r\n<li>Мгновенное переключение VAIO в режим TVM</li>\r\n</ul>\r\n<p>Компьютер VAIO &mdash; это развлечение для всей семьи. Он имеет стильную моноблочную конструкцию, достаточно тонкую, чтобы разместиться в самом узком месте. Плоский большой экран мультитач создает современный облик, а щелевой дисковод для оптических дисков прост и удобен в эксплуатации.</p>\r\n<p>Панель мультитач, поддерживающая десять точек, позволяет управлять всеми пальцами одновременно. Теперь вы сможете действительно воспользоваться самыми захватывающими и полезными сенсорными возможностями Windows 8.</p>', '', '', ''),
(17245, 'ru', 'Моноблок с изогнутым экраном - LG 29V950', '', '<p>В десктопе с обозначением 29V950 применена IPS-панель формата WFHD (2560 &times; 1080 точек), обладающая яркостью 300 кд/м2 и контрастностью 1000:1. Угол обзора по горизонтали достигает 178 градусов.</p>\r\n<p>Моноблок выполнен на аппаратной платформе Intel Broadwell. Он оборудован 14-нанометровым двухъядерным процессором Core i5-5200U с тактовой частотой 2,2 ГГц (повышается до 2,7 ГГц). Чип трудится в тандеме с 8 Гбайт оперативной памяти. Видеоподсистема полагается на ускоритель NVIDIA GeForce 840M с 2 Гбайт памяти.</p>', '', '', ''),
(17246, 'ru', 'Производительный портативный нетбук - ASUS X200MA (X200MA-KX506D)', '', '<p>Важными аргументами в пользу приобретения ASUS X200MA можно считать внешнюю привлекательность и небольшие габариты/вес, хорошие характеристики в области производительности, эргономики и автономности, расширенный набор инструментов для взаимодействия с внешними устройствами.</p>\r\n<p>Ключевым элементом данного ноутбука выступает скоростной процессор из семейства Intel. В дополнение к нему идут интегрированный видеоадаптер Intel HD Graphics и DDR3-память с максимальным объемом 4 ГБ. Учитывая такую конфигурацию, ASUS X200MA способен справиться с множеством современных приложений и программ, как офисного и сетевого, так и мультимедийного развлекательного характера.</p>\r\n<p>Отдельно в ASUS X200MA стоит выделить четкий 11,6" дисплей с разрешением 1366x768 точек и системой LED-подсветки, фирменную аудиотехнологию ASUS SonicMaster и веб-камеру формата 720p для видеозвонков.</p>', '', '', ''),
(17247, 'ru', 'Энергоэкономный ноутбук два в одном - ASUS Transformer Book', '', '<p>Kомпактный ноутбук 2-в-1 из модельного ряда 2013 года, построенный на базе платформы Bay Trail (четырехъядерного процессора Intel Atom Z3740 с тактовой частотой 1,33 ГГц). Оперативной памяти в данном устройстве предусмотрено 2 Гб, в качестве видеоускорителя используется встроенная графика Intel HD Graphics.</p>\r\n<p>В комплексе с ОС Windows 8.1 все это гарантирует не просто высокую скорость загрузки различных приложений офисного и мультимедийного характера, но и полный комфорт работы в режиме многозадачности. Кроме этого в комплект ноутбука входит Microsoft Office Home &amp; Student 2013, благодаря чему сразу после первого включения вы сможете работать, а не отвлекаться на установку программного обеспечения.</p>\r\n<p>Дисплей, которым оснащен ASUS Transformer Book T100TA, мультисенсорный, глянцевый, изготовлен по технологии IPS, обладает разрешением HD, широкими углами обзора и превосходной цветопередачей. Аудиосистема, в свою очередь, включает в себя мощные стереодинамики с увеличенными резонансными камерами и передовой технологией ASUS SonicMaster. Что касается времени автономной работы новинки, оно заявлено на уровне 11 часов.</p>\r\n<p><iframe src="//www.youtube.com/embed/RFqDjBW1r9U" width="627" height="516"></iframe></p>', '', '', ''),
(17249, 'ru', 'Мини диван раскладной для детской и кухни', '', '<p>Такой диванчик идеально подойдет для прихожей, заменив собой неудобный табурет, теперь вы сможете обуваться с комфортом. Естественно, для такого помещения следует подбирать максимально компактную модель более темных тонов, тогда мебель прослужит вам дольше и ее не надо будет чистить чуть ли не через день.</p>\r\n<ul>\r\n<li>Размеры: 90хСп.</li>\r\n<li>Спальное место: 205x90 см</li>\r\n<li>Раскладка: аккордеон</li>\r\n<li>Каркас: металлический</li>\r\n<li>Наполнение: ламели и ППУ</li>\r\n<li>Обивка: ткань мебельная</li>\r\n</ul>', '', '', ''),
(17250, 'ru', 'Компактный комод KOM4D', '', '<p>Современный стильный комод имеет компактные габариты, что никак не влияет на его функциональность и практичность. Отметим, что данный комод изготавливается только в одной комбинации цвета, как показано на главном изображении товара. Данный комод состоит из трех одинаковых выдвижных ящичков и одного большого отделения с распашной дверцей, предназначенной для спиртных и прочих напитков, но вы, конечно же, можете это отделение использовать по собственному назначению.</p>\r\n<ul>\r\n<li>Размеры комода: 800х1285х370.</li>\r\n<li>Цвет: темный орех / венге св.</li>\r\n<li>Материал: корпус ДСП, фасад ДСП.</li>\r\n</ul>', '', '', ''),
(17251, 'ru', 'Кроссовки для бега - Adidas lk-sport CF K', '', '<p>Удобная беговая модель обуви на липучке. Верх кроссовок из высококачественного кожзаменителя, усиленного синтетическими накладками для прочности и поддержки стопы. Внутри кроссовок текстильная подкладка. Стелька с технологией Adidas OrthoLite&reg; для вентиляции и защиты от образования грибка, бактерий и неприятного запаха. Резиновая подошва Non-marking с бороздками для гибкости, не оставляющая следов на поверхности:</p>\r\n<ul>\r\n<li>Верх из дышащей текстильной сетки и легких синтетических</li>\r\n<li>материалов.</li>\r\n<li>Промежуточная подошва со вставками из ЭВА для устойчивости</li>\r\n<li>и комфорта.</li>\r\n<li>Немаркая подметка из прочной резиновой смеси.</li>\r\n<li>Вынимаемая стелька adiFIT с антимикробным покрытием OrthoLite</li>\r\n<li>помогает подобрать подходящий размер обуви.</li>\r\n</ul>\r\n<br /><iframe src="//www.youtube.com/embed/uiQVkoDlBbQ" width="625" height="515"></iframe>', '', '', ''),
(17252, 'ru', 'Спортивный жилет утяжелитель для бега - Adidas Weighted West', '', '<p>Как показали многочисленные исследования &ndash; используя утяжелители, спортсмен сжигает намного большее количество калорий. И если для мужчин тренировки с подобного рода инвентарем вполне естественны, то большинство женщин, тем не менее, чаще всего не используют его в своих занятиях из страха, что это приведет к чрезмерной раскачке мышц.</p>\r\n<ul>\r\n<li>Вес (максимальный) - кг 10</li>\r\n<li>Материал утяжелителей - металлический песок</li>\r\n<li>Структура утяжелителей - насыпные</li>\r\n</ul>\r\n<br /><iframe src="//www.youtube.com/embed/-qW1ABTHOvk" width="624" height="514"></iframe>', '', '', ''),
(17253, 'ru', 'Туристический рюкзак с отделением для ноутбука - Osprey Quantum 34', '', '<p>Эргономичный дизайн - это первое, что бросается в глаза при взгляде на рюкзак Osprey Quantum 34. Функциональный и универсальный Osprey Quantum 34 предусмотрен в основном для повседневного использования в городе. Он оснащён двумя большими карманами с боковым замком и передним эластичным карманом.</p>\r\n<p>Поскольку рюкзак Osprey Quantum 34 достаточно объёмный и вместительный, его можно рассматривать как отличный вариант для любителей недалёких поездок. Производитель удачно предусмотрел такие детали, как карман для МР3 плеера и петля для ледоруба, что делает его ещё более интересным и универсальным.</p>\r\n<p>Верхняя мягкая ручка и спина с использованием технологии AirScape обеспечивают максимально комфортное ношение. Конечно же, прогресс не стоит на месте, и для любителей техники предусмотрен эластичный карман для ноутбука (15.4"). Абсолютное качество и отлично продуманные детали сделают рюкзак Osprey Quantum 34 незаменимым помощником для Вас</p>', '', '', ''),
(17254, 'ru', 'Бензопила высокой мощности, с комплектом насадок STIHL MS 180', '', '<p>Одна из самых популярных моделей среди бензопил STIHL MS 180 заметно выделяется простотой в эксплуатации, компактными размерами и небольшим весом, что обеспечивает дополнительный комфорт во время работы с ней. STIHL MS 180 достаточно мощная, чтобы вы смогли на своем участке сделать заготовку дров, выполнить работы с деревом для строительства или привести в порядок деревья в саду. Преимуществами этой модели являются система легкого старта ErgoStart, устройство быстрого натяжения цепи и электронное зажигание. Приятным дополнением станет наличие системы &laquo;QuikStop&raquo;, обеспечивающей хорошую защиту от отдачи и снижение уровня вибрации, что дает вам возможность долго наслаждаться надежной и приятной работой с STIHL MS 180.</p>\r\n<ul>\r\n<li>Питание - бензин</li>\r\n<li>Мощность двигателя - 1,5 л.с.</li>\r\n<li>Длина шины, мм - 300/350</li>\r\n<li>Масса - 3,9 кг.</li>\r\n<li>Блокировка кнопки включения</li>\r\n<li>Автоматическая смазка цепи</li>\r\n<li>Тормоз цепи</li>\r\n</ul>\r\n<p><iframe src="//www.youtube.com/embed/kMBO08AWQSo" width="630" height="519"></iframe></p>', '', '', ''),
(17255, 'ru', 'Мотокультиватор бензиновый, большой мощности - SADKO T-600', '', '<p>Практичный в эксплуатации небольшой культиватор SADKO T-600 способен значительно облегчить целый ряд земельных работ в сельском хозяйстве. На SADKO T-600 надежный четырехтактный двигатель, дополненный воздушным охлаждением и ручным стартером с достаточной мощностью, чтобы обработать любой тип почвы на участках до 40 соток. Предусмотрена также и трехступенчатая коробка передач, что делает эту модель максимально маневренной и легкой в управлении. SADKO T-600 рассчитан на ширину обработки почвы в 60 см с глубиной в 15 см, в нем достаточно просто регулируются рукоятки, что позволит комфортно работать человеку с любым ростом.</p>\r\n<ul>\r\n<li>Питание - бензин/дизель</li>\r\n<li>Двигатель - четырехтактный, с воздушным охлаждением</li>\r\n<li>Мощность двигателя - 6,5 (4,8) л.с</li>\r\n<li>Обьем топливного бака - 4 л.</li>\r\n<li>Ширина захвата культивации - 60 см.</li>\r\n<li>Рабочая глубина - 15 см.</li>\r\n</ul>\r\n<br /><iframe src="//www.youtube.com/embed/ySFJjZNiLzI" width="630" height="519"></iframe>', '', '', ''),
(17256, 'ru', 'Садовый распылитель для ухода за кустарниками - Forte CL-16A', '', '<p>С таким опрыскивателем, как Forte CL-16A, работать одно удовольствие. Он прост в эксплуатации, имеет достаточно компактную конструкцию эргономичной формы и небольшим весом, практически не требующую обслуживания, и надежное исполнение. Forte CL-16A способен работать длительное время от заряда аккумулятора, показывая при этом высокую производительность и позволяя распылять препарат в радиусе до 12 м, регулируя мощность струи распыления. Телескопическая распылительная трубка, входящая в комплект, изготовлена из нержавеющей стали, позволит обрабатывать деревья в саду, а объемный бак в Forte CL-16A, рассчитанный на 16 л, обеспечит обработку территории без необходимости остановок.</p>\r\n<ul>\r\n<li>Дальность (радиус) распыления - до 12 м.</li>\r\n<li>Длина распылительной трубки - 65-110 см</li>\r\n<li>Объем бака - 16 л.</li>\r\n<li>Тип двигателя - электрический (аккумулятор 8 Ач)</li>\r\n<li>Мощность двигателя - 12 кВт</li>\r\n<li>Продолжительность автономной работы, 4 ч.</li>\r\n</ul>\r\n<p><iframe src="//www.youtube.com/embed/Z03h_kBNsOY" width="630" height="519"></iframe></p>', '', '', ''),
(17257, 'ru', 'Футбол настольный', '', '<p>Стабильный конструкция представленного оборудования подходит как для профессиональной игры в пабах, так и в домашних условиях! Фигурки футболистов размещены на укреплённых стальных рельсах. Особого внимания заслуживает внутренняя часть игрового поля нейтрального зеленого цвета (не отвлекает внимания игроков и обеспечивает полный контроль за движением мячика).</p>\r\n<p>Корпус настольного футбола выполнен из высококачественного дерева и ламинированного МДФ. Стол имеет удобные отверстия на задней части ворот для вытаскивания мяча, после забитого гола.</p>\r\n<p>Наш настольный футбол имеет высококачественные детали и является крепким и надежным (см. фото и убедитесь сами). Обратите внимание! Специально подготовленный дизайн стола предоставит вам непрерывное развлечение, благодаря увеличеным углам поля (мяч не будет останавливаться во время игры).</p>\r\n<p><strong>Габариты стола</strong></p>\r\n<ul>\r\n<li>Габариты стола: 119,5 x 61 x 79cм</li>\r\n<li>Габариты игрового поля : 102x58cм</li>\r\n<li>Габариты после упаковки : 125,5 x 60,5 x 12cм</li>\r\n</ul>', '', '', ''),
(17258, 'ru', 'Детская кроватка Соня ЛД из экологически чистых материалов', '', '<p>Характеристики кроватки:</p>\r\n<ul>\r\n<li>Поперечный маятниковый механизм для укачивания c фиксатором;</li>\r\n<li>Вместительный, закрытый, подкроватный ящик на телескопических направляющих;</li>\r\n<li>Колесики для удобного перемещения по комнате;</li>\r\n<li>Основание для матраса с двумя уровнями регулирования по высоте;</li>\r\n<li>Подвижная боковина;</li>\r\n<li>Надежный механизм опускания бортика;</li>\r\n<li>Все детали кроватки имеют безопасные округлые формы и полированные поверхности;</li>\r\n<li>Защитная профиль-накладка (грызунок) на верхней части боковин, которая защищает зубки ребенка;</li>\r\n<li>Дно кроватки изготавливается из ортопедических ламелей что обеспечивает достаточную вентиляцию матрасика и постельного белья;</li>\r\n<li>Возможность трансформации кроватки в детский диванчик;</li>\r\n<li>Кроватка изготовлена из высококачественных твердых лиственных пород деревьев;</li>\r\n</ul>\r\n<iframe src="//www.youtube.com/embed/wICMbVifcBw" width="630" height="519"></iframe>', '', '', ''),
(17259, 'ru', 'Шкаф в детскую комнату из экологически чистых материалов', '', '<p>Ящики снабжены системой выдвижения с телескопическими направляющими, которые делают невозможными их выпадение и травмирование любопытных малышей, которые будут пытаться разобраться в многообразии своих вещей самостоятельно.</p>\r\n<p><strong>Характеристики:</strong></p>\r\n<ul>\r\n<li>шкаф полностью собранный;</li>\r\n<li>имеет 3 выдвижных ящика для белья и 2 отделения для вещей;</li>\r\n<li>телескопические направляющие;</li>\r\n<li>Размеры: 1885 х 900 х 510 мм.</li>\r\n<li>Гарантия 18 месяцев</li>\r\n</ul>\r\n<p>Компания оставляет за собой право изменять внешний вид модели, без изменения функциональности изделия.</p>', '', '', ''),
(17260, 'ru', 'Спортивный джемпер с капюшоном из натуральной ткани', '', '<ul>\r\n<li>Боковые карманы</li>\r\n<li>Удобная застежка на молнию; капюшон на подкладке</li>\r\n<li>Контрастные три полоски на рукавах</li>\r\n<li>Вышитый логотип adidas</li>\r\n<li>70% хлопок / 30% полиэстер (футер)</li>\r\n</ul>\r\n<p>Легче сказать, чем сделать. Что делать, если Вы оказались в промежутке между двумя размерами? В этом случае безопаснее выбрать больший размер. И знаете, что? Вы всегда можете примерить вещь дома. Размер не подошел? Не переживайте! Простая процедура обмена доступна в течение 14 дней. Ознакомьтесь с условиями возврата, чтобы узнать больше.</p>', '', '', ''),
(17261, 'ru', 'Детские спортивные брюки Adidas из натуральной ткани', '<p>Брюки практичны, удобны, в конце концов, в них тепло.</p>', '<p>Как мы знаем, все дети любят брюки &ndash; и девочки, и мальчики. Брюки практичны, удобны, в конце концов, в них тепло. Без надежной пары брюк невозможно представить себе целый ряд детских забав. В них удобно и тепло гулять в непогоду, в них не страшно упасть при уличных активных играх. С другой стороны, брючные ансамбли вполне уместны и на днях рождения, и на иных торжественных мероприятиях</p>\r\n<ul>\r\n<li>Длина по внутреннему шву 27 см</li>\r\n<li>Эластичный пояс на завязках</li>\r\n<li>Контрастные три полоски на ногах</li>\r\n<li>70% хлопок / 30% полиэстер (футер)</li>\r\n</ul>\r\n<p><img src="../../../../../uploads/images/tab.jpg" alt="" width="634" height="240" /></p>', '', '', ''),
(17262, 'ru', 'Слинг-шарф для детей до 3-х лет', '', '<p>Слинг-шарф позволяет носить малыша в вертикальном и горизонтальном положениях уже с рождения и до 2-х лет (12 кг). В отличие от тканого, трикотажный слинг-шарф подходит для начинающих слингородителей.</p>\r\n<p>Его эластичность помогает сгладить погрешности в намотке, минимизируя стресс мамы во время обучения различным положениям. Носить в слинг-шарфе легче, нежели в слинге с кольцами или просто на руках: нагрузка распределяется равномерно на спину, плечи и бедра родителя.</p>\r\n<p>Поза &laquo;жабки&raquo; с широким разведением ножек не только максимально удобна для ребенка, но и полезна, поскольку является профилактикой дисплазии. Натуральные ткани и трехслойная поддержка малыша гарантируют безопасность и комфорт вашего чада во время нахождения в слинг-шарфе.</p>\r\n<p><strong>Параметры</strong></p>\r\n<ul>\r\n<li>Длина шарфа - 5,0 м</li>\r\n<li>Ширина - 60 см</li>\r\n<li>Вес слинга - 650 г</li>\r\n<li>Материал - 100% хлопок, трикотаж</li>\r\n</ul>\r\n<p><iframe src="//www.youtube.com/embed/UN9gc4re2C0" width="625" height="515"></iframe></p>', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_products_rating`
--

DROP TABLE IF EXISTS `shop_products_rating`;
CREATE TABLE IF NOT EXISTS `shop_products_rating` (
  `product_id` int(11) NOT NULL,
  `votes` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_products_rating`
--

INSERT INTO `shop_products_rating` (`product_id`, `votes`, `rating`) VALUES
(71, 1, 2),
(81, 1, 5),
(88, 2, 6),
(76, 3, 11),
(82, 1, 4),
(77, 2, 7),
(73, 1, 2),
(108, 2, 6),
(72, 1, 5),
(74, 2, 8),
(75, 2, 9),
(94, 1, 4),
(87, 1, 5),
(79, 1, 5),
(190, 3, 11),
(1104, 3, 13),
(17233, 1, 5),
(17234, 1, 4),
(17235, 1, 4),
(17236, 3, 11),
(17237, 1, 5),
(17238, 2, 6),
(17239, 1, 4),
(17240, 1, 4),
(17241, 5, 15),
(17242, 1, 5),
(17243, 1, 4),
(17244, 1, 2),
(17245, 2, 6),
(17246, 1, 2),
(17247, 1, 4),
(17248, 1, 5),
(17249, 2, 8),
(17251, 2, 8),
(17250, 1, 4),
(17252, 1, 3),
(17253, 2, 10),
(17254, 2, 9),
(17255, 1, 5),
(17256, 1, 3),
(17257, 2, 9),
(17258, 5, 16),
(17259, 1, 5),
(17260, 1, 5),
(17261, 1, 4),
(17262, 3, 14);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_products_words`
--

DROP TABLE IF EXISTS `shop_products_words`;
CREATE TABLE IF NOT EXISTS `shop_products_words` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `local` varchar(4) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=403 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_product_categories`
--

DROP TABLE IF EXISTS `shop_product_categories`;
CREATE TABLE IF NOT EXISTS `shop_product_categories` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_product_categories`
--

INSERT INTO `shop_product_categories` (`product_id`, `category_id`) VALUES
(17233, 3017),
(17234, 3017),
(17234, 3031),
(17235, 3017),
(17236, 3014),
(17236, 3019),
(17237, 3014),
(17237, 3019),
(17238, 3014),
(17238, 3019),
(17239, 3014),
(17239, 3025),
(17240, 3015),
(17240, 3023),
(17240, 3024),
(17241, 3014),
(17241, 3015),
(17241, 3024),
(17242, 3014),
(17242, 3015),
(17242, 3024),
(17242, 3030),
(17243, 3014),
(17243, 3015),
(17243, 3018),
(17243, 3023),
(17243, 3024),
(17243, 3026),
(17244, 3023),
(17244, 3025),
(17245, 3023),
(17245, 3025),
(17246, 3014),
(17246, 3018),
(17246, 3023),
(17246, 3026),
(17246, 3030),
(17247, 3014),
(17247, 3015),
(17247, 3018),
(17247, 3023),
(17247, 3024),
(17247, 3026),
(17248, 3027),
(17248, 3029),
(17249, 3027),
(17249, 3029),
(17249, 3030),
(17250, 3027),
(17250, 3029),
(17250, 3031),
(17251, 3028),
(17251, 3030),
(17251, 3031),
(17252, 3028),
(17252, 3031),
(17253, 3028),
(17253, 3031),
(17254, 3029),
(17255, 3029),
(17256, 3029),
(17256, 3031),
(17257, 3027),
(17257, 3028),
(17257, 3030),
(17258, 3027),
(17258, 3030),
(17259, 3027),
(17259, 3030),
(17259, 3031),
(17260, 3028),
(17260, 3030),
(17260, 3031),
(17261, 3028),
(17261, 3030),
(17261, 3031),
(17262, 3030),
(17262, 3031);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_product_images`
--

DROP TABLE IF EXISTS `shop_product_images`;
CREATE TABLE IF NOT EXISTS `shop_product_images` (
  `product_id` int(11) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `position` smallint(6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_product_images`
--

INSERT INTO `shop_product_images` (`product_id`, `image_name`, `position`) VALUES
(17243, 'ca34a3dcd3101256d5bbadcf164c9dae.jpg', 3),
(17233, '14e988b1bad66bed2ee0cea7e269ef6c.jpg', 1),
(17233, '205b99fd99c0e1ff6a4c0371d0e4110c.jpg', 0),
(17234, '6c76d37a5e2ecd7dea408ffa00e9ca85.jpg', 2),
(17234, '98a5800558f62f54cbc98048713565ee.jpg', 1),
(17248, '9c6b2bdd1b9ce0634a4932fa3346cb9b.jpg', 0),
(17233, 'c8cbbfa8c74d3a7fecdf1d47c55a176e.jpg', 2),
(17233, '434d9e225ce0f3dd3ae0eb8f763ce95d.jpg', 3),
(17235, '827c15f20fc9fa6e3f9d72ec5c9dd598.jpg', 0),
(17236, 'b3445ccf0d421f0b01327bfbd1fdbb9f.jpg', 0),
(17235, 'b8fafc6d7cc8d29540a1e732df13c96e.jpg', 4),
(17235, '60bb9787980f92a0d2ea01a78a4354a1.jpg', 1),
(17235, '2a8d26b9038b0dc38869485de31f253b.jpg', 2),
(17235, 'fce7c361abfc548ab33256cea1639462.jpg', 3),
(17236, 'b1bb177822a707358b3f413efa04e576.jpg', 1),
(17236, 'b87539594504a55b4d76ef8a9a347892.jpg', 2),
(17236, '0b541ed9b53f30d5472392aa04910cd1.jpg', 3),
(17236, 'd5eaed2e290e49f5d4d3cf880e16a440.jpg', 6),
(17236, 'd10bb68347bbbb484184a955e4aeaeb3.jpg', 4),
(17236, '7fdd258a55a68eff28f1ef902e786eb8.jpg', 5),
(17236, '8bb832c395d9be7a4b44be109ba43634.jpg', 7),
(17237, '3aa86332237d84200ba2dc7330722d40.jpg', 2),
(17237, 'e6058dd019ec3d3494d66a1ed1ec5602.jpg', 1),
(17237, '6340d0f8ad647b87449ad1f53db3d257.jpg', 0),
(17244, '8fc5d648e490d2f3edc16ebc2a8ca8f0.jpg', 2),
(17237, '809d1d7c38a1270bbc33cc4db9da48a4.jpg', 3),
(17238, '8cf39c10e1d1a575deb7e04b0b873b09.jpg', 0),
(17238, '950e432e5b9fc21c934c9e116424a8a9.jpg', 1),
(17238, 'a387c517875e5baf0dfd41e204fab1eb.jpg', 2),
(17238, 'b569b3fe1288e2cc7b1abf002dab6736.jpg', 3),
(17238, 'd2fe6b13b569f6b38c2d568d9b8ec982.jpg', 4),
(17238, '0700fe5643afc7c81a1f1c22503de1a8.jpg', 5),
(17239, 'b77fc5aef9e9ff3f013caef1467c6bc5.jpg', 0),
(17239, '712de452e4afbb0bbd706c6ea13f15f0.jpg', 1),
(17240, 'ed02236bb764da34cd05810d37a35287.jpg', 0),
(17240, 'dc5b5ef9970c9c0967eed42f1cc2fc6f.jpg', 1),
(17240, 'c972fc5d308c4a56d5ea1b27602e1935.jpg', 2),
(17240, '01f3c1ec765a3f0e84662532b22ac62c.jpg', 3),
(17248, 'c8724a3401f08fda1f83ac62059dd199.jpg', 1),
(17241, '5952400eaa237b5844270ca9f39c55c8.png', 1),
(17241, '9edf0863463eca8088a3de2c6d48c328.png', 2),
(17242, '967201336205db17ce3eb198bda0b57e.png', 0),
(17242, '7af717bd2cbd2e27b4a0c170173dd8ea.png', 1),
(17242, '2e46c648ffdcf93f910b4caec73f0f45.jpg', 2),
(17242, '845b82e489c81f2d1e05772d4f11998f.jpg', 3),
(17242, '479dc561da6a3a42302b614080257a95.jpg', 4),
(17242, '099fc178720651b3606f3059cb0c54dd.png', 5),
(17243, '5a6686d3bd55240920437d3980272135.jpg', 0),
(17243, '4e5a3c4cb4324e6259d07618d3342013.jpg', 1),
(17244, 'f074d3b84c31c83b1f9c4cf9eeffe521.jpg', 0),
(17244, '93b36b928b99fe1d0a28ab6e42ca247a.jpg', 1),
(17252, '4f43f56fa2938f06186ab7da4962f62d.jpg', 1),
(17252, '9d62b0c2340c795a54a93d1fbaaa4253.jpg', 0),
(17251, '2ca3209522d9ce171ce8ad37d7f603b2.jpg', 1),
(17251, '96c2115cf86fddab2f906af0bbf48cb3.jpg', 0),
(17250, '5455aeef19ecf43a4a3fef77480c31f4.jpg', 2),
(17245, 'b0fcba55948044947831d30da9e4b5a7.jpg', 2),
(17246, '81393b4aa22084c5be46ebea37851e92.jpg', 0),
(17246, '95d2760d03c2873d0bf4c35d885ed0dc.jpg', 1),
(17246, '9ff1d15872d05ec1600263d9d92e92aa.jpg', 2),
(17247, '99e633afa5372833de8adbe71fbdc056.jpg', 0),
(17248, '3f504e24798108423199db3852e0d1a0.jpg', 3),
(17248, 'c65e78d3898803448aeda8b586a9b8c7.jpg', 2),
(17250, '0e711515bd306650fdd1fead2278203d.jpg', 0),
(17250, 'f50fa5947d9531970f2b992e249bb5f6.jpg', 1),
(17245, '5c6cdf1fd67a4eb21e7060c66650158d.jpg', 1),
(17245, '0d0a14a7af1e6823d9923cfedcb5315e.jpg', 0),
(17244, 'badec8f059cb1edb780c9d59c1d5e65d.jpg', 3),
(17243, '5231754e32d382ddd1bc52d68ed76b34.jpg', 2),
(17247, 'e06f4fcec5f11523bfa9a4f816ece1e2.jpg', 4),
(17247, '9679a8ef53ee8c0a99571cb80b3a09b3.jpg', 1),
(17247, 'a3b0b6057d0a7d60dabff8c600bf75ed.jpg', 2),
(17247, 'b52779554bf8fafbbbc9967660f2f3a4.jpg', 3),
(17252, '614405111c129429b36db4caa81e7703.jpg', 2),
(17253, '55e221583956892fc77f1e329e24119a.jpg', 0),
(17253, '643e218be300ed4df3638bd233d6015b.jpg', 1),
(17253, '5dcbcfadde76b0af2ae3540ee1650626.jpg', 2),
(17253, '034935745c6ab35d3e9bb2574f9a3e01.jpg', 3),
(17253, 'cdfbbc3a18277ea3de2508ff4733c8c1.jpg', 4),
(17253, '80857f36168615d1cf58974fb5922040.jpg', 5),
(17254, '6f802e57a37010cbbc9f027cc070a80c.jpg', 0),
(17254, '35af1d514422dfc968c1df2ed05e6506.jpg', 1),
(17256, 'b2491ded9d9070458660583d0d29ee22.jpg', 0),
(17256, '2d6d911be654c0d392543eaa90307bd9.jpg', 1),
(17257, 'e8f25f63a9fc06a8a2ebecbedb1f8d97.jpg', 0),
(17257, '2622f03d80a532966f5e9b15899e7b4b.jpg', 1),
(17257, '36e875c205312b9e3b17e8bafd553e87.jpg', 2),
(17257, 'f579be10b3558b32a344fb13a4fe52c9.jpg', 3),
(17257, '9a923d0cab109c2c11ccca671fa24756.jpg', 4),
(17257, '6450c3a9afca0f1775ccef9d46b5974f.jpg', 5),
(17257, '4c49d041ce3ea884d2a1445362b92bbc.jpg', 6),
(17257, 'be09c9960a289fccef57ac02cb6670e0.jpg', 7),
(17257, '66deb4296702febdca1c590e76f3dda8.jpg', 8),
(17258, 'b9ec33b563d0a6814195603d90863021.jpg', 0),
(17258, '3b8b7c4ef935ea660e1c2aeb755e61bb.jpg', 1),
(17259, 'db06d0658768e0e4fd92c093fcddf4a7.jpeg', 0),
(17259, '5fb9f9f4064ec94377daf92fe3a0e139.jpeg', 1),
(17259, '484071f6a1462b759e85e43acd7507e4.jpeg', 2),
(17260, 'e057ae5f15db6877cc3152585689767c.jpg', 0),
(17260, 'ca931f5b3756b5086219aaa619175d70.jpg', 1),
(17260, 'e3e892656a18eeac5bc2b74795570f5a.jpg', 2),
(17260, '6f5a1af448eac971acef8ce2393a15be.jpg', 3),
(17260, '8f91e05ad9a14511dfb9596c4d30eea7.jpg', 4),
(17261, '1fc35f92ff44a16c2538a4abeb71534c.jpg', 0),
(17261, '8873867b57916b5f36f8c14452f0d791.jpg', 1),
(17261, '019469eac4ce12f428bfff22ac0a35b6.jpg', 2),
(17262, '00898ae4ee9a3038407d065255ac4d51.jpg', 0),
(17262, '76cfbf38a407ada16667a349eb775db0.jpg', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_product_properties`
--

DROP TABLE IF EXISTS `shop_product_properties`;
CREATE TABLE IF NOT EXISTS `shop_product_properties` (
  `id` int(11) NOT NULL,
  `csv_name` varchar(50) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `show_in_compare` tinyint(1) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `show_on_site` tinyint(1) DEFAULT NULL,
  `multiple` tinyint(1) DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `show_in_filter` tinyint(1) DEFAULT NULL,
  `main_property` tinyint(1) DEFAULT NULL,
  `show_faq` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=388 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_product_properties`
--

INSERT INTO `shop_product_properties` (`id`, `csv_name`, `active`, `show_in_compare`, `position`, `show_on_site`, `multiple`, `external_id`, `show_in_filter`, `main_property`, `show_faq`) VALUES
(387, 'pazmer', 1, 1, 0, 1, 1, NULL, 1, 0, 0),
(386, 'vozrastnaja-gruppa', 1, 1, 0, 1, 0, NULL, 1, 0, 0),
(385, 'obem-baka-l', 1, 0, 0, 1, 1, NULL, 1, 0, 0),
(383, 'material', 1, 1, 0, 1, 1, NULL, 1, 0, 0),
(382, 'garantija', 1, 1, 0, 1, 0, NULL, 1, 1, 0),
(381, 'obem-zhestkogo-diska', 1, 1, 0, 1, 1, NULL, 1, 0, 0),
(379, 'osnascheniekommunikatsii', 1, 1, 0, 1, 1, NULL, 1, 0, 0),
(378, 'obem-vstroennoj-pamjati-gb', 1, 1, 0, 1, 1, NULL, 1, 0, 0),
(377, 'operatsionnaja-sistema', 1, 1, 0, 1, 1, NULL, 1, 0, 0),
(376, 'razreshenie-ekrana', 1, 1, 0, 1, 1, NULL, 1, 0, 0),
(375, 'diagonal-ekrana', 1, 1, 0, 1, 1, NULL, 1, 0, 0),
(374, 'obem-gb', 1, 1, 0, 1, 1, NULL, 1, 0, 1),
(373, 'interfejs', 1, 1, 0, 1, 1, NULL, 1, 0, 0),
(372, 'material-korpusa', 1, 1, 0, 1, 1, NULL, 1, 0, 0),
(371, 'tipustrojstva', 1, 1, 0, 1, 0, NULL, 1, 0, 0),
(380, 'obem-operativnoj-pamjati-gb', 1, 1, 0, 1, 1, NULL, 1, 0, 0),
(369, 'tsvet', 1, 0, 0, 1, 1, NULL, 1, 1, 0),
(368, 'podderzhka-obemnogo-zvuka-', 1, 1, 0, 1, 1, NULL, 1, 0, 0),
(367, 'maksimalnaja-vosproizvodimaja-chastota-kgts', 1, 1, 0, 1, 1, NULL, 1, 0, 0),
(366, 'minimalnaja-vosproizvodimaja-chastota-gts-', 1, 1, 0, 1, 1, NULL, 1, 0, 0),
(365, 'soedinitelnyj-razem', 1, 1, 0, 1, 1, NULL, 1, 0, 0),
(364, 'tip-besprovodnogo-podkljuchenija', 1, 0, 0, 0, 1, NULL, 1, 0, 0),
(363, 'sposob-podkljuchenija', 1, 1, 0, 1, 1, NULL, 1, 0, 0),
(362, 'tip-ustrojstva', 1, 0, 0, 1, 0, NULL, 1, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_product_properties_categories`
--

DROP TABLE IF EXISTS `shop_product_properties_categories`;
CREATE TABLE IF NOT EXISTS `shop_product_properties_categories` (
  `property_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_product_properties_categories`
--

INSERT INTO `shop_product_properties_categories` (`property_id`, `category_id`) VALUES
(362, 3017),
(362, 3023),
(363, 3017),
(364, 3017),
(365, 3017),
(366, 3017),
(367, 3017),
(368, 3017),
(369, 3014),
(369, 3015),
(369, 3017),
(369, 3018),
(369, 3019),
(369, 3023),
(369, 3024),
(369, 3025),
(369, 3026),
(369, 3027),
(369, 3028),
(369, 3029),
(369, 3030),
(369, 3031),
(371, 3019),
(372, 3017),
(372, 3018),
(372, 3019),
(372, 3023),
(372, 3024),
(372, 3025),
(373, 3015),
(373, 3019),
(373, 3024),
(375, 3014),
(375, 3015),
(375, 3018),
(375, 3023),
(375, 3024),
(375, 3025),
(375, 3026),
(376, 3018),
(376, 3023),
(376, 3024),
(376, 3025),
(377, 3015),
(377, 3018),
(377, 3023),
(377, 3024),
(377, 3025),
(378, 3015),
(378, 3018),
(378, 3023),
(378, 3024),
(378, 3025),
(379, 3014),
(379, 3018),
(379, 3023),
(379, 3025),
(380, 3014),
(380, 3018),
(380, 3023),
(380, 3024),
(380, 3025),
(380, 3026),
(381, 3015),
(381, 3018),
(381, 3023),
(381, 3024),
(381, 3025),
(381, 3026),
(382, 3014),
(382, 3015),
(382, 3017),
(382, 3018),
(382, 3019),
(382, 3023),
(382, 3024),
(382, 3025),
(382, 3026),
(382, 3027),
(382, 3028),
(382, 3029),
(382, 3030),
(382, 3031),
(383, 3027),
(383, 3028),
(383, 3030),
(383, 3031),
(385, 3029),
(386, 3030),
(387, 3031);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_product_properties_data`
--

DROP TABLE IF EXISTS `shop_product_properties_data`;
CREATE TABLE IF NOT EXISTS `shop_product_properties_data` (
  `id` int(11) NOT NULL,
  `property_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `value` varchar(500) NOT NULL,
  `locale` varchar(5) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=89254 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_product_properties_data`
--

INSERT INTO `shop_product_properties_data` (`id`, `property_id`, `product_id`, `value`, `locale`) VALUES
(89253, 372, 17233, 'Пластик', 'ru'),
(89252, 372, 17233, 'Металл', 'ru'),
(89249, 366, 17233, '11-15', 'ru'),
(89250, 367, 17233, '21-25', 'ru'),
(89251, 368, 17233, '7.1', 'ru'),
(89248, 365, 17233, 'USB', 'ru'),
(89247, 365, 17233, 'Jack 3,5 мм', 'ru'),
(89245, 363, 17233, 'Проводной', 'ru'),
(89244, 362, 17233, 'Наушники без микрофона', 'ru'),
(89239, 366, 17234, '11-15', 'ru'),
(89240, 367, 17234, '26-30', 'ru'),
(89241, 368, 17234, '5.1', 'ru'),
(89087, 369, 17246, 'Красный', 'ru'),
(89238, 365, 17234, 'USB', 'ru'),
(89237, 364, 17234, 'Радиоканал', 'ru'),
(89236, 363, 17234, 'Проводной', 'ru'),
(89235, 363, 17234, 'Беспроводной', 'ru'),
(89234, 362, 17234, 'Наушники с микрофоном', 'ru'),
(89243, 372, 17234, 'Пластик', 'ru'),
(89242, 372, 17234, 'Другое', 'ru'),
(89204, 366, 17235, 'до 5', 'ru'),
(89205, 367, 17235, '31 и более', 'ru'),
(89206, 368, 17235, '7.1', 'ru'),
(89086, 369, 17246, 'Белый', 'ru'),
(89203, 365, 17235, 'mini-USB', 'ru'),
(89199, 364, 17235, 'Радиоканал', 'ru'),
(89198, 363, 17235, 'Проводной', 'ru'),
(89207, 372, 17235, 'Пластик', 'ru'),
(89076, 375, 17246, '15&quot;', 'ru'),
(89202, 365, 17235, 'micro-USB', 'ru'),
(89201, 365, 17235, 'USB', 'ru'),
(89200, 365, 17235, 'Jack 3,5 мм', 'ru'),
(89197, 363, 17235, 'Беспроводной', 'ru'),
(89196, 362, 17235, 'Аудио колонки', 'ru'),
(89060, 369, 17247, 'Черный', 'ru'),
(89059, 382, 17247, '2 года', 'ru'),
(89048, 375, 17247, '15&quot;', 'ru'),
(89046, 382, 17249, '2 года', 'ru'),
(89193, 373, 17236, 'USB 3.0', 'ru'),
(89192, 373, 17236, 'USB 2.0', 'ru'),
(89191, 372, 17236, 'Пластик', 'ru'),
(89190, 372, 17236, 'Металл', 'ru'),
(89189, 371, 17236, 'USB flash-драйв', 'ru'),
(89040, 382, 17248, '2 года', 'ru'),
(89186, 373, 17237, 'eSATA', 'ru'),
(89185, 372, 17237, 'Металл', 'ru'),
(89184, 371, 17237, 'Жесткий диск', 'ru'),
(89035, 369, 17248, 'Черный', 'ru'),
(89180, 372, 17238, 'Пластик', 'ru'),
(89179, 371, 17238, 'Карта памяти', 'ru'),
(89181, 373, 17238, 'UHS 1', 'ru'),
(89043, 369, 17249, 'Синий/Голубой', 'ru'),
(89170, 377, 17239, 'Без ОС', 'ru'),
(89169, 377, 17239, 'Windows 8', 'ru'),
(89168, 377, 17239, 'Windows 7', 'ru'),
(89167, 376, 17239, '1920x1200', 'ru'),
(89171, 378, 17239, '8', 'ru'),
(89165, 372, 17239, 'Пластик', 'ru'),
(89114, 382, 17244, '12 месяцев', 'ru'),
(89176, 380, 17239, '4', 'ru'),
(89159, 377, 17240, 'Android 4.X', 'ru'),
(89175, 379, 17239, 'Wi-Fi', 'ru'),
(89174, 379, 17239, 'USB', 'ru'),
(89173, 379, 17239, 'HDMI', 'ru'),
(89172, 379, 17239, 'DLNA', 'ru'),
(89177, 381, 17239, '500', 'ru'),
(89157, 373, 17240, 'micro-USB', 'ru'),
(89156, 373, 17240, 'Wi-Fi', 'ru'),
(89155, 373, 17240, 'USB 2.0', 'ru'),
(89161, 381, 17240, '32', 'ru'),
(89150, 378, 17241, '32', 'ru'),
(89149, 377, 17241, 'Apple iOS', 'ru'),
(89151, 381, 17241, '350', 'ru'),
(89042, 369, 17249, 'Красный', 'ru'),
(89147, 373, 17241, 'Проприетарный разъем Apple iPad, iPod', 'ru'),
(89146, 373, 17241, 'USB 3.0', 'ru'),
(89145, 373, 17241, 'USB 2.0', 'ru'),
(89144, 373, 17241, 'UHS 1', 'ru'),
(89041, 369, 17249, 'Желтый', 'ru'),
(89138, 377, 17242, 'Android 5.x', 'ru'),
(89099, 382, 17245, '2 года', 'ru'),
(89140, 381, 17242, '32', 'ru'),
(89029, 382, 17250, '2 года', 'ru'),
(89136, 373, 17242, 'micro-USB', 'ru'),
(89135, 373, 17242, 'USB 3.0', 'ru'),
(89134, 373, 17242, 'USB 2.0', 'ru'),
(89133, 373, 17242, 'UHS 1', 'ru'),
(89132, 373, 17242, 'FireWire', 'ru'),
(89113, 381, 17244, '350', 'ru'),
(89105, 377, 17244, 'Без ОС', 'ru'),
(89104, 377, 17244, 'Windows 8', 'ru'),
(89103, 376, 17244, '1920x1200', 'ru'),
(89102, 375, 17244, '23&quot; и больше', 'ru'),
(89101, 372, 17244, 'Металл', 'ru'),
(89112, 380, 17244, '2', 'ru'),
(89111, 379, 17244, 'USB-Host/OTG', 'ru'),
(89110, 379, 17244, 'USB', 'ru'),
(89109, 379, 17244, 'NFC', 'ru'),
(89108, 379, 17244, 'HDMI', 'ru'),
(89107, 379, 17244, 'GPS', 'ru'),
(89106, 379, 17244, 'DLNA', 'ru'),
(89100, 369, 17244, 'Черный', 'ru'),
(89098, 381, 17245, '64', 'ru'),
(89027, 369, 17250, 'Коричневый', 'ru'),
(89092, 377, 17245, 'Windows 8', 'ru'),
(89091, 376, 17245, '2560x1600', 'ru'),
(89089, 372, 17245, 'Пластик', 'ru'),
(89097, 380, 17245, '2', 'ru'),
(89096, 379, 17245, 'USB-Host/OTG', 'ru'),
(89095, 379, 17245, 'USB', 'ru'),
(89094, 379, 17245, 'HDMI', 'ru'),
(89093, 379, 17245, 'DLNA', 'ru'),
(89088, 369, 17245, 'Белый', 'ru'),
(89083, 380, 17246, '2', 'ru'),
(89026, 383, 17251, 'Резина', 'ru'),
(89078, 377, 17246, 'Windows 8', 'ru'),
(89077, 376, 17246, '1280x800', 'ru'),
(89085, 382, 17246, '2 года', 'ru'),
(89075, 372, 17246, 'Пластик', 'ru'),
(89074, 372, 17246, 'Металл', 'ru'),
(89082, 379, 17246, 'Wi-Fi', 'ru'),
(89081, 379, 17246, 'USB-Host/OTG', 'ru'),
(89080, 379, 17246, 'USB', 'ru'),
(89079, 379, 17246, 'NFC', 'ru'),
(89084, 381, 17246, '350', 'ru'),
(89119, 381, 17243, '500', 'ru'),
(89118, 380, 17243, '4', 'ru'),
(89057, 380, 17247, '4', 'ru'),
(89052, 378, 17247, '16', 'ru'),
(89049, 376, 17247, '1280x800', 'ru'),
(89058, 381, 17247, '500', 'ru'),
(89023, 382, 17251, '9 месяцев', 'ru'),
(89051, 377, 17247, 'Без ОС', 'ru'),
(89050, 377, 17247, 'Windows 8', 'ru'),
(89047, 372, 17247, 'Пластик', 'ru'),
(89056, 379, 17247, 'Wi-Fi', 'ru'),
(89055, 379, 17247, 'USB-Host/OTG', 'ru'),
(89054, 379, 17247, 'USB', 'ru'),
(89053, 379, 17247, 'HDMI', 'ru'),
(89022, 369, 17251, 'Синий/Голубой', 'ru'),
(89021, 369, 17251, 'Оранжевый', 'ru'),
(89090, 375, 17245, '15&quot;', 'ru'),
(89045, 383, 17249, 'Ткань Антара', 'ru'),
(89044, 383, 17249, 'Дерево', 'ru'),
(89018, 382, 17252, '6 месяцев', 'ru'),
(89017, 369, 17252, 'Черный', 'ru'),
(88992, 383, 17257, 'Пластик', 'ru'),
(88991, 383, 17257, 'Металл', 'ru'),
(88990, 383, 17257, 'МДФ', 'ru'),
(89039, 383, 17248, 'Экокожа', 'ru'),
(89038, 383, 17248, 'Ткань Антара', 'ru'),
(89037, 383, 17248, 'Металл', 'ru'),
(89036, 383, 17248, 'Кожа', 'ru'),
(89028, 383, 17250, 'ДСП', 'ru'),
(89013, 369, 17253, 'Черный', 'ru'),
(89014, 382, 17253, '6 месяцев', 'ru'),
(89025, 383, 17251, 'Текстиль', 'ru'),
(89024, 383, 17251, 'Кожа', 'ru'),
(89012, 369, 17253, 'Красный', 'ru'),
(89003, 369, 17254, 'Оранжевый', 'ru'),
(89004, 382, 17254, '2 года', 'ru'),
(89020, 383, 17252, 'Текстиль', 'ru'),
(89019, 383, 17252, 'Неопрен', 'ru'),
(88998, 382, 17255, '2 года', 'ru'),
(89016, 383, 17253, 'Текстиль', 'ru'),
(89015, 383, 17253, 'Неопрен', 'ru'),
(88997, 369, 17255, 'Желтый', 'ru'),
(88995, 382, 17256, '2 года', 'ru'),
(88994, 369, 17256, 'Красный', 'ru'),
(88988, 382, 17257, '2 года', 'ru'),
(88987, 369, 17257, 'Красный', 'ru'),
(89005, 385, 17254, '2-5', 'ru'),
(89011, 369, 17253, 'Зеленый/Салатовый', 'ru'),
(88999, 385, 17255, '6-12', 'ru'),
(88996, 385, 17256, 'более 20', 'ru'),
(88989, 383, 17257, 'Дерево', 'ru'),
(88986, 369, 17257, 'Коричневый', 'ru'),
(88983, 382, 17258, '2 года', 'ru'),
(88993, 386, 17257, 'от 15 лет и старше', 'ru'),
(88984, 383, 17258, 'Дерево', 'ru'),
(88978, 382, 17259, '2 года', 'ru'),
(88977, 369, 17259, 'Красный', 'ru'),
(88968, 382, 17260, '6 месяцев', 'ru'),
(88980, 383, 17259, 'Дерево', 'ru'),
(88979, 383, 17259, 'ДСП', 'ru'),
(88967, 369, 17260, 'Оранжевый', 'ru'),
(88981, 386, 17259, 'от 7 до 15 лет', 'ru'),
(88982, 369, 17258, 'Оранжевый', 'ru'),
(88985, 386, 17258, 'до 2 лет', 'ru'),
(88971, 383, 17260, 'Хлопок', 'ru'),
(88970, 383, 17260, 'Трикотаж', 'ru'),
(88969, 383, 17260, 'Текстиль', 'ru'),
(88959, 382, 17261, '6 месяцев', 'ru'),
(88958, 369, 17261, 'Коричневый', 'ru'),
(88957, 386, 17262, 'до 2 лет', 'ru'),
(88956, 383, 17262, 'Хлопок', 'ru'),
(88955, 382, 17262, '2 года', 'ru'),
(88976, 387, 17260, 'S', 'ru'),
(88975, 387, 17260, 'M', 'ru'),
(88974, 387, 17260, 'L', 'ru'),
(88973, 387, 17260, '3X', 'ru'),
(88972, 387, 17260, '2X', 'ru'),
(88966, 387, 17261, 'M', 'ru'),
(88965, 387, 17261, 'L', 'ru'),
(88964, 387, 17261, '3X', 'ru'),
(88963, 387, 17261, '2X', 'ru'),
(88954, 369, 17262, 'Желтый', 'ru'),
(88961, 383, 17261, 'Текстиль', 'ru'),
(88962, 383, 17261, 'Хлопок', 'ru'),
(88960, 383, 17261, 'Полиэстер', 'ru'),
(89115, 369, 17243, 'Оранжевый', 'ru'),
(89116, 369, 17243, 'Черный', 'ru'),
(89117, 375, 17243, '11,6&quot; и больше', 'ru'),
(89120, 382, 17243, '2 года', 'ru'),
(89137, 375, 17242, '6,0&quot;', 'ru'),
(89141, 382, 17242, '2 года', 'ru'),
(89143, 369, 17242, 'Черный', 'ru'),
(89142, 369, 17242, 'Белый', 'ru'),
(89139, 378, 17242, '128 и больше', 'ru'),
(89148, 375, 17241, '4,5&quot;', 'ru'),
(89152, 382, 17241, '2 года', 'ru'),
(89153, 369, 17241, 'Белый', 'ru'),
(89154, 369, 17241, 'Серебряный/Серый', 'ru'),
(89158, 375, 17240, '4&quot;', 'ru'),
(89160, 378, 17240, '16', 'ru'),
(89162, 382, 17240, '6 месяцев', 'ru'),
(89163, 369, 17240, 'Фиолетовый/Пурпурный', 'ru'),
(89164, 369, 17239, 'Черный', 'ru'),
(89166, 375, 17239, '4,6-4,8&quot;', 'ru'),
(89178, 382, 17239, '9 месяцев', 'ru'),
(89182, 382, 17238, '6 месяцев', 'ru'),
(89183, 369, 17238, 'Черный', 'ru'),
(89187, 382, 17237, '6 месяцев', 'ru'),
(89188, 369, 17237, 'Черный', 'ru'),
(89194, 382, 17236, '6 месяцев', 'ru'),
(89195, 369, 17236, 'Серебряный/Серый', 'ru'),
(89208, 382, 17235, '2 года', 'ru'),
(89209, 369, 17235, 'Черный', 'ru'),
(89246, 364, 17233, 'Радиоканал', 'ru');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_product_properties_data_i18n`
--

DROP TABLE IF EXISTS `shop_product_properties_data_i18n`;
CREATE TABLE IF NOT EXISTS `shop_product_properties_data_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `value` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `shop_product_properties_i18n`
--

DROP TABLE IF EXISTS `shop_product_properties_i18n`;
CREATE TABLE IF NOT EXISTS `shop_product_properties_i18n` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `data` text,
  `description` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_product_properties_i18n`
--

INSERT INTO `shop_product_properties_i18n` (`id`, `name`, `locale`, `data`, `description`) VALUES
(385, 'Объем бака, л', 'ru', 'a:5:{i:0;s:3:"2-5";i:1;s:4:"6-12";i:2;s:5:"13-20";i:3;s:13:"более 20";i:4;s:6:"до 2";}', ''),
(386, 'Возрастная группа', 'ru', 'a:4:{i:0;s:13:"до 2 лет";i:1;s:20:"от 2 до 7 лет";i:2;s:21:"от 7 до 15 лет";i:3;s:30:"от 15 лет и старше";}', 'Группа особей одного возраста'),
(387, 'Pазмер', 'ru', 'a:8:{i:0;s:2:"2X";i:1;s:2:"3X";i:2;s:1:"L";i:3;s:1:"M";i:4;s:1:"S";i:5;s:2:"XL";i:6;s:2:"XS";i:7;s:3:"XXL";}', ''),
(375, 'Диагональ экрана', 'ru', 'a:22:{i:0;s:20:"2,3" и меньше";i:1;s:8:"2,4-3,9"";i:2;s:2:"4"";i:3;s:4:"4,3"";i:4;s:4:"4,5"";i:5;s:8:"4,6-4,8"";i:6;s:2:"5"";i:7;s:8:"5,1-5,3"";i:8;s:4:"5,5"";i:9;s:8:"5,6-5,9"";i:10;s:4:"6,0"";i:11;s:2:"7"";i:12;s:11:"7,7" - 8,4"";i:13;s:11:"8,9" - 9,4"";i:14;s:4:"9,7"";i:15;s:11:"10" - 10,8"";i:17;s:21:"11,6" и больше";i:19;s:3:"15"";i:21;s:3:"17"";i:22;s:3:"21"";i:23;s:3:"23"";i:24;s:19:"23" и больше";}', ''),
(376, 'Разрешение экрана', 'ru', 'a:13:{i:0;s:7:"800x480";i:1;s:7:"800x600";i:2;s:7:"960x540";i:3;s:8:"1024x600";i:4;s:8:"1024x768";i:5;s:8:"1280x800";i:6;s:8:"1366x768";i:7;s:8:"1440x900";i:8;s:9:"1920x1080";i:9;s:9:"1920x1200";i:10;s:9:"2048x1536";i:11;s:9:"2160x1440";i:12;s:9:"2560x1600";}', ''),
(377, 'Операционная система', 'ru', 'a:9:{i:0;s:11:"Android 4.X";i:1;s:11:"Android 5.x";i:2;s:9:"Apple iOS";i:3;s:10:"Symbian OS";i:4;s:9:"Windows 7";i:5;s:9:"Windows 8";i:6;s:13:"Windows Phone";i:7;s:10:"Windows RT";i:8;s:11:"Без ОС";}', ''),
(378, 'Объем встроенной памяти, ГБ', 'ru', 'a:6:{i:0;s:1:"8";i:1;s:2:"16";i:2;s:2:"32";i:3;s:2:"64";i:4;s:19:"128 и больше";i:5;s:14:"Меньше 8";}', ''),
(379, 'Оснащение/Коммуникации', 'ru', 'a:13:{i:0;s:9:"Bluetooth";i:1;s:4:"DLNA";i:2;s:8:"Ethernet";i:3;s:3:"GPS";i:4;s:4:"HDMI";i:5;s:12:"MHL/SlimPort";i:6;s:3:"NFC";i:7;s:3:"USB";i:8;s:12:"USB-Host/OTG";i:9;s:5:"Wi-Fi";i:10;s:42:"Док-станция/клавиатура";i:11;s:18:"Картридер";i:12;s:35:"Комплектный стилус";}', ''),
(381, 'Oбъем жесткого диска Гб', 'ru', 'a:7:{i:0;s:2:"12";i:1;s:2:"32";i:2;s:2:"64";i:3;s:3:"128";i:4;s:3:"350";i:5;s:3:"500";i:6;s:3:"750";}', ''),
(382, 'Гарантия', 'ru', 'a:5:{i:0;s:10:"2 года";i:1;s:24:"5 лет и больше";i:2;s:16:"6 месяцев";i:3;s:16:"9 месяцев";i:4;s:17:"12 месяцев";}', ''),
(383, 'Материал', 'ru', 'a:18:{i:0;s:6:"ДСП";i:1;s:12:"Дерево";i:2;s:10:"Джинс";i:3;s:8:"Кожа";i:4;s:6:"МДФ";i:5;s:12:"Металл";i:6;s:14:"Неопрен";i:7;s:14:"Пластик";i:8;s:18:"Полиэстер";i:9;s:16:"Текстиль";i:10;s:23:"Ткань Антара";i:11;s:16:"Трикотаж";i:12;s:8:"Флис";i:13;s:12:"Хлопок";i:14;s:12:"Шерсть";i:15;s:14:"Экокожа";i:16;s:43:"Экокожа перфорированая";i:17;s:12:"Резина";}', ''),
(374, 'Объем, ГБ', 'ru', 'a:16:{i:0;s:15:"2 и менее";i:1;s:1:"4";i:2;s:1:"8";i:3;s:2:"16";i:4;s:2:"32";i:5;s:2:"64";i:6;s:3:"128";i:7;s:3:"450";i:8;s:3:"500";i:9;s:7:"600-800";i:10;s:4:"1000";i:11;s:9:"1250-1500";i:12;s:4:"2000";i:13;s:9:"2500-3000";i:14;s:4:"4000";i:15;s:4:"5000";}', ''),
(380, 'Объем оперативной памяти Гб', 'ru', 'a:5:{i:0;s:1:"2";i:1;s:1:"4";i:2;s:1:"8";i:3;s:2:"16";i:4;s:2:"32";}', ''),
(371, 'Тип устройства', 'ru', 'a:3:{i:0;s:20:"USB flash-драйв";i:1;s:23:"Жесткий диск";i:2;s:23:"Карта памяти";}', ''),
(372, 'Материал корпуса', 'ru', 'a:3:{i:0;s:12:"Другое";i:1;s:12:"Металл";i:2;s:14:"Пластик";}', ''),
(373, 'Интерфейс', 'ru', 'a:10:{i:0;s:8:"FireWire";i:1;s:9:"Lightning";i:2;s:11:"Thunderbolt";i:3;s:5:"UHS 1";i:4;s:7:"USB 2.0";i:5;s:7:"USB 3.0";i:6;s:5:"Wi-Fi";i:7;s:5:"eSATA";i:8;s:9:"micro-USB";i:9;s:56:"Проприетарный разъем Apple iPad, iPod";}', ''),
(368, 'Поддержка объемного звука  ', 'ru', 'a:2:{i:0;s:3:"5.1";i:1;s:3:"7.1";}', ''),
(369, 'Цвет', 'ru', 'a:12:{i:0;s:10:"Белый";i:1;s:12:"Другой";i:2;s:12:"Желтый";i:3;s:33:"Зеленый/Салатовый";i:4;s:20:"Коричневый";i:5;s:14:"Красный";i:6;s:18:"Оранжевый";i:7;s:31:"Серебряный/Серый";i:8;s:25:"Синий/Голубой";i:9;s:39:"Фиолетовый/Пурпурный";i:10;s:12:"Черный";i:11;s:14:"Розовый";}', ''),
(366, 'Минимальная частота, Гц  ', 'ru', 'a:7:{i:0;s:4:"6-10";i:1;s:5:"11-15";i:2;s:5:"16-20";i:3;s:5:"21-30";i:4;s:5:"31-50";i:5;s:16:"51 и более";i:6;s:6:"до 5";}', ''),
(367, 'Максимальная частота, кГц', 'ru', 'a:6:{i:0;s:5:"11-15";i:1;s:5:"16-20";i:2;s:5:"21-25";i:3;s:5:"26-30";i:4;s:16:"31 и более";i:5;s:7:"до 10";}', ''),
(365, 'Соединительный разъем', 'ru', 'a:6:{i:0;s:13:"Jack 3,5 мм";i:1;s:13:"Jack 6,3 мм";i:2;s:3:"USB";i:3;s:9:"micro-USB";i:4;s:8:"mini-USB";i:5;s:26:"Проприетарный";}', ''),
(363, 'Способ подключения', 'ru', 'a:2:{i:0;s:24:"Беспроводной";i:1;s:18:"Проводной";}', ''),
(364, 'Тип беспроводного подключения', 'ru', 'a:2:{i:0;s:4:"ИК";i:1;s:20:"Радиоканал";}', ''),
(362, 'Тип устройства', 'ru', 'a:9:{i:0;s:25:"Аудио колонки";i:1;s:43:"Компьютерная гарнитура";i:2;s:16:"Моноблок";i:3;s:42:"Наушники без микрофона";i:4;s:40:"Наушники с микрофоном";i:5;s:14:"Ноутбук";i:6;s:4:"ПК";i:7;s:14:"Планшет";i:8;s:39:"Телефонная гарнитура";}', '');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_product_variants`
--

DROP TABLE IF EXISTS `shop_product_variants`;
CREATE TABLE IF NOT EXISTS `shop_product_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` double(20,5) NOT NULL,
  `number` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `mainImage` varchar(255) DEFAULT NULL,
  `external_id` varchar(255) DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `price_in_main` double(20,5) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=18041 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_product_variants`
--

INSERT INTO `shop_product_variants` (`id`, `product_id`, `price`, `number`, `stock`, `position`, `mainImage`, `external_id`, `currency`, `price_in_main`) VALUES
(17934, 17233, 40.00000, 'au-17934', 0, NULL, '109cc4671f2da15e5d199e95246fe3bb.jpg', NULL, 1, 40.00000),
(17935, 17233, 43.00000, 'au-17935', 0, 1, 'b97392d25e4f63dd768b60b782b4c9ed.jpg', NULL, 1, 43.00000),
(17937, 17234, 40.00000, 'au-17937', 1, NULL, 'b775166a4945013ff8a34ac0c5758f30.jpg', NULL, 1, 40.00000),
(17938, 17234, 60.00000, 'au-17938', 1, 1, '93a112b70456573a0b4ec737e17982a2.jpg', NULL, 1, 60.00000),
(17939, 17235, 40.00000, 'au-17939', 1, NULL, 'c22411d7fdd57cccfa80fcbbde0481cd.jpg', NULL, 1, 40.00000),
(17940, 17236, 10.00000, 'hr-17940', 1, NULL, '28ed4775c04f42f63e090af581343bf4.jpg', NULL, 1, 10.00000),
(17941, 17236, 15.00000, 'hr-17941', 1, 1, '7d481bc091cd04cc80e1e0e860bd24da.jpg', NULL, 1, 15.00000),
(17942, 17236, 20.00000, 'hr-17942', 1, 2, 'beae55a999f6a35a221395524743e9ad.jpg', NULL, 1, 20.00000),
(17943, 17236, 25.00000, 'hr-17943', 1, 3, '571baabf376b67f1b9c7c69b897a6f6d.jpg', NULL, 1, 25.00000),
(17944, 17237, 90.00000, 'hr-17944', 1, NULL, '110c5a8c7d2ae26a323e422b4cecd239.jpg', NULL, 1, 90.00000),
(17945, 17237, 95.00000, 'hr-17945', 1, 1, '2fc94e99c527930629b19b582f4d42c1.jpg', NULL, 1, 95.00000),
(17946, 17237, 100.00000, 'hr-17946', 1, 2, '2162c023e816af31b668f5bc0535f845.jpg', NULL, 1, 100.00000),
(17947, 17237, 140.00000, 'hr-17947', 1, 3, 'd73e8e8bf88dd3881a8d3c14a76c8a7c.jpg', NULL, 1, 140.00000),
(17948, 17238, 10.00000, 'hr-17948', 1, NULL, '500bc9b9a8f9889054072ea2bb210739.jpg', NULL, 1, 10.00000),
(17949, 17238, 15.00000, 'hr-17949', 1, 1, '7071a83af0a37d6aeae002394bf1f656.jpg', NULL, 1, 15.00000),
(17950, 17238, 20.00000, 'hr-17950', 1, 2, '06ec550fd399cd31089ff4b0ed2b44c7.jpg', NULL, 1, 20.00000),
(17951, 17238, 30.00000, 'hr-17951', 1, 3, 'adf4f72a6b539ec8f6addb456b491a8d.jpg', NULL, 1, 30.00000),
(17952, 17239, 1220.00000, 'pk-17952', 1, NULL, '3ce5a44fd0468e6822541cd0683f8e26.jpg', NULL, 1, 1220.00000),
(17953, 17239, 1240.00000, 'pk-17953', 1, 1, 'bf1eb38ffa4fdb8986e044770fbade36.jpg', NULL, 1, 1240.00000),
(17954, 17239, 1200.00000, 'pk-17954', 1, 2, '2bf2776ef089c992fe0c64b9095907c8.jpg', NULL, 1, 1200.00000),
(17955, 17240, 1220.00000, '1446043642226', 1, NULL, '', NULL, 1, 1220.00000),
(17956, 17240, 1220.00000, '14460436421719', 1, 1, '', NULL, 1, 1220.00000),
(17957, 17240, 1220.00000, '14460436422489', 1, 2, '', NULL, 1, 1220.00000),
(17958, 17241, 1220.00000, '1443628126776', 1, NULL, '407105a45a4b7877fd11eec3a2001f43.png', NULL, 1, 1220.00000),
(17959, 17241, 2240.00000, '14436281261888', 1, 1, '71be5c23123fd09f5926416f82b1a09a.png', NULL, 1, 2240.00000),
(17960, 17241, 5490.00000, '14436281262987', 1, 2, 'c4e28c9cb4275e6c48fadd2a440b293a.png', NULL, 1, 5490.00000),
(17961, 17242, 1220.00000, 'pl-17961', 1, NULL, 'acf69088a10977480c618fba04867a77.jpg', NULL, 1, 1220.00000),
(17962, 17242, 1220.00000, 'pl-17962', 1, 1, 'fe1bbef36cb32027aae323d438977f91.png', NULL, 1, 1220.00000),
(17963, 17242, 1220.00000, 'pl-17963', 1, 2, '7946500aef0026c9a9a8c4d435dc973b.png', NULL, 1, 1220.00000),
(17964, 17242, 1220.00000, 'pl-17964', 1, 3, '173e82cf51b64a86cd025dca49f9db38.png', NULL, 1, 1220.00000),
(17965, 17243, 1220.00000, 'no-17965', 1, NULL, '81128bf3852c8e280ace44a03fc8361c.jpg', NULL, 1, 1220.00000),
(17966, 17243, 1220.35000, 'no-17966', 9, 1, 'efc45a8b8f889ce3259fe0882fc28364.jpg', NULL, 1, 1220.35000),
(17967, 17243, 1420.15000, 'no-17967', 1, 2, '056e23f42e6eca17023a9a7bbd6d3e98.jpg', NULL, 1, 1420.15000),
(17968, 17243, 220.86000, 'no-17968', 0, 4, 'fd9ab9996c721f1532a366c297f99a15.jpg', NULL, 1, 220.86000),
(17969, 17243, 1220.00000, 'no-17969', 1, 3, '27f1cea192b1562e3bbaf271cca35910.jpg', NULL, 1, 1220.00000),
(17970, 17244, 1310.00000, 'pk-17970', 1, NULL, '8b2371c31014b1e2491fc9a0ccf8997d.jpg', NULL, 1, 1310.00000),
(17971, 17244, 1280.00000, 'pk-17971', 1, 1, 'cf499b6786d174031134ed6cea5e52e8.jpg', NULL, 1, 1280.00000),
(17972, 17245, 1140.00000, 'pk-17972', 1, NULL, '8b5d4197be4fff6bcaf3319c8daf27b1.jpg', NULL, 1, 1140.00000),
(17973, 17245, 1120.00000, 'pk-17973', 1, 1, '1340b28911198c37dd707efce42c0ee4.jpg', NULL, 1, 1120.00000),
(17974, 17246, 1180.00000, 'no-17974', 1, NULL, 'fcc85ba171f59afad68aba91bcdbe957.jpg', NULL, 1, 1180.00000),
(17975, 17246, 1180.00000, 'no-17975', 1, 1, 'cbc89644815d6e051d617a4387acf55e.jpg', NULL, 1, 1180.00000),
(17976, 17247, 1220.00000, '14452601971949', 1, 1, '', NULL, 1, 1220.00000),
(17977, 17247, 1200.00000, '1445260197952', 1, NULL, '129979b58d18a04494ff8ccf2eb59020.jpg', NULL, 1, 1200.00000),
(17978, 17248, 240.00000, '144187834114', 1, NULL, '6d2d7b326e8a8a1f1ac036390b8f91df.jpg', NULL, 1, 240.00000),
(17981, 17249, 100.00000, '1443184297152', 1, NULL, '5b8e718b6dbc01a21f4a4b6303e335f8.jpg', NULL, 1, 100.00000),
(17982, 17249, 100.00000, '14431842971693', 1, 1, '8e4afccadda0a29ba9d3cdc0e60fbea2.jpg', NULL, 1, 100.00000),
(17983, 17249, 100.00000, '14431842972727', 1, 2, '06dab0d4a432e7b2996101c317b5db05.jpg', NULL, 1, 100.00000),
(17984, 17249, 100.00000, '14431842973566', 1, 3, 'daaad5656c35b37cfc83b145be95f993.jpg', NULL, 1, 100.00000),
(17985, 17250, 110.00000, 'me-17985', 1, NULL, 'c14a5734c55cb2698b6d5b93a10c0902.jpg', NULL, 1, 110.00000),
(17986, 17250, 110.00000, 'me-17986', 1, 1, '6671df8b4d4802b946f8a04f89c57edc.jpg', NULL, 1, 110.00000),
(17987, 17251, 110.00000, 'sp-17987', 1, NULL, 'daa5a957f567db38225c3ef5f73be2bc.jpg', NULL, 1, 110.00000),
(17988, 17251, 110.00000, 'sp-17988', 1, 1, '1a7538585e30dbf64c8970125bc248f2.jpg', NULL, 1, 110.00000),
(17989, 17251, 110.00000, 'sp-17989', 1, 2, 'ff0ca5a3aa39d21459b4cd28c60e78d3.jpg', NULL, 1, 110.00000),
(17990, 17252, 200.00000, 'sp-17990', 1, NULL, '666f57a6447b5d573c2eb39476d45278.jpg', NULL, 1, 200.00000),
(17991, 17252, 200.00000, 'sp-17991', 1, 1, '6d090482ee9925f44db6ec3ba9eb512e.jpg', NULL, 1, 200.00000),
(17992, 17252, 200.00000, 'sp-17992', 1, 2, 'd97e6cc118423e995aaa45fbe89cbf04.jpg', NULL, 1, 200.00000),
(17994, 17253, 120.00000, 'sp-17994', 1, NULL, '2d408577c1dd9614c1161835dd94d0d3.jpg', NULL, 1, 120.00000),
(17995, 17253, 120.00000, 'sp-17995', 1, 1, 'fe68412fc64e5a629a44b812ee9acae0.jpg', NULL, 1, 120.00000),
(17996, 17253, 120.00000, 'sp-17996', 1, 2, 'b80797ebf255b5e35da26ea1fd826080.jpg', NULL, 1, 120.00000),
(17997, 17253, 120.00000, 'sp-17997', 1, 3, 'd43971d4d8876a360639c7041d1bc260.jpg', NULL, 1, 120.00000),
(17998, 17253, 120.00000, 'sp-17998', 1, 4, 'e4bfa514d1971efd584cb28f95a8e847.jpg', NULL, 1, 120.00000),
(17999, 17254, 180.00000, 'do-17999', 1, NULL, 'bcaa58524b34afd86b86f988dd204184.jpg', NULL, 1, 180.00000),
(18000, 17254, 180.00000, 'do-18000', 1, 1, 'ad5d15993f1c08cfafa935eef5464e1e.jpg', NULL, 1, 180.00000),
(18001, 17254, 180.00000, 'do-18001', 1, 2, 'e0df876838d4c24c4346c6b89165439b.jpg', NULL, 1, 180.00000),
(18002, 17254, 180.00000, 'do-18002', 1, 3, 'e33ae52b3c0b8a44a623120bdf9f074f.jpg', NULL, 1, 180.00000),
(18003, 17255, 180.00000, 'do-18003', 1, NULL, 'bc7c5e82cf4e4ef271ce0e15f4733558.jpg', NULL, 1, 180.00000),
(18004, 17255, 180.00000, 'do-18004', 1, 1, '1f2cebd6c9727c48ff929233d513d096.jpg', NULL, 1, 180.00000),
(18005, 17255, 180.00000, 'do-18005', 1, 2, '17256e89877ff916ac5bfcea2013840e.jpg', NULL, 1, 180.00000),
(18006, 17256, 180.00000, 'do-18006', 1, NULL, '480a9d30494fa54cb28b40b70aa57156.jpg', NULL, 1, 180.00000),
(18007, 17256, 180.00000, 'do-18007', 1, 1, '75d7ba22300a1229de10df9f90731703.jpg', NULL, 1, 180.00000),
(18009, 17256, 180.00000, 'do-18009', 1, 2, 'cef198f0209c09cfaba55a7c177c5e7d.jpg', NULL, 1, 180.00000),
(18011, 17257, 180.00000, '14419068457', 0, NULL, '417d97a45aba9f80ee286172ba1ef14a.jpg', NULL, 1, 180.00000),
(18012, 17257, 180.00000, '14419068451333', 0, 1, '22ff02313095cc78a69373563379c082.jpg', NULL, 1, 180.00000),
(18013, 17257, 180.00000, '14419068452949', 0, 2, '7219a6f9544e619f8b4d2c9b266fe4c3.jpg', NULL, 1, 180.00000),
(18014, 17258, 180.00000, '1441723080319', 1, NULL, '2abc3303a1e16da5395390df0f056f7f.jpg', NULL, 1, 180.00000),
(18015, 17258, 180.00000, '14417230801107', 0, 2, 'bf71291cc1d8b3a1c07aab64e47808b9.jpg', NULL, 1, 180.00000),
(18016, 17258, 180.00000, '14417230802318', 1, 1, 'e1b63a5783647e695ad731b5b9673318.jpg', NULL, 1, 180.00000),
(18017, 17258, 180.00000, '14417230803471', 0, 3, '8c181b285b5e7fdabe8cbcd83476c7d6.jpg', NULL, 1, 180.00000),
(18018, 17259, 120.00000, 'de-18018', 1, NULL, '1b241bbad23dad4ceb9efbf58093822b.jpeg', NULL, 1, 120.00000),
(18019, 17259, 120.00000, 'de-18019', 1, 1, '175026abbb6fce8f99a695a5651ebbb2.jpeg', NULL, 1, 120.00000),
(18020, 17259, 120.00000, 'de-18020', 1, 2, 'c96ca72e02cd42b52f626a53b586038c.jpeg', NULL, 1, 120.00000),
(18021, 17259, 120.00000, 'de-18021', 1, 3, '77afe045f1e5a67a3cd3fe63d9fa312e.jpeg', NULL, 1, 120.00000),
(18022, 17259, 1110.00000, 'de-18022', 1, 4, '3b8ff13abc5e36a1b15835702e55e442.jpeg', NULL, 1, 1110.00000),
(18024, 17260, 20.00000, '1444837400362', 0, 3, 'dcc1f5216a2817b49cb98798d0bc32c2.jpg', NULL, 1, 20.00000),
(18025, 17260, 20.00000, '14448374001825', 1, NULL, '22395356ce4232ebb004a741f54d6599.jpg', NULL, 1, 20.00000),
(18026, 17260, 20.00000, '14448374002147', 1, 1, 'f936cdea200f3ee62b5f5470fd2f4f03.jpg', NULL, 1, 20.00000),
(18027, 17260, 20.00000, '1444837400384', 1, 2, 'a26e89a4a9445c7280a3c5cfa88af7d6.jpg', NULL, 1, 20.00000),
(18028, 17261, 25.00000, '1441899749415', 1, NULL, '655447cae8976d7fedec35d4b7d3e4ab.jpg', NULL, 1, 25.00000),
(18032, 17262, 50.00000, '1441720565186', 1, NULL, '62cff6a447fc6396f1bc7e72c325f177.jpg', NULL, 1, 50.00000),
(18033, 17262, 60.00000, '14417205651566', 1, 1, '419210f63fa4ee69df0f1be3935abf50.jpg', NULL, 1, 60.00000),
(18034, 17262, 50.00000, '14417205652341', 1, 2, 'c9765374a8020b07bfeba8ead6b8bf39.jpg', NULL, 1, 50.00000),
(18035, 17262, 50.00000, '1441720565361', 1, 3, 'daeb0ba7db3ab40495928dd4d7bdf125.jpg', NULL, 1, 50.00000),
(18036, 17262, 50.00000, '14417205654779', 1, 4, 'e91a84dd09d8d493f55953381792719e.jpg', NULL, 1, 50.00000);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_product_variants_i18n`
--

DROP TABLE IF EXISTS `shop_product_variants_i18n`;
CREATE TABLE IF NOT EXISTS `shop_product_variants_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `name` varchar(500) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_product_variants_i18n`
--

INSERT INTO `shop_product_variants_i18n` (`id`, `locale`, `name`) VALUES
(17934, 'ru', 'Сопротивление 35 Ω'),
(17935, 'ru', 'Сопротивление 30 Ω'),
(17937, 'ru', 'проводное соединение'),
(17938, 'ru', 'беспроводное соединение'),
(17939, 'ru', NULL),
(17940, 'ru', '8 Гб'),
(17941, 'ru', '16 Гб'),
(17942, 'ru', '32 Гб'),
(17943, 'ru', '64 Гб'),
(17944, 'ru', '60 Гб'),
(17945, 'ru', '120 Гб'),
(17946, 'ru', '240 Гб'),
(17947, 'ru', '500 Гб'),
(17948, 'ru', '16 Гб'),
(17949, 'ru', '32 Гб'),
(17950, 'ru', '64 Гб'),
(17951, 'ru', '128 Гб'),
(17952, 'ru', 'Windows 8.1'),
(17953, 'ru', 'Windows 7'),
(17954, 'ru', 'Без ОС'),
(17955, 'ru', 'Android 4.4.2'),
(17956, 'ru', 'android 5.0 lollipop'),
(17957, 'ru', 'android 6.0 milkshake'),
(17958, 'ru', 'Серебристый'),
(17959, 'ru', 'Золотистый'),
(17960, 'ru', 'Серый космос'),
(17961, 'ru', 'Basic'),
(17962, 'ru', 'Black'),
(17963, 'ru', 'White'),
(17964, 'ru', 'Sand'),
(17965, 'ru', 'Basic'),
(17966, 'ru', 'Orange'),
(17967, 'ru', 'Black'),
(17968, 'ru', 'Red'),
(17969, 'ru', 'Grey'),
(17970, 'ru', 'windows 8.1'),
(17971, 'ru', 'без ОС'),
(17972, 'ru', 'Windows 8.1'),
(17973, 'ru', 'Без ОС'),
(17974, 'ru', 'White'),
(17975, 'ru', 'Red'),
(17976, 'ru', 'Windows 8.1'),
(17977, 'ru', 'Linux'),
(17978, 'ru', NULL),
(17981, 'ru', 'Желтый'),
(17982, 'ru', 'Кобальт'),
(17983, 'ru', 'Красный'),
(17984, 'ru', 'Пурпурный'),
(17985, 'ru', 'Венге'),
(17986, 'ru', 'Орех'),
(17987, 'ru', 'Оранжевые'),
(17988, 'ru', 'Чёрные'),
(17989, 'ru', 'Белые'),
(17990, 'ru', 'L'),
(17991, 'ru', 'XL'),
(17992, 'ru', 'XXL'),
(17994, 'ru', 'Зеленый'),
(17995, 'ru', 'Красный'),
(17996, 'ru', 'Черный'),
(17997, 'ru', 'Желтый'),
(17998, 'ru', 'Синий'),
(17999, 'ru', 'Обычная'),
(18000, 'ru', 'с насадкой кородер НК-100'),
(18001, 'ru', 'с насадкой болгарка Е-1'),
(18002, 'ru', 'с насадкой винтовой дровокол'),
(18003, 'ru', 'Обычный'),
(18004, 'ru', 'с бензиновым двигателем G-200'),
(18005, 'ru', 'с дизельным двигателем G-200d'),
(18006, 'ru', 'Объем 25 л.'),
(18007, 'ru', 'Объем 30 л.'),
(18009, 'ru', 'Объем 45 л.'),
(18011, 'ru', 'Каштановый'),
(18012, 'ru', 'Красный'),
(18013, 'ru', 'Черный'),
(18014, 'ru', 'Бук'),
(18015, 'ru', 'Ольха'),
(18016, 'ru', 'Орех'),
(18017, 'ru', 'Белая'),
(18018, 'ru', 'Бук'),
(18019, 'ru', 'Орех'),
(18020, 'ru', 'Белый'),
(18021, 'ru', 'Ольха'),
(18022, 'ru', 'Комби'),
(18024, 'ru', 'Pink 2X'),
(18025, 'ru', 'Blue L'),
(18026, 'ru', 'Pink 3X'),
(18027, 'ru', 'Blue M'),
(18028, 'ru', NULL),
(18032, 'ru', 'Обычный'),
(18033, 'ru', 'Оранжевый'),
(18034, 'ru', 'Фиолетовый'),
(18035, 'ru', 'Зеленый'),
(18036, 'ru', 'Розовый');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_rbac_group`
--

DROP TABLE IF EXISTS `shop_rbac_group`;
CREATE TABLE IF NOT EXISTS `shop_rbac_group` (
  `id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_rbac_group`
--

INSERT INTO `shop_rbac_group` (`id`, `type`, `name`, `description`) VALUES
(1, 'shop', 'ShopAdminBanners', NULL),
(2, 'shop', 'ShopAdminBrands', NULL),
(3, 'shop', 'ShopAdminCallbacks', NULL),
(4, 'shop', 'ShopAdminCategories', NULL),
(5, 'shop', 'ShopAdminCharts', NULL),
(6, 'shop', 'ShopAdminComulativ', NULL),
(7, 'shop', 'ShopAdminCurrencies', NULL),
(8, 'shop', 'ShopAdminCustomfields', NULL),
(9, 'shop', 'ShopAdminDashboard', NULL),
(10, 'shop', 'ShopAdminDeliverymethods', NULL),
(11, 'shop', 'ShopAdminDiscounts', NULL),
(12, 'shop', 'ShopAdminGifts', NULL),
(13, 'shop', 'ShopAdminKits', NULL),
(14, 'shop', 'ShopAdminNotifications', NULL),
(15, 'shop', 'ShopAdminNotificationstatuses', NULL),
(16, 'shop', 'ShopAdminOrders', NULL),
(17, 'shop', 'ShopAdminOrderstatuses', NULL),
(18, 'shop', 'ShopAdminPaymentmethods', NULL),
(19, 'shop', 'ShopAdminProducts', NULL),
(20, 'shop', 'ShopAdminProductspy', NULL),
(21, 'shop', 'ShopAdminProperties', NULL),
(22, 'shop', 'ShopAdminRbac', NULL),
(23, 'shop', 'ShopAdminSearch', NULL),
(24, 'shop', 'ShopAdminSettings', NULL),
(25, 'shop', 'ShopAdminSystem', NULL),
(26, 'shop', 'ShopAdminUsers', NULL),
(27, 'shop', 'ShopAdminWarehouses', NULL),
(28, 'base', 'Admin', NULL),
(29, 'base', 'Admin_logs', NULL),
(30, 'base', 'Admin_search', NULL),
(31, 'base', 'Backup', NULL),
(32, 'base', 'Cache_all', NULL),
(33, 'base', 'Categories', NULL),
(34, 'base', 'Components', NULL),
(35, 'base', 'Dashboard', NULL),
(36, 'base', 'Languages', NULL),
(37, 'base', 'Login', NULL),
(39, 'base', 'Pages', NULL),
(40, 'base', 'Rbac', NULL),
(41, 'base', 'Settings', NULL),
(43, 'module', 'Cfcm', NULL),
(44, 'module', 'Comments', NULL),
(45, 'module', 'Feedback', NULL),
(46, 'module', 'Gallery', NULL),
(47, 'module', 'Group_mailer', NULL),
(48, 'module', 'Mailer', NULL),
(49, 'module', 'Menu', NULL),
(50, 'module', 'Rss', NULL),
(51, 'module', 'Sample_mail', NULL),
(52, 'module', 'Sample_module', NULL),
(53, 'module', 'Share', NULL),
(54, 'module', 'Sitemap', NULL),
(55, 'module', 'Social_servises', NULL),
(56, 'module', 'Template_editor', NULL),
(57, 'module', 'Trash', NULL),
(58, 'module', 'User_manager', NULL),
(59, 'base', 'Widgets_manager', NULL),
(60, 'module', 'Import_export', NULL),
(61, 'module', 'Template_manager', NULL),
(62, 'module', 'Banners', NULL),
(63, 'module', 'Mod_discount', NULL),
(64, 'module', 'Cmsemail', NULL),
(65, 'module', 'Mod_seo', NULL),
(66, 'module', 'Exchange', NULL),
(67, 'module', 'Translator', NULL),
(68, 'module', 'Imagebox', NULL),
(69, 'module', 'Star_rating', NULL),
(70, 'module', 'Mobile', NULL),
(71, 'module', 'Mod_stats', NULL),
(72, 'module', 'Wishlist', NULL),
(73, 'base', 'Sys_update', NULL),
(74, 'base', 'Sys_info', NULL),
(75, 'module', 'Ymarket', NULL),
(76, 'module', 'Module_frame', NULL),
(77, 'module', 'Hotline', NULL),
(78, 'module', 'Admin_menu', NULL),
(79, 'module', 'Xbanners', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_rbac_group_i18n`
--

DROP TABLE IF EXISTS `shop_rbac_group_i18n`;
CREATE TABLE IF NOT EXISTS `shop_rbac_group_i18n` (
  `id` int(11) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `locale` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_rbac_group_i18n`
--

INSERT INTO `shop_rbac_group_i18n` (`id`, `description`, `locale`) VALUES
(1, 'Управление баннерами', 'ru'),
(2, 'Управление брендами', 'ru'),
(3, 'Управление колбеками', 'ru'),
(4, 'Управление категориями товаров в магазине', 'ru'),
(5, 'Управление статистикой', 'ru'),
(6, 'Управление накопительными скидками', 'ru'),
(7, 'Управление валютами', 'ru'),
(8, 'Управление дополнительными полями для магазина', 'ru'),
(9, 'Главная страница панели управления магазином', 'ru'),
(10, 'Управление способами доставки', 'ru'),
(11, 'Управление скидками', 'ru'),
(12, 'Управление подарочными сертификатами', 'ru'),
(13, 'Управление наборами товаров', 'ru'),
(14, 'Управление уведомлениями', 'ru'),
(15, 'Управление статусами уведомлений', 'ru'),
(16, 'Управление заказами', 'ru'),
(17, 'Управление статусами заказов', 'ru'),
(18, 'Управление методами оплаты', 'ru'),
(19, 'Управление товарами', 'ru'),
(20, 'Управление слежением за товарами', 'ru'),
(21, 'Управление свойствами товаров', 'ru'),
(23, 'Управление поиском', 'ru'),
(24, 'Управление настройками магазина', 'ru'),
(25, 'Управление системой магазина (импорт\\экспорт)', 'ru'),
(26, 'Управление юзерами магазина', 'ru'),
(27, 'Управление складами', 'ru'),
(28, 'Доступ к админпанели', 'ru'),
(29, 'История событий', 'ru'),
(30, 'Управление поиском в базовой админ панели', 'ru'),
(31, 'Управление бекапами', 'ru'),
(32, 'Управление кэшем', 'ru'),
(33, 'Управление категориями сайта', 'ru'),
(34, 'Управление компонентами сайта', 'ru'),
(35, 'Управление главной станицой базовой админ панели', 'ru'),
(36, 'Управление языками', 'ru'),
(37, 'Вход в админпанель', 'ru'),
(38, 'Поиск модулей для установки', 'ru'),
(39, 'Управление страницами', 'ru'),
(40, 'Управление правами доступа', 'ru'),
(41, 'Управление базовыми настройками', 'ru'),
(42, 'Управление обновлением системы', 'ru'),
(43, 'Управление констуктором полей', 'ru'),
(44, 'Управление комментариями', 'ru'),
(45, 'Управление обратной связью', 'ru'),
(46, 'Управление галереей', 'ru'),
(47, 'Управление модулем рассылки', 'ru'),
(48, 'Управление модулем подписки и рассылки', 'ru'),
(49, 'Управление меню', 'ru'),
(50, 'Управление модулем RSS', 'ru'),
(51, 'Управление шаблонами писем', 'ru'),
(52, 'Шаблон модуля', 'ru'),
(53, 'Управление модулем кнопок соцсетей', 'ru'),
(54, 'Управление модулем карта сайта', 'ru'),
(55, 'Управление модулем интеграции с соцсетями', 'ru'),
(56, 'Управление модулем редактор шаблонов', 'ru'),
(57, 'Управление модулем перенаправления', 'ru'),
(58, 'Управление пользователями', 'ru'),
(59, 'Управление виджетами', 'ru'),
(1, 'Managing banners', 'en'),
(2, 'Managing brands', 'en'),
(3, 'Management callbacks', 'en'),
(4, 'Manage categories of goods in the store', 'en'),
(5, 'Management statistics', 'en'),
(6, 'Management of cumulative discounts', 'en'),
(7, 'Currency management', 'en'),
(8, 'Management of additional fields to store', 'en'),
(9, 'The main page of the control panel shop', 'en'),
(10, 'Manage delivery methods', 'en'),
(11, 'The discount management', 'en'),
(12, 'Managing gift certificates', 'en'),
(13, 'Management sets goods', 'en'),
(14, 'Managing notifications', 'en'),
(15, 'Management status notification', 'en'),
(16, 'Order management', 'en'),
(17, 'Manage order status', 'en'),
(18, 'Managing payment methods', 'en'),
(19, 'Management of goods', 'en'),
(20, 'Manage tracking of goods', 'en'),
(21, 'The properties of the goods', 'en'),
(23, 'Management search', 'en'),
(24, 'Managing store settings', 'en'),
(25, 'Management system store (import / export)', 'en'),
(26, 'Managing users store', 'en'),
(27, 'Warehouse management', 'en'),
(28, 'Access to the admin panel', 'en'),
(29, 'Event history', 'en'),
(30, 'Management search in the basic admin panel', 'en'),
(31, 'Management bekapai', 'en'),
(32, 'Cache management', 'en'),
(33, 'Manage website categories', 'en'),
(34, 'Manage site features', 'en'),
(35, 'The Directorate-General stanizai basic admin panel', 'en'),
(36, 'Language management', 'en'),
(37, 'The login to the administration', 'en'),
(38, 'Search modules to install', 'en'),
(39, 'Manage pages', 'en'),
(40, 'The management of access rights', 'en'),
(41, 'Management basic settings', 'en'),
(42, 'The update management system', 'en'),
(43, 'Management Konstruktor fields', 'en'),
(44, 'Management comments', 'en'),
(45, 'Management feedback', 'en'),
(46, 'Gallery control', 'en'),
(47, 'The management module distribution', 'en'),
(48, 'The management module subscription and distribution', 'en'),
(49, 'Menu control', 'en'),
(50, 'The management module RSS', 'en'),
(51, 'Manage email templates', 'en'),
(52, 'The template module', 'en'),
(53, 'The control module buttons of social networks', 'en'),
(54, 'The management module site map', 'en'),
(55, 'The management module integration with social networks', 'en'),
(56, 'The management module editor templates', 'en'),
(57, 'The management module redirection', 'en'),
(58, 'User management', 'en'),
(59, 'Managing widgets', 'en');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_rbac_privileges`
--

DROP TABLE IF EXISTS `shop_rbac_privileges`;
CREATE TABLE IF NOT EXISTS `shop_rbac_privileges` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=747 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_rbac_privileges`
--

INSERT INTO `shop_rbac_privileges` (`id`, `name`, `group_id`, `description`) VALUES
(1, 'ShopAdminBanners::index', 1, NULL),
(2, 'ShopAdminBanners::create', 1, NULL),
(3, 'ShopAdminBanners::edit', 1, NULL),
(4, 'ShopAdminBanners::deleteAll', 1, NULL),
(5, 'ShopAdminBanners::translate', 1, NULL),
(6, 'ShopAdminBanners::changeActive', 1, NULL),
(7, 'ShopAdminBrands::index', 2, NULL),
(8, 'ShopAdminBrands::create', 2, NULL),
(9, 'ShopAdminBrands::edit', 2, NULL),
(10, 'ShopAdminBrands::delete', 2, NULL),
(11, 'ShopAdminBrands::c_list', 2, NULL),
(12, 'ShopAdminBrands::translate', 2, NULL),
(13, 'ShopAdminCallbacks::index', 3, NULL),
(14, 'ShopAdminCallbacks::update', 3, NULL),
(15, 'ShopAdminCallbacks::statuses', 3, NULL),
(16, 'ShopAdminCallbacks::createStatus', 3, NULL),
(17, 'ShopAdminCallbacks::updateStatus', 3, NULL),
(18, 'ShopAdminCallbacks::setDefaultStatus', 3, NULL),
(19, 'ShopAdminCallbacks::changeStatus', 3, NULL),
(20, 'ShopAdminCallbacks::reorderThemes', 3, NULL),
(21, 'ShopAdminCallbacks::changeTheme', 3, NULL),
(22, 'ShopAdminCallbacks::deleteCallback', 3, NULL),
(23, 'ShopAdminCallbacks::deleteStatus', 3, NULL),
(24, 'ShopAdminCallbacks::themes', 3, NULL),
(25, 'ShopAdminCallbacks::createTheme', 3, NULL),
(26, 'ShopAdminCallbacks::updateTheme', 3, NULL),
(27, 'ShopAdminCallbacks::deleteTheme', 3, NULL),
(28, 'ShopAdminCallbacks::search', 3, NULL),
(29, 'ShopAdminCategories::index', 4, NULL),
(30, 'ShopAdminCategories::create', 4, NULL),
(31, 'ShopAdminCategories::edit', 4, NULL),
(32, 'ShopAdminCategories::delete', 4, NULL),
(33, 'ShopAdminCategories::c_list', 4, NULL),
(34, 'ShopAdminCategories::save_positions', 4, NULL),
(35, 'ShopAdminCategories::ajax_translit', 4, NULL),
(36, 'ShopAdminCategories::translate', 4, NULL),
(37, 'ShopAdminCategories::changeActive', 4, NULL),
(38, 'ShopAdminCategories::create_tpl', 4, NULL),
(39, 'ShopAdminCategories::get_tpl_names', 4, NULL),
(40, 'ShopAdminCharts::orders', 5, NULL),
(41, 'ShopAdminCharts::byDate', 5, NULL),
(42, 'ShopAdminCharts::_createDatesDropDown', 5, NULL),
(43, 'ShopAdminComulativ::index', 6, NULL),
(44, 'ShopAdminComulativ::create', 6, NULL),
(45, 'ShopAdminComulativ::edit', 6, NULL),
(46, 'ShopAdminComulativ::allUsers', 6, NULL),
(47, 'ShopAdminComulativ::user', 6, NULL),
(48, 'ShopAdminComulativ::deleteAll', 6, NULL),
(49, 'ShopAdminComulativ::change_comulativ_dis_status', 6, NULL),
(50, 'ShopAdminCurrencies::index', 7, NULL),
(51, 'ShopAdminCurrencies::create', 7, NULL),
(52, 'ShopAdminCurrencies::edit', 7, NULL),
(53, 'ShopAdminCurrencies::makeCurrencyDefault', 7, NULL),
(54, 'ShopAdminCurrencies::makeCurrencyMain', 7, NULL),
(55, 'ShopAdminCurrencies::delete', 7, NULL),
(56, 'ShopAdminCurrencies::recount', 7, NULL),
(57, 'ShopAdminCurrencies::checkPrices', 7, NULL),
(58, 'ShopAdminCustomfields::index', 8, NULL),
(59, 'ShopAdminCustomfields::create', 8, NULL),
(60, 'ShopAdminCustomfields::edit', 8, NULL),
(61, 'ShopAdminCustomfields::deleteAll', 8, NULL),
(62, 'ShopAdminCustomfields::change_status_activ', 8, NULL),
(63, 'ShopAdminCustomfields::change_status_private', 8, NULL),
(64, 'ShopAdminCustomfields::change_status_required', 8, NULL),
(65, 'ShopAdminDashboard::index', 9, NULL),
(66, 'ShopAdminDeliverymethods::index', 10, NULL),
(67, 'ShopAdminDeliverymethods::create', 10, NULL),
(68, 'ShopAdminDeliverymethods::change_delivery_status', 10, NULL),
(69, 'ShopAdminDeliverymethods::edit', 10, NULL),
(70, 'ShopAdminDeliverymethods::deleteAll', 10, NULL),
(71, 'ShopAdminDeliverymethods::c_list', 10, NULL),
(72, 'ShopAdminDiscounts::index', 11, NULL),
(73, 'ShopAdminDiscounts::create', 11, NULL),
(74, 'ShopAdminDiscounts::change_discount_status', 11, NULL),
(75, 'ShopAdminDiscounts::edit', 11, NULL),
(76, 'ShopAdminDiscounts::deleteAll', 11, NULL),
(77, 'ShopAdminGifts::index', 12, NULL),
(78, 'ShopAdminGifts::create', 12, NULL),
(79, 'ShopAdminGifts::generateKey', 12, NULL),
(80, 'ShopAdminGifts::delete', 12, NULL),
(81, 'ShopAdminGifts::edit', 12, NULL),
(82, 'ShopAdminGifts::ChangeActive', 12, NULL),
(83, 'ShopAdminGifts::settings', 12, NULL),
(84, 'ShopAdminGifts::save_settings', 12, NULL),
(85, 'ShopAdminKits::index', 13, NULL),
(86, 'ShopAdminKits::kit_create', 13, NULL),
(87, 'ShopAdminKits::kit_edit', 13, NULL),
(88, 'ShopAdminKits::kit_save_positions', 13, NULL),
(89, 'ShopAdminKits::kit_change_active', 13, NULL),
(90, 'ShopAdminKits::kit_list', 13, NULL),
(91, 'ShopAdminKits::kit_delete', 13, NULL),
(92, 'ShopAdminKits::get_products_list', 13, NULL),
(93, 'ShopAdminNotifications::index', 14, NULL),
(94, 'ShopAdminNotifications::edit', 14, NULL),
(95, 'ShopAdminNotifications::changeStatus', 14, NULL),
(96, 'ShopAdminNotifications::notifyByEmail', 14, NULL),
(97, 'ShopAdminNotifications::deleteAll', 14, NULL),
(98, 'ShopAdminNotifications::ajaxDeleteNotifications', 14, NULL),
(99, 'ShopAdminNotifications::ajaxChangeNotificationsStatus', 14, NULL),
(100, 'ShopAdminNotifications::search', 14, NULL),
(101, 'ShopAdminNotifications::getAvailableNotification', 14, NULL),
(102, 'ShopAdminNotificationstatuses::index', 15, NULL),
(103, 'ShopAdminNotificationstatuses::create', 15, NULL),
(104, 'ShopAdminNotificationstatuses::edit', 15, NULL),
(105, 'ShopAdminNotificationstatuses::deleteAll', 15, NULL),
(106, 'ShopAdminNotificationstatuses::savePositions', 15, NULL),
(107, 'ShopAdminOrders::index', 16, NULL),
(108, 'ShopAdminOrders::edit', 16, NULL),
(109, 'ShopAdminOrders::changeStatus', 16, NULL),
(110, 'ShopAdminOrders::changePaid', 16, NULL),
(111, 'ShopAdminOrders::delete', 16, NULL),
(112, 'ShopAdminOrders::ajaxDeleteOrders', 16, NULL),
(113, 'ShopAdminOrders::ajaxChangeOrdersStatus', 16, NULL),
(114, 'ShopAdminOrders::ajaxChangeOrdersPaid', 16, NULL),
(115, 'ShopAdminOrders::ajaxEditWindow', 16, NULL),
(116, 'ShopAdminOrders::editKit', 16, NULL),
(117, 'ShopAdminOrders::ajaxEditAddToCartWindow', 16, NULL),
(118, 'ShopAdminOrders::ajaxDeleteProduct', 16, NULL),
(119, 'ShopAdminOrders::ajaxGetProductList', 16, NULL),
(120, 'ShopAdminOrders::ajaxEditOrderCart', 16, NULL),
(121, 'ShopAdminOrders::ajaxEditOrderAddToCart', 16, NULL),
(122, 'ShopAdminOrders::ajaxGetOrderCart', 16, NULL),
(123, 'ShopAdminOrders::search', 16, NULL),
(124, 'ShopAdminOrders::printChecks', 16, NULL),
(125, 'ShopAdminOrders::createPDFPage', 16, NULL),
(126, 'ShopAdminOrders::createPdf', 16, NULL),
(127, 'ShopAdminOrders::create', 16, NULL),
(128, 'ShopAdminOrderstatuses::index', 17, NULL),
(129, 'ShopAdminOrderstatuses::create', 17, NULL),
(130, 'ShopAdminOrderstatuses::edit', 17, NULL),
(131, 'ShopAdminOrderstatuses::delete', 17, NULL),
(132, 'ShopAdminOrderstatuses::ajaxDeleteWindow', 17, NULL),
(133, 'ShopAdminOrderstatuses::savePositions', 17, NULL),
(134, 'ShopAdminPaymentmethods::index', 18, NULL),
(135, 'ShopAdminPaymentmethods::create', 18, NULL),
(136, 'ShopAdminPaymentmethods::change_payment_status', 18, NULL),
(137, 'ShopAdminPaymentmethods::edit', 18, NULL),
(138, 'ShopAdminPaymentmethods::deleteAll', 18, NULL),
(139, 'ShopAdminPaymentmethods::savePositions', 18, NULL),
(140, 'ShopAdminPaymentmethods::getAdminForm', 18, NULL),
(141, 'ShopAdminProducts::index', 19, NULL),
(142, 'ShopAdminProducts::create', 19, NULL),
(143, 'ShopAdminProducts::edit', 19, NULL),
(144, 'ShopAdminProducts::saveAdditionalImages', 19, NULL),
(145, 'ShopAdminProducts::delete', 19, NULL),
(146, 'ShopAdminProducts::processImage', 19, NULL),
(147, 'ShopAdminProducts::deleteAddImage', 19, NULL),
(148, 'ShopAdminProducts::ajaxChangeActive', 19, NULL),
(149, 'ShopAdminProducts::ajaxChangeHit', 19, NULL),
(150, 'ShopAdminProducts::ajaxChangeHot', 19, NULL),
(151, 'ShopAdminProducts::ajaxChangeAction', 19, NULL),
(152, 'ShopAdminProducts::ajaxUpdatePrice', 19, NULL),
(153, 'ShopAdminProducts::ajaxCloneProducts', 19, NULL),
(154, 'ShopAdminProducts::ajaxDeleteProducts', 19, NULL),
(155, 'ShopAdminProducts::ajaxMoveWindow', 19, NULL),
(156, 'ShopAdminProducts::ajaxMoveProducts', 19, NULL),
(157, 'ShopAdminProducts::translate', 19, NULL),
(158, 'ShopAdminProducts::get_ids', 19, NULL),
(159, 'ShopAdminProducts::prev_next', 19, NULL),
(160, 'ShopAdminProductspy::index', 20, NULL),
(161, 'ShopAdminProductspy::delete', 20, NULL),
(162, 'ShopAdminProductspy::settings', 20, NULL),
(163, 'ShopAdminProperties::index', 21, NULL),
(164, 'ShopAdminProperties::create', 21, NULL),
(165, 'ShopAdminProperties::edit', 21, NULL),
(166, 'ShopAdminProperties::renderForm', 21, NULL),
(167, 'ShopAdminProperties::save_positions', 21, NULL),
(168, 'ShopAdminProperties::delete', 21, NULL),
(169, 'ShopAdminProperties::changeActive', 21, NULL),
(184, 'ShopAdminSearch::index', 23, NULL),
(185, 'ShopAdminSearch::save_positions_variant', 23, NULL),
(186, 'ShopAdminSearch::autocomplete', 23, NULL),
(187, 'ShopAdminSearch::advanced', 23, NULL),
(188, 'ShopAdminSearch::renderCustomFields', 23, NULL),
(189, 'ShopAdminSettings::index', 24, NULL),
(190, 'ShopAdminSettings::update', 24, NULL),
(191, 'ShopAdminSettings::get_fsettings', 24, NULL),
(192, 'ShopAdminSettings::get_vsettings', 24, NULL),
(193, 'ShopAdminSettings::_get_templates', 24, NULL),
(194, 'ShopAdminSettings::_load_settings', 24, NULL),
(195, 'ShopAdminSettings::runResize', 24, NULL),
(196, 'ShopAdminSystem::import', 25, NULL),
(197, 'ShopAdminSystem::export', 25, NULL),
(198, 'ShopAdminSystem::getAttributes', 25, NULL),
(199, 'ShopAdminSystem::exportUsers', 25, NULL),
(200, 'ShopAdminUsers::index', 26, NULL),
(201, 'ShopAdminUsers::search', 26, NULL),
(202, 'ShopAdminUsers::create', 26, NULL),
(203, 'ShopAdminUsers::edit', 26, NULL),
(204, 'ShopAdminUsers::deleteAll', 26, NULL),
(205, 'ShopAdminUsers::auto_complite', 26, NULL),
(206, 'ShopAdminWarehouses::index', 27, NULL),
(207, 'ShopAdminWarehouses::create', 27, NULL),
(208, 'ShopAdminWarehouses::edit', 27, NULL),
(209, 'ShopAdminWarehouses::deleteAll', 27, NULL),
(210, 'Admin::__construct', 28, NULL),
(211, 'Admin::init', 28, NULL),
(212, 'Admin::index', 28, NULL),
(213, 'Admin::sys_info', 28, NULL),
(214, 'Admin::delete_cache', 28, NULL),
(215, 'Admin::elfinder_init', 28, NULL),
(216, 'Admin::get_csrf', 28, NULL),
(217, 'Admin::sidebar_cats', 28, NULL),
(218, 'Admin::logout', 28, NULL),
(219, 'Admin::report_bug', 28, NULL),
(220, 'Admin_logs::__construct', 29, NULL),
(221, 'Admin_logs::index', 29, NULL),
(222, 'Admin_search::__construct', 30, NULL),
(223, 'Admin_search::index', 30, NULL),
(224, 'Admin_search::advanced_search', 30, NULL),
(225, 'Admin_search::do_advanced_search', 30, NULL),
(226, 'Admin_search::validate_advanced_search', 30, NULL),
(227, 'Admin_search::form_from_group', 30, NULL),
(228, 'Admin_search::_filter_pages', 30, NULL),
(229, 'Admin_search::autocomplete', 30, NULL),
(230, 'Backup::__construct', 31, NULL),
(231, 'Backup::index', 31, NULL),
(232, 'Backup::create', 31, NULL),
(233, 'Backup::force_download', 31, NULL),
(234, 'Cache_all::__construct', 32, NULL),
(235, 'Cache_all::index', 32, NULL),
(236, 'Categories::__construct', 33, NULL),
(237, 'Categories::index', 33, NULL),
(238, 'Categories::create_form', 33, NULL),
(239, 'Categories::update_block', 33, NULL),
(240, 'Categories::save_positions', 33, NULL),
(241, 'Categories::cat_list', 33, NULL),
(242, 'Categories::sub_cats', 33, NULL),
(243, 'Categories::create', 33, NULL),
(244, 'Categories::update_urls', 33, NULL),
(245, 'Categories::category_exists', 33, NULL),
(246, 'Categories::fast_add', 33, NULL),
(247, 'Categories::update_fast_block', 33, NULL),
(248, 'Categories::edit', 33, NULL),
(249, 'Categories::translate', 33, NULL),
(250, 'Categories::delete', 33, NULL),
(251, 'Categories::_get_sub_cats', 33, NULL),
(252, 'Categories::get_comments_status', 33, NULL),
(253, 'Components::__construct', 34, NULL),
(254, 'Components::index', 34, NULL),
(255, 'Components::modules_table', 34, NULL),
(256, 'Components::is_installed', 34, NULL),
(257, 'Components::install', 34, NULL),
(258, 'Components::deinstall', 34, NULL),
(259, 'Components::find_components', 34, NULL),
(260, 'Components::component_settings', 34, NULL),
(261, 'Components::save_settings', 34, NULL),
(262, 'Components::init_window', 34, NULL),
(263, 'Components::cp', 34, NULL),
(264, 'Components::run', 34, NULL),
(265, 'Components::com_info', 34, NULL),
(266, 'Components::get_module_info', 34, NULL),
(267, 'Components::change_autoload', 34, NULL),
(268, 'Components::change_url_access', 34, NULL),
(269, 'Components::save_components_positions', 34, NULL),
(270, 'Components::change_show_in_menu', 34, NULL),
(271, 'Dashboard::__construct', 35, NULL),
(272, 'Dashboard::index', 35, NULL),
(273, 'Languages::__construct', 36, NULL),
(274, 'Languages::index', 36, NULL),
(275, 'Languages::create_form', 36, NULL),
(276, 'Languages::insert', 36, NULL),
(277, 'Languages::edit', 36, NULL),
(278, 'Languages::update', 36, NULL),
(279, 'Languages::delete', 36, NULL),
(280, 'Languages::set_default', 36, NULL),
(281, 'Login::__construct', 37, NULL),
(282, 'Login::index', 37, NULL),
(283, 'Login::user_browser', 37, NULL),
(284, 'Login::do_login', 37, NULL),
(285, 'Login::forgot_password', 37, NULL),
(286, 'Login::update_captcha', 37, NULL),
(287, 'Login::captcha_check', 37, NULL),
(288, 'Mod_search::__construct', 38, NULL),
(289, 'Mod_search::index', 38, NULL),
(290, 'Mod_search::category', 38, NULL),
(291, 'Mod_search::display_install_window', 38, NULL),
(292, 'Mod_search::connect_ftp', 38, NULL),
(293, 'Pages::__construct', 39, NULL),
(294, 'Pages::index', 39, NULL),
(295, 'Pages::add', 39, NULL),
(296, 'Pages::_set_page_roles', 39, NULL),
(297, 'Pages::edit', 39, NULL),
(298, 'Pages::update', 39, NULL),
(299, 'Pages::delete', 39, NULL),
(300, 'Pages::ajax_translit', 39, NULL),
(301, 'Pages::save_positions', 39, NULL),
(302, 'Pages::delete_pages', 39, NULL),
(303, 'Pages::move_pages', 39, NULL),
(304, 'Pages::show_move_window', 39, NULL),
(305, 'Pages::json_tags', 39, NULL),
(306, 'Pages::ajax_create_keywords', 39, NULL),
(307, 'Pages::ajax_create_description', 39, NULL),
(308, 'Pages::ajax_change_status', 39, NULL),
(309, 'Pages::GetPagesByCategory', 39, NULL),
(310, 'Rbac::__construct', 40, NULL),
(311, 'Settings::__construct', 41, NULL),
(312, 'Settings::index', 41, NULL),
(313, 'Settings::main_page', 41, NULL),
(314, 'Settings::_get_templates', 41, NULL),
(315, 'Settings::save', 41, NULL),
(316, 'Settings::switch_admin_lang', 41, NULL),
(317, 'Settings::save_main', 41, NULL),
(318, 'Sys_upgrade::__construct', 42, NULL),
(319, 'Sys_upgrade::index', 42, NULL),
(320, 'Sys_upgrade::make_upgrade', 42, NULL),
(321, 'Sys_upgrade::_check_status', 42, NULL),
(322, 'cfcm::__construct', 43, NULL),
(323, 'cfcm::_set_forms_config', 43, NULL),
(324, 'cfcm::index', 43, NULL),
(325, 'cfcm::create_field', 43, NULL),
(326, 'cfcm::edit_field_data_type', 43, NULL),
(327, 'cfcm::delete_field', 43, NULL),
(328, 'cfcm::edit_field', 43, NULL),
(329, 'cfcm::create_group', 43, NULL),
(330, 'cfcm::edit_group', 43, NULL),
(331, 'cfcm::delete_group', 43, NULL),
(332, 'cfcm::form_from_category_group', 43, NULL),
(333, 'cfcm::get_form_attributes', 43, NULL),
(334, 'cfcm::save_weight', 43, NULL),
(335, 'cfcm::render', 43, NULL),
(336, 'cfcm::get_url', 43, NULL),
(337, 'cfcm::get_form', 43, NULL),
(338, 'comments::__construct', 44, NULL),
(339, 'comments::index', 44, NULL),
(340, 'comments::proccess_child_comments', 44, NULL),
(341, 'comments::render', 44, NULL),
(342, 'comments::edit', 44, NULL),
(343, 'comments::update', 44, NULL),
(344, 'comments::update_status', 44, NULL),
(345, 'comments::delete', 44, NULL),
(346, 'comments::delete_many', 44, NULL),
(347, 'comments::show_settings', 44, NULL),
(348, 'comments::update_settings', 44, NULL),
(349, 'feedback::__construct', 45, NULL),
(350, 'feedback::index', 45, NULL),
(351, 'feedback::settings', 45, NULL),
(352, 'gallery::__construct', 46, NULL),
(353, 'gallery::index', 46, NULL),
(354, 'gallery::category', 46, NULL),
(355, 'gallery::settings', 46, NULL),
(356, 'gallery::create_album', 46, NULL),
(357, 'gallery::update_album', 46, NULL),
(358, 'gallery::edit_album_params', 46, NULL),
(359, 'gallery::delete_album', 46, NULL),
(360, 'gallery::show_crate_album', 46, NULL),
(361, 'gallery::edit_album', 46, NULL),
(362, 'gallery::edit_image', 46, NULL),
(363, 'gallery::rename_image', 46, NULL),
(364, 'gallery::delete_image', 46, NULL),
(365, 'gallery::update_info', 46, NULL),
(366, 'gallery::update_positions', 46, NULL),
(367, 'gallery::update_album_positions', 46, NULL),
(368, 'gallery::update_img_positions', 46, NULL),
(369, 'gallery::show_create_category', 46, NULL),
(370, 'gallery::create_category', 46, NULL),
(371, 'gallery::edit_category', 46, NULL),
(372, 'gallery::update_category', 46, NULL),
(373, 'gallery::delete_category', 46, NULL),
(374, 'gallery::upload_image', 46, NULL),
(375, 'gallery::upload_archive', 46, NULL),
(376, 'group_mailer::__construct', 47, NULL),
(377, 'group_mailer::index', 47, NULL),
(378, 'group_mailer::send_email', 47, NULL),
(379, 'mailer::__construct', 48, NULL),
(380, 'mailer::index', 48, NULL),
(381, 'mailer::send_email', 48, NULL),
(382, 'mailer::delete', 48, NULL),
(383, 'menu::__construct', 49, NULL),
(384, 'menu::index', 49, NULL),
(385, 'menu::menu_item', 49, NULL),
(386, 'menu::list_menu_items', 49, NULL),
(387, 'menu::create_item', 49, NULL),
(388, 'menu::display_selector', 49, NULL),
(389, 'menu::get_name_by_id', 49, NULL),
(390, 'menu::delete_item', 49, NULL),
(391, 'menu::edit_item', 49, NULL),
(392, 'menu::process_root', 49, NULL),
(393, 'menu::insert_menu_item', 49, NULL),
(394, 'menu::save_positions', 49, NULL),
(395, 'menu::create_menu', 49, NULL),
(396, 'menu::edit_menu', 49, NULL),
(397, 'menu::update_menu', 49, NULL),
(398, 'menu::check_menu_data', 49, NULL),
(399, 'menu::delete_menu', 49, NULL),
(400, 'menu::create_tpl', 49, NULL),
(401, 'menu::get_pages', 49, NULL),
(402, 'menu::search_pages', 49, NULL),
(403, 'menu::get_item', 49, NULL),
(404, 'menu::display_tpl', 49, NULL),
(405, 'menu::fetch_tpl', 49, NULL),
(406, 'menu::translate_window', 49, NULL),
(407, 'menu::translate_item', 49, NULL),
(408, 'menu::_get_langs', 49, NULL),
(409, 'menu::render', 49, NULL),
(410, 'menu::change_hidden', 49, NULL),
(411, 'menu::get_children_items', 49, NULL),
(412, 'rss::__construct', 50, NULL),
(413, 'rss::index', 50, NULL),
(414, 'rss::render', 50, NULL),
(415, 'rss::settings_update', 50, NULL),
(416, 'rss::display_tpl', 50, NULL),
(417, 'rss::fetch_tpl', 50, NULL),
(418, 'sample_mail::__construct', 51, NULL),
(419, 'sample_mail::create', 51, NULL),
(420, 'sample_mail::edit', 51, NULL),
(421, 'sample_mail::render', 51, NULL),
(422, 'sample_mail::index', 51, NULL),
(423, 'sample_mail::delete', 51, NULL),
(424, 'sample_module::__construct', 52, NULL),
(425, 'sample_module::index', 52, NULL),
(426, 'share::__construct', 53, NULL),
(427, 'share::index', 53, NULL),
(428, 'share::update_settings', 53, NULL),
(429, 'share::get_settings', 53, NULL),
(430, 'share::render', 53, NULL),
(431, 'sitemap::__construct', 54, NULL),
(432, 'sitemap::index', 54, NULL),
(433, 'sitemap::_load_settings', 54, NULL),
(434, 'sitemap::update_settings', 54, NULL),
(435, 'sitemap::display_tpl', 54, NULL),
(436, 'sitemap::fetch_tpl', 54, NULL),
(437, 'sitemap::render', 54, NULL),
(438, 'social_servises::__construct', 55, NULL),
(439, 'social_servises::index', 55, NULL),
(440, 'social_servises::update_settings', 55, NULL),
(441, 'social_servises::get_fsettings', 55, NULL),
(442, 'social_servises::get_vsettings', 55, NULL),
(443, 'social_servises::_get_templates', 55, NULL),
(444, 'social_servises::render', 55, NULL),
(445, 'template_editor::index', 56, NULL),
(446, 'template_editor::render', 56, NULL),
(447, 'trash::__construct', 57, NULL),
(448, 'trash::index', 57, NULL),
(449, 'trash::create_trash', 57, NULL),
(450, 'trash::edit_trash', 57, NULL),
(451, 'trash::delete_trash', 57, NULL),
(452, 'user_manager::__construct', 58, NULL),
(453, 'user_manager::index', 58, NULL),
(454, 'user_manager::set_tpl_roles', 58, NULL),
(455, 'user_manager::getRolesTable', 58, NULL),
(456, 'user_manager::genre_user_table', 58, NULL),
(457, 'user_manager::auto_complit', 58, NULL),
(458, 'user_manager::create_user', 58, NULL),
(459, 'user_manager::actions', 58, NULL),
(460, 'user_manager::search', 58, NULL),
(461, 'user_manager::edit_user', 58, NULL),
(462, 'user_manager::update_user', 58, NULL),
(463, 'user_manager::groups_index', 58, NULL),
(464, 'user_manager::create', 58, NULL),
(465, 'user_manager::edit', 58, NULL),
(466, 'user_manager::save', 58, NULL),
(467, 'user_manager::delete', 58, NULL),
(468, 'user_manager::deleteAll', 58, NULL),
(469, 'user_manager::update_role_perms', 58, NULL),
(470, 'user_manager::show_edit_prems_tpl', 58, NULL),
(471, 'user_manager::get_permissions_table', 58, NULL),
(472, 'user_manager::get_group_names', 58, NULL),
(473, 'Widgets_manager::__construct', 59, NULL),
(474, 'Widgets_manager::index', 59, NULL),
(475, 'Widgets_manager::create', 59, NULL),
(476, 'Widgets_manager::create_tpl', 59, NULL),
(477, 'Widgets_manager::edit', 59, NULL),
(478, 'Widgets_manager::update_widget', 59, NULL),
(479, 'Widgets_manager::update_config', 59, NULL),
(480, 'Widgets_manager::delete', 59, NULL),
(481, 'Widgets_manager::get', 59, NULL),
(482, 'Widgets_manager::edit_html_widget', 59, NULL),
(483, 'Widgets_manager::edit_module_widget', 59, NULL),
(484, 'Widgets_manager::display_create_tpl', 59, NULL),
(485, 'ShopAdminProducts::get_images', 19, NULL),
(486, 'ShopAdminCategories::ajax_load_parent', 4, NULL),
(487, 'import_export::__construct', 60, NULL),
(488, 'import_export::index', 60, NULL),
(489, 'import_export::getImport', 60, NULL),
(490, 'import_export::getLangs', 60, NULL),
(491, 'import_export::getTpl', 60, NULL),
(492, 'import_export::getExport', 60, NULL),
(493, 'import_export::createFile', 60, NULL),
(494, 'import_export::downloadFile', 60, NULL),
(495, 'import_export::processErrors', 60, NULL),
(496, 'import_export::deleteArchive', 60, NULL),
(497, 'import_export::downloadZIP', 60, NULL),
(498, 'ShopAdminProducts::ajax_translit', 19, NULL),
(499, 'ShopAdminRbac::__construct', 22, NULL),
(500, 'Rbac::checkPermitions', 40, NULL),
(501, 'Rbac::groupEdit', 40, NULL),
(502, 'Rbac::groupList', 40, NULL),
(503, 'Rbac::roleCreate', 40, NULL),
(504, 'Rbac::groupCreate', 40, NULL),
(505, 'Rbac::groupDelete', 40, NULL),
(506, 'Rbac::translateRole', 40, NULL),
(507, 'Rbac::roleEdit', 40, NULL),
(508, 'Rbac::roleList', 40, NULL),
(509, 'Rbac::roleDelete', 40, NULL),
(510, 'Rbac::privilegeCreate', 40, NULL),
(511, 'Rbac::privilegeEdit', 40, NULL),
(512, 'Rbac::privilegeList', 40, NULL),
(513, 'Rbac::privilegeDelete', 40, NULL),
(514, 'Rbac::checkControlPanelAccess', 40, NULL),
(515, 'Rbac::deletePermition', 40, NULL),
(516, 'template_manager::__construct', 61, NULL),
(517, 'template_manager::index', 61, NULL),
(518, 'template_manager::installFullDemodata', 61, NULL),
(519, 'template_manager::registerJsVars', 61, NULL),
(520, 'template_manager::get_template_license', 61, NULL),
(521, 'template_manager::updateComponent', 61, NULL),
(522, 'template_manager::deleteTemplate', 61, NULL),
(523, 'template_manager::getRemoteTemplate', 61, NULL),
(524, 'banners::__construct', 62, NULL),
(525, 'banners::createGroup', 62, NULL),
(526, 'banners::delGroup', 62, NULL),
(527, 'banners::index', 62, NULL),
(528, 'banners::settings', 62, NULL),
(529, 'banners::chose_active', 62, NULL),
(530, 'banners::delete', 62, NULL),
(531, 'banners::create', 62, NULL),
(532, 'banners::edit', 62, NULL),
(533, 'banners::autosearch', 62, NULL),
(534, 'banners::save_positions', 62, NULL),
(535, 'mod_discount::__construct', 63, NULL),
(536, 'mod_discount::index', 63, NULL),
(537, 'mod_discount::create', 63, NULL),
(538, 'mod_discount::edit', 63, NULL),
(539, 'mod_discount::ajaxChangeActive', 63, NULL),
(540, 'mod_discount::ajaxDeleteDiscount', 63, NULL),
(541, 'mod_discount::generateDiscountKey', 63, NULL),
(542, 'mod_discount::autoCompliteUsers', 63, NULL),
(543, 'mod_discount::autoCompliteProducts', 63, NULL),
(544, 'mod_discount::saveQueryToSession', 63, NULL),
(545, 'cmsemail::__construct', 64, NULL),
(546, 'cmsemail::index', 64, NULL),
(547, 'cmsemail::create', 64, NULL),
(548, 'cmsemail::mailTest', 64, NULL),
(549, 'cmsemail::delete', 64, NULL),
(550, 'cmsemail::edit', 64, NULL),
(551, 'cmsemail::update_settings', 64, NULL),
(552, 'cmsemail::wraper_check', 64, NULL),
(553, 'cmsemail::deleteVariable', 64, NULL),
(554, 'cmsemail::updateVariable', 64, NULL),
(555, 'cmsemail::addVariable', 64, NULL),
(556, 'cmsemail::getTemplateVariables', 64, NULL),
(557, 'cmsemail::import_templates', 64, NULL),
(558, 'mod_seo::__construct', 65, NULL),
(559, 'mod_seo::index', 65, NULL),
(560, 'mod_seo::productsCategories', 65, NULL),
(561, 'mod_seo::productCategoryCreate', 65, NULL),
(562, 'mod_seo::productCategoryEdit', 65, NULL),
(563, 'mod_seo::categoryAutocomplete', 65, NULL),
(564, 'mod_seo::ajaxDeleteProductCategories', 65, NULL),
(565, 'mod_seo::ajaxChangeActiveCategory', 65, NULL),
(566, 'mod_seo::ajaxChangeEmptyMetaCategory', 65, NULL),
(567, 'exchange::__construct', 66, NULL),
(568, 'exchange::index', 66, NULL),
(569, 'exchange::update_settings', 66, NULL),
(570, 'exchange::startImagesResize', 66, NULL),
(571, 'exchange::setAdditionalCats', 66, NULL),
(572, 'exchange::clear', 66, NULL),
(573, 'exchange::log', 66, NULL),
(574, 'translator::__construct', 67, NULL),
(575, 'translator::setSettings', 67, NULL),
(576, 'translator::settings', 67, NULL),
(577, 'translator::index', 67, NULL),
(578, 'translator::search', 67, NULL),
(579, 'translator::parse', 67, NULL),
(580, 'translator::updateJsLangsFile', 67, NULL),
(581, 'translator::update', 67, NULL),
(582, 'translator::makeCorrectPoPaths', 67, NULL),
(583, 'translator::exchangeTranslation', 67, NULL),
(584, 'translator::renderModulePoFile', 67, NULL),
(585, 'translator::createFile', 67, NULL),
(586, 'translator::savePoArray', 67, NULL),
(587, 'translator::canselTranslation', 67, NULL),
(588, 'translator::getExistingLocales', 67, NULL),
(589, 'translator::renderModulesNames', 67, NULL),
(590, 'translator::renderTemplatesNames', 67, NULL),
(591, 'translator::translateWord', 67, NULL),
(592, 'translator::translate', 67, NULL),
(593, 'translator::getLangaugesNames', 67, NULL),
(594, 'translator::getLanguageByLocale', 67, NULL),
(595, 'translator::renderFile', 67, NULL),
(596, 'translator::saveEditingFile', 67, NULL),
(597, 'translator::getMainFilePaths', 67, NULL),
(598, 'translator::updateOne', 67, NULL),
(599, 'imagebox::__construct', 68, NULL),
(600, 'imagebox::index', 68, NULL),
(601, 'imagebox::main', 68, NULL),
(602, 'imagebox::upload', 68, NULL),
(603, 'imagebox::get_image_size', 68, NULL),
(604, 'imagebox::get_settings', 68, NULL),
(605, 'imagebox::save_settings', 68, NULL),
(606, 'star_rating::index', 69, NULL),
(607, 'star_rating::__construct', 69, NULL),
(608, 'star_rating::update_settings', 69, NULL),
(609, 'star_rating::render', 69, NULL),
(610, 'mobile::__construct', 70, NULL),
(611, 'mobile::get_settings', 70, NULL),
(612, 'mobile::index', 70, NULL),
(613, 'mobile::update', 70, NULL),
(614, 'mobile::_getMobileTemplatesList', 70, NULL),
(615, 'mod_stats::__construct', 71, NULL),
(616, 'mod_stats::index', 71, NULL),
(617, 'mod_stats::orders', 71, NULL),
(618, 'mod_stats::users', 71, NULL),
(619, 'mod_stats::products', 71, NULL),
(620, 'mod_stats::categories', 71, NULL),
(621, 'mod_stats::search', 71, NULL),
(622, 'mod_stats::adminAdd', 71, NULL),
(623, 'mod_stats::attendance_redirect', 71, NULL),
(624, 'mod_stats::runControllerAction', 71, NULL),
(625, 'mod_stats::import', 71, NULL),
(626, 'mod_stats::set_input', 71, NULL),
(627, 'wishlist::__construct', 72, NULL),
(628, 'wishlist::index', 72, NULL),
(629, 'wishlist::update_settings', 72, NULL),
(630, 'wishlist::settings', 72, NULL),
(631, 'wishlist::userWL', 72, NULL),
(632, 'wishlist::editWL', 72, NULL),
(633, 'wishlist::deleteWL', 72, NULL),
(634, 'wishlist::updateWL', 72, NULL),
(635, 'wishlist::userUpdate', 72, NULL),
(636, 'wishlist::createWishList', 72, NULL),
(637, 'wishlist::do_upload', 72, NULL),
(638, 'wishlist::renderPopup', 72, NULL),
(639, 'wishlist::deleteItem', 72, NULL),
(640, 'wishlist::moveItem', 72, NULL),
(641, 'wishlist::deleteImage', 72, NULL),
(642, 'wishlist::delete_user', 72, NULL),
(643, 'Sys_update::__construct', 73, NULL),
(644, 'Sys_update::index', 73, NULL),
(645, 'Sys_update::do_update', 73, NULL),
(646, 'Sys_update::update', 73, NULL),
(647, 'Sys_update::restore', 73, NULL),
(648, 'Sys_update::renderFile', 73, NULL),
(649, 'Sys_update::properties', 73, NULL),
(650, 'Sys_update::get_license', 73, NULL),
(651, 'Sys_update::backup', 73, NULL),
(652, 'Sys_update::sort', 73, NULL),
(653, 'Sys_update::delete_backup', 73, NULL),
(654, 'Sys_update::getQuerys', 73, NULL),
(655, 'Sys_update::Querys', 73, NULL),
(656, 'Sys_info::__construct', 74, NULL),
(657, 'Sys_info::index', 74, NULL),
(658, 'Sys_info::phpinfo', 74, NULL),
(659, 'Sys_info::mailTest', 74, NULL),
(660, 'ymarket::__construct', 75, NULL),
(661, 'ymarket::index', 75, NULL),
(662, 'ymarket::getSelectedCats', 75, NULL),
(663, 'ymarket::save', 75, NULL),
(664, 'module_frame::__construct', 76, NULL),
(665, 'module_frame::index', 76, NULL),
(666, 'hotline::index', 77, NULL),
(667, 'hotline::__construct', 77, NULL),
(668, 'hotline::update', 77, NULL),
(669, 'hotline::getSelectedCats', 77, NULL),
(670, 'hotline::getProperties', 77, NULL),
(671, 'hotline::setProperties', 77, NULL),
(672, 'cmsemail::settings', 64, NULL),
(673, 'mod_seo::save', 65, NULL),
(674, 'sitemap::priority_validation', 54, NULL),
(675, 'sitemap::settings', 54, NULL),
(676, 'sitemap::saveSiteMap', 54, NULL),
(677, 'sitemap::sitemapDownload', 54, NULL),
(678, 'sitemap::priorities', 54, NULL),
(679, 'sitemap::changefreq', 54, NULL),
(680, 'sitemap::blockedUrls', 54, NULL),
(681, 'sitemap::prepareUrls', 54, NULL),
(682, 'sitemap::robotsAdd', 54, NULL),
(683, 'sitemap::_viewSiteMap', 54, NULL),
(684, 'sample_module::updateSettings', 52, NULL),
(685, 'trash::create_trash_list', 57, NULL),
(686, 'ShopAdminOrders::ajaxGetProductVariants', 16, NULL),
(687, 'ShopAdminOrders::getImageName', 16, NULL),
(688, 'ShopAdminOrders::paginationVariant', 16, NULL),
(689, 'ShopAdminOrders::recountUserAmount', 16, NULL),
(690, 'ShopAdminOrders::recount_amount', 16, NULL),
(691, 'ShopAdminOrders::ajaxGetProductsList', 16, NULL),
(692, 'ShopAdminOrders::ajaxEditOrderCartNew', 16, NULL),
(693, 'ShopAdminOrders::recoutUserOrdersAmount', 16, NULL),
(694, 'ShopAdminOrders::getTotalRow', 16, NULL),
(695, 'ShopAdminOrders::ajaxGetProductsInCategory', 16, NULL),
(696, 'ShopAdminOrders::autoComplite', 16, NULL),
(697, 'ShopAdminOrders::createNewUser', 16, NULL),
(698, 'ShopAdminOrders::ajaxGetUserDiscount', 16, NULL),
(699, 'ShopAdminOrders::getPaymentsMethods', 16, NULL),
(700, 'ShopAdminOrders::checkGiftCert', 16, NULL),
(701, 'ShopAdminOrders::createCode', 16, NULL),
(702, 'ShopAdminOrders::getLastUserInfo', 16, NULL),
(703, 'ShopAdminOrders::createProducsInfoTable', 16, NULL),
(704, 'ShopAdminProducts::fastProdCreate', 19, NULL),
(705, 'ShopAdminCategories::createCatFast', 4, NULL),
(706, 'ShopAdminProperties::createPropFast', 21, NULL),
(707, 'trash::trash_list', 57, NULL),
(708, 'admin_menu::__construct', 78, NULL),
(709, 'admin_menu::index', 78, NULL),
(710, 'admin_menu::edit_menus', 78, NULL),
(711, 'admin_menu::edit_tariff_menus', 78, NULL),
(712, 'admin_menu::saveMenu', 78, NULL),
(713, 'admin_menu::saveTariffsMenus', 78, NULL),
(714, 'admin_menu::uploadTariffsMenus', 78, NULL),
(715, 'admin_menu::ajaxUpdateItemTitle', 78, NULL),
(716, 'admin_menu::ajaxGetNewMenuItem', 78, NULL),
(717, 'ShopAdminSystem::downExpUsers', 25, NULL),
(718, 'Settings::getSiteInfoDataJson', 41, NULL),
(719, 'ShopAdminSettings::changeSortActive', 24, NULL),
(720, 'ShopAdminSettings::checkGDLib', 24, NULL),
(721, 'ShopAdminSettings::runResizeById', 24, NULL),
(722, 'ShopAdminSettings::getAllProductsVariantsIds', 24, NULL),
(723, 'ShopAdminSettings::getAllProductsIds', 24, NULL),
(724, 'ShopAdminSettings::runResizeAllAdditionalJsone', 24, NULL),
(725, 'Widgets_manager::update_html_widget', 59, NULL),
(726, 'ShopAdminSystem::getCategoryProperties', 25, NULL),
(727, 'Backup::file_actions', 31, NULL),
(728, 'Backup::save_settings', 31, NULL),
(729, 'ShopAdminSettings::runResizeAllJsone', 24, NULL),
(730, 'ShopAdminSearch::per_page_cookie', 23, NULL),
(731, 'ShopAdminSettings::setSorting', 24, NULL),
(732, 'ShopAdminProducts::fastBrandCreate', 19, NULL),
(733, 'ShopAdminProducts::fastCategoryCreate', 19, NULL),
(734, 'ShopAdminOrders::ajaxMergeOrders', 16, NULL),
(735, 'Xbanners::__constructor', 79, NULL),
(736, 'Xbanners::index', 79, NULL),
(737, 'Xbanners::deleteA', 79, NULL),
(738, 'Xbanners::edit_banner', 79, NULL),
(739, 'Xbanners::saveImage', 79, NULL),
(740, 'Xbanners::validate_url', 79, NULL),
(741, 'Xbanners::uploadImage', 79, NULL),
(742, 'Xbanners::deleteSlideImage', 79, NULL),
(743, 'Xbanners::deleteSlide', 79, NULL),
(744, 'Xbanners::changePositions', 79, NULL),
(745, 'Xbanners::url_search_autocomplete', 79, NULL),
(746, 'Xbanners::updateBannersPlaces', 79, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_rbac_privileges_i18n`
--

DROP TABLE IF EXISTS `shop_rbac_privileges_i18n`;
CREATE TABLE IF NOT EXISTS `shop_rbac_privileges_i18n` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `locale` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_rbac_privileges_i18n`
--

INSERT INTO `shop_rbac_privileges_i18n` (`id`, `title`, `description`, `locale`) VALUES
(473, 'Управление виджетами', 'Доступ к управлению виджетами', 'ru'),
(1, 'Список баннеров', 'Доступ к списку баннеров', 'ru'),
(2, 'Создание баннера', 'Доступ к созданию баннера', 'ru'),
(3, 'Редактирование баннера', 'Доступ к редактированию баннера', 'ru'),
(4, 'Удаление баннера', 'Доступ к удалению баннера', 'ru'),
(5, 'Перевод баннера', 'Доступ к переводу баннера', 'ru'),
(6, 'Активность баннера', 'Управление активностью баннера', 'ru'),
(7, 'Список брендов', 'Доступ к списку брендов', 'ru'),
(8, 'Создание бренда', 'Доступ к созданию бренда', 'ru'),
(9, 'Редактирование бренда', 'Доступ к редактированию бренда', 'ru'),
(10, 'Удаление бренда', 'Доступ к удалению бренда', 'ru'),
(11, 'Список брендов', 'Доступ к списку брендов', 'ru'),
(12, 'Перевод бренда', 'Доступ к переводу бренда', 'ru'),
(13, 'Список колбеков', 'Доступ к просмотру колбеков', 'ru'),
(14, 'Редактирование колбека', 'Доступ к редактированию колбеков', 'ru'),
(15, 'Статусы колбеков', 'Просмотр статусов колбеков', 'ru'),
(16, 'Создание статуса колбеков', 'Доступ к созданию статусов колбеков', 'ru'),
(17, 'Редактирование статуса колбека', 'Доступ к редактированию статуса колбека', 'ru'),
(18, 'Установка статуса колбека по-умолчанию', 'Доступ к установке статуса колбека по-умолчанию', 'ru'),
(19, 'Изменение статуса колбека', 'Доступ к изменению статуса колбека', 'ru'),
(20, 'Смена порядка статусов колбеков', 'Доступ к изменению порядка статусов колбеков', 'ru'),
(21, 'Изменение темы колбека', 'Доступ к изменению статуса колбека', 'ru'),
(22, 'Удаление колбека', 'Доступ к удалению колбека', 'ru'),
(23, 'Удаление статуса', 'Доступ к удалению статуса колбека', 'ru'),
(24, 'Просмотр тем колбеков', 'Доступ к просмотру тем колбеков', 'ru'),
(25, 'Создание тем колбеков', 'Доступ к созданию тем колбеков', 'ru'),
(26, 'Редактирование темы колбека', 'Доступ к редактированию темы колбека', 'ru'),
(27, 'Удаление темы колбека', 'Доступ к удалению темы колбека', 'ru'),
(28, 'Поиск колбеков', 'Доступ к поиску колбеков', 'ru'),
(29, 'Просмотр категорий магазина', 'Доступ к просмотру категорий магазина', 'ru'),
(30, 'Создание категории магазина', 'Доступ к созданию категории магазина', 'ru'),
(31, 'Редактирование категории магазина', 'Доступ к редактированию категории магазина', 'ru'),
(32, 'Удаление категории магазина', 'Доступ к удалению категории магазина', 'ru'),
(33, 'Просмотр списка категорий магазина', 'Доступ к просмотру списка категорий магазина', 'ru'),
(34, 'Изменение порядка категорий магазина', 'Доступ к изменению порядка категорий магазина', 'ru'),
(35, 'Транслитерация строки', 'Доступ к транслитерации строки', 'ru'),
(36, 'Перевод категории магазина', 'Доступ к переводу категории магазина', 'ru'),
(37, 'Смена активности категории магазина', 'Доступ к изменению активности категории магазина', 'ru'),
(38, 'Создание шаблона категории', 'Доступ к созданию шаблона категории магазина', 'ru'),
(39, 'Список доступных шаблонов для категорий магаз', 'Доступ к списку доступных шаблонов для категорий магазина', 'ru'),
(40, 'Просмотр статистики заказов', 'Доступ к просмотру статистики заказов', 'ru'),
(41, 'Фильтр заказов по дате', 'Доступ к фильтру заказов по дате', 'ru'),
(42, 'ShopAdminCharts::_createDatesDropDown', '', 'ru'),
(43, 'Просмотр списка накопительных скидок', 'Доступ к просмотру списка накопительных скидок', 'ru'),
(44, 'Создание накопительной скидки', 'Доступ к созданию накопительной скидки', 'ru'),
(45, 'Редактирование накопительной скидки', 'Доступ к редактированию накопительной скидки', 'ru'),
(46, 'Просмотр списка пользовательских скидок', 'Доступ к просмотру списка пользовательских скидок', 'ru'),
(47, 'Просмотр скидки пользователя', 'Доступ к просмотру скидки пользователя', 'ru'),
(48, 'Удаление всех скидок', 'Доступ к удалению всех скидок', 'ru'),
(49, 'Смена статуса скидки', 'Доступ к смене статуса скидки', 'ru'),
(50, 'Просмотр списка валют', 'Доступ к просмотру списка валют', 'ru'),
(51, 'Создание валюты', 'Доступ к созданию валюты', 'ru'),
(52, 'Редактирование валюты', 'Доступ к редактированию валюты', 'ru'),
(53, 'Установка валюты по-умолчанию', 'Доступ к установке валюты по-умолчанию', 'ru'),
(54, 'Установка главной валюты', 'Доступ к установке главной валюты', 'ru'),
(55, 'Удаление валюты', 'Доступ к удалению валюты', 'ru'),
(56, 'Пересчет цен', 'Доступ к пересчету цен', 'ru'),
(57, 'Проверка цен в базе данных', 'Доступ к проверке цен в базе данных и их исправление', 'ru'),
(58, 'Просмотр списка дополнительных полей для мага', 'Доступ к просмотру списка дополнительных полей магазина', 'ru'),
(59, 'Создание дополнительного поля для магазина', 'Доступ к созданию дополнительного поля для магазина', 'ru'),
(60, 'Редактирование дополнительного поля для магаз', 'Доступ к редактированию дополнительного поля для магазина', 'ru'),
(61, 'Удаление всех дополнительных полей для магази', 'Доступ к удалению всех дополнительных полей для магазина', 'ru'),
(62, 'Смена активности дополнительного поля для маг', 'Доступ к смене активности дополнительного поля для магазина', 'ru'),
(63, 'Смена приватности дополнительного полю', 'Доступ к изменению приватности дополнительного поля', 'ru'),
(64, 'Смена необходимости дополнительного поля для ', 'Доступ к изменению необходимости дополнительного поля для магазина', 'ru'),
(65, 'Просмотр дашборда админ панели магазина', 'Доступ к просмотру дашборда админ панели магазина', 'ru'),
(66, 'Просмотр списка способов доставки', 'Доступ к просмотру списка способов доставки', 'ru'),
(67, 'Создание способа доставки', 'Доступ к созданию способа доставки', 'ru'),
(68, 'Смена статуса способа доставки', 'Доступ к смене статуса способа доставки', 'ru'),
(69, 'Редактирование способа доставки', 'Доступ к редактированию способа доставки', 'ru'),
(70, 'Удаление способа доставки', 'Доступ к удалению способа доставки', 'ru'),
(71, 'ShopAdminDeliverymethods::c_list', '', 'ru'),
(72, 'Просмотр списка постоянных скидок', 'Доступ к просмотру списка постоянных скидок', 'ru'),
(73, 'Создание постоянной скидки', 'Доступ к созданию постоянной скидки', 'ru'),
(74, 'Смена статуса постоянной скидки', 'Доступ к смене статуса постоянной скидки', 'ru'),
(75, 'Редактирование постоянной скидки', 'Доступ к редактированию постоянной скидки', 'ru'),
(76, 'Удаление постоянной скидки', 'Доступ к удалению постоянной скидки', 'ru'),
(77, 'Просмотр списка подарочных сертификатов', 'Доступ к просмотру списка подарочных сертификатов', 'ru'),
(78, 'Создание подарочного сертификата', 'Доступ к созданию подарочного сертификата', 'ru'),
(79, 'Создание кода для подарочного сертификата', 'Доступ к соданию кода для подарочного сертификата', 'ru'),
(80, 'Удаление подарочного сертификата', 'Доступ к удалению подарочного сертификата', 'ru'),
(81, 'Редактирование подарочного сертификата', 'Доступ к редактированию подарочного сертификата', 'ru'),
(82, 'Смена активности подарочного сертификата', 'Доступ к смене активности подарочного сертификата', 'ru'),
(83, 'Настройки подарочных сертификатов', 'Доступ к настройкам подарочных сертификатов', 'ru'),
(84, 'Сохранение настроек подарочных сертификатов', 'Доступ к сохранению настроек подарочных сертификатов', 'ru'),
(85, 'Просмотр списка наборов товаров', 'Доступ к просмотру списка наборов товаров', 'ru'),
(86, 'Создание набора товаров', 'Доступ к созданию набора товаров', 'ru'),
(87, 'Редактирование набора товаров', 'Доступ к редактированию набора товаров', 'ru'),
(88, 'Смена порядка наборов товаров', 'Доступ к смене порядка наборо товаров', 'ru'),
(89, 'Смена активности набора товаров', 'Доступ к смене активности набора товаров', 'ru'),
(90, 'ShopAdminKits::kit_list', '', 'ru'),
(91, 'Удаление набора товаров', 'Доступ к удалению набора товаров', 'ru'),
(92, 'Получение списка товаров', 'Доступ к получению списка товаров', 'ru'),
(93, 'Просмотр списка уведовлений', 'Доступ к просмотру списка уведомлений', 'ru'),
(94, 'Редактирование уведомления', 'Доступ к редактированию уведомления', 'ru'),
(95, 'Смена статуса уведомления', 'Доступ к смене статуса уведомления', 'ru'),
(96, 'Уведомление по почте', 'Доступ к уведомлению по почте', 'ru'),
(97, 'Удаление уведомления', 'Доступ к удалению уведомления', 'ru'),
(98, 'Удаление уведомления', 'Доступ к удалению уведомления', 'ru'),
(99, 'Смена статуса уведомления', 'Доступ к смене статуса уведомления', 'ru'),
(100, 'Поиск уведомления', 'Доступ к поиску уведомления', 'ru'),
(101, 'Поиск новых событий', 'Доступ к поиску новых событий', 'ru'),
(102, 'Просмотр статусов уведомлений', 'Доступ к просмотру статусов уведомлений', 'ru'),
(103, 'Создание статуса уведомления', 'Доступ к созданию статуса уведомления', 'ru'),
(104, 'Редактирование статуса уведомления', 'Доступ к редактированию статуса увдеомления', 'ru'),
(105, 'Удаление статуса уведомления', 'Доступ к удалению статуса уведомления', 'ru'),
(106, 'Смена порядка статусов уведомлений', 'Доступ к смене порядка статусов уведомлений', 'ru'),
(107, 'Просмотр списка заказов', 'Доступ к просмотру списка заказов', 'ru'),
(108, 'Редактирование заказа', 'Доступ к редактированию заказа', 'ru'),
(109, 'Смена статуса заказа', 'Доступ к смене статуса заказа', 'ru'),
(110, 'Смена статуса оплаты заказа', 'Доступ к смене  статуса оплаты заказа', 'ru'),
(111, 'Удаление заказа', 'Доступ к удалению статуса заказа', 'ru'),
(112, 'Удаление статуса заказа', 'Доступ к удалению статуса заказа', 'ru'),
(113, 'Смена статусов заказов', 'Доступ к смене статусов заказов', 'ru'),
(114, 'Смена статуса оплаты заказов', 'Доступ к смене статусов оплаты заказов', 'ru'),
(115, 'Отображение окна редактирования', 'Доступ к окну редактирования', 'ru'),
(116, 'Окно редактирования набора товаров', 'Доступ к окну редактирования набора товаров', 'ru'),
(117, 'Окно добавления товара к заказу', 'Доступ к окну добавления товаров к заказу', 'ru'),
(118, 'Удаление товара из заказа', 'Доступ к удалению товара из заказа', 'ru'),
(119, 'Получение списка товаров', 'Доступ к получению списка товаров', 'ru'),
(120, 'Редактирование товара в заказе', 'Доступ к редактированию товара в заказе', 'ru'),
(121, 'Добавление товара к заказу', 'Доступ к добавлению товара к заказу', 'ru'),
(122, 'Получение списка товаров в заказе', 'Доступ к получению списка товаров в заказе', 'ru'),
(123, 'Поиск заказа', 'Доступ к поиску заказа', 'ru'),
(124, 'Создание чеков', 'Доступ созданию чека', 'ru'),
(125, 'Создание pdf чека', 'Доступ созданию pdf чека', 'ru'),
(126, 'Создание чека', 'Доступ к созданию чека', 'ru'),
(127, 'Создание заказа', 'Доступ к созданию заказа', 'ru'),
(128, 'Просмотр списка статусов заказов', 'Доступ к просмотру списка статусов заказов', 'ru'),
(129, 'Создание статуса заказа', 'Доступ к созданию статуса заказа', 'ru'),
(130, 'Редактирование статуса заказа', 'Доступ к редактированию статуса заказа', 'ru'),
(131, 'Удаление статуса заказа', 'Доступ к удалению статуса заказа', 'ru'),
(132, 'Отображение окна удаления', 'Доступ к отображению окна удаления', 'ru'),
(133, 'Смена порядка статусов заказов', 'Доступ к смене порядка статусов заказов', 'ru'),
(134, 'Просмотр списка методов оплаты', 'Доступ к просмотру списка методов оплаты', 'ru'),
(135, 'Создание метода оплаты', 'Доступ к созданию метода оплаты', 'ru'),
(136, 'Смена статуса способа оплаты', 'Доступ к смене статуса способа оплаты', 'ru'),
(137, 'Редактирование способа оплаты', 'Доступ к редактированию способа оплаты', 'ru'),
(138, 'Удаление способа оплаты', 'Доступ к удалению способа оплаты', 'ru'),
(139, 'Смена порядка способов оплаты', 'Доступ к смене порядка способов оплаты', 'ru'),
(140, 'Отображение настроек способа оплаты', 'Доступ к отображению настроек способа оплаты', 'ru'),
(141, 'ShopAdminProducts::index', '', 'ru'),
(142, 'Создание продукта', 'Доступ к созданию продукта', 'ru'),
(143, 'Редактирование товара', 'Доступ к редактированию товара', 'ru'),
(144, 'Сохранение дополнительных изображений', 'Доступ к сохренению дополнительных изображений', 'ru'),
(145, 'Удаление товара', 'Доступ к удалению товара', 'ru'),
(146, 'Обработка изображений', 'Доступ к обработке изображений', 'ru'),
(147, 'Удаление дополнительных изображений', 'Доступ к удалению дополнительных изображений', 'ru'),
(148, 'Смена активности товара', 'Доступ к смене активности товара', 'ru'),
(149, 'Смена пункта "Хит" для товара', 'Доступ к смене пункта "Хит" для товара', 'ru'),
(150, 'Смена пункта "Новинка" для товара', 'Доступ к смене пункта "Новинка" для товара', 'ru'),
(151, 'Смена пункта "Акция" для товара', 'Доступ к смене пункта "Акция" для товара', 'ru'),
(152, 'Обновление цены', 'Доступ к обновлению цены товара', 'ru'),
(153, 'Копирование товаров', 'Доступ к копированию товаров', 'ru'),
(154, 'Удаление товаров', 'Доступ к удалению товаров', 'ru'),
(155, 'Просмотр окна перемещения товаров', 'Доступ к окну перемещения товаров', 'ru'),
(156, 'Перемещение товаров', 'Доступ к перемещению товаров', 'ru'),
(157, 'Перевод товара', 'Доступ к переводу товара', 'ru'),
(158, 'Получение списка id товаров', 'Доступ к получению списка id товаров', 'ru'),
(159, 'Переключение товаров', 'Доступ к переключению товаров', 'ru'),
(160, 'Просмотр списка слежения', 'Доступ к просмотру списка слежения', 'ru'),
(161, 'Удаления слежения', 'Доступ к удалению слежения', 'ru'),
(162, 'Настройки слежения за товарами', 'Доступ к настройкам слежения за товаром', 'ru'),
(163, 'Просмотр списка свойств', 'Доступ к просмотру списка свойств', 'ru'),
(164, 'Создание свойства товара', 'Доступ к созданию свойства товара', 'ru'),
(165, 'Редактирование свойства товара', 'Доступ к редактированию свойства товара', 'ru'),
(166, 'ShopAdminProperties::renderForm', '', 'ru'),
(167, 'Смена порядка свойств', 'Доступ к смене порядка свойств', 'ru'),
(168, 'Удаление свойств', 'Доступ к удалению свойств', 'ru'),
(169, 'Смена активности свойства', 'Доступ к смене активности свойства', 'ru'),
(180, 'ShopAdminRbac::group_create', '', 'ru'),
(181, 'ShopAdminRbac::group_edit', '', 'ru'),
(182, 'ShopAdminRbac::group_list', '', 'ru'),
(183, 'ShopAdminRbac::group_delete', '', 'ru'),
(184, 'Просмотр списка товаров', 'Доступ к просмотру списка товаров', 'ru'),
(185, 'Смена порядка вариантов товаров', 'Доступ к смене порядка вариантов товаров', 'ru'),
(186, 'Автодополнение к поиску', 'Доступ к автодополнению к поиску', 'ru'),
(187, 'Продвинутый поиск', 'Доступ к продвинутому поиску', 'ru'),
(188, 'ShopAdminSearch::renderCustomFields', '', 'ru'),
(189, 'Свойства магазина', 'Доступ к свойствам магазина', 'ru'),
(190, 'Изменение свойств магазина', 'Доступ к изменению свойств магазина', 'ru'),
(191, 'Получение настроек для интеграции с фейсбуком', 'Доступ к настройкам интеграции с фейсбуком', 'ru'),
(192, 'Получение настроек интеграции с вк', 'Доступ к настройкам интеграции с вк', 'ru'),
(193, 'Получение списка шаблонов', 'Доступ к получению списка шаблонов', 'ru'),
(194, 'Загрузка настроек', 'Доступ к загрузке настроек', 'ru'),
(195, 'Запуск ресайза изображений', 'Доступ к запуску ресайза изображений', 'ru'),
(196, 'Импорт товаров', 'Доступ к импорту товаров', 'ru'),
(197, 'Экспорт товаров', 'Доступ к экспорту товаров', 'ru'),
(198, 'Получение атрибутов', 'Доступ к получению атрибутов', 'ru'),
(199, 'Экспорт пользователей', 'Доступ к экспорту пользователей', 'ru'),
(200, 'Просмотр списка пользователей', 'Доступ к просмотру списка пользователей', 'ru'),
(201, 'Поиск пользователей', 'Доступ к поиску пользователей', 'ru'),
(202, 'Создание пользователя', 'Доступ к созданию пользователя', 'ru'),
(203, 'Редактирование пользователя', 'Доступ к редактированию пользователя', 'ru'),
(204, 'Удаление пользователя', 'Доступ к удалению пользователя', 'ru'),
(205, 'Автодополнение списка пользователей', 'Достпу к автодополнению списка пользователей', 'ru'),
(206, 'Просмотр списка складов', 'Доступ к просмотру списка складов', 'ru'),
(207, 'Создание склада', 'Доступ к созданию склада', 'ru'),
(208, 'Редактирование склада', 'Доступ к редактированию склада', 'ru'),
(209, 'Удаление склада', 'Доступ к удалению склада', 'ru'),
(210, 'Доступ к админпанели', 'Доступ к админпанели', 'ru'),
(211, 'Инициализация настроек', 'Доступ к инициализации настроек', 'ru'),
(212, 'Просмотр дашборда базовой админки', 'Доступ к просмотру дашборда базовой админки', 'ru'),
(213, 'Просмотр информации о системе', 'Доступ к просмотру информации о системе', 'ru'),
(214, 'Очистка кеша', 'Доступ к очистке кеша', 'ru'),
(215, 'Инициализация elfinder', 'Доступ к инициализации elfinder', 'ru'),
(216, 'Получение защитного токена', 'Доступ к получению токена', 'ru'),
(217, 'Admin::sidebar_cats', '', 'ru'),
(218, 'Выход с админки', 'Доступ к выходу с админки', 'ru'),
(219, 'Сообщить о ошибке', 'Доступ к сообщению о ошибке', 'ru'),
(220, 'История событий', 'Доступ к истории событий', 'ru'),
(221, 'Просмотр истории событий', 'Доступ к просмотру истории событий', 'ru'),
(222, 'Поиск в базовой версии', 'Доступ к поиску в базовой версии', 'ru'),
(223, 'Admin_search::index', '', 'ru'),
(224, 'Продвинутый поиск в базовой версии', 'Доступ к продвинутому поиску в базовой версии', 'ru'),
(225, 'Произвести поиск в базовой версии', 'Произвести поиск в базовой версии', 'ru'),
(226, 'Валидация поиска в базовой версии', 'Доступ к валидации поиска в базовой версии', 'ru'),
(227, 'Admin_search::form_from_group', '', 'ru'),
(228, 'Фильтрация страниц', 'Доступ к фильтрации страниц', 'ru'),
(229, 'Автодополнение поиска', 'Доступ к автодополнению поиска', 'ru'),
(230, 'Управление бекапами', 'Доступ к управлению бекапами', 'ru'),
(231, 'Подготовка резервного копирования', 'Доступ к подготовке резервного копирования', 'ru'),
(232, 'Создание бекапа', 'Доступ к созданию бекапа', 'ru'),
(233, 'Закачка резервной копии', 'Доступ к созданию резервной копии', 'ru'),
(234, 'Управление кешем', 'Достпу к управлению кешем', 'ru'),
(235, 'Управление кешем', 'Доступ к управлению кешем', 'ru'),
(236, 'Управление категориями сайта', 'Доступ к управлению категориями сайта', 'ru'),
(237, 'Просмотр списка категорий сайта', 'Доступ к просмотру списка категорий сайта', 'ru'),
(238, 'Отображение формы создания категории', 'Доступ к отображению формы создания категории', 'ru'),
(239, 'Обноление категории', 'Доступ к обновлению категорий', 'ru'),
(240, 'Смена порядка категорий сайта', 'Доступ к смене порядка категорий сайта', 'ru'),
(241, 'Просмотр списка категорий сайта', 'Доступ к просмотру списка категорий сайта', 'ru'),
(242, 'Подкатегории', 'Доступ к подкатегориям', 'ru'),
(243, 'Создание категории сайта', 'Доступ к категории сайта', 'ru'),
(244, 'Обновление урлов', 'Доступ к обновлению урлов', 'ru'),
(245, 'Проверка сушествования категории сайта', 'Доступ к проверке сушествования категории сайта', 'ru'),
(246, 'Быстрое добавление категории', 'Доступ к быстрому добавлению категории', 'ru'),
(247, 'Быстрое обновление блока', 'Доступ к быстрому обновлению блока', 'ru'),
(248, 'Редактирование категорий сайта', 'Доступ к редактированию категории сайта', 'ru'),
(249, 'Перевод категории сайта', 'Доступ к переводу категории сайта', 'ru'),
(250, 'Удаление категории сайта', 'Доступ к удалению категории сайта', 'ru'),
(251, 'Получение подкатегорий', 'Доступ к получению подкатегорий', 'ru'),
(252, 'Получение статуса комментариев', 'Доступ к получению статусув комментариев', 'ru'),
(253, 'Доступ к компонентам', 'Доступ к компонентам', 'ru'),
(254, 'Управление компонентами системы', 'Доступ к управлению компонентами системы', 'ru'),
(255, 'Просмотр списка компонентов сайта', 'Доступ к просмотру списка компонентов сайта', 'ru'),
(256, 'Проверка установки компонента', 'Доступ к проверке установки компонента', 'ru'),
(257, 'Установка модуля', 'Доступ к установке модуля', 'ru'),
(258, 'Удаление модуля', 'Доступ к удалению модуля', 'ru'),
(259, 'Поиск компонентов', 'Доступ к поиску компонентов', 'ru'),
(260, 'Настройки модуля', 'Доступ к настройкам модуля', 'ru'),
(261, 'Сохранение настроек модулей', 'Доступ к сохранению настроек модулей', 'ru'),
(262, 'Переход к админчасти модуля', 'Доступ к админчасти модуля', 'ru'),
(263, 'Запук модулей', 'Доступ к запуску модулей', 'ru'),
(264, 'Запук методов модулей', 'Доступ к запуску методов модулей', 'ru'),
(265, 'Получение информации о компонентах', 'Доступ к получению информации о компонентах', 'ru'),
(266, 'Получение информации о модуле', 'Доступ к получению информации о модуле', 'ru'),
(267, 'Смена статуса автозагрузки модуля', 'Доступ к смене статуса автозагрузки модуля', 'ru'),
(268, 'Смена доступа по url к модулю', 'Смена доступа по url к модулю', 'ru'),
(269, 'Смена порядка компонентов в списке', 'Доступ к смене порядка компонентов в списке', 'ru'),
(270, 'Включение\\отключение отображения модуля в мен', 'Доступ к включению\\отключению отображения модуля в меню', 'ru'),
(271, 'Отображение дашборда админки', 'Доступ к отображению дашборда админки', 'ru'),
(272, 'Отображение дашборда админки', 'Доступ к отображению дашборда админки', 'ru'),
(273, 'Управление языками', 'Доступ к управлению языками', 'ru'),
(274, 'Просмотр списка языков', 'Достпу к просмотру списка языков', 'ru'),
(275, 'Отображение формы создания языка', 'Доступ к отображению формы создания языка', 'ru'),
(276, 'Создание языка', 'Доступ к созданию языка', 'ru'),
(277, 'Редактирование языка', 'Доступ к редактированию языка', 'ru'),
(278, 'Обновление языка', 'Доступ к обновлению языка', 'ru'),
(279, 'Удаление языка', 'Доступ к удалению языка', 'ru'),
(280, 'Установка языка по-умолчанию', 'Доступ к установке языка по-умолчанию', 'ru'),
(281, 'Вход в админ панель', 'Доступ к входу в админ панель', 'ru'),
(282, 'Вход в админ панель', 'Доступ к входу в админ панель', 'ru'),
(283, 'Проверка браузера пользователя', 'Доступ к проверке браузера пользователя', 'ru'),
(284, 'Вход', 'Вход', 'ru'),
(285, 'Восстановление пароля', 'Восстановление пароля', 'ru'),
(286, 'Обновление капчи', 'Доступ к обновлению капчи', 'ru'),
(287, 'Проверка капчи', 'Доступ к проверке капчи', 'ru'),
(288, 'Mod_search::__construct', '', 'ru'),
(289, 'Mod_search::index', '', 'ru'),
(290, 'Mod_search::category', '', 'ru'),
(291, 'Mod_search::display_install_window', '', 'ru'),
(292, 'Mod_search::connect_ftp', '', 'ru'),
(293, 'Управление страницами', 'Доступ к управлению страницами', 'ru'),
(294, 'Просмотр списка страниц', 'Доступ к просмотру списка страниц', 'ru'),
(295, 'Добавление страницы', 'Доступ к добавлению страницы', 'ru'),
(296, 'Pages::_set_page_roles', '', 'ru'),
(297, 'Редактирование страницы', 'Доступ к редактированию страницы', 'ru'),
(298, 'Обновление страницы', 'Доступ к редактированию страницы', 'ru'),
(299, 'Удаление страницы', 'Доступ к удалению страницы', 'ru'),
(300, 'Транслит слов', 'Доступ к транслиту слов', 'ru'),
(301, 'Смена порядка страниц', 'Доступ к смене порядка страниц', 'ru'),
(302, 'Удаление страниц', 'Доступ к удалению страниц', 'ru'),
(303, 'Перемещение страниц', 'Доступ к перемещению страниц', 'ru'),
(304, 'Отображение страницы перемещения', 'Доступ к отображению страницы перемещения', 'ru'),
(305, 'Теги', 'Теги', 'ru'),
(306, 'Создание ключевых слов', 'Доступ к созданию ключевых слов', 'ru'),
(307, 'Создание описания', 'Доступ к созданию описания', 'ru'),
(308, 'Смена статуса', 'Доступ к смене статуса', 'ru'),
(309, 'Фильтр страниц по категории', 'Доступ к фильтру страниц по категории', 'ru'),
(310, 'Управление доступом', 'Управление доступом', 'ru'),
(311, 'Настройки сайта', 'Доступ к настройкам сайта', 'ru'),
(312, 'Настройки сайта', 'Доступ к настройкам сайта', 'ru'),
(313, 'Settings::main_page', '', 'ru'),
(314, 'Список папок с шаблонами', 'Список папок с шаблонами', 'ru'),
(315, 'Сохранение настроек', 'Доступ к сохранению настроек сайта', 'ru'),
(316, 'Переключение языка в админке', 'Доступ к переключению языка в админке', 'ru'),
(317, 'Settings::save_main', '', 'ru'),
(318, 'Обновление системы', 'Доступ к обновлению системы', 'ru'),
(319, 'Обновление системы', 'Доступ к обновлению системы', 'ru'),
(320, 'Запуск обновления системы', 'Доступ к запуску обновления системы', 'ru'),
(321, 'Проверка статуса обновления системы', 'Доступ к проверке статуса обновления системы', 'ru'),
(322, 'Управление дополнительными полями', 'Доступ к управлению дополнительными полями', 'ru'),
(323, 'Настройки форм', 'Доступ к настройкам форм', 'ru'),
(324, 'Управление дополнительными полями', 'Доступ к управлению дополнительными полями', 'ru'),
(325, 'Создание дополнительного поля', 'Доступ к созданию дополнительного поля', 'ru'),
(326, 'Редактирование типа дополнительного поля', 'Доступ к редактированию типа дополнительного поля', 'ru'),
(327, 'Удаление дополнительного поля', 'Доступ к удалению дополнительного поля', 'ru'),
(328, 'Редактирование дополнительного поля', 'Доступ к редактированию дополнительного поля', 'ru'),
(329, 'Создание групы полей', 'Доступ к созданию групы полей', 'ru'),
(330, 'Редактирование групы полей', 'Доступ к редактированию групы полей', 'ru'),
(331, 'Удаление групы полей', 'Доступ к удалению групы полей', 'ru'),
(332, 'Заполнение дополнительных полей', 'Заполнение дополнительных полей', 'ru'),
(333, 'Получение атрибутов формы', 'Доступ к получению атрибутов формы', 'ru'),
(334, 'Сохранение важности', 'Доступ к сохранению важности', 'ru'),
(335, 'Отображение поля', 'Доступ к отображению поля', 'ru'),
(336, 'Получение адреса', 'Доступ к получению адреса', 'ru'),
(337, 'Получение формы', 'Доступ к форме', 'ru'),
(338, 'Управление комментариями', 'Доступ к управлению комментариями', 'ru'),
(339, 'Отображения списка комментариев', 'Доступ к отображению списка комментариев', 'ru'),
(340, 'Обработка подкомментариев', 'Доступ к обработке подкомментариев', 'ru'),
(341, 'comments::render', '', 'ru'),
(342, 'Редактирование комментария', 'Доступ к редактированию комментария', 'ru'),
(343, 'Обновление комментария', 'Доступ к обновлению комментария', 'ru'),
(344, 'Обновление статуса комментария', 'Доступ к обновлению статуса комментария', 'ru'),
(345, 'Удаление комментария', 'Доступ к удалению комментария', 'ru'),
(346, 'Множественное удаление комментариев', 'Доступ к множественному удалению комментариев', 'ru'),
(347, 'Отображение настроек модуля комментарии', 'Доступ к отображению настроек модуля комментарии', 'ru'),
(348, 'Обновление настроек комментариев', 'Доступ к обновлению настроек комментариев', 'ru'),
(349, 'Управление обратноей связью', 'Доступ к управлению обратной связью', 'ru'),
(350, 'Настройки модуля обратная связь', 'Доступ к настройкам модуля обратная связь', 'ru'),
(351, 'Получение настроек модуля обратная связь', 'Доступ к получению настроек модуля обратная связь', 'ru'),
(352, 'Управление галереей', 'Доступ к галерее', 'ru'),
(353, 'Список категорий галереи', 'Доступ к списку категорий галереи', 'ru'),
(354, 'Категория галереи', 'Доступ к категории галереи', 'ru'),
(355, 'Настройки галереи', 'Доступ к настройкам галереи', 'ru'),
(356, 'Создание альбома', 'Доступ к созданию альбома', 'ru'),
(357, 'Редактирование альбома', 'Доступ к редактированию альбома', 'ru'),
(358, 'Редактирование настроек альбома', 'Доступ к редактированию настроек альбома', 'ru'),
(359, 'Удаление альбома', 'Доступ к удалению альбома', 'ru'),
(360, 'Отображение формы содания альбома', 'Доступ к форме создания альбома', 'ru'),
(361, 'Редактирование альбома', 'Доступ к редактированию альбома', 'ru'),
(362, 'Редактирование изображения', 'Доступ к редактированию изображения', 'ru'),
(363, 'Переименование изображения', 'Доступ к переименованию изображения', 'ru'),
(364, 'Удаление изображения', 'Доступ к удалению изображения', 'ru'),
(365, 'Обновление информации', 'Доступ к обновлению информации', 'ru'),
(366, 'Смена порядка категорий', 'Доступ к смене порядка категорий', 'ru'),
(367, 'Смена порядка альбомов', 'Доступ к смене порядка альбомов', 'ru'),
(368, 'Смена порядка изображений', 'Доступ к смене порядка изображений', 'ru'),
(369, 'Отображение формы создания категории', 'Доступ к отображению формы создания категории', 'ru'),
(370, 'Создание категории', 'Доступ к созданию категории', 'ru'),
(371, 'Редактирование категории', 'Доступ к редактированию категории', 'ru'),
(372, 'Обновление категории', 'Доступ к обновлению категории', 'ru'),
(373, 'Удаление категории', 'Доступ к удалению категории', 'ru'),
(374, 'Загрузка изображений', 'Доступ к загрузке изображений', 'ru'),
(375, 'Загрузка архива', 'Доступ к загрузке архива', 'ru'),
(376, 'Управление модулем рассылки', 'Управление модулем рассылки', 'ru'),
(377, 'Отправка писем групам', 'Доступ к отправке писем групам', 'ru'),
(378, 'Отправка писем групам', 'Доступ к отправке писем групам', 'ru'),
(379, 'Отправка писем подписчикам', 'Доступк отправке писем подписчикам', 'ru'),
(380, 'Отправка писем подписчикам', 'Доступк отправке писем подписчикам', 'ru'),
(381, 'Отправка писем подписчикам', 'Доступк отправке писем подписчикам', 'ru'),
(382, 'Удаление подписчиков', 'Доступ к удалению подписчиков', 'ru'),
(383, 'Управление меню', 'Доступ к управлению меню', 'ru'),
(384, 'Список меню сайта', 'Доступ к списку меню сайта', 'ru'),
(385, 'Отображение меню', 'Доступ к отображению меню', 'ru'),
(386, 'menu::list_menu_items', '', 'ru'),
(387, 'Создание пункта меню', 'Доступ к созданию пункта меню', 'ru'),
(388, 'menu::display_selector', '', 'ru'),
(389, 'menu::get_name_by_id', '', 'ru'),
(390, 'Удаление пункта меню', 'Доступ к удалению пункта меню', 'ru'),
(391, 'Редактирование пункта меню', 'Доступ к редактированию пункта меню', 'ru'),
(392, 'menu::process_root', '', 'ru'),
(393, 'menu::insert_menu_item', '', 'ru'),
(394, 'Смена порядка меню', 'Доступ к смене порядка меню', 'ru'),
(395, 'Создание меню', 'Доступ к созданию меню', 'ru'),
(396, 'Редактирование меню', 'Доступ к редактированию меню', 'ru'),
(397, 'Обновление меню', 'Доступ к обновлению меню', 'ru'),
(398, 'Проверка данных меню', 'Доступ к проверке данных меню', 'ru'),
(399, 'Удаление меню', 'Доступ к удалению меню', 'ru'),
(400, 'Отображение формы создания меню', 'Доступ к отображению формы создания меню', 'ru'),
(401, 'Получение списка страниц', 'Доступ к получению списка страниц', 'ru'),
(402, 'Поиск страниц', 'Доступ к поиску страниц', 'ru'),
(403, 'menu::get_item', '', 'ru'),
(404, 'menu::display_tpl', '', 'ru'),
(405, 'menu::fetch_tpl', '', 'ru'),
(406, 'Отображение окна перевода пункта меню', 'Доступ к отображению окна перевода пункта меню', 'ru'),
(407, 'Перевод пункта меню', 'Доступ к переводу пункта меню', 'ru'),
(408, 'Получение списка языков', 'Доступ к получению списка языков', 'ru'),
(409, 'menu::render', '', 'ru'),
(410, 'Смена активности меню', 'Доступ к смене активности меню', 'ru'),
(411, 'Получение дочерних елементов', 'Доступ к получению дочерних елементов', 'ru'),
(412, 'Управление rss', 'Управление rss', 'ru'),
(413, 'Управление rss', 'Управление rss', 'ru'),
(414, 'rss::render', '', 'ru'),
(415, 'rss::settings_update', '', 'ru'),
(416, 'rss::display_tpl', '', 'ru'),
(417, 'rss::fetch_tpl', '', 'ru'),
(418, 'Управление шаблонами писем', 'Доступ к управлению шаблонами писем', 'ru'),
(419, 'Создание шаблона письма', 'Доступ к созданию шаблона письма', 'ru'),
(420, 'Редактирование шаблона письма', 'Доступ к редактированию шаблона письма', 'ru'),
(421, 'sample_mail::render', '', 'ru'),
(422, 'Список шаблонов писем', 'Доступ к списку шаблонов писем', 'ru'),
(423, 'Удаление шаблона письма', 'Доступ к удалению шаблона письма', 'ru'),
(424, 'sample_module::__construct', '', 'ru'),
(425, 'sample_module::index', '', 'ru'),
(426, 'Управление кнопками соцсетей', 'Доступ к управлению кнопками соцсетей', 'ru'),
(427, 'Управление кнопками соцсетей', 'Доступ к управлению кнопками соцсетей', 'ru'),
(428, 'Обновление настроек модуля кнопок соцсетей', 'Доступ к обновлению настроек модуля кнопок соцсетей', 'ru'),
(429, 'Получение настроек модуля кнопок соцсетей', 'Доступ к настройкам модуля кнопок соцсетей', 'ru'),
(430, 'share::render', '', 'ru'),
(431, 'Управление картой сайта', 'Доступ к управлению картой сайта', 'ru'),
(432, 'Настройки карты сайта', 'Доступ к настройкам карты сайта', 'ru'),
(433, 'sitemap::_load_settings', '', 'ru'),
(434, 'Обновление настроек катры сайта', 'Доступ к обновлению настроек карты сайта', 'ru'),
(435, 'sitemap::display_tpl', '', 'ru'),
(436, 'sitemap::fetch_tpl', '', 'ru'),
(437, 'sitemap::render', '', 'ru'),
(438, 'Управление интеграцией с соцсетями', 'Доступ к управлению интеграцией с соцсетями', 'ru'),
(439, 'Настройки модуля интеграции с соцсетями', 'Достпу к настройкам модуля интеграции с соцсетями', 'ru'),
(440, 'Обновление настроек модуля', 'Доступ к обновлению настроек модуля', 'ru'),
(441, 'social_servises::get_fsettings', '', 'ru'),
(442, 'social_servises::get_vsettings', '', 'ru'),
(443, 'social_servises::_get_templates', '', 'ru'),
(444, 'social_servises::render', '', 'ru'),
(445, 'Редактор шаблонов', 'Доступ к редактору шаблонов', 'ru'),
(446, 'template_editor::render', '', 'ru'),
(447, 'Управление редиректами с удаленнных товаров', 'Управление редиректами с удаленнных товаров', 'ru'),
(448, 'Список редиректов', 'Доступ к списку редиректов', 'ru'),
(449, 'Создание редиректа', 'Доступ к созданию редиректа', 'ru'),
(450, 'Редактирование редиректа', 'Доступ к редактированию редиректа', 'ru'),
(451, 'Удаление редаректа', 'Доступ к удалению редиректа', 'ru'),
(452, 'Управление пользователями', 'Доступ к управлению пользователями', 'ru'),
(453, 'Список пользователей', 'Доступ к списку пользователей', 'ru'),
(454, 'user_manager::set_tpl_roles', '', 'ru'),
(455, 'user_manager::getRolesTable', '', 'ru'),
(456, 'Создание списка юзеров', 'Доступ к созданию списка юзеров', 'ru'),
(457, 'user_manager::auto_complit', '', 'ru'),
(458, 'Создание юзера', 'Доступ к созданию юзера', 'ru'),
(459, 'user_manager::actions', '', 'ru'),
(460, 'Поиск пользователей', 'Доступ к поиску пользователей', 'ru'),
(461, 'Редактирование юзера', 'Доступ к редактированию юзера', 'ru'),
(462, 'Обновление информации о пользователе', 'Доступ к обновлению информации о пользователе', 'ru'),
(463, 'user_manager::groups_index', '', 'ru'),
(464, 'user_manager::create', '', 'ru'),
(465, 'user_manager::edit', '', 'ru'),
(466, 'user_manager::save', '', 'ru'),
(467, 'user_manager::delete', '', 'ru'),
(468, 'Удаление пользователя', 'Доступ к удалению пользвателя', 'ru'),
(469, 'user_manager::update_role_perms', '', 'ru'),
(470, 'user_manager::show_edit_prems_tpl', '', 'ru'),
(471, 'user_manager::get_permissions_table', '', 'ru'),
(472, 'user_manager::get_group_names', '', 'ru'),
(474, 'Список виджетов', 'Доступ к списку виджетов', 'ru'),
(475, 'Создание виджета', 'Доступ к созданию виджета', 'ru'),
(476, 'Отображение формы создания виджета', 'Доступ к отображению формы создания виджета', 'ru'),
(477, 'Редактирование виджетов', 'Доступ к отображению формы создания виджета', 'ru'),
(478, 'Обновление виджета', 'Доступ к обновлению виджетов', 'ru'),
(479, 'Обновление настроек виджета', 'Доступ к обновлению настроек виджета', 'ru'),
(480, 'Удаление виджета', 'Доступ к удалению виджета', 'ru'),
(482, 'Редактирование html виджета', 'Доступ к редактированию html виджета', 'ru'),
(483, 'Редактирование модульного виджета', 'Доступ к редактированию модульного виджета', 'ru'),
(485, 'Поиск картинок', NULL, 'ru'),
(486, 'Доступ к списку подкатегорий', NULL, 'ru'),
(1, 'The list of banners', 'Access to the list of banners', 'en'),
(2, 'Creating a banner', 'To create a banner', 'en'),
(3, 'Edit banner', 'Access to edit banner', 'en'),
(4, 'Remove banner', 'Access to remove banner', 'en'),
(5, 'Translation banner', 'Access to translation banner', 'en'),
(6, 'The activity of the banner', 'Manage banner activity', 'en'),
(7, 'The list of brands', 'Access to the list of brands', 'en'),
(8, 'Brand', 'Access to brand', 'en'),
(9, 'Edit brand', 'Access to the editing of the brand', 'en'),
(10, 'Remove brand', 'Access to the removal of the brand', 'en'),
(11, 'The list of brands', 'Access to the list of brands', 'en'),
(12, 'The translation of the brand', 'Access to the translation of the brand', 'en'),
(13, 'The list of callbacks', 'Access to view callbacks', 'en'),
(14, 'Edit kolbeco', 'Access to edit callbacks', 'en'),
(15, 'Status callbacks', 'View status callbacks', 'en'),
(16, 'The creation of status callbacks', 'To create a status callbacks', 'en'),
(17, 'Editing status of kolbeco', 'Access to edit the status of kolbeco', 'en'),
(18, 'Set the status of kolbeco default', 'Access to the status of kolbeco default', 'en'),
(19, 'Changing the status of kolbeco', 'Access to change the status of kolbeco', 'en'),
(20, 'Change order status callbacks', 'Access to change the order status callbacks', 'en'),
(21, 'Change the theme of kolbeco', 'Access to change the status of kolbeco', 'en'),
(22, 'Removal of kolbeco', 'Access to the removal of kolbeco', 'en'),
(23, 'Remove status', 'Access for removal of the status of kolbeco', 'en'),
(24, 'View the callbacks', 'Access to view the callbacks', 'en'),
(25, 'Create the callbacks', 'To create the callbacks', 'en'),
(26, 'Editing themes kolbeco', 'Access to edit the themes of kolbeco', 'en'),
(27, 'Deleting themes kolbeco', 'Access to delete themes kolbeco', 'en'),
(28, 'Search callbacks', 'Access to search callbacks', 'en'),
(29, 'Browse categories shop', 'Access to view categories shop', 'en'),
(30, 'Create store categories', 'Access to create store categories', 'en'),
(31, 'Edit categories shop', 'Access to edit categories shop', 'en'),
(32, 'Deleting categories shop', 'Access to delete a category, store', 'en'),
(33, 'Viewing the list of categories shop', 'Access to view the list of categories shop', 'en'),
(34, 'Reordering categories shop', 'Access to change the order of categories shop', 'en'),
(35, 'The transliteration of the string', 'Access to the transliteration of the string', 'en'),
(36, 'Translation store categories', 'Access to the translation of store categories', 'en'),
(37, 'Change activity categories shop', 'Access to change activity categories shop', 'en'),
(38, 'Creating template categories', 'To create a template store categories', 'en'),
(39, 'The list of available templates for categorie', 'Access to the list of available templates for categories shop', 'en'),
(40, 'View statistics orders', 'Access to view statistics of orders', 'en'),
(41, 'Filter orders by date', 'Access to filter orders by date', 'en'),
(42, 'ShopAdminCharts::_createDatesDropDown', '', 'en'),
(43, 'View the list of cumulative discounts', 'Access to view the list of cumulative discounts', 'en'),
(44, 'The creation of cumulative discounts', 'To create a cumulative discounts', 'en'),
(45, 'Edit rebates', 'Access to edit rebates', 'en'),
(46, 'To view the list of custom discount', 'Access to view the list of user discounts', 'en'),
(47, 'Viewing user discounts', 'Access to view user discounts', 'en'),
(48, 'Remove all discounts', 'Access to remove all discounts', 'en'),
(49, 'Change status discounts', 'Access to the status change discounts', 'en'),
(50, 'Viewing the list of currencies', 'Access to view the list of currencies', 'en'),
(51, 'Creating exchange', 'Access to the creation of exchange', 'en'),
(52, 'The edit exchange', 'Access to edit exchange', 'en'),
(53, 'Installing exchange default', 'Access to install exchange default', 'en'),
(54, 'Set your home currency', 'Access to setting up the main exchange', 'en'),
(55, 'Remove exchange', 'Access to remove exchange', 'en'),
(56, 'The conversion price', 'Access to the conversion price', 'en'),
(57, 'Check prices in the database', 'Access to the audit database and fix them.', 'en'),
(58, 'To view the list of additional fields for the', 'Access to view the list of additional fields store', 'en'),
(59, 'Create custom fields to store', 'Access to create additional fields to store', 'en'),
(60, 'Editing additional fields to store', 'Access to edit additional fields to store', 'en'),
(61, 'Remove all optional fields for shop', 'Access to remove all additional fields to store', 'en'),
(62, 'Change activity additional fields for the mag', 'Access to change the activity additional fields to store', 'en'),
(63, 'Change privacy additional field', 'Access to change privacy additional fields', 'en'),
(64, 'Change the need for additional fields for ', 'Access to change the need for additional field to store', 'en'),
(65, 'View dashboard admin panel shop', 'Access to view dashboard admin panel shop', 'en'),
(66, 'To view the list of shipping methods', 'Access to view the list of shipping methods', 'en'),
(67, 'Create a shipping method', 'To create a shipping method', 'en'),
(68, 'Change status, shipping method', 'Access to status change shipping method', 'en'),
(69, 'Edit shipping method', 'Access to edit the shipping method', 'en'),
(70, 'Remove shipping method', 'Access to the remove method of delivery', 'en'),
(71, 'ShopAdminDeliverymethods::c_list', '', 'en'),
(72, 'View the list of permanent discounts', 'Access to view the list of permanent discounts', 'en'),
(73, 'The creation of a permanent discounts', 'Access to the creation of a permanent discounts', 'en'),
(74, 'Change of permanent discounts', 'Access to the change permanent discounts', 'en'),
(75, 'Editing a permanent discounts', 'Access to edit the permanent discounts', 'en'),
(76, 'Remove permanent discounts', 'Access to the removal of the permanent discounts', 'en'),
(77, 'View the list of gift certificates', 'Access to view the list of gift certificates', 'en'),
(78, 'Create a gift certificate', 'To create a gift certificate', 'en'),
(79, 'The code for the gift certificate', 'Access to create code for the gift certificate', 'en'),
(80, 'Removal gift certificate', 'Access to the removal gift certificate', 'en'),
(81, 'Edit gift certificate', 'Access to edit gift certificate', 'en'),
(82, 'Change activity gift certificate', 'Access to the changing activity of the gift certificate', 'en'),
(83, 'Customize gift certificates', 'Access to the settings of gift certificates', 'en'),
(84, 'Save settings of gift certificates', 'Access to the settings of gift certificates', 'en'),
(85, 'View list of sets of goods', 'Access to view the list of sets of goods', 'en'),
(86, 'The creation of a set of goods', 'To create a set of goods', 'en'),
(87, 'Editing of a set of goods', 'Access to edit the set of goods', 'en'),
(88, 'Change the order of sets of goods', 'Access to change the order of surgical goods', 'en'),
(89, 'Change activity set of goods', 'Access to the changing activity of the set of goods', 'en'),
(90, 'ShopAdminKits::kit_list', '', 'en'),
(91, 'Deletion of the set of goods', 'Access to the deletion of the set of goods', 'en'),
(92, 'The list of goods', 'Access to products list', 'en'),
(93, 'Viewing the list of uvedomlenii', 'Access to view the list of notifications', 'en'),
(94, 'Editing notifications', 'Access the edit notice', 'en'),
(95, 'Change of status notification', 'Access to the status change notification', 'en'),
(96, 'Notification by mail', 'Access to the notification by mail', 'en'),
(97, 'Destruction notice', 'Access to the delete notification', 'en'),
(98, 'Destruction notice', 'Access to the delete notification', 'en'),
(99, 'Change of status notification', 'Access to the status change notification', 'en'),
(100, 'Search notification', 'Access to the search notification', 'en'),
(101, 'The search for new events', 'Access to search for new events', 'en'),
(102, 'View status notification', 'Access to view status notification', 'en'),
(103, 'Creating a status notification', 'To create a status notification', 'en'),
(104, 'Editing status notification', 'Access to edit status audioline', 'en'),
(105, 'Remove status notification', 'Access to deleted status notification', 'en'),
(106, 'Change order status notifications', 'Access to change the order status notifications', 'en'),
(107, 'View the list of orders', 'Access to view the list of orders', 'en'),
(108, 'Editing order', 'Access to the edit order', 'en'),
(109, 'The order status change', 'Access to the order status change', 'en'),
(110, 'Change the payment status of the order', 'Access to changing the status of the payment order', 'en'),
(111, 'Removal order', 'Access to the removal order status', 'en'),
(112, 'Remove order status', 'Access to the removal order status', 'en'),
(113, 'Change order status', 'Access to change order status', 'en'),
(114, 'Change status of payment orders', 'Access to the change of status of payment orders', 'en'),
(115, 'Displaying the edit window', 'Access to the edit window', 'en'),
(116, 'The edit window set of goods', 'Access to the edit window set of goods', 'en'),
(117, 'Add item to order', 'Access to the box to add products to the order', 'en'),
(118, 'The removal of the goods from the order', 'Access to remove items from the order', 'en'),
(119, 'The list of goods', 'Access to products list', 'en'),
(120, 'Edit item in the order', 'Access to edit item in the order', 'en'),
(121, 'Add item to order', 'Access to add item to order', 'en'),
(122, 'Retrieve a list of products in order', 'Access to list items in the order', 'en'),
(123, 'The search order', 'Access to the search order', 'en'),
(124, 'Create checks', 'Access to create a check', 'en'),
(125, 'Create pdf check', 'Access to create pdf check', 'en'),
(126, 'Create a check', 'To create a check', 'en'),
(127, 'Create order', 'Access to create order', 'en'),
(128, 'View order status list', 'Access to view the order status list', 'en'),
(129, 'Create order status', 'Access to create order status', 'en'),
(130, 'Edit order status', 'Access to edit the status of an order', 'en'),
(131, 'Remove order status', 'Access to the removal order status', 'en'),
(132, 'Display box removal', 'Access to the display window removal', 'en'),
(133, 'Change order status orders', 'Access to change the order status orders', 'en'),
(134, 'To view the list of payment methods', 'Access to view the list of payment methods', 'en'),
(135, 'Create a payment method', 'Access to create a method of payment', 'en'),
(136, 'Change status, payment method', 'Access to status change payment method', 'en'),
(137, 'Edit payment method', 'Access to edit the payment method', 'en'),
(138, 'Remove payment method', 'Access to the remove method of payment', 'en'),
(139, 'Change order payment methods', 'Access to change the order of payment methods', 'en'),
(140, 'The display settings of the payment method', 'Access to the display settings of the payment method', 'en'),
(141, 'ShopAdminProducts::index', '', 'en'),
(142, 'Product creation', 'To create a product', 'en'),
(143, 'Editing product', 'Access to edit item', 'en'),
(144, 'Save additional images', 'Access to sochineniy additional images', 'en'),
(145, 'The removal of the goods', 'Access to the removal of the goods', 'en'),
(146, 'Image processing', 'Access to image processing', 'en'),
(147, 'Delete additional images', 'Access to remove additional images', 'en'),
(148, 'Changing activity of the product', 'Access to the changing activity of the product', 'en'),
(149, 'Change paragraph "Hit" for an item', 'Access to the changing point "Hit" for an item', 'en'),
(150, 'Change "New" to the goods', 'Access to change the item "New" product', 'en'),
(151, 'Change the "Action" for the item', 'Access to change the "Action" for the item', 'en'),
(152, 'Price update', 'Access to update the price of the goods', 'en'),
(153, 'Copying products', 'Access to up goods', 'en'),
(154, 'Destruction of goods', 'Access to the removal of goods', 'en'),
(155, 'The view of the movement of goods', 'The access window moving goods', 'en'),
(156, 'The movement of goods', 'Access to the movement of goods', 'en'),
(157, 'Translation of goods', 'Access to the transfer of goods', 'en'),
(158, 'Getting the list of IDs products', 'Access to the list of IDs products', 'en'),
(159, 'Switching products', 'The access switching products', 'en'),
(160, 'To view the list of tracking', 'Access to view the list of tracking', 'en'),
(161, 'Delete tracking', 'Access to delete tracking', 'en'),
(162, 'Configuration tracking goods', 'Access to the settings of tracking goods', 'en'),
(163, 'To view the list of properties', 'Access to view the list of properties', 'en'),
(164, 'Creating product attributes', 'Access to the creation of product characteristics', 'en'),
(165, 'Editing the properties of the product', 'Access to edit the properties of the product', 'en'),
(166, 'ShopAdminProperties::renderForm', '', 'en'),
(167, 'Change the order of the properties', 'Access to change the order of the properties', 'en'),
(168, 'Destruction of property', 'Access to remove properties', 'en'),
(169, 'Change activity properties', 'Access to change the activity properties', 'en'),
(180, 'ShopAdminRbac::group_create', '', 'en'),
(181, 'ShopAdminRbac::group_edit', '', 'en'),
(182, 'ShopAdminRbac::group_list', '', 'en'),
(183, 'ShopAdminRbac::group_delete', '', 'en'),
(184, 'View product list', 'Access to view the list of goods', 'en'),
(185, 'Change order of options products', 'Access to change the order of options products', 'en'),
(186, 'Autocompletion for search', 'Access to the autocompletion search', 'en'),
(187, 'Advanced search', 'Access to advanced search', 'en'),
(188, 'ShopAdminSearch::renderCustomFields', '', 'en'),
(189, 'Property shop', 'Access to the property store', 'en'),
(190, 'Changing the properties of the store', 'Access to the property change store', 'en'),
(191, 'Setting up integration with Facebook', 'Access to the settings integration with Facebook', 'en'),
(192, 'Setting up integration with VK', 'Access to the settings integration with VK', 'en'),
(193, 'Get a list of templates', 'Access to the list of templates', 'en'),
(194, 'Download settings', 'Access to download settings', 'en'),
(195, 'Start resizing images', 'Access to start resizing images', 'en'),
(196, 'Imports of goods', 'Access to imports of goods', 'en'),
(197, 'Exports of goods', 'Access to the export of goods', 'en'),
(198, 'Get attributes', 'Access to attributes', 'en'),
(199, 'Export users', 'Access to export users', 'en'),
(200, 'View list of users', 'Access to view the list of users', 'en'),
(201, 'Search users', 'Access to search for users', 'en'),
(202, 'Create user', 'To create a user', 'en'),
(203, 'Editing user', 'Access to edit user', 'en'),
(204, 'Deleting a user', 'Access delete user', 'en'),
(205, 'Completion of the list of users', 'Dectpu to the autocompletion list users', 'en'),
(206, 'Viewing the list of warehouses', 'Access to view the list of warehouses', 'en'),
(207, 'Creating a warehouse', 'To create a warehouse', 'en'),
(208, 'Edit warehouse', 'Access to the warehouse edit', 'en'),
(209, 'The destruction of a warehouse', 'Access to the destruction of a warehouse', 'en'),
(210, 'Access to the admin panel', 'Access to the admin panel', 'en'),
(211, 'Initialization settings', 'Access to initialization settings', 'en'),
(212, 'View dashboard basic admin', 'Access to view dashboard basic admin', 'en'),
(213, 'View information about the system', 'Access to view information about the system', 'en'),
(214, 'Cleaning the cache', 'Access to the cache', 'en'),
(215, 'Initialization elfinder', 'Access to initialization elfinder', 'en'),
(216, 'Obtaining protective token', 'Access to the token', 'en'),
(217, 'Admin::sidebar_cats', '', 'en'),
(218, 'The output from the admin panel', 'Access to the exit from the admin panel', 'en'),
(219, 'To report a bug', 'Access error message', 'en'),
(220, 'Event history', 'Access to event history', 'en');
INSERT INTO `shop_rbac_privileges_i18n` (`id`, `title`, `description`, `locale`) VALUES
(221, 'Viewing event history', 'Access to view event history', 'en'),
(222, 'Search in the basic version', 'Access to search in the basic version', 'en'),
(223, 'Admin_search::index', '', 'en'),
(224, 'Advanced search in the basic version', 'Access to advanced search in the basic version', 'en'),
(225, 'Search in the basic version', 'Search in the basic version', 'en'),
(226, 'Validation of the search in the basic version', 'Access to the validation of the search in the basic version', 'en'),
(227, 'Admin_search::form_from_group', '', 'en'),
(228, 'Filtering pages', 'Access to filter pages', 'en'),
(229, 'Autocompletion search', 'Access to the autocompletion search', 'en'),
(230, 'Management bekapai', 'Management access bekapai', 'en'),
(231, 'Preparing backup', 'Access to training backup', 'en'),
(232, 'Creating a backup of the', 'To create a backup', 'en'),
(233, 'Download backup', 'Access to backup', 'en'),
(234, 'Cache management', 'Dectpu to the cache management', 'en'),
(235, 'Cache management', 'Access to the cache management', 'en'),
(236, 'Manage website categories', 'Access management website categories', 'en'),
(237, 'To view the list of site categories', 'Access to view the list of site categories', 'en'),
(238, 'Displaying the categories', 'Access to the form is displayed, create a category', 'en'),
(239, 'Upgrade category', 'Access to update categories', 'en'),
(240, 'Change categories order site', 'Access to change categories order site', 'en'),
(241, 'To view the list of site categories', 'Access to view the list of site categories', 'en'),
(242, 'Category', 'Access to categories', 'en'),
(243, 'Creating website categories', 'Access to the site''s category', 'en'),
(244, 'Update URLs', 'Access to update URLs', 'en'),
(245, 'Check sushestvovanija website categories', 'Access to the test sushestvovanija website categories', 'en'),
(246, 'Quick add category', 'To access the quick add category', 'en'),
(247, 'Quick update block', 'To access the quick update block', 'en'),
(248, 'Edit categories site', 'Access to edit categories site', 'en'),
(249, 'Translation website categories', 'Access to the translation website categories', 'en'),
(250, 'Deleting a category site', 'Access to delete a category site', 'en'),
(251, 'Getting categories', 'Access to subcategories', 'en'),
(252, 'Obtaining status comments', 'Access to statusof comments', 'en'),
(253, 'Access to the components', 'Access to the components', 'en'),
(254, 'Control system components', 'Access to control system components', 'en'),
(255, 'To view the list of site components', 'Access to view the list of site components', 'en'),
(256, 'Verifying the installation of the component', 'Access to verify the installation of the component', 'en'),
(257, 'Installing the module', 'Access to the module installation', 'en'),
(258, 'Remove module', 'The access removal module', 'en'),
(259, 'Search components', 'Access to the search components', 'en'),
(260, 'Module configuration', 'Access to the module settings', 'en'),
(261, 'Save settings modules', 'Access to the settings of the modules', 'en'),
(262, 'The transition to administe module', 'Access to administe module', 'en'),
(263, 'Sauk modules', 'Access to start modules', 'en'),
(264, 'Sauk methods modules', 'Access methods to run modules', 'en'),
(265, 'Getting information about the components', 'Access to information on ingredients', 'en'),
(266, 'Obtaining information about a module', 'Access to information about the module', 'en'),
(267, 'Changing the status of the startup module', 'Access to changing the status of the startup module', 'en'),
(268, 'Change of url access to the module', 'Change of url access to the module', 'en'),
(269, 'Changing the order of components in the list', 'Access to change the order of components in the list', 'en'),
(270, 'Enable\\disable display module in men', 'The access enable / disable display module menu', 'en'),
(271, 'Displaying dashboard admin', 'Access to the display dashboard admin', 'en'),
(272, 'Displaying dashboard admin', 'Access to the display dashboard admin', 'en'),
(273, 'Language management', 'Access control languages', 'en'),
(274, 'View a list of languages', 'Dectpu to view the list of languages', 'en'),
(275, 'The display of the form of the creation of la', 'Access to the display of the form of the creation of language', 'en'),
(276, 'Creating language', 'To create a language', 'en'),
(277, 'Editing language', 'Access to edit language', 'en'),
(278, 'The language update', 'Access to language update', 'en'),
(279, 'Remove language', 'Access to remove language', 'en'),
(280, 'Setting the default language in', 'Access to the language setting default', 'en'),
(281, 'Login to the admin panel', 'Access to login to the admin panel', 'en'),
(282, 'Login to the admin panel', 'Access to login to the admin panel', 'en'),
(283, 'Checking the user''s browser', 'Access to the verification of the user''s browser', 'en'),
(284, 'Entrance', 'Entrance', 'en'),
(285, 'Password recovery', 'Password recovery', 'en'),
(286, 'Update captcha', 'Access to update the captcha', 'en'),
(287, 'Check captcha', 'Access to the verification captcha', 'en'),
(288, 'Mod_search::__construct', '', 'en'),
(289, 'Mod_search::index', '', 'en'),
(290, 'Mod_search::category', '', 'en'),
(291, 'Mod_search::display_install_window', '', 'en'),
(292, 'Mod_search::connect_ftp', '', 'en'),
(293, 'Manage pages', 'Access to administration pages', 'en'),
(294, 'To view the list of pages', 'Access to view the list of pages', 'en'),
(295, 'Adding pages', 'Access to the add page', 'en'),
(296, 'Pages::_set_page_roles', '', 'en'),
(297, 'Editing pages', 'Access to edit pages', 'en'),
(298, 'Update page', 'Access to edit pages', 'en'),
(299, 'Deleting pages', 'Access to deleted pages', 'en'),
(300, 'The transliteration of words', 'Access to the transliteration of words', 'en'),
(301, 'Change page order', 'Access to change the order of pages', 'en'),
(302, 'Deleting pages', 'Access to deleted pages', 'en'),
(303, 'Moving pages', 'Access to move pages', 'en'),
(304, 'Displays the page move', 'Access displays the page move', 'en'),
(305, 'Tags', 'Tags', 'en'),
(306, 'Creating keywords', 'To create a keyword', 'en'),
(307, 'Creating descriptions', 'To create a description', 'en'),
(308, 'Change status', 'Access to the status change', 'en'),
(309, 'Filter pages by category', 'Access to filter pages by category', 'en'),
(310, 'Access control', 'Access control', 'en'),
(311, 'Site settings', 'Access to the site settings', 'en'),
(312, 'Site settings', 'Access to the site settings', 'en'),
(313, 'Settings::main_page', '', 'en'),
(314, 'A list of folders with templates', 'A list of folders with templates', 'en'),
(315, 'Save settings', 'Access to the save site settings', 'en'),
(316, 'Switching language in the admin panel', 'Access to change the language in the admin panel', 'en'),
(317, 'Settings::save_main', '', 'en'),
(318, 'System update', 'Access to system update', 'en'),
(319, 'System update', 'Access to system update', 'en'),
(320, 'Run system update', 'Access to the running system update', 'en'),
(321, 'Status checking system update', 'Access to the status checking system update', 'en'),
(322, 'Management of additional fields', 'Management access additional fields', 'en'),
(323, 'Customize forms', 'Access to the settings form', 'en'),
(324, 'Management of additional fields', 'Management access additional fields', 'en'),
(325, 'Create additional fields', 'Access to create additional fields', 'en'),
(326, 'Edit type additional fields', 'Access the edit type additional fields', 'en'),
(327, 'Remove additional fields', 'Access to remove the extra fields', 'en'),
(328, 'Editing additional fields', 'Access to edit additional fields', 'en'),
(329, 'Create a group of fields', 'To create a group of fields', 'en'),
(330, 'Editing group fields', 'Access the edit group fields', 'en'),
(331, 'Delete group fields', 'Access to the removal of a group of fields', 'en'),
(332, 'Fill the additional fields', 'Fill the additional fields', 'en'),
(333, 'Gets the attributes of the form', 'Access to attributes of the form', 'en'),
(334, 'The conservation importance', 'Access to the conservation importance', 'en'),
(335, 'Display fields', 'Access to the display field', 'en'),
(336, 'Address', 'Access to addresses', 'en'),
(337, 'The form', 'Access to the form', 'en'),
(338, 'Management comments', 'Access to management comments', 'en'),
(339, 'Display the list of comments', 'Access to display the list of comments', 'en'),
(340, 'Processing Podkamennaya', 'Access to processing Podkamennaya', 'en'),
(341, 'comments::render', '', 'en'),
(342, 'Edit comment', 'Access to edit comments', 'en'),
(343, 'Update comment', 'Access to update comment', 'en'),
(344, 'Status update comment', 'Access to status update comment', 'en'),
(345, 'Delete comment', 'Access to delete comment', 'en'),
(346, 'Mass delete comments', 'Access to multiple deleting comments', 'en'),
(347, 'The display module settings comments', 'Access to the display settings of the module comments', 'en'),
(348, 'Update settings comments', 'Access to the update settings comments', 'en'),
(349, 'Management communication obratnoy', 'Access control with feedback', 'en'),
(350, 'Configuration of module feedback', 'Access to the settings of the module feedback', 'en'),
(351, 'The receiving module settings feedback', 'Access to the module settings feedback', 'en'),
(352, 'Gallery control', 'Access to the gallery', 'en'),
(353, 'The list of categories galleries', 'Access to the list of categories galleries', 'en'),
(354, 'Category gallery', 'Access to gallery categories', 'en'),
(355, 'Gallery settings', 'Access to the gallery settings', 'en'),
(356, 'The creation of the album', 'Access to the creation of the album', 'en'),
(357, 'Editing album', 'Access to edit album', 'en'),
(358, 'Edit album', 'Access to the edit album', 'en'),
(359, 'Delete album', 'Access to delete an album', 'en'),
(360, 'The form is displayed, create album', 'Access to the album creation form', 'en'),
(361, 'Editing album', 'Access to edit album', 'en'),
(362, 'Edit image', 'Access the edit image', 'en'),
(363, 'Renaming images', 'Access to rename images', 'en'),
(364, 'Remove the image', 'Access to remove the image', 'en'),
(365, 'Update information', 'Access to update information', 'en'),
(366, 'Change the order of categories', 'Access to change the order of categories', 'en'),
(367, 'Change the order of albums', 'Access to change the order of albums', 'en'),
(368, 'Change the order of the images', 'Access to change the order of the images', 'en'),
(369, 'Displaying the categories', 'Access to the form is displayed, create a category', 'en'),
(370, 'Creating categories', 'To create a category', 'en'),
(371, 'Edit categories', 'Access to edit categories', 'en'),
(372, 'Update categories', 'Access to update categories', 'en'),
(373, 'Deleting a category', 'Access to delete a category', 'en'),
(374, 'Download images', 'Access to download images', 'en'),
(375, 'Download archive', 'Access to download archive', 'en'),
(376, 'The management module distribution', 'The management module distribution', 'en'),
(377, 'Send emails Grupa', 'Access to send emails Grupa', 'en'),
(378, 'Send emails Grupa', 'Access to send emails Grupa', 'en'),
(379, 'Send emails to subscribers', 'The access to send emails to subscribers', 'en'),
(380, 'Send emails to subscribers', 'The access to send emails to subscribers', 'en'),
(381, 'Send emails to subscribers', 'The access to send emails to subscribers', 'en'),
(382, 'Remove subscribers', 'Access to remove subscribers', 'en'),
(383, 'Menu control', 'Management access menu', 'en'),
(384, 'The list menu of the site', 'Access to the list menu of the site', 'en'),
(385, 'Display menu', 'Access to the display menu', 'en'),
(386, 'menu::list_menu_items', '', 'en'),
(387, 'Create a menu item', 'Access to create a menu item', 'en'),
(388, 'menu::display_selector', '', 'en'),
(389, 'menu::get_name_by_id', '', 'en'),
(390, 'The delete menu item', 'Access the delete menu item', 'en'),
(391, 'Editing a menu item', 'Access the edit menu item', 'en'),
(392, 'menu::process_root', '', 'en'),
(393, 'menu::insert_menu_item', '', 'en'),
(394, 'Change menu order', 'Access the change menu order', 'en'),
(395, 'Creating menus', 'Access to menu creation', 'en'),
(396, 'The edit menu', 'Access to the edit menu', 'en'),
(397, 'Update menu', 'Access to the update menu', 'en'),
(398, 'Data validation menu', 'Access to the data validation menu', 'en'),
(399, 'Remove menu', 'Access the delete menu', 'en'),
(400, 'Display the menu', 'Access to display the menu', 'en'),
(401, 'Get a list of pages', 'Access to the list of pages', 'en'),
(402, 'Search pages', 'Access to the search page', 'en'),
(403, 'menu::get_item', '', 'en'),
(404, 'menu::display_tpl', '', 'en'),
(405, 'menu::fetch_tpl', '', 'en'),
(406, 'Displays translation of the menu item', 'Access displays a translation of the menu item', 'en'),
(407, 'Translation of the menu item', 'Access to the translation menu item', 'en'),
(408, 'Obtaining a list of languages', 'Access to the list of languages', 'en'),
(409, 'menu::render', '', 'en'),
(410, 'Change activity menu', 'Access to change the activity menu', 'en'),
(411, 'Getting child elements', 'Access to child elements', 'en'),
(412, 'Management rss', 'Management rss', 'en'),
(413, 'Management rss', 'Management rss', 'en'),
(414, 'rss::render', '', 'en'),
(415, 'rss::settings_update', '', 'en'),
(416, 'rss::display_tpl', '', 'en'),
(417, 'rss::fetch_tpl', '', 'en'),
(418, 'Manage email templates', 'Access to the email template Manager', 'en'),
(419, 'Create email template', 'To create a letter template', 'en'),
(420, 'Editing email template', 'Access to edit the email template', 'en'),
(421, 'sample_mail::render', '', 'en'),
(422, 'The list of email templates', 'Access to the list of email templates', 'en'),
(423, 'Delete letter template', 'Access to remove email template', 'en'),
(424, 'sample_module::__construct', '', 'en'),
(425, 'sample_module::index', '', 'en'),
(426, 'The control buttons of social networks', 'Access to the control buttons of social networks', 'en'),
(427, 'The control buttons of social networks', 'Access to the control buttons of social networks', 'en'),
(428, 'Update the module settings buttons of social ', 'Access to the update module settings buttons of social networks', 'en'),
(429, 'The receiving module settings buttons of soci', 'Access to the module settings for the buttons of social networks', 'en'),
(430, 'share::render', '', 'en'),
(431, 'Management site map', 'Access to the management card customers', 'en'),
(432, 'Settings site map', 'Access to the settings site map', 'en'),
(433, 'sitemap::_load_settings', '', 'en'),
(434, 'Update settings cards site', 'Access to the update settings site map', 'en'),
(435, 'sitemap::display_tpl', '', 'en'),
(436, 'sitemap::fetch_tpl', '', 'en'),
(437, 'sitemap::render', '', 'en'),
(438, 'Management integration with social networks', 'Access control integration with social networks', 'en'),
(439, 'Module configuration the integration with soc', 'Dectpu to the module settings, integration with social networks', 'en'),
(440, 'Update the module settings', 'Access to the update module settings', 'en'),
(441, 'social_servises::get_fsettings', '', 'en'),
(442, 'social_servises::get_vsettings', '', 'en'),
(443, 'social_servises::_get_templates', '', 'en'),
(444, 'social_servises::render', '', 'en'),
(445, 'Templates editor', 'Access the template editor', 'en'),
(446, 'template_editor::render', '', 'en'),
(447, 'Managing redirects with udalennyh goods', 'Managing redirects with udalennyh goods', 'en'),
(448, 'The list of redirects', 'Access to the list of redirects', 'en'),
(449, 'Creating a redirect', 'To create a redirect', 'en'),
(450, 'Edit redirect', 'Access to edit the redirect', 'en'),
(451, 'Remove redirect', 'Access to remove redirect', 'en'),
(452, 'User management', 'Access to user management', 'en'),
(453, 'The list of users', 'Access to the user list', 'en'),
(454, 'user_manager::set_tpl_roles', '', 'en'),
(455, 'user_manager::getRolesTable', '', 'en'),
(456, 'Create list of users', 'To create a list of users', 'en'),
(457, 'user_manager::auto_complit', '', 'en'),
(458, 'Create user', 'To create a user', 'en'),
(459, 'user_manager::actions', '', 'en'),
(460, 'Search users', 'Access to search for users', 'en'),
(461, 'Editing user', 'Access to edit user', 'en'),
(462, 'Update user information', 'Access to update user information', 'en'),
(463, 'user_manager::groups_index', '', 'en'),
(464, 'user_manager::create', '', 'en'),
(465, 'user_manager::edit', '', 'en'),
(466, 'user_manager::save', '', 'en'),
(467, 'user_manager::delete', '', 'en'),
(468, 'Deleting a user', 'Access delete user', 'en'),
(469, 'user_manager::update_role_perms', '', 'en'),
(470, 'user_manager::show_edit_prems_tpl', '', 'en'),
(471, 'user_manager::get_permissions_table', '', 'en'),
(472, 'user_manager::get_group_names', '', 'en'),
(474, 'The list of widgets', 'Access to the list of widgets', 'en'),
(475, 'Creating a widget', 'To create a widget', 'en'),
(476, 'Display the widget', 'Access to display the widget', 'en'),
(477, 'Editing widgets', 'Access to display the widget', 'en'),
(478, 'Update widget', 'Access to update widgets', 'en'),
(479, 'Update the widget preferences', 'Access to update the widget preferences', 'en'),
(480, 'Removing a widget', 'Access to delete a widget', 'en'),
(482, 'Edit the html widget', 'Access to edit the html widget', 'en'),
(483, 'Editing modular widget', 'Access to edit a modular widget', 'en'),
(485, 'Image search', '', 'en'),
(486, 'Access to list of categories', '', 'en'),
(734, 'Merge orders', '', 'en'),
(734, 'Объединение Заказов', '', 'ru');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_rbac_roles`
--

DROP TABLE IF EXISTS `shop_rbac_roles`;
CREATE TABLE IF NOT EXISTS `shop_rbac_roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `importance` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_rbac_roles`
--

INSERT INTO `shop_rbac_roles` (`id`, `name`, `importance`, `description`) VALUES
(1, 'Administrator', 1, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_rbac_roles_i18n`
--

DROP TABLE IF EXISTS `shop_rbac_roles_i18n`;
CREATE TABLE IF NOT EXISTS `shop_rbac_roles_i18n` (
  `id` int(11) NOT NULL,
  `alt_name` varchar(45) DEFAULT NULL,
  `locale` varchar(5) NOT NULL,
  `description` varchar(200) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_rbac_roles_i18n`
--

INSERT INTO `shop_rbac_roles_i18n` (`id`, `alt_name`, `locale`, `description`) VALUES
(1, 'Администратор', 'ru', 'Доступны все елементы управления админкой'),
(1, 'Адмiнiстратор', 'ukr', ''),
(1, 'Адмiнiстратор', 'ua', ''),
(1, 'Admin', 'en', 'Access to all controls');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_rbac_roles_privileges`
--

DROP TABLE IF EXISTS `shop_rbac_roles_privileges`;
CREATE TABLE IF NOT EXISTS `shop_rbac_roles_privileges` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `privilege_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3202 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_rbac_roles_privileges`
--

INSERT INTO `shop_rbac_roles_privileges` (`id`, `role_id`, `privilege_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20),
(21, 1, 21),
(22, 1, 22),
(23, 1, 23),
(24, 1, 24),
(25, 1, 25),
(26, 1, 26),
(27, 1, 27),
(28, 1, 28),
(29, 1, 29),
(30, 1, 30),
(31, 1, 31),
(32, 1, 32),
(33, 1, 33),
(34, 1, 34),
(35, 1, 35),
(36, 1, 36),
(37, 1, 37),
(38, 1, 38),
(39, 1, 39),
(40, 1, 40),
(41, 1, 41),
(42, 1, 42),
(43, 1, 43),
(44, 1, 44),
(45, 1, 45),
(46, 1, 46),
(47, 1, 47),
(48, 1, 48),
(49, 1, 49),
(50, 1, 50),
(51, 1, 51),
(52, 1, 52),
(53, 1, 53),
(54, 1, 54),
(55, 1, 55),
(56, 1, 56),
(57, 1, 57),
(58, 1, 58),
(59, 1, 59),
(60, 1, 60),
(61, 1, 61),
(62, 1, 62),
(63, 1, 63),
(64, 1, 64),
(65, 1, 65),
(66, 1, 66),
(67, 1, 67),
(68, 1, 68),
(69, 1, 69),
(70, 1, 70),
(71, 1, 71),
(72, 1, 72),
(73, 1, 73),
(74, 1, 74),
(75, 1, 75),
(76, 1, 76),
(77, 1, 77),
(78, 1, 78),
(79, 1, 79),
(80, 1, 80),
(81, 1, 81),
(82, 1, 82),
(83, 1, 83),
(84, 1, 84),
(85, 1, 85),
(86, 1, 86),
(87, 1, 87),
(88, 1, 88),
(89, 1, 89),
(90, 1, 90),
(91, 1, 91),
(92, 1, 92),
(93, 1, 93),
(94, 1, 94),
(95, 1, 95),
(96, 1, 96),
(97, 1, 97),
(98, 1, 98),
(99, 1, 99),
(100, 1, 100),
(101, 1, 101),
(102, 1, 102),
(103, 1, 103),
(104, 1, 104),
(105, 1, 105),
(106, 1, 106),
(107, 1, 107),
(108, 1, 108),
(109, 1, 109),
(110, 1, 110),
(111, 1, 111),
(112, 1, 112),
(113, 1, 113),
(114, 1, 114),
(115, 1, 115),
(116, 1, 116),
(117, 1, 117),
(118, 1, 118),
(119, 1, 119),
(120, 1, 120),
(121, 1, 121),
(122, 1, 122),
(123, 1, 123),
(124, 1, 124),
(125, 1, 125),
(126, 1, 126),
(127, 1, 127),
(128, 1, 128),
(129, 1, 129),
(130, 1, 130),
(131, 1, 131),
(132, 1, 132),
(133, 1, 133),
(134, 1, 134),
(135, 1, 135),
(136, 1, 136),
(137, 1, 137),
(138, 1, 138),
(139, 1, 139),
(140, 1, 140),
(141, 1, 141),
(142, 1, 142),
(143, 1, 143),
(144, 1, 144),
(145, 1, 145),
(146, 1, 146),
(147, 1, 147),
(148, 1, 148),
(149, 1, 149),
(150, 1, 150),
(151, 1, 151),
(152, 1, 152),
(153, 1, 153),
(154, 1, 154),
(155, 1, 155),
(156, 1, 156),
(157, 1, 157),
(158, 1, 158),
(159, 1, 159),
(160, 1, 160),
(161, 1, 161),
(162, 1, 162),
(163, 1, 163),
(164, 1, 164),
(165, 1, 165),
(166, 1, 166),
(167, 1, 167),
(168, 1, 168),
(169, 1, 169),
(184, 1, 184),
(185, 1, 185),
(186, 1, 186),
(187, 1, 187),
(188, 1, 188),
(189, 1, 189),
(190, 1, 190),
(191, 1, 191),
(192, 1, 192),
(193, 1, 193),
(194, 1, 194),
(195, 1, 195),
(196, 1, 196),
(197, 1, 197),
(198, 1, 198),
(199, 1, 199),
(200, 1, 200),
(201, 1, 201),
(202, 1, 202),
(203, 1, 203),
(204, 1, 204),
(205, 1, 205),
(206, 1, 206),
(207, 1, 207),
(208, 1, 208),
(209, 1, 209),
(210, 1, 210),
(211, 1, 211),
(212, 1, 212),
(213, 1, 213),
(214, 1, 214),
(215, 1, 215),
(216, 1, 216),
(217, 1, 217),
(218, 1, 218),
(219, 1, 219),
(220, 1, 220),
(221, 1, 221),
(222, 1, 222),
(223, 1, 223),
(224, 1, 224),
(225, 1, 225),
(226, 1, 226),
(227, 1, 227),
(228, 1, 228),
(229, 1, 229),
(230, 1, 230),
(231, 1, 231),
(232, 1, 232),
(233, 1, 233),
(234, 1, 234),
(235, 1, 235),
(236, 1, 236),
(237, 1, 237),
(238, 1, 238),
(239, 1, 239),
(240, 1, 240),
(241, 1, 241),
(242, 1, 242),
(243, 1, 243),
(244, 1, 244),
(245, 1, 245),
(246, 1, 246),
(247, 1, 247),
(248, 1, 248),
(249, 1, 249),
(250, 1, 250),
(251, 1, 251),
(252, 1, 252),
(253, 1, 253),
(254, 1, 254),
(255, 1, 255),
(256, 1, 256),
(257, 1, 257),
(258, 1, 258),
(259, 1, 259),
(260, 1, 260),
(261, 1, 261),
(262, 1, 262),
(263, 1, 263),
(264, 1, 264),
(265, 1, 265),
(266, 1, 266),
(267, 1, 267),
(268, 1, 268),
(269, 1, 269),
(270, 1, 270),
(271, 1, 271),
(272, 1, 272),
(273, 1, 273),
(274, 1, 274),
(275, 1, 275),
(276, 1, 276),
(277, 1, 277),
(278, 1, 278),
(279, 1, 279),
(280, 1, 280),
(281, 1, 281),
(282, 1, 282),
(283, 1, 283),
(284, 1, 284),
(285, 1, 285),
(286, 1, 286),
(287, 1, 287),
(293, 1, 293),
(294, 1, 294),
(295, 1, 295),
(296, 1, 296),
(297, 1, 297),
(298, 1, 298),
(299, 1, 299),
(300, 1, 300),
(301, 1, 301),
(302, 1, 302),
(303, 1, 303),
(304, 1, 304),
(305, 1, 305),
(306, 1, 306),
(307, 1, 307),
(308, 1, 308),
(309, 1, 309),
(310, 1, 310),
(311, 1, 311),
(312, 1, 312),
(313, 1, 313),
(314, 1, 314),
(315, 1, 315),
(316, 1, 316),
(317, 1, 317),
(322, 1, 322),
(323, 1, 323),
(324, 1, 324),
(325, 1, 325),
(326, 1, 326),
(327, 1, 327),
(328, 1, 328),
(329, 1, 329),
(330, 1, 330),
(331, 1, 331),
(332, 1, 332),
(333, 1, 333),
(334, 1, 334),
(335, 1, 335),
(336, 1, 336),
(337, 1, 337),
(338, 1, 338),
(339, 1, 339),
(340, 1, 340),
(341, 1, 341),
(342, 1, 342),
(343, 1, 343),
(344, 1, 344),
(345, 1, 345),
(346, 1, 346),
(347, 1, 347),
(348, 1, 348),
(349, 1, 349),
(350, 1, 350),
(351, 1, 351),
(352, 1, 352),
(353, 1, 353),
(354, 1, 354),
(355, 1, 355),
(356, 1, 356),
(357, 1, 357),
(358, 1, 358),
(359, 1, 359),
(360, 1, 360),
(361, 1, 361),
(362, 1, 362),
(363, 1, 363),
(364, 1, 364),
(365, 1, 365),
(366, 1, 366),
(367, 1, 367),
(368, 1, 368),
(369, 1, 369),
(370, 1, 370),
(371, 1, 371),
(372, 1, 372),
(373, 1, 373),
(374, 1, 374),
(375, 1, 375),
(376, 1, 376),
(377, 1, 377),
(378, 1, 378),
(379, 1, 379),
(380, 1, 380),
(381, 1, 381),
(382, 1, 382),
(383, 1, 383),
(384, 1, 384),
(385, 1, 385),
(386, 1, 386),
(387, 1, 387),
(388, 1, 388),
(389, 1, 389),
(390, 1, 390),
(391, 1, 391),
(392, 1, 392),
(393, 1, 393),
(394, 1, 394),
(395, 1, 395),
(396, 1, 396),
(397, 1, 397),
(398, 1, 398),
(399, 1, 399),
(400, 1, 400),
(401, 1, 401),
(402, 1, 402),
(403, 1, 403),
(404, 1, 404),
(405, 1, 405),
(406, 1, 406),
(407, 1, 407),
(408, 1, 408),
(409, 1, 409),
(410, 1, 410),
(411, 1, 411),
(412, 1, 412),
(413, 1, 413),
(414, 1, 414),
(415, 1, 415),
(416, 1, 416),
(417, 1, 417),
(418, 1, 418),
(419, 1, 419),
(420, 1, 420),
(421, 1, 421),
(422, 1, 422),
(423, 1, 423),
(426, 1, 426),
(427, 1, 427),
(428, 1, 428),
(429, 1, 429),
(430, 1, 430),
(431, 1, 431),
(432, 1, 432),
(433, 1, 433),
(434, 1, 434),
(435, 1, 435),
(436, 1, 436),
(437, 1, 437),
(438, 1, 438),
(439, 1, 439),
(440, 1, 440),
(441, 1, 441),
(442, 1, 442),
(443, 1, 443),
(444, 1, 444),
(445, 1, 445),
(446, 1, 446),
(447, 1, 447),
(448, 1, 448),
(449, 1, 449),
(450, 1, 450),
(451, 1, 451),
(452, 1, 452),
(453, 1, 453),
(454, 1, 454),
(455, 1, 455),
(456, 1, 456),
(457, 1, 457),
(458, 1, 458),
(459, 1, 459),
(460, 1, 460),
(461, 1, 461),
(462, 1, 462),
(463, 1, 463),
(464, 1, 464),
(465, 1, 465),
(466, 1, 466),
(467, 1, 467),
(468, 1, 468),
(469, 1, 469),
(470, 1, 470),
(471, 1, 471),
(472, 1, 472),
(473, 1, 473),
(474, 1, 474),
(475, 1, 475),
(476, 1, 476),
(477, 1, 477),
(478, 1, 478),
(479, 1, 479),
(480, 1, 480),
(482, 1, 482),
(483, 1, 483),
(485, 1, 485),
(486, 1, 486),
(612, 1, 424),
(613, 1, 425),
(2456, 1, 672),
(2455, 1, 684),
(2454, 1, 703),
(2453, 1, 702),
(2452, 1, 701),
(2451, 1, 700),
(2450, 1, 699),
(2449, 1, 698),
(2448, 1, 697),
(2447, 1, 696),
(2446, 1, 695),
(2445, 1, 694),
(2444, 1, 693),
(2443, 1, 692),
(2442, 1, 691),
(2441, 1, 690),
(2440, 1, 689),
(2439, 1, 688),
(2438, 1, 687),
(2437, 1, 686),
(2436, 1, 704),
(2435, 1, 705),
(2434, 1, 706),
(2457, 1, 707),
(2458, 1, 708),
(2459, 1, 709),
(2460, 1, 710),
(2461, 1, 711),
(2462, 1, 712),
(2463, 1, 713),
(2464, 1, 714),
(2465, 1, 715),
(2466, 1, 716),
(2432, 1, 683),
(2431, 1, 682),
(2430, 1, 681),
(2429, 1, 680),
(2428, 1, 679),
(2427, 1, 678),
(2426, 1, 677),
(2425, 1, 676),
(2424, 1, 675),
(2423, 1, 674),
(2422, 1, 673),
(2421, 1, 685),
(1581, 1, 500),
(1582, 1, 501),
(1583, 1, 502),
(1584, 1, 503),
(1585, 1, 504),
(1586, 1, 505),
(1587, 1, 506),
(1588, 1, 507),
(1589, 1, 508),
(1590, 1, 509),
(1591, 1, 510),
(1592, 1, 511),
(1593, 1, 512),
(1594, 1, 513),
(1595, 1, 514),
(1596, 1, 515),
(1602, 1, 656),
(1603, 1, 657),
(1604, 1, 658),
(1605, 1, 659),
(1606, 1, 481),
(1607, 1, 484),
(1608, 1, 643),
(1609, 1, 644),
(1610, 1, 645),
(1611, 1, 646),
(1612, 1, 647),
(1613, 1, 648),
(1614, 1, 649),
(1615, 1, 650),
(1616, 1, 651),
(1617, 1, 652),
(1618, 1, 653),
(1619, 1, 654),
(1620, 1, 655),
(1621, 1, 499),
(1622, 1, 498),
(1623, 1, 664),
(1624, 1, 665),
(1625, 1, 606),
(1626, 1, 607),
(1627, 1, 608),
(1628, 1, 609),
(1629, 1, 660),
(1630, 1, 661),
(1631, 1, 662),
(1632, 1, 663),
(1633, 1, 610),
(1634, 1, 611),
(1635, 1, 612),
(1636, 1, 613),
(1637, 1, 614),
(1638, 1, 666),
(1639, 1, 667),
(1640, 1, 668),
(1641, 1, 669),
(1642, 1, 670),
(1643, 1, 671),
(1644, 1, 567),
(1645, 1, 568),
(1646, 1, 569),
(1647, 1, 570),
(1648, 1, 571),
(1649, 1, 572),
(1650, 1, 573),
(1651, 1, 599),
(1652, 1, 600),
(1653, 1, 601),
(1654, 1, 602),
(1655, 1, 603),
(1656, 1, 604),
(1657, 1, 605),
(1658, 1, 516),
(1659, 1, 517),
(1660, 1, 518),
(1661, 1, 519),
(1662, 1, 520),
(1663, 1, 521),
(1664, 1, 522),
(1665, 1, 523),
(1666, 1, 558),
(1667, 1, 559),
(1668, 1, 560),
(1669, 1, 561),
(1670, 1, 562),
(1671, 1, 563),
(1672, 1, 564),
(1673, 1, 565),
(1674, 1, 566),
(1675, 1, 535),
(1676, 1, 536),
(1677, 1, 537),
(1678, 1, 538),
(1679, 1, 539),
(1680, 1, 540),
(1681, 1, 541),
(1682, 1, 542),
(1683, 1, 543),
(1684, 1, 544),
(1685, 1, 487),
(1686, 1, 488),
(1687, 1, 489),
(1688, 1, 490),
(1689, 1, 491),
(1690, 1, 492),
(1691, 1, 493),
(1692, 1, 494),
(1693, 1, 495),
(1694, 1, 496),
(1695, 1, 497),
(1696, 1, 524),
(1697, 1, 525),
(1698, 1, 526),
(1699, 1, 527),
(1700, 1, 528),
(1701, 1, 529),
(1702, 1, 530),
(1703, 1, 531),
(1704, 1, 532),
(1705, 1, 533),
(1706, 1, 534),
(1707, 1, 615),
(1708, 1, 616),
(1709, 1, 617),
(1710, 1, 618),
(1711, 1, 619),
(1712, 1, 620),
(1713, 1, 621),
(1714, 1, 622),
(1715, 1, 623),
(1716, 1, 624),
(1717, 1, 625),
(1718, 1, 626),
(1719, 1, 545),
(1720, 1, 546),
(1721, 1, 547),
(1722, 1, 548),
(1723, 1, 549),
(1724, 1, 550),
(1725, 1, 551),
(1726, 1, 552),
(1727, 1, 553),
(1728, 1, 554),
(1729, 1, 555),
(1730, 1, 556),
(1731, 1, 557),
(1732, 1, 627),
(1733, 1, 628),
(1734, 1, 629),
(1735, 1, 630),
(1736, 1, 631),
(1737, 1, 632),
(1738, 1, 633),
(1739, 1, 634),
(1740, 1, 635),
(1741, 1, 636),
(1742, 1, 637),
(1743, 1, 638),
(1744, 1, 639),
(1745, 1, 640),
(1746, 1, 641),
(1747, 1, 642),
(1748, 1, 574),
(1749, 1, 575),
(1750, 1, 576),
(1751, 1, 577),
(1752, 1, 578),
(1753, 1, 579),
(1754, 1, 580),
(1755, 1, 581),
(1756, 1, 582),
(1757, 1, 583),
(1758, 1, 584),
(1759, 1, 585),
(1760, 1, 586),
(1761, 1, 587),
(1762, 1, 588),
(1763, 1, 589),
(1764, 1, 590),
(1765, 1, 591),
(1766, 1, 592),
(1767, 1, 593),
(1768, 1, 594),
(1769, 1, 595),
(1770, 1, 596),
(1771, 1, 597),
(1772, 1, 598),
(3160, 1, 717),
(3171, 1, 726),
(3172, 1, 719),
(3173, 1, 720),
(3174, 1, 721),
(3175, 1, 722),
(3176, 1, 723),
(3177, 1, 724),
(3178, 1, 718),
(3179, 1, 725),
(3182, 1, 727),
(3183, 1, 728),
(3184, 1, 729),
(3185, 1, 730),
(3186, 1, 731),
(3187, 1, 732),
(3188, 1, 733),
(3189, 1, 734),
(3190, 1, 735),
(3191, 1, 736),
(3192, 1, 737),
(3193, 1, 738),
(3194, 1, 739),
(3195, 1, 740),
(3196, 1, 741),
(3197, 1, 742),
(3198, 1, 743),
(3199, 1, 744),
(3200, 1, 745),
(3201, 1, 746);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_settings`
--

DROP TABLE IF EXISTS `shop_settings`;
CREATE TABLE IF NOT EXISTS `shop_settings` (
  `name` varchar(255) NOT NULL,
  `value` text,
  `locale` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_settings`
--

INSERT INTO `shop_settings` (`name`, `value`, `locale`) VALUES
('mainImageWidth', '320', ''),
('mainImageHeight', '320', ''),
('smallImageWidth', '140', ''),
('smallImageHeight', '140', ''),
('addImageWidth', '800', ''),
('addImageHeight', '600', ''),
('imagesQuality', '99', ''),
('systemTemplatePath', './templates/unishop/shop/', ''),
('frontProductsPerPage', '24', ''),
('adminProductsPerPage', '24', ''),
('ordersMessageFormat', NULL, ''),
('ordersMessageText', 'Здравствуйте, %userName%.  \n\nМы благодарны Вам за то, что совершили заказ в нашем магазине "ImageCMS Shop" \nВы указали следующие контактные данные: \n\nEmail адрес: %userEmail% \nНомер телефона: %userPhone% \nАдрес доставки: %userDeliver%  \n\nМенеджеры нашего магазина вскоре свяжутся с Вами и помогут с оформлением и оплатой товара.  \n\nТакже, Вы можете всегда посмотреть за статусом Вашего заказа, перейдя по ссылке:  %orderLink%.  \n\nСпасибо за ваш заказ, искренне Ваши, сотрудники ImageCMS Shop.  \n\nПри возникновении любых вопросов, обращайтесь за телефонами:  \n+7 (095) 222-33-22 +38 (098) 222-33-22', ''),
('ordersSendMessage', NULL, ''),
('ordersSenderEmail', NULL, ''),
('ordersSenderName', 'DemoShop ImageCms.net', ''),
('ordersMessageTheme', 'Данные для просмотра совершенной покупки', ''),
('2_LMI_SECRET_KEY', 'bank', ''),
('2_LMI_PAYEE_PURSE', 'bank', ''),
('1_LMI_SECRET_KEY', 'cur', ''),
('1_LMI_PAYEE_PURSE', 'cur', ''),
('2_OschadBankData', 'a:5:{s:8:"receiver";s:41:"ТЗОВ "Екзампл Магазин" ";s:4:"code";s:9:"123456789";s:7:"account";s:12:"123456789123";s:3:"mfo";s:6:"123456";s:8:"banknote";s:7:"грн.";}', ''),
('3_SberBankData', 'a:8:{s:12:"receiverName";s:45:"Наименование получателя";s:8:"bankName";s:29:"Банк получателя";s:11:"receiverInn";s:10:"1231231231";s:7:"account";s:20:"15412398123312341237";s:3:"BIK";s:9:"123123123";s:11:"cor_account";s:20:"12312312334012340123";s:8:"bankNote";s:7:"руб.";s:9:"bankNote2";s:7:"коп.";}', ''),
('4_RobokassaData', 'a:3:{s:5:"login";s:5:"login";s:9:"password1";s:9:"password1";s:9:"password2";s:9:"password2";}', ''),
('notifyOrderStatusMessageFormat', NULL, ''),
('notifyOrderStatusMessageText', '', ''),
('notifyOrderStatusSenderEmail', NULL, ''),
('notifyOrderStatusSenderName', '', ''),
('notifyOrderStatusMessageTheme', '', ''),
('wishListsMessageFormat', 'text', ''),
('wishListsMessageText', '', ''),
('wishListsSenderEmail', 'noreply@example.com', ''),
('wishListsSenderName', '', ''),
('wishListsMessageTheme', '', ''),
('notificationsMessageFormat', 'text', ''),
('notificationsMessageText', '', ''),
('notificationsSenderEmail', 'noreply@example.com', ''),
('notificationsSenderName', '', ''),
('notificationsMessageTheme', '', ''),
('callbacksSendNotification', '0', ''),
('callbacksMessageFormat', 'text', ''),
('callbacksMessageText', '', ''),
('callbacksSendEmailTo', 'manager@example.com', ''),
('callbacksSenderEmail', 'noreply@example.com', ''),
('callbacksSenderName', '', ''),
('callbacksMessageTheme', '', ''),
('userInfoRegister', '1', ''),
('userInfoMessageFormat', 'text', ''),
('userInfoMessageText', '', ''),
('userInfoSenderEmail', 'noreply@example.com', ''),
('userInfoSenderName', '', ''),
('userInfoMessageTheme', '', ''),
('topSalesBlockFormulaCoef', '1', ''),
('pricePrecision', '4', ''),
('smallAddImageWidth', '90', ''),
('smallAddImageHeight', '90', ''),
('forgotPasswordMessageText', 'Здравствуйте!\n\nНа сайте %webSiteName% создан запрос на восстановление пароля для Вашего аккаунта.\n\nДля завершения процедуры восстановления пароля перейдите по ссылке %resetPasswordUri% \n\nВаш новый пароль для входа: %password%\n\nЕсли это письмо попало к Вам по ошибке просто проигнорируйте его.\n\n\nПри возникновении любых вопросов, обращайтесь по телефонам:  \n(012)  345-67-89 , (012)  345-67-89 \n---\n\nС уважением, \nсотрудники службы продаж %webSiteName%', ''),
('watermark_wm_hor_alignment', 'left', ''),
('watermark_wm_vrt_alignment', 'bottom', ''),
('watermark_watermark_type', 'text', ''),
('watermark_watermark_image', '', ''),
('watermark_watermark_image_opacity', '50', ''),
('watermark_watermark_padding', '', ''),
('watermark_watermark_text', 'demoshop.imagecms.net', ''),
('watermark_watermark_font_size', '', ''),
('watermark_watermark_color', '', ''),
('watermark_watermark_font_path', '', ''),
('watermark_active', '', ''),
('forgotPasswordMessageText', NULL, 'ru'),
('ordersMessageText', NULL, 'ru'),
('ordersSenderName', NULL, 'ru'),
('ordersMessageTheme', NULL, 'ru'),
('11_LiqPayData', 'a:2:{s:11:"merchant_id";s:6:"111111";s:12:"merchant_sig";s:6:"111111";}', ''),
('notifyOrderStatusMessageText', NULL, 'ru'),
('notifyOrderStatusSenderName', NULL, 'ru'),
('notifyOrderStatusMessageTheme', NULL, 'ru'),
('wishListsMessageText', '', 'ru'),
('wishListsSenderName', 'admin', 'ru'),
('wishListsMessageTheme', '', 'ru'),
('notificationsMessageText', '', 'ru'),
('notificationsSenderName', '', 'ru'),
('notificationsMessageTheme', '', 'ru'),
('callbacksMessageText', '', 'ru'),
('callbacksSenderName', '', 'ru'),
('callbacksMessageTheme', '', 'ru'),
('userInfoMessageText', '', 'ru'),
('userInfoSenderName', '', 'ru'),
('userInfoMessageTheme', '', 'ru'),
('adminMessageCallback', '<h1>Спасибо за заказ звонка</h1>\n<div>В ближайшее время наши менеджеры свяжутся с Вами</div>  ', ''),
('adminMessages', 'a:3:{s:8:"incoming";s:0:"";s:8:"callback";s:27:"вфы вфыв фыв фы";s:5:"order";s:0:"";}', 'ru'),
('selectedProductCats', 'b:0;', ''),
('isAdult', NULL, ''),
('adminMessageIncoming', '<h1>Спасибо</h1>\n<div>В ближайшее время наши менеджеры свяжутся с Вами</div>  ', ''),
('adminMessageOrderPage', '<h1>Спасибо</h1>\n<div>В ближайшее время наши менеджеры свяжутся с Вами</div>  ', ''),
('mainModImageWidth', '640', ''),
('mainModImageHeight', '480', ''),
('smallModImageWidth', '90', ''),
('smallModImageHeight', '90', ''),
('order_method', '', ''),
('forgotPasswordMessageText', NULL, 'en'),
('ordersMessageText', NULL, 'en'),
('ordersSenderName', NULL, 'en'),
('ordersMessageTheme', NULL, 'en'),
('ordersManagerEmail', NULL, ''),
('ordersSendManagerMessage', NULL, ''),
('notifyOrderStatusMessageText', NULL, 'en'),
('notifyOrderStatusSenderName', NULL, 'en'),
('notifyOrderStatusMessageTheme', NULL, 'en'),
('wishListsMessageText', '', 'en'),
('wishListsSenderName', '', 'en'),
('wishListsMessageTheme', '', 'en'),
('notificationsMessageText', '', 'en'),
('notificationsSenderName', '', 'en'),
('notificationsMessageTheme', '', 'en'),
('callbacksMessageText', '', 'en'),
('callbacksSenderName', '', 'en'),
('callbacksMessageTheme', '', 'en'),
('userInfoMessageText', '', 'en'),
('userInfoSenderName', '', 'en'),
('userInfoMessageTheme', '', 'en'),
('MemcachedSettings', 'b:0;', ''),
('10_PB_MERCHANT_PASSWORD', '999999999999', ''),
('10_PB_API_URL', 'https://api.privatbank.ua/p24api/ishop', ''),
('adminMessageMonkey', '', ''),
('adminMessageMonkeylist', '', ''),
('MobileVersionSettings', 'b:0;', ''),
('10_PB_MERCHANT_ID', '99999', ''),
('facebook_int', 'a:3:{s:9:"secretkey";s:0:"";s:9:"appnumber";s:0:"";s:8:"template";s:10:"fullMarket";}', ''),
('vk_int', 'a:3:{s:7:"protkey";s:0:"";s:9:"appnumber";s:0:"";s:8:"template";s:10:"fullMarket";}', ''),
('xmlSiteMap', 'a:6:{s:18:"main_page_priority";b:0;s:13:"cats_priority";b:0;s:14:"pages_priority";b:0;s:20:"main_page_changefreq";b:0;s:21:"categories_changefreq";b:0;s:16:"pages_changefreq";b:0;}', ''),
('mobileTemplatePath', './templates/commerce_mobiles/shop/PIE', ''),
('ordersRecountGoods', '', ''),
('ordersuserInfoRegister', NULL, ''),
('notifyOrderStatusStatusEmail', NULL, ''),
('8_LMI_PAYEE_PURSE', '6456456456464', ''),
('8_LMI_SECRET_KEY', '456', ''),
('watermark_watermark_interest', '25', ''),
('9_OschadBankData', 'a:5:{s:8:"receiver";s:0:"";s:4:"code";s:10:"1234567890";s:7:"account";s:0:"";s:3:"mfo";s:0:"";s:8:"banknote";s:0:"";}', ''),
('ss', 'a:9:{s:4:"yaru";s:1:"1";s:5:"vkcom";s:1:"1";s:8:"facebook";s:1:"1";s:7:"twitter";s:1:"1";s:9:"odnoclass";s:1:"1";s:7:"myworld";s:1:"1";s:2:"lj";s:1:"1";s:4:"type";s:6:"button";s:8:"vk_apiid";s:0:"";}', ''),
('1CCatSettings', 'b:0;', ''),
('1CSettingsOS', 'b:0;', ''),
('usegifts', '0;', 'ru'),
('ordersCheckStocks', '', ''),
('imageSizesBlock', 'a:4:{s:5:"small";a:3:{s:4:"name";s:5:"small";s:5:"width";s:2:"62";s:6:"height";s:2:"62";}s:6:"medium";a:3:{s:4:"name";s:6:"medium";s:5:"width";s:3:"260";s:6:"height";s:3:"150";}s:4:"main";a:3:{s:4:"name";s:4:"main";s:5:"width";s:3:"452";s:6:"height";s:3:"288";}s:5:"large";a:3:{s:4:"name";s:5:"large";s:5:"width";s:4:"1000";s:6:"height";s:4:"1000";}}', ''),
('imagesMainSize', 'auto', ''),
('additionalImageWidth', '1000', ''),
('additionalImageHeight', '1000', ''),
('arrayFrontProductsPerPage', 'a:3:{i:0;s:2:"12";i:1;s:2:"24";i:2;s:2:"48";}', ''),
('thumbImageWidth', '62', ''),
('thumbImageHeight', '62', ''),
('watermark_delete_watermark_font_path', '0', ''),
('10_payment_method_webmoney', 'N;', ''),
('ordersMinimumPrice', '', ''),
('10_payment_method_liqpay', 'N;', ''),
('10_payment_method_2checkout', 'N;', ''),
('10_payment_method_robokassa', 'N;', ''),
('10_payment_method_oschadbank', 'N;', ''),
('10_payment_method_paypal', 'N;', ''),
('10_payment_method_sberbank', 'N;', ''),
('10_payment_method_yakassa', 'N;', ''),
('forgotPasswordMessageText', NULL, 'ua'),
('ordersMessageText', NULL, 'ua'),
('ordersSenderName', NULL, 'ua'),
('ordersMessageTheme', NULL, 'ua'),
('notifyOrderStatusMessageText', NULL, 'ua'),
('notifyOrderStatusSenderName', NULL, 'ua'),
('notifyOrderStatusMessageTheme', NULL, 'ua'),
('wishListsMessageText', '', 'ua'),
('wishListsSenderName', '', 'ua'),
('wishListsMessageTheme', '', 'ua'),
('notificationsMessageText', '', 'ua'),
('notificationsSenderName', '', 'ua'),
('notificationsMessageTheme', '', 'ua'),
('callbacksMessageText', '', 'ua'),
('callbacksSenderName', '', 'ua'),
('callbacksMessageTheme', '', 'ua'),
('userInfoMessageText', '', 'ua'),
('userInfoSenderName', '', 'ua'),
('userInfoMessageTheme', '', 'ua');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_sorting`
--

DROP TABLE IF EXISTS `shop_sorting`;
CREATE TABLE IF NOT EXISTS `shop_sorting` (
  `id` int(11) NOT NULL,
  `pos` int(11) DEFAULT NULL,
  `get` varchar(25) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `name_front` varchar(50) DEFAULT NULL,
  `tooltip` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_sorting`
--

INSERT INTO `shop_sorting` (`id`, `pos`, `get`, `active`, `name`, `name_front`, `tooltip`) VALUES
(1, 4, 'rating', 1, '', NULL, NULL),
(2, 1, 'price', 1, '', NULL, NULL),
(3, 2, 'price_desc', 1, '', NULL, NULL),
(4, 3, 'hit', 1, '', NULL, NULL),
(5, 5, 'hot', 1, '', NULL, NULL),
(6, 0, 'action', 1, '', NULL, NULL),
(7, 8, 'name', 1, '', NULL, NULL),
(8, 9, 'name_desc', 1, '', NULL, NULL),
(9, 6, 'views', 1, '', NULL, NULL),
(10, 7, 'topsales', 1, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `shop_sorting_i18n`
--

DROP TABLE IF EXISTS `shop_sorting_i18n`;
CREATE TABLE IF NOT EXISTS `shop_sorting_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(11) NOT NULL DEFAULT 'ru',
  `name` varchar(50) NOT NULL,
  `name_front` varchar(50) DEFAULT NULL,
  `tooltip` varchar(256) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_sorting_i18n`
--

INSERT INTO `shop_sorting_i18n` (`id`, `locale`, `name`, `name_front`, `tooltip`) VALUES
(1, 'en', 'Sort by Rating', 'Rating', ''),
(1, 'ru', 'По рейтингу', 'Рейтинг', ''),
(1, 'ua', 'По рейтингу', 'Рейтинг', ''),
(2, 'en', 'Sort by Price: Low to High', 'From cheap to expensive', ''),
(2, 'ru', 'От дешевых к дорогим', 'От дешевых к дорогим', ''),
(2, 'ua', 'Від дешевих до дорогих', 'Від дешевих до дорогих', ''),
(3, 'en', 'Sort by Price: High to Low', 'From expensive to cheap', ''),
(3, 'ru', 'От дорогих к дешевым', 'От дорогих к дешевым', ''),
(3, 'ua', 'Від дорогих до дешевих', 'Від дорогих до дешевих', ''),
(4, 'en', 'Sort by Popularity', 'Popular', ''),
(4, 'ru', 'Популярные', 'Популярные', ''),
(4, 'ua', 'Популярні', 'Популярні', ''),
(5, 'en', 'Newest first', 'Newest first', ''),
(5, 'ru', 'Новинки', 'Новинки', ''),
(5, 'ua', 'Новинки', 'Новинки', ''),
(6, 'en', 'Action', 'Action', ''),
(6, 'ru', 'Акции', 'Акции', ''),
(6, 'ua', 'Акції', 'Акції', ''),
(7, 'en', 'Sort by Name (A to Z)', 'Sort by Name (A to Z)', ''),
(7, 'ru', 'А-Я', 'По названию (А-Я)', ''),
(7, 'ua', 'А-Я', 'По назві (А-Я)', ''),
(8, 'en', 'Sort by Name (Z to A)', 'Sort by Name (Z to A)', ''),
(8, 'ru', 'Я-А', 'По названию (Я-А)', ''),
(8, 'ua', 'Я-А', 'По назві (Я-А)', ''),
(9, 'en', 'Views', 'Views', ''),
(9, 'ru', 'Просмотров', 'По количеству просмотров', ''),
(9, 'ua', 'Перегляди', 'По кількості переглядів', ''),
(10, 'en', 'Sales first', 'Top sales', ''),
(10, 'ru', 'Топ продаж', 'Топ продаж', ''),
(10, 'ua', 'Топ продажі', 'Топ продажі', '');

-- --------------------------------------------------------

--
-- Структура таблицы `shop_spy`
--

DROP TABLE IF EXISTS `shop_spy`;
CREATE TABLE IF NOT EXISTS `shop_spy` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `key` varchar(500) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `old_price` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `shop_spy`
--

INSERT INTO `shop_spy` (`id`, `user_id`, `product_id`, `price`, `variant_id`, `key`, `email`, `old_price`) VALUES
(3, 69, 102, 550, 113, 'IPrMlWydoeP9Cmex30upNOUsdTa4bIrg', NULL, 549);

-- --------------------------------------------------------

--
-- Структура таблицы `smart_filter_semantic_urls`
--

DROP TABLE IF EXISTS `smart_filter_semantic_urls`;
CREATE TABLE IF NOT EXISTS `smart_filter_semantic_urls` (
  `id` int(11) NOT NULL,
  `locale` varchar(5) NOT NULL,
  `type` varchar(10) NOT NULL,
  `category_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `active` int(1) DEFAULT '0',
  `h1` text,
  `meta_title` text,
  `meta_description` text,
  `meta_keywords` text,
  `seo_text` text,
  `custom_url_pattern` varchar(255) DEFAULT NULL,
  `created` int(11) NOT NULL,
  `updated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `template_settings`
--

DROP TABLE IF EXISTS `template_settings`;
CREATE TABLE IF NOT EXISTS `template_settings` (
  `id` int(11) NOT NULL,
  `component` varchar(255) NOT NULL,
  `key` text,
  `data` text
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `template_settings`
--

INSERT INTO `template_settings` (`id`, `component`, `key`, `data`) VALUES
(1, 'TColorScheme', 'color_scheme', 'default'),
(2, 'TMenuColumn', 'columns', 'a:3:{i:3018;s:1:"0";i:3024;s:1:"0";i:3025;s:1:"0";}'),
(3, 'TMenuColumn', 'openLevels', 's:1:"2";'),
(4, 'TProperties', 'properties', 'a:2:{i:0;a:2:{s:11:"property_id";i:369;s:6:"values";s:8:"dropDown";}i:1;a:2:{s:11:"property_id";i:383;s:6:"values";s:6:"scroll";}}');

-- --------------------------------------------------------

--
-- Структура таблицы `trash`
--

DROP TABLE IF EXISTS `trash`;
CREATE TABLE IF NOT EXISTS `trash` (
  `id` int(11) NOT NULL,
  `trash_id` varchar(255) DEFAULT NULL,
  `trash_url` varchar(255) DEFAULT NULL,
  `trash_redirect_type` varchar(20) DEFAULT NULL,
  `trash_redirect` varchar(255) DEFAULT NULL,
  `trash_type` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `banned` tinyint(1) DEFAULT NULL,
  `ban_reason` varchar(255) DEFAULT NULL,
  `newpass` varchar(255) DEFAULT NULL,
  `newpass_key` varchar(255) DEFAULT NULL,
  `newpass_time` int(11) DEFAULT NULL,
  `last_ip` varchar(40) DEFAULT NULL,
  `last_login` int(11) DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cart_data` text,
  `wish_list_data` text,
  `key` varchar(255) NOT NULL,
  `amout` float(10,2) NOT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `role_id`, `username`, `password`, `email`, `banned`, `ban_reason`, `newpass`, `newpass_key`, `newpass_time`, `last_ip`, `last_login`, `created`, `modified`, `address`, `cart_data`, `wish_list_data`, `key`, `amout`, `discount`, `phone`) VALUES
(52, 1, 'admin', '$1$yuqU7T1X$VEPoIXqoBkyCIUHVKPjj11', 'ad@min.com', NULL, NULL, NULL, NULL, NULL, '127.0.0.1', 2016, 1429866577, NULL, '', 'a:1:{s:21:"SProducts_17241_17958";a:9:{s:8:"instance";s:9:"SProducts";s:2:"id";s:5:"17958";s:8:"quantity";i:3;s:5:"price";s:7:"1220.00";s:11:"originPrice";s:7:"1220.00";s:12:"overallPrice";d:3660;s:9:"variantId";s:5:"17958";s:9:"productId";i:17241;s:11:"variantName";s:22:"Серебристый";}}', NULL, '3Y47W', 0.00, NULL, '');

-- --------------------------------------------------------

--
-- Структура таблицы `user_autologin`
--

DROP TABLE IF EXISTS `user_autologin`;
CREATE TABLE IF NOT EXISTS `user_autologin` (
  `key_id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_id` mediumint(8) NOT NULL DEFAULT '0',
  `user_agent` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_ip` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user_autologin`
--

INSERT INTO `user_autologin` (`key_id`, `user_id`, `user_agent`, `last_ip`, `last_login`) VALUES
('dfae9a6365a37ae5931c9a17f1ef00ff', 57, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36', '127.0.0.1', '2015-10-22 10:54:22'),
('8b4098208ced98ea2d536796e9ad722a', 55, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '127.0.0.1', '2015-09-15 10:36:08'),
('16daf93e47caee8a4bc2339481e5dde7', 60, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36', '127.0.0.1', '2015-10-23 13:35:50'),
('af3bf4f0b1d0a0c05de578a9791fddd4', 52, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:44.0) Gecko/20100101 Firefox/44.0', '178.136.237.181', '2016-02-22 14:46:10');

-- --------------------------------------------------------

--
-- Структура таблицы `user_temp`
--

DROP TABLE IF EXISTS `user_temp`;
CREATE TABLE IF NOT EXISTS `user_temp` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(34) NOT NULL,
  `email` varchar(100) NOT NULL,
  `activation_key` varchar(50) NOT NULL,
  `last_ip` varchar(40) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `widgets`
--

DROP TABLE IF EXISTS `widgets`;
CREATE TABLE IF NOT EXISTS `widgets` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(15) NOT NULL,
  `data` text NOT NULL,
  `method` varchar(50) NOT NULL,
  `settings` text NOT NULL,
  `description` varchar(300) NOT NULL,
  `roles` text NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `widgets`
--

INSERT INTO `widgets` (`id`, `name`, `type`, `data`, `method`, `settings`, `description`, `roles`, `created`) VALUES
(43, 'start_page_seo_text', 'html', '', '', '', '', '', 1454166912),
(44, 'popular_products_category', 'module', 'shop', 'products', 'a:4:{s:12:"productsType";s:20:"popular,hit,category";s:5:"title";s:16:"Popular products";s:13:"productsCount";s:1:"5";s:7:"subpath";s:7:"widgets";}', 'Популярные товары в категории', '', 1455043235),
(34, 'latest_news', 'module', 'core', 'recent_news', 'a:4:{s:10:"news_count";s:1:"2";s:11:"max_symdols";s:3:"100";s:10:"categories";a:4:{i:0;s:2:"64";i:1;s:2:"67";i:2;s:2:"74";i:3;s:2:"69";}s:7:"display";s:6:"recent";}', '', '', 1441027380),
(35, 'brands', 'module', 'shop', 'brands', 'a:4:{s:10:"withImages";b:0;s:11:"brandsCount";s:1:"8";s:7:"subpath";s:7:"widgets";s:5:"title";s:0:"";}', '', '', 1441037279),
(36, 'breadcrumbs', 'module', 'navigation', 'widget_navigation', '', '', '', 1441122040),
(37, 'features', 'module', 'core', 'recent_news', 'a:4:{s:10:"news_count";s:1:"4";s:11:"max_symdols";s:3:"200";s:10:"categories";a:1:{i:0;s:2:"75";}s:7:"display";s:6:"recent";}', '', '', 1441626185),
(38, 'products_viewed', 'module', 'shop', 'view_product', 'a:4:{s:12:"productsType";b:0;s:5:"title";s:0:"";s:13:"productsCount";s:1:"5";s:7:"subpath";s:7:"widgets";}', '', '', 1441628577),
(39, 'products_hits', 'module', 'shop', 'products', 'a:4:{s:12:"productsType";s:23:"popular,action,oldPrice";s:5:"title";s:0:"";s:13:"productsCount";s:2:"12";s:7:"subpath";s:7:"widgets";}', '', '', 1441628809),
(41, 'products_similar_sidebar', 'module', 'shop', 'similar_products', 'a:3:{s:5:"title";s:16:"Similar products";s:13:"productsCount";i:5;s:7:"subpath";s:7:"widgets";}', '', '', 1443604940),
(42, 'mobile_langs', 'module', 'language_switch', 'language_switch_show', '', '', '', 1452013140),
(32, 'languages', 'module', 'language_switch', 'language_switch_show', '', '', '', 1439289386),
(45, 'special_products', 'module', 'shop', 'products', 'a:4:{s:12:"productsType";s:12:"date,hot,hit";s:5:"title";s:16:"Popular products";s:13:"productsCount";s:2:"12";s:7:"subpath";s:7:"widgets";}', '', '', 1463149911);

-- --------------------------------------------------------

--
-- Структура таблицы `widget_i18n`
--

DROP TABLE IF EXISTS `widget_i18n`;
CREATE TABLE IF NOT EXISTS `widget_i18n` (
  `id` int(11) NOT NULL,
  `locale` varchar(11) NOT NULL,
  `title` varchar(500) DEFAULT NULL,
  `data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `widget_i18n`
--

INSERT INTO `widget_i18n` (`id`, `locale`, `title`, `data`) VALUES
(13, 'ru', 'Бренды', ''),
(16, 'ru', NULL, '<div class="benefits-title"><span class="title">Почему выбирают нас</span></div>\n<div class="container">\n<ul class="items items-benefits">\n<li>\n<div class="frame-icon-benefit"><span class="helper">&nbsp;</span> <span class="icon-benefits_1">&nbsp;</span></div>\n<div class="frame-description-benefit f-s_0"><span class="helper">&nbsp;</span>\n<div>\n<div class="title">Бесплатная доставка от 2000 р</div>\n</div>\n</div>\n</li>\n<li>\n<div class="frame-icon-benefit"><span class="helper">&nbsp;</span> <span class="icon-benefits_2">&nbsp;</span></div>\n<div class="frame-description-benefit f-s_0"><span class="helper">&nbsp;</span>\n<div>\n<div class="title">Гибкая система скидок</div>\n</div>\n</div>\n</li>\n<li>\n<div class="frame-icon-benefit"><span class="helper">&nbsp;</span> <span class="icon-benefits_3">&nbsp;</span></div>\n<div class="frame-description-benefit f-s_0"><span class="helper">&nbsp;</span>\n<div>\n<div class="title">Индивидуальный подход</div>\n</div>\n</div>\n</li>\n</ul>\n</div>'),
(17, 'ru', 'Доставка оплата на товаре', '<div class="frame-delivery-payment">\n<dl>\n<dt class="title f-s_0"><span class="icon_delivery">&nbsp;</span><span class="text-el">Доставка</span></dt>\n<dd class="frame-list-delivery">\n<ul>\n<li>Новая Почта</li>\n<li>Другие транспортные службы</li>\n<li>Курьером по Киеву</li>\n<li>Самовывоз</li>\n</ul>\n</dd>\n<dt class="title f-s_0"><span class="icon_payment">&nbsp;</span><span class="text-el">Оплата</span></dt>\n<dd class="frame-list-payment">\n<ul>\n<li>Наличными при получении</li>\n<li>Безналичный перевод</li>\n<li>Приват 24</li>\n<li>WebMoney</li>\n</ul>\n</dd>\n</dl>\n</div>'),
(20, 'ru', NULL, '<h1>Интернет-магазин</h1>\n<p>Интернет-магазин &mdash; сайт, торгующий товарами в интернете. Позволяет пользователям сформировать заказ на покупку, выбрать способ оплаты и доставки заказа в сети Интернет.</p>\n<p>Выбрав необходимые товары или услуги, пользователь обычно имеет возможность тут же на сайте выбрать метод оплаты и доставки.</p>'),
(29, 'ru', NULL, '<p><span class="c_b">Работаем:</span> <span class="s-t">Пн&ndash;Пт 09:00&ndash;20:00,<br />Сб 09:00&ndash;17:00, Вс выходной</span></p>'),
(30, 'ru', 'График', '<p>Пн&ndash;Сб 09:00&ndash;20:00,<br /> Вс 09:00&ndash;17:00</p>'),
(31, 'ru', 'Seo', '<h1>Универсальный интернет-магазин</h1>\n<p>Все больше и больше людей пользуются интернет магазинами. Поэтому если Вы или Ваша компания реализуете товар или предлагаете услуги, свое сотрудничество с клиентами Вы можете организовать продажи через интернет магазин. Интернет-магазин &ndash; это интерактивный сайт с каталогом, в котором представляются товары и услуги, а также корзиной для формирования заказа. В правильном интернет-магазине обязательно должны присутствовать: рекламируемые товары и услуги, контактная информация, предложения различных вариантов оплаты, предоставление счета. Работа интернет-магазина похожа на работу простого магазина. Посетитель интернет магазина просматривает перечень предлагаемых ему товаров или услуг, выбирает подходящую позицию и добавляет выбранный товар в свою покупательскую корзину. Далее таким же образом посетитель может выбрать еще несколько предлагаемых позиций &mdash; столько, сколько нужно. Когда все необходимые товары выбраны, можно приступать к оформлению заказа на покупку. При этом необходим минимум личной информации о покупателе, что способствует повышению безопасности покупок. Главный раздел интернет магазина это каталог товаров и услуг. Навигация по этому каталогу может быть различной в зависимости от ассортимента предлагаемых товаров и услуг.</p>'),
(32, 'ru', 'Выбор языка', ''),
(33, 'ru', 'Gallery', ''),
(34, 'ru', 'Новости', ''),
(35, 'ru', 'Лучшие производители', ''),
(36, 'ru', 'Хлебные крошки', ''),
(37, 'ru', 'Преимущества', ''),
(38, 'ru', 'Просмотренные товары', ''),
(39, 'ru', 'Спецпредложения', ''),
(40, 'ru', 'Похожие товары', ''),
(41, 'ru', 'Похожие товары', ''),
(42, 'ru', 'Выбор языка на мобильной панели', ''),
(43, 'ru', 'SEO-текст на главной странице', '<h1>Интернет-магазин</h1>\n<p>Интернет-магазин &mdash; сайт, торгующий товарами в интернете. Позволяет пользователям сформировать заказ на покупку, выбрать способ оплаты и доставки заказа в сети Интернет. Выбрав необходимые товары или услуги, пользователь обычно имеет возможность тут же на сайте выбрать метод оплаты и доставки.</p>\n<p>Своим рождением первые системы и методы электронной коммерции обязаны появлению технологий автоматизации продаж и внедрению автоматизированных систем управления корпоративными ресурсами. В 1960 году американские компании American Airlines и IBM приступают к созданию системы автоматизации процедуры резервирования мест на авиарейсы. Таким образом, система SABRE (Semi-Automatic Business Research Environment) делает воздушные перелёты более доступными для рядовых пассажиров, помогая им ориентироваться в тарифах и рейсах, число которых постоянно растет. За счёт автоматизации процесса расчёта тарифов при резервировании мест снижается стоимость услуг. Это являет собой самый первый опыт создания системы электронной коммерции.</p>\n<p>Наиболее динамично рынок электронной коммерции развивается в течение последних 20 лет, что обусловлено стремительным ростом количества интернет-пользователей, увеличением влияния социальных сетей и других интерактивных онлайн-платформ, динамичным развитием систем электронных платежей и переходом ведущих игроков рынка к новым технологическим платформам для электронной коммерции (от Web 1.0 к Web 2.0, далее к Web 3.0).</p>'),
(44, 'ru', 'Популярные товары', ''),
(45, 'ru', 'Хиты и новинки', '');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `answer_notifications`
--
ALTER TABLE `answer_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `banners_i18n`
--
ALTER TABLE `banners_i18n`
  ADD PRIMARY KEY (`id`,`locale`);

--
-- Индексы таблицы `banner_image`
--
ALTER TABLE `banner_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `banner_image_fi_0bb916` (`banner_id`);

--
-- Индексы таблицы `banner_image_i18n`
--
ALTER TABLE `banner_image_i18n`
  ADD PRIMARY KEY (`id`,`locale`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `url` (`url`);

--
-- Индексы таблицы `category_translate`
--
ALTER TABLE `category_translate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`,`lang`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module` (`module`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `date` (`date`);

--
-- Индексы таблицы `components`
--
ALTER TABLE `components`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `identif` (`identif`),
  ADD KEY `enabled` (`enabled`),
  ADD KEY `autoload` (`autoload`);

--
-- Индексы таблицы `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `url` (`url`(333)),
  ADD KEY `lang` (`lang`),
  ADD KEY `post_status` (`post_status`(4)),
  ADD KEY `cat_url` (`cat_url`),
  ADD KEY `publish_date` (`publish_date`),
  ADD KEY `category` (`category`),
  ADD KEY `created` (`created`),
  ADD KEY `updated` (`updated`);

--
-- Индексы таблицы `content_fields`
--
ALTER TABLE `content_fields`
  ADD PRIMARY KEY (`field_name`),
  ADD UNIQUE KEY `field_name` (`field_name`),
  ADD KEY `type` (`type`),
  ADD KEY `in_search` (`in_search`);

--
-- Индексы таблицы `content_fields_data`
--
ALTER TABLE `content_fields_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `item_type` (`item_type`),
  ADD KEY `field_name` (`field_name`);

--
-- Индексы таблицы `content_field_groups`
--
ALTER TABLE `content_field_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `content_permissions`
--
ALTER TABLE `content_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_id` (`page_id`);

--
-- Индексы таблицы `content_tags`
--
ALTER TABLE `content_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_id` (`page_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Индексы таблицы `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `custom_fields_data`
--
ALTER TABLE `custom_fields_data`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `custom_fields_i18n`
--
ALTER TABLE `custom_fields_i18n`
  ADD PRIMARY KEY (`id`,`locale`);


--
-- Индексы таблицы `gallery_albums_i18n`
--
ALTER TABLE `gallery_albums_i18n`
  ADD PRIMARY KEY (`id`,`locale`);

--
-- Индексы таблицы `gallery_category`
--

--
-- Индексы таблицы `gallery_category_i18n`
--
ALTER TABLE `gallery_category_i18n`
  ADD PRIMARY KEY (`id`,`locale`);

--
-- Индексы таблицы `gallery_images`
--
ALTER TABLE `gallery_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `album_id` (`album_id`),
  ADD KEY `position` (`position`);

--
-- Индексы таблицы `gallery_images_i18n`
--
ALTER TABLE `gallery_images_i18n`
  ADD PRIMARY KEY (`id`,`locale`);

--
-- Индексы таблицы `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identif` (`identif`),
  ADD KEY `default` (`default`);

--
-- Индексы таблицы `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ip_address` (`ip_address`),
  ADD KEY `time` (`time`);

--
-- Индексы таблицы `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date` (`date`);

--
-- Индексы таблицы `mail`
--
ALTER TABLE `mail`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `menus_data`
--
ALTER TABLE `menus_data`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mod_banner`
--
ALTER TABLE `mod_banner`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mod_banner_groups`
--
ALTER TABLE `mod_banner_groups`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mod_banner_i18n`
--
ALTER TABLE `mod_banner_i18n`
  ADD KEY `id` (`id`,`locale`);

--
-- Индексы таблицы `mod_discount_all_order`
--
ALTER TABLE `mod_discount_all_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discount_id` (`discount_id`);

--
-- Индексы таблицы `mod_discount_brand`
--
ALTER TABLE `mod_discount_brand`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discount_id` (`discount_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Индексы таблицы `mod_discount_category`
--
ALTER TABLE `mod_discount_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discount_id` (`discount_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `mod_discount_comulativ`
--
ALTER TABLE `mod_discount_comulativ`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discount_id` (`discount_id`);

--
-- Индексы таблицы `mod_discount_group_user`
--
ALTER TABLE `mod_discount_group_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discount_id` (`discount_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Индексы таблицы `mod_discount_product`
--
ALTER TABLE `mod_discount_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discount_id` (`discount_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `mod_discount_user`
--
ALTER TABLE `mod_discount_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discount_id` (`discount_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `mod_email_paterns`
--
ALTER TABLE `mod_email_paterns`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mod_email_paterns_i18n`
--
ALTER TABLE `mod_email_paterns_i18n`
  ADD PRIMARY KEY (`id`,`locale`);


--
-- Индексы таблицы `mod_sample_settings`
--
ALTER TABLE `mod_sample_settings`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mod_seo`
--
ALTER TABLE `mod_seo`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mod_seo_inflect`
--
ALTER TABLE `mod_seo_inflect`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mod_seo_products`
--
ALTER TABLE `mod_seo_products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mod_shop_discounts`
--
ALTER TABLE `mod_shop_discounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key_UNIQUE` (`key`);

--
-- Индексы таблицы `mod_shop_discounts_i18n`
--
ALTER TABLE `mod_shop_discounts_i18n`
  ADD PRIMARY KEY (`id`,`locale`);

--
-- Индексы таблицы `mod_sitemap_blocked_urls`
--
ALTER TABLE `mod_sitemap_blocked_urls`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mod_sitemap_changefreq`
--
ALTER TABLE `mod_sitemap_changefreq`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mod_sitemap_priorities`
--
ALTER TABLE `mod_sitemap_priorities`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mod_stats_attendance`
--
ALTER TABLE `mod_stats_attendance`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mod_stats_attendance_robots`
--
ALTER TABLE `mod_stats_attendance_robots`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mod_wish_list`
--
ALTER TABLE `mod_wish_list`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mod_wish_list_products`
--
ALTER TABLE `mod_wish_list_products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mod_wish_list_users`
--
ALTER TABLE `mod_wish_list_users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mod_ymarket`
--
ALTER TABLE `mod_ymarket`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `search`
--
ALTER TABLE `search`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hash` (`hash`),
  ADD KEY `datetime` (`datetime`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `s_name` (`s_name`);

--
-- Индексы таблицы `settings_i18n`
--
ALTER TABLE `settings_i18n`
  ADD PRIMARY KEY (`id`);


--
-- Индексы таблицы `shop_brands`
--
ALTER TABLE `shop_brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_brands_I_2` (`url`),
  ADD KEY `shop_brands_I_1` (`url`);

--
-- Индексы таблицы `shop_brands_i18n`
--
ALTER TABLE `shop_brands_i18n`
  ADD PRIMARY KEY (`id`,`locale`),
  ADD KEY `shop_brands_i18n_I_1` (`name`(333));

--
-- Индексы таблицы `shop_callbacks`
--
ALTER TABLE `shop_callbacks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_callbacks_I_1` (`user_id`),
  ADD KEY `shop_callbacks_I_2` (`status_id`),
  ADD KEY `shop_callbacks_I_3` (`theme_id`),
  ADD KEY `shop_callbacks_I_4` (`date`);

--
-- Индексы таблицы `shop_callbacks_statuses`
--
ALTER TABLE `shop_callbacks_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_callbacks_statuses_i18n`
--
ALTER TABLE `shop_callbacks_statuses_i18n`
  ADD PRIMARY KEY (`id`,`locale`),
  ADD KEY `shop_callbacks_statuses_i18n_I_1` (`text`);

--
-- Индексы таблицы `shop_callbacks_themes`
--
ALTER TABLE `shop_callbacks_themes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_callbacks_themes_i18n`
--
ALTER TABLE `shop_callbacks_themes_i18n`
  ADD PRIMARY KEY (`id`,`locale`),
  ADD KEY `shop_callbacks_themes_i18n_I_1` (`text`);

--
-- Индексы таблицы `shop_category`
--
ALTER TABLE `shop_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_category_I_2` (`url`),
  ADD KEY `shop_category_I_3` (`active`),
  ADD KEY `shop_category_I_4` (`parent_id`),
  ADD KEY `shop_category_I_5` (`position`),
  ADD KEY `shop_category_I_1` (`url`);

--
-- Индексы таблицы `shop_category_i18n`
--
ALTER TABLE `shop_category_i18n`
  ADD PRIMARY KEY (`id`,`locale`),
  ADD KEY `shop_category_i18n_I_1` (`name`);

--
-- Индексы таблицы `shop_comulativ_discount`
--
ALTER TABLE `shop_comulativ_discount`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_currencies`
--
ALTER TABLE `shop_currencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_currencies_I_1` (`name`),
  ADD KEY `shop_currencies_I_2` (`main`),
  ADD KEY `shop_currencies_I_3` (`is_default`);

--
-- Индексы таблицы `shop_delivery_methods`
--
ALTER TABLE `shop_delivery_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_delivery_methods_I_2` (`enabled`),
  ADD KEY `shop_delivery_methods_I_1` (`enabled`);

--
-- Индексы таблицы `shop_delivery_methods_i18n`
--
ALTER TABLE `shop_delivery_methods_i18n`
  ADD PRIMARY KEY (`id`,`locale`),
  ADD KEY `shop_delivery_methods_i18n_I_1` (`name`(333));

--
-- Индексы таблицы `shop_delivery_methods_systems`
--
ALTER TABLE `shop_delivery_methods_systems`
  ADD PRIMARY KEY (`delivery_method_id`,`payment_method_id`),
  ADD KEY `shop_delivery_methods_systems_FI_2` (`payment_method_id`);

--
-- Индексы таблицы `shop_discounts`
--
ALTER TABLE `shop_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_gifts`
--
ALTER TABLE `shop_gifts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_kit`
--
ALTER TABLE `shop_kit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_kit_FI_1` (`product_id`);

--
-- Индексы таблицы `shop_kit_product`
--
ALTER TABLE `shop_kit_product`
  ADD PRIMARY KEY (`product_id`,`kit_id`),
  ADD KEY `shop_kit_product_FI_2` (`kit_id`);

--
-- Индексы таблицы `shop_notifications`
--
ALTER TABLE `shop_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_notifications_I_1` (`user_email`),
  ADD KEY `shop_notifications_I_2` (`user_phone`),
  ADD KEY `shop_notifications_I_3` (`status`),
  ADD KEY `shop_notifications_I_4` (`date_created`),
  ADD KEY `shop_notifications_I_5` (`active_to`),
  ADD KEY `shop_notifications_FI_1` (`product_id`),
  ADD KEY `shop_notifications_FI_2` (`variant_id`);

--
-- Индексы таблицы `shop_notification_statuses`
--
ALTER TABLE `shop_notification_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_notification_statuses_I_2` (`position`),
  ADD KEY `shop_notification_statuses_I_1` (`position`);

--
-- Индексы таблицы `shop_notification_statuses_i18n`
--
ALTER TABLE `shop_notification_statuses_i18n`
  ADD PRIMARY KEY (`id`,`locale`),
  ADD KEY `shop_notification_statuses_i18n_I_1` (`name`(333));

--
-- Индексы таблицы `shop_orders`
--
ALTER TABLE `shop_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_orders_I_1` (`order_key`),
  ADD KEY `shop_orders_I_2` (`status`),
  ADD KEY `shop_orders_I_3` (`date_created`),
  ADD KEY `shop_orders_FI_1` (`delivery_method`),
  ADD KEY `shop_orders_FI_2` (`payment_method`);

--
-- Индексы таблицы `shop_orders_products`
--
ALTER TABLE `shop_orders_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_orders_products_I_1` (`order_id`),
  ADD KEY `shop_orders_products_FI_1` (`product_id`),
  ADD KEY `shop_orders_products_FI_2` (`variant_id`);

--
-- Индексы таблицы `shop_orders_status_history`
--
ALTER TABLE `shop_orders_status_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_orders_status_history_I_1` (`order_id`),
  ADD KEY `shop_orders_status_history_FI_2` (`status_id`);

--
-- Индексы таблицы `shop_order_statuses`
--
ALTER TABLE `shop_order_statuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_order_statuses_I_2` (`position`),
  ADD KEY `shop_order_statuses_I_1` (`position`);

--
-- Индексы таблицы `shop_order_statuses_i18n`
--
ALTER TABLE `shop_order_statuses_i18n`
  ADD PRIMARY KEY (`id`,`locale`),
  ADD KEY `shop_order_statuses_i18n_I_1` (`name`(333));

--
-- Индексы таблицы `shop_payment_methods`
--
ALTER TABLE `shop_payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_payment_methods_I_2` (`position`),
  ADD KEY `shop_payment_methods_FI_1` (`currency_id`),
  ADD KEY `shop_payment_methods_I_1` (`position`);

--
-- Индексы таблицы `shop_payment_methods_i18n`
--
ALTER TABLE `shop_payment_methods_i18n`
  ADD PRIMARY KEY (`id`,`locale`),
  ADD KEY `shop_payment_methods_i18n_I_1` (`name`);

--
-- Индексы таблицы `shop_products`
--
ALTER TABLE `shop_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_products_I_2` (`url`),
  ADD KEY `shop_products_I_3` (`brand_id`),
  ADD KEY `shop_products_I_4` (`category_id`),
  ADD KEY `shop_products_I_1` (`url`);

--
-- Индексы таблицы `shop_products_i18n`
--
ALTER TABLE `shop_products_i18n`
  ADD PRIMARY KEY (`id`,`locale`),
  ADD KEY `shop_products_i18n_I_1` (`name`(333));

--
-- Индексы таблицы `shop_products_rating`
--
ALTER TABLE `shop_products_rating`
  ADD PRIMARY KEY (`product_id`);

--
-- Индексы таблицы `shop_products_words`
--
ALTER TABLE `shop_products_words`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_word` (`name`),
  ADD KEY `local` (`local`),
  ADD FULLTEXT KEY `name` (`name`);

--
-- Индексы таблицы `shop_product_categories`
--
ALTER TABLE `shop_product_categories`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `shop_product_categories_FI_2` (`category_id`);

--
-- Индексы таблицы `shop_product_images`
--
ALTER TABLE `shop_product_images`
  ADD KEY `shop_product_images_I_1` (`position`),
  ADD KEY `shop_product_images_FK_1` (`product_id`);

--
-- Индексы таблицы `shop_product_properties`
--
ALTER TABLE `shop_product_properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_product_properties_I_2` (`active`),
  ADD KEY `shop_product_properties_I_3` (`show_on_site`),
  ADD KEY `shop_product_properties_I_4` (`show_in_compare`),
  ADD KEY `shop_product_properties_I_5` (`position`),
  ADD KEY `shop_product_properties_I_1` (`active`);

--
-- Индексы таблицы `shop_product_properties_categories`
--
ALTER TABLE `shop_product_properties_categories`
  ADD PRIMARY KEY (`property_id`,`category_id`),
  ADD KEY `shop_product_properties_categories_FI_2` (`category_id`);

--
-- Индексы таблицы `shop_product_properties_data`
--
ALTER TABLE `shop_product_properties_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_product_properties_data_I_1` (`value`(333)),
  ADD KEY `shop_product_properties_data_FI_2` (`product_id`),
  ADD KEY `shop_product_properties_data_FI_1` (`property_id`);

--
-- Индексы таблицы `shop_product_properties_data_i18n`
--
ALTER TABLE `shop_product_properties_data_i18n`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_product_properties_data_i18n_I_1` (`value`);

--
-- Индексы таблицы `shop_product_properties_i18n`
--
ALTER TABLE `shop_product_properties_i18n`
  ADD PRIMARY KEY (`id`,`locale`),
  ADD KEY `shop_product_properties_i18n_I_2` (`name`),
  ADD KEY `shop_product_properties_i18n_I_1` (`name`);

--
-- Индексы таблицы `shop_product_variants`
--
ALTER TABLE `shop_product_variants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_product_variants_I_1` (`product_id`),
  ADD KEY `shop_product_variants_I_2` (`position`),
  ADD KEY `shop_product_variants_I_3` (`number`),
  ADD KEY `shop_product_variants_I_5` (`price`),
  ADD KEY `shop_product_variants_I_4` (`price`),
  ADD KEY `shop_product_variants_FI_2` (`currency`);

--
-- Индексы таблицы `shop_product_variants_i18n`
--
ALTER TABLE `shop_product_variants_i18n`
  ADD PRIMARY KEY (`id`,`locale`),
  ADD KEY `shop_product_variants_i18n_I_1` (`name`(333));

--
-- Индексы таблицы `shop_rbac_group`
--
ALTER TABLE `shop_rbac_group`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_rbac_group_i18n`
--
ALTER TABLE `shop_rbac_group_i18n`
  ADD KEY `id_idx` (`id`);

--
-- Индексы таблицы `shop_rbac_privileges`
--
ALTER TABLE `shop_rbac_privileges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shop_rbac_privileges_I_1` (`name`),
  ADD KEY `shop_rbac_privileges_FI_1` (`group_id`);

--
-- Индексы таблицы `shop_rbac_privileges_i18n`
--
ALTER TABLE `shop_rbac_privileges_i18n`
  ADD KEY `id_idx` (`id`);

--
-- Индексы таблицы `shop_rbac_roles`
--
ALTER TABLE `shop_rbac_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_name` (`name`);

--
-- Индексы таблицы `shop_rbac_roles_i18n`
--
ALTER TABLE `shop_rbac_roles_i18n`
  ADD KEY `role_id_idx` (`id`);

--
-- Индексы таблицы `shop_rbac_roles_privileges`
--
ALTER TABLE `shop_rbac_roles_privileges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rolepriv` (`role_id`,`privilege_id`),
  ADD KEY `shop_rbac_roles_privileges_FK_2` (`privilege_id`);

--
-- Индексы таблицы `shop_settings`
--
ALTER TABLE `shop_settings`
  ADD PRIMARY KEY (`name`,`locale`);

--
-- Индексы таблицы `shop_sorting`
--
ALTER TABLE `shop_sorting`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `shop_sorting_i18n`
--
ALTER TABLE `shop_sorting_i18n`
  ADD PRIMARY KEY (`id`,`locale`);

--
-- Индексы таблицы `shop_spy`
--
ALTER TABLE `shop_spy`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `smart_filter_semantic_urls`
--
ALTER TABLE `smart_filter_semantic_urls`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `value` (`value`);

--
-- Индексы таблицы `template_settings`
--
ALTER TABLE `template_settings`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `trash`
--
ALTER TABLE `trash`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_I_1` (`key`);

--
-- Индексы таблицы `user_autologin`
--
ALTER TABLE `user_autologin`
  ADD PRIMARY KEY (`key_id`,`user_id`),
  ADD KEY `last_ip` (`last_ip`);

--
-- Индексы таблицы `user_temp`
--
ALTER TABLE `user_temp`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `widget_i18n`
--
ALTER TABLE `widget_i18n`
  ADD PRIMARY KEY (`id`,`locale`),
  ADD KEY `locale` (`locale`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `answer_notifications`
--
ALTER TABLE `answer_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблицы `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT для таблицы `banner_image`
--
ALTER TABLE `banner_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT для таблицы `category_translate`
--
ALTER TABLE `category_translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=128;
--
-- AUTO_INCREMENT для таблицы `components`
--
ALTER TABLE `components`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=396;
--
-- AUTO_INCREMENT для таблицы `content`
--
ALTER TABLE `content`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=160;
--
-- AUTO_INCREMENT для таблицы `content_fields_data`
--
ALTER TABLE `content_fields_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=134;
--
-- AUTO_INCREMENT для таблицы `content_field_groups`
--
ALTER TABLE `content_field_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT для таблицы `content_permissions`
--
ALTER TABLE `content_permissions`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `content_tags`
--
ALTER TABLE `content_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=373;
--
-- AUTO_INCREMENT для таблицы `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=125;
--
-- AUTO_INCREMENT для таблицы `custom_fields_data`
--
ALTER TABLE `custom_fields_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=619;
--
-- AUTO_INCREMENT для таблицы `gallery_albums`
--
ALTER TABLE `gallery_albums`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `gallery_category`
--
ALTER TABLE `gallery_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `gallery_images`
--
ALTER TABLE `gallery_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=171;
--
-- AUTO_INCREMENT для таблицы `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT для таблицы `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=145;
--
-- AUTO_INCREMENT для таблицы `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2932;
--
-- AUTO_INCREMENT для таблицы `mail`
--
ALTER TABLE `mail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT для таблицы `menus_data`
--
ALTER TABLE `menus_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=89;
--
-- AUTO_INCREMENT для таблицы `mod_banner`
--
ALTER TABLE `mod_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `mod_banner_groups`
--
ALTER TABLE `mod_banner_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `mod_discount_all_order`
--
ALTER TABLE `mod_discount_all_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `mod_discount_brand`
--
ALTER TABLE `mod_discount_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `mod_discount_category`
--
ALTER TABLE `mod_discount_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `mod_discount_comulativ`
--
ALTER TABLE `mod_discount_comulativ`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT для таблицы `mod_discount_group_user`
--
ALTER TABLE `mod_discount_group_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `mod_discount_product`
--
ALTER TABLE `mod_discount_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `mod_discount_user`
--
ALTER TABLE `mod_discount_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `mod_email_paterns`
--
ALTER TABLE `mod_email_paterns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблицы `mod_new_level_product_properties_types`
--
ALTER TABLE `mod_new_level_product_properties_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `mod_sample_settings`
--
ALTER TABLE `mod_sample_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `mod_seo`
--
ALTER TABLE `mod_seo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `mod_seo_inflect`
--
ALTER TABLE `mod_seo_inflect`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `mod_seo_products`
--
ALTER TABLE `mod_seo_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `mod_shop_discounts`
--
ALTER TABLE `mod_shop_discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `mod_sitemap_blocked_urls`
--
ALTER TABLE `mod_sitemap_blocked_urls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `mod_sitemap_changefreq`
--
ALTER TABLE `mod_sitemap_changefreq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `mod_sitemap_priorities`
--
ALTER TABLE `mod_sitemap_priorities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `mod_stats_attendance`
--
ALTER TABLE `mod_stats_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3258;
--
-- AUTO_INCREMENT для таблицы `mod_stats_attendance_robots`
--
ALTER TABLE `mod_stats_attendance_robots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `mod_wish_list`
--
ALTER TABLE `mod_wish_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `mod_wish_list_products`
--
ALTER TABLE `mod_wish_list_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=119;
--
-- AUTO_INCREMENT для таблицы `mod_ymarket`
--
ALTER TABLE `mod_ymarket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `search`
--
ALTER TABLE `search`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `settings_i18n`
--
ALTER TABLE `settings_i18n`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `shop_banners`
--
ALTER TABLE `shop_banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `shop_brands`
--
ALTER TABLE `shop_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=294;
--
-- AUTO_INCREMENT для таблицы `shop_callbacks`
--
ALTER TABLE `shop_callbacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT для таблицы `shop_callbacks_statuses`
--
ALTER TABLE `shop_callbacks_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `shop_callbacks_themes`
--
ALTER TABLE `shop_callbacks_themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `shop_category`
--
ALTER TABLE `shop_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3034;
--
-- AUTO_INCREMENT для таблицы `shop_comulativ_discount`
--
ALTER TABLE `shop_comulativ_discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `shop_currencies`
--
ALTER TABLE `shop_currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `shop_delivery_methods`
--
ALTER TABLE `shop_delivery_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT для таблицы `shop_discounts`
--
ALTER TABLE `shop_discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT для таблицы `shop_gifts`
--
ALTER TABLE `shop_gifts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `shop_kit`
--
ALTER TABLE `shop_kit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT для таблицы `shop_notifications`
--
ALTER TABLE `shop_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `shop_notification_statuses`
--
ALTER TABLE `shop_notification_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `shop_orders`
--
ALTER TABLE `shop_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=86;
--
-- AUTO_INCREMENT для таблицы `shop_orders_products`
--
ALTER TABLE `shop_orders_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=175;
--
-- AUTO_INCREMENT для таблицы `shop_orders_status_history`
--
ALTER TABLE `shop_orders_status_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT для таблицы `shop_order_statuses`
--
ALTER TABLE `shop_order_statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `shop_payment_methods`
--
ALTER TABLE `shop_payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `shop_products`
--
ALTER TABLE `shop_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17266;
--
-- AUTO_INCREMENT для таблицы `shop_products_words`
--
ALTER TABLE `shop_products_words`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=403;
--
-- AUTO_INCREMENT для таблицы `shop_product_properties`
--
ALTER TABLE `shop_product_properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=388;
--
-- AUTO_INCREMENT для таблицы `shop_product_properties_data`
--
ALTER TABLE `shop_product_properties_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=89254;
--
-- AUTO_INCREMENT для таблицы `shop_product_variants`
--
ALTER TABLE `shop_product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18041;
--
-- AUTO_INCREMENT для таблицы `shop_rbac_group`
--
ALTER TABLE `shop_rbac_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=80;
--
-- AUTO_INCREMENT для таблицы `shop_rbac_privileges`
--
ALTER TABLE `shop_rbac_privileges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=747;
--
-- AUTO_INCREMENT для таблицы `shop_rbac_roles`
--
ALTER TABLE `shop_rbac_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `shop_rbac_roles_privileges`
--
ALTER TABLE `shop_rbac_roles_privileges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3202;
--
-- AUTO_INCREMENT для таблицы `shop_sorting`
--
ALTER TABLE `shop_sorting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `shop_sorting_i18n`
--
ALTER TABLE `shop_sorting_i18n`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `shop_spy`
--
ALTER TABLE `shop_spy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `smart_filter_semantic_urls`
--
ALTER TABLE `smart_filter_semantic_urls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `template_settings`
--
ALTER TABLE `template_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `trash`
--
ALTER TABLE `trash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT для таблицы `user_temp`
--
ALTER TABLE `user_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=46;