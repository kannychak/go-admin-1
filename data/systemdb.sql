-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2020-01-18 01:29:56
-- 服务器版本： 5.5.53
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `systemdb`
--

-- --------------------------------------------------------

--
-- 表的结构 `system_log`
--

CREATE TABLE `system_log` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `system_user_id` int(11) DEFAULT '0' COMMENT '主键',
  `title` varchar(300) NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text COMMENT '日志内容记录SQL',
  `relation_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '相关对应表主键',
  `relation_table` int(4) NOT NULL DEFAULT '1' COMMENT '对应表(1 system_user,2 system_menu,3 system_role)',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'ip',
  `url` varchar(500) NOT NULL DEFAULT '',
  `ctime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='操作日志';

-- --------------------------------------------------------

--
-- 表的结构 `system_menu`
--

CREATE TABLE `system_menu` (
  `id` int(11) NOT NULL COMMENT '主键',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `path` varchar(50) NOT NULL DEFAULT '' COMMENT '路径',
  `component` varchar(100) NOT NULL DEFAULT '' COMMENT '组件',
  `redirect` varchar(200) NOT NULL DEFAULT '' COMMENT '重定向',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '访问url',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'meta标题',
  `meta_icon` varchar(50) NOT NULL DEFAULT '' COMMENT 'meta icon',
  `meta_nocache` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否缓存（1:是 0:否）',
  `alwaysshow` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否总是显示（1:是0：否）',
  `meta_affix` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否加固（1:是0：否）',
  `type` tinyint(4) NOT NULL DEFAULT '2' COMMENT '类型(1:固定,2:权限配置3特殊)',
  `hidden` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否隐藏（0否1是）',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态（0禁止1启动）',
  `level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '层级',
  `ctime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限';

--
-- 转存表中的数据 `system_menu`
--

INSERT INTO `system_menu` (`id`, `name`, `path`, `component`, `redirect`, `url`, `meta_title`, `meta_icon`, `meta_nocache`, `alwaysshow`, `meta_affix`, `type`, `hidden`, `pid`, `sort`, `status`, `level`, `ctime`) VALUES
(1, '系统管理', '/system', '#', '', '#', '系统管理', 'fafa-adjust', 0, 0, 0, 2, 0, 0, 0, 1, 0, '2019-12-02 06:14:15'),
(2, '用户管理', '/system/user', '/system/user/index', '', '/user', '用户管理', '#', 0, 0, 0, 2, 0, 1, 0, 1, 1, '2019-12-02 00:00:00'),
(3, '菜单管理', '/system/menu', '/system/menu/index', '', '/menu', '菜单管理', '#', 0, 0, 0, 2, 0, 1, 0, 1, 1, '2019-12-02 00:00:00'),
(26, '角色管理', '/system/role', '/system/role/index', '', '/roles', '角色管理', '#', 0, 1, 0, 0, 0, 1, 0, 1, 1, '2019-12-25 19:44:16'),
(27, '添加用户', '/system/user/create', '/system/user/create/index', '', '/user/create', '添加用户', '#', 0, 1, 0, 0, 0, 2, 0, 1, 2, '2019-12-25 20:43:21'),
(28, '用户列表', '/system/user/list', '/system/user/list/index', '', '/user/index', '用户列表', '#', 0, 0, 0, 0, 0, 2, 0, 1, 2, '2019-12-31 09:16:43'),
(29, '用户编辑', '/system/user/edit/:id(\\d+)', '/system/user/edit/index', '', '/user/edit', '用户编辑', '#', 0, 1, 0, 0, 1, 2, 0, 1, 2, '2019-12-31 09:17:41'),
(30, '内容管理', '/article', '#', '', '/article', '内容管理', '#', 0, 1, 0, 0, 0, 0, 0, 1, 0, '2019-12-31 09:49:54'),
(31, '创建文章', '/system/article/create', '/system/article/create/index', '', '/article/create', '创建文章', '#', 0, 1, 0, 0, 0, 30, 0, 1, 1, '2019-12-31 09:51:12'),
(32, '文章编辑', '/system/article/edit', '/system/article/edit/index', '', '/article/edit', '文章编辑', '#', 0, 1, 0, 0, 0, 30, 0, 1, 1, '2019-12-31 09:51:56'),
(33, '文章列表', '/system/article/list', '/system/article/list/index', '', '/article/list', '文章列表', '#', 0, 1, 0, 0, 0, 30, 0, 1, 1, '2019-12-31 09:52:36'),
(34, '重置密码', '/system/user/repasswd/:id(\\d+)', '/system/user/repasswd/index', '', '/user/repasswd', '重置密码', '#', 0, 1, 0, 0, 1, 2, 0, 1, 2, '2020-01-05 10:27:22');

-- --------------------------------------------------------

--
-- 表的结构 `system_role`
--

CREATE TABLE `system_role` (
  `id` int(11) NOT NULL COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `alias_name` varchar(50) NOT NULL DEFAULT '' COMMENT '别名',
  `description` varchar(200) NOT NULL DEFAULT '' COMMENT '描述',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '角色状态（0无效1有效）',
  `type` int(4) NOT NULL DEFAULT '1' COMMENT '属于哪个应用',
  `ctime` datetime NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色';

--
-- 转存表中的数据 `system_role`
--

INSERT INTO `system_role` (`id`, `name`, `alias_name`, `description`, `status`, `type`, `ctime`) VALUES
(1, 'admin', 'admin', '超级管理员具有所有权限', 1, 1, '2019-11-07 16:22:29'),
(2, 'editor', 'editor', '运营者', 1, 1, '2019-11-07 16:22:29'),
(3, 'normal', 'normal', '普通管理员', 1, 0, '0001-01-01 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `system_role_menu`
--

CREATE TABLE `system_role_menu` (
  `id` int(11) NOT NULL COMMENT '主键',
  `system_role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色主键',
  `system_menu_id` int(11) NOT NULL DEFAULT '0' COMMENT '菜单主键'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色与菜单关联表';

--
-- 转存表中的数据 `system_role_menu`
--

INSERT INTO `system_role_menu` (`id`, `system_role_id`, `system_menu_id`) VALUES
(40, 1, 1),
(41, 1, 2),
(46, 1, 3),
(42, 1, 27),
(43, 1, 28),
(44, 1, 29),
(45, 1, 34),
(48, 3, 1),
(49, 3, 30),
(50, 3, 31),
(51, 3, 32),
(52, 3, 33);

-- --------------------------------------------------------

--
-- 表的结构 `system_user`
--

CREATE TABLE `system_user` (
  `id` int(11) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '登录名称',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `salt` varchar(4) NOT NULL COMMENT '盐',
  `phone` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(300) NOT NULL DEFAULT '' COMMENT '头像',
  `introduction` varchar(300) NOT NULL DEFAULT '' COMMENT '简介',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态（0 停止1启动）',
  `utime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `last_login_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上次登录时间',
  `last_login_ip` varchar(50) NOT NULL DEFAULT '' COMMENT '最近登录IP',
  `ctime` datetime NOT NULL COMMENT '注册时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理账户表';

--
-- 转存表中的数据 `system_user`
--

INSERT INTO `system_user` (`id`, `name`, `nickname`, `password`, `salt`, `phone`, `avatar`, `introduction`, `status`, `utime`, `last_login_time`, `last_login_ip`, `ctime`) VALUES
(1, 'admin', 'admin1', '297f8efd64f95e37a7d792d926a7b5db47c58403', 'MbBQ', '11111111111', 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', '', 1, '2019-11-01 07:02:33', '0001-01-01 00:00:00', '', '2019-10-24 20:20:34');

-- --------------------------------------------------------

--
-- 表的结构 `system_user_role`
--

CREATE TABLE `system_user_role` (
  `id` int(11) NOT NULL COMMENT '主键',
  `system_user_id` int(11) NOT NULL COMMENT '用户主键',
  `system_role_id` int(11) NOT NULL COMMENT '角色主键'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='账户和角色关联表';

--
-- 转存表中的数据 `system_user_role`
--

INSERT INTO `system_user_role` (`id`, `system_user_id`, `system_role_id`) VALUES
(13, 1, 1),
(14, 1, 2),
(15, 1, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `system_log`
--
ALTER TABLE `system_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `RELATION_ID` (`relation_id`),
  ADD KEY `SYSTEM_USER_ID` (`system_user_id`),
  ADD KEY `CTIME` (`ctime`),
  ADD KEY `RELATION_TABLE` (`relation_table`);

--
-- Indexes for table `system_menu`
--
ALTER TABLE `system_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_list` (`pid`,`sort`,`status`) USING BTREE,
  ADD KEY `path` (`path`);

--
-- Indexes for table `system_role`
--
ALTER TABLE `system_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `TYPE` (`type`),
  ADD KEY `STATUS` (`status`);

--
-- Indexes for table `system_role_menu`
--
ALTER TABLE `system_role_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_role_id` (`system_role_id`,`system_menu_id`);

--
-- Indexes for table `system_user`
--
ALTER TABLE `system_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `PASSWORD` (`password`);

--
-- Indexes for table `system_user_role`
--
ALTER TABLE `system_user_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `system_user_id` (`system_user_id`,`system_role_id`) USING BTREE;

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `system_log`
--
ALTER TABLE `system_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `system_menu`
--
ALTER TABLE `system_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=35;

--
-- 使用表AUTO_INCREMENT `system_role`
--
ALTER TABLE `system_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `system_role_menu`
--
ALTER TABLE `system_role_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=53;

--
-- 使用表AUTO_INCREMENT `system_user`
--
ALTER TABLE `system_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=15;

--
-- 使用表AUTO_INCREMENT `system_user_role`
--
ALTER TABLE `system_user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
