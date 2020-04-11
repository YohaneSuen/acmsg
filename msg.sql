-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016 年 11 月 05 日 19:01
-- 服务器版本: 5.5.40
-- PHP 版本: 5.4.33

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `msg`
--

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(30) NOT NULL DEFAULT '',
  `intro` text NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `category`
--

INSERT INTO `category` (`id`, `cat_name`, `intro`, `parent_id`) VALUES
(1, '综合', '包含该栏目及所有子栏目下内容', 0),
(2, '综合版1', '', 1),
(3, '欢乐恶搞', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `reply`
--

CREATE TABLE IF NOT EXISTS `reply` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL DEFAULT '0',
  `floor` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(15) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `reptime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=69 ;

--
-- 转存表中的数据 `reply`
--

INSERT INTO `reply` (`rid`, `tid`, `floor`, `uid`, `type`, `name`, `content`, `reptime`) VALUES
(66, 54, 1, 7, 0, '匿名', '1', 1476089671),
(34, 16, 1, 2, 1, '高贵红名', 'gdfgdfgdf', 1475078894),
(65, 53, 1, 2, 1, '红名啊啊啊啊', 'aa<span class="quote">&gt;&gt;52</span>', 1476089479),
(36, 16, 3, 2, 1, '高贵红名', 'a', 1475367346),
(51, 16, 4, 2, 1, '红名', 'aa', 1476077086),
(52, 52, 1, 2, 1, '红名', 'teee', 1476077209),
(53, 16, 5, 2, 1, '红名', 'a', 1476081164),
(54, 16, 5, 2, 1, '红名', 'a', 1476081164),
(55, 16, 5, 2, 1, '红名', 'a', 1476081164),
(56, 16, 5, 2, 1, '红名', 'a', 1476081164),
(57, 16, 5, 2, 1, '红名', 'a', 1476081164),
(58, 16, 5, 2, 1, '红名', 'a', 1476081164),
(59, 16, 5, 2, 1, '红名', 'a', 1476081164),
(60, 16, 5, 2, 1, '红名', 'a', 1476081164),
(61, 16, 5, 2, 1, '红名', 'a', 1476081164),
(62, 16, 5, 2, 1, '红名', 'a', 1476081164),
(63, 16, 5, 2, 1, '红名', 'a', 1476081164),
(64, 52, 2, 7, 0, '匿名', '<span class="quote">&gt;&gt;52</span>', 1476088745),
(67, 53, 2, 7, 0, '匿名', 'a', 1476089685),
(68, 52, 3, 7, 0, '匿名', '<span class="quote">&gt;&gt;52&gt;2</span>', 1476089923);

-- --------------------------------------------------------

--
-- 表的结构 `subscription`
--

CREATE TABLE IF NOT EXISTS `subscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `tid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=157 ;

--
-- 转存表中的数据 `subscription`
--

INSERT INTO `subscription` (`id`, `uid`, `tid`) VALUES
(151, 2, 40),
(2, 2, 33),
(152, 1, 16),
(156, 2, 53),
(154, 2, 16),
(149, 1, 40);

-- --------------------------------------------------------

--
-- 表的结构 `thread`
--

CREATE TABLE IF NOT EXISTS `thread` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `cat` int(11) NOT NULL DEFAULT '0',
  `name` varchar(15) NOT NULL DEFAULT '',
  `title` varchar(30) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `pubtime` int(10) unsigned NOT NULL DEFAULT '0',
  `lastreptime` int(10) unsigned NOT NULL DEFAULT '0',
  `SAGE` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=57 ;

--
-- 转存表中的数据 `thread`
--

INSERT INTO `thread` (`tid`, `uid`, `type`, `cat`, `name`, `title`, `content`, `pubtime`, `lastreptime`, `SAGE`) VALUES
(42, 1, 0, 1, '匿名', '无标题', 'test', 1476022904, 1476022904, 0),
(43, 2, 1, 1, '红名', '无标题', '1', 1476024038, 1476024038, 0),
(39, 2, 1, 0, '红名', '举报受理', '在此串下举报违规串或回应，请简述举报理由。', 1475500819, 1475500819, 0),
(40, 2, 1, 1, '红名', '无标题', '111', 1475502805, 1475502805, 1),
(16, 2, 1, 3, '高贵红名', '无标题', 'fsdfsdfg', 1475078886, 1475500540, 0),
(44, 2, 1, 1, '红名', '无标题', '111', 1476024161, 1476024161, 0),
(45, 2, 1, 3, '红名', '无标题', 'aa', 1476024194, 1476024194, 0),
(46, 2, 1, 2, '红名', '无标题', 'test', 1476024226, 1476024226, 0),
(48, 2, 1, 1, '红名', '无标题', '1', 1476025999, 1476025999, 0),
(49, 2, 1, 1, '红名', '无标题', 'dfasfd', 1476026161, 1476026161, 0),
(51, 2, 1, 1, '红名', '无标题', 'a', 1476027818, 1476027818, 0),
(52, 2, 1, 1, '红名', '无标题', 'a', 1476077177, 1476077209, 1),
(53, 2, 1, 1, '红名啊啊啊啊', 'test', '<span class="quote">&gt;&gt;52</span>', 1476089449, 1476089685, 0),
(54, 7, 0, 1, '匿名', 'a', 'a', 1476089645, 1476089671, 0);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `username` varchar(16) NOT NULL DEFAULT '',
  `nickname` varchar(10) NOT NULL DEFAULT '',
  `email` varchar(30) NOT NULL DEFAULT '',
  `hashed_password` varchar(64) NOT NULL DEFAULT '',
  `regtime` int(10) unsigned NOT NULL DEFAULT '0',
  `regip` varchar(15) NOT NULL DEFAULT '',
  `lastlogin` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`uid`, `type`, `username`, `nickname`, `email`, `hashed_password`, `regtime`, `regip`, `lastlogin`, `lastip`) VALUES
(1, 0, 'testa', '匿名', 'aa@aa.aa', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1474975269, '::1', 1476022900, '::1'),
(2, 1, 'admin', '红名', 'a6@a.aa', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 1474975269, '', 1476613231, '::1');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
