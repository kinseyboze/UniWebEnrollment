-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 10, 2025 at 01:09 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Capstone`
--

-- --------------------------------------------------------

--
-- Table structure for table `columns_priv`
--

CREATE TABLE `columns_priv` (
  `Host` char(60) NOT NULL DEFAULT '',
  `Db` char(64) NOT NULL DEFAULT '',
  `User` char(80) NOT NULL DEFAULT '',
  `Table_name` char(64) NOT NULL DEFAULT '',
  `Column_name` char(64) NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column privileges';

-- --------------------------------------------------------

--
-- Table structure for table `column_stats`
--

CREATE TABLE `column_stats` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `column_name` varchar(64) NOT NULL,
  `min_value` varchar(255) DEFAULT NULL,
  `max_value` varchar(255) DEFAULT NULL,
  `nulls_ratio` decimal(12,4) DEFAULT NULL,
  `avg_length` decimal(12,4) DEFAULT NULL,
  `avg_frequency` decimal(12,4) DEFAULT NULL,
  `hist_size` tinyint(3) UNSIGNED DEFAULT NULL,
  `hist_type` enum('SINGLE_PREC_HB','DOUBLE_PREC_HB') DEFAULT NULL,
  `histogram` varbinary(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Statistics on Columns';

-- --------------------------------------------------------

--
-- Table structure for table `Course`
--

CREATE TABLE `Course` (
  `courseid` bigint(20) NOT NULL,
  `coursedesc` varchar(400) NOT NULL,
  `building` varchar(25) NOT NULL,
  `room` varchar(25) NOT NULL,
  `time` varchar(25) NOT NULL,
  `days` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='This table will hold the courses for enrollment. ';

-- --------------------------------------------------------

--
-- Table structure for table `db`
--

CREATE TABLE `db` (
  `Host` char(60) NOT NULL DEFAULT '',
  `Db` char(64) NOT NULL DEFAULT '',
  `User` char(80) NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database privileges';

--
-- Dumping data for table `db`
--

INSERT INTO `db` (`Host`, `Db`, `User`, `Select_priv`, `Insert_priv`, `Update_priv`, `Delete_priv`, `Create_priv`, `Drop_priv`, `Grant_priv`, `References_priv`, `Index_priv`, `Alter_priv`, `Create_tmp_table_priv`, `Lock_tables_priv`, `Create_view_priv`, `Show_view_priv`, `Create_routine_priv`, `Alter_routine_priv`, `Execute_priv`, `Event_priv`, `Trigger_priv`) VALUES
('%', 'test', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y'),
('%', 'test\\_%', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'Y'),
('localhost', 'phpmyadmin', 'pma', 'Y', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` char(64) NOT NULL DEFAULT '',
  `body` longblob NOT NULL,
  `definer` char(141) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `execute_at` datetime DEFAULT NULL,
  `interval_value` int(11) DEFAULT NULL,
  `interval_field` enum('YEAR','QUARTER','MONTH','DAY','HOUR','MINUTE','WEEK','SECOND','MICROSECOND','YEAR_MONTH','DAY_HOUR','DAY_MINUTE','DAY_SECOND','HOUR_MINUTE','HOUR_SECOND','MINUTE_SECOND','DAY_MICROSECOND','HOUR_MICROSECOND','MINUTE_MICROSECOND','SECOND_MICROSECOND') DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_executed` datetime DEFAULT NULL,
  `starts` datetime DEFAULT NULL,
  `ends` datetime DEFAULT NULL,
  `status` enum('ENABLED','DISABLED','SLAVESIDE_DISABLED') NOT NULL DEFAULT 'ENABLED',
  `on_completion` enum('DROP','PRESERVE') NOT NULL DEFAULT 'DROP',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','IGNORE_BAD_TABLE_OPTIONS','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') NOT NULL DEFAULT '',
  `comment` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `originator` int(10) UNSIGNED NOT NULL,
  `time_zone` char(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'SYSTEM',
  `character_set_client` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `collation_connection` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `db_collation` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `body_utf8` longblob DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Events';

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `id` bigint(20) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `office` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phonenumber` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `func`
--

CREATE TABLE `func` (
  `name` char(64) NOT NULL DEFAULT '',
  `ret` tinyint(1) NOT NULL DEFAULT 0,
  `dl` char(128) NOT NULL DEFAULT '',
  `type` enum('function','aggregate') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User defined functions';

-- --------------------------------------------------------

--
-- Table structure for table `general_log`
--

CREATE TABLE `general_log` (
  `event_time` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `user_host` mediumtext NOT NULL,
  `thread_id` bigint(21) UNSIGNED NOT NULL,
  `server_id` int(10) UNSIGNED NOT NULL,
  `command_type` varchar(64) NOT NULL,
  `argument` mediumtext NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='General log';

-- --------------------------------------------------------

--
-- Table structure for table `gtid_slave_pos`
--

CREATE TABLE `gtid_slave_pos` (
  `domain_id` int(10) UNSIGNED NOT NULL,
  `sub_id` bigint(20) UNSIGNED NOT NULL,
  `server_id` int(10) UNSIGNED NOT NULL,
  `seq_no` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Replication slave GTID position';

-- --------------------------------------------------------

--
-- Table structure for table `help_category`
--

CREATE TABLE `help_category` (
  `help_category_id` smallint(5) UNSIGNED NOT NULL,
  `name` char(64) NOT NULL,
  `parent_category_id` smallint(5) UNSIGNED DEFAULT NULL,
  `url` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='help categories';

--
-- Dumping data for table `help_category`
--

INSERT INTO `help_category` (`help_category_id`, `name`, `parent_category_id`, `url`) VALUES
(1, 'Geographic', 0, ''),
(2, 'Polygon properties', 34, ''),
(3, 'WKT', 34, ''),
(4, 'Numeric Functions', 38, ''),
(5, 'Plugins', 35, ''),
(6, 'MBR', 34, ''),
(7, 'Control flow functions', 38, ''),
(8, 'Transactions', 35, ''),
(9, 'Help Metadata', 35, ''),
(10, 'Account Management', 35, ''),
(11, 'Point properties', 34, ''),
(12, 'Encryption Functions', 38, ''),
(13, 'LineString properties', 34, ''),
(14, 'Miscellaneous Functions', 38, ''),
(15, 'Logical operators', 38, ''),
(16, 'Functions and Modifiers for Use with GROUP BY', 35, ''),
(17, 'Information Functions', 38, ''),
(18, 'Comparison operators', 38, ''),
(19, 'Bit Functions', 38, ''),
(20, 'Table Maintenance', 35, ''),
(21, 'User-Defined Functions', 35, ''),
(22, 'Data Types', 35, ''),
(23, 'Compound Statements', 35, ''),
(24, 'Geometry constructors', 34, ''),
(25, 'GeometryCollection properties', 1, ''),
(26, 'Administration', 35, ''),
(27, 'Data Manipulation', 35, ''),
(28, 'Utility', 35, ''),
(29, 'Language Structure', 35, ''),
(30, 'Geometry relations', 34, ''),
(31, 'Date and Time Functions', 38, ''),
(32, 'WKB', 34, ''),
(33, 'Procedures', 35, ''),
(34, 'Geographic Features', 35, ''),
(35, 'Contents', 0, ''),
(36, 'Geometry properties', 34, ''),
(37, 'String Functions', 38, ''),
(38, 'Functions', 35, ''),
(39, 'Data Definition', 35, '');

-- --------------------------------------------------------

--
-- Table structure for table `help_keyword`
--

CREATE TABLE `help_keyword` (
  `help_keyword_id` int(10) UNSIGNED NOT NULL,
  `name` char(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='help keywords';

--
-- Dumping data for table `help_keyword`
--

INSERT INTO `help_keyword` (`help_keyword_id`, `name`) VALUES
(0, 'JOIN'),
(1, 'HOST'),
(2, 'REPEAT'),
(3, 'SERIALIZABLE'),
(4, 'REPLACE'),
(5, 'AT'),
(6, 'SCHEDULE'),
(7, 'RETURNS'),
(8, 'STARTS'),
(9, 'MASTER_SSL_CA'),
(10, 'NCHAR'),
(11, 'COLUMNS'),
(12, 'COMPLETION'),
(13, 'WORK'),
(14, 'DATETIME'),
(15, 'MODE'),
(16, 'OPEN'),
(17, 'INTEGER'),
(18, 'ESCAPE'),
(19, 'VALUE'),
(20, 'MASTER_SSL_VERIFY_SERVER_CERT'),
(21, 'SQL_BIG_RESULT'),
(22, 'DROP'),
(23, 'GEOMETRYCOLLECTIONFROMWKB'),
(24, 'EVENTS'),
(25, 'MONTH'),
(26, 'PROFILES'),
(27, 'DUPLICATE'),
(28, 'REPLICATION'),
(29, 'UNLOCK'),
(30, 'INNODB'),
(31, 'YEAR_MONTH'),
(32, 'SUBJECT'),
(33, 'PREPARE'),
(34, 'LOCK'),
(35, 'NDB'),
(36, 'CHECK'),
(37, 'FULL'),
(38, 'INT4'),
(39, 'BY'),
(40, 'NO'),
(41, 'MINUTE'),
(42, 'PARTITION'),
(43, 'DATA'),
(44, 'DAY'),
(45, 'SHARE'),
(46, 'REAL'),
(47, 'SEPARATOR'),
(48, 'MESSAGE_TEXT'),
(49, 'MASTER_HEARTBEAT_PERIOD'),
(50, 'DELETE'),
(51, 'ON'),
(52, 'COLUMN_NAME'),
(53, 'CONNECTION'),
(54, 'CLOSE'),
(55, 'X509'),
(56, 'USE'),
(57, 'SUBCLASS_ORIGIN'),
(58, 'WHERE'),
(59, 'PRIVILEGES'),
(60, 'SPATIAL'),
(61, 'EVENT'),
(62, 'SUPER'),
(63, 'SQL_BUFFER_RESULT'),
(64, 'IGNORE'),
(65, 'SHA2'),
(66, 'QUICK'),
(67, 'SIGNED'),
(68, 'OFFLINE'),
(69, 'SECURITY'),
(70, 'AUTOEXTEND_SIZE'),
(71, 'NDBCLUSTER'),
(72, 'POLYGONFROMWKB'),
(73, 'FALSE'),
(74, 'LEVEL'),
(75, 'FORCE'),
(76, 'BINARY'),
(77, 'TO'),
(78, 'CHANGE'),
(79, 'CURRENT_USER'),
(80, 'HOUR_MINUTE'),
(81, 'UPDATE'),
(82, 'PRESERVE'),
(83, 'TABLE_NAME'),
(84, 'INTO'),
(85, 'FEDERATED'),
(86, 'VARYING'),
(87, 'MAX_SIZE'),
(88, 'HOUR_SECOND'),
(89, 'VARIABLE'),
(90, 'ROLLBACK'),
(91, 'PROCEDURE'),
(92, 'TIMESTAMP'),
(93, 'IMPORT'),
(94, 'AGAINST'),
(95, 'CHECKSUM'),
(96, 'COUNT'),
(97, 'LONGBINARY'),
(98, 'THEN'),
(99, 'INSERT'),
(100, 'ENGINES'),
(101, 'HANDLER'),
(102, 'PORT'),
(103, 'DAY_SECOND'),
(104, 'EXISTS'),
(105, 'MUTEX'),
(106, 'HELP_DATE'),
(107, 'RELEASE'),
(108, 'BOOLEAN'),
(109, 'MOD'),
(110, 'DEFAULT'),
(111, 'TYPE'),
(112, 'NO_WRITE_TO_BINLOG'),
(113, 'OPTIMIZE'),
(114, 'SQLSTATE'),
(115, 'RESET'),
(116, 'CLASS_ORIGIN'),
(117, 'INSTALL'),
(118, 'ITERATE'),
(119, 'DO'),
(120, 'BIGINT'),
(121, 'SET'),
(122, 'ISSUER'),
(123, 'DATE'),
(124, 'STATUS'),
(125, 'FULLTEXT'),
(126, 'COMMENT'),
(127, 'MASTER_CONNECT_RETRY'),
(128, 'INNER'),
(129, 'RELAYLOG'),
(130, 'STOP'),
(131, 'MASTER_LOG_FILE'),
(132, 'MRG_MYISAM'),
(133, 'PRECISION'),
(134, 'REQUIRE'),
(135, 'TRAILING'),
(136, 'PARTITIONS'),
(137, 'LONG'),
(138, 'OPTION'),
(139, 'REORGANIZE'),
(140, 'ELSE'),
(141, 'DEALLOCATE'),
(142, 'IO_THREAD'),
(143, 'CASE'),
(144, 'CIPHER'),
(145, 'CONTINUE'),
(146, 'FROM'),
(147, 'READ'),
(148, 'LEFT'),
(149, 'ELSEIF'),
(150, 'MINUTE_SECOND'),
(151, 'COMPACT'),
(152, 'DEC'),
(153, 'FOR'),
(154, 'WARNINGS'),
(155, 'MIN_ROWS'),
(156, 'STRING'),
(157, 'CONDITION'),
(158, 'ENCLOSED'),
(159, 'FUNCTION'),
(160, 'AGGREGATE'),
(161, 'FIELDS'),
(162, 'INT3'),
(163, 'ARCHIVE'),
(164, 'AVG_ROW_LENGTH'),
(165, 'ADD'),
(166, 'KILL'),
(167, 'FLOAT4'),
(168, 'TABLESPACE'),
(169, 'VIEW'),
(170, 'REPEATABLE'),
(171, 'INFILE'),
(172, 'HELP_VERSION'),
(173, 'ORDER'),
(174, 'USING'),
(175, 'CONSTRAINT_CATALOG'),
(176, 'MIDDLEINT'),
(177, 'GRANT'),
(178, 'UNSIGNED'),
(179, 'DECIMAL'),
(180, 'GEOMETRYFROMTEXT'),
(181, 'INDEXES'),
(182, 'FOREIGN'),
(183, 'CACHE'),
(184, 'HOSTS'),
(185, 'MYSQL_ERRNO'),
(186, 'COMMIT'),
(187, 'SCHEMAS'),
(188, 'LEADING'),
(189, 'SNAPSHOT'),
(190, 'CONSTRAINT_NAME'),
(191, 'DECLARE'),
(192, 'LOAD'),
(193, 'SQL_CACHE'),
(194, 'CONVERT'),
(195, 'DYNAMIC'),
(196, 'COLLATE'),
(197, 'POLYGONFROMTEXT'),
(198, 'BYTE'),
(199, 'GLOBAL'),
(200, 'LINESTRINGFROMWKB'),
(201, 'WHEN'),
(202, 'HAVING'),
(203, 'AS'),
(204, 'STARTING'),
(205, 'RELOAD'),
(206, 'AUTOCOMMIT'),
(207, 'REVOKE'),
(208, 'GRANTS'),
(209, 'OUTER'),
(210, 'CURSOR_NAME'),
(211, 'FLOOR'),
(212, 'EXPLAIN'),
(213, 'WITH'),
(214, 'AFTER'),
(215, 'STD'),
(216, 'CSV'),
(217, 'DISABLE'),
(218, 'UNINSTALL'),
(219, 'OUTFILE'),
(220, 'LOW_PRIORITY'),
(221, 'FILE'),
(222, 'NODEGROUP'),
(223, 'SCHEMA'),
(224, 'SONAME'),
(225, 'POW'),
(226, 'DUAL'),
(227, 'MULTIPOINTFROMWKB'),
(228, 'INDEX'),
(229, 'MULTIPOINTFROMTEXT'),
(230, 'DEFINER'),
(231, 'MASTER_BIND'),
(232, 'REMOVE'),
(233, 'EXTENDED'),
(234, 'MULTILINESTRINGFROMWKB'),
(235, 'CROSS'),
(236, 'CONTRIBUTORS'),
(237, 'NATIONAL'),
(238, 'GROUP'),
(239, 'SHA'),
(240, 'ONLINE'),
(241, 'UNDO'),
(242, 'IGNORE_SERVER_IDS'),
(243, 'ZEROFILL'),
(244, 'CLIENT'),
(245, 'MASTER_PASSWORD'),
(246, 'OWNER'),
(247, 'RELAY_LOG_FILE'),
(248, 'TRUE'),
(249, 'CHARACTER'),
(250, 'MASTER_USER'),
(251, 'SCHEMA_NAME'),
(252, 'TABLE'),
(253, 'ENGINE'),
(254, 'INSERT_METHOD'),
(255, 'CASCADE'),
(256, 'RELAY_LOG_POS'),
(257, 'SQL_CALC_FOUND_ROWS'),
(258, 'UNION'),
(259, 'MYISAM'),
(260, 'LEAVE'),
(261, 'MODIFY'),
(262, 'MATCH'),
(263, 'MASTER_LOG_POS'),
(264, 'DISTINCTROW'),
(265, 'DESC'),
(266, 'TIME'),
(267, 'NUMERIC'),
(268, 'EXPANSION'),
(269, 'CODE'),
(270, 'CURSOR'),
(271, 'GEOMETRYCOLLECTIONFROMTEXT'),
(272, 'CHAIN'),
(273, 'LOGFILE'),
(274, 'FLUSH'),
(275, 'CREATE'),
(276, 'DESCRIBE'),
(277, 'EXTENT_SIZE'),
(278, 'MAX_UPDATES_PER_HOUR'),
(279, 'INT2'),
(280, 'PROCESSLIST'),
(281, 'ENDS'),
(282, 'LOGS'),
(283, 'DISCARD'),
(284, 'HEAP'),
(285, 'SOUNDS'),
(286, 'BETWEEN'),
(287, 'MULTILINESTRINGFROMTEXT'),
(288, 'REPAIR'),
(289, 'PACK_KEYS'),
(290, 'FAST'),
(291, 'VALUES'),
(292, 'CALL'),
(293, 'LOOP'),
(294, 'VARCHARACTER'),
(295, 'BEFORE'),
(296, 'TRUNCATE'),
(297, 'SHOW'),
(298, 'ALL'),
(299, 'REDUNDANT'),
(300, 'USER_RESOURCES'),
(301, 'PARTIAL'),
(302, 'BINLOG'),
(303, 'END'),
(304, 'SECOND'),
(305, 'AND'),
(306, 'FLOAT8'),
(307, 'PREV'),
(308, 'HOUR'),
(309, 'SELECT'),
(310, 'DATABASES'),
(311, 'OR'),
(312, 'IDENTIFIED'),
(313, 'WRAPPER'),
(314, 'MASTER_SSL_CIPHER'),
(315, 'SQL_SLAVE_SKIP_COUNTER'),
(316, 'BOTH'),
(317, 'BOOL'),
(318, 'YEAR'),
(319, 'MASTER_PORT'),
(320, 'CONCURRENT'),
(321, 'HELP'),
(322, 'UNIQUE'),
(323, 'TRIGGERS'),
(324, 'PROCESS'),
(325, 'OPTIONS'),
(326, 'RESIGNAL'),
(327, 'CONSISTENT'),
(328, 'MASTER_SSL'),
(329, 'DATE_ADD'),
(330, 'MAX_CONNECTIONS_PER_HOUR'),
(331, 'LIKE'),
(332, 'PLUGIN'),
(333, 'FETCH'),
(334, 'IN'),
(335, 'COLUMN'),
(336, 'DUMPFILE'),
(337, 'USAGE'),
(338, 'EXECUTE'),
(339, 'MEMORY'),
(340, 'CEIL'),
(341, 'QUERY'),
(342, 'MASTER_HOST'),
(343, 'LINES'),
(344, 'SQL_THREAD'),
(345, 'SERVER'),
(346, 'MAX_QUERIES_PER_HOUR'),
(347, 'MASTER_SSL_CERT'),
(348, 'MULTIPOLYGONFROMWKB'),
(349, 'TRANSACTION'),
(350, 'DAY_MINUTE'),
(351, 'STDDEV'),
(352, 'DATE_SUB'),
(353, 'REBUILD'),
(354, 'GEOMETRYFROMWKB'),
(355, 'INT1'),
(356, 'RENAME'),
(357, 'PARSER'),
(358, 'RIGHT'),
(359, 'ALTER'),
(360, 'MAX_ROWS'),
(361, 'SOCKET'),
(362, 'STRAIGHT_JOIN'),
(363, 'NATURAL'),
(364, 'VARIABLES'),
(365, 'ESCAPED'),
(366, 'SHA1'),
(367, 'KEY_BLOCK_SIZE'),
(368, 'PASSWORD'),
(369, 'OFFSET'),
(370, 'CHAR'),
(371, 'NEXT'),
(372, 'ERRORS'),
(373, 'SQL_LOG_BIN'),
(374, 'TEMPORARY'),
(375, 'COMMITTED'),
(376, 'SQL_SMALL_RESULT'),
(377, 'UPGRADE'),
(378, 'BEGIN'),
(379, 'DELAY_KEY_WRITE'),
(380, 'PROFILE'),
(381, 'MEDIUM'),
(382, 'INTERVAL'),
(383, 'SSL'),
(384, 'DAY_HOUR'),
(385, 'NAME'),
(386, 'REFERENCES'),
(387, 'AES_ENCRYPT'),
(388, 'STORAGE'),
(389, 'ISOLATION'),
(390, 'CEILING'),
(391, 'EVERY'),
(392, 'INT8'),
(393, 'AUTHORS'),
(394, 'RESTRICT'),
(395, 'UNCOMMITTED'),
(396, 'LINESTRINGFROMTEXT'),
(397, 'IS'),
(398, 'NOT'),
(399, 'ANALYSE'),
(400, 'DATAFILE'),
(401, 'DES_KEY_FILE'),
(402, 'SIGNAL'),
(403, 'COMPRESSED'),
(404, 'START'),
(405, 'PLUGINS'),
(406, 'SAVEPOINT'),
(407, 'IF'),
(408, 'ROWS'),
(409, 'PRIMARY'),
(410, 'PURGE'),
(411, 'LAST'),
(412, 'USER'),
(413, 'EXIT'),
(414, 'KEYS'),
(415, 'LIMIT'),
(416, 'KEY'),
(417, 'MERGE'),
(418, 'UNTIL'),
(419, 'SQL_NO_CACHE'),
(420, 'DELAYED'),
(421, 'CONSTRAINT_SCHEMA'),
(422, 'ANALYZE'),
(423, 'CONSTRAINT'),
(424, 'SERIAL'),
(425, 'ACTION'),
(426, 'WRITE'),
(427, 'INITIAL_SIZE'),
(428, 'SESSION'),
(429, 'DATABASE'),
(430, 'NULL'),
(431, 'POWER'),
(432, 'USE_FRM'),
(433, 'TERMINATED'),
(434, 'SLAVE'),
(435, 'NVARCHAR'),
(436, 'ASC'),
(437, 'RETURN'),
(438, 'OPTIONALLY'),
(439, 'ENABLE'),
(440, 'DIRECTORY'),
(441, 'MAX_USER_CONNECTIONS'),
(442, 'WHILE'),
(443, 'LOCAL'),
(444, 'DISTINCT'),
(445, 'AES_DECRYPT'),
(446, 'MASTER_SSL_KEY'),
(447, 'NONE'),
(448, 'TABLES'),
(449, '<>'),
(450, 'RLIKE'),
(451, 'TRIGGER'),
(452, 'COLLATION'),
(453, 'SHUTDOWN'),
(454, 'HIGH_PRIORITY'),
(455, 'BTREE'),
(456, 'FIRST'),
(457, 'COALESCE'),
(458, 'WAIT'),
(459, 'CATALOG_NAME'),
(460, 'MASTER'),
(461, 'FIXED'),
(462, 'MULTIPOLYGONFROMTEXT'),
(463, 'ROW_FORMAT');

-- --------------------------------------------------------

--
-- Table structure for table `help_relation`
--

CREATE TABLE `help_relation` (
  `help_topic_id` int(10) UNSIGNED NOT NULL,
  `help_keyword_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='keyword-topic relation';

--
-- Dumping data for table `help_relation`
--

INSERT INTO `help_relation` (`help_topic_id`, `help_keyword_id`) VALUES
(1, 0),
(356, 0),
(473, 1),
(232, 2),
(447, 3),
(3, 4),
(130, 4),
(421, 4),
(89, 5),
(89, 6),
(406, 6),
(97, 7),
(89, 8),
(185, 9),
(430, 10),
(21, 11),
(347, 11),
(421, 11),
(463, 11),
(468, 11),
(89, 12),
(406, 12),
(146, 13),
(230, 14),
(88, 15),
(356, 15),
(18, 16),
(106, 16),
(134, 16),
(347, 16),
(97, 17),
(500, 17),
(380, 18),
(3, 19),
(104, 19),
(243, 19),
(374, 19),
(459, 19),
(185, 20),
(356, 21),
(9, 22),
(30, 22),
(34, 22),
(87, 22),
(186, 22),
(237, 22),
(263, 22),
(276, 22),
(300, 22),
(331, 22),
(405, 22),
(415, 22),
(416, 22),
(463, 22),
(478, 22),
(108, 23),
(122, 24),
(170, 24),
(424, 24),
(376, 25),
(82, 26),
(104, 27),
(199, 28),
(36, 29),
(347, 30),
(468, 30),
(376, 31),
(199, 32),
(35, 33),
(237, 33),
(36, 34),
(356, 34),
(468, 35),
(417, 36),
(463, 36),
(468, 36),
(21, 37),
(294, 37),
(347, 37),
(451, 37),
(468, 37),
(500, 38),
(48, 39),
(77, 39),
(83, 39),
(130, 39),
(199, 39),
(356, 39),
(361, 39),
(421, 39),
(463, 39),
(468, 39),
(468, 40),
(472, 40),
(376, 41),
(463, 42),
(468, 42),
(212, 43),
(421, 43),
(468, 43),
(473, 43),
(376, 44),
(356, 45),
(97, 46),
(314, 46),
(361, 47),
(374, 48),
(459, 48),
(185, 49),
(48, 50),
(468, 50),
(472, 50),
(1, 51),
(89, 51),
(406, 51),
(472, 51),
(374, 52),
(459, 52),
(176, 53),
(468, 53),
(51, 54),
(106, 54),
(199, 55),
(1, 56),
(55, 56),
(194, 56),
(374, 57),
(459, 57),
(48, 58),
(83, 58),
(106, 58),
(193, 59),
(199, 59),
(249, 59),
(210, 60),
(463, 60),
(89, 61),
(300, 61),
(358, 61),
(406, 61),
(199, 62),
(356, 63),
(1, 64),
(83, 64),
(104, 64),
(130, 64),
(356, 64),
(421, 64),
(463, 64),
(66, 65),
(48, 66),
(417, 66),
(466, 66),
(230, 67),
(87, 68),
(210, 68),
(463, 68),
(199, 69),
(194, 70),
(468, 71),
(91, 72),
(482, 72),
(385, 73),
(447, 74),
(1, 75),
(39, 76),
(230, 76),
(269, 76),
(185, 77),
(269, 77),
(460, 77),
(185, 78),
(463, 78),
(89, 79),
(406, 79),
(376, 80),
(83, 81),
(104, 81),
(356, 81),
(472, 81),
(89, 82),
(406, 82),
(374, 83),
(459, 83),
(3, 84),
(104, 84),
(304, 84),
(356, 84),
(468, 85),
(257, 86),
(194, 87),
(376, 88),
(129, 89),
(146, 90),
(460, 90),
(17, 91),
(189, 91),
(302, 91),
(328, 91),
(347, 91),
(356, 91),
(416, 91),
(439, 91),
(488, 91),
(99, 92),
(188, 92),
(421, 93),
(463, 93),
(88, 94),
(401, 95),
(468, 95),
(69, 96),
(330, 96),
(433, 96),
(285, 97),
(28, 98),
(57, 98),
(85, 98),
(104, 99),
(195, 99),
(301, 99),
(486, 99),
(282, 100),
(347, 100),
(106, 101),
(313, 101),
(473, 102),
(376, 103),
(9, 104),
(30, 104),
(89, 104),
(155, 104),
(186, 104),
(276, 104),
(300, 104),
(347, 105),
(365, 105),
(109, 106),
(146, 107),
(460, 107),
(24, 108),
(88, 108),
(113, 109),
(174, 109),
(3, 110),
(104, 110),
(155, 110),
(200, 110),
(212, 110),
(243, 110),
(463, 110),
(468, 110),
(463, 111),
(115, 112),
(326, 112),
(466, 112),
(470, 112),
(115, 113),
(463, 113),
(374, 114),
(459, 114),
(38, 115),
(119, 115),
(151, 115),
(264, 115),
(374, 116),
(459, 116),
(419, 117),
(124, 118),
(89, 119),
(125, 119),
(406, 119),
(496, 119),
(221, 120),
(3, 121),
(83, 121),
(104, 121),
(129, 121),
(130, 121),
(146, 121),
(155, 121),
(182, 121),
(212, 121),
(333, 121),
(347, 121),
(356, 121),
(374, 121),
(421, 121),
(459, 121),
(463, 121),
(468, 121),
(472, 121),
(477, 121),
(494, 121),
(199, 122),
(132, 123),
(230, 123),
(262, 123),
(376, 123),
(58, 124),
(137, 124),
(215, 124),
(223, 124),
(328, 124),
(336, 124),
(347, 124),
(365, 124),
(210, 125),
(463, 125),
(468, 125),
(89, 126),
(194, 126),
(210, 126),
(406, 126),
(468, 126),
(185, 127),
(1, 128),
(424, 129),
(52, 130),
(185, 131),
(468, 132),
(314, 133),
(199, 134),
(455, 135),
(255, 136),
(285, 137),
(199, 138),
(249, 138),
(463, 139),
(57, 140),
(85, 140),
(237, 141),
(52, 142),
(324, 142),
(57, 143),
(85, 143),
(199, 144),
(313, 145),
(48, 146),
(122, 146),
(347, 146),
(356, 146),
(424, 146),
(455, 146),
(36, 147),
(106, 147),
(447, 147),
(1, 148),
(28, 149),
(376, 150),
(468, 151),
(209, 152),
(180, 153),
(313, 153),
(347, 153),
(356, 153),
(420, 153),
(330, 154),
(347, 154),
(468, 155),
(97, 156),
(180, 157),
(421, 158),
(34, 159),
(68, 159),
(97, 159),
(211, 159),
(233, 159),
(302, 159),
(336, 159),
(347, 159),
(393, 159),
(405, 159),
(416, 159),
(97, 160),
(347, 161),
(421, 161),
(252, 162),
(468, 163),
(463, 164),
(468, 164),
(60, 165),
(194, 165),
(463, 165),
(478, 165),
(176, 166),
(168, 167),
(194, 168),
(415, 168),
(463, 168),
(478, 168),
(30, 169),
(159, 169),
(454, 169),
(447, 170),
(130, 171),
(421, 171),
(190, 172),
(48, 173),
(83, 173),
(356, 173),
(361, 173),
(463, 173),
(1, 174),
(48, 174),
(86, 174),
(374, 175),
(459, 175),
(252, 176),
(199, 177),
(249, 177),
(24, 178),
(128, 178),
(168, 178),
(209, 178),
(230, 178),
(314, 178),
(500, 178),
(97, 179),
(156, 179),
(230, 179),
(411, 180),
(347, 181),
(463, 182),
(468, 182),
(472, 182),
(473, 182),
(101, 183),
(151, 183),
(304, 183),
(145, 184),
(347, 184),
(374, 185),
(459, 185),
(146, 186),
(160, 187),
(347, 187),
(455, 188),
(146, 189),
(374, 190),
(459, 190),
(180, 191),
(200, 191),
(313, 191),
(420, 191),
(304, 192),
(421, 192),
(356, 193),
(230, 194),
(377, 194),
(468, 195),
(155, 196),
(212, 196),
(468, 196),
(395, 197),
(465, 198),
(129, 199),
(137, 199),
(182, 199),
(349, 199),
(447, 199),
(452, 200),
(57, 201),
(85, 201),
(356, 202),
(1, 203),
(36, 203),
(356, 203),
(421, 204),
(199, 205),
(146, 206),
(249, 207),
(192, 208),
(347, 208),
(1, 209),
(374, 210),
(459, 210),
(221, 211),
(255, 212),
(88, 213),
(199, 213),
(210, 213),
(463, 213),
(468, 213),
(463, 214),
(260, 215),
(421, 216),
(468, 216),
(89, 217),
(406, 217),
(463, 217),
(291, 218),
(356, 219),
(3, 220),
(36, 220),
(48, 220),
(83, 220),
(104, 220),
(130, 220),
(421, 220),
(199, 221),
(194, 222),
(155, 223),
(186, 223),
(212, 223),
(309, 223),
(347, 223),
(97, 224),
(277, 225),
(279, 226),
(464, 227),
(1, 228),
(60, 228),
(87, 228),
(101, 228),
(210, 228),
(304, 228),
(308, 228),
(347, 228),
(463, 228),
(468, 228),
(425, 229),
(89, 230),
(406, 230),
(185, 231),
(463, 232),
(255, 233),
(466, 233),
(272, 234),
(1, 235),
(7, 236),
(347, 236),
(257, 237),
(430, 237),
(194, 238),
(226, 238),
(356, 238),
(427, 239),
(87, 240),
(210, 240),
(463, 240),
(313, 241),
(185, 242),
(24, 243),
(128, 243),
(168, 243),
(209, 243),
(314, 243),
(500, 243),
(199, 244),
(185, 245),
(473, 246),
(185, 247),
(385, 248),
(130, 249),
(155, 249),
(212, 249),
(257, 249),
(333, 249),
(347, 249),
(356, 249),
(421, 249),
(430, 249),
(468, 249),
(185, 250),
(374, 251),
(459, 251),
(60, 252),
(110, 252),
(115, 252),
(215, 252),
(276, 252),
(278, 252),
(321, 252),
(347, 252),
(401, 252),
(417, 252),
(463, 252),
(466, 252),
(468, 252),
(470, 252),
(194, 253),
(347, 253),
(365, 253),
(415, 253),
(463, 253),
(468, 253),
(478, 253),
(468, 254),
(30, 255),
(276, 255),
(468, 255),
(472, 255),
(185, 256),
(356, 257),
(305, 258),
(468, 259),
(310, 260),
(463, 261),
(88, 262),
(185, 263),
(356, 264),
(329, 265),
(356, 265),
(361, 265),
(230, 266),
(315, 266),
(375, 266),
(209, 267),
(88, 268),
(68, 269),
(488, 269),
(420, 270),
(246, 271),
(146, 272),
(194, 273),
(226, 273),
(151, 274),
(326, 274),
(17, 275),
(22, 275),
(60, 275),
(77, 275),
(89, 275),
(97, 275),
(155, 275),
(194, 275),
(210, 275),
(211, 275),
(278, 275),
(302, 275),
(309, 275),
(347, 275),
(358, 275),
(393, 275),
(454, 275),
(468, 275),
(473, 275),
(329, 276),
(194, 277),
(199, 278),
(234, 279),
(347, 280),
(451, 280),
(89, 281),
(39, 282),
(269, 282),
(347, 282),
(463, 283),
(468, 284),
(378, 285),
(147, 286),
(107, 287),
(463, 288),
(466, 288),
(468, 289),
(417, 290),
(3, 291),
(104, 291),
(339, 292),
(344, 293),
(257, 294),
(269, 295),
(321, 296),
(463, 296),
(7, 297),
(10, 297),
(17, 297),
(21, 297),
(25, 297),
(33, 297),
(39, 297),
(58, 297),
(68, 297),
(69, 297),
(82, 297),
(122, 297),
(134, 297),
(137, 297),
(145, 297),
(160, 297),
(170, 297),
(192, 297),
(193, 297),
(215, 297),
(223, 297),
(278, 297),
(282, 297),
(294, 297),
(308, 297),
(309, 297),
(328, 297),
(330, 297),
(333, 297),
(336, 297),
(347, 297),
(349, 297),
(358, 297),
(365, 297),
(393, 297),
(424, 297),
(451, 297),
(487, 297),
(488, 297),
(492, 297),
(38, 298),
(199, 298),
(249, 298),
(305, 298),
(356, 298),
(468, 299),
(326, 300),
(468, 301),
(122, 302),
(350, 302),
(28, 303),
(57, 303),
(85, 303),
(232, 303),
(327, 303),
(344, 303),
(496, 303),
(376, 304),
(147, 305),
(316, 305),
(314, 306),
(106, 307),
(376, 308),
(3, 309),
(104, 309),
(255, 309),
(301, 309),
(356, 309),
(160, 310),
(347, 310),
(141, 311),
(77, 312),
(130, 312),
(199, 312),
(473, 313),
(185, 314),
(182, 315),
(455, 316),
(24, 317),
(111, 317),
(376, 318),
(185, 319),
(130, 320),
(421, 320),
(118, 321),
(390, 321),
(463, 322),
(25, 323),
(347, 323),
(199, 324),
(373, 325),
(473, 325),
(374, 326),
(146, 327),
(185, 328),
(376, 329),
(199, 330),
(347, 331),
(378, 331),
(291, 332),
(347, 332),
(419, 332),
(383, 333),
(88, 334),
(122, 334),
(356, 334),
(424, 334),
(463, 335),
(356, 336),
(199, 337),
(86, 338),
(199, 338),
(356, 339),
(397, 340),
(88, 341),
(151, 341),
(176, 341),
(185, 342),
(130, 343),
(421, 343),
(52, 344),
(324, 344),
(9, 345),
(373, 345),
(473, 345),
(199, 346),
(185, 347),
(123, 348),
(146, 349),
(447, 349),
(376, 350),
(407, 351),
(376, 352),
(463, 353),
(144, 354),
(24, 355),
(110, 356),
(222, 356),
(406, 356),
(463, 356),
(210, 357),
(463, 357),
(468, 357),
(1, 358),
(60, 359),
(159, 359),
(199, 359),
(212, 359),
(226, 359),
(233, 359),
(373, 359),
(406, 359),
(439, 359),
(463, 359),
(478, 359),
(463, 360),
(468, 360),
(473, 361),
(1, 362),
(356, 362),
(1, 363),
(347, 364),
(349, 364),
(421, 365),
(427, 366),
(468, 367),
(77, 368),
(199, 368),
(473, 368),
(477, 368),
(356, 369),
(230, 370),
(465, 370),
(106, 371),
(69, 372),
(347, 372),
(494, 373),
(276, 374),
(447, 375),
(356, 376),
(212, 377),
(417, 377),
(146, 378),
(327, 378),
(468, 379),
(487, 380),
(417, 381),
(89, 382),
(376, 382),
(199, 383),
(376, 384),
(212, 385),
(199, 386),
(468, 386),
(472, 386),
(443, 387),
(282, 388),
(447, 389),
(448, 390),
(89, 391),
(128, 392),
(10, 393),
(347, 393),
(30, 394),
(276, 394),
(472, 394),
(447, 395),
(56, 396),
(84, 397),
(206, 397),
(368, 397),
(456, 397),
(84, 398),
(89, 398),
(155, 398),
(206, 398),
(312, 398),
(189, 399),
(194, 400),
(478, 400),
(326, 401),
(459, 402),
(468, 403),
(146, 404),
(324, 404),
(33, 405),
(460, 406),
(9, 407),
(28, 407),
(30, 407),
(89, 407),
(155, 407),
(186, 407),
(276, 407),
(300, 407),
(479, 407),
(130, 408),
(463, 409),
(269, 410),
(106, 411),
(77, 412),
(222, 412),
(331, 412),
(473, 412),
(313, 413),
(308, 414),
(347, 414),
(463, 414),
(48, 415),
(83, 415),
(106, 415),
(122, 415),
(356, 415),
(424, 415),
(60, 416),
(104, 416),
(463, 416),
(468, 416),
(472, 416),
(468, 417),
(232, 418),
(356, 419),
(3, 420),
(104, 420),
(486, 420),
(374, 421),
(459, 421),
(463, 422),
(470, 422),
(463, 423),
(468, 423),
(243, 424),
(468, 424),
(468, 425),
(472, 425),
(36, 426),
(194, 427),
(478, 427),
(129, 428),
(137, 428),
(349, 428),
(447, 428),
(155, 429),
(186, 429),
(212, 429),
(309, 429),
(347, 429),
(473, 429),
(84, 430),
(368, 430),
(472, 430),
(483, 431),
(466, 432),
(421, 433),
(38, 434),
(52, 434),
(89, 434),
(145, 434),
(223, 434),
(324, 434),
(406, 434),
(257, 435),
(356, 436),
(361, 436),
(491, 437),
(421, 438),
(89, 439),
(406, 439),
(463, 439),
(212, 440),
(468, 440),
(199, 441),
(496, 442),
(36, 443),
(115, 443),
(130, 443),
(326, 443),
(421, 443),
(466, 443),
(470, 443),
(0, 444),
(96, 444),
(288, 444),
(305, 444),
(356, 444),
(361, 444),
(384, 444),
(433, 444),
(497, 445),
(185, 446),
(199, 447),
(36, 448),
(134, 448),
(294, 448),
(347, 448),
(495, 449),
(27, 450),
(22, 451),
(263, 451),
(347, 451),
(347, 452),
(492, 452),
(199, 453),
(104, 454),
(356, 454),
(210, 455),
(106, 456),
(463, 456),
(468, 456),
(463, 457),
(194, 458),
(478, 458),
(374, 459),
(459, 459),
(39, 460),
(58, 460),
(185, 460),
(264, 460),
(269, 460),
(209, 461),
(468, 461),
(201, 462),
(468, 463);

-- --------------------------------------------------------

--
-- Table structure for table `help_topic`
--

CREATE TABLE `help_topic` (
  `help_topic_id` int(10) UNSIGNED NOT NULL,
  `name` char(64) NOT NULL,
  `help_category_id` smallint(5) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `example` text NOT NULL,
  `url` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='help topics';

--
-- Dumping data for table `help_topic`
--

INSERT INTO `help_topic` (`help_topic_id`, `name`, `help_category_id`, `description`, `example`, `url`) VALUES
(0, 'MIN', 16, 'Syntax:\nMIN([DISTINCT] expr)\n\nReturns the minimum value of expr. MIN() may take a string argument; in\nsuch cases, it returns the minimum string value.\nThe DISTINCT keyword can be used to find the minimum of the distinct values\nof expr, however, this produces the same result as omitting DISTINCT.\n\nMIN() returns NULL if there were no matching rows.\n\nURL: https://mariadb.com/kb/en/min/\n\n', 'MariaDB> SELECT student_name, MIN(test_score), MAX(test_score)\n    ->        FROM student\n    ->        GROUP BY student_name;\n', 'https://mariadb.com/kb/en/min/'),
(1, 'JOIN', 27, 'MySQL supports the following JOIN syntaxes for the table_references\npart of SELECT statements and multiple-table DELETE and UPDATE\nstatements:\n\ntable_references:\n    table_reference [, table_reference] ...\n\ntable_reference:\n    table_factor\n  | join_table\n\ntable_factor:\n    tbl_name [[AS] alias] [index_hint_list]\n  | table_subquery [AS] alias\n  | ( table_references )\n  | { OJ table_reference LEFT OUTER JOIN table_reference\n        ON conditional_expr }\n\njoin_table:\n    table_reference [INNER | CROSS] JOIN table_factor [join_condition]\n  | table_reference STRAIGHT_JOIN table_factor\n  | table_reference STRAIGHT_JOIN table_factor ON conditional_expr\n  | table_reference {LEFT|RIGHT} [OUTER] JOIN table_reference join_condition\n  | table_reference NATURAL [{LEFT|RIGHT} [OUTER]] JOIN table_factor\n\njoin_condition:\n    ON conditional_expr\n  | USING (column_list)\n\nindex_hint_list:\n    index_hint [, index_hint] ...\n\nindex_hint:\n    USE {INDEX|KEY}\n      [FOR {JOIN|ORDER BY|GROUP BY}] ([index_list])\n  | IGNORE {INDEX|KEY}\n      [FOR {JOIN|ORDER BY|GROUP BY}] (index_list)\n  | FORCE {INDEX|KEY}\n      [FOR {JOIN|ORDER BY|GROUP BY}] (index_list)\n\nindex_list:\n    index_name [, index_name] ...\n\nA table reference is also known as a join expression.\n\nThe syntax of table_factor is extended in comparison with the SQL\nStandard. The latter accepts only table_reference, not a list of them\ninside a pair of parentheses.\n\nThis is a conservative extension if we consider each comma in a list of\ntable_reference items as equivalent to an inner join. For example:\n\nSELECT * FROM t1 LEFT JOIN (t2, t3, t4)\n                 ON (t2.a=t1.a AND t3.b=t1.b AND t4.c=t1.c)\n\nis equivalent to:\n\nSELECT * FROM t1 LEFT JOIN (t2 CROSS JOIN t3 CROSS JOIN t4)\n                 ON (t2.a=t1.a AND t3.b=t1.b AND t4.c=t1.c)\n\nIn MySQL, JOIN, CROSS JOIN, and INNER JOIN are syntactic equivalents\n(they can replace each other). In standard SQL, they are not\nequivalent. INNER JOIN is used with an ON clause, CROSS JOIN is used\notherwise.\n\nIn general, parentheses can be ignored in join expressions containing\nonly inner join operations.\n\nIndex hints can be specified to affect how the MySQL optimizer makes\nuse of indexes. For more information, see\nhttps://mariadb.com/kb/en/how-to-force-query-plans/.\n\nURL: https://mariadb.com/kb/en/join-syntax/\n\n', 'SELECT left_tbl.*\n  FROM left_tbl LEFT JOIN right_tbl ON left_tbl.id = right_tbl.id\n  WHERE right_tbl.id IS NULL;\n', 'https://mariadb.com/kb/en/join-syntax/'),
(2, 'HEX', 37, 'Syntax:\nHEX(str), HEX(N)\n\nFor a string argument str, HEX() returns a hexadecimal string\nrepresentation of str where each character in str is converted to two\nhexadecimal digits. The inverse of this operation is performed by the\nUNHEX() function.\n\nFor a numeric argument N, HEX() returns a hexadecimal string\nrepresentation of the value of N treated as a longlong (BIGINT) number.\nThis is equivalent to CONV(N,10,16). The inverse of this operation is\nperformed by CONV(HEX(N),16,10).\n\nURL: https://mariadb.com/kb/en/hex/\n\n', 'MariaDB> SELECT 0x616263, HEX(\'abc\'), UNHEX(HEX(\'abc\'));\n        -> \'abc\', 616263, \'abc\'\nMariaDB> SELECT HEX(255), CONV(HEX(255),16,10);\n        -> \'FF\', 255\n', 'https://mariadb.com/kb/en/hex/'),
(3, 'REPLACE', 27, 'Syntax:\nREPLACE [LOW_PRIORITY | DELAYED]\n    [INTO] tbl_name [(col_name,...)]\n    {VALUES | VALUE} ({expr | DEFAULT},...),(...),...\n\nOr:\n\nREPLACE [LOW_PRIORITY | DELAYED]\n    [INTO] tbl_name\n    SET col_name={expr | DEFAULT}, ...\n\nOr:\n\nREPLACE [LOW_PRIORITY | DELAYED]\n    [INTO] tbl_name [(col_name,...)]\n    SELECT ...\n\nREPLACE works exactly like INSERT, except that if an old row in the\ntable has the same value as a new row for a PRIMARY KEY or a UNIQUE\nindex, the old row is deleted before the new row is inserted. See [HELP\nINSERT].\n\nREPLACE is a MySQL extension to the SQL standard. It either inserts, or\ndeletes and inserts. For another MySQL extension to standard SQL---that\neither inserts or updates---see\nhttps://mariadb.com/kb/en/insert-on-duplicate-key-update/.\n\nNote that unless the table has a PRIMARY KEY or UNIQUE index, using a\nREPLACE statement makes no sense. It becomes equivalent to INSERT,\nbecause there is no index to be used to determine whether a new row\nduplicates another.\n\nValues for all columns are taken from the values specified in the\nREPLACE statement. Any missing columns are set to their default values,\njust as happens for INSERT. You cannot refer to values from the current\nrow and use them in the new row. If you use an assignment such as SET\ncol_name = col_name + 1, the reference to the column name on the right\nhand side is treated as DEFAULT(col_name), so the assignment is\nequivalent to SET col_name = DEFAULT(col_name) + 1.\n\nTo use REPLACE, you must have both the INSERT and DELETE privileges for\nthe table.\n\nURL: https://mariadb.com/kb/en/replace/\n\n', '', 'https://mariadb.com/kb/en/replace/'),
(4, 'CONTAINS', 30, 'Contains(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 completely contains g2. This\ntests the opposite relationship as Within().\n\nURL: https://mariadb.com/kb/en/contains/\n\n', '', 'https://mariadb.com/kb/en/contains/'),
(5, 'SRID', 36, 'SRID(g)\n\nReturns an integer indicating the Spatial Reference System ID for the\ngeometry value g.\n\nIn MySQL, the SRID value is just an integer associated with the\ngeometry value. All calculations are done assuming Euclidean (planar)\ngeometry.\n\nURL: https://mariadb.com/kb/en/srid/\n\n', 'MariaDB> SELECT SRID(GeomFromText(\'LineString(1 1,2 2)\',101));\n+-----------------------------------------------+\n| SRID(GeomFromText(\'LineString(1 1,2 2)\',101)) |\n+-----------------------------------------------+\n|                                           101 |\n+-----------------------------------------------+\n', 'https://mariadb.com/kb/en/srid/'),
(6, 'CURRENT_TIMESTAMP', 31, 'Syntax:\nCURRENT_TIMESTAMP, CURRENT_TIMESTAMP()\n\nCURRENT_TIMESTAMP and CURRENT_TIMESTAMP() are synonyms for NOW().\n\nURL: https://mariadb.com/kb/en/current_timestamp/\n\n', '', 'https://mariadb.com/kb/en/current_timestamp/'),
(7, 'SHOW CONTRIBUTORS', 26, 'Syntax:\nSHOW CONTRIBUTORS\n\nThe SHOW CONTRIBUTORS statement displays information about the people\nwho contribute to MySQL source or to causes that we support. For each\ncontributor, it displays Name, Location, and Comment values.\n\nURL: https://mariadb.com/kb/en/show-contributors/\n\n', '', 'https://mariadb.com/kb/en/show-contributors/'),
(8, 'VARIANCE', 16, 'Syntax:\nVARIANCE(expr)\n\nReturns the population standard variance of expr. This is an extension\nto standard SQL. The standard SQL function VAR_POP() can be used\ninstead.\n\nVARIANCE() returns NULL if there were no matching rows.\n\nURL: https://mariadb.com/kb/en/variance/\n\n', '', 'https://mariadb.com/kb/en/variance/'),
(9, 'DROP SERVER', 39, 'Syntax:\nDROP SERVER [ IF EXISTS ] server_name\n\nDrops the server definition for the server named server_name. The\ncorresponding row within the mysql.servers table will be deleted. This\nstatement requires the SUPER privilege.\n\nDropping a server for a table does not affect any FEDERATED tables that\nused this connection information when they were created. See [HELP\nCREATE SERVER].\n\nURL: https://mariadb.com/kb/en/drop-server/\n\n', '', 'https://mariadb.com/kb/en/drop-server/'),
(10, 'SHOW AUTHORS', 26, 'Syntax:\nSHOW AUTHORS\n\nThe SHOW AUTHORS statement displays information about the people who\nwork on MySQL. For each author, it displays Name, Location, and Comment\nvalues.\n\nURL: https://mariadb.com/kb/en/show-authors/\n\n', '', 'https://mariadb.com/kb/en/show-authors/'),
(11, 'VAR_SAMP', 16, 'Syntax:\nVAR_SAMP(expr)\n\nReturns the sample variance of expr. That is, the denominator is the\nnumber of rows minus one.\n\nVAR_SAMP() returns NULL if there were no matching rows.\n\nURL: https://mariadb.com/kb/en/var_samp/\n\n', '', 'https://mariadb.com/kb/en/var_samp/'),
(12, 'CONCAT', 37, 'Syntax:\nCONCAT(str1,str2,...)\n\nReturns the string that results from concatenating the arguments. May\nhave one or more arguments. If all arguments are nonbinary strings, the\nresult is a nonbinary string. If the arguments include any binary\nstrings, the result is a binary string. A numeric argument is converted\nto its equivalent string form. This is a nonbinary string as of MySQL\n5.5.3. Before 5.5.3, it is a binary string; to to avoid that and\nproduce a nonbinary string, you can use an explicit type cast, as in\nthis example:\n\nSELECT CONCAT(CAST(int_col AS CHAR), char_col);\n\nCONCAT() returns NULL if any argument is NULL.\n\nURL: https://mariadb.com/kb/en/concat/\n\n', 'MariaDB> SELECT CONCAT(\'My\', \'S\', \'QL\');\n        -> \'MySQL\'\nMariaDB> SELECT CONCAT(\'My\', NULL, \'QL\');\n        -> NULL\nMariaDB> SELECT CONCAT(14.3);\n        -> \'14.3\'\n', 'https://mariadb.com/kb/en/concat/'),
(13, 'GEOMETRY HIERARCHY', 34, 'Geometry is the base class. It is an abstract class. The instantiable\nsubclasses of Geometry are restricted to zero-, one-, and\ntwo-dimensional geometric objects that exist in two-dimensional\ncoordinate space. All instantiable geometry classes are defined so that\nvalid instances of a geometry class are topologically closed (that is,\nall defined geometries include their boundary).\n\nThe base Geometry class has subclasses for Point, Curve, Surface, and\nGeometryCollection:\n\no Point represents zero-dimensional objects.\n\no Curve represents one-dimensional objects, and has subclass\n  LineString, with sub-subclasses Line and LinearRing.\n\no Surface is designed for two-dimensional objects and has subclass\n  Polygon.\n\no GeometryCollection has specialized zero-, one-, and two-dimensional\n  collection classes named MultiPoint, MultiLineString, and\n  MultiPolygon for modeling geometries corresponding to collections of\n  Points, LineStrings, and Polygons, respectively. MultiCurve and\n  MultiSurface are introduced as abstract superclasses that generalize\n  the collection interfaces to handle Curves and Surfaces.\n\nGeometry, Curve, Surface, MultiCurve, and MultiSurface are defined as\nnoninstantiable classes. They define a common set of methods for their\nsubclasses and are included for extensibility.\n\nPoint, LineString, Polygon, GeometryCollection, MultiPoint,\nMultiLineString, and MultiPolygon are instantiable classes.\n\nURL: https://mariadb.com/kb/en/geometry-hierarchy/\n\n', '', 'https://mariadb.com/kb/en/geometry-hierarchy/'),
(14, 'CHAR FUNCTION', 37, 'Syntax:\nCHAR(N,... [USING charset_name])\n\nCHAR() interprets each argument N as an integer and returns a string\nconsisting of the characters given by the code values of those\nintegers. NULL values are skipped.\nBy default, CHAR() returns a binary string. To produce a string in a\ngiven character set, use the optional USING clause:\n\nMariaDB> SELECT CHARSET(CHAR(0x65)), CHARSET(CHAR(0x65 USING utf8));\n+---------------------+--------------------------------+\n| CHARSET(CHAR(0x65)) | CHARSET(CHAR(0x65 USING utf8)) |\n+---------------------+--------------------------------+\n| binary              | utf8                           |\n+---------------------+--------------------------------+\n\nIf USING is given and the result string is illegal for the given\ncharacter set, a warning is issued. Also, if strict SQL mode is\nenabled, the result from CHAR() becomes NULL.\n\nURL: https://mariadb.com/kb/en/char-function/\n\n', 'MariaDB> SELECT CHAR(77,121,83,81,\'76\');\n        -> \'MySQL\'\nMariaDB> SELECT CHAR(77,77.3,\'77.3\');\n        -> \'MMM\'\n', 'https://mariadb.com/kb/en/char-function/'),
(15, 'DATETIME', 22, 'DATETIME\n\nA date and time combination. The supported range is \'1000-01-01\n00:00:00\' to \'9999-12-31 23:59:59\'. MySQL displays DATETIME values in\n\'YYYY-MM-DD HH:MM:SS\' format, but permits assignment of values to\nDATETIME columns using either strings or numbers.\n\nURL: https://mariadb.com/kb/en/datetime/\n\n', '', 'https://mariadb.com/kb/en/datetime/'),
(16, 'SHOW CREATE TRIGGER', 26, 'Syntax:\nSHOW CREATE TRIGGER trigger_name\n\nThis statement shows a CREATE TRIGGER statement that creates the given\ntrigger.\n\nURL: https://mariadb.com/kb/en/show-create-trigger/\n\n', '', 'https://mariadb.com/kb/en/show-create-trigger/'),
(17, 'SHOW CREATE PROCEDURE', 26, 'Syntax:\nSHOW CREATE PROCEDURE proc_name\n\nThis statement is a MySQL extension. It returns the exact string that\ncan be used to re-create the named stored procedure. A similar\nstatement, SHOW CREATE FUNCTION, displays information about stored\nfunctions (see [HELP SHOW CREATE FUNCTION]).\n\nBoth statements require that you be the owner of the routine or have\nSELECT access to the mysql.proc table. If you do not have privileges\nfor the routine itself, the value displayed for the Create Procedure or\nCreate Function field will be NULL.\n\nURL: https://mariadb.com/kb/en/show-create-procedure/\n\n', 'MariaDB> SHOW CREATE PROCEDURE test.simpleproc\\G\n*************************** 1. row ***************************\n           Procedure: simpleproc\n            sql_mode:\n    Create Procedure: CREATE PROCEDURE `simpleproc`(OUT param1 INT)\n                      BEGIN\n                      SELECT COUNT(*) INTO param1 FROM t;\n                      END\ncharacter_set_client: latin1\ncollation_connection: latin1_swedish_ci\n  Database Collation: latin1_swedish_ci\n\nMariaDB> SHOW CREATE FUNCTION test.hello\\G\n*************************** 1. row ***************************\n            Function: hello\n            sql_mode:\n     Create Function: CREATE FUNCTION `hello`(s CHAR(20))\n                      RETURNS CHAR(50)\n                      RETURN CONCAT(\'Hello, \',s,\'!\')\ncharacter_set_client: latin1\ncollation_connection: latin1_swedish_ci\n  Database Collation: latin1_swedish_ci\n', 'https://mariadb.com/kb/en/show-create-procedure/'),
(18, 'OPEN', 23, 'Syntax:\nOPEN cursor_name\n\nThis statement opens a previously declared cursor. For an example, see\nhttps://mariadb.com/kb/en/cursor-overview/.\n\nURL: https://mariadb.com/kb/en/open/\n\n', '', 'https://mariadb.com/kb/en/open/'),
(19, 'INTEGER', 22, 'INTEGER[(M)] [UNSIGNED] [ZEROFILL]\n\nThis type is a synonym for INT.\n\nURL: https://mariadb.com/kb/en/sql_language-data_types-int\n\n', '', 'https://mariadb.com/kb/en/sql_language-data_types-int'),
(20, 'LOWER', 37, 'Syntax:\nLOWER(str)\n\nReturns the string str with all characters changed to lowercase\naccording to the current character set mapping. The default is latin1\n(cp1252 West European).\n\nMariaDB> SELECT LOWER(\'QUADRATICALLY\');\n        -> \'quadratically\'\n\nLOWER() (and UPPER()) are ineffective when applied to binary strings\n(BINARY, VARBINARY, BLOB). To perform lettercase conversion, convert\nthe string to a nonbinary string:\n\nMariaDB> SET @str = BINARY \'New York\';\nMariaDB> SELECT LOWER(@str), LOWER(CONVERT(@str USING latin1));\n+-------------+-----------------------------------+\n| LOWER(@str) | LOWER(CONVERT(@str USING latin1)) |\n+-------------+-----------------------------------+\n| New York    | new york                          |\n+-------------+-----------------------------------+\n\nURL: https://mariadb.com/kb/en/lower/\n\n', '', 'https://mariadb.com/kb/en/lower/'),
(21, 'SHOW COLUMNS', 26, 'Syntax:\nSHOW [FULL] COLUMNS {FROM | IN} tbl_name [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW COLUMNS displays information about the columns in a given table.\nIt also works for views. The LIKE clause, if present, indicates which\ncolumn names to match. The WHERE clause can be given to select rows\nusing more general conditions, as discussed in\nhttps://mariadb.com/kb/en/extended-show/.\n\nSHOW COLUMNS displays information only for those columns for which you\nhave some privilege.\n\nMariaDB> SHOW COLUMNS FROM City;\n+------------+----------+------+-----+---------+----------------+\n| Field      | Type     | Null | Key | Default | Extra          |\n+------------+----------+------+-----+---------+----------------+\n| Id         | int(11)  | NO   | PRI | NULL    | auto_increment |\n| Name       | char(35) | NO   |     |         |                |\n| Country    | char(3)  | NO   | UNI |         |                |\n| District   | char(20) | YES  | MUL |         |                |\n| Population | int(11)  | NO   |     | 0       |                |\n+------------+----------+------+-----+---------+----------------+\n5 rows in set (0.00 sec)\n\nIf the data types differ from what you expect them to be based on a\nCREATE TABLE statement, note that MySQL sometimes changes data types\nwhen you create or alter a table. The conditions under which this\noccurs are described in\nhttps://mariadb.com/kb/en/silent-column-changes/.\n\nThe FULL keyword causes the output to include the column collation and\ncomments, as well as the privileges you have for each column.\n\nYou can use db_name.tbl_name as an alternative to the tbl_name FROM\ndb_name syntax. In other words, these two statements are equivalent:\n\nMariaDB> SHOW COLUMNS FROM mytable FROM mydb;\nMariaDB> SHOW COLUMNS FROM mydb.mytable;\n\nSHOW COLUMNS displays the following values for each table column:\n\nField indicates the column name.\n\nType indicates the column data type.\n\nCollation indicates the collation for nonbinary string columns, or NULL\nfor other columns. This value is displayed only if you use the FULL\nkeyword.\n\nThe Null field contains YES if NULL values can be stored in the column,\nNO if not.\n\nThe Key field indicates whether the column is indexed:\n\no If Key is empty, the column either is not indexed or is indexed only\n  as a secondary column in a multiple-column, nonunique index.\n\no If Key is PRI, the column is a PRIMARY KEY or is one of the columns\n  in a multiple-column PRIMARY KEY.\n\no If Key is UNI, the column is the first column of a UNIQUE index. (A\n  UNIQUE index permits multiple NULL values, but you can tell whether\n  the column permits NULL by checking the Null field.)\n\no If Key is MUL, the column is the first column of a nonunique index in\n  which multiple occurrences of a given value are permitted within the\n  column.\n\nIf more than one of the Key values applies to a given column of a\ntable, Key displays the one with the highest priority, in the order\nPRI, UNI, MUL.\n\nA UNIQUE index may be displayed as PRI if it cannot contain NULL values\nand there is no PRIMARY KEY in the table. A UNIQUE index may display as\nMUL if several columns form a composite UNIQUE index; although the\ncombination of the columns is unique, each column can still hold\nmultiple occurrences of a given value.\n\nThe Default field indicates the default value that is assigned to the\ncolumn. This is NULL if the column has an explicit default of NULL, or\nif the column definition has no DEFAULT clause.\n\nThe Extra field contains any additional information that is available\nabout a given column. The value is nonempty in these cases:\nauto_increment for columns that have the AUTO_INCREMENT attribute; on\nupdate CURRENT_TIMESTAMP for TIMESTAMP columns that have the ON UPDATE\nCURRENT_TIMESTAMP attribute.\n\nPrivileges indicates the privileges you have for the column. This value\nis displayed only if you use the FULL keyword.\n\nComment indicates any comment the column has. This value is displayed\nonly if you use the FULL keyword.\n\nSHOW FIELDS is a synonym for SHOW COLUMNS. You can also list a table\'s\ncolumns with the mysqlshow db_name tbl_name command.\n\nThe DESCRIBE statement provides information similar to SHOW COLUMNS.\nSee [HELP DESCRIBE].\n\nThe SHOW CREATE TABLE, SHOW TABLE STATUS, and SHOW INDEX statements\nalso provide information about tables. See [HELP SHOW].\n\nURL: https://mariadb.com/kb/en/show-columns/\n\n', '', 'https://mariadb.com/kb/en/show-columns/'),
(22, 'CREATE TRIGGER', 39, 'Syntax:\nCREATE\n    [DEFINER = { user | CURRENT_USER }]\n    TRIGGER trigger_name trigger_time trigger_event\n    ON tbl_name FOR EACH ROW trigger_body\n\nThis statement creates a new trigger. A trigger is a named database\nobject that is associated with a table, and that activates when a\nparticular event occurs for the table. The trigger becomes associated\nwith the table named tbl_name, which must refer to a permanent table.\nYou cannot associate a trigger with a TEMPORARY table or a view.\n\nCREATE TRIGGER requires the TRIGGER privilege for the table associated\nwith the trigger. The statement might also require the SUPER privilege,\ndepending on the DEFINER value, as described later in this section. If\nbinary logging is enabled, CREATE TRIGGER might require the SUPER\nprivilege, as described in\nhttps://mariadb.com/kb/en/binary-logging-of-stored-routines/.\n\nThe DEFINER clause determines the security context to be used when\nchecking access privileges at trigger activation time. See later in\nthis section for more information.\n\ntrigger_time is the trigger action time. It can be BEFORE or AFTER to\nindicate that the trigger activates before or after each row to be\nmodified.\n\ntrigger_event indicates the kind of statement that activates the\ntrigger. The trigger_event can be one of the following:\n\no INSERT: The trigger is activated whenever a new row is inserted into\n  the table; for example, through INSERT, LOAD DATA, and REPLACE\n  statements.\n\no UPDATE: The trigger is activated whenever a row is modified; for\n  example, through UPDATE statements.\n\no DELETE: The trigger is activated whenever a row is deleted from the\n  table; for example, through DELETE and REPLACE statements. However,\n  DROP TABLE and TRUNCATE TABLE statements on the table do not activate\n  this trigger, because they do not use DELETE. Dropping a partition\n  does not activate DELETE triggers, either. See [HELP TRUNCATE TABLE].\n\nURL: https://mariadb.com/kb/en/create-trigger/\n\n', '', 'https://mariadb.com/kb/en/create-trigger/'),
(23, 'MONTH', 31, 'Syntax:\nMONTH(date)\n\nReturns the month for date, in the range 1 to 12 for January to\nDecember, or 0 for dates such as \'0000-00-00\' or \'2008-00-00\' that have\na zero month part.\n\nURL: https://mariadb.com/kb/en/month/\n\n', 'MariaDB> SELECT MONTH(\'2008-02-03\');\n        -> 2\n', 'https://mariadb.com/kb/en/month/'),
(24, 'TINYINT', 22, 'TINYINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA very small integer. The signed range is -128 to 127. The unsigned\nrange is 0 to 255.\n\nURL: https://mariadb.com/kb/en/tinyint/\n\n', '', 'https://mariadb.com/kb/en/tinyint/'),
(25, 'SHOW TRIGGERS', 26, 'Syntax:\nSHOW TRIGGERS [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW TRIGGERS lists the triggers currently defined for tables in a\ndatabase (the default database unless a FROM clause is given). This\nstatement returns results only for databases and tables for which you\nhave the TRIGGER privilege. The LIKE clause, if present, indicates\nwhich table names to match and causes the statement to display triggers\nfor those tables. The WHERE clause can be given to select rows using\nmore general conditions, as discussed in\nhttps://mariadb.com/kb/en/extended-show/.\n\nFor the trigger ins_sum as defined in\nhttps://mariadb.com/kb/en/triggers/, the output of\nthis statement is as shown here:\n\nMariaDB> SHOW TRIGGERS LIKE \'acc%\'\\G\n*************************** 1. row ***************************\n             Trigger: ins_sum\n               Event: INSERT\n               Table: account\n           Statement: SET @sum = @sum + NEW.amount\n              Timing: BEFORE\n             Created: NULL\n            sql_mode:\n             Definer: myname@localhost\ncharacter_set_client: latin1\ncollation_connection: latin1_swedish_ci\n  Database Collation: latin1_swedish_ci\n\ncharacter_set_client is the session value of the character_set_client\nsystem variable when the trigger was created. collation_connection is\nthe session value of the collation_connection system variable when the\ntrigger was created. Database Collation is the collation of the\ndatabase with which the trigger is associated.\n\nURL: https://mariadb.com/kb/en/show-triggers/\n\n', '', 'https://mariadb.com/kb/en/show-triggers/'),
(26, 'MASTER_POS_WAIT', 14, 'Syntax:\nMASTER_POS_WAIT(log_name,log_pos[,timeout])\n\nThis function is useful for control of master/slave synchronization. It\nblocks until the slave has read and applied all updates up to the\nspecified position in the master log. The return value is the number of\nlog events the slave had to wait for to advance to the specified\nposition. The function returns NULL if the slave SQL thread is not\nstarted, the slave\'s master information is not initialized, the\narguments are incorrect, or an error occurs. It returns -1 if the\ntimeout has been exceeded. If the slave SQL thread stops while\nMASTER_POS_WAIT() is waiting, the function returns NULL. If the slave\nis past the specified position, the function returns immediately.\n\nIf a timeout value is specified, MASTER_POS_WAIT() stops waiting when\ntimeout seconds have elapsed. timeout must be greater than 0; a zero or\nnegative timeout means no timeout.\n\nURL: https://mariadb.com/kb/en/master_pos_wait/\n\n', '', 'https://mariadb.com/kb/en/master_pos_wait/'),
(27, 'REGEXP', 37, 'Syntax:\nexpr REGEXP pat, expr RLIKE pat\n\nPerforms a pattern match of a string expression expr against a pattern\npat. The pattern can be an extended regular expression. The syntax for\nregular expressions is discussed in\nhttps://mariadb.com/kb/en/regexp/. Returns 1 if expr\nmatches pat; otherwise it returns 0. If either expr or pat is NULL, the\nresult is NULL. RLIKE is a synonym for REGEXP, provided for mSQL\ncompatibility.\n\nThe pattern need not be a literal string. For example, it can be\nspecified as a string expression or table column.\n\n*Note*: Because MySQL uses the C escape syntax in strings (for example,\n\"\\n\" to represent the newline character), you must double any \"\\\" that\nyou use in your REGEXP strings.\n\nREGEXP is not case sensitive, except when used with binary strings.\n\nURL: https://mariadb.com/kb/en/regexp/\n\n', 'MariaDB> SELECT \'Monty!\' REGEXP \'.*\';\n        -> 1\nMariaDB> SELECT \'new*\\n*line\' REGEXP \'new\\\\*.\\\\*line\';\n        -> 1\nMariaDB> SELECT \'a\' REGEXP \'A\', \'a\' REGEXP BINARY \'A\';\n        -> 1  0\nMariaDB> SELECT \'a\' REGEXP \'^[a-d]\';\n        -> 1\n', 'https://mariadb.com/kb/en/regexp/'),
(28, 'IF STATEMENT', 23, 'Syntax:\nIF search_condition THEN statement_list\n    [ELSEIF search_condition THEN statement_list] ...\n    [ELSE statement_list]\nEND IF\n\nThe IF statement for stored programs implements a basic conditional\nconstruct.\n\n*Note*: There is also an IF() function, which differs from the IF\nstatement described here. See\nhttps://mariadb.com/kb/en/if-function/. The\nIF statement can have THEN, ELSE, and ELSEIF clauses, and it is\nterminated with END IF.\n\nIf the search_condition evaluates to true, the corresponding THEN or\nELSEIF clause statement_list executes. If no search_condition matches,\nthe ELSE clause statement_list executes.\n\nEach statement_list consists of one or more SQL statements; an empty\nstatement_list is not permitted.\n\nURL: https://mariadb.com/kb/en/if-statement/\n\n', '', 'https://mariadb.com/kb/en/if-statement/'),
(29, '^', 19, 'Syntax:\n^\n\nBitwise XOR:\n\nURL: https://mariadb.com/kb/en/bitwise-xor/\n\n', 'MariaDB> SELECT 1 ^ 1;\n        -> 0\nMariaDB> SELECT 1 ^ 0;\n        -> 1\nMariaDB> SELECT 11 ^ 3;\n        -> 8\n', 'https://mariadb.com/kb/en/bitwise-xor/'),
(30, 'DROP VIEW', 39, 'Syntax:\nDROP VIEW [IF EXISTS]\n    view_name [, view_name] ...\n    [RESTRICT | CASCADE]\n\nDROP VIEW removes one or more views. You must have the DROP privilege\nfor each view. If any of the views named in the argument list do not\nexist, MySQL returns an error indicating by name which nonexisting\nviews it was unable to drop, but it also drops all of the views in the\nlist that do exist.\n\nThe IF EXISTS clause prevents an error from occurring for views that\ndon\'t exist. When this clause is given, a NOTE is generated for each\nnonexistent view. See [HELP SHOW WARNINGS].\n\nRESTRICT and CASCADE, if given, are parsed and ignored.\n\nURL: https://mariadb.com/kb/en/drop-view/\n\n', '', 'https://mariadb.com/kb/en/drop-view/'),
(31, 'WITHIN', 30, 'Within(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 is spatially within g2. This\ntests the opposite relationship as Contains().\n\nURL: https://mariadb.com/kb/en/within/\n\n', '', 'https://mariadb.com/kb/en/within/'),
(32, 'WEEK', 31, 'Syntax:\nWEEK(date[,mode])\n\nThis function returns the week number for date. The two-argument form\nof WEEK() enables you to specify whether the week starts on Sunday or\nMonday and whether the return value should be in the range from 0 to 53\nor from 1 to 53. If the mode argument is omitted, the value of the\ndefault_week_format system variable is used. See\nhttps://mariadb.com/kb/en/server-system-variables/.\n\nURL: https://mariadb.com/kb/en/week/\n\n', 'MariaDB> SELECT WEEK(\'2008-02-20\');\n        -> 7\nMariaDB> SELECT WEEK(\'2008-02-20\',0);\n        -> 7\nMariaDB> SELECT WEEK(\'2008-02-20\',1);\n        -> 8\nMariaDB> SELECT WEEK(\'2008-12-31\',1);\n        -> 53\n', 'https://mariadb.com/kb/en/week/'),
(33, 'SHOW PLUGINS', 26, 'Syntax:\nSHOW PLUGINS\n\nSHOW PLUGINS displays information about server plugins. Plugin\ninformation is also available in the INFORMATION_SCHEMA.PLUGINS table.\nSee https://mariadb.com/kb/en/information_schemaplugins-table/.\n\nExample of SHOW PLUGINS output:\n\nMariaDB> SHOW PLUGINS\\G\n*************************** 1. row ***************************\n   Name: binlog\n Status: ACTIVE\n   Type: STORAGE ENGINE\nLibrary: NULL\nLicense: GPL\n*************************** 2. row ***************************\n   Name: CSV\n Status: ACTIVE\n   Type: STORAGE ENGINE\nLibrary: NULL\nLicense: GPL\n*************************** 3. row ***************************\n   Name: MEMORY\n Status: ACTIVE\n   Type: STORAGE ENGINE\nLibrary: NULL\nLicense: GPL\n*************************** 4. row ***************************\n   Name: MyISAM\n Status: ACTIVE\n   Type: STORAGE ENGINE\nLibrary: NULL\nLicense: GPL\n...\n\nURL: https://mariadb.com/kb/en/show-plugins/\n\n', '', 'https://mariadb.com/kb/en/show-plugins/'),
(34, 'DROP FUNCTION UDF', 21, 'Syntax:\nDROP FUNCTION function_name\n\nThis statement drops the user-defined function (UDF) named\nfunction_name.\n\nTo drop a function, you must have the DELETE privilege for the mysql\ndatabase. This is because DROP FUNCTION removes a row from the\nmysql.func system table that records the function\'s name, type, and\nshared library name.\n\nURL: https://mariadb.com/kb/en/drop-function-udf/\n\n', '', 'https://mariadb.com/kb/en/drop-function-udf/'),
(35, 'PREPARE', 8, 'Syntax:\nPREPARE stmt_name FROM preparable_stmt\n\nThe PREPARE statement prepares a statement and assigns it a name,\nstmt_name, by which to refer to the statement later. Statement names\nare not case sensitive. preparable_stmt is either a string literal or a\nuser variable that contains the text of the statement. The text must\nrepresent a single SQL statement, not multiple statements. Within the\nstatement, \"?\" characters can be used as parameter markers to indicate\nwhere data values are to be bound to the query later when you execute\nit. The \"?\" characters should not be enclosed within quotation marks,\neven if you intend to bind them to string values. Parameter markers can\nbe used only where data values should appear, not for SQL keywords,\nidentifiers, and so forth.\n\nIf a prepared statement with the given name already exists, it is\ndeallocated implicitly before the new statement is prepared. This means\nthat if the new statement contains an error and cannot be prepared, an\nerror is returned and no statement with the given name exists.\n\nA prepared statement is executed with EXECUTE and released with\nDEALLOCATE PREPARE.\n\nThe scope of a prepared statement is the session within which it is\ncreated. Other sessions cannot see it.\n\nURL: https://mariadb.com/kb/en/prepare-statement/\n\n', '', 'https://mariadb.com/kb/en/prepare-statement/'),
(36, 'LOCK', 8, 'Syntax:\nLOCK TABLES\n    tbl_name [[AS] alias] lock_type\n    [, tbl_name [[AS] alias] lock_type] ...\n\nlock_type:\n    READ [LOCAL]\n  | [LOW_PRIORITY] WRITE\n\nUNLOCK TABLES\n\nMySQL enables client sessions to acquire table locks explicitly for the\npurpose of cooperating with other sessions for access to tables, or to\nprevent other sessions from modifying tables during periods when a\nsession requires exclusive access to them. A session can acquire or\nrelease locks only for itself. One session cannot acquire locks for\nanother session or release locks held by another session.\n\nLocks may be used to emulate transactions or to get more speed when\nupdating tables. This is explained in more detail later in this\nsection.\n\nLOCK TABLES explicitly acquires table locks for the current client\nsession. Table locks can be acquired for base tables or views. You must\nhave the LOCK TABLES privilege, and the SELECT privilege for each\nobject to be locked.\n\nFor view locking, LOCK TABLES adds all base tables used in the view to\nthe set of tables to be locked and locks them automatically. If you\nlock a table explicitly with LOCK TABLES, any tables used in triggers\nare also locked implicitly, as described in\nhttps://mariadb.com/kb/en/triggers-and-implicit-locks/.\n\nUNLOCK TABLES explicitly releases any table locks held by the current\nsession. LOCK TABLES implicitly releases any table locks held by the\ncurrent session before acquiring new locks.\n\nAnother use for UNLOCK TABLES is to release the global read lock\nacquired with the FLUSH TABLES WITH READ LOCK statement, which enables\nyou to lock all tables in all databases. See [HELP FLUSH]. (This is a\nvery convenient way to get backups if you have a file system such as\nVeritas that can take snapshots in time.)\n\nURL: https://mariadb.com/kb/en/transactions-lock/\n\n', '', 'https://mariadb.com/kb/en/transactions-lock/'),
(37, 'UPDATEXML', 37, 'Syntax:\nUpdateXML(xml_target, xpath_expr, new_xml)\n\nThis function replaces a single portion of a given fragment of XML\nmarkup xml_target with a new XML fragment new_xml, and then returns the\nchanged XML. The portion of xml_target that is replaced matches an\nXPath expression xpath_expr supplied by the user. In MySQL 5.5, the\nXPath expression can contain at most 127 characters. (This limitation\nis lifted in MySQL 5.6.)\n\nIf no expression matching xpath_expr is found, or if multiple matches\nare found, the function returns the original xml_target XML fragment.\nAll three arguments should be strings.\n\nURL: https://mariadb.com/kb/en/updatexml/\n\n', 'MariaDB> SELECT\n    ->   UpdateXML(\'<a><b>ccc</b><d></d></a>\', \'/a\', \'<e>fff</e>\') AS val1,\n    ->   UpdateXML(\'<a><b>ccc</b><d></d></a>\', \'/b\', \'<e>fff</e>\') AS val2,\n    ->   UpdateXML(\'<a><b>ccc</b><d></d></a>\', \'//b\', \'<e>fff</e>\') AS val3,\n    ->   UpdateXML(\'<a><b>ccc</b><d></d></a>\', \'/a/d\', \'<e>fff</e>\') AS val4,\n    ->   UpdateXML(\'<a><d></d><b>ccc</b><d></d></a>\', \'/a/d\', \'<e>fff</e>\') AS val5\n    -> \\G\n\n*************************** 1. row ***************************\nval1: <e>fff</e>\nval2: <a><b>ccc</b><d></d></a>\nval3: <a><e>fff</e><d></d></a>\nval4: <a><b>ccc</b><e>fff</e></a>\nval5: <a><d></d><b>ccc</b><d></d></a>\n', 'https://mariadb.com/kb/en/updatexml/'),
(38, 'RESET SLAVE', 8, 'Syntax:\nRESET SLAVE [ALL]\n\nRESET SLAVE makes the slave forget its replication position in the\nmaster\'s binary log. This statement is meant to be used for a clean\nstart: It deletes the master.info and relay-log.info files, all the\nrelay log files, and starts a new relay log file. To use RESET SLAVE,\nthe slave replication threads must be stopped (use STOP SLAVE if\nnecessary).\n\n*Note*: All relay log files are deleted, even if they have not been\ncompletely executed by the slave SQL thread. (This is a condition\nlikely to exist on a replication slave if you have issued a STOP SLAVE\nstatement or if the slave is highly loaded.)\n\nIn MySQL 5.5 (unlike the case in MySQL 5.1 and earlier), RESET SLAVE\ndoes not change any replication connection parameters such as master\nhost, master port, master user, or master password, which are retained\nin memory. This means that START SLAVE can be issued without requiring\na CHANGE MASTER TO statement following RESET SLAVE.\n\nIn MySQL 5.5.16 and later, you can use RESET SLAVE ALL to reset these\nconnection parameters (Bug #11809016). Connection parameters are also\nreset if the slave mysqld is shut down.\n\nIf the slave SQL thread was in the middle of replicating temporary\ntables when it was stopped, and RESET SLAVE is issued, these replicated\ntemporary tables are deleted on the slave.\n\nURL: https://mariadb.com/kb/en/reset-slave-connection_name/\n\n', '', 'https://mariadb.com/kb/en/reset-slave-connection_name/'),
(39, 'SHOW BINARY LOGS', 26, 'Syntax:\nSHOW BINARY LOGS\nSHOW MASTER LOGS\n\nLists the binary log files on the server. This statement is used as\npart of the procedure described in [HELP PURGE BINARY LOGS], that shows\nhow to determine which logs can be purged.\n\nMariaDB> SHOW BINARY LOGS;\n+---------------+-----------+\n| Log_name      | File_size |\n+---------------+-----------+\n| binlog.000015 |    724935 |\n| binlog.000016 |    733481 |\n+---------------+-----------+\n\nURL: https://mariadb.com/kb/en/show-binary-logs/\n\n', '', 'https://mariadb.com/kb/en/show-binary-logs/'),
(40, 'POLYGON', 24, 'Polygon(ls1,ls2,...)\n\nConstructs a Polygon value from a number of LineString or WKB\nLineString arguments. If any argument does not represent a LinearRing\n(that is, not a closed and simple LineString), the return value is\nNULL.\n\nURL: https://mariadb.com/kb/en/polygon/\n\n', '', 'https://mariadb.com/kb/en/polygon/'),
(41, 'MINUTE', 31, 'Syntax:\nMINUTE(time)\n\nReturns the minute for time, in the range 0 to 59.\n\nURL: https://mariadb.com/kb/en/minute/\n\n', 'MariaDB> SELECT MINUTE(\'2008-02-03 10:05:03\');\n        -> 5\n', 'https://mariadb.com/kb/en/minute/'),
(42, 'DAY', 31, 'Syntax:\nDAY(date)\n\nDAY() is a synonym for DAYOFMONTH().\n\nURL: https://mariadb.com/kb/en/day/\n\n', '', 'https://mariadb.com/kb/en/day/'),
(43, 'MID', 37, 'Syntax:\nMID(str,pos,len)\n\nMID(str,pos,len) is a synonym for SUBSTRING(str,pos,len).\n\nURL: https://mariadb.com/kb/en/mid/\n\n', '', 'https://mariadb.com/kb/en/mid/'),
(44, 'UUID', 14, 'Syntax:\nUUID()\n\nReturns a Universal Unique Identifier (UUID) generated according to\n\"DCE 1.1: Remote Procedure Call\" (Appendix A) CAE (Common Applications\nEnvironment) Specifications published by The Open Group in October 1997\n(Document Number C706,\nhttp://www.opengroup.org/public/pubs/catalog/c706.htm).\n\nA UUID is designed as a number that is globally unique in space and\ntime. Two calls to UUID() are expected to generate two different\nvalues, even if these calls are performed on two separate computers\nthat are not connected to each other.\n\nA UUID is a 128-bit number represented by a utf8 string of five\nhexadecimal numbers in aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee format:\n\no The first three numbers are generated from a timestamp.\n\no The fourth number preserves temporal uniqueness in case the timestamp\n  value loses monotonicity (for example, due to daylight saving time).\n\no The fifth number is an IEEE 802 node number that provides spatial\n  uniqueness. A random number is substituted if the latter is not\n  available (for example, because the host computer has no Ethernet\n  card, or we do not know how to find the hardware address of an\n  interface on your operating system). In this case, spatial uniqueness\n  cannot be guaranteed. Nevertheless, a collision should have very low\n  probability.\n\n  Currently, the MAC address of an interface is taken into account only\n  on FreeBSD and Linux. On other operating systems, MySQL uses a\n  randomly generated 48-bit number.\n\nURL: https://mariadb.com/kb/en/uuid/\n\n', 'MariaDB> SELECT UUID();\n        -> \'6ccd780c-baba-1026-9564-0040f4311e29\'\n', 'https://mariadb.com/kb/en/uuid/'),
(45, 'LINESTRING', 24, 'LineString(pt1,pt2,...)\n\nConstructs a LineString value from a number of Point or WKB Point\narguments. If the number of arguments is less than two, the return\nvalue is NULL.\n\nURL: https://mariadb.com/kb/en/linestring/\n\n', '', 'https://mariadb.com/kb/en/linestring/'),
(46, 'SLEEP', 14, 'Syntax:\nSLEEP(duration)\n\nSleeps (pauses) for the number of seconds given by the duration\nargument, then returns 0. If SLEEP() is interrupted, it returns 1. The\nduration may have a fractional part given in microseconds.\n\nURL: https://mariadb.com/kb/en/sleep/\n\n', '', 'https://mariadb.com/kb/en/sleep/'),
(47, 'CONNECTION_ID', 17, 'Syntax:\nCONNECTION_ID()\n\nReturns the connection ID (thread ID) for the connection. Every\nconnection has an ID that is unique among the set of currently\nconnected clients.\n\nURL: https://mariadb.com/kb/en/connection_id/\n\n', 'MariaDB> SELECT CONNECTION_ID();\n        -> 23786\n', 'https://mariadb.com/kb/en/connection_id/'),
(48, 'DELETE', 27, 'Syntax:\nSingle-table syntax:\n\nDELETE [LOW_PRIORITY] [QUICK] [IGNORE] FROM tbl_name\n    [WHERE where_condition]\n    [ORDER BY ...]\n    [LIMIT row_count]\n\nMultiple-table syntax:\n\nDELETE [LOW_PRIORITY] [QUICK] [IGNORE]\n    tbl_name[.*] [, tbl_name[.*]] ...\n    FROM table_references\n    [WHERE where_condition]\n\nOr:\n\nDELETE [LOW_PRIORITY] [QUICK] [IGNORE]\n    FROM tbl_name[.*] [, tbl_name[.*]] ...\n    USING table_references\n    [WHERE where_condition]\n\nFor the single-table syntax, the DELETE statement deletes rows from\ntbl_name and returns a count of the number of deleted rows. This count\ncan be obtained by calling the ROW_COUNT() function (see\nhttps://mariadb.com/kb/en/information-functions-row_count/). The\nWHERE clause, if given, specifies the conditions that identify which\nrows to delete. With no WHERE clause, all rows are deleted. If the\nORDER BY clause is specified, the rows are deleted in the order that is\nspecified. The LIMIT clause places a limit on the number of rows that\ncan be deleted.\n\nFor the multiple-table syntax, DELETE deletes from each tbl_name the\nrows that satisfy the conditions. In this case, ORDER BY and LIMIT\ncannot be used.\n\nwhere_condition is an expression that evaluates to true for each row to\nbe deleted. It is specified as described in\nhttps://mariadb.com/kb/en/select/.\n\nCurrently, you cannot delete from a table and select from the same\ntable in a subquery.\n\nYou need the DELETE privilege on a table to delete rows from it. You\nneed only the SELECT privilege for any columns that are only read, such\nas those named in the WHERE clause.\n\nAs stated, a DELETE statement with no WHERE clause deletes all rows. A\nfaster way to do this, when you do not need to know the number of\ndeleted rows, is to use TRUNCATE TABLE. However, within a transaction\nor if you have a lock on the table, TRUNCATE TABLE cannot be used\nwhereas DELETE can. See [HELP TRUNCATE TABLE], and [HELP LOCK].\n\nURL: https://mariadb.com/kb/en/delete/\n\n', '', 'https://mariadb.com/kb/en/delete/'),
(49, 'ROUND', 4, 'Syntax:\nROUND(X), ROUND(X,D)\n\nRounds the argument X to D decimal places. The rounding algorithm\ndepends on the data type of X. D defaults to 0 if not specified. D can\nbe negative to cause D digits left of the decimal point of the value X\nto become zero.\n\nURL: https://mariadb.com/kb/en/round/\n\n', 'MariaDB> SELECT ROUND(-1.23);\n        -> -1\nMariaDB> SELECT ROUND(-1.58);\n        -> -2\nMariaDB> SELECT ROUND(1.58);\n        -> 2\nMariaDB> SELECT ROUND(1.298, 1);\n        -> 1.3\nMariaDB> SELECT ROUND(1.298, 0);\n        -> 1\nMariaDB> SELECT ROUND(23.298, -1);\n        -> 20\n', 'https://mariadb.com/kb/en/round/'),
(50, 'NULLIF', 7, 'Syntax:\nNULLIF(expr1,expr2)\n\nReturns NULL if expr1 = expr2 is true, otherwise returns expr1. This is\nthe same as CASE WHEN expr1 = expr2 THEN NULL ELSE expr1 END.\n\nURL: https://mariadb.com/kb/en/nullif/\n\n', 'MariaDB> SELECT NULLIF(1,1);\n        -> NULL\nMariaDB> SELECT NULLIF(1,2);\n        -> 1\n', 'https://mariadb.com/kb/en/nullif/'),
(51, 'CLOSE', 23, 'Syntax:\nCLOSE cursor_name\n\nThis statement closes a previously opened cursor. For an example, see\nhttps://mariadb.com/kb/en/cursor-overview/.\n\nAn error occurs if the cursor is not open.\n\nIf not closed explicitly, a cursor is closed at the end of the BEGIN\n... END block in which it was declared.\n\nURL: https://mariadb.com/kb/en/close/\n\n', '', 'https://mariadb.com/kb/en/close/'),
(52, 'STOP SLAVE', 8, 'Syntax:\nSTOP SLAVE [thread_types]\n\nthread_types:\n    [thread_type [, thread_type] ... ]\n\nthread_type: IO_THREAD | SQL_THREAD\n\nStops the slave threads. STOP SLAVE requires the SUPER privilege.\nRecommended best practice is to execute STOP SLAVE on the slave before\nstopping the slave server (see\nhttp://dev.mysql.com/doc/refman/5.5/en/server-shutdown.html, for more\ninformation).\n\nWhen using the row-based logging format: You should execute STOP SLAVE\non the slave prior to shutting down the slave server if you are\nreplicating any tables that use a nontransactional storage engine (see\nthe Note later in this section). In MySQL 5.5.9 and later, you can also\nuse STOP SLAVE SQL_THREAD for this purpose.\n\nLike START SLAVE, this statement may be used with the IO_THREAD and\nSQL_THREAD options to name the thread or threads to be stopped.\n\n*Note*: In MySQL 5.5, STOP SLAVE waits until the current replication\nevent group affecting one or more non-transactional tables has finished\nexecuting (if there is any such replication group), or until the user\nissues a KILL QUERY or KILL CONNECTION statement. (Bug #319, Bug\n#38205)\n\nURL: https://mariadb.com/kb/en/stop-slave/\n\n', '', 'https://mariadb.com/kb/en/stop-slave/'),
(53, 'TIMEDIFF', 31, 'Syntax:\nTIMEDIFF(expr1,expr2)\n\nTIMEDIFF() returns expr1 - expr2 expressed as a time value. expr1 and\nexpr2 are time or date-and-time expressions, but both must be of the\nsame type.\n\nThe result returned by TIMEDIFF() is limited to the range allowed for\nTIME values. Alternatively, you can use either of the functions\nTIMESTAMPDIFF() and UNIX_TIMESTAMP(), both of which return integers.\n\nURL: https://mariadb.com/kb/en/timediff/\n\n', 'MariaDB> SELECT TIMEDIFF(\'2000:01:01 00:00:00\',\n    ->                 \'2000:01:01 00:00:00.000001\');\n        -> \'-00:00:00.000001\'\nMariaDB> SELECT TIMEDIFF(\'2008-12-31 23:59:59.000001\',\n    ->                 \'2008-12-30 01:01:01.000002\');\n        -> \'46:58:57.999999\'\n', 'https://mariadb.com/kb/en/timediff/'),
(54, 'REPLACE FUNCTION', 37, 'Syntax:\nREPLACE(str,from_str,to_str)\n\nReturns the string str with all occurrences of the string from_str\nreplaced by the string to_str. REPLACE() performs a case-sensitive\nmatch when searching for from_str.\n\nURL: https://mariadb.com/kb/en/replace-function/\n\n', 'MariaDB> SELECT REPLACE(\'www.mariadb.org\', \'w\', \'Ww\');\n        -> \'WwWwWw.mariadb.org\'\n', 'https://mariadb.com/kb/en/replace-function/'),
(55, 'USE', 28, 'Syntax:\nUSE db_name\n\nThe USE db_name statement tells MySQL to use the db_name database as\nthe default (current) database for subsequent statements. The database\nremains the default until the end of the session or another USE\nstatement is issued:\n\nUSE db1;\nSELECT COUNT(*) FROM mytable;   # selects from db1.mytable\nUSE db2;\nSELECT COUNT(*) FROM mytable;   # selects from db2.mytable\n\nURL: https://mariadb.com/kb/en/use/\n\n', '', 'https://mariadb.com/kb/en/use/'),
(56, 'LINEFROMTEXT', 3, 'LineFromText(wkt[,srid]), LineStringFromText(wkt[,srid])\n\nConstructs a LINESTRING value using its WKT representation and SRID.\n\nURL: https://mariadb.com/kb/en/linefromtext/\n\n', '', 'https://mariadb.com/kb/en/linefromtext/'),
(57, 'CASE OPERATOR', 7, 'Syntax:\nCASE value WHEN [compare_value] THEN result [WHEN [compare_value] THEN\nresult ...] [ELSE result] END\n\nCASE WHEN [condition] THEN result [WHEN [condition] THEN result ...]\n[ELSE result] END\n\nThe first version returns the result where value=compare_value. The\nsecond version returns the result for the first condition that is true.\nIf there was no matching result value, the result after ELSE is\nreturned, or NULL if there is no ELSE part.\n\nURL: https://mariadb.com/kb/en/case-operator/\n\n', 'MariaDB> SELECT CASE 1 WHEN 1 THEN \'one\'\n    ->     WHEN 2 THEN \'two\' ELSE \'more\' END;\n        -> \'one\'\nMariaDB> SELECT CASE WHEN 1>0 THEN \'true\' ELSE \'false\' END;\n        -> \'true\'\nMariaDB> SELECT CASE BINARY \'B\'\n    ->     WHEN \'a\' THEN 1 WHEN \'b\' THEN 2 END;\n        -> NULL\n', 'https://mariadb.com/kb/en/case-operator/');
INSERT INTO `help_topic` (`help_topic_id`, `name`, `help_category_id`, `description`, `example`, `url`) VALUES
(58, 'SHOW MASTER STATUS', 26, 'Syntax:\nSHOW MASTER STATUS\n\nThis statement provides status information about the binary log files\nof the master. It requires either the SUPER or REPLICATION CLIENT\nprivilege.\n\nExample:\n\nMariaDB> SHOW MASTER STATUS;\n+---------------+----------+--------------+------------------+\n| File          | Position | Binlog_Do_DB | Binlog_Ignore_DB |\n+---------------+----------+--------------+------------------+\n| mysql-bin.003 | 73       | test         | manual,mysql     |\n+---------------+----------+--------------+------------------+\n\nURL: https://mariadb.com/kb/en/show-master-status/\n\n', '', 'https://mariadb.com/kb/en/show-master-status/'),
(59, 'ADDTIME', 31, 'Syntax:\nADDTIME(expr1,expr2)\n\nADDTIME() adds expr2 to expr1 and returns the result. expr1 is a time\nor datetime expression, and expr2 is a time expression.\n\nURL: https://mariadb.com/kb/en/addtime/\n\n', 'MariaDB> SELECT ADDTIME(\'2007-12-31 23:59:59.999999\', \'1 1:1:1.000002\');\n        -> \'2008-01-02 01:01:01.000001\'\nMariaDB> SELECT ADDTIME(\'01:00:00.999999\', \'02:00:00.999998\');\n        -> \'03:00:01.999997\'\n', 'https://mariadb.com/kb/en/addtime/'),
(60, 'SPATIAL', 34, 'For MyISAM tables, MySQL can create spatial indexes using syntax\nsimilar to that for creating regular indexes, but extended with the\nSPATIAL keyword. Currently, columns in spatial indexes must be declared\nNOT NULL. The following examples demonstrate how to create spatial\nindexes:\n\no With CREATE TABLE:\n\nCREATE TABLE geom (g GEOMETRY NOT NULL, SPATIAL INDEX(g)) ENGINE=MyISAM;\n\no With ALTER TABLE:\n\nALTER TABLE geom ADD SPATIAL INDEX(g);\n\no With CREATE INDEX:\n\nCREATE SPATIAL INDEX sp_index ON geom (g);\n\nFor MyISAM tables, SPATIAL INDEX creates an R-tree index. For storage\nengines that support nonspatial indexing of spatial columns, the engine\ncreates a B-tree index. A B-tree index on spatial values will be useful\nfor exact-value lookups, but not for range scans.\n\nFor more information on indexing spatial columns, see [HELP CREATE\nINDEX].\n\nTo drop spatial indexes, use ALTER TABLE or DROP INDEX:\n\no With ALTER TABLE:\n\nALTER TABLE geom DROP INDEX g;\n\no With DROP INDEX:\n\nDROP INDEX sp_index ON geom;\n\nExample: Suppose that a table geom contains more than 32,000\ngeometries, which are stored in the column g of type GEOMETRY. The\ntable also has an AUTO_INCREMENT column fid for storing object ID\nvalues.\n\nURL: https://mariadb.com/kb/en/spatial/\n\n', '', 'https://mariadb.com/kb/en/spatial/'),
(61, 'TO_SECONDS', 31, 'Syntax:\nTO_SECONDS(expr)\n\nGiven a date or datetime expr, returns a the number of seconds since\nthe year 0. If expr is not a valid date or datetime value, returns\nNULL.\n\nURL: https://mariadb.com/kb/en/to_seconds/\n\n', 'MariaDB> SELECT TO_SECONDS(950501);\n        -> 62966505600\nMariaDB> SELECT TO_SECONDS(\'2009-11-29\');\n        -> 63426672000\nMariaDB> SELECT TO_SECONDS(\'2009-11-29 13:43:32\');\n        -> 63426721412\nMariaDB> SELECT TO_SECONDS( NOW() );\n        -> 63426721458\n', 'https://mariadb.com/kb/en/to_seconds/'),
(62, 'TIMESTAMPDIFF', 31, 'Syntax:\nTIMESTAMPDIFF(unit,datetime_expr1,datetime_expr2)\n\nReturns datetime_expr2 - datetime_expr1, where datetime_expr1 and\ndatetime_expr2 are date or datetime expressions. One expression may be\na date and the other a datetime; a date value is treated as a datetime\nhaving the time part \'00:00:00\' where necessary. The unit for the\nresult (an integer) is given by the unit argument. The legal values for\nunit are the same as those listed in the description of the\nTIMESTAMPADD() function.\n\nURL: https://mariadb.com/kb/en/timestampdiff/\n\n', 'MariaDB> SELECT TIMESTAMPDIFF(MONTH,\'2003-02-01\',\'2003-05-01\');\n        -> 3\nMariaDB> SELECT TIMESTAMPDIFF(YEAR,\'2002-05-01\',\'2001-01-01\');\n        -> -1\nMariaDB> SELECT TIMESTAMPDIFF(MINUTE,\'2003-02-01\',\'2003-05-01 12:05:55\');\n        -> 128885\n', 'https://mariadb.com/kb/en/timestampdiff/'),
(63, 'UPPER', 37, 'Syntax:\nUPPER(str)\n\nReturns the string str with all characters changed to uppercase\naccording to the current character set mapping. The default is latin1\n(cp1252 West European).\n\nMariaDB> SELECT UPPER(\'Hej\');\n        -> \'HEJ\'\n\nSee the description of LOWER() for information that also applies to\nUPPER(), such as information about how to perform lettercase conversion\nof binary strings (BINARY, VARBINARY, BLOB) for which these functions\nare ineffective.\n\nURL: https://mariadb.com/kb/en/upper/\n\n', '', 'https://mariadb.com/kb/en/upper/'),
(64, 'FROM_UNIXTIME', 31, 'Syntax:\nFROM_UNIXTIME(unix_timestamp), FROM_UNIXTIME(unix_timestamp,format)\n\nReturns a representation of the unix_timestamp argument as a value in\n\'YYYY-MM-DD HH:MM:SS\' or YYYYMMDDHHMMSS.uuuuuu format, depending on\nwhether the function is used in a string or numeric context. The value\nis expressed in the current time zone. unix_timestamp is an internal\ntimestamp value such as is produced by the UNIX_TIMESTAMP() function.\n\nIf format is given, the result is formatted according to the format\nstring, which is used the same way as listed in the entry for the\nDATE_FORMAT() function.\n\nURL: https://mariadb.com/kb/en/from_unixtime/\n\n', 'MariaDB> SELECT FROM_UNIXTIME(1196440219);\n        -> \'2007-11-30 10:30:19\'\nMariaDB> SELECT FROM_UNIXTIME(1196440219) + 0;\n        -> 20071130103019.000000\nMariaDB> SELECT FROM_UNIXTIME(UNIX_TIMESTAMP(),\n    ->                      \'%Y %D %M %h:%i:%s %x\');\n        -> \'2007 30th November 10:30:59 2007\'\n', 'https://mariadb.com/kb/en/from_unixtime/'),
(65, 'MEDIUMBLOB', 22, 'MEDIUMBLOB\n\nA BLOB column with a maximum length of 16,777,215 (224 - 1) bytes. Each\nMEDIUMBLOB value is stored using a 3-byte length prefix that indicates\nthe number of bytes in the value.\n\nURL: https://mariadb.com/kb/en/mediumblob/\n\n', '', 'https://mariadb.com/kb/en/mediumblob/'),
(66, 'SHA2', 12, 'Syntax:\nSHA2(str, hash_length)\n\nCalculates the SHA-2 family of hash functions (SHA-224, SHA-256,\nSHA-384, and SHA-512). The first argument is the cleartext string to be\nhashed. The second argument indicates the desired bit length of the\nresult, which must have a value of 224, 256, 384, 512, or 0 (which is\nequivalent to 256). If either argument is NULL or the hash length is\nnot one of the permitted values, the return value is NULL. Otherwise,\nthe function result is a hash value containing the desired number of\nbits. See the notes at the beginning of this section about storing hash\nvalues efficiently.\n\nAs of MySQL 5.5.6, the return value is a nonbinary string in the\nconnection character set. Before 5.5.6, the return value is a binary\nstring; see the notes at the beginning of this section about using the\nvalue as a nonbinary string.\n\nURL: https://mariadb.com/kb/en/sha2/\n\n', 'MariaDB> SELECT SHA2(\'abc\', 224);\n        -> \'23097d223405d8228642a477bda255b32aadbce4bda0b3f7e36c9da7\'\n', 'https://mariadb.com/kb/en/sha2/'),
(67, 'IFNULL', 7, 'Syntax:\nIFNULL(expr1,expr2)\n\nIf expr1 is not NULL, IFNULL() returns expr1; otherwise it returns\nexpr2. IFNULL() returns a numeric or string value, depending on the\ncontext in which it is used.\n\nURL: https://mariadb.com/kb/en/ifnull/\n\n', 'MariaDB> SELECT IFNULL(1,0);\n        -> 1\nMariaDB> SELECT IFNULL(NULL,10);\n        -> 10\nMariaDB> SELECT IFNULL(1/0,10);\n        -> 10\nMariaDB> SELECT IFNULL(1/0,\'yes\');\n        -> \'yes\'\n', 'https://mariadb.com/kb/en/ifnull/'),
(68, 'SHOW FUNCTION CODE', 26, 'Syntax:\nSHOW FUNCTION CODE func_name\n\nThis statement is similar to SHOW PROCEDURE CODE but for stored\nfunctions. See [HELP SHOW PROCEDURE CODE].\n\nURL: https://mariadb.com/kb/en/show-function-code/\n\n', '', 'https://mariadb.com/kb/en/show-function-code/'),
(69, 'SHOW ERRORS', 26, 'Syntax:\nSHOW ERRORS [LIMIT [offset,] row_count]\nSHOW COUNT(*) ERRORS\n\nThis statement is similar to SHOW WARNINGS, except that it displays\ninformation only for errors, rather than for errors, warnings, and\nnotes.\n\nThe LIMIT clause has the same syntax as for the SELECT statement. See\nhttps://mariadb.com/kb/en/select/.\n\nThe SHOW COUNT(*) ERRORS statement displays the number of errors. You\ncan also retrieve this number from the error_count variable:\n\nSHOW COUNT(*) ERRORS;\nSELECT @@error_count;\n\nSHOW ERRORS and error_count apply only to errors, not warnings or\nnotes. In other respects, they are similar to SHOW WARNINGS and\nwarning_count. In particular, SHOW ERRORS cannot display information\nfor more than max_error_count messages, and error_count can exceed the\nvalue of max_error_count if the number of errors exceeds\nmax_error_count.\n\nURL: https://mariadb.com/kb/en/show-errors/\n\n', '', 'https://mariadb.com/kb/en/show-errors/'),
(70, 'LEAST', 18, 'Syntax:\nLEAST(value1,value2,...)\n\nWith two or more arguments, returns the smallest (minimum-valued)\nargument. The arguments are compared using the following rules:\n\no If any argument is NULL, the result is NULL. No comparison is needed.\n\no If the return value is used in an INTEGER context or all arguments\n  are integer-valued, they are compared as integers.\n\no If the return value is used in a REAL context or all arguments are\n  real-valued, they are compared as reals.\n\no If the arguments comprise a mix of numbers and strings, they are\n  compared as numbers.\n\no If any argument is a nonbinary (character) string, the arguments are\n  compared as nonbinary strings.\n\no In all other cases, the arguments are compared as binary strings.\n\nURL: https://mariadb.com/kb/en/least/\n\n', 'MariaDB> SELECT LEAST(2,0);\n        -> 0\nMariaDB> SELECT LEAST(34.0,3.0,5.0,767.0);\n        -> 3.0\nMariaDB> SELECT LEAST(\'B\',\'A\',\'C\');\n        -> \'A\'\n', 'https://mariadb.com/kb/en/least/'),
(71, '=', 18, '=\n\nEqual:\n\nURL: https://mariadb.com/kb/en/equal/\n\n', 'MariaDB> SELECT 1 = 0;\n        -> 0\nMariaDB> SELECT \'0\' = 0;\n        -> 1\nMariaDB> SELECT \'0.0\' = 0;\n        -> 1\nMariaDB> SELECT \'0.01\' = 0;\n        -> 0\nMariaDB> SELECT \'.01\' = 0.01;\n        -> 1\n', 'https://mariadb.com/kb/en/equal/'),
(72, 'REVERSE', 37, 'Syntax:\nREVERSE(str)\n\nReturns the string str with the order of the characters reversed.\n\nURL: https://mariadb.com/kb/en/reverse/\n\n', 'MariaDB> SELECT REVERSE(\'abc\');\n        -> \'cba\'\n', 'https://mariadb.com/kb/en/reverse/'),
(73, 'ISNULL', 18, 'Syntax:\nISNULL(expr)\n\nIf expr is NULL, ISNULL() returns 1, otherwise it returns 0.\n\nURL: https://mariadb.com/kb/en/isnull/\n\n', 'MariaDB> SELECT ISNULL(1+1);\n        -> 0\nMariaDB> SELECT ISNULL(1/0);\n        -> 1\n', 'https://mariadb.com/kb/en/isnull/'),
(74, 'BINARY', 22, 'BINARY(M)\n\nThe BINARY type is similar to the CHAR type, but stores binary byte\nstrings rather than nonbinary character strings. M represents the\ncolumn length in bytes.\n\nURL: https://mariadb.com/kb/en/binary/\n\n', '', 'https://mariadb.com/kb/en/binary/'),
(75, 'BLOB DATA TYPE', 22, 'A BLOB is a binary large object that can hold a variable amount of\ndata. The four BLOB types are TINYBLOB, BLOB, MEDIUMBLOB, and LONGBLOB.\nThese differ only in the maximum length of the values they can hold.\nThe four TEXT types are TINYTEXT, TEXT, MEDIUMTEXT, and LONGTEXT. These\ncorrespond to the four BLOB types and have the same maximum lengths and\nstorage requirements. See\nhttps://mariadb.com/kb/en/data-type-storage-requirements/.\n\nURL: https://mariadb.com/kb/en/sql_language-data_types-blob/\n\n', '', 'https://mariadb.com/kb/en/sql_language-data_types-blob/'),
(76, 'BOUNDARY', 36, 'Boundary(g)\n\nReturns a geometry that is the closure of the combinatorial boundary of\nthe geometry value g.\n\nURL: https://mariadb.com/kb/en/boundary/\n\n', '', 'https://mariadb.com/kb/en/boundary/'),
(77, 'CREATE USER', 10, 'Syntax:\nCREATE USER user_specification\n    [, user_specification] ...\n\nuser_specification:\n    user\n    [\n        IDENTIFIED BY [PASSWORD] \'password\'\n      | IDENTIFIED WITH auth_plugin [AS \'auth_string\']\n    ]\n\nThe CREATE USER statement creates new MySQL accounts. To use it, you\nmust have the global CREATE USER privilege or the INSERT privilege for\nthe mysql database. For each account, CREATE USER creates a new row in\nthe mysql.user table and assigns the account no privileges. An error\noccurs if the account already exists.\n\nEach account name uses the format described in\nhttps://mariadb.com/kb/en/create-user#account-names. For example:\n\nCREATE USER \'jeffrey\'@\'localhost\' IDENTIFIED BY \'mypass\';\n\nIf you specify only the user name part of the account name, a host name\npart of \'%\' is used.\n\nThe user specification may indicate how the user should authenticate\nwhen connecting to the server:\n\no To enable the user to connect with no password (which is insecure),\n  include no IDENTIFIED BY clause:\n\nCREATE USER \'jeffrey\'@\'localhost\';\n\n  In this case, the account uses built-in authentication and clients\n  must provide no password.\n\no To assign a password, use IDENTIFIED BY with the literal plaintext\n  password value:\n\nCREATE USER \'jeffrey\'@\'localhost\' IDENTIFIED BY \'mypass\';\n\n  The account uses built-in authentication and clients must match the\n  given password.\n\no To avoid specifying the plaintext password if you know its hash value\n  (the value that PASSWORD() would return for the password), specify\n  the hash value preceded by the keyword PASSWORD:\n\nCREATE USER \'jeffrey\'@\'localhost\'\nIDENTIFIED BY PASSWORD \'*90E462C37378CED12064BB3388827D2BA3A9B689\';\n\n  The account uses built-in authentication and clients must match the\n  given password.\n\no To authenticate the account using a specific authentication plugin,\n  use IDENTIFIED WITH, where auth_plugin is the plugin name. It can be\n  an unquoted name or a quoted string literal. \'auth_string\' is an\n  optional quoted string literal to pass to the plugin. The plugin\n  interprets the meaning of the string, so its format is plugin\n  specific. Consult the documentation for a given plugin for\n  information about the authentication string values it accepts.\n\nCREATE USER \'jeffrey\'@\'localhost\'\nIDENTIFIED WITH my_auth_plugin;\n\n  For connections that use this account, the server invokes the named\n  plugin and clients must provide credentials as required for the\n  authentication method that the plugin implements. If the server\n  cannot find the plugin, either at account-creation time or connect\n  time, an error occurs. IDENTIFIED WITH can be used as of MySQL 5.5.7.\n\nThe IDENTIFIED BY and IDENTIFIED WITH clauses are mutually exclusive,\nso at most one of them can be specified for a given user.\n\nFor additional information about setting passwords, see\nhttps://mariadb.com/kb/en/create-user/.\n\nURL: https://mariadb.com/kb/en/create-user/\n\n', '', 'https://mariadb.com/kb/en/create-user/'),
(78, 'POINT', 24, 'Point(x,y)\n\nConstructs a Point using its coordinates.\n\nURL: https://mariadb.com/kb/en/point/\n\n', '', 'https://mariadb.com/kb/en/point/'),
(79, 'CURRENT_USER', 17, 'Syntax:\nCURRENT_USER, CURRENT_USER()\n\nReturns the user name and host name combination for the MySQL account\nthat the server used to authenticate the current client. This account\ndetermines your access privileges. The return value is a string in the\nutf8 character set.\n\nThe value of CURRENT_USER() can differ from the value of USER().\n\nURL: https://mariadb.com/kb/en/current_user/\n\n', 'MariaDB> SELECT USER();\n        -> \'davida@localhost\'\nMariaDB> SELECT * FROM mysql.user;\nERROR 1044: Access denied for user \'\'@\'localhost\' to\ndatabase \'mysql\'\nMariaDB> SELECT CURRENT_USER();\n        -> \'@localhost\'\n', 'https://mariadb.com/kb/en/current_user/'),
(80, 'LCASE', 37, 'Syntax:\nLCASE(str)\n\nLCASE() is a synonym for LOWER().\n\nURL: https://mariadb.com/kb/en/lcase/\n\n', '', 'https://mariadb.com/kb/en/lcase/'),
(81, '<=', 18, 'Syntax:\n<=\n\nLess than or equal:\n\nURL: https://mariadb.com/kb/en/less-than-or-equal/\n\n', 'MariaDB> SELECT 0.1 <= 2;\n        -> 1\n', 'https://mariadb.com/kb/en/less-than-or-equal/'),
(82, 'SHOW PROFILES', 26, 'Syntax:\nSHOW PROFILES\n\nThe SHOW PROFILES statement, together with SHOW PROFILE, displays\nprofiling information that indicates resource usage for statements\nexecuted during the course of the current session. For more\ninformation, see [HELP SHOW PROFILE].\n\nURL: https://mariadb.com/kb/en/show-profiles/\n\n', '', 'https://mariadb.com/kb/en/show-profiles/'),
(83, 'UPDATE', 27, 'Syntax:\nSingle-table syntax:\n\nUPDATE [LOW_PRIORITY] [IGNORE] table_reference\n    SET col_name1={expr1|DEFAULT} [, col_name2={expr2|DEFAULT}] ...\n    [WHERE where_condition]\n    [ORDER BY ...]\n    [LIMIT row_count]\n\nMultiple-table syntax:\n\nUPDATE [LOW_PRIORITY] [IGNORE] table_references\n    SET col_name1={expr1|DEFAULT} [, col_name2={expr2|DEFAULT}] ...\n    [WHERE where_condition]\n\nFor the single-table syntax, the UPDATE statement updates columns of\nexisting rows in the named table with new values. The SET clause\nindicates which columns to modify and the values they should be given.\nEach value can be given as an expression, or the keyword DEFAULT to set\na column explicitly to its default value. The WHERE clause, if given,\nspecifies the conditions that identify which rows to update. With no\nWHERE clause, all rows are updated. If the ORDER BY clause is\nspecified, the rows are updated in the order that is specified. The\nLIMIT clause places a limit on the number of rows that can be updated.\n\nFor the multiple-table syntax, UPDATE updates rows in each table named\nin table_references that satisfy the conditions. In this case, ORDER BY\nand LIMIT cannot be used.\n\nwhere_condition is an expression that evaluates to true for each row to\nbe updated. For expression syntax, see\nhttp://dev.mysql.com/doc/refman/5.5/en/expressions.html.\n\ntable_references and where_condition are is specified as described in\nhttps://mariadb.com/kb/en/select/.\n\nYou need the UPDATE privilege only for columns referenced in an UPDATE\nthat are actually updated. You need only the SELECT privilege for any\ncolumns that are read but not modified.\n\nThe UPDATE statement supports the following modifiers:\n\no With the LOW_PRIORITY keyword, execution of the UPDATE is delayed\n  until no other clients are reading from the table. This affects only\n  storage engines that use only table-level locking (such as MyISAM,\n  MEMORY, and MERGE).\n\no With the IGNORE keyword, the update statement does not abort even if\n  errors occur during the update. Rows for which duplicate-key\n  conflicts occur are not updated. Rows for which columns are updated\n  to values that would cause data conversion errors are updated to the\n  closest valid values instead.\n\nURL: https://mariadb.com/kb/en/update/\n\n', '', 'https://mariadb.com/kb/en/update/'),
(84, 'IS NOT NULL', 18, 'Syntax:\nIS NOT NULL\n\nTests whether a value is not NULL.\n\nURL: https://mariadb.com/kb/en/is-not-null/\n\n', 'MariaDB> SELECT 1 IS NOT NULL, 0 IS NOT NULL, NULL IS NOT NULL;\n        -> 1, 1, 0\n', 'https://mariadb.com/kb/en/is-not-null/'),
(85, 'CASE STATEMENT', 23, 'Syntax:\nCASE case_value\n    WHEN when_value THEN statement_list\n    [WHEN when_value THEN statement_list] ...\n    [ELSE statement_list]\nEND CASE\n\nOr:\n\nCASE\n    WHEN search_condition THEN statement_list\n    [WHEN search_condition THEN statement_list] ...\n    [ELSE statement_list]\nEND CASE\n\nThe CASE statement for stored programs implements a complex conditional\nconstruct.\n\n*Note*: There is also a CASE expression, which differs from the CASE\nstatement described here. See\nhttps://mariadb.com/kb/en/case-operator/. The\nCASE statement cannot have an ELSE NULL clause, and it is terminated\nwith END CASE instead of END.\n\nFor the first syntax, case_value is an expression. This value is\ncompared to the when_value expression in each WHEN clause until one of\nthem is equal. When an equal when_value is found, the corresponding\nTHEN clause statement_list executes. If no when_value is equal, the\nELSE clause statement_list executes, if there is one.\n\nThis syntax cannot be used to test for equality with NULL because NULL\n= NULL is false. See\nhttps://mariadb.com/kb/en/null-values/.\n\nFor the second syntax, each WHEN clause search_condition expression is\nevaluated until one is true, at which point its corresponding THEN\nclause statement_list executes. If no search_condition is equal, the\nELSE clause statement_list executes, if there is one.\n\nIf no when_value or search_condition matches the value tested and the\nCASE statement contains no ELSE clause, a Case not found for CASE\nstatement error results.\n\nEach statement_list consists of one or more SQL statements; an empty\nstatement_list is not permitted.\n\nTo handle situations where no value is matched by any WHEN clause, use\nan ELSE containing an empty BEGIN ... END block, as shown in this\nexample. (The indentation used here in the ELSE clause is for purposes\nof clarity only, and is not otherwise significant.)\n\nDELIMITER |\n\nCREATE PROCEDURE p()\n  BEGIN\n    DECLARE v INT DEFAULT 1;\n\n    CASE v\n      WHEN 2 THEN SELECT v;\n      WHEN 3 THEN SELECT 0;\n      ELSE\n        BEGIN\n        END;\n    END CASE;\n  END;\n  |\n\nURL: https://mariadb.com/kb/en/case-statement/\n\n', '', 'https://mariadb.com/kb/en/case-statement/'),
(86, 'EXECUTE STATEMENT', 8, 'Syntax:\nEXECUTE stmt_name\n    [USING @var_name [, @var_name] ...]\n\nAfter preparing a statement with PREPARE, you execute it with an\nEXECUTE statement that refers to the prepared statement name. If the\nprepared statement contains any parameter markers, you must supply a\nUSING clause that lists user variables containing the values to be\nbound to the parameters. Parameter values can be supplied only by user\nvariables, and the USING clause must name exactly as many variables as\nthe number of parameter markers in the statement.\n\nYou can execute a given prepared statement multiple times, passing\ndifferent variables to it or setting the variables to different values\nbefore each execution.\n\nURL: https://mariadb.com/kb/en/execute-statement/\n\n', '', 'https://mariadb.com/kb/en/execute-statement/'),
(87, 'DROP INDEX', 39, 'Syntax:\nDROP [ONLINE|OFFLINE] INDEX index_name ON tbl_name\n\nDROP INDEX drops the index named index_name from the table tbl_name.\nThis statement is mapped to an ALTER TABLE statement to drop the index.\nSee [HELP ALTER TABLE].\n\nTo drop a primary key, the index name is always PRIMARY, which must be\nspecified as a quoted identifier because PRIMARY is a reserved word:\n\nDROP INDEX `PRIMARY` ON t;\n\nURL: https://mariadb.com/kb/en/drop-index/\n\n', '', 'https://mariadb.com/kb/en/drop-index/'),
(88, 'MATCH AGAINST', 37, 'Syntax:\nMATCH (col1,col2,...) AGAINST (expr [search_modifier])\n\nMySQL has support for full-text indexing and searching:\n\no A full-text index in MySQL is an index of type FULLTEXT.\n\no Full-text indexes can be used only with MyISAM tables, and can be\n  created only for CHAR, VARCHAR, or TEXT columns.\n\no A FULLTEXT index definition can be given in the CREATE TABLE\n  statement when a table is created, or added later using ALTER TABLE\n  or CREATE INDEX.\n\no For large data sets, it is much faster to load your data into a table\n  that has no FULLTEXT index and then create the index after that, than\n  to load data into a table that has an existing FULLTEXT index.\n\nFull-text searching is performed using MATCH() ... AGAINST syntax.\nMATCH() takes a comma-separated list that names the columns to be\nsearched. AGAINST takes a string to search for, and an optional\nmodifier that indicates what type of search to perform. The search\nstring must be a literal string, not a variable or a column name. There\nare three types of full-text searches:\n\no A natural language search interprets the search string as a phrase in\n  natural human language (a phrase in free text). There are no special\n  operators. The stopword list applies. In addition, words that are\n  present in 50% or more of the rows are considered common and do not\n  match.\n\n  Full-text searches are natural language searches if the IN NATURAL\n  LANGUAGE MODE modifier is given or if no modifier is given. For more\n  information, see\n  https://mariadb.com/kb/en/fulltext-index-overview#in-natural-language-mode\n  .\n\no A boolean search interprets the search string using the rules of a\n  special query language. The string contains the words to search for.\n  It can also contain operators that specify requirements such that a\n  word must be present or absent in matching rows, or that it should be\n  weighted higher or lower than usual. Common words such as \"some\" or\n  \"then\" are stopwords and do not match if present in the search\n  string. The IN BOOLEAN MODE modifier specifies a boolean search. For\n  more information, see\n  https://mariadb.com/kb/en/fulltext-index-overview#in-boolean-mode.\n\no A query expansion search is a modification of a natural language\n  search. The search string is used to perform a natural language\n  search. Then words from the most relevant rows returned by the search\n  are added to the search string and the search is done again. The\n  query returns the rows from the second search. The IN NATURAL\n  LANGUAGE MODE WITH QUERY EXPANSION or WITH QUERY EXPANSION modifier\n  specifies a query expansion search. For more information, see\n  https://mariadb.com/kb/en/fulltext-index-overview#with-query-expansion.\n\nURL: https://mariadb.com/kb/en/match-against/\n\n', 'MariaDB> SELECT id, body, MATCH (title,body) AGAINST\n    -> (\'Security implications of running MySQL as root\'\n    -> IN NATURAL LANGUAGE MODE) AS score\n    -> FROM articles WHERE MATCH (title,body) AGAINST\n    -> (\'Security implications of running MySQL as root\'\n    -> IN NATURAL LANGUAGE MODE);\n+----+-------------------------------------+-----------------+\n| id | body                                | score           |\n+----+-------------------------------------+-----------------+\n|  4 | 1. Never run mysqld as root. 2. ... | 1.5219271183014 |\n|  6 | When configured properly, MySQL ... | 1.3114095926285 |\n+----+-------------------------------------+-----------------+\n2 rows in set (0.00 sec)\n', 'https://mariadb.com/kb/en/match-against/'),
(89, 'CREATE EVENT', 39, 'Syntax:\nCREATE\n    [DEFINER = { user | CURRENT_USER }]\n    EVENT\n    [IF NOT EXISTS]\n    event_name\n    ON SCHEDULE schedule\n    [ON COMPLETION [NOT] PRESERVE]\n    [ENABLE | DISABLE | DISABLE ON SLAVE]\n    [COMMENT \'comment\']\n    DO event_body;\n\nschedule:\n    AT timestamp [+ INTERVAL interval] ...\n  | EVERY interval\n    [STARTS timestamp [+ INTERVAL interval] ...]\n    [ENDS timestamp [+ INTERVAL interval] ...]\n\ninterval:\n    quantity {YEAR | QUARTER | MONTH | DAY | HOUR | MINUTE |\n              WEEK | SECOND | YEAR_MONTH | DAY_HOUR | DAY_MINUTE |\n              DAY_SECOND | HOUR_MINUTE | HOUR_SECOND | MINUTE_SECOND}\n\nThis statement creates and schedules a new event. The event will not\nrun unless the Event Scheduler is enabled. For information about\nchecking Event Scheduler status and enabling it if necessary, see\nhttps://mariadb.com/kb/en/events/.\n\nCREATE EVENT requires the EVENT privilege for the schema in which the\nevent is to be created. It might also require the SUPER privilege,\ndepending on the DEFINER value, as described later in this section.\n\nThe minimum requirements for a valid CREATE EVENT statement are as\nfollows:\n\no The keywords CREATE EVENT plus an event name, which uniquely\n  identifies the event in a database schema.\n\no An ON SCHEDULE clause, which determines when and how often the event\n  executes.\n\no A DO clause, which contains the SQL statement to be executed by an\n  event.\n\nThis is an example of a minimal CREATE EVENT statement:\n\nCREATE EVENT myevent\n    ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 HOUR\n    DO\n      UPDATE myschema.mytable SET mycol = mycol + 1;\n\nThe previous statement creates an event named myevent. This event\nexecutes once---one hour following its creation---by running an SQL\nstatement that increments the value of the myschema.mytable table\'s\nmycol column by 1.\n\nThe event_name must be a valid MySQL identifier with a maximum length\nof 64 characters. Event names are not case sensitive, so you cannot\nhave two events named myevent and MyEvent in the same schema. In\ngeneral, the rules governing event names are the same as those for\nnames of stored routines. See\nhttps://mariadb.com/kb/en/identifier-names/.\n\nAn event is associated with a schema. If no schema is indicated as part\nof event_name, the default (current) schema is assumed. To create an\nevent in a specific schema, qualify the event name with a schema using\nschema_name.event_name syntax.\n\nURL: https://mariadb.com/kb/en/create-event/\n\n', '', 'https://mariadb.com/kb/en/create-event/'),
(90, 'ABS', 4, 'Syntax:\nABS(X)\n\nReturns the absolute value of X.\n\nURL: https://mariadb.com/kb/en/abs/\n\n', 'MariaDB> SELECT ABS(2);\n        -> 2\nMariaDB> SELECT ABS(-32);\n        -> 32\n', 'https://mariadb.com/kb/en/abs/'),
(91, 'POLYFROMWKB', 32, 'PolyFromWKB(wkb[,srid]), PolygonFromWKB(wkb[,srid])\n\nConstructs a POLYGON value using its WKB representation and SRID.\n\nURL: https://mariadb.com/kb/en/polyfromwkb/\n\n', '', 'https://mariadb.com/kb/en/polyfromwkb/'),
(92, 'NOT LIKE', 37, 'Syntax:\nexpr NOT LIKE pat [ESCAPE \'escape_char\']\n\nThis is the same as NOT (expr LIKE pat [ESCAPE \'escape_char\']).\n\nURL: https://mariadb.com/kb/en/not-like/\n\n', '', 'https://mariadb.com/kb/en/not-like/'),
(93, 'SPACE', 37, 'Syntax:\nSPACE(N)\n\nReturns a string consisting of N space characters.\n\nURL: https://mariadb.com/kb/en/space/\n\n', 'MariaDB> SELECT SPACE(6);\n        -> \'      \'\n', 'https://mariadb.com/kb/en/space/'),
(94, 'MBR DEFINITION', 6, 'Its MBR (Minimum Bounding Rectangle), or Envelope. This is the bounding\ngeometry, formed by the minimum and maximum (X,Y) coordinates:\n\nURL: https://mariadb.com/kb/en/mbr-definition/\n\n', '((MINX MINY, MAXX MINY, MAXX MAXY, MINX MAXY, MINX MINY))\n', 'https://mariadb.com/kb/en/mbr-definition/'),
(95, 'GEOMETRYCOLLECTION', 24, 'GeometryCollection(g1,g2,...)\n\nConstructs a GeometryCollection.\n\nURL: https://mariadb.com/kb/en/geometrycollection/\n\n', '', 'https://mariadb.com/kb/en/geometrycollection/'),
(96, 'MAX', 16, 'Syntax:\nMAX([DISTINCT] expr)\n\nReturns the maximum value of expr. MAX() may take a string argument; in\nsuch cases, it returns the maximum string value. See\nhttps://mariadb.com/kb/en/max/. The DISTINCT\nkeyword can be used to find the maximum of the distinct values of expr,\nhowever, this produces the same result as omitting DISTINCT.\n\nMAX() returns NULL if there were no matching rows.\n\nURL: https://mariadb.com/kb/en/max/\n\n', 'MariaDB> SELECT student_name, MIN(test_score), MAX(test_score)\n    ->        FROM student\n    ->        GROUP BY student_name;\n', 'https://mariadb.com/kb/en/max/'),
(97, 'CREATE FUNCTION UDF', 21, 'Syntax:\nCREATE [AGGREGATE] FUNCTION function_name RETURNS {STRING|INTEGER|REAL|DECIMAL}\n    SONAME shared_library_name\n\nA user-defined function (UDF) is a way to extend MySQL with a new\nfunction that works like a native (built-in) MySQL function such as\nABS() or CONCAT().\n\nfunction_name is the name that should be used in SQL statements to\ninvoke the function. The RETURNS clause indicates the type of the\nfunction\'s return value. DECIMAL is a legal value after RETURNS, but\ncurrently DECIMAL functions return string values and should be written\nlike STRING functions.\n\nshared_library_name is the basename of the shared object file that\ncontains the code that implements the function. The file must be\nlocated in the plugin directory. This directory is given by the value\nof the plugin_dir system variable. For more information, see\nhttp://dev.mysql.com/doc/refman/5.5/en/udf-compiling.html.\n\nTo create a function, you must have the INSERT privilege for the mysql\ndatabase. This is necessary because CREATE FUNCTION adds a row to the\nmysql.func system table that records the function\'s name, type, and\nshared library name. If you do not have this table, you should run the\nmysql_upgrade command to create it. See\nhttps://mariadb.com/kb/en/mysql_upgrade/.\n\nURL: https://mariadb.com/kb/en/create-function-udf/\n\n', '', 'https://mariadb.com/kb/en/create-function-udf/'),
(98, '*', 4, 'Syntax:\n*\n\nMultiplication:\n\nURL: https://mariadb.com/kb/en/multiplication-operator/\n\n', 'MariaDB> SELECT 3*5;\n        -> 15\nMariaDB> SELECT 18014398509481984*18014398509481984.0;\n        -> 324518553658426726783156020576256.0\nMariaDB> SELECT 18014398509481984*18014398509481984;\n        -> 0\n', 'https://mariadb.com/kb/en/multiplication-operator/'),
(99, 'TIMESTAMP', 22, 'TIMESTAMP\n\nA timestamp. The range is \'1970-01-01 00:00:01\' UTC to \'2038-01-19\n03:14:07\' UTC. TIMESTAMP values are stored as the number of seconds\nsince the epoch (\'1970-01-01 00:00:00\' UTC). A TIMESTAMP cannot\nrepresent the value \'1970-01-01 00:00:00\' because that is equivalent to\n0 seconds from the epoch and the value 0 is reserved for representing\n\'0000-00-00 00:00:00\', the \"zero\" TIMESTAMP value.\n\nUnless specified otherwise, the first TIMESTAMP column in a table is\ndefined to be automatically set to the date and time of the most recent\nmodification if not explicitly assigned a value. This makes TIMESTAMP\nuseful for recording the timestamp of an INSERT or UPDATE operation.\nYou can also set any TIMESTAMP column to the current date and time by\nassigning it a NULL value, unless it has been defined with the NULL\nattribute to permit NULL values. The automatic initialization and\nupdating to the current date and time can be specified using DEFAULT\nCURRENT_TIMESTAMP and ON UPDATE CURRENT_TIMESTAMP clauses, as described\nin\nhttps://mariadb.com/kb/en/timestamp/.\n\n*Note*: The TIMESTAMP format that was used prior to MySQL 4.1 is not\nsupported in MySQL 5.5; see MySQL 3.23, 4.0, 4.1 Reference Manual for\ninformation regarding the old format.\n\nURL: https://mariadb.com/kb/en/timestamp/\n\n', '', 'https://mariadb.com/kb/en/timestamp/'),
(100, 'DES_DECRYPT', 12, 'Syntax:\nDES_DECRYPT(crypt_str[,key_str])\n\nDecrypts a string encrypted with DES_ENCRYPT(). If an error occurs,\nthis function returns NULL.\n\nThis function works only if MySQL has been configured with SSL support.\nSee https://mariadb.com/kb/en/ssl-connections/.\n\nIf no key_str argument is given, DES_DECRYPT() examines the first byte\nof the encrypted string to determine the DES key number that was used\nto encrypt the original string, and then reads the key from the DES key\nfile to decrypt the message. For this to work, the user must have the\nSUPER privilege. The key file can be specified with the --des-key-file\nserver option.\n\nIf you pass this function a key_str argument, that string is used as\nthe key for decrypting the message.\n\nIf the crypt_str argument does not appear to be an encrypted string,\nMySQL returns the given crypt_str.\n\nURL: https://mariadb.com/kb/en/des_decrypt/\n\n', '', 'https://mariadb.com/kb/en/des_decrypt/'),
(101, 'CACHE INDEX', 26, 'Syntax:\nCACHE INDEX\n  tbl_index_list [, tbl_index_list] ...\n  [PARTITION (partition_list | ALL)]\n  IN key_cache_name\n\ntbl_index_list:\n  tbl_name [[INDEX|KEY] (index_name[, index_name] ...)]\n\npartition_list:\n  partition_name[, partition_name][, ...]\n\nThe CACHE INDEX statement assigns table indexes to a specific key\ncache. It is used only for MyISAM tables. After the indexes have been\nassigned, they can be preloaded into the cache if desired with LOAD\nINDEX INTO CACHE.\n\nThe following statement assigns indexes from the tables t1, t2, and t3\nto the key cache named hot_cache:\n\nMariaDB> CACHE INDEX t1, t2, t3 IN hot_cache;\n+---------+--------------------+----------+----------+\n| Table   | Op                 | Msg_type | Msg_text |\n+---------+--------------------+----------+----------+\n| test.t1 | assign_to_keycache | status   | OK       |\n| test.t2 | assign_to_keycache | status   | OK       |\n| test.t3 | assign_to_keycache | status   | OK       |\n+---------+--------------------+----------+----------+\n\nURL: https://mariadb.com/kb/en/cache-index/\n\n', '', 'https://mariadb.com/kb/en/cache-index/'),
(102, 'ENDPOINT', 13, 'EndPoint(ls)\n\nReturns the Point that is the endpoint of the LineString value ls.\n\nURL: https://mariadb.com/kb/en/endpoint/\n\n', 'MariaDB> SET @ls = \'LineString(1 1,2 2,3 3)\';\nMariaDB> SELECT AsText(EndPoint(GeomFromText(@ls)));\n+-------------------------------------+\n| AsText(EndPoint(GeomFromText(@ls))) |\n+-------------------------------------+\n| POINT(3 3)                          |\n+-------------------------------------+\n', 'https://mariadb.com/kb/en/endpoint/'),
(103, 'COMPRESS', 12, 'Syntax:\nCOMPRESS(string_to_compress)\n\nCompresses a string and returns the result as a binary string. This\nfunction requires MySQL to have been compiled with a compression\nlibrary such as zlib. Otherwise, the return value is always NULL. The\ncompressed string can be uncompressed with UNCOMPRESS().\n\nURL: https://mariadb.com/kb/en/compress/\n\n', 'MariaDB> SELECT LENGTH(COMPRESS(REPEAT(\'a\',1000)));\n        -> 21\nMariaDB> SELECT LENGTH(COMPRESS(\'\'));\n        -> 0\nMariaDB> SELECT LENGTH(COMPRESS(\'a\'));\n        -> 13\nMariaDB> SELECT LENGTH(COMPRESS(REPEAT(\'a\',16)));\n        -> 15\n', 'https://mariadb.com/kb/en/compress/'),
(104, 'INSERT', 27, 'Syntax:\nINSERT [LOW_PRIORITY | DELAYED | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name [(col_name,...)]\n    {VALUES | VALUE} ({expr | DEFAULT},...),(...),...\n    [ ON DUPLICATE KEY UPDATE\n      col_name=expr\n        [, col_name=expr] ... ]\n\nOr:\n\nINSERT [LOW_PRIORITY | DELAYED | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name\n    SET col_name={expr | DEFAULT}, ...\n    [ ON DUPLICATE KEY UPDATE\n      col_name=expr\n        [, col_name=expr] ... ]\n\nOr:\n\nINSERT [LOW_PRIORITY | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name [(col_name,...)]\n    SELECT ...\n    [ ON DUPLICATE KEY UPDATE\n      col_name=expr\n        [, col_name=expr] ... ]\n\nINSERT inserts new rows into an existing table. The INSERT ... VALUES\nand INSERT ... SET forms of the statement insert rows based on\nexplicitly specified values. The INSERT ... SELECT form inserts rows\nselected from another table or tables. INSERT ... SELECT is discussed\nfurther in [HELP INSERT SELECT].\n\nURL: https://mariadb.com/kb/en/insert/\n\n', '', 'https://mariadb.com/kb/en/insert/'),
(105, 'COUNT', 16, 'Syntax:\nCOUNT(expr)\n\nReturns a count of the number of non-NULL values of expr in the rows\nretrieved by a SELECT statement. The result is a BIGINT value.\n\nCOUNT() returns 0 if there were no matching rows.\n\nURL: https://mariadb.com/kb/en/count/\n\n', 'MariaDB> SELECT student.student_name,COUNT(*)\n    ->        FROM student,course\n    ->        WHERE student.student_id=course.student_id\n    ->        GROUP BY student_name;\n', 'https://mariadb.com/kb/en/count/'),
(106, 'HANDLER', 27, 'Syntax:\nHANDLER tbl_name OPEN [ [AS] alias]\n\nHANDLER tbl_name READ index_name { = | <= | >= | < | > } (value1,value2,...)\n    [ WHERE where_condition ] [LIMIT ... ]\nHANDLER tbl_name READ index_name { FIRST | NEXT | PREV | LAST }\n    [ WHERE where_condition ] [LIMIT ... ]\nHANDLER tbl_name READ { FIRST | NEXT }\n    [ WHERE where_condition ] [LIMIT ... ]\n\nHANDLER tbl_name CLOSE\n\nThe HANDLER statement provides direct access to table storage engine\ninterfaces. It is available for MyISAM and InnoDB tables.\n\nURL: https://mariadb.com/kb/en/handler-commands/\n\n', '', 'https://mariadb.com/kb/en/handler-commands/'),
(107, 'MLINEFROMTEXT', 3, 'MLineFromText(wkt[,srid]), MultiLineStringFromText(wkt[,srid])\n\nConstructs a MULTILINESTRING value using its WKT representation and\nSRID.\n\nURL: https://mariadb.com/kb/en/mlinefromtext/\n\n', '', 'https://mariadb.com/kb/en/mlinefromtext/'),
(108, 'GEOMCOLLFROMWKB', 32, 'GeomCollFromWKB(wkb[,srid]), GeometryCollectionFromWKB(wkb[,srid])\n\nConstructs a GEOMETRYCOLLECTION value using its WKB representation and\nSRID.\n\nURL: https://mariadb.com/kb/en/geomcollfromwkb/\n\n', '', 'https://mariadb.com/kb/en/geomcollfromwkb/'),
(109, 'HELP_DATE', 9, 'This help information was generated from the MySQL 5.5 Reference Manual\non: 2012-08-25\n', '', ''),
(110, 'RENAME TABLE', 39, 'Syntax:\nRENAME TABLE tbl_name TO new_tbl_name\n    [, tbl_name2 TO new_tbl_name2] ...\n\nThis statement renames one or more tables.\n\nThe rename operation is done atomically, which means that no other\nsession can access any of the tables while the rename is running. For\nexample, if you have an existing table old_table, you can create\nanother table new_table that has the same structure but is empty, and\nthen replace the existing table with the empty one as follows (assuming\nthat backup_table does not already exist):\n\nURL: https://mariadb.com/kb/en/rename-table/\n\n', 'CREATE TABLE new_table (...);\nRENAME TABLE old_table TO backup_table, new_table TO old_table;\n', 'https://mariadb.com/kb/en/rename-table/'),
(111, 'BOOLEAN', 22, 'BOOL, BOOLEAN\n\nThese types are synonyms for TINYINT(1). A value of zero is considered\nfalse. Nonzero values are considered true:\n\nMariaDB> SELECT IF(0, \'true\', \'false\');\n+------------------------+\n| IF(0, \'true\', \'false\') |\n+------------------------+\n| false                  |\n+------------------------+\n\nMariaDB> SELECT IF(1, \'true\', \'false\');\n+------------------------+\n| IF(1, \'true\', \'false\') |\n+------------------------+\n| true                   |\n+------------------------+\n\nMariaDB> SELECT IF(2, \'true\', \'false\');\n+------------------------+\n| IF(2, \'true\', \'false\') |\n+------------------------+\n| true                   |\n+------------------------+\n\nHowever, the values TRUE and FALSE are merely aliases for 1 and 0,\nrespectively, as shown here:\n\nMariaDB> SELECT IF(0 = FALSE, \'true\', \'false\');\n+--------------------------------+\n| IF(0 = FALSE, \'true\', \'false\') |\n+--------------------------------+\n| true                           |\n+--------------------------------+\n\nMariaDB> SELECT IF(1 = TRUE, \'true\', \'false\');\n+-------------------------------+\n| IF(1 = TRUE, \'true\', \'false\') |\n+-------------------------------+\n| true                          |\n+-------------------------------+\n\nMariaDB> SELECT IF(2 = TRUE, \'true\', \'false\');\n+-------------------------------+\n| IF(2 = TRUE, \'true\', \'false\') |\n+-------------------------------+\n| false                         |\n+-------------------------------+\n\nMariaDB> SELECT IF(2 = FALSE, \'true\', \'false\');\n+--------------------------------+\n| IF(2 = FALSE, \'true\', \'false\') |\n+--------------------------------+\n| false                          |\n+--------------------------------+\n\nThe last two statements display the results shown because 2 is equal to\nneither 1 nor 0.\n\nURL: https://mariadb.com/kb/en/boolean/\n\n', '', 'https://mariadb.com/kb/en/boolean/'),
(112, 'DEFAULT', 14, 'Syntax:\nDEFAULT(col_name)\n\nReturns the default value for a table column. An error results if the\ncolumn has no default value.\n\nURL: https://mariadb.com/kb/en/default/\n\n', 'MariaDB> UPDATE t SET i = DEFAULT(i)+1 WHERE id < 100;\n', 'https://mariadb.com/kb/en/default/'),
(113, 'MOD', 4, 'Syntax:\nMOD(N,M), N % M, N MOD M\n\nModulo operation. Returns the remainder of N divided by M.\n\nURL: https://mariadb.com/kb/en/mod/\n\n', 'MariaDB> SELECT MOD(234, 10);\n        -> 4\nMariaDB> SELECT 253 % 7;\n        -> 1\nMariaDB> SELECT MOD(29,9);\n        -> 2\nMariaDB> SELECT 29 MOD 9;\n        -> 2\n', 'https://mariadb.com/kb/en/mod/'),
(114, 'TINYTEXT', 22, 'TINYTEXT [CHARACTER SET charset_name] [COLLATE collation_name]\n\nA TEXT column with a maximum length of 255 (28 - 1) characters. The\neffective maximum length is less if the value contains multi-byte\ncharacters. Each TINYTEXT value is stored using a 1-byte length prefix\nthat indicates the number of bytes in the value.\n\nURL: https://mariadb.com/kb/en/tinytext/\n\n', '', 'https://mariadb.com/kb/en/tinytext/'),
(115, 'OPTIMIZE TABLE', 20, 'Syntax:\nOPTIMIZE [NO_WRITE_TO_BINLOG | LOCAL] TABLE\n    tbl_name [, tbl_name] ...\n\nOPTIMIZE TABLE should be used if you have deleted a large part of a\ntable or if you have made many changes to a table with variable-length\nrows (tables that have VARCHAR, VARBINARY, BLOB, or TEXT columns).\nDeleted rows are maintained in a linked list and subsequent INSERT\noperations reuse old row positions. You can use OPTIMIZE TABLE to\nreclaim the unused space and to defragment the data file. After\nextensive changes to a table, this statement may also improve\nperformance of statements that use the table, sometimes significantly.\n\nThis statement requires SELECT and INSERT privileges for the table.\n\nOPTIMIZE TABLE is supported for partitioned tables, and you can use\nALTER TABLE ... OPTIMIZE PARTITION to optimize one or more partitions;\nfor more information, see [HELP ALTER TABLE], and\nhttp://dev.mysql.com/doc/refman/5.5/en/partitioning-maintenance.html.\n\nURL: https://mariadb.com/kb/en/optimize-table/\n\n', '', 'https://mariadb.com/kb/en/optimize-table/'),
(116, 'DECODE', 12, 'Syntax:\nDECODE(crypt_str,pass_str)\n\nDecrypts the encrypted string crypt_str using pass_str as the password.\ncrypt_str should be a string returned from ENCODE().\n\nURL: https://mariadb.com/kb/en/decode/\n\n', '', 'https://mariadb.com/kb/en/decode/'),
(117, '<=>', 18, 'Syntax:\n<=>\n\nNULL-safe equal. This operator performs an equality comparison like the\n= operator, but returns 1 rather than NULL if both operands are NULL,\nand 0 rather than NULL if one operand is NULL.\n\nURL: https://mariadb.com/kb/en/null-safe-equal/\n\n', 'MariaDB> SELECT 1 <=> 1, NULL <=> NULL, 1 <=> NULL;\n        -> 1, 1, 0\nMariaDB> SELECT 1 = 1, NULL = NULL, 1 = NULL;\n        -> 1, NULL, NULL\n', 'https://mariadb.com/kb/en/null-safe-equal/'),
(118, 'HELP STATEMENT', 28, 'Syntax:\nHELP \'search_string\'\n\nThe HELP statement returns online information from the MySQL Reference\nmanual. Its proper operation requires that the help tables in the mysql\ndatabase be initialized with help topic information.\n\nThe HELP statement searches the help tables for the given search string\nand displays the result of the search. The search string is not case\nsensitive.\n\nURL: https://mariadb.com/kb/en/help-command/\n\n', '', 'https://mariadb.com/kb/en/help-command/'),
(119, 'RESET', 26, 'Syntax:\nRESET reset_option [, reset_option] ...\n\nThe RESET statement is used to clear the state of various server\noperations. You must have the RELOAD privilege to execute RESET.\n\nRESET acts as a stronger version of the FLUSH statement. See [HELP\nFLUSH].\n\nThe RESET statement causes an implicit commit. See\nhttps://mariadb.com/kb/en/sql-statements-that-cause-an-implicit-commit/.\n\nURL: https://mariadb.com/kb/en/reset/\n\n', '', 'https://mariadb.com/kb/en/reset/'),
(120, 'GET_LOCK', 14, 'Syntax:\nGET_LOCK(str,timeout)\n\nTries to obtain a lock with a name given by the string str, using a\ntimeout of timeout seconds. Returns 1 if the lock was obtained\nsuccessfully, 0 if the attempt timed out (for example, because another\nclient has previously locked the name), or NULL if an error occurred\n(such as running out of memory or the thread was killed with mysqladmin\nkill). If you have a lock obtained with GET_LOCK(), it is released when\nyou execute RELEASE_LOCK(), execute a new GET_LOCK(), or your\nconnection terminates (either normally or abnormally). Locks obtained\nwith GET_LOCK() do not interact with transactions. That is, committing\na transaction does not release any such locks obtained during the\ntransaction.\n\nThis function can be used to implement application locks or to simulate\nrecord locks. Names are locked on a server-wide basis. If a name has\nbeen locked by one client, GET_LOCK() blocks any request by another\nclient for a lock with the same name. This enables clients that agree\non a given lock name to use the name to perform cooperative advisory\nlocking. But be aware that it also enables a client that is not among\nthe set of cooperating clients to lock a name, either inadvertently or\ndeliberately, and thus prevent any of the cooperating clients from\nlocking that name. One way to reduce the likelihood of this is to use\nlock names that are database-specific or application-specific. For\nexample, use lock names of the form db_name.str or app_name.str.\n\nURL: https://mariadb.com/kb/en/get_lock/\n\n', 'MariaDB> SELECT GET_LOCK(\'lock1\',10);\n        -> 1\nMariaDB> SELECT IS_FREE_LOCK(\'lock2\');\n        -> 1\nMariaDB> SELECT GET_LOCK(\'lock2\',10);\n        -> 1\nMariaDB> SELECT RELEASE_LOCK(\'lock2\');\n        -> 1\nMariaDB> SELECT RELEASE_LOCK(\'lock1\');\n        -> NULL\n', 'https://mariadb.com/kb/en/get_lock/'),
(121, 'UCASE', 37, 'Syntax:\nUCASE(str)\n\nUCASE() is a synonym for UPPER().\n\nURL: https://mariadb.com/kb/en/ucase/\n\n', '', 'https://mariadb.com/kb/en/ucase/'),
(122, 'SHOW BINLOG EVENTS', 26, 'Syntax:\nSHOW BINLOG EVENTS\n   [IN \'log_name\'] [FROM pos] [LIMIT [offset,] row_count]\n\nShows the events in the binary log. If you do not specify \'log_name\',\nthe first binary log is displayed.\n\nURL: https://mariadb.com/kb/en/show-binlog-events/\n\n', '', 'https://mariadb.com/kb/en/show-binlog-events/'),
(123, 'MPOLYFROMWKB', 32, 'MPolyFromWKB(wkb[,srid]), MultiPolygonFromWKB(wkb[,srid])\n\nConstructs a MULTIPOLYGON value using its WKB representation and SRID.\n\nURL: https://mariadb.com/kb/en/mpolyfromwkb/\n\n', '', 'https://mariadb.com/kb/en/mpolyfromwkb/');
INSERT INTO `help_topic` (`help_topic_id`, `name`, `help_category_id`, `description`, `example`, `url`) VALUES
(124, 'ITERATE', 23, 'Syntax:\nITERATE label\n\nITERATE can appear only within LOOP, REPEAT, and WHILE statements.\nITERATE means \"start the loop again.\"\n\nURL: https://mariadb.com/kb/en/iterate/\n\n', '', 'https://mariadb.com/kb/en/iterate/'),
(125, 'DO', 27, 'Syntax:\nDO expr [, expr] ...\n\nDO executes the expressions but does not return any results. In most\nrespects, DO is shorthand for SELECT expr, ..., but has the advantage\nthat it is slightly faster when you do not care about the result.\n\nDO is useful primarily with functions that have side effects, such as\nRELEASE_LOCK().\n\nURL: https://mariadb.com/kb/en/do/\n\n', '', 'https://mariadb.com/kb/en/do/'),
(126, 'CURTIME', 31, 'Syntax:\nCURTIME()\n\nReturns the current time as a value in \'HH:MM:SS\' or HHMMSS.uuuuuu\nformat, depending on whether the function is used in a string or\nnumeric context. The value is expressed in the current time zone.\n\nURL: https://mariadb.com/kb/en/curtime/\n\n', 'MariaDB> SELECT CURTIME();\n        -> \'23:50:26\'\nMariaDB> SELECT CURTIME() + 0;\n        -> 235026.000000\n', 'https://mariadb.com/kb/en/curtime/'),
(127, 'CHAR_LENGTH', 37, 'Syntax:\nCHAR_LENGTH(str)\n\nReturns the length of the string str, measured in characters. A\nmulti-byte character counts as a single character. This means that for\na string containing five 2-byte characters, LENGTH() returns 10,\nwhereas CHAR_LENGTH() returns 5.\n\nURL: https://mariadb.com/kb/en/char_length/\n\n', '', 'https://mariadb.com/kb/en/char_length/'),
(128, 'BIGINT', 22, 'BIGINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA large integer. The signed range is -9223372036854775808 to\n9223372036854775807. The unsigned range is 0 to 18446744073709551615.\n\nSERIAL is an alias for BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE.\n\nURL: https://mariadb.com/kb/en/bigint/\n\n', '', 'https://mariadb.com/kb/en/bigint/'),
(129, 'SET', 26, 'Syntax:\nSET variable_assignment [, variable_assignment] ...\n\nvariable_assignment:\n      user_var_name = expr\n    | [GLOBAL | SESSION] system_var_name = expr\n    | [@@global. | @@session. | @@]system_var_name = expr\n\nThe SET statement assigns values to different types of variables that\naffect the operation of the server or your client. Older versions of\nMySQL employed SET OPTION, but this syntax is deprecated in favor of\nSET without OPTION.\n\nURL: https://mariadb.com/kb/en/set/\n\n', '', 'https://mariadb.com/kb/en/set/'),
(130, 'LOAD XML', 27, 'Syntax:\nLOAD XML [LOW_PRIORITY | CONCURRENT] [LOCAL] INFILE \'file_name\'\n    [REPLACE | IGNORE]\n    INTO TABLE [db_name.]tbl_name\n    [CHARACTER SET charset_name]\n    [ROWS IDENTIFIED BY \'<tagname>\']\n    [IGNORE number {LINES | ROWS}]\n    [(column_or_user_var,...)]\n    [SET col_name = expr,...]\n\nThe LOAD XML statement reads data from an XML file into a table. The\nfile_name must be given as a literal string. The tagname in the\noptional ROWS IDENTIFIED BY clause must also be given as a literal\nstring, and must be surrounded by angle brackets (< and >).\n\nLOAD XML acts as the complement of running the mysql client in XML\noutput mode (that is, starting the client with the --xml option). To\nwrite data from a table to an XML file, use a command such as the\nfollowing one from the system shell:\n\nshell> mysql --xml -e \'SELECT * FROM mytable\' > file.xml\n\nTo read the file back into a table, use LOAD XML INFILE. By default,\nthe <row> element is considered to be the equivalent of a database\ntable row; this can be changed using the ROWS IDENTIFIED BY clause.\n\nThis statement supports three different XML formats:\n\no Column names as attributes and column values as attribute values:\n\n<row column1=\"value1\" column2=\"value2\" .../>\n\no Column names as tags and column values as the content of these tags:\n\n<row>\n  <column1>value1</column1>\n  <column2>value2</column2>\n</row>\n\no Column names are the name attributes of <field> tags, and values are\n  the contents of these tags:\n\n<row>\n  <field name=\'column1\'>value1</field>\n  <field name=\'column2\'>value2</field>\n</row>\n\n  This is the format used by other MySQL tools, such as mysqldump.\n\nAll 3 formats can be used in the same XML file; the import routine\nautomatically detects the format for each row and interprets it\ncorrectly. Tags are matched based on the tag or attribute name and the\ncolumn name.\n\nThe following clauses work essentially the same way for LOAD XML as\nthey do for LOAD DATA:\n\no LOW_PRIORITY or CONCURRENT\n\no LOCAL\n\no REPLACE or IGNORE\n\no CHARACTER SET\n\no (column_or_user_var,...)\n\no SET\n\nSee [HELP LOAD DATA], for more information about these clauses.\n\nThe IGNORE number LINES or IGNORE number ROWS clause causes the first\nnumber rows in the XML file to be skipped. It is analogous to the LOAD\nDATA statement\'s IGNORE ... LINES clause.\n\nURL: https://mariadb.com/kb/en/load-xml/\n\n', '', 'https://mariadb.com/kb/en/load-xml/'),
(131, 'CONV', 4, 'Syntax:\nCONV(N,from_base,to_base)\n\nConverts numbers between different number bases. Returns a string\nrepresentation of the number N, converted from base from_base to base\nto_base. Returns NULL if any argument is NULL. The argument N is\ninterpreted as an integer, but may be specified as an integer or a\nstring. The minimum base is 2 and the maximum base is 36. If to_base is\na negative number, N is regarded as a signed number. Otherwise, N is\ntreated as unsigned. CONV() works with 64-bit precision.\n\nURL: https://mariadb.com/kb/en/conv/\n\n', 'MariaDB> SELECT CONV(\'a\',16,2);\n        -> \'1010\'\nMariaDB> SELECT CONV(\'6E\',18,8);\n        -> \'172\'\nMariaDB> SELECT CONV(-17,10,-18);\n        -> \'-H\'\nMariaDB> SELECT CONV(10+\'10\'+\'10\'+0xa,10,10);\n        -> \'40\'\n', 'https://mariadb.com/kb/en/conv/'),
(132, 'DATE', 22, 'DATE\n\nA date. The supported range is \'1000-01-01\' to \'9999-12-31\'. MySQL\ndisplays DATE values in \'YYYY-MM-DD\' format, but permits assignment of\nvalues to DATE columns using either strings or numbers.\n\nURL: https://mariadb.com/kb/en/date/\n\n', '', 'https://mariadb.com/kb/en/date/'),
(133, 'ASSIGN-VALUE', 15, 'Syntax:\n:=\n\nAssignment operator. Causes the user variable on the left hand side of\nthe operator to take on the value to its right. The value on the right\nhand side may be a literal value, another variable storing a value, or\nany legal expression that yields a scalar value, including the result\nof a query (provided that this value is a scalar value). You can\nperform multiple assignments in the same SET statement. You can perform\nmultiple assignments in the same statement-\n\nUnlike =, the := operator is never interpreted as a comparison\noperator. This means you can use := in any valid SQL statement (not\njust in SET statements) to assign a value to a variable.\n\nURL: https://mariadb.com/kb/en/assignment-operator/\n\n', 'MariaDB> SELECT @var1, @var2;\n        -> NULL, NULL\nMariaDB> SELECT @var1 := 1, @var2;\n        -> 1, NULL\nMariaDB> SELECT @var1, @var2;\n        -> 1, NULL\nMariaDB> SELECT @var1, @var2 := @var1;\n        -> 1, 1\nMariaDB> SELECT @var1, @var2;\n        -> 1, 1\n\nMariaDB> SELECT @var1:=COUNT(*) FROM t1;\n        -> 4\nMariaDB> SELECT @var1;\n        -> 4\n', 'https://mariadb.com/kb/en/assignment-operator/'),
(134, 'SHOW OPEN TABLES', 26, 'Syntax:\nSHOW OPEN TABLES [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW OPEN TABLES lists the non-TEMPORARY tables that are currently open\nin the table cache. See\nhttp://dev.mysql.com/doc/refman/5.5/en/table-cache.html. The FROM\nclause, if present, restricts the tables shown to those present in the\ndb_name database. The LIKE clause, if present, indicates which table\nnames to match. The WHERE clause can be given to select rows using more\ngeneral conditions, as discussed in\nhttps://mariadb.com/kb/en/extended-show/.\n\nURL: https://mariadb.com/kb/en/show-open-tables/\n\n', '', 'https://mariadb.com/kb/en/show-open-tables/'),
(135, 'EXTRACT', 31, 'Syntax:\nEXTRACT(unit FROM date)\n\nThe EXTRACT() function uses the same kinds of unit specifiers as\nDATE_ADD() or DATE_SUB(), but extracts parts from the date rather than\nperforming date arithmetic.\n\nURL: https://mariadb.com/kb/en/extract/\n\n', 'MariaDB> SELECT EXTRACT(YEAR FROM \'2009-07-02\');\n       -> 2009\nMariaDB> SELECT EXTRACT(YEAR_MONTH FROM \'2009-07-02 01:02:03\');\n       -> 200907\nMariaDB> SELECT EXTRACT(DAY_MINUTE FROM \'2009-07-02 01:02:03\');\n       -> 20102\nMariaDB> SELECT EXTRACT(MICROSECOND\n    ->                FROM \'2003-01-02 10:30:00.000123\');\n        -> 123\n', 'https://mariadb.com/kb/en/extract/'),
(136, 'ENCRYPT', 12, 'Syntax:\nENCRYPT(str[,salt])\n\nEncrypts str using the Unix crypt() system call and returns a binary\nstring. The salt argument must be a string with at least two characters\nor the result will be NULL. If no salt argument is given, a random\nvalue is used.\n\nURL: https://mariadb.com/kb/en/encrypt/\n\n', 'MariaDB> SELECT ENCRYPT(\'hello\');\n        -> \'VxuFAJXVARROc\'\n', 'https://mariadb.com/kb/en/encrypt/'),
(137, 'SHOW STATUS', 26, 'Syntax:\nSHOW [GLOBAL | SESSION] STATUS\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW STATUS provides server status information. This information also\ncan be obtained using the mysqladmin extended-status command. The LIKE\nclause, if present, indicates which variable names to match. The WHERE\nclause can be given to select rows using more general conditions, as\ndiscussed in https://mariadb.com/kb/en/extended-show/.\nThis statement does not require any privilege. It requires only the\nability to connect to the server.\nWith a LIKE clause, the statement displays only rows for those\nvariables with names that match the pattern:\n\nMariaDB> SHOW STATUS LIKE \'Key%\';\n+--------------------+----------+\n| Variable_name      | Value    |\n+--------------------+----------+\n| Key_blocks_used    | 14955    |\n| Key_read_requests  | 96854827 |\n| Key_reads          | 162040   |\n| Key_write_requests | 7589728  |\n| Key_writes         | 3813196  |\n+--------------------+----------+\n\nWith the GLOBAL modifier, SHOW STATUS displays the status values for\nall connections to MySQL. With SESSION, it displays the status values\nfor the current connection. If no modifier is present, the default is\nSESSION. LOCAL is a synonym for SESSION.\n\nSome status variables have only a global value. For these, you get the\nsame value for both GLOBAL and SESSION. The scope for each status\nvariable is listed at\nhttps://mariadb.com/kb/en/server-status-variables/.\n\nEach invocation of the SHOW STATUS statement uses an internal temporary\ntable and increments the global Created_tmp_tables value.\n\nURL: https://mariadb.com/kb/en/show-status/\n\n', '', 'https://mariadb.com/kb/en/show-status/'),
(138, 'EXTRACTVALUE', 37, 'Syntax:\nExtractValue(xml_frag, xpath_expr)\n\nExtractValue() takes two string arguments, a fragment of XML markup\nxml_frag and an XPath expression xpath_expr (also known as a locator);\nit returns the text (CDATA) of the first text node which is a child of\nthe elements or elements matched by the XPath expression. In MySQL 5.5,\nthe XPath expression can contain at most 127 characters. (This\nlimitation is lifted in MySQL 5.6.)\n\nUsing this function is the equivalent of performing a match using the\nxpath_expr after appending /text(). In other words,\nExtractValue(\'<a><b>Sakila</b></a>\', \'/a/b\') and\nExtractValue(\'<a><b>Sakila</b></a>\', \'/a/b/text()\') produce the same\nresult.\n\nIf multiple matches are found, the content of the first child text node\nof each matching element is returned (in the order matched) as a\nsingle, space-delimited string.\n\nIf no matching text node is found for the expression (including the\nimplicit /text())---for whatever reason, as long as xpath_expr is\nvalid, and xml_frag consists of elements which are properly nested and\nclosed---an empty string is returned. No distinction is made between a\nmatch on an empty element and no match at all. This is by design.\n\nIf you need to determine whether no matching element was found in\nxml_frag or such an element was found but contained no child text\nnodes, you should test the result of an expression that uses the XPath\ncount() function. For example, both of these statements return an empty\nstring, as shown here:\n\nMariaDB> SELECT ExtractValue(\'<a><b/></a>\', \'/a/b\');\n+-------------------------------------+\n| ExtractValue(\'<a><b/></a>\', \'/a/b\') |\n+-------------------------------------+\n|                                     |\n+-------------------------------------+\n1 row in set (0.00 sec)\n\nMariaDB> SELECT ExtractValue(\'<a><c/></a>\', \'/a/b\');\n+-------------------------------------+\n| ExtractValue(\'<a><c/></a>\', \'/a/b\') |\n+-------------------------------------+\n|                                     |\n+-------------------------------------+\n1 row in set (0.00 sec)\n\nHowever, you can determine whether there was actually a matching\nelement using the following:\n\nMariaDB> SELECT ExtractValue(\'<a><b/></a>\', \'count(/a/b)\');\n+-------------------------------------+\n| ExtractValue(\'<a><b/></a>\', \'count(/a/b)\') |\n+-------------------------------------+\n| 1                                   |\n+-------------------------------------+\n1 row in set (0.00 sec)\n\nMariaDB> SELECT ExtractValue(\'<a><c/></a>\', \'count(/a/b)\');\n+-------------------------------------+\n| ExtractValue(\'<a><c/></a>\', \'count(/a/b)\') |\n+-------------------------------------+\n| 0                                   |\n+-------------------------------------+\n1 row in set (0.01 sec)\n\n*Important*: ExtractValue() returns only CDATA, and does not return any\ntags that might be contained within a matching tag, nor any of their\ncontent (see the result returned as val1 in the following example).\n\nURL: https://mariadb.com/kb/en/extractvalue/\n\n', 'MariaDB> SELECT\n    ->   ExtractValue(\'<a>ccc<b>ddd</b></a>\', \'/a\') AS val1,\n    ->   ExtractValue(\'<a>ccc<b>ddd</b></a>\', \'/a/b\') AS val2,\n    ->   ExtractValue(\'<a>ccc<b>ddd</b></a>\', \'//b\') AS val3,\n    ->   ExtractValue(\'<a>ccc<b>ddd</b></a>\', \'/b\') AS val4,\n    ->   ExtractValue(\'<a>ccc<b>ddd</b><b>eee</b></a>\', \'//b\') AS val5;\n\n+------+------+------+------+---------+\n| val1 | val2 | val3 | val4 | val5    |\n+------+------+------+------+---------+\n| ccc  | ddd  | ddd  |      | ddd eee |\n+------+------+------+------+---------+\n', 'https://mariadb.com/kb/en/extractvalue/'),
(139, 'OLD_PASSWORD', 12, 'Syntax:\nOLD_PASSWORD(str)\n\nOLD_PASSWORD() was added when the implementation of PASSWORD() was\nchanged in MySQL 4.1 to improve security. OLD_PASSWORD() returns the\nvalue of the pre-4.1 implementation of PASSWORD() as a string, and is\nintended to permit you to reset passwords for any pre-4.1 clients that\nneed to connect to your version 5.5 MySQL server without locking them\nout. See http://dev.mysql.com/doc/refman/5.1/en/password-hashing.html.\n\nAs of MySQL 5.5.3, the return value is a nonbinary string in the\nconnection character set. Before 5.5.3, the return value is a binary\nstring.\n\nURL: https://mariadb.com/kb/en/old_password/\n\n', '', 'https://mariadb.com/kb/en/old_password/'),
(140, 'FORMAT', 37, 'Syntax:\nFORMAT(X,D[,locale])\n\nFormats the number X to a format like \'#,###,###.##\', rounded to D\ndecimal places, and returns the result as a string. If D is 0, the\nresult has no decimal point or fractional part.\n\nThe optional third parameter enables a locale to be specified to be\nused for the result number\'s decimal point, thousands separator, and\ngrouping between separators. Permissible locale values are the same as\nthe legal values for the lc_time_names system variable (see\nhttps://mariadb.com/kb/en/server-locale/). If no\nlocale is specified, the default is \'en_US\'.\n\nURL: https://mariadb.com/kb/en/format/\n\n', 'MariaDB> SELECT FORMAT(12332.123456, 4);\n        -> \'12,332.1235\'\nMariaDB> SELECT FORMAT(12332.1,4);\n        -> \'12,332.1000\'\nMariaDB> SELECT FORMAT(12332.2,0);\n        -> \'12,332\'\nMariaDB> SELECT FORMAT(12332.2,2,\'de_DE\');\n        -> \'12.332,20\'\n', 'https://mariadb.com/kb/en/format/'),
(141, '||', 15, 'Syntax:\nOR, ||\n\nLogical OR. When both operands are non-NULL, the result is 1 if any\noperand is nonzero, and 0 otherwise. With a NULL operand, the result is\n1 if the other operand is nonzero, and NULL otherwise. If both operands\nare NULL, the result is NULL.\n\nURL: https://mariadb.com/kb/en/or/\n\n', 'MariaDB> SELECT 1 || 1;\n        -> 1\nMariaDB> SELECT 1 || 0;\n        -> 1\nMariaDB> SELECT 0 || 0;\n        -> 0\nMariaDB> SELECT 0 || NULL;\n        -> NULL\nMariaDB> SELECT 1 || NULL;\n        -> 1\n', 'https://mariadb.com/kb/en/or/'),
(142, 'BIT_LENGTH', 37, 'Syntax:\nBIT_LENGTH(str)\n\nReturns the length of the string str in bits.\n\nURL: https://mariadb.com/kb/en/bit_length/\n\n', 'MariaDB> SELECT BIT_LENGTH(\'text\');\n        -> 32\n', 'https://mariadb.com/kb/en/bit_length/'),
(143, 'EXTERIORRING', 2, 'ExteriorRing(poly)\n\nReturns the exterior ring of the Polygon value poly as a LineString.\n\nURL: https://mariadb.com/kb/en/exteriorring/\n\n', 'MariaDB> SET @poly =\n    -> \'Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))\';\nMariaDB> SELECT AsText(ExteriorRing(GeomFromText(@poly)));\n+-------------------------------------------+\n| AsText(ExteriorRing(GeomFromText(@poly))) |\n+-------------------------------------------+\n| LINESTRING(0 0,0 3,3 3,3 0,0 0)           |\n+-------------------------------------------+\n', 'https://mariadb.com/kb/en/exteriorring/'),
(144, 'GEOMFROMWKB', 32, 'GeomFromWKB(wkb[,srid]), GeometryFromWKB(wkb[,srid])\n\nConstructs a geometry value of any type using its WKB representation\nand SRID.\n\nURL: https://mariadb.com/kb/en/geomfromwkb/\n\n', '', 'https://mariadb.com/kb/en/geomfromwkb/'),
(145, 'SHOW SLAVE HOSTS', 26, 'Syntax:\nSHOW SLAVE HOSTS\n\nDisplays a list of replication slaves currently registered with the\nmaster. (Before MySQL 5.5.3, only slaves started with the\n--report-host=host_name option are visible in this list.)\n\nThe list is displayed on any server (not just the master server). The\noutput looks like this:\n\nMariaDB> SHOW SLAVE HOSTS;\n+------------+-----------+------+-----------+\n| Server_id  | Host      | Port | Master_id |\n+------------+-----------+------+-----------+\n|  192168010 | iconnect2 | 3306 | 192168011 |\n| 1921680101 | athena    | 3306 | 192168011 |\n+------------+-----------+------+-----------+\n\no Server_id: The unique server ID of the slave server, as configured in\n  the server\'s option file, or on the command line with\n  --server-id=value.\n\no Host: The host name of the slave server, as configured in the\n  server\'s option file, or on the command line with\n  --report-host=host_name. Note that this can differ from the machine\n  name as configured in the operating system.\n\no Port: The port the slave server is listening on.\n\n  In MySQL 5.5.23 and later, a zero in this column means that the slave\n  port (--report-port) was not set. Prior to MySQL 5.5.23, 3306 was\n  used as the default in such cases (Bug #13333431).\n\no Master_id: The unique server ID of the master server that the slave\n  server is replicating from.\n\nSome MySQL versions report another variable, Rpl_recovery_rank. This\nvariable was never used, and was removed in MySQL 5.5.3. (Bug #13963)\n\nURL: https://mariadb.com/kb/en/show-slave-hosts/\n\n', '', 'https://mariadb.com/kb/en/show-slave-hosts/'),
(146, 'START TRANSACTION', 8, 'Syntax:\nSTART TRANSACTION [WITH CONSISTENT SNAPSHOT]\nBEGIN [WORK]\nCOMMIT [WORK] [AND [NO] CHAIN] [[NO] RELEASE]\nROLLBACK [WORK] [AND [NO] CHAIN] [[NO] RELEASE]\nSET autocommit = {0 | 1}\n\nThese statements provide control over use of transactions:\n\no START TRANSACTION or BEGIN start a new transaction.\n\no COMMIT commits the current transaction, making its changes permanent.\n\no ROLLBACK rolls back the current transaction, canceling its changes.\n\no SET autocommit disables or enables the default autocommit mode for\n  the current session.\n\nBy default, MySQL runs with autocommit mode enabled. This means that as\nsoon as you execute a statement that updates (modifies) a table, MySQL\nstores the update on disk to make it permanent. The change cannot be\nrolled back.\n\nTo disable autocommit mode implicitly for a single series of\nstatements, use the START TRANSACTION statement:\n\nSTART TRANSACTION;\nSELECT @A:=SUM(salary) FROM table1 WHERE type=1;\nUPDATE table2 SET summary=@A WHERE type=1;\nCOMMIT;\n\nWith START TRANSACTION, autocommit remains disabled until you end the\ntransaction with COMMIT or ROLLBACK. The autocommit mode then reverts\nto its previous state.\n\nYou can also begin a transaction like this:\n\nSTART TRANSACTION WITH CONSISTENT SNAPSHOT;\n\nThe WITH CONSISTENT SNAPSHOT option starts a consistent read for\nstorage engines that are capable of it. This applies only to InnoDB.\nThe effect is the same as issuing a START TRANSACTION followed by a\nSELECT from any InnoDB table. See\nhttp://dev.mysql.com/doc/refman/5.5/en/innodb-consistent-read.html. The\nWITH CONSISTENT SNAPSHOT option does not change the current transaction\nisolation level, so it provides a consistent snapshot only if the\ncurrent isolation level is one that permits consistent read (REPEATABLE\nREAD or SERIALIZABLE).\n\n*Important*: Many APIs used for writing MySQL client applications (such\nas JDBC) provide their own methods for starting transactions that can\n(and sometimes should) be used instead of sending a START TRANSACTION\nstatement from the client. See\nhttp://dev.mysql.com/doc/refman/5.5/en/connectors-apis.html, or the\ndocumentation for your API, for more information.\n\nTo disable autocommit mode explicitly, use the following statement:\n\nSET autocommit=0;\n\nAfter disabling autocommit mode by setting the autocommit variable to\nzero, changes to transaction-safe tables (such as those for InnoDB) are not made permanent immediately. You must use COMMIT to\nstore your changes to disk or ROLLBACK to ignore the changes.\n\nautocommit is a session variable and must be set for each session. To\ndisable autocommit mode for each new connection, see the description of\nthe autocommit system variable at\nhttps://mariadb.com/kb/en/server-system-variables/.\n\nBEGIN and BEGIN WORK are supported as aliases of START TRANSACTION for\ninitiating a transaction. START TRANSACTION is standard SQL syntax and\nis the recommended way to start an ad-hoc transaction.\n\nThe BEGIN statement differs from the use of the BEGIN keyword that\nstarts a BEGIN ... END compound statement. The latter does not begin a\ntransaction. See [HELP BEGIN END].\n\n*Note*: Within all stored programs (stored procedures and functions,\ntriggers, and events), the parser treats BEGIN [WORK] as the beginning\nof a BEGIN ... END block. Begin a transaction in this context with\nSTART TRANSACTION instead.\n\nThe optional WORK keyword is supported for COMMIT and ROLLBACK, as are\nthe CHAIN and RELEASE clauses. CHAIN and RELEASE can be used for\nadditional control over transaction completion. The value of the\ncompletion_type system variable determines the default completion\nbehavior. See\nhttps://mariadb.com/kb/en/server-system-variables/.\n\nThe AND CHAIN clause causes a new transaction to begin as soon as the\ncurrent one ends, and the new transaction has the same isolation level\nas the just-terminated transaction. The RELEASE clause causes the\nserver to disconnect the current client session after terminating the\ncurrent transaction. Including the NO keyword suppresses CHAIN or\nRELEASE completion, which can be useful if the completion_type system\nvariable is set to cause chaining or release completion by default.\n\nURL: https://mariadb.com/kb/en/start-transaction/\n\n', '', 'https://mariadb.com/kb/en/start-transaction/'),
(147, 'BETWEEN AND', 18, 'Syntax:\nexpr BETWEEN min AND max\n\nIf expr is greater than or equal to min and expr is less than or equal\nto max, BETWEEN returns 1, otherwise it returns 0. This is equivalent\nto the expression (min <= expr AND expr <= max) if all the arguments\nare of the same type. Otherwise type conversion takes place according\nto the rules described in\nhttps://mariadb.com/kb/en/type-conversion/, but\napplied to all the three arguments.\n\nURL: https://mariadb.com/kb/en/between-and/\n\n', 'MariaDB> SELECT 2 BETWEEN 1 AND 3, 2 BETWEEN 3 and 1;\n        -> 1, 0\nMariaDB> SELECT 1 BETWEEN 2 AND 3;\n        -> 0\nMariaDB> SELECT \'b\' BETWEEN \'a\' AND \'c\';\n        -> 1\nMariaDB> SELECT 2 BETWEEN 2 AND \'3\';\n        -> 1\nMariaDB> SELECT 2 BETWEEN 2 AND \'x-3\';\n        -> 0\n', 'https://mariadb.com/kb/en/between-and/'),
(148, 'MULTIPOLYGON', 24, 'MultiPolygon(poly1,poly2,...)\n\nConstructs a MultiPolygon value from a set of Polygon or WKB Polygon\narguments.\n\nURL: https://mariadb.com/kb/en/multipolygon/\n\n', '', 'https://mariadb.com/kb/en/multipolygon/'),
(149, 'TIME_FORMAT', 31, 'Syntax:\nTIME_FORMAT(time,format)\n\nThis is used like the DATE_FORMAT() function, but the format string may\ncontain format specifiers only for hours, minutes, seconds, and\nmicroseconds. Other specifiers produce a NULL value or 0.\n\nURL: https://mariadb.com/kb/en/time_format/\n\n', 'MariaDB> SELECT TIME_FORMAT(\'100:00:00\', \'%H %k %h %I %l\');\n        -> \'100 100 04 04 4\'\n', 'https://mariadb.com/kb/en/time_format/'),
(150, 'LEFT', 37, 'Syntax:\nLEFT(str,len)\n\nReturns the leftmost len characters from the string str, or NULL if any\nargument is NULL.\n\nURL: https://mariadb.com/kb/en/left/\n\n', 'MariaDB> SELECT LEFT(\'foobarbar\', 5);\n        -> \'fooba\'\n', 'https://mariadb.com/kb/en/left/'),
(151, 'FLUSH QUERY CACHE', 26, 'You can defragment the query cache to better utilize its memory with\nthe FLUSH QUERY CACHE statement. The statement does not remove any\nqueries from the cache.\n\nThe RESET QUERY CACHE statement removes all query results from the\nquery cache. The FLUSH TABLES statement also does this.\n\nURL: https://mariadb.com/kb/en/flush-query-cache/\n\n', '', 'https://mariadb.com/kb/en/flush-query-cache/'),
(152, 'SET DATA TYPE', 22, 'SET(\'value1\',\'value2\',...) [CHARACTER SET charset_name] [COLLATE\ncollation_name]\n\nA set. A string object that can have zero or more values, each of which\nmust be chosen from the list of values \'value1\', \'value2\', ... A SET\ncolumn can have a maximum of 64 members. SET values are represented\ninternally as integers.\n\nURL: https://mariadb.com/kb/en/set-data-type/\n\n', '', 'https://mariadb.com/kb/en/set-data-type/'),
(153, 'RAND', 4, 'Syntax:\nRAND(), RAND(N)\n\nReturns a random floating-point value v in the range 0 <= v < 1.0. If a\nconstant integer argument N is specified, it is used as the seed value,\nwhich produces a repeatable sequence of column values. In the following\nexample, note that the sequences of values produced by RAND(3) is the\nsame both places where it occurs.\n\nURL: https://mariadb.com/kb/en/rand/\n\n', 'MariaDB> CREATE TABLE t (i INT);\nQuery OK, 0 rows affected (0.42 sec)\n\nMariaDB> INSERT INTO t VALUES(1),(2),(3);\nQuery OK, 3 rows affected (0.00 sec)\nRecords: 3  Duplicates: 0  Warnings: 0\n\nMariaDB> SELECT i, RAND() FROM t;\n+------+------------------+\n| i    | RAND()           |\n+------+------------------+\n|    1 | 0.61914388706828 |\n|    2 | 0.93845168309142 |\n|    3 | 0.83482678498591 |\n+------+------------------+\n3 rows in set (0.00 sec)\n\nMariaDB> SELECT i, RAND(3) FROM t;\n+------+------------------+\n| i    | RAND(3)          |\n+------+------------------+\n|    1 | 0.90576975597606 |\n|    2 | 0.37307905813035 |\n|    3 | 0.14808605345719 |\n+------+------------------+\n3 rows in set (0.00 sec)\n\nMariaDB> SELECT i, RAND() FROM t;\n+------+------------------+\n| i    | RAND()           |\n+------+------------------+\n|    1 | 0.35877890638893 |\n|    2 | 0.28941420772058 |\n|    3 | 0.37073435016976 |\n+------+------------------+\n3 rows in set (0.00 sec)\n\nMariaDB> SELECT i, RAND(3) FROM t;\n+------+------------------+\n| i    | RAND(3)          |\n+------+------------------+\n|    1 | 0.90576975597606 |\n|    2 | 0.37307905813035 |\n|    3 | 0.14808605345719 |\n+------+------------------+\n3 rows in set (0.01 sec)\n', 'https://mariadb.com/kb/en/rand/'),
(154, 'RPAD', 37, 'Syntax:\nRPAD(str,len,padstr)\n\nReturns the string str, right-padded with the string padstr to a length\nof len characters. If str is longer than len, the return value is\nshortened to len characters.\n\nURL: https://mariadb.com/kb/en/rpad/\n\n', 'MariaDB> SELECT RPAD(\'hi\',5,\'?\');\n        -> \'hi???\'\nMariaDB> SELECT RPAD(\'hi\',1,\'?\');\n        -> \'h\'\n', 'https://mariadb.com/kb/en/rpad/'),
(155, 'CREATE DATABASE', 39, 'Syntax:\nCREATE {DATABASE | SCHEMA} [IF NOT EXISTS] db_name\n    [create_specification] ...\n\ncreate_specification:\n    [DEFAULT] CHARACTER SET [=] charset_name\n  | [DEFAULT] COLLATE [=] collation_name\n\nCREATE DATABASE creates a database with the given name. To use this\nstatement, you need the CREATE privilege for the database. CREATE\nSCHEMA is a synonym for CREATE DATABASE.\n\nURL: https://mariadb.com/kb/en/create-database/\n\n', '', 'https://mariadb.com/kb/en/create-database/'),
(156, 'DEC', 22, 'DEC[(M[,D])] [UNSIGNED] [ZEROFILL], NUMERIC[(M[,D])] [UNSIGNED]\n[ZEROFILL], FIXED[(M[,D])] [UNSIGNED] [ZEROFILL]\n\nThese types are synonyms for DECIMAL. The FIXED synonym is available\nfor compatibility with other database systems.\n\nURL: https://mariadb.com/kb/en/dec-numeric-fixed/\n\n', '', 'https://mariadb.com/kb/en/dec-numeric-fixed/'),
(157, 'VAR_POP', 16, 'Syntax:\nVAR_POP(expr)\n\nReturns the population standard variance of expr. It considers rows as\nthe whole population, not as a sample, so it has the number of rows as\nthe denominator. You can also use VARIANCE(), which is equivalent but\nis not standard SQL.\n\nVAR_POP() returns NULL if there were no matching rows.\n\nURL: https://mariadb.com/kb/en/var_pop/\n\n', '', 'https://mariadb.com/kb/en/var_pop/'),
(158, 'ELT', 37, 'Syntax:\nELT(N,str1,str2,str3,...)\n\nReturns str1 if N = 1, str2 if N = 2, and so on. Returns NULL if N is\nless than 1 or greater than the number of arguments. ELT() is the\ncomplement of FIELD().\n\nURL: https://mariadb.com/kb/en/elt/.html\n\n', 'MariaDB> SELECT ELT(1, \'ej\', \'Heja\', \'hej\', \'foo\');\n        -> \'ej\'\nMariaDB> SELECT ELT(4, \'ej\', \'Heja\', \'hej\', \'foo\');\n        -> \'foo\'\n', 'https://mariadb.com/kb/en/elt/.html'),
(159, 'ALTER VIEW', 39, 'Syntax:\nALTER\n    [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]\n    [DEFINER = { user | CURRENT_USER }]\n    [SQL SECURITY { DEFINER | INVOKER }]\n    VIEW view_name [(column_list)]\n    AS select_statement\n    [WITH [CASCADED | LOCAL] CHECK OPTION]\n\nThis statement changes the definition of a view, which must exist. The\nsyntax is similar to that for CREATE VIEW and the effect is the same as\nfor CREATE OR REPLACE VIEW. See [HELP CREATE VIEW]. This statement\nrequires the CREATE VIEW and DROP privileges for the view, and some\nprivilege for each column referred to in the SELECT statement. ALTER\nVIEW is permitted only to the definer or users with the SUPER\nprivilege.\n\nURL: https://mariadb.com/kb/en/alter-view/\n\n', '', 'https://mariadb.com/kb/en/alter-view/'),
(160, 'SHOW DATABASES', 26, 'Syntax:\nSHOW {DATABASES | SCHEMAS}\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW DATABASES lists the databases on the MySQL server host. SHOW\nSCHEMAS is a synonym for SHOW DATABASES. The LIKE clause, if present,\nindicates which database names to match. The WHERE clause can be given\nto select rows using more general conditions, as discussed in\nhttps://mariadb.com/kb/en/extended-show/.\n\nYou see only those databases for which you have some kind of privilege,\nunless you have the global SHOW DATABASES privilege. You can also get\nthis list using the mysqlshow command.\n\nIf the server was started with the --skip-show-database option, you\ncannot use this statement at all unless you have the SHOW DATABASES\nprivilege.\n\nURL: https://mariadb.com/kb/en/show-databases/\n\n', '', 'https://mariadb.com/kb/en/show-databases/'),
(161, '~', 19, 'Syntax:\n~\n\nInvert all bits.\n\nURL: https://mariadb.com/kb/en/3489/\n\n', 'MariaDB> SELECT 5 & ~1;\n        -> 4\n', 'https://mariadb.com/kb/en/3489/'),
(162, 'TEXT', 22, 'TEXT[(M)] [CHARACTER SET charset_name] [COLLATE collation_name]\n\nA TEXT column with a maximum length of 65,535 (216 - 1) characters. The\neffective maximum length is less if the value contains multi-byte\ncharacters. Each TEXT value is stored using a 2-byte length prefix that\nindicates the number of bytes in the value.\n\nAn optional length M can be given for this type. If this is done, MySQL\ncreates the column as the smallest TEXT type large enough to hold\nvalues M characters long.\n\nURL: https://mariadb.com/kb/en/text/\n\n', '', 'https://mariadb.com/kb/en/text/'),
(163, 'CONCAT_WS', 37, 'Syntax:\nCONCAT_WS(separator,str1,str2,...)\n\nCONCAT_WS() stands for Concatenate With Separator and is a special form\nof CONCAT(). The first argument is the separator for the rest of the\narguments. The separator is added between the strings to be\nconcatenated. The separator can be a string, as can the rest of the\narguments. If the separator is NULL, the result is NULL.\n\nURL: https://mariadb.com/kb/en/concat_ws/\n\n', 'MariaDB> SELECT CONCAT_WS(\',\',\'First name\',\'Second name\',\'Last Name\');\n        -> \'First name,Second name,Last Name\'\nMariaDB> SELECT CONCAT_WS(\',\',\'First name\',NULL,\'Last Name\');\n        -> \'First name,Last Name\'\n', 'https://mariadb.com/kb/en/concat_ws/'),
(164, 'ROW_COUNT', 17, 'Syntax:\nROW_COUNT()\n\nBefore MySQL 5.5.5, ROW_COUNT() returns the number of rows changed,\ndeleted, or inserted by the last statement if it was an UPDATE, DELETE,\nor INSERT. For other statements, the value may not be meaningful.\n\nAs of MySQL 5.5.5, ROW_COUNT() returns a value as follows:\n\no DDL statements: 0. This applies to statements such as CREATE TABLE or\n  DROP TABLE.\n\no DML statements other than SELECT: The number of affected rows. This\n  applies to statements such as UPDATE, INSERT, or DELETE (as before),\n  but now also to statements such as ALTER TABLE and LOAD DATA INFILE.\n\no SELECT: -1 if the statement returns a result set, or the number of\n  rows \"affected\" if it does not. For example, for SELECT * FROM t1,\n  ROW_COUNT() returns -1. For SELECT * FROM t1 INTO OUTFILE\n  \'file_name\', ROW_COUNT() returns the number of rows written to the\n  file.\n\no SIGNAL statements: 0.\n\nFor UPDATE statements, the affected-rows value by default is the number\nof rows actually changed. If you specify the CLIENT_FOUND_ROWS flag to\nmysql_real_connect() when connecting to mysqld, the affected-rows value\nis the number of rows \"found\"; that is, matched by the WHERE clause.\n\nFor REPLACE statements, the affected-rows value is 2 if the new row\nreplaced an old row, because in this case, one row was inserted after\nthe duplicate was deleted.\n\nFor INSERT ... ON DUPLICATE KEY UPDATE statements, the affected-rows\nvalue is 1 if the row is inserted as a new row and 2 if an existing row\nis updated.\n\nThe ROW_COUNT() value is similar to the value from the\nmysql_affected_rows() C API function and the row count that the mysql\nclient displays following statement execution.\n\nURL: https://mariadb.com/kb/en/information-functions-row_count/\n\n', 'MariaDB> INSERT INTO t VALUES(1),(2),(3);\nQuery OK, 3 rows affected (0.00 sec)\nRecords: 3  Duplicates: 0  Warnings: 0\n\nMariaDB> SELECT ROW_COUNT();\n+-------------+\n| ROW_COUNT() |\n+-------------+\n|           3 |\n+-------------+\n1 row in set (0.00 sec)\n\nMariaDB> DELETE FROM t WHERE i IN(1,2);\nQuery OK, 2 rows affected (0.00 sec)\n\nMariaDB> SELECT ROW_COUNT();\n+-------------+\n| ROW_COUNT() |\n+-------------+\n|           2 |\n+-------------+\n1 row in set (0.00 sec)\n', 'https://mariadb.com/kb/en/information-functions-row_count/'),
(165, 'ASIN', 4, 'Syntax:\nASIN(X)\n\nReturns the arc sine of X, that is, the value whose sine is X. Returns\nNULL if X is not in the range -1 to 1.\n\nURL: https://mariadb.com/kb/en/asin/\n\n', 'MariaDB> SELECT ASIN(0.2);\n        -> 0.20135792079033\nMariaDB> SELECT ASIN(\'foo\');\n\n+-------------+\n| ASIN(\'foo\') |\n+-------------+\n|           0 |\n+-------------+\n1 row in set, 1 warning (0.00 sec)\n\nMariaDB> SHOW WARNINGS;\n+---------+------+-----------------------------------------+\n| Level   | Code | Message                                 |\n+---------+------+-----------------------------------------+\n| Warning | 1292 | Truncated incorrect DOUBLE value: \'foo\' |\n+---------+------+-----------------------------------------+\n', 'https://mariadb.com/kb/en/asin/'),
(166, 'SIGN', 4, 'Syntax:\nSIGN(X)\n\nReturns the sign of the argument as -1, 0, or 1, depending on whether X\nis negative, zero, or positive.\n\nURL: https://mariadb.com/kb/en/sign/\n\n', 'MariaDB> SELECT SIGN(-32);\n        -> -1\nMariaDB> SELECT SIGN(0);\n        -> 0\nMariaDB> SELECT SIGN(234);\n        -> 1\n', 'https://mariadb.com/kb/en/sign/'),
(167, 'SEC_TO_TIME', 31, 'Syntax:\nSEC_TO_TIME(seconds)\n\nReturns the seconds argument, converted to hours, minutes, and seconds,\nas a TIME value. The range of the result is constrained to that of the\nTIME data type. A warning occurs if the argument corresponds to a value\noutside that range.\n\nURL: https://mariadb.com/kb/en/sec_to_time/\n\n', 'MariaDB> SELECT SEC_TO_TIME(2378);\n        -> \'00:39:38\'\nMariaDB> SELECT SEC_TO_TIME(2378) + 0;\n        -> 3938\n', 'https://mariadb.com/kb/en/sec_to_time/'),
(168, 'FLOAT', 22, 'FLOAT[(M,D)] [UNSIGNED] [ZEROFILL]\n\nA small (single-precision) floating-point number. Permissible values\nare -3.402823466E+38 to -1.175494351E-38, 0, and 1.175494351E-38 to\n3.402823466E+38. These are the theoretical limits, based on the IEEE\nstandard. The actual range might be slightly smaller depending on your\nhardware or operating system.\n\nM is the total number of digits and D is the number of digits following\nthe decimal point. If M and D are omitted, values are stored to the\nlimits permitted by the hardware. A single-precision floating-point\nnumber is accurate to approximately 7 decimal places.\n\nUNSIGNED, if specified, disallows negative values.\n\nUsing FLOAT might give you some unexpected problems because all\ncalculations in MySQL are done with double precision. See\nhttps://mariadb.com/kb/en/floating-point-accuracy/.\n\nURL: https://mariadb.com/kb/en/float/\n\n', '', 'https://mariadb.com/kb/en/float/'),
(169, 'LOCATE', 37, 'Syntax:\nLOCATE(substr,str), LOCATE(substr,str,pos)\n\nThe first syntax returns the position of the first occurrence of\nsubstring substr in string str. The second syntax returns the position\nof the first occurrence of substring substr in string str, starting at\nposition pos. Returns 0 if substr is not in str.\n\nURL: https://mariadb.com/kb/en/locate/\n\n', 'MariaDB> SELECT LOCATE(\'bar\', \'foobarbar\');\n        -> 4\nMariaDB> SELECT LOCATE(\'xbar\', \'foobar\');\n        -> 0\nMariaDB> SELECT LOCATE(\'bar\', \'foobarbar\', 5);\n        -> 7\n', 'https://mariadb.com/kb/en/locate/'),
(170, 'SHOW EVENTS', 26, 'Syntax:\nSHOW EVENTS [{FROM | IN} schema_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nThis statement displays information about Event Manager events. It\nrequires the EVENT privilege for the database from which the events are\nto be shown.\n\nIn its simplest form, SHOW EVENTS lists all of the events in the\ncurrent schema:\n\nMariaDB> SELECT CURRENT_USER(), SCHEMA();\n+----------------+----------+\n| CURRENT_USER() | SCHEMA() |\n+----------------+----------+\n| jon@ghidora    | myschema |\n+----------------+----------+\n1 row in set (0.00 sec)\n\nMariaDB> SHOW EVENTS\\G\n*************************** 1. row ***************************\n                  Db: myschema\n                Name: e_daily\n             Definer: jon@ghidora\n           Time zone: SYSTEM\n                Type: RECURRING\n          Execute at: NULL\n      Interval value: 10\n      Interval field: SECOND\n              Starts: 2006-02-09 10:41:23\n                Ends: NULL\n              Status: ENABLED\n          Originator: 0\ncharacter_set_client: latin1\ncollation_connection: latin1_swedish_ci\n  Database Collation: latin1_swedish_ci\n\nTo see events for a specific schema, use the FROM clause. For example,\nto see events for the test schema, use the following statement:\n\nSHOW EVENTS FROM test;\n\nThe LIKE clause, if present, indicates which event names to match. The\nWHERE clause can be given to select rows using more general conditions,\nas discussed in\nhttps://mariadb.com/kb/en/extended-show/.\n\nURL: https://mariadb.com/kb/en/show-events/\n\n', '', 'https://mariadb.com/kb/en/show-events/'),
(171, 'CHARSET', 17, 'Syntax:\nCHARSET(str)\n\nReturns the character set of the string argument.\n\nURL: https://mariadb.com/kb/en/charset/\n\n', 'MariaDB> SELECT CHARSET(\'abc\');\n        -> \'latin1\'\nMariaDB> SELECT CHARSET(CONVERT(\'abc\' USING utf8));\n        -> \'utf8\'\nMariaDB> SELECT CHARSET(USER());\n        -> \'utf8\'\n', 'https://mariadb.com/kb/en/charset/'),
(172, 'SUBDATE', 31, 'Syntax:\nSUBDATE(date,INTERVAL expr unit), SUBDATE(expr,days)\n\nWhen invoked with the INTERVAL form of the second argument, SUBDATE()\nis a synonym for DATE_SUB(). For information on the INTERVAL unit\nargument, see the discussion for DATE_ADD().\n\nMariaDB> SELECT DATE_SUB(\'2008-01-02\', INTERVAL 31 DAY);\n        -> \'2007-12-02\'\nMariaDB> SELECT SUBDATE(\'2008-01-02\', INTERVAL 31 DAY);\n        -> \'2007-12-02\'\n\nThe second form enables the use of an integer value for days. In such\ncases, it is interpreted as the number of days to be subtracted from\nthe date or datetime expression expr.\n\nMariaDB> SELECT SUBDATE(\'2008-01-02 12:00:00\', 31);\n        -> \'2007-12-02 12:00:00\'\n\nURL: https://mariadb.com/kb/en/subdate/\n\n', '', 'https://mariadb.com/kb/en/subdate/'),
(173, 'DAYOFYEAR', 31, 'Syntax:\nDAYOFYEAR(date)\n\nReturns the day of the year for date, in the range 1 to 366.\n\nURL: https://mariadb.com/kb/en/dayofyear/\n\n', 'MariaDB> SELECT DAYOFYEAR(\'2007-02-03\');\n        -> 34\n', 'https://mariadb.com/kb/en/dayofyear/'),
(174, '%', 4, 'Syntax:\nN % M, N MOD M\n\nModulo operation. Returns the remainder of N divided by M. For more\ninformation, see the description for the MOD() function in\nhttps://mariadb.com/kb/en/mod/.\n\nURL: https://mariadb.com/kb/en/modulo-operator/\n\n', '', 'https://mariadb.com/kb/en/modulo-operator/'),
(175, 'LONGTEXT', 22, 'LONGTEXT [CHARACTER SET charset_name] [COLLATE collation_name]\n\nA TEXT column with a maximum length of 4,294,967,295 or 4GB (232 - 1)\ncharacters. The effective maximum length is less if the value contains\nmulti-byte characters. The effective maximum length of LONGTEXT columns\nalso depends on the configured maximum packet size in the client/server\nprotocol and available memory. Each LONGTEXT value is stored using a\n4-byte length prefix that indicates the number of bytes in the value.\n\nURL: https://mariadb.com/kb/en/longtext/\n\n', '', 'https://mariadb.com/kb/en/longtext/'),
(176, 'KILL', 26, 'Syntax:\nKILL [CONNECTION | QUERY] thread_id\n\nEach connection to mysqld runs in a separate thread. You can see which\nthreads are running with the SHOW PROCESSLIST statement and kill a\nthread with the KILL thread_id statement.\n\nKILL permits an optional CONNECTION or QUERY modifier:\n\no KILL CONNECTION is the same as KILL with no modifier: It terminates\n  the connection associated with the given thread_id.\n\no KILL QUERY terminates the statement that the connection is currently\n  executing, but leaves the connection itself intact.\n\nIf you have the PROCESS privilege, you can see all threads. If you have\nthe SUPER privilege, you can kill all threads and statements.\nOtherwise, you can see and kill only your own threads and statements.\n\nYou can also use the mysqladmin processlist and mysqladmin kill\ncommands to examine and kill threads.\n\n*Note*: You cannot use KILL with the Embedded MySQL Server library\nbecause the embedded server merely runs inside the threads of the host\napplication. It does not create any connection threads of its own.\n\nURL: https://mariadb.com/kb/en/data-manipulation-kill-connection-query/\n\n', '', 'https://mariadb.com/kb/en/data-manipulation-kill-connection-query/'),
(177, 'DISJOINT', 30, 'Disjoint(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 is spatially disjoint from (does\nnot intersect) g2.\n\nURL: https://mariadb.com/kb/en/disjoint/\n\n', '', 'https://mariadb.com/kb/en/disjoint/'),
(178, 'ASTEXT', 3, 'AsText(g), AsWKT(g)\n\nConverts a value in internal geometry format to its WKT representation\nand returns the string result.\n\nURL: https://mariadb.com/kb/en/astext/\n\n', 'MariaDB> SET @g = \'LineString(1 1,2 2,3 3)\';\nMariaDB> SELECT AsText(GeomFromText(@g));\n+--------------------------+\n| AsText(GeomFromText(@g)) |\n+--------------------------+\n| LINESTRING(1 1,2 2,3 3)  |\n+--------------------------+\n', 'https://mariadb.com/kb/en/astext/'),
(179, 'LPAD', 37, 'Syntax:\nLPAD(str,len,padstr)\n\nReturns the string str, left-padded with the string padstr to a length\nof len characters. If str is longer than len, the return value is\nshortened to len characters.\n\n\nURL: https://mariadb.com/kb/en/lpad/\n\n', 'MariaDB> SELECT LPAD(\'hi\',4,\'??\');\n        -> \'??hi\'\nMariaDB> SELECT LPAD(\'hi\',1,\'??\');\n        -> \'h\'\n', 'https://mariadb.com/kb/en/lpad/'),
(180, 'DECLARE CONDITION', 23, 'Syntax:\nDECLARE condition_name CONDITION FOR condition_value\n\ncondition_value:\n    mysql_error_code\n  | SQLSTATE [VALUE] sqlstate_value\n\nThe DECLARE ... CONDITION statement declares a named error condition,\nassociating a name with a condition that needs specific handling. The\nname can be referred to in a subsequent DECLARE ... HANDLER statement\n(see [HELP DECLARE HANDLER]).\n\nCondition declarations must appear before cursor or handler\ndeclarations.\n\nThe condition_value for DECLARE ... CONDITION can be a MySQL error code\n(a number) or an SQLSTATE value (a 5-character string literal). You\nshould not use MySQL error code 0 or SQLSTATE values that begin with\n\'00\', because those indicate success rather than an error condition.\nFor a list of MySQL error codes and SQLSTATE values, see\nhttps://mariadb.com/kb/en/mariadb-error-codes/.\n\nURL: https://mariadb.com/kb/en/declare-condition/\n\n', '', 'https://mariadb.com/kb/en/declare-condition/'),
(181, 'OVERLAPS', 30, 'Overlaps(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 spatially overlaps g2. The term\nspatially overlaps is used if two geometries intersect and their\nintersection results in a geometry of the same dimension but not equal\nto either of the given geometries.\n\nURL: https://mariadb.com/kb/en/overlaps/\n\n', '', 'https://mariadb.com/kb/en/overlaps/'),
(182, 'SET GLOBAL SQL_SLAVE_SKIP_COUNTER', 8, 'Syntax:\nSET GLOBAL sql_slave_skip_counter = N\n\nThis statement skips the next N events from the master. This is useful\nfor recovering from replication stops caused by a statement.\n\nThis statement is valid only when the slave threads are not running.\nOtherwise, it produces an error.\n\nURL: https://mariadb.com/kb/en/set-global-sql_slave_skip_counter/\n\n', '', 'https://mariadb.com/kb/en/set-global-sql_slave_skip_counter/'),
(183, 'NUMGEOMETRIES', 25, 'NumGeometries(gc)\n\nReturns the number of geometries in the GeometryCollection value gc.\n\nURL: https://mariadb.com/kb/en/numgeometries/\n\n', 'MariaDB> SET @gc = \'GeometryCollection(Point(1 1),LineString(2 2, 3 3))\';\nMariaDB> SELECT NumGeometries(GeomFromText(@gc));\n+----------------------------------+\n| NumGeometries(GeomFromText(@gc)) |\n+----------------------------------+\n|                                2 |\n+----------------------------------+\n', 'https://mariadb.com/kb/en/numgeometries/'),
(184, 'MONTHNAME', 31, 'Syntax:\nMONTHNAME(date)\n\nReturns the full name of the month for date. The language used for the\nname is controlled by the value of the lc_time_names system variable\n(https://mariadb.com/kb/en/server-locale/).\n\nURL: https://mariadb.com/kb/en/monthname/\n\n', 'MariaDB> SELECT MONTHNAME(\'2008-02-03\');\n        -> \'February\'\n', 'https://mariadb.com/kb/en/monthname/');
INSERT INTO `help_topic` (`help_topic_id`, `name`, `help_category_id`, `description`, `example`, `url`) VALUES
(185, 'CHANGE MASTER TO', 8, 'Syntax:\nCHANGE MASTER TO option [, option] ...\n\noption:\n    MASTER_BIND = \'interface_name\'\n  | MASTER_HOST = \'host_name\'\n  | MASTER_USER = \'user_name\'\n  | MASTER_PASSWORD = \'password\'\n  | MASTER_PORT = port_num\n  | MASTER_CONNECT_RETRY = interval\n  | MASTER_HEARTBEAT_PERIOD = interval\n  | MASTER_LOG_FILE = \'master_log_name\'\n  | MASTER_LOG_POS = master_log_pos\n  | RELAY_LOG_FILE = \'relay_log_name\'\n  | RELAY_LOG_POS = relay_log_pos\n  | MASTER_SSL = {0|1}\n  | MASTER_SSL_CA = \'ca_file_name\'\n  | MASTER_SSL_CAPATH = \'ca_directory_name\'\n  | MASTER_SSL_CERT = \'cert_file_name\'\n  | MASTER_SSL_KEY = \'key_file_name\'\n  | MASTER_SSL_CIPHER = \'cipher_list\'\n  | MASTER_SSL_VERIFY_SERVER_CERT = {0|1}\n  | IGNORE_SERVER_IDS = (server_id_list)\n\nserver_id_list:\n    [server_id [, server_id] ... ]\n\nCHANGE MASTER TO changes the parameters that the slave server uses for\nconnecting to the master server, for reading the master binary log, and\nreading the slave relay log. It also updates the contents of the\nmaster.info and relay-log.info files. To use CHANGE MASTER TO, the\nslave replication threads must be stopped (use STOP SLAVE if\nnecessary).\n\nOptions not specified retain their value, except as indicated in the\nfollowing discussion. Thus, in most cases, there is no need to specify\noptions that do not change. For example, if the password to connect to\nyour MySQL master has changed, you just need to issue these statements\nto tell the slave about the new password:\n\nSTOP SLAVE; -- if replication was running\nCHANGE MASTER TO MASTER_PASSWORD=\'new3cret\';\nSTART SLAVE; -- if you want to restart replication\n\nMASTER_HOST, MASTER_USER, MASTER_PASSWORD, and MASTER_PORT provide\ninformation to the slave about how to connect to its master:\n\no MASTER_HOST and MASTER_PORT are the host name (or IP address) of the\n  master host and its TCP/IP port.\n\n  *Note*: Replication cannot use Unix socket files. You must be able to\n  connect to the master MySQL server using TCP/IP.\n\n  If you specify the MASTER_HOST or MASTER_PORT option, the slave\n  assumes that the master server is different from before (even if the\n  option value is the same as its current value.) In this case, the old\n  values for the master binary log file name and position are\n  considered no longer applicable, so if you do not specify\n  MASTER_LOG_FILE and MASTER_LOG_POS in the statement,\n  MASTER_LOG_FILE=\'\' and MASTER_LOG_POS=4 are silently appended to it.\n\n  Setting MASTER_HOST=\'\' (that is, setting its value explicitly to an\n  empty string) is not the same as not setting MASTER_HOST at all.\n  Beginning with MySQL 5.5, trying to set MASTER_HOST to an empty\n  string fails with an error. Previously, setting MASTER_HOST to an\n  empty string caused START SLAVE subsequently to fail. (Bug #28796)\n\no MASTER_USER and MASTER_PASSWORD are the user name and password of the\n  account to use for connecting to the master.\n\n  In MySQL 5.5.20 and later, MASTER_USER cannot be made empty; setting\n  MASTER_USER = \'\' or leaving it unset when setting a value for for\n  MASTER_PASSWORD causes an error (Bug #13427949).\n\n  Currently, a password used for a replication slave account is\n  effectively limited to 32 characters in length; the password can be\n  longer, but any excess characters are truncated. This is not due to\n  any limit imposed by the MySQL Server generally, but rather is an\n  issue specific to MySQL Replication. (For more information, see Bug\n  #43439.)\n\n  The text of a running CHANGE MASTER TO statement, including values\n  for MASTER_USER and MASTER_PASSWORD, can be seen in the output of a\n  concurrent SHOW PROCESSLIST statement.\n\nThe MASTER_SSL_xxx options provide information about using SSL for the\nconnection. They correspond to the --ssl-xxx options described in\nhttps://mariadb.com/kb/en/ssl-server-system-variables/, and\nhttp://dev.mysql.com/doc/refman/5.5/en/replication-solutions-ssl.html.\nThese options can be changed even on slaves that are compiled without\nSSL support. They are saved to the master.info file, but are ignored if\nthe slave does not have SSL support enabled.\n\nMASTER_CONNECT_RETRY specifies how many seconds to wait between connect\nretries. The default is 60. The number of reconnection attempts is\nlimited by the --master-retry-count server option; for more\ninformation, see\nhttps://mariadb.com/kb/en/replication-and-binary-log-server-system-variables/.\n\nMASTER_HEARTBEAT_PERIOD sets the interval in seconds between\nreplication heartbeats. Whenever the master\'s binary log is updated\nwith an event, the waiting period for the next heartbeat is reset.\ninterval is a decimal value having the range 0 to 4294967 seconds and a\nresolution in milliseconds; the smallest nonzero value is 0.001.\nHeartbeats are sent by the master only if there are no unsent events in\nthe binary log file for a period longer than interval.\n\nSetting interval to 0 disables heartbeats altogether. The default value\nfor interval is equal to the value of slave_net_timeout divided by 2.\n\nSetting @@global.slave_net_timeout to a value less than that of the\ncurrent heartbeat interval results in a warning being issued. The\neffect of issuing RESET SLAVE on the heartbeat interval is to reset it\nto the default value.\n\nMASTER_LOG_FILE and MASTER_LOG_POS are the coordinates at which the\nslave I/O thread should begin reading from the master the next time the\nthread starts. RELAY_LOG_FILE and RELAY_LOG_POS are the coordinates at\nwhich the slave SQL thread should begin reading from the relay log the\nnext time the thread starts. If you specify either of MASTER_LOG_FILE\nor MASTER_LOG_POS, you cannot specify RELAY_LOG_FILE or RELAY_LOG_POS.\nIf neither of MASTER_LOG_FILE or MASTER_LOG_POS is specified, the slave\nuses the last coordinates of the slave SQL thread before CHANGE MASTER\nTO was issued. This ensures that there is no discontinuity in\nreplication, even if the slave SQL thread was late compared to the\nslave I/O thread, when you merely want to change, say, the password to\nuse.\n\nCHANGE MASTER TO deletes all relay log files and starts a new one,\nunless you specify RELAY_LOG_FILE or RELAY_LOG_POS. In that case, relay\nlog files are kept; the relay_log_purge global variable is set silently\nto 0.\n\nPrior to MySQL 5.5, RELAY_LOG_FILE required an absolute path. In MySQL\n5.5, the path can be relative, in which case the path is assumed to be\nrelative to the slave\'s data directory. (Bug #12190)\n\nIGNORE_SERVER_IDS was added in MySQL 5.5. This option takes a\ncomma-separated list of 0 or more server IDs. Events originating from\nthe corresponding servers are ignored, with the exception of log\nrotation and deletion events, which are still recorded in the relay\nlog.\n\nIn circular replication, the originating server normally acts as the\nterminator of its own events, so that they are not applied more than\nonce. Thus, this option is useful in circular replication when one of\nthe servers in the circle is removed. Suppose that you have a circular\nreplication setup with 4 servers, having server IDs 1, 2, 3, and 4, and\nserver 3 fails. When bridging the gap by starting replication from\nserver 2 to server 4, you can include IGNORE_SERVER_IDS = (3) in the\nCHANGE MASTER TO statement that you issue on server 4 to tell it to use\nserver 2 as its master instead of server 3. Doing so causes it to\nignore and not to propagate any statements that originated with the\nserver that is no longer in use.\n\nIf a CHANGE MASTER TO statement is issued without any IGNORE_SERVER_IDS\noption, any existing list is preserved; RESET SLAVE also has no effect\non the server ID list. To clear the list of ignored servers, it is\nnecessary to use the option with an empty list:\n\nCHANGE MASTER TO IGNORE_SERVER_IDS = ();\n\nIf IGNORE_SERVER_IDS contains the server\'s own ID and the server was\nstarted with the --replicate-same-server-id option enabled, an error\nresults.\n\nAlso beginning with MySQL 5.5, the master.info file and the output of\nSHOW SLAVE STATUS are extended to provide the list of servers that are\ncurrently ignored. For more information, see\nhttps://mariadb.com/kb/en/show-slave-status/, and\n[HELP SHOW SLAVE STATUS].\n\nBeginning with MySQL 5.5.5, invoking CHANGE MASTER TO causes the\nprevious values for MASTER_HOST, MASTER_PORT, MASTER_LOG_FILE, and\nMASTER_LOG_POS to be written to the error log, along with other\ninformation about the slave\'s state prior to execution.\n\nCHANGE MASTER TO is useful for setting up a slave when you have the\nsnapshot of the master and have recorded the master binary log\ncoordinates corresponding to the time of the snapshot. After loading\nthe snapshot into the slave to synchronize it to the slave, you can run\nCHANGE MASTER TO MASTER_LOG_FILE=\'log_name\', MASTER_LOG_POS=log_pos on\nthe slave to specify the coordinates at which the slave should begin\nreading the master binary log.\n\nThe following example changes the master server the slave uses and\nestablishes the master binary log coordinates from which the slave\nbegins reading. This is used when you want to set up the slave to\nreplicate the master:\n\nCHANGE MASTER TO\n  MASTER_HOST=\'master2.mycompany.com\',\n  MASTER_USER=\'replication\',\n  MASTER_PASSWORD=\'bigs3cret\',\n  MASTER_PORT=3306,\n  MASTER_LOG_FILE=\'master2-bin.001\',\n  MASTER_LOG_POS=4,\n  MASTER_CONNECT_RETRY=10;\n\nThe next example shows an operation that is less frequently employed.\nIt is used when the slave has relay log files that you want it to\nexecute again for some reason. To do this, the master need not be\nreachable. You need only use CHANGE MASTER TO and start the SQL thread\n(START SLAVE SQL_THREAD):\n\nCHANGE MASTER TO\n  RELAY_LOG_FILE=\'slave-relay-bin.006\',\n  RELAY_LOG_POS=4025;\n\nURL: https://mariadb.com/kb/en/change-master-to/\n\n', '', 'https://mariadb.com/kb/en/change-master-to/'),
(186, 'DROP DATABASE', 39, 'Syntax:\nDROP {DATABASE | SCHEMA} [IF EXISTS] db_name\n\nDROP DATABASE drops all tables in the database and deletes the\ndatabase. Be very careful with this statement! To use DROP DATABASE,\nyou need the DROP privilege on the database. DROP SCHEMA is a synonym\nfor DROP DATABASE.\n\n*Important*: When a database is dropped, user privileges on the\ndatabase are not automatically dropped. See [HELP GRANT].\n\nIF EXISTS is used to prevent an error from occurring if the database\ndoes not exist.\n\nURL: https://mariadb.com/kb/en/drop-database/\n\n', '', 'https://mariadb.com/kb/en/drop-database/'),
(187, 'MBREQUAL', 6, 'MBREqual(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 are the same.\n\nURL: https://mariadb.com/kb/en/mbrequal/\n\n', '', 'https://mariadb.com/kb/en/mbrequal/'),
(188, 'TIMESTAMP FUNCTION', 31, 'Syntax:\nTIMESTAMP(expr), TIMESTAMP(expr1,expr2)\n\nWith a single argument, this function returns the date or datetime\nexpression expr as a datetime value. With two arguments, it adds the\ntime expression expr2 to the date or datetime expression expr1 and\nreturns the result as a datetime value.\n\nURL: https://mariadb.com/kb/en/timestamp-function/\n\n', 'MariaDB> SELECT TIMESTAMP(\'2003-12-31\');\n        -> \'2003-12-31 00:00:00\'\nMariaDB> SELECT TIMESTAMP(\'2003-12-31 12:00:00\',\'12:00:00\');\n        -> \'2004-01-01 00:00:00\'\n', 'https://mariadb.com/kb/en/timestamp-function/'),
(189, 'PROCEDURE ANALYSE', 33, 'Syntax:\nANALYSE([max_elements[,max_memory]])\n\nANALYSE() examines the result from a query and returns an analysis of\nthe results that suggests optimal data types for each column that may\nhelp reduce table sizes. To obtain this analysis, append PROCEDURE\nANALYSE to the end of a SELECT statement:\n\nSELECT ... FROM ... WHERE ... PROCEDURE ANALYSE([max_elements,[max_memory]])\n\nFor example:\n\nSELECT col1, col2 FROM table1 PROCEDURE ANALYSE(10, 2000);\n\nThe results show some statistics for the values returned by the query,\nand propose an optimal data type for the columns. This can be helpful\nfor checking your existing tables, or after importing new data. You may\nneed to try different settings for the arguments so that PROCEDURE\nANALYSE() does not suggest the ENUM data type when it is not\nappropriate.\n\nThe arguments are optional and are used as follows:\n\no max_elements (default 256) is the maximum number of distinct values\n  that ANALYSE() notices per column. This is used by ANALYSE() to check\n  whether the optimal data type should be of type ENUM; if there are\n  more than max_elements distinct values, then ENUM is not a suggested\n  type.\n\no max_memory (default 8192) is the maximum amount of memory that\n  ANALYSE() should allocate per column while trying to find all\n  distinct values.\n\nURL: https://mariadb.com/kb/en/procedure-analyse/\n\n', '', 'https://mariadb.com/kb/en/procedure-analyse/'),
(190, 'HELP_VERSION', 9, 'This help information was generated from the MySQL 5.5 Reference Manual\non: 2012-08-25 (revision: 31914)\n\nThis information applies to MySQL 5.5 through 5.5.29.\n', '', ''),
(191, 'CHARACTER_LENGTH', 37, 'Syntax:\nCHARACTER_LENGTH(str)\n\nCHARACTER_LENGTH() is a synonym for CHAR_LENGTH().\n\nURL: https://mariadb.com/kb/en/character_length/\n\n', '', 'https://mariadb.com/kb/en/character_length/'),
(192, 'SHOW GRANTS', 26, 'Syntax:\nSHOW GRANTS [FOR user]\n\nThis statement lists the GRANT statement or statements that must be\nissued to duplicate the privileges that are granted to a MySQL user\naccount. The account is named using the same format as for the GRANT\nstatement; for example, \'jeffrey\'@\'localhost\'. If you specify only the\nuser name part of the account name, a host name part of \'%\' is used.\nFor additional information about specifying account names, see [HELP\nGRANT].\n\nMariaDB> SHOW GRANTS FOR \'root\'@\'localhost\';\n+---------------------------------------------------------------------+\n| Grants for root@localhost                                           |\n+---------------------------------------------------------------------+\n| GRANT ALL PRIVILEGES ON *.* TO \'root\'@\'localhost\' WITH GRANT OPTION |\n+---------------------------------------------------------------------+\n\nTo list the privileges granted to the account that you are using to\nconnect to the server, you can use any of the following statements:\n\nSHOW GRANTS;\nSHOW GRANTS FOR CURRENT_USER;\nSHOW GRANTS FOR CURRENT_USER();\n\nIf SHOW GRANTS FOR CURRENT_USER (or any of the equivalent syntaxes) is\nused in DEFINER context, such as within a stored procedure that is\ndefined with SQL SECURITY DEFINER), the grants displayed are those of\nthe definer and not the invoker.\n\nURL: https://mariadb.com/kb/en/show-grants/\n\n', '', 'https://mariadb.com/kb/en/show-grants/'),
(193, 'SHOW PRIVILEGES', 26, 'Syntax:\nSHOW PRIVILEGES\n\nSHOW PRIVILEGES shows the list of system privileges that the MySQL\nserver supports. The exact list of privileges depends on the version of\nyour server.\n\nURL: https://mariadb.com/kb/en/show-privileges/\n\n', '', 'https://mariadb.com/kb/en/show-privileges/'),
(194, 'CREATE TABLESPACE', 39, 'Syntax:\nCREATE TABLESPACE tablespace_name\n    ADD DATAFILE \'file_name\'\n    USE LOGFILE GROUP logfile_group\n    [EXTENT_SIZE [=] extent_size]\n    [INITIAL_SIZE [=] initial_size]\n    [AUTOEXTEND_SIZE [=] autoextend_size]\n    [MAX_SIZE [=] max_size]\n    [NODEGROUP [=] nodegroup_id]\n    [WAIT]\n    [COMMENT [=] comment_text]\n    ENGINE [=] engine_name\n\nThis statement is used with NDB cluster, which is not supported by MariaDB.', '', 'https://mariadb.com/kb/en/create-tablespace/'),
(195, 'INSERT FUNCTION', 37, 'Syntax:\nINSERT(str,pos,len,newstr)\n\nReturns the string str, with the substring beginning at position pos\nand len characters long replaced by the string newstr. Returns the\noriginal string if pos is not within the length of the string. Replaces\nthe rest of the string from position pos if len is not within the\nlength of the rest of the string. Returns NULL if any argument is NULL.\n\nURL: https://mariadb.com/kb/en/insert-function/\n\n', 'MariaDB> SELECT INSERT(\'Quadratic\', 3, 4, \'What\');\n        -> \'QuWhattic\'\nMariaDB> SELECT INSERT(\'Quadratic\', -1, 4, \'What\');\n        -> \'Quadratic\'\nMariaDB> SELECT INSERT(\'Quadratic\', 3, 100, \'What\');\n        -> \'QuWhat\'\n', 'https://mariadb.com/kb/en/insert-function/'),
(196, 'CRC32', 4, 'Syntax:\nCRC32(expr)\n\nComputes a cyclic redundancy check value and returns a 32-bit unsigned\nvalue. The result is NULL if the argument is NULL. The argument is\nexpected to be a string and (if possible) is treated as one if it is\nnot.\n\nURL: https://mariadb.com/kb/en/crc32/\n\n', 'MariaDB> SELECT CRC32(\'MySQL\');\n        -> 3259397556\nMariaDB> SELECT CRC32(\'mysql\');\n        -> 2501908538\n', 'https://mariadb.com/kb/en/crc32/'),
(197, 'XOR', 15, 'Syntax:\nXOR\n\nLogical XOR. Returns NULL if either operand is NULL. For non-NULL\noperands, evaluates to 1 if an odd number of operands is nonzero,\notherwise 0 is returned.\n\nURL: https://mariadb.com/kb/en/xor/\n\n', 'MariaDB> SELECT 1 XOR 1;\n        -> 0\nMariaDB> SELECT 1 XOR 0;\n        -> 1\nMariaDB> SELECT 1 XOR NULL;\n        -> NULL\nMariaDB> SELECT 1 XOR 1 XOR 1;\n        -> 1\n', 'https://mariadb.com/kb/en/xor/'),
(198, 'STARTPOINT', 13, 'StartPoint(ls)\n\nReturns the Point that is the start point of the LineString value ls.\n\nURL: https://mariadb.com/kb/en/startpoint/\n\n', 'MariaDB> SET @ls = \'LineString(1 1,2 2,3 3)\';\nMariaDB> SELECT AsText(StartPoint(GeomFromText(@ls)));\n+---------------------------------------+\n| AsText(StartPoint(GeomFromText(@ls))) |\n+---------------------------------------+\n| POINT(1 1)                            |\n+---------------------------------------+\n', 'https://mariadb.com/kb/en/startpoint/'),
(199, 'GRANT', 10, 'Syntax:\nGRANT\n    priv_type [(column_list)]\n      [, priv_type [(column_list)]] ...\n    ON [object_type] priv_level\n    TO user_specification [, user_specification] ...\n    [REQUIRE {NONE | ssl_option [[AND] ssl_option] ...}]\n    [WITH with_option ...]\n\nGRANT PROXY ON user_specification\n    TO user_specification [, user_specification] ...\n    [WITH GRANT OPTION]\n\nobject_type:\n    TABLE\n  | FUNCTION\n  | PROCEDURE\n\npriv_level:\n    *\n  | *.*\n  | db_name.*\n  | db_name.tbl_name\n  | tbl_name\n  | db_name.routine_name\n\nuser_specification:\n    user\n    [\n        IDENTIFIED BY [PASSWORD] \'password\'\n      | IDENTIFIED WITH auth_plugin [AS \'auth_string\']\n    ]\n\nssl_option:\n    SSL\n  | X509\n  | CIPHER \'cipher\'\n  | ISSUER \'issuer\'\n  | SUBJECT \'subject\'\n\nwith_option:\n    GRANT OPTION\n  | MAX_QUERIES_PER_HOUR count\n  | MAX_UPDATES_PER_HOUR count\n  | MAX_CONNECTIONS_PER_HOUR count\n  | MAX_USER_CONNECTIONS count\n\nThe GRANT statement grants privileges to MySQL user accounts. GRANT\nalso serves to specify other account characteristics such as use of\nsecure connections and limits on access to server resources. To use\nGRANT, you must have the GRANT OPTION privilege, and you must have the\nprivileges that you are granting.\n\nNormally, a database administrator first uses CREATE USER to create an\naccount, then GRANT to define its privileges and characteristics. For\nexample:\n\nCREATE USER \'jeffrey\'@\'localhost\' IDENTIFIED BY \'mypass\';\nGRANT ALL ON db1.* TO \'jeffrey\'@\'localhost\';\nGRANT SELECT ON db2.invoice TO \'jeffrey\'@\'localhost\';\nGRANT USAGE ON *.* TO \'jeffrey\'@\'localhost\' WITH MAX_QUERIES_PER_HOUR 90;\n\nHowever, if an account named in a GRANT statement does not already\nexist, GRANT may create it under the conditions described later in the\ndiscussion of the NO_AUTO_CREATE_USER SQL mode.\n\nThe REVOKE statement is related to GRANT and enables administrators to\nremove account privileges. See [HELP REVOKE].\n\nWhen successfully executed from the mysql program, GRANT responds with\nQuery OK, 0 rows affected. To determine what privileges result from the\noperation, use SHOW GRANTS. See [HELP SHOW GRANTS].\n\nURL: https://mariadb.com/kb/en/grant/\n\n', '', 'https://mariadb.com/kb/en/grant/'),
(200, 'DECLARE VARIABLE', 23, 'Syntax:\nDECLARE var_name [, var_name] ... type [DEFAULT value]\n\nThis statement declares local variables within stored programs. To\nprovide a default value for a variable, include a DEFAULT clause. The\nvalue can be specified as an expression; it need not be a constant. If\nthe DEFAULT clause is missing, the initial value is NULL.\n\nLocal variables are treated like stored routine parameters with respect\nto data type and overflow checking. See [HELP CREATE PROCEDURE].\n\nVariable declarations must appear before cursor or handler\ndeclarations.\n\nLocal variable names are not case sensitive. Permissible characters and\nquoting rules are the same as for other identifiers, as described in\nhttps://mariadb.com/kb/en/identifier-names/.\n\nThe scope of a local variable is the BEGIN ... END block within which\nit is declared. The variable can be referred to in blocks nested within\nthe declaring block, except those blocks that declare a variable with\nthe same name.\n\nURL: https://mariadb.com/kb/en/declare-variable/\n\n', '', 'https://mariadb.com/kb/en/declare-variable/'),
(201, 'MPOLYFROMTEXT', 3, 'MPolyFromText(wkt[,srid]), MultiPolygonFromText(wkt[,srid])\n\nConstructs a MULTIPOLYGON value using its WKT representation and SRID.\n\nURL: https://mariadb.com/kb/en/mpolyfromtext/\n\n', '', 'https://mariadb.com/kb/en/mpolyfromtext/'),
(202, 'MBRINTERSECTS', 6, 'MBRIntersects(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 intersect.\n\nURL: https://mariadb.com/kb/en/mbrintersects/\n\n', '', 'https://mariadb.com/kb/en/mbrintersects/'),
(203, 'BIT_OR', 16, 'Syntax:\nBIT_OR(expr)\n\nReturns the bitwise OR of all bits in expr. The calculation is\nperformed with 64-bit (BIGINT) precision.\n\nURL: https://mariadb.com/kb/en/bit_or/\n\n', '', 'https://mariadb.com/kb/en/bit_or/'),
(204, 'YEARWEEK', 31, 'Syntax:\nYEARWEEK(date), YEARWEEK(date,mode)\n\nReturns year and week for a date. The mode argument works exactly like\nthe mode argument to WEEK(). The year in the result may be different\nfrom the year in the date argument for the first and the last week of\nthe year.\n\nURL: https://mariadb.com/kb/en/yearweek/\n\n', 'MariaDB> SELECT YEARWEEK(\'1987-01-01\');\n        -> 198653\n', 'https://mariadb.com/kb/en/yearweek/'),
(205, 'NOT BETWEEN', 18, 'Syntax:\nexpr NOT BETWEEN min AND max\n\nThis is the same as NOT (expr BETWEEN min AND max).\n\nURL: https://mariadb.com/kb/en/not-between/\n\n', '', 'https://mariadb.com/kb/en/not-between/'),
(206, 'IS NOT', 18, 'Syntax:\nIS NOT boolean_value\n\nTests a value against a boolean value, where boolean_value can be TRUE,\nFALSE, or UNKNOWN.\n\nURL: https://mariadb.com/kb/en/is-not/\n\n', 'MariaDB> SELECT 1 IS NOT UNKNOWN, 0 IS NOT UNKNOWN, NULL IS NOT UNKNOWN;\n        -> 1, 1, 0\n', 'https://mariadb.com/kb/en/is-not/'),
(207, 'LOG10', 4, 'Syntax:\nLOG10(X)\n\nReturns the base-10 logarithm of X.\n\nURL: https://mariadb.com/kb/en/log10/\n\n', 'MariaDB> SELECT LOG10(2);\n        -> 0.30102999566398\nMariaDB> SELECT LOG10(100);\n        -> 2\nMariaDB> SELECT LOG10(-100);\n        -> NULL\n', 'https://mariadb.com/kb/en/log10/'),
(208, 'SQRT', 4, 'Syntax:\nSQRT(X)\n\nReturns the square root of a nonnegative number X.\n\nURL: https://mariadb.com/kb/en/sqrt/\n\n', 'MariaDB> SELECT SQRT(4);\n        -> 2\nMariaDB> SELECT SQRT(20);\n        -> 4.4721359549996\nMariaDB> SELECT SQRT(-16);\n        -> NULL\n', 'https://mariadb.com/kb/en/sqrt/'),
(209, 'DECIMAL', 22, 'DECIMAL[(M[,D])] [UNSIGNED] [ZEROFILL]\n\nA packed \"exact\" fixed-point number. M is the total number of digits\n(the precision) and D is the number of digits after the decimal point\n(the scale). The decimal point and (for negative numbers) the \"-\" sign\nare not counted in M. If D is 0, values have no decimal point or\nfractional part. The maximum number of digits (M) for DECIMAL is 65.\nThe maximum number of supported decimals (D) is 30. If D is omitted,\nthe default is 0. If M is omitted, the default is 10.\n\nUNSIGNED, if specified, disallows negative values.\n\nAll basic calculations (+, -, *, /) with DECIMAL columns are done with\na precision of 65 digits.\n\nURL: https://mariadb.com/kb/en/decimal/\n\n', '', 'https://mariadb.com/kb/en/decimal/'),
(210, 'CREATE INDEX', 39, 'Syntax:\nCREATE [ONLINE|OFFLINE] [UNIQUE|FULLTEXT|SPATIAL] INDEX index_name\n    [index_type]\n    ON tbl_name (index_col_name,...)\n    [index_option] ...\n\nindex_col_name:\n    col_name [(length)] [ASC | DESC]\n\nindex_type:\n    USING {BTREE | HASH}\n\nindex_option:\n    KEY_BLOCK_SIZE [=] value\n  | index_type\n  | WITH PARSER parser_name\n  | COMMENT \'string\'\n\nCREATE INDEX is mapped to an ALTER TABLE statement to create indexes.\nSee [HELP ALTER TABLE]. CREATE INDEX cannot be used to create a PRIMARY\nKEY; use ALTER TABLE instead. For more information about indexes, see\nhttps://mariadb.com/kb/en/optimization-and-indexes/.\n\nURL: https://mariadb.com/kb/en/create-index/\n\n', '', 'https://mariadb.com/kb/en/create-index/'),
(211, 'CREATE FUNCTION', 39, 'The CREATE FUNCTION statement is used to create stored functions and\nuser-defined functions (UDFs):\n\no For information about creating stored functions, see [HELP CREATE\n  PROCEDURE].\n\no For information about creating user-defined functions, see [HELP\n  CREATE FUNCTION UDF].\n\nURL: https://mariadb.com/kb/en/create-function/\n\n', '', 'https://mariadb.com/kb/en/create-function/'),
(212, 'ALTER DATABASE', 39, 'Syntax:\nALTER {DATABASE | SCHEMA} [db_name]\n    alter_specification ...\nALTER {DATABASE | SCHEMA} db_name\n    UPGRADE DATA DIRECTORY NAME\n\nalter_specification:\n    [DEFAULT] CHARACTER SET [=] charset_name\n  | [DEFAULT] COLLATE [=] collation_name\n\nALTER DATABASE enables you to change the overall characteristics of a\ndatabase. These characteristics are stored in the db.opt file in the\ndatabase directory. To use ALTER DATABASE, you need the ALTER privilege\non the database. ALTER SCHEMA is a synonym for ALTER DATABASE.\n\nThe database name can be omitted from the first syntax, in which case\nthe statement applies to the default database.\n\nNational Language Characteristics\n\nThe CHARACTER SET clause changes the default database character set.\nThe COLLATE clause changes the default database collation.\nhttps://mariadb.com/kb/en/data-types-character-sets-and-collations/, discusses\ncharacter set and collation names.\n\nYou can see what character sets and collations are available using,\nrespectively, the SHOW CHARACTER SET and SHOW COLLATION statements. See\n[HELP SHOW CHARACTER SET], and [HELP SHOW COLLATION], for more\ninformation.\n\nIf you change the default character set or collation for a database,\nstored routines that use the database defaults must be dropped and\nrecreated so that they use the new defaults. (In a stored routine,\nvariables with character data types use the database defaults if the\ncharacter set or collation are not specified explicitly. See [HELP\nCREATE PROCEDURE].)\n\nUpgrading from Versions Older than MySQL 5.1\n\nThe syntax that includes the UPGRADE DATA DIRECTORY NAME clause updates\nthe name of the directory associated with the database to use the\nencoding implemented in MySQL 5.1 for mapping database names to\ndatabase directory names (see\nhttps://mariadb.com/kb/en/identifier-to-file-name-mapping/). This\nclause is for use under these conditions:\n\no It is intended when upgrading MySQL to 5.1 or later from older\n  versions.\n\no It is intended to update a database directory name to the current\n  encoding format if the name contains special characters that need\n  encoding.\n\no The statement is used by mysqlcheck (as invoked by mysql_upgrade).\n\nFor example, if a database in MySQL 5.0 has the name a-b-c, the name\ncontains instances of the - (dash) character. In MySQL 5.0, the\ndatabase directory is also named a-b-c, which is not necessarily safe\nfor all file systems. In MySQL 5.1 and later, the same database name is\nencoded as a@002db@002dc to produce a file system-neutral directory\nname.\n\nWhen a MySQL installation is upgraded to MySQL 5.1 or later from an\nolder version,the server displays a name such as a-b-c (which is in the\nold format) as #mysql50#a-b-c, and you must refer to the name using the\n#mysql50# prefix. Use UPGRADE DATA DIRECTORY NAME in this case to\nexplicitly tell the server to re-encode the database directory name to\nthe current encoding format:\n\nALTER DATABASE `#mysql50#a-b-c` UPGRADE DATA DIRECTORY NAME;\n\nAfter executing this statement, you can refer to the database as a-b-c\nwithout the special #mysql50# prefix.\n\nURL: https://mariadb.com/kb/en/alter-database/\n\n', '', 'https://mariadb.com/kb/en/alter-database/'),
(213, 'GEOMETRYN', 25, 'GeometryN(gc,N)\n\nReturns the N-th geometry in the GeometryCollection value gc.\nGeometries are numbered beginning with 1.\n\nURL: https://mariadb.com/kb/en/geometryn/\n\n', 'MariaDB> SET @gc = \'GeometryCollection(Point(1 1),LineString(2 2, 3 3))\';\nMariaDB> SELECT AsText(GeometryN(GeomFromText(@gc),1));\n+----------------------------------------+\n| AsText(GeometryN(GeomFromText(@gc),1)) |\n+----------------------------------------+\n| POINT(1 1)                             |\n+----------------------------------------+\n', 'https://mariadb.com/kb/en/geometryn/'),
(214, '<<', 19, 'Syntax:\n<<\n\nShifts a longlong (BIGINT) number to the left.\n\nURL: https://mariadb.com/kb/en/shift-left/\n\n', 'MariaDB> SELECT 1 << 2;\n        -> 4\n', 'https://mariadb.com/kb/en/shift-left/'),
(215, 'SHOW TABLE STATUS', 26, 'Syntax:\nSHOW TABLE STATUS [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW TABLE STATUS works likes SHOW TABLES, but provides a lot of\ninformation about each non-TEMPORARY table. You can also get this list\nusing the mysqlshow --status db_name command. The LIKE clause, if\npresent, indicates which table names to match. The WHERE clause can be\ngiven to select rows using more general conditions, as discussed in\nhttps://mariadb.com/kb/en/extended-show/.\n\nURL: https://mariadb.com/kb/en/show-table-status/\n\n', '', 'https://mariadb.com/kb/en/show-table-status/'),
(216, 'MD5', 12, 'Syntax:\nMD5(str)\n\nCalculates an MD5 128-bit checksum for the string. The value is\nreturned as a string of 32 hex digits, or NULL if the argument was\nNULL. The return value can, for example, be used as a hash key. See the\nnotes at the beginning of this section about storing hash values\nefficiently.\n\nAs of MySQL 5.5.3, the return value is a nonbinary string in the\nconnection character set. Before 5.5.3, the return value is a binary\nstring; see the notes at the beginning of this section about using the\nvalue as a nonbinary string.\n\nURL: https://mariadb.com/kb/en/md5/\n\n', 'MariaDB> SELECT MD5(\'testing\');\n        -> \'ae2b1fca515949e5d54fb22b8ed95575\'\n', 'https://mariadb.com/kb/en/md5/'),
(217, '<', 18, 'Syntax:\n<\n\nLess than:\n\nURL: https://mariadb.com/kb/en/less-than/\n\n', 'MariaDB> SELECT 2 < 2;\n        -> 0\n', 'https://mariadb.com/kb/en/less-than/'),
(218, 'UNIX_TIMESTAMP', 31, 'Syntax:\nUNIX_TIMESTAMP(), UNIX_TIMESTAMP(date)\n\nIf called with no argument, returns a Unix timestamp (seconds since\n\'1970-01-01 00:00:00\' UTC) as an unsigned integer. If UNIX_TIMESTAMP()\nis called with a date argument, it returns the value of the argument as\nseconds since \'1970-01-01 00:00:00\' UTC. date may be a DATE string, a\nDATETIME string, a TIMESTAMP, or a number in the format YYMMDD or\nYYYYMMDD. The server interprets date as a value in the current time\nzone and converts it to an internal value in UTC. Clients can set their\ntime zone as described in\nhttps://mariadb.com/kb/en/time-zones/.\n\nURL: https://mariadb.com/kb/en/unix_timestamp/\n\n', 'MariaDB> SELECT UNIX_TIMESTAMP();\n        -> 1196440210\nMariaDB> SELECT UNIX_TIMESTAMP(\'2007-11-30 10:30:19\');\n        -> 1196440219\n', 'https://mariadb.com/kb/en/unix_timestamp/'),
(219, 'DAYOFMONTH', 31, 'Syntax:\nDAYOFMONTH(date)\n\nReturns the day of the month for date, in the range 1 to 31, or 0 for\ndates such as \'0000-00-00\' or \'2008-00-00\' that have a zero day part.\n\nURL: https://mariadb.com/kb/en/dayofmonth/\n\n', 'MariaDB> SELECT DAYOFMONTH(\'2007-02-03\');\n        -> 3\n', 'https://mariadb.com/kb/en/dayofmonth/'),
(220, 'ASCII', 37, 'Syntax:\nASCII(str)\n\nReturns the numeric value of the leftmost character of the string str.\nReturns 0 if str is the empty string. Returns NULL if str is NULL.\nASCII() works for 8-bit characters.\n\nURL: https://mariadb.com/kb/en/ascii/\n\n', 'MariaDB> SELECT ASCII(\'2\');\n        -> 50\nMariaDB> SELECT ASCII(2);\n        -> 50\nMariaDB> SELECT ASCII(\'dx\');\n        -> 100\n', 'https://mariadb.com/kb/en/ascii/'),
(221, 'DIV', 4, 'Syntax:\nDIV\n\nInteger division. Similar to FLOOR(), but is safe with BIGINT values.\n\nAs of MySQL 5.5.3, if either operand has a noninteger type, the\noperands are converted to DECIMAL and divided using DECIMAL arithmetic\nbefore converting the result to BIGINT. If the result exceeds BIGINT\nrange, an error occurs. Before MySQL 5.5.3, incorrect results may occur\nfor noninteger operands that exceed BIGINT range.\n\nURL: https://mariadb.com/kb/en/div/\n\n', 'MariaDB> SELECT 5 DIV 2;\n        -> 2\n', 'https://mariadb.com/kb/en/div/'),
(222, 'RENAME USER', 10, 'Syntax:\nRENAME USER old_user TO new_user\n    [, old_user TO new_user] ...\n\nThe RENAME USER statement renames existing MySQL accounts. To use it,\nyou must have the global CREATE USER privilege or the UPDATE privilege\nfor the mysql database. An error occurs if any old account does not\nexist or any new account exists. Each account name uses the format\ndescribed in https://mariadb.com/kb/en/create-user/#account-names.\nFor example:\n\nRENAME USER \'jeffrey\'@\'localhost\' TO \'jeff\'@\'127.0.0.1\';\n\nIf you specify only the user name part of the account name, a host name\npart of \'%\' is used.\n\nRENAME USER causes the privileges held by the old user to be those held\nby the new user. However, RENAME USER does not automatically drop or\ninvalidate databases or objects within them that the old user created.\nThis includes stored programs or views for which the DEFINER attribute\nnames the old user. Attempts to access such objects may produce an\nerror if they execute in definer security context. (For information\nabout security context, see\nhttps://mariadb.com/kb/en/stored-routine-privileges/.)\n\nThe privilege changes take effect as indicated in\nhttp://dev.mysql.com/doc/refman/5.5/en/privilege-changes.html.\n\nURL: https://mariadb.com/kb/en/rename-user/\n\n', '', 'https://mariadb.com/kb/en/rename-user/'),
(223, 'SHOW SLAVE STATUS', 26, 'Syntax:\nSHOW SLAVE STATUS\n\nThis statement provides status information on essential parameters of\nthe slave threads. It requires either the SUPER or REPLICATION CLIENT\nprivilege.\n\nIf you issue this statement using the mysql client, you can use a \\G\nstatement terminator rather than a semicolon to obtain a more readable\nvertical layout:\n\nMariaDB> SHOW SLAVE STATUS\\G\n*************************** 1. row ***************************\n               Slave_IO_State: Waiting for master to send event\n                  Master_Host: localhost\n                  Master_User: root\n                  Master_Port: 3306\n                Connect_Retry: 3\n              Master_Log_File: gbichot-bin.005\n          Read_Master_Log_Pos: 79\n               Relay_Log_File: gbichot-relay-bin.005\n                Relay_Log_Pos: 548\n        Relay_Master_Log_File: gbichot-bin.005\n             Slave_IO_Running: Yes\n            Slave_SQL_Running: Yes\n              Replicate_Do_DB:\n          Replicate_Ignore_DB:\n           Replicate_Do_Table:\n       Replicate_Ignore_Table:\n      Replicate_Wild_Do_Table:\n  Replicate_Wild_Ignore_Table:\n                   Last_Errno: 0\n                   Last_Error:\n                 Skip_Counter: 0\n          Exec_Master_Log_Pos: 79\n              Relay_Log_Space: 552\n              Until_Condition: None\n               Until_Log_File:\n                Until_Log_Pos: 0\n           Master_SSL_Allowed: No\n           Master_SSL_CA_File:\n           Master_SSL_CA_Path:\n              Master_SSL_Cert:\n            Master_SSL_Cipher:\n               Master_SSL_Key:\n        Seconds_Behind_Master: 8\nMaster_SSL_Verify_Server_Cert: No\n                Last_IO_Errno: 0\n                Last_IO_Error:\n               Last_SQL_Errno: 0\n               Last_SQL_Error:\n  Replicate_Ignore_Server_Ids: 0\n             Master_Server_Id: 1\n\nURL: https://mariadb.com/kb/en/show-slave-status/\n\n', '', 'https://mariadb.com/kb/en/show-slave-status/'),
(224, 'GEOMETRY', 34, 'MySQL provides a standard way of creating spatial columns for geometry\ntypes, for example, with CREATE TABLE or ALTER TABLE. Currently,\nspatial columns are supported for MyISAM, Aria, InnoDB and ARCHIVE\ntables. See also the annotations about spatial indexes under [HELP\nSPATIAL].\n\nURL: https://mariadb.com/kb/en/gis-functionality/\n\n', 'CREATE TABLE geom (g GEOMETRY);\n', 'https://mariadb.com/kb/en/gis-functionality/'),
(225, 'NUMPOINTS', 13, 'NumPoints(ls)\n\nReturns the number of Point objects in the LineString value ls.\n\nURL: https://mariadb.com/kb/en/numpoints/\n\n', 'MariaDB> SET @ls = \'LineString(1 1,2 2,3 3)\';\nMariaDB> SELECT NumPoints(GeomFromText(@ls));\n+------------------------------+\n| NumPoints(GeomFromText(@ls)) |\n+------------------------------+\n|                            3 |\n+------------------------------+\n', 'https://mariadb.com/kb/en/numpoints/'),
(226, 'ALTER LOGFILE GROUP', 39, 'Syntax:\nALTER LOGFILE GROUP logfile_group\n    ADD UNDOFILE \'file_name\'\n    [INITIAL_SIZE [=] size]\n    [WAIT]\n    ENGINE [=] engine_name\n\nThis statement is used with NDB cluster, which is not supported by MariaDB.\n', '', 'https://mariadb.com/kb/en/alter-logfile-group/'),
(227, '&', 19, 'Syntax:\n&\n\nBitwise AND:\n\nURL: https://mariadb.com/kb/en/bitwise_and/\n\n', 'MariaDB> SELECT 29 & 15;\n        -> 13\n', 'https://mariadb.com/kb/en/bitwise_and/'),
(228, 'LOCALTIMESTAMP', 31, 'Syntax:\nLOCALTIMESTAMP, LOCALTIMESTAMP()\n\nLOCALTIMESTAMP and LOCALTIMESTAMP() are synonyms for NOW().\n\nURL: https://mariadb.com/kb/en/localtimestamp/\n\n', '', 'https://mariadb.com/kb/en/localtimestamp/'),
(229, 'ASSIGN-EQUAL', 15, 'Syntax:\n=\n\nThis operator is used to perform value assignments in two cases,\ndescribed in the next two paragraphs.\n\nWithin a SET statement, = is treated as an assignment operator that\ncauses the user variable on the left hand side of the operator to take\non the value to its right. (In other words, when used in a SET\nstatement, = is treated identically to :=.) The value on the right hand\nside may be a literal value, another variable storing a value, or any\nlegal expression that yields a scalar value, including the result of a\nquery (provided that this value is a scalar value). You can perform\nmultiple assignments in the same SET statement.\n\nIn the SET clause of an UPDATE statement, = also acts as an assignment\noperator; in this case, however, it causes the column named on the left\nhand side of the operator to assume the value given to the right,\nprovided any WHERE conditions that are part of the UPDATE are met. You\ncan make multiple assignments in the same SET clause of an UPDATE\nstatement.\n\nIn any other context, = is treated as a comparison operator.\n\nURL: https://mariadb.com/kb/en/assignment-operators-assignment-operator/\n\n', 'MariaDB> SELECT @var1, @var2;\n        -> NULL, NULL\nMariaDB> SELECT @var1 := 1, @var2;\n        -> 1, NULL\nMariaDB> SELECT @var1, @var2;\n        -> 1, NULL\nMariaDB> SELECT @var1, @var2 := @var1;\n        -> 1, 1\nMariaDB> SELECT @var1, @var2;\n        -> 1, 1\n', 'https://mariadb.com/kb/en/assignment-operators-assignment-operator/'),
(230, 'CONVERT', 37, 'Syntax:\nCONVERT(expr,type), CONVERT(expr USING transcoding_name)\n\nThe CONVERT() and CAST() functions take an expression of any type and\nproduce a result value of a specified type.\n\nThe type for the result can be one of the following values:\n\no BINARY[(N)]\n\no CHAR[(N)]\n\no DATE\n\no DATETIME\n\no DECIMAL[(M[,D])]\n\no SIGNED [INTEGER]\n\no TIME\n\no UNSIGNED [INTEGER]\n\nBINARY produces a string with the BINARY data type. See\nhttps://mariadb.com/kb/en/binary/ for a\ndescription of how this affects comparisons. If the optional length N\nis given, BINARY(N) causes the cast to use no more than N bytes of the\nargument. Values shorter than N bytes are padded with 0x00 bytes to a\nlength of N.\n\nCHAR(N) causes the cast to use no more than N characters of the\nargument.\n\nCAST() and CONVERT(... USING ...) are standard SQL syntax. The\nnon-USING form of CONVERT() is ODBC syntax.\n\nCONVERT() with USING is used to convert data between different\ncharacter sets. In MySQL, transcoding names are the same as the\ncorresponding character set names. For example, this statement converts\nthe string \'abc\' in the default character set to the corresponding\nstring in the utf8 character set:\n\nSELECT CONVERT(\'abc\' USING utf8);\n\nURL: https://mariadb.com/kb/en/convert/\n\n', 'SELECT enum_col FROM tbl_name ORDER BY CAST(enum_col AS CHAR);\n', 'https://mariadb.com/kb/en/convert/'),
(231, 'ADDDATE', 31, 'Syntax:\nADDDATE(date,INTERVAL expr unit), ADDDATE(expr,days)\n\nWhen invoked with the INTERVAL form of the second argument, ADDDATE()\nis a synonym for DATE_ADD(). The related function SUBDATE() is a\nsynonym for DATE_SUB(). For information on the INTERVAL unit argument,\nsee the discussion for DATE_ADD().\n\nMariaDB> SELECT DATE_ADD(\'2008-01-02\', INTERVAL 31 DAY);\n        -> \'2008-02-02\'\nMariaDB> SELECT ADDDATE(\'2008-01-02\', INTERVAL 31 DAY);\n        -> \'2008-02-02\'\n\nWhen invoked with the days form of the second argument, MySQL treats it\nas an integer number of days to be added to expr.\n\nURL: https://mariadb.com/kb/en/adddate/\n\n', 'MariaDB> SELECT ADDDATE(\'2008-01-02\', 31);\n        -> \'2008-02-02\'\n', 'https://mariadb.com/kb/en/adddate/'),
(232, 'REPEAT LOOP', 23, 'Syntax:\n[begin_label:] REPEAT\n    statement_list\nUNTIL search_condition\nEND REPEAT [end_label]\n\nThe statement list within a REPEAT statement is repeated until the\nsearch_condition expression is true. Thus, a REPEAT always enters the\nloop at least once. statement_list consists of one or more statements,\neach terminated by a semicolon (;) statement delimiter.\n\nA REPEAT statement can be labeled. For the rules regarding label use,\nsee [HELP labels].\n\nURL: https://mariadb.com/kb/en/repeat-loop/\n\n', 'MariaDB> delimiter //\n\nMariaDB> CREATE PROCEDURE dorepeat(p1 INT)\n    -> BEGIN\n    ->   SET @x = 0;\n    ->   REPEAT\n    ->     SET @x = @x + 1;\n    ->   UNTIL @x > p1 END REPEAT;\n    -> END\n    -> //\nQuery OK, 0 rows affected (0.00 sec)\n\nMariaDB> CALL dorepeat(1000)//\nQuery OK, 0 rows affected (0.00 sec)\n\nMariaDB> SELECT @x//\n+------+\n| @x   |\n+------+\n| 1001 |\n+------+\n1 row in set (0.00 sec)\n', 'https://mariadb.com/kb/en/repeat-loop/'),
(233, 'ALTER FUNCTION', 39, 'Syntax:\nALTER FUNCTION func_name [characteristic ...]\n\ncharacteristic:\n    COMMENT \'string\'\n  | LANGUAGE SQL\n  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }\n  | SQL SECURITY { DEFINER | INVOKER }\n\nThis statement can be used to change the characteristics of a stored\nfunction. More than one change may be specified in an ALTER FUNCTION\nstatement. However, you cannot change the parameters or body of a\nstored function using this statement; to make such changes, you must\ndrop and re-create the function using DROP FUNCTION and CREATE\nFUNCTION.\n\nYou must have the ALTER ROUTINE privilege for the function. (That\nprivilege is granted automatically to the function creator.) If binary\nlogging is enabled, the ALTER FUNCTION statement might also require the\nSUPER privilege, as described in\nhttps://mariadb.com/kb/en/binary-logging-of-stored-routines/.\n\nURL: https://mariadb.com/kb/en/alter-function/\n\n', '', 'https://mariadb.com/kb/en/alter-function/'),
(234, 'SMALLINT', 22, 'SMALLINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA small integer. The signed range is -32768 to 32767. The unsigned\nrange is 0 to 65535.\n\nURL: https://mariadb.com/kb/en/smallint/\n\n', '', 'https://mariadb.com/kb/en/smallint/'),
(235, 'DOUBLE PRECISION', 22, 'DOUBLE PRECISION[(M,D)] [UNSIGNED] [ZEROFILL], REAL[(M,D)] [UNSIGNED]\n[ZEROFILL]\n\nThese types are synonyms for DOUBLE. Exception: If the REAL_AS_FLOAT\nSQL mode is enabled, REAL is a synonym for FLOAT rather than DOUBLE.\n\nURL: https://mariadb.com/kb/en/double-precision/\n\n', '', 'https://mariadb.com/kb/en/double-precision/'),
(236, 'ORD', 37, 'Syntax:\nORD(str)\n\nIf the leftmost character of the string str is a multi-byte character,\nreturns the code for that character, calculated from the numeric values\nof its constituent bytes using this formula:\n\n  (1st byte code)\n+ (2nd byte code * 256)\n+ (3rd byte code * 2562) ...\n\nIf the leftmost character is not a multi-byte character, ORD() returns\nthe same value as the ASCII() function.\n\nURL: https://mariadb.com/kb/en/ord/\n\n', 'MariaDB> SELECT ORD(\'2\');\n        -> 50\n', 'https://mariadb.com/kb/en/ord/'),
(237, 'DEALLOCATE PREPARE', 8, 'Syntax:\n{DEALLOCATE | DROP} PREPARE stmt_name\n\nTo deallocate a prepared statement produced with PREPARE, use a\nDEALLOCATE PREPARE statement that refers to the prepared statement\nname. Attempting to execute a prepared statement after deallocating it\nresults in an error.\n\nURL: https://mariadb.com/kb/en/deallocate-drop-prepared-statement/\n\n', '', 'https://mariadb.com/kb/en/deallocate-drop-prepared-statement/'),
(238, 'ENVELOPE', 36, 'Envelope(g)\n\nReturns the Minimum Bounding Rectangle (MBR) for the geometry value g.\nThe result is returned as a Polygon value.\n\nThe polygon is defined by the corner points of the bounding box:\n\nPOLYGON((MINX MINY, MAXX MINY, MAXX MAXY, MINX MAXY, MINX MINY))\n\nURL: https://mariadb.com/kb/en/envelope/\n\n', 'MariaDB> SELECT AsText(Envelope(GeomFromText(\'LineString(1 1,2 2)\')));\n+-------------------------------------------------------+\n| AsText(Envelope(GeomFromText(\'LineString(1 1,2 2)\'))) |\n+-------------------------------------------------------+\n| POLYGON((1 1,2 1,2 2,1 2,1 1))                        |\n+-------------------------------------------------------+\n', 'https://mariadb.com/kb/en/envelope/'),
(239, 'IS_FREE_LOCK', 14, 'Syntax:\nIS_FREE_LOCK(str)\n\nChecks whether the lock named str is free to use (that is, not locked).\nReturns 1 if the lock is free (no one is using the lock), 0 if the lock\nis in use, and NULL if an error occurs (such as an incorrect argument).\n\nURL: https://mariadb.com/kb/en/is_free_lock/\n\n', '', 'https://mariadb.com/kb/en/is_free_lock/'),
(240, 'TOUCHES', 30, 'Touches(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 spatially touches g2. Two\ngeometries spatially touch if the interiors of the geometries do not\nintersect, but the boundary of one of the geometries intersects either\nthe boundary or the interior of the other.\n\nURL: https://mariadb.com/kb/en/touches/\n\n', '', 'https://mariadb.com/kb/en/touches/'),
(241, 'INET_ATON', 14, 'Syntax:\nINET_ATON(expr)\n\nGiven the dotted-quad representation of an IPv4 network address as a\nstring, returns an integer that represents the numeric value of the\naddress in network byte order (big endian). INET_ATON() returns NULL if\nit does not understand its argument.\n\nURL: https://mariadb.com/kb/en/inet_aton/\n\n', 'MariaDB> SELECT INET_ATON(\'10.0.5.9\');\n        -> 167773449\n', 'https://mariadb.com/kb/en/inet_aton/'),
(242, 'UNCOMPRESS', 12, 'Syntax:\nUNCOMPRESS(string_to_uncompress)\n\nUncompresses a string compressed by the COMPRESS() function. If the\nargument is not a compressed value, the result is NULL. This function\nrequires MySQL to have been compiled with a compression library such as\nzlib. Otherwise, the return value is always NULL.\n\nURL: https://mariadb.com/kb/en/uncompress/\n\n', 'MariaDB> SELECT UNCOMPRESS(COMPRESS(\'any string\'));\n        -> \'any string\'\nMariaDB> SELECT UNCOMPRESS(\'any string\');\n        -> NULL\n', 'https://mariadb.com/kb/en/uncompress/'),
(243, 'AUTO_INCREMENT', 22, 'The AUTO_INCREMENT attribute can be used to generate a unique identity\nfor new rows:\n\nURL: https://mariadb.com/kb/en/auto_increment/\n\n', 'CREATE TABLE animals (\n     id MEDIUMINT NOT NULL AUTO_INCREMENT,\n     name CHAR(30) NOT NULL,\n     PRIMARY KEY (id)\n);\n\nINSERT INTO animals (name) VALUES\n    (\'dog\'),(\'cat\'),(\'penguin\'),\n    (\'lax\'),(\'whale\'),(\'ostrich\');\n\nSELECT * FROM animals;\n', 'https://mariadb.com/kb/en/auto_increment/'),
(244, 'ISSIMPLE', 36, 'IsSimple(g)\n\nCurrently, this function is a placeholder and should not be used. If\nimplemented, its behavior will be as described in the next paragraph.\n\nReturns 1 if the geometry value g has no anomalous geometric points,\nsuch as self-intersection or self-tangency. IsSimple() returns 0 if the\nargument is not simple, and -1 if it is NULL.\n\nThe description of each instantiable geometric class given earlier in\nthe chapter includes the specific conditions that cause an instance of\nthat class to be classified as not simple. (See [HELP Geometry\nhierarchy].)\n\nURL: https://mariadb.com/kb/en/issimple/\n\n', '', 'https://mariadb.com/kb/en/issimple/'),
(245, '- BINARY', 4, 'Syntax:\n-\n\nSubtraction:\n\nURL: https://mariadb.com/kb/en/subtraction-operator-/\n\n', 'MariaDB> SELECT 3-5;\n        -> -2\n', 'https://mariadb.com/kb/en/subtraction-operator-/');
INSERT INTO `help_topic` (`help_topic_id`, `name`, `help_category_id`, `description`, `example`, `url`) VALUES
(246, 'GEOMCOLLFROMTEXT', 3, 'GeomCollFromText(wkt[,srid]), GeometryCollectionFromText(wkt[,srid])\n\nConstructs a GEOMETRYCOLLECTION value using its WKT representation and\nSRID.\n\nURL: https://mariadb.com/kb/en/geomcollfromtext/\n\n', '', 'https://mariadb.com/kb/en/geomcollfromtext/'),
(247, 'WKT DEFINITION', 3, 'The Well-Known Text (WKT) representation of Geometry is designed to\nexchange geometry data in ASCII form. For a Backus-Naur grammar that\nspecifies the formal production rules for writing WKT values, see the\nOpenGIS specification document referenced in\nhttps://mariadb.com/kb/en/gis-resources/.\n\nURL: https://mariadb.com/kb/en/wkt-definition/\n\n', '', 'https://mariadb.com/kb/en/wkt-definition/'),
(248, 'CURRENT_TIME', 31, 'Syntax:\nCURRENT_TIME, CURRENT_TIME()\n\nCURRENT_TIME and CURRENT_TIME() are synonyms for CURTIME().\n\nURL: https://mariadb.com/kb/en/current_time/\n\n', '', 'https://mariadb.com/kb/en/current_time/'),
(249, 'REVOKE', 10, 'Syntax:\nREVOKE\n    priv_type [(column_list)]\n      [, priv_type [(column_list)]] ...\n    ON [object_type] priv_level\n    FROM user [, user] ...\n\nREVOKE ALL PRIVILEGES, GRANT OPTION\n    FROM user [, user] ...\n\nREVOKE PROXY ON user\n    FROM user [, user] ...\n\nThe REVOKE statement enables system administrators to revoke privileges\nfrom MySQL accounts. Each account name uses the format described in\nhttps://mariadb.com/kb/en/create-user#account-names. For example:\n\nREVOKE INSERT ON *.* FROM \'jeffrey\'@\'localhost\';\n\nIf you specify only the user name part of the account name, a host name\npart of \'%\' is used.\n\nFor details on the levels at which privileges exist, the permissible\npriv_type and priv_level values, and the syntax for specifying users\nand passwords, see [HELP GRANT]\n\nTo use the first REVOKE syntax, you must have the GRANT OPTION\nprivilege, and you must have the privileges that you are revoking.\n\nTo revoke all privileges, use the second syntax, which drops all\nglobal, database, table, column, and routine privileges for the named\nuser or users:\n\nREVOKE ALL PRIVILEGES, GRANT OPTION FROM user [, user] ...\n\nTo use this REVOKE syntax, you must have the global CREATE USER\nprivilege or the UPDATE privilege for the mysql database.\n\nURL: https://mariadb.com/kb/en/revoke/\n\n', '', 'https://mariadb.com/kb/en/revoke/'),
(250, 'LAST_INSERT_ID', 17, 'Syntax:\nLAST_INSERT_ID(), LAST_INSERT_ID(expr)\n\nLAST_INSERT_ID() (with no argument) returns a BIGINT (64-bit) value\nrepresenting the first automatically generated value successfully\ninserted for an AUTO_INCREMENT column as a result of the most recently\nexecuted INSERT statement. The value of LAST_INSERT_ID() remains\nunchanged if no rows are successfully inserted.\n\nFor example, after inserting a row that generates an AUTO_INCREMENT\nvalue, you can get the value like this:\n\nMariaDB> SELECT LAST_INSERT_ID();\n        -> 195\n\nThe currently executing statement does not affect the value of\nLAST_INSERT_ID(). Suppose that you generate an AUTO_INCREMENT value\nwith one statement, and then refer to LAST_INSERT_ID() in a\nmultiple-row INSERT statement that inserts rows into a table with its\nown AUTO_INCREMENT column. The value of LAST_INSERT_ID() will remain\nstable in the second statement; its value for the second and later rows\nis not affected by the earlier row insertions. (However, if you mix\nreferences to LAST_INSERT_ID() and LAST_INSERT_ID(expr), the effect is\nundefined.)\n\nIf the previous statement returned an error, the value of\nLAST_INSERT_ID() is undefined. For transactional tables, if the\nstatement is rolled back due to an error, the value of LAST_INSERT_ID()\nis left undefined. For manual ROLLBACK, the value of LAST_INSERT_ID()\nis not restored to that before the transaction; it remains as it was at\nthe point of the ROLLBACK.\n\nWithin the body of a stored routine (procedure or function) or a\ntrigger, the value of LAST_INSERT_ID() changes the same way as for\nstatements executed outside the body of these kinds of objects. The\neffect of a stored routine or trigger upon the value of\nLAST_INSERT_ID() that is seen by following statements depends on the\nkind of routine:\n\no If a stored procedure executes statements that change the value of\n  LAST_INSERT_ID(), the changed value is seen by statements that follow\n  the procedure call.\n\no For stored functions and triggers that change the value, the value is\n  restored when the function or trigger ends, so following statements\n  will not see a changed value.\n\nURL: https://mariadb.com/kb/en/last_insert_id/\n\n', '', 'https://mariadb.com/kb/en/last_insert_id/'),
(251, 'LAST_DAY', 31, 'Syntax:\nLAST_DAY(date)\n\nTakes a date or datetime value and returns the corresponding value for\nthe last day of the month. Returns NULL if the argument is invalid.\n\nURL: https://mariadb.com/kb/en/last_day/\n\n', 'MariaDB> SELECT LAST_DAY(\'2003-02-05\');\n        -> \'2003-02-28\'\nMariaDB> SELECT LAST_DAY(\'2004-02-05\');\n        -> \'2004-02-29\'\nMariaDB> SELECT LAST_DAY(\'2004-01-01 01:01:01\');\n        -> \'2004-01-31\'\nMariaDB> SELECT LAST_DAY(\'2003-03-32\');\n        -> NULL\n', 'https://mariadb.com/kb/en/last_day/'),
(252, 'MEDIUMINT', 22, 'MEDIUMINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA medium-sized integer. The signed range is -8388608 to 8388607. The\nunsigned range is 0 to 16777215.\n\nURL: https://mariadb.com/kb/en/mediumint/\n\n', '', 'https://mariadb.com/kb/en/mediumint/'),
(253, 'FLOOR', 4, 'Syntax:\nFLOOR(X)\n\nReturns the largest integer value not greater than X.\n\nURL: https://mariadb.com/kb/en/floor/\n\n', 'MariaDB> SELECT FLOOR(1.23);\n        -> 1\nMariaDB> SELECT FLOOR(-1.23);\n        -> -2\n', 'https://mariadb.com/kb/en/floor/'),
(254, 'RTRIM', 37, 'Syntax:\nRTRIM(str)\n\nReturns the string str with trailing space characters removed.\n\nURL: https://mariadb.com/kb/en/rtrim/\n\n', 'MariaDB> SELECT RTRIM(\'barbar   \');\n        -> \'barbar\'\n', 'https://mariadb.com/kb/en/rtrim/'),
(255, 'EXPLAIN', 28, 'Syntax:\nEXPLAIN [explain_type] SELECT select_options\n\nexplain_type:\n    EXTENDED\n  | PARTITIONS\n\nOr:\n\nEXPLAIN tbl_name\n\nThe EXPLAIN statement can be used either as a way to obtain information\nabout how MySQL executes a statement, or as a synonym for DESCRIBE:\n\no When you precede a SELECT statement with the keyword EXPLAIN, MySQL\n  displays information from the optimizer about the query execution\n  plan. That is, MySQL explains how it would process the statement,\n  including information about how tables are joined and in which order.\n  EXPLAIN EXTENDED can be used to obtain additional information.\n\n  For information about using EXPLAIN and EXPLAIN EXTENDED to obtain\n  query execution plan information, see\n  https://mariadb.com/kb/en/explain/.\n\no EXPLAIN PARTITIONS is useful only when examining queries involving\n  partitioned tables. For details, see\n  http://dev.mysql.com/doc/refman/5.5/en/partitioning-info.html.\n\no EXPLAIN tbl_name is synonymous with DESCRIBE tbl_name or SHOW COLUMNS\n  FROM tbl_name. For information about DESCRIBE and SHOW COLUMNS, see\n  [HELP DESCRIBE], and [HELP SHOW COLUMNS].\n\nURL: https://mariadb.com/kb/en/explain/\n\n', '', 'https://mariadb.com/kb/en/explain/'),
(256, 'DEGREES', 4, 'Syntax:\nDEGREES(X)\n\nReturns the argument X, converted from radians to degrees.\n\nURL: https://mariadb.com/kb/en/degrees/\n\n', 'MariaDB> SELECT DEGREES(PI());\n        -> 180\nMariaDB> SELECT DEGREES(PI() / 2);\n        -> 90\n', 'https://mariadb.com/kb/en/degrees/'),
(257, 'VARCHAR', 22, '[NATIONAL] VARCHAR(M) [CHARACTER SET charset_name] [COLLATE\ncollation_name]\n\nA variable-length string. M represents the maximum column length in\ncharacters. The range of M is 0 to 65,535. The effective maximum length\nof a VARCHAR is subject to the maximum row size (65,535 bytes, which is\nshared among all columns) and the character set used. For example, utf8\ncharacters can require up to three bytes per character, so a VARCHAR\ncolumn that uses the utf8 character set can be declared to be a maximum\nof 21,844 characters. See\nhttp://dev.mysql.com/doc/refman/5.5/en/column-count-limit.html.\n\nMySQL stores VARCHAR values as a 1-byte or 2-byte length prefix plus\ndata. The length prefix indicates the number of bytes in the value. A\nVARCHAR column uses one length byte if values require no more than 255\nbytes, two length bytes if values may require more than 255 bytes.\n\n*Note*: MySQL 5.5 follows the standard SQL specification, and does not\nremove trailing spaces from VARCHAR values.\n\nVARCHAR is shorthand for CHARACTER VARYING. NATIONAL VARCHAR is the\nstandard SQL way to define that a VARCHAR column should use some\npredefined character set. MySQL 4.1 and up uses utf8 as this predefined\ncharacter set.\nhttps://mariadb.com/kb/en/varchar/. NVARCHAR\nis shorthand for NATIONAL VARCHAR.\n\nURL: https://mariadb.com/kb/en/varchar/\n\n', '', 'https://mariadb.com/kb/en/varchar/'),
(258, 'UNHEX', 37, 'Syntax:\n\nUNHEX(str)\n\nFor a string argument str, UNHEX(str) performs the inverse operation of\nHEX(str). That is, it interprets each pair of characters in the\nargument as a hexadecimal number and converts it to the character\nrepresented by the number. The return value is a binary string.\n\nURL: https://mariadb.com/kb/en/unhex/\n\n', 'MariaDB> SELECT UNHEX(\'4D7953514C\');\n        -> \'MySQL\'\nMariaDB> SELECT 0x4D7953514C;\n        -> \'MySQL\'\nMariaDB> SELECT UNHEX(HEX(\'string\'));\n        -> \'string\'\nMariaDB> SELECT HEX(UNHEX(\'1267\'));\n        -> \'1267\'\n', 'https://mariadb.com/kb/en/unhex/'),
(259, '- UNARY', 4, 'Syntax:\n-\n\nUnary minus. This operator changes the sign of the operand.\n\nURL: https://mariadb.com/kb/en/subtraction-operator-/\n\n', 'MariaDB> SELECT - 2;\n        -> -2\n', 'https://mariadb.com/kb/en/subtraction-operator-/'),
(260, 'STD', 16, 'Syntax:\nSTD(expr)\n\nReturns the population standard deviation of expr. This is an extension\nto standard SQL. The standard SQL function STDDEV_POP() can be used\ninstead.\n\nThis function returns NULL if there were no matching rows.\n\nURL: https://mariadb.com/kb/en/std/\n\n', '', 'https://mariadb.com/kb/en/std/'),
(261, 'COS', 4, 'Syntax:\nCOS(X)\n\nReturns the cosine of X, where X is given in radians.\n\nURL: https://mariadb.com/kb/en/cos/\n\n', 'MariaDB> SELECT COS(PI());\n        -> -1\n', 'https://mariadb.com/kb/en/cos/'),
(262, 'DATE FUNCTION', 31, 'Syntax:\nDATE(expr)\n\nExtracts the date part of the date or datetime expression expr.\n\nURL: https://mariadb.com/kb/en/date-function/\n\n', 'MariaDB> SELECT DATE(\'2003-12-31 01:02:03\');\n        -> \'2003-12-31\'\n', 'https://mariadb.com/kb/en/date-function/'),
(263, 'DROP TRIGGER', 39, 'Syntax:\nDROP TRIGGER [IF EXISTS] [schema_name.]trigger_name\n\nThis statement drops a trigger. The schema (database) name is optional.\nIf the schema is omitted, the trigger is dropped from the default\nschema. DROP TRIGGER requires the TRIGGER privilege for the table\nassociated with the trigger.\n\nUse IF EXISTS to prevent an error from occurring for a trigger that\ndoes not exist. A NOTE is generated for a nonexistent trigger when\nusing IF EXISTS. See [HELP SHOW WARNINGS].\n\nTriggers for a table are also dropped if you drop the table.\n\nURL: https://mariadb.com/kb/en/drop-trigger/\n\n', '', 'https://mariadb.com/kb/en/drop-trigger/'),
(264, 'RESET MASTER', 8, 'Syntax:\nRESET MASTER\n\nDeletes all binary log files listed in the index file, resets the\nbinary log index file to be empty, and creates a new binary log file.\nThis statement is intended to be used only when the master is started\nfor the first time.\n\nURL: https://mariadb.com/kb/en/reset-master/\n\n', '', 'https://mariadb.com/kb/en/reset-master/'),
(265, 'TAN', 4, 'Syntax:\nTAN(X)\n\nReturns the tangent of X, where X is given in radians.\n\nURL: https://mariadb.com/kb/en/tan/\n\n', 'MariaDB> SELECT TAN(PI());\n        -> -1.2246063538224e-16\nMariaDB> SELECT TAN(PI()+1);\n        -> 1.5574077246549\n', 'https://mariadb.com/kb/en/tan/'),
(266, 'PI', 4, 'Syntax:\nPI()\n\nReturns the value of π (pi). The default number of decimal places\ndisplayed is seven, but MySQL uses the full double-precision value\ninternally.\n\nURL: https://mariadb.com/kb/en/pi/\n\n', 'MariaDB> SELECT PI();\n        -> 3.141593\nMariaDB> SELECT PI()+0.000000000000000000;\n        -> 3.141592653589793116\n', 'https://mariadb.com/kb/en/pi/'),
(267, 'WEEKOFYEAR', 31, 'Syntax:\nWEEKOFYEAR(date)\n\nReturns the calendar week of the date as a number in the range from 1\nto 53. WEEKOFYEAR() is a compatibility function that is equivalent to\nWEEK(date,3).\n\nURL: https://mariadb.com/kb/en/weekofyear/\n\n', 'MariaDB> SELECT WEEKOFYEAR(\'2008-02-20\');\n        -> 8\n', 'https://mariadb.com/kb/en/weekofyear/'),
(268, '/', 4, 'Syntax:\n/\n\nDivision:\n\nURL: https://mariadb.com/kb/en/division-operator/\n\n', 'MariaDB> SELECT 3/5;\n        -> 0.60\n', 'https://mariadb.com/kb/en/division-operator/'),
(269, 'PURGE BINARY LOGS', 8, 'Syntax:\nPURGE { BINARY | MASTER } LOGS\n    { TO \'log_name\' | BEFORE datetime_expr }\n\nThe binary log is a set of files that contain information about data\nmodifications made by the MySQL server. The log consists of a set of\nbinary log files, plus an index file (see\nhttps://mariadb.com/kb/en/overview-of-the-binary-log/).\n\nThe PURGE BINARY LOGS statement deletes all the binary log files listed\nin the log index file prior to the specified log file name or date.\nBINARY and MASTER are synonyms. Deleted log files also are removed from\nthe list recorded in the index file, so that the given log file becomes\nthe first in the list.\n\nThis statement has no effect if the server was not started with the\n--log-bin option to enable binary logging.\n\nURL: https://mariadb.com/kb/en/sql-commands-purge-logs/\n\n', 'PURGE BINARY LOGS TO \'mysql-bin.010\';\nPURGE BINARY LOGS BEFORE \'2008-04-02 22:46:26\';\n', 'https://mariadb.com/kb/en/sql-commands-purge-logs/'),
(270, 'STDDEV_SAMP', 16, 'Syntax:\nSTDDEV_SAMP(expr)\n\nReturns the sample standard deviation of expr (the square root of\nVAR_SAMP().\n\nSTDDEV_SAMP() returns NULL if there were no matching rows.\n\nURL: https://mariadb.com/kb/en/stddev_samp/\n\n', '', 'https://mariadb.com/kb/en/stddev_samp/'),
(271, 'SCHEMA', 17, 'Syntax:\nSCHEMA()\n\nThis function is a synonym for DATABASE().\n\nURL: https://mariadb.com/kb/en/schema/\n\n', '', 'https://mariadb.com/kb/en/schema/'),
(272, 'MLINEFROMWKB', 32, 'MLineFromWKB(wkb[,srid]), MultiLineStringFromWKB(wkb[,srid])\n\nConstructs a MULTILINESTRING value using its WKB representation and\nSRID.\n\nURL: https://mariadb.com/kb/en/mlinefromwkb/\n\n', '', 'https://mariadb.com/kb/en/mlinefromwkb/'),
(273, 'LOG2', 4, 'Syntax:\nLOG2(X)\n\nReturns the base-2 logarithm of X.\n\nURL: https://mariadb.com/kb/en/log2/\n\n', 'MariaDB> SELECT LOG2(65536);\n        -> 16\nMariaDB> SELECT LOG2(-100);\n        -> NULL\n', 'https://mariadb.com/kb/en/log2/'),
(274, 'SUBTIME', 31, 'Syntax:\nSUBTIME(expr1,expr2)\n\nSUBTIME() returns expr1 - expr2 expressed as a value in the same format\nas expr1. expr1 is a time or datetime expression, and expr2 is a time\nexpression.\n\nURL: https://mariadb.com/kb/en/subtime/\n\n', 'MariaDB> SELECT SUBTIME(\'2007-12-31 23:59:59.999999\',\'1 1:1:1.000002\');\n        -> \'2007-12-30 22:58:58.999997\'\nMariaDB> SELECT SUBTIME(\'01:00:00.999999\', \'02:00:00.999998\');\n        -> \'-00:59:59.999999\'\n', 'https://mariadb.com/kb/en/subtime/'),
(275, 'UNCOMPRESSED_LENGTH', 12, 'Syntax:\nUNCOMPRESSED_LENGTH(compressed_string)\n\nReturns the length that the compressed string had before being\ncompressed.\n\nURL: https://mariadb.com/kb/en/uncompressed_length/\n\n', 'MariaDB> SELECT UNCOMPRESSED_LENGTH(COMPRESS(REPEAT(\'a\',30)));\n        -> 30\n', 'https://mariadb.com/kb/en/uncompressed_length/'),
(276, 'DROP TABLE', 39, 'Syntax:\nDROP [TEMPORARY] TABLE [IF EXISTS]\n    tbl_name [, tbl_name] ...\n    [RESTRICT | CASCADE]\n\nDROP TABLE removes one or more tables. You must have the DROP privilege\nfor each table. All table data and the table definition are removed, so\nbe careful with this statement! If any of the tables named in the\nargument list do not exist, MySQL returns an error indicating by name\nwhich nonexisting tables it was unable to drop, but it also drops all\nof the tables in the list that do exist.\n\n*Important*: When a table is dropped, user privileges on the table are\nnot automatically dropped. See [HELP GRANT].\n\nNote that for a partitioned table, DROP TABLE permanently removes the\ntable definition, all of its partitions, and all of the data which was\nstored in those partitions. It also removes the partitioning definition\n(.par) file associated with the dropped table.\n\nUse IF EXISTS to prevent an error from occurring for tables that do not\nexist. A NOTE is generated for each nonexistent table when using IF\nEXISTS. See [HELP SHOW WARNINGS].\n\nRESTRICT and CASCADE are permitted to make porting easier. In MySQL\n5.5, they do nothing.\n\n*Note*: DROP TABLE automatically commits the current active\ntransaction, unless you use the TEMPORARY keyword.\n\nURL: https://mariadb.com/kb/en/drop-table/\n\n', '', 'https://mariadb.com/kb/en/drop-table/'),
(277, 'POW', 4, 'Syntax:\nPOW(X,Y)\n\nReturns the value of X raised to the power of Y.\n\nURL: https://mariadb.com/kb/en/pow/\n\n', 'MariaDB> SELECT POW(2,2);\n        -> 4\nMariaDB> SELECT POW(2,-2);\n        -> 0.25\n', 'https://mariadb.com/kb/en/pow/'),
(278, 'SHOW CREATE TABLE', 26, 'Syntax:\nSHOW CREATE TABLE tbl_name\n\nShows the CREATE TABLE statement that creates the given table. To use\nthis statement, you must have some privilege for the table. This\nstatement also works with views.\nSHOW CREATE TABLE quotes table and column names according to the value\nof the sql_quote_show_create option. See\nhttps://mariadb.com/kb/en/server-system-variables/.\n\nURL: https://mariadb.com/kb/en/show-create-table/\n\n', 'MariaDB> SHOW CREATE TABLE t\\G\n*************************** 1. row ***************************\n       Table: t\nCreate Table: CREATE TABLE t (\n  id INT(11) default NULL auto_increment,\n  s char(60) default NULL,\n  PRIMARY KEY (id)\n) ENGINE=MyISAM\n', 'https://mariadb.com/kb/en/show-create-table/'),
(279, 'DUAL', 27, 'You are permitted to specify DUAL as a dummy table name in situations\nwhere no tables are referenced:\n\nMariaDB> SELECT 1 + 1 FROM DUAL;\n        -> 2\n\nDUAL is purely for the convenience of people who require that all\nSELECT statements should have FROM and possibly other clauses. MySQL\nmay ignore the clauses. MySQL does not require FROM DUAL if no tables\nare referenced.\n\nURL: https://mariadb.com/kb/en/dual/\n\n', '', 'https://mariadb.com/kb/en/dual/'),
(280, 'INSTR', 37, 'Syntax:\nINSTR(str,substr)\n\nReturns the position of the first occurrence of substring substr in\nstring str. This is the same as the two-argument form of LOCATE(),\nexcept that the order of the arguments is reversed.\n\nURL: https://mariadb.com/kb/en/instr/\n\n', 'MariaDB> SELECT INSTR(\'foobarbar\', \'bar\');\n        -> 4\nMariaDB> SELECT INSTR(\'xbar\', \'foobar\');\n        -> 0\n', 'https://mariadb.com/kb/en/instr/'),
(281, 'NOW', 31, 'Syntax:\nNOW()\n\nReturns the current date and time as a value in \'YYYY-MM-DD HH:MM:SS\'\nor YYYYMMDDHHMMSS.uuuuuu format, depending on whether the function is\nused in a string or numeric context. The value is expressed in the\ncurrent time zone.\n\nURL: https://mariadb.com/kb/en/now/\n\n', 'MariaDB> SELECT NOW();\n        -> \'2007-12-15 23:50:26\'\nMariaDB> SELECT NOW() + 0;\n        -> 20071215235026.000000\n', 'https://mariadb.com/kb/en/now/'),
(282, 'SHOW ENGINES', 26, 'Syntax:\nSHOW [STORAGE] ENGINES\n\nSHOW ENGINES displays status information about the server\'s storage\nengines. This is particularly useful for checking whether a storage\nengine is supported, or to see what the default engine is.\n\nURL: https://mariadb.com/kb/en/show-engines/\n\n', '', 'https://mariadb.com/kb/en/show-engines/'),
(283, '>=', 18, 'Syntax:\n>=\n\nGreater than or equal:\n\nURL: https://mariadb.com/kb/en/greater-than-or-equal/\n\n', 'MariaDB> SELECT 2 >= 2;\n        -> 1\n', 'https://mariadb.com/kb/en/greater-than-or-equal/'),
(284, 'EXP', 4, 'Syntax:\nEXP(X)\n\nReturns the value of e (the base of natural logarithms) raised to the\npower of X. The inverse of this function is LOG() (using a single\nargument only) or LN().\n\nURL: https://mariadb.com/kb/en/exp/\n\n', 'MariaDB> SELECT EXP(2);\n        -> 7.3890560989307\nMariaDB> SELECT EXP(-2);\n        -> 0.13533528323661\nMariaDB> SELECT EXP(0);\n        -> 1\n', 'https://mariadb.com/kb/en/exp/'),
(285, 'LONGBLOB', 22, 'LONGBLOB\n\nA BLOB column with a maximum length of 4,294,967,295 or 4GB (232 - 1)\nbytes. The effective maximum length of LONGBLOB columns depends on the\nconfigured maximum packet size in the client/server protocol and\navailable memory. Each LONGBLOB value is stored using a 4-byte length\nprefix that indicates the number of bytes in the value.\n\nURL: https://mariadb.com/kb/en/longblob/\n\n', '', 'https://mariadb.com/kb/en/longblob/'),
(286, 'POINTN', 13, 'PointN(ls,N)\n\nReturns the N-th Point in the Linestring value ls. Points are numbered\nbeginning with 1.\n\nURL: https://mariadb.com/kb/en/pointn/\n\n', 'MariaDB> SET @ls = \'LineString(1 1,2 2,3 3)\';\nMariaDB> SELECT AsText(PointN(GeomFromText(@ls),2));\n+-------------------------------------+\n| AsText(PointN(GeomFromText(@ls),2)) |\n+-------------------------------------+\n| POINT(2 2)                          |\n+-------------------------------------+\n', 'https://mariadb.com/kb/en/pointn/'),
(287, 'YEAR DATA TYPE', 22, 'YEAR[(2|4)]\n\nA year in two-digit or four-digit format. The default is four-digit\nformat. YEAR(2) or YEAR(4) differ in display format, but have the same\nrange of values. In four-digit format, values display as 1901 to 2155,\nand 0000. In two-digit format, values display as 70 to 69, representing\nyears from 1970 to 2069. MySQL displays YEAR values in YYYY or\nYYformat, but permits assignment of values to YEAR columns using either\nstrings or numbers.\n\n*Note*: The YEAR(2) data type has certain issues that you should\nconsider before choosing to use it. As of MySQL 5.5.27, YEAR(2) is\ndeprecated. For more information, see\nhttp://dev.mysql.com/doc/refman/5.5/en/migrating-to-year4.html.\n\nFor additional information about YEAR display format and inerpretation\nof input values, see https://mariadb.com/kb/en/year-data-type/.\n\nURL: https://mariadb.com/kb/en/year-data-type/\n\n', '', 'https://mariadb.com/kb/en/year-data-type/'),
(288, 'SUM', 16, 'Syntax:\nSUM([DISTINCT] expr)\n\nReturns the sum of expr. If the return set has no rows, SUM() returns\nNULL. The DISTINCT keyword can be used to sum only the distinct values\nof expr.\n\nSUM() returns NULL if there were no matching rows.\n\nURL: https://mariadb.com/kb/en/sum/\n\n', '', 'https://mariadb.com/kb/en/sum/'),
(289, 'OCT', 37, 'Syntax:\nOCT(N)\n\nReturns a string representation of the octal value of N, where N is a\nlonglong (BIGINT) number. This is equivalent to CONV(N,10,8). Returns\nNULL if N is NULL.\n\nURL: https://mariadb.com/kb/en/oct/\n\n', 'MariaDB> SELECT OCT(12);\n        -> \'14\'\n', 'https://mariadb.com/kb/en/oct/'),
(290, 'SYSDATE', 31, 'Syntax:\nSYSDATE()\n\nReturns the current date and time as a value in \'YYYY-MM-DD HH:MM:SS\'\nor YYYYMMDDHHMMSS.uuuuuu format, depending on whether the function is\nused in a string or numeric context.\n\nSYSDATE() returns the time at which it executes. This differs from the\nbehavior for NOW(), which returns a constant time that indicates the\ntime at which the statement began to execute. (Within a stored function\nor trigger, NOW() returns the time at which the function or triggering\nstatement began to execute.)\n\nMariaDB> SELECT NOW(), SLEEP(2), NOW();\n+---------------------+----------+---------------------+\n| NOW()               | SLEEP(2) | NOW()               |\n+---------------------+----------+---------------------+\n| 2006-04-12 13:47:36 |        0 | 2006-04-12 13:47:36 |\n+---------------------+----------+---------------------+\n\nMariaDB> SELECT SYSDATE(), SLEEP(2), SYSDATE();\n+---------------------+----------+---------------------+\n| SYSDATE()           | SLEEP(2) | SYSDATE()           |\n+---------------------+----------+---------------------+\n| 2006-04-12 13:47:44 |        0 | 2006-04-12 13:47:46 |\n+---------------------+----------+---------------------+\n\nIn addition, the SET TIMESTAMP statement affects the value returned by\nNOW() but not by SYSDATE(). This means that timestamp settings in the\nbinary log have no effect on invocations of SYSDATE().\n\nBecause SYSDATE() can return different values even within the same\nstatement, and is not affected by SET TIMESTAMP, it is nondeterministic\nand therefore unsafe for replication if statement-based binary logging\nis used. If that is a problem, you can use row-based logging.\n\nAlternatively, you can use the --sysdate-is-now option to cause\nSYSDATE() to be an alias for NOW(). This works if the option is used on\nboth the master and the slave.\n\nThe nondeterministic nature of SYSDATE() also means that indexes cannot\nbe used for evaluating expressions that refer to it.\n\nURL: https://mariadb.com/kb/en/sysdate/\n\n', '', 'https://mariadb.com/kb/en/sysdate/'),
(291, 'UNINSTALL PLUGIN', 5, 'Syntax:\nUNINSTALL PLUGIN plugin_name\n\nThis statement removes an installed server plugin. It requires the\nDELETE privilege for the mysql.plugin table.\n\nplugin_name must be the name of some plugin that is listed in the\nmysql.plugin table. The server executes the plugin\'s deinitialization\nfunction and removes the row for the plugin from the mysql.plugin\ntable, so that subsequent server restarts will not load and initialize\nthe plugin. UNINSTALL PLUGIN does not remove the plugin\'s shared\nlibrary file.\n\nURL: https://mariadb.com/kb/en/uninstall-plugin/\n\n', '', 'https://mariadb.com/kb/en/uninstall-plugin/'),
(292, 'ASBINARY', 32, 'AsBinary(g), AsWKB(g)\n\nConverts a value in internal geometry format to its WKB representation\nand returns the binary result.\n\nURL: https://mariadb.com/kb/en/asbinary/\n\n', 'SELECT AsBinary(g) FROM geom;\n', 'https://mariadb.com/kb/en/asbinary/'),
(293, 'REPEAT FUNCTION', 37, 'Syntax:\nREPEAT(str,count)\n\nReturns a string consisting of the string str repeated count times. If\ncount is less than 1, returns an empty string. Returns NULL if str or\ncount are NULL.\n\nURL: https://mariadb.com/kb/en/repeat-function/\n\n', 'MariaDB> SELECT REPEAT(\'MySQL\', 3);\n        -> \'MySQLMySQLMySQL\'\n', 'https://mariadb.com/kb/en/repeat-function/'),
(294, 'SHOW TABLES', 26, 'Syntax:\nSHOW [FULL] TABLES [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW TABLES lists the non-TEMPORARY tables in a given database. You can\nalso get this list using the mysqlshow db_name command. The LIKE\nclause, if present, indicates which table names to match. The WHERE\nclause can be given to select rows using more general conditions, as\ndiscussed in https://mariadb.com/kb/en/extended-show/.\n\nThis statement also lists any views in the database. The FULL modifier\nis supported such that SHOW FULL TABLES displays a second output\ncolumn. Values for the second column are BASE TABLE for a table and\nVIEW for a view.\n\nIf you have no privileges for a base table or view, it does not show up\nin the output from SHOW TABLES or mysqlshow db_name.\n\nURL: https://mariadb.com/kb/en/show-tables/\n\n', '', 'https://mariadb.com/kb/en/show-tables/'),
(295, 'MAKEDATE', 31, 'Syntax:\nMAKEDATE(year,dayofyear)\n\nReturns a date, given year and day-of-year values. dayofyear must be\ngreater than 0 or the result is NULL.\n\nURL: https://mariadb.com/kb/en/makedate/\n\n', 'MariaDB> SELECT MAKEDATE(2011,31), MAKEDATE(2011,32);\n        -> \'2011-01-31\', \'2011-02-01\'\nMariaDB> SELECT MAKEDATE(2011,365), MAKEDATE(2014,365);\n        -> \'2011-12-31\', \'2014-12-31\'\nMariaDB> SELECT MAKEDATE(2011,0);\n        -> NULL\n', 'https://mariadb.com/kb/en/makedate/'),
(296, 'BINARY OPERATOR', 37, 'Syntax:\nBINARY\n\nThe BINARY operator casts the string following it to a binary string.\nThis is an easy way to force a column comparison to be done byte by\nbyte rather than character by character. This causes the comparison to\nbe case sensitive even if the column is not defined as BINARY or BLOB.\nBINARY also causes trailing spaces to be significant.\n\nURL: https://mariadb.com/kb/en/binary-operator/\n\n', 'MariaDB> SELECT \'a\' = \'A\';\n        -> 1\nMariaDB> SELECT BINARY \'a\' = \'A\';\n        -> 0\nMariaDB> SELECT \'a\' = \'a \';\n        -> 1\nMariaDB> SELECT BINARY \'a\' = \'a \';\n        -> 0\n', 'https://mariadb.com/kb/en/binary-operator/'),
(297, 'MBROVERLAPS', 6, 'MBROverlaps(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 overlap. The term spatially overlaps is\nused if two geometries intersect and their intersection results in a\ngeometry of the same dimension but not equal to either of the given\ngeometries.\n\nURL: https://mariadb.com/kb/en/mbroverlaps/\n\n', '', 'https://mariadb.com/kb/en/mbroverlaps/'),
(298, 'SOUNDEX', 37, 'Syntax:\nSOUNDEX(str)\n\nReturns a soundex string from str. Two strings that sound almost the\nsame should have identical soundex strings. A standard soundex string\nis four characters long, but the SOUNDEX() function returns an\narbitrarily long string. You can use SUBSTRING() on the result to get a\nstandard soundex string. All nonalphabetic characters in str are\nignored. All international alphabetic characters outside the A-Z range\nare treated as vowels.\n\n*Important*: When using SOUNDEX(), you should be aware of the following\nlimitations:\n\no This function, as currently implemented, is intended to work well\n  with strings that are in the English language only. Strings in other\n  languages may not produce reliable results.\n\no This function is not guaranteed to provide consistent results with\n  strings that use multi-byte character sets, including utf-8.\n\n  We hope to remove these limitations in a future release. See Bug\n  #22638 for more information.\n\nURL: https://mariadb.com/kb/en/soundex/\n\n', 'MariaDB> SELECT SOUNDEX(\'Hello\');\n        -> \'H400\'\nMariaDB> SELECT SOUNDEX(\'Quadratically\');\n        -> \'Q36324\'\n', 'https://mariadb.com/kb/en/soundex/'),
(299, 'MBRTOUCHES', 6, 'MBRTouches(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 touch. Two geometries spatially touch if\nthe interiors of the geometries do not intersect, but the boundary of\none of the geometries intersects either the boundary or the interior of\nthe other.\n\nURL: https://mariadb.com/kb/en/mbrtouches/\n\n', '', 'https://mariadb.com/kb/en/mbrtouches/'),
(300, 'DROP EVENT', 39, 'Syntax:\nDROP EVENT [IF EXISTS] event_name\n\nThis statement drops the event named event_name. The event immediately\nceases being active, and is deleted completely from the server.\n\nIf the event does not exist, the error ERROR 1517 (HY000): Unknown\nevent \'event_name\' results. You can override this and cause the\nstatement to generate a warning for nonexistent events instead using IF\nEXISTS.\n\nThis statement requires the EVENT privilege for the schema to which the\nevent to be dropped belongs.\n\nURL: https://mariadb.com/kb/en/drop-event/\n\n', '', 'https://mariadb.com/kb/en/drop-event/'),
(301, 'INSERT SELECT', 27, 'Syntax:\nINSERT [LOW_PRIORITY | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name [(col_name,...)]\n    SELECT ...\n    [ ON DUPLICATE KEY UPDATE col_name=expr, ... ]\n\nWith INSERT ... SELECT, you can quickly insert many rows into a table\nfrom one or many tables. For example:\n\nINSERT INTO tbl_temp2 (fld_id)\n  SELECT tbl_temp1.fld_order_id\n  FROM tbl_temp1 WHERE tbl_temp1.fld_order_id > 100;\n\nURL: https://mariadb.com/kb/en/insert-select/\n\n', '', 'https://mariadb.com/kb/en/insert-select/'),
(302, 'CREATE PROCEDURE', 39, 'Syntax:\nCREATE\n    [DEFINER = { user | CURRENT_USER }]\n    PROCEDURE sp_name ([proc_parameter[,...]])\n    [characteristic ...] routine_body\n\nCREATE\n    [DEFINER = { user | CURRENT_USER }]\n    FUNCTION sp_name ([func_parameter[,...]])\n    RETURNS type\n    [characteristic ...] routine_body\n\nproc_parameter:\n    [ IN | OUT | INOUT ] param_name type\n\nfunc_parameter:\n    param_name type\n\ntype:\n    Any valid MySQL data type\n\ncharacteristic:\n    COMMENT \'string\'\n  | LANGUAGE SQL\n  | [NOT] DETERMINISTIC\n  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }\n  | SQL SECURITY { DEFINER | INVOKER }\n\nroutine_body:\n    Valid SQL routine statement\n\nThese statements create stored routines. By default, a routine is\nassociated with the default database. To associate the routine\nexplicitly with a given database, specify the name as db_name.sp_name\nwhen you create it.\n\nThe CREATE FUNCTION statement is also used in MySQL to support UDFs\n(user-defined functions). See\nhttps://mariadb.com/kb/en/create-function-udf/. A UDF can\nbe regarded as an external stored function. Stored functions share\ntheir namespace with UDFs. See\nhttp://dev.mysql.com/doc/refman/5.5/en/function-resolution.html, for\nthe rules describing how the server interprets references to different\nkinds of functions.\n\nTo invoke a stored procedure, use the CALL statement (see [HELP CALL]).\nTo invoke a stored function, refer to it in an expression. The function\nreturns a value during expression evaluation.\n\nCREATE PROCEDURE and CREATE FUNCTION require the CREATE ROUTINE\nprivilege. They might also require the SUPER privilege, depending on\nthe DEFINER value, as described later in this section. If binary\nlogging is enabled, CREATE FUNCTION might require the SUPER privilege,\nas described in\nhttps://mariadb.com/kb/en/binary-logging-of-stored-routines/.\n\nBy default, MySQL automatically grants the ALTER ROUTINE and EXECUTE\nprivileges to the routine creator. This behavior can be changed by\ndisabling the automatic_sp_privileges system variable. See\nhttps://mariadb.com/kb/en/stored-routine-privileges/.\n\nThe DEFINER and SQL SECURITY clauses specify the security context to be\nused when checking access privileges at routine execution time, as\ndescribed later in this section.\n\nIf the routine name is the same as the name of a built-in SQL function,\na syntax error occurs unless you use a space between the name and the\nfollowing parenthesis when defining the routine or invoking it later.\nFor this reason, avoid using the names of existing SQL functions for\nyour own stored routines.\n\nThe IGNORE_SPACE SQL mode applies to built-in functions, not to stored\nroutines. It is always permissible to have spaces after a stored\nroutine name, regardless of whether IGNORE_SPACE is enabled.\n\nThe parameter list enclosed within parentheses must always be present.\nIf there are no parameters, an empty parameter list of () should be\nused. Parameter names are not case sensitive.\n\nEach parameter is an IN parameter by default. To specify otherwise for\na parameter, use the keyword OUT or INOUT before the parameter name.\n\n*Note*: Specifying a parameter as IN, OUT, or INOUT is valid only for a\nPROCEDURE. For a FUNCTION, parameters are always regarded as IN\nparameters.\n\nAn IN parameter passes a value into a procedure. The procedure might\nmodify the value, but the modification is not visible to the caller\nwhen the procedure returns. An OUT parameter passes a value from the\nprocedure back to the caller. Its initial value is NULL within the\nprocedure, and its value is visible to the caller when the procedure\nreturns. An INOUT parameter is initialized by the caller, can be\nmodified by the procedure, and any change made by the procedure is\nvisible to the caller when the procedure returns.\n\nFor each OUT or INOUT parameter, pass a user-defined variable in the\nCALL statement that invokes the procedure so that you can obtain its\nvalue when the procedure returns. If you are calling the procedure from\nwithin another stored procedure or function, you can also pass a\nroutine parameter or local routine variable as an IN or INOUT\nparameter.\n\nThe following example shows a simple stored procedure that uses an OUT\nparameter:\n\nMariaDB> delimiter //\n\nMariaDB> CREATE PROCEDURE simpleproc (OUT param1 INT)\n    -> BEGIN\n    ->   SELECT COUNT(*) INTO param1 FROM t;\n    -> END//\nQuery OK, 0 rows affected (0.00 sec)\n\nMariaDB> delimiter ;\n\nMariaDB> CALL simpleproc(@a);\nQuery OK, 0 rows affected (0.00 sec)\n\nMariaDB> SELECT @a;\n+------+\n| @a   |\n+------+\n| 3    |\n+------+\n1 row in set (0.00 sec)\n\nThe example uses the mysql client delimiter command to change the\nstatement delimiter from ; to // while the procedure is being defined.\nThis enables the ; delimiter used in the procedure body to be passed\nthrough to the server rather than being interpreted by mysql itself.\nSee\nhttps://mariadb.com/kb/en/stored-procedure-overview/.\n\nThe RETURNS clause may be specified only for a FUNCTION, for which it\nis mandatory. It indicates the return type of the function, and the\nfunction body must contain a RETURN value statement. If the RETURN\nstatement returns a value of a different type, the value is coerced to\nthe proper type. For example, if a function specifies an ENUM or SET\nvalue in the RETURNS clause, but the RETURN statement returns an\ninteger, the value returned from the function is the string for the\ncorresponding ENUM member of set of SET members.\n\nThe following example function takes a parameter, performs an operation\nusing an SQL function, and returns the result. In this case, it is\nunnecessary to use delimiter because the function definition contains\nno internal ; statement delimiters:\n\nMariaDB> CREATE FUNCTION hello (s CHAR(20))\nMariaDB> RETURNS CHAR(50) DETERMINISTIC\n    -> RETURN CONCAT(\'Hello, \',s,\'!\');\nQuery OK, 0 rows affected (0.00 sec)\n\nMariaDB> SELECT hello(\'world\');\n+----------------+\n| hello(\'world\') |\n+----------------+\n| Hello, world!  |\n+----------------+\n1 row in set (0.00 sec)\n\nParameter types and function return types can be declared to use any\nvalid data type, except that the COLLATE attribute cannot be used prior\nto MySQL 5.5.3. As of 5.5.3, COLLATE can be used if preceded by the\nCHARACTER SET attribute.\n\nThe routine_body consists of a valid SQL routine statement. This can be\na simple statement such as SELECT or INSERT, or a compound statement\nwritten using BEGIN and END. Compound statements can contain\ndeclarations, loops, and other control structure statements. The syntax\nfor these statements is described in\nhttps://mariadb.com/kb/programmatic-and-compound-statements.\n\nMySQL permits routines to contain DDL statements, such as CREATE and\nDROP. MySQL also permits stored procedures (but not stored functions)\nto contain SQL transaction statements such as COMMIT. Stored functions\nmay not contain statements that perform explicit or implicit commit or\nrollback. Support for these statements is not required by the SQL\nstandard, which states that each DBMS vendor may decide whether to\npermit them.\n\nStatements that return a result set can be used within a stored\nprocedure but not within a stored function. This prohibition includes\nSELECT statements that do not have an INTO var_list clause and other\nstatements such as SHOW, EXPLAIN, and CHECK TABLE. For statements that\ncan be determined at function definition time to return a result set, a\nNot allowed to return a result set from a function error occurs\n(ER_SP_NO_RETSET). For statements that can be determined only at\nruntime to return a result set, a PROCEDURE %s can\'t return a result\nset in the given context error occurs (ER_SP_BADSELECT).\n\nUSE statements within stored routines are not permitted. When a routine\nis invoked, an implicit USE db_name is performed (and undone when the\nroutine terminates). The causes the routine to have the given default\ndatabase while it executes. References to objects in databases other\nthan the routine default database should be qualified with the\nappropriate database name.\n\nFor additional information about statements that are not permitted in\nstored routines, see\nhttps://mariadb.com/kb/en/stored-routine-privileges/\n.\n\nFor information about invoking stored procedures from within programs\nwritten in a language that has a MySQL interface, see [HELP CALL].\n\nMySQL stores the sql_mode system variable setting that is in effect at\nthe time a routine is created, and always executes the routine with\nthis setting in force, regardless of the server SQL mode in effect when\nthe routine is invoked.\n\nThe switch from the SQL mode of the invoker to that of the routine\noccurs after evaluation of arguments and assignment of the resulting\nvalues to routine parameters. If you define a routine in strict SQL\nmode but invoke it in nonstrict mode, assignment of arguments to\nroutine parameters does not take place in strict mode. If you require\nthat expressions passed to a routine be assigned in strict SQL mode,\nyou should invoke the routine with strict mode in effect.\n\nURL: https://mariadb.com/kb/en/create-procedure/\n\n', '', 'https://mariadb.com/kb/en/create-procedure/'),
(303, 'VARBINARY', 22, 'VARBINARY(M)\n\nThe VARBINARY type is similar to the VARCHAR type, but stores binary\nbyte strings rather than nonbinary character strings. M represents the\nmaximum column length in bytes.\n\nURL: https://mariadb.com/kb/en/varbinary/\n\n', '', 'https://mariadb.com/kb/en/varbinary/'),
(304, 'LOAD INDEX', 26, 'Syntax:\nLOAD INDEX INTO CACHE\n  tbl_index_list [, tbl_index_list] ...\n\ntbl_index_list:\n  tbl_name\n    [PARTITION (partition_list | ALL)]\n    [[INDEX|KEY] (index_name[, index_name] ...)]\n    [IGNORE LEAVES]\n\npartition_list:\n    partition_name[, partition_name][, ...]\n\nThe LOAD INDEX INTO CACHE statement preloads a table index into the key\ncache to which it has been assigned by an explicit CACHE INDEX\nstatement, or into the default key cache otherwise.\n\nLOAD INDEX INTO CACHE is used only for MyISAM tables. In MySQL 5.5, it\nis also supported for partitioned MyISAM tables; in addition, indexes\non partitioned tables can be preloaded for one, several, or all\npartitions.\n\nThe IGNORE LEAVES modifier causes only blocks for the nonleaf nodes of\nthe index to be preloaded.\n\nIGNORE LEAVES is also supported for partitioned MyISAM tables.\n\nURL: https://mariadb.com/kb/en/load-index/\n\n', '', 'https://mariadb.com/kb/en/load-index/'),
(305, 'UNION', 27, 'Syntax:\nSELECT ...\nUNION [ALL | DISTINCT] SELECT ...\n[UNION [ALL | DISTINCT] SELECT ...]\n\nUNION is used to combine the result from multiple SELECT statements\ninto a single result set.\n\nThe column names from the first SELECT statement are used as the column\nnames for the results returned. Selected columns listed in\ncorresponding positions of each SELECT statement should have the same\ndata type. (For example, the first column selected by the first\nstatement should have the same type as the first column selected by the\nother statements.)\n\nURL: https://mariadb.com/kb/en/union/\n\n', '', 'https://mariadb.com/kb/en/union/'),
(306, 'TO_DAYS', 31, 'Syntax:\nTO_DAYS(date)\n\nGiven a date date, returns a day number (the number of days since year\n0).\n\nURL: https://mariadb.com/kb/en/to_days/\n\n', 'MariaDB> SELECT TO_DAYS(950501);\n        -> 728779\nMariaDB> SELECT TO_DAYS(\'2007-10-07\');\n        -> 733321\n', 'https://mariadb.com/kb/en/to_days/'),
(307, 'NOT REGEXP', 37, 'Syntax:\nexpr NOT REGEXP pat, expr NOT RLIKE pat\n\nThis is the same as NOT (expr REGEXP pat).\n\nURL: https://mariadb.com/kb/en/not-regexp/\n\n', '', 'https://mariadb.com/kb/en/not-regexp/'),
(308, 'SHOW INDEX', 26, 'Syntax:\nSHOW {INDEX | INDEXES | KEYS}\n    {FROM | IN} tbl_name\n    [{FROM | IN} db_name]\n    [WHERE expr]\n\nSHOW INDEX returns table index information. The format resembles that\nof the SQLStatistics call in ODBC. This statement requires some\nprivilege for any column in the table.\nYou can use db_name.tbl_name as an alternative to the tbl_name FROM\ndb_name syntax. These two statements are equivalent:\n\nSHOW INDEX FROM mytable FROM mydb;\nSHOW INDEX FROM mydb.mytable;\n\nThe WHERE clause can be given to select rows using more general\nconditions, as discussed in\nhttps://mariadb.com/kb/en/extended-show/.\n\nYou can also list a table\'s indexes with the mysqlshow -k db_name\ntbl_name command.\n\nURL: https://mariadb.com/kb/en/show-index/\n\n', '', 'https://mariadb.com/kb/en/show-index/'),
(309, 'SHOW CREATE DATABASE', 26, 'Syntax:\nSHOW CREATE {DATABASE | SCHEMA} [IF NOT EXISTS] db_name\n\nShows the CREATE DATABASE statement that creates the given database. If\nthe SHOW statement includes an IF NOT EXISTS clause, the output too\nincludes such a clause. SHOW CREATE SCHEMA is a synonym for SHOW CREATE\nDATABASE.\n\nURL: https://mariadb.com/kb/en/show-create-database/\n\n', 'MariaDB> SHOW CREATE DATABASE test\\G\n*************************** 1. row ***************************\n       Database: test\nCreate Database: CREATE DATABASE `test`\n                 /*!40100 DEFAULT CHARACTER SET latin1 */\n\nMariaDB> SHOW CREATE SCHEMA test\\G\n*************************** 1. row ***************************\n       Database: test\nCreate Database: CREATE DATABASE `test`\n                 /*!40100 DEFAULT CHARACTER SET latin1 */\n', 'https://mariadb.com/kb/en/show-create-database/'),
(310, 'LEAVE', 23, 'Syntax:\nLEAVE label\n\nThis statement is used to exit the flow control construct that has the\ngiven label. If the label is for the outermost stored program block,\nLEAVE exits the program.\n\nLEAVE can be used within BEGIN ... END or loop constructs (LOOP,\nREPEAT, WHILE).\n\nURL: https://mariadb.com/kb/en/leave/\n\n', '', 'https://mariadb.com/kb/en/leave/'),
(311, 'NOT IN', 18, 'Syntax:\nexpr NOT IN (value,...)\n\nThis is the same as NOT (expr IN (value,...)).\n\nURL: https://mariadb.com/kb/en/not-in/\n\n', '', 'https://mariadb.com/kb/en/not-in/'),
(312, '!', 15, 'Syntax:\nNOT, !\n\nLogical NOT. Evaluates to 1 if the operand is 0, to 0 if the operand is\nnonzero, and NOT NULL returns NULL.\n\nURL: https://mariadb.com/kb/en/not/\n\n', 'MariaDB> SELECT NOT 10;\n        -> 0\nMariaDB> SELECT NOT 0;\n        -> 1\nMariaDB> SELECT NOT NULL;\n        -> NULL\nMariaDB> SELECT ! (1+1);\n        -> 0\nMariaDB> SELECT ! 1+1;\n        -> 1\n', 'https://mariadb.com/kb/en/not/');
INSERT INTO `help_topic` (`help_topic_id`, `name`, `help_category_id`, `description`, `example`, `url`) VALUES
(313, 'DECLARE HANDLER', 23, 'Syntax:\nDECLARE handler_action HANDLER\n    FOR condition_value [, condition_value] ...\n    statement\n\nhandler_action:\n    CONTINUE\n  | EXIT\n  | UNDO\n\ncondition_value:\n    mysql_error_code\n  | SQLSTATE [VALUE] sqlstate_value\n  | condition_name\n  | SQLWARNING\n  | NOT FOUND\n  | SQLEXCEPTION\n\nThe DECLARE ... HANDLER statement specifies a handler that deals with\none or more conditions. If one of these conditions occurs, the\nspecified statement executes. statement can be a simple statement such\nas SET var_name = value, or a compound statement written using BEGIN\nand END (see [HELP BEGIN END]).\n\nHandler declarations must appear after variable or condition\ndeclarations.\n\nThe handler_action value indicates what action the handler takes after\nexecution of the handler statement:\n\no CONTINUE: Execution of the current program continues.\n\no EXIT: Execution terminates for the BEGIN ... END compound statement\n  in which the handler is declared. This is true even if the condition\n  occurs in an inner block.\n\no UNDO: Not supported.\n\nThe condition_value for DECLARE ... HANDLER indicates the specific\ncondition or class of conditions that activates the handler:\n\no A MySQL error code (a number) or an SQLSTATE value (a 5-character\n  string literal). You should not use MySQL error code 0 or SQLSTATE\n  values that begin with \'00\', because those indicate success rather\n  than an error condition. For a list of MySQL error codes and SQLSTATE\n  values, see\n  https://mariadb.com/kb/en/mariadb-error-codes/.\n\no A condition name previously specified with DECLARE ... CONDITION. A\n  condition name can be associated with a MySQL error code or SQLSTATE\n  value. See [HELP DECLARE CONDITION].\n\no SQLWARNING is shorthand for the class of SQLSTATE values that begin\n  with \'01\'.\n\no NOT FOUND is shorthand for the class of SQLSTATE values that begin\n  with \'02\'. This is relevant within the context of cursors and is used\n  to control what happens when a cursor reaches the end of a data set.\n  If no more rows are available, a No Data condition occurs with\n  SQLSTATE value \'02000\'. To detect this condition, you can set up a\n  handler for it (or for a NOT FOUND condition). For an example, see\n  https://mariadb.com/kb/en/cursor-overview/. This condition\n  also occurs for SELECT ... INTO var_list statements that retrieve no\n  rows.\n\no SQLEXCEPTION is shorthand for the class of SQLSTATE values that do\n  not begin with \'00\', \'01\', or \'02\'.\n\nIf a condition occurs for which no handler has been declared, the\naction taken depends on the condition class:\n\no For SQLEXCEPTION conditions, the stored program terminates at the\n  statement that raised the condition, as if there were an EXIT\n  handler. If the program was called by another stored program, the\n  calling program handles the condition using the handler selection\n  rules applied to its own handlers.\n\no For SQLWARNING conditions, the program continues executing, as if\n  there were a CONTINUE handler.\n\no For NOT FOUND conditions, if the condition was raised normally, the\n  action is CONTINUE. If it was raised by SIGNAL or RESIGNAL, the\n  action is EXIT.\n\nURL: https://mariadb.com/kb/en/declare-handler/\n\n', 'MariaDB> CREATE TABLE test.t (s1 INT, PRIMARY KEY (s1));\nQuery OK, 0 rows affected (0.00 sec)\n\nMariaDB> delimiter //\n\nMariaDB> CREATE PROCEDURE handlerdemo ()\n    -> BEGIN\n    ->   DECLARE CONTINUE HANDLER FOR SQLSTATE \'23000\' SET @x2 = 1;\n    ->   SET @x = 1;\n    ->   INSERT INTO test.t VALUES (1);\n    ->   SET @x = 2;\n    ->   INSERT INTO test.t VALUES (1);\n    ->   SET @x = 3;\n    -> END;\n    -> //\nQuery OK, 0 rows affected (0.00 sec)\n\nMariaDB> CALL handlerdemo()//\nQuery OK, 0 rows affected (0.00 sec)\n\nMariaDB> SELECT @x//\n    +------+\n    | @x   |\n    +------+\n    | 3    |\n    +------+\n    1 row in set (0.00 sec)\n', 'https://mariadb.com/kb/en/declare-handler/'),
(314, 'DOUBLE', 22, 'DOUBLE[(M,D)] [UNSIGNED] [ZEROFILL]\n\nA normal-size (double-precision) floating-point number. Permissible\nvalues are -1.7976931348623157E+308 to -2.2250738585072014E-308, 0, and\n2.2250738585072014E-308 to 1.7976931348623157E+308. These are the\ntheoretical limits, based on the IEEE standard. The actual range might\nbe slightly smaller depending on your hardware or operating system.\n\nM is the total number of digits and D is the number of digits following\nthe decimal point. If M and D are omitted, values are stored to the\nlimits permitted by the hardware. A double-precision floating-point\nnumber is accurate to approximately 15 decimal places.\n\nUNSIGNED, if specified, disallows negative values.\n\nURL: https://mariadb.com/kb/en/double/\n\n', '', 'https://mariadb.com/kb/en/double/'),
(315, 'TIME', 22, 'TIME\n\nA time. The range is \'-838:59:59\' to \'838:59:59\'. MySQL displays TIME\nvalues in \'HH:MM:SS\' format, but permits assignment of values to TIME\ncolumns using either strings or numbers.\n\nURL: https://mariadb.com/kb/en/time/\n\n', '', 'https://mariadb.com/kb/en/time/'),
(316, '&&', 15, 'Syntax:\nAND, &&\n\nLogical AND. Evaluates to 1 if all operands are nonzero and not NULL,\nto 0 if one or more operands are 0, otherwise NULL is returned.\n\nURL: https://mariadb.com/kb/en/and/\n\n', 'MariaDB> SELECT 1 && 1;\n        -> 1\nMariaDB> SELECT 1 && 0;\n        -> 0\nMariaDB> SELECT 1 && NULL;\n        -> NULL\nMariaDB> SELECT 0 && NULL;\n        -> 0\nMariaDB> SELECT NULL && 0;\n        -> 0\n', 'https://mariadb.com/kb/en/and/'),
(317, 'X', 11, 'X(p)\n\nReturns the X-coordinate value for the Point object p as a\ndouble-precision number.\n\nURL: https://mariadb.com/kb/en/x/\n\n', 'MariaDB> SELECT X(POINT(56.7, 53.34));\n+-----------------------+\n| X(POINT(56.7, 53.34)) |\n+-----------------------+\n|                  56.7 |\n+-----------------------+\n', 'https://mariadb.com/kb/en/x/'),
(318, 'SYSTEM_USER', 17, 'Syntax:\nSYSTEM_USER()\n\nSYSTEM_USER() is a synonym for USER().\n\nURL: https://mariadb.com/kb/en/system_user/\n\n', '', 'https://mariadb.com/kb/en/system_user/'),
(319, 'FOUND_ROWS', 17, 'Syntax:\nFOUND_ROWS()\n\nA SELECT statement may include a LIMIT clause to restrict the number of\nrows the server returns to the client. In some cases, it is desirable\nto know how many rows the statement would have returned without the\nLIMIT, but without running the statement again. To obtain this row\ncount, include a SQL_CALC_FOUND_ROWS option in the SELECT statement,\nand then invoke FOUND_ROWS() afterward:\n\nURL: https://mariadb.com/kb/en/found_rows/\n\n', 'MariaDB> SELECT SQL_CALC_FOUND_ROWS * FROM tbl_name\n    -> WHERE id > 100 LIMIT 10;\nMariaDB> SELECT FOUND_ROWS();\n', 'https://mariadb.com/kb/en/found_rows/'),
(320, 'CROSSES', 30, 'Crosses(g1,g2)\n\nReturns 1 if g1 spatially crosses g2. Returns NULL if g1 is a Polygon\nor a MultiPolygon, or if g2 is a Point or a MultiPoint. Otherwise,\nreturns 0.\n\nThe term spatially crosses denotes a spatial relation between two given\ngeometries that has the following properties:\n\no The two geometries intersect\n\no Their intersection results in a geometry that has a dimension that is\n  one less than the maximum dimension of the two given geometries\n\no Their intersection is not equal to either of the two given geometries\n\nURL: https://mariadb.com/kb/en/crosses/\n\n', '', 'https://mariadb.com/kb/en/crosses/'),
(321, 'TRUNCATE TABLE', 39, 'Syntax:\nTRUNCATE [TABLE] tbl_name\n\nTRUNCATE TABLE empties a table completely. It requires the DROP\nprivilege.\n\nLogically, TRUNCATE TABLE is similar to a DELETE statement that deletes\nall rows, or a sequence of DROP TABLE and CREATE TABLE statements. To\nachieve high performance, it bypasses the DML method of deleting data.\nThus, it cannot be rolled back, it does not cause ON DELETE triggers to\nfire, and it cannot be performed for InnoDB tables with parent-child\nforeign key relationships.\n\nAlthough TRUNCATE TABLE is similar to DELETE, it is classified as a DDL\nstatement rather than a DML statement. It differs from DELETE in the\nfollowing ways in MySQL 5.5:\n\no Truncate operations drop and re-create the table, which is much\n  faster than deleting rows one by one, particularly for large tables.\n\no Truncate operations cause an implicit commit, and so cannot be rolled\n  back.\n\no Truncation operations cannot be performed if the session holds an\n  active table lock.\n\no TRUNCATE TABLE fails for an InnoDB table if there are any FOREIGN KEY\n  constraints from other tables that reference the table. Foreign key\n  constraints between columns of the same table are permitted.\n\no Truncation operations do not return a meaningful value for the number\n  of deleted rows. The usual result is \"0 rows affected,\" which should\n  be interpreted as \"no information.\"\n\no As long as the table format file tbl_name.frm is valid, the table can\n  be re-created as an empty table with TRUNCATE TABLE, even if the data\n  or index files have become corrupted.\n\no Any AUTO_INCREMENT value is reset to its start value. This is true\n  even for MyISAM and InnoDB, which normally do not reuse sequence\n  values.\n\no When used with partitioned tables, TRUNCATE TABLE preserves the\n  partitioning; that is, the data and index files are dropped and\n  re-created, while the partition definitions (.par) file is\n  unaffected.\n\no The TRUNCATE TABLE statement does not invoke ON DELETE triggers.\n\nURL: https://mariadb.com/kb/en/truncate-table/\n\n', '', 'https://mariadb.com/kb/en/truncate-table/'),
(322, 'BIT_XOR', 16, 'Syntax:\nBIT_XOR(expr)\n\nReturns the bitwise XOR of all bits in expr. The calculation is\nperformed with 64-bit (BIGINT) precision.\n\nURL: https://mariadb.com/kb/en/bit_xor/\n\n', '', 'https://mariadb.com/kb/en/bit_xor/'),
(323, 'CURRENT_DATE', 31, 'Syntax:\nCURRENT_DATE, CURRENT_DATE()\n\nCURRENT_DATE and CURRENT_DATE() are synonyms for CURDATE().\n\nURL: https://mariadb.com/kb/en/current_date/\n\n', '', 'https://mariadb.com/kb/en/current_date/'),
(324, 'START SLAVE', 8, 'Syntax:\nSTART SLAVE [thread_types]\n\nSTART SLAVE [SQL_THREAD] UNTIL\n    MASTER_LOG_FILE = \'log_name\', MASTER_LOG_POS = log_pos\n\nSTART SLAVE [SQL_THREAD] UNTIL\n    RELAY_LOG_FILE = \'log_name\', RELAY_LOG_POS = log_pos\n\nthread_types:\n    [thread_type [, thread_type] ... ]\n\nthread_type: IO_THREAD | SQL_THREAD\n\nSTART SLAVE with no thread_type options starts both of the slave\nthreads. The I/O thread reads events from the master server and stores\nthem in the relay log. The SQL thread reads events from the relay log\nand executes them. START SLAVE requires the SUPER privilege.\n\nIf START SLAVE succeeds in starting the slave threads, it returns\nwithout any error. However, even in that case, it might be that the\nslave threads start and then later stop (for example, because they do\nnot manage to connect to the master or read its binary log, or some\nother problem). START SLAVE does not warn you about this. You must\ncheck the slave\'s error log for error messages generated by the slave\nthreads, or check that they are running satisfactorily with SHOW SLAVE\nSTATUS.\n\nURL: https://mariadb.com/kb/en/start-slave/\n\n', '', 'https://mariadb.com/kb/en/start-slave/'),
(325, 'AREA', 2, 'Area(poly)\n\nReturns as a double-precision number the area of the Polygon value\npoly, as measured in its spatial reference system.\n\nURL: https://mariadb.com/kb/en/area/\n\n', 'MariaDB> SET @poly = \'Polygon((0 0,0 3,3 0,0 0),(1 1,1 2,2 1,1 1))\';\nMariaDB> SELECT Area(GeomFromText(@poly));\n+---------------------------+\n| Area(GeomFromText(@poly)) |\n+---------------------------+\n|                         4 |\n+---------------------------+\n', 'https://mariadb.com/kb/en/area/'),
(326, 'FLUSH', 26, 'Syntax:\nFLUSH [NO_WRITE_TO_BINLOG | LOCAL]\n    flush_option [, flush_option] ...\n\nThe FLUSH statement has several variant forms that clear or reload\nvarious internal caches, flush tables, or acquire locks. To execute\nFLUSH, you must have the RELOAD privilege. Specific flush options might\nrequire additional privileges, as described later.\n\nBy default, the server writes FLUSH statements to the binary log so\nthat they replicate to replication slaves. To suppress logging, use the\noptional NO_WRITE_TO_BINLOG keyword or its alias LOCAL.\n\n*Note*: FLUSH LOGS, FLUSH MASTER, FLUSH SLAVE, and FLUSH TABLES WITH\nREAD LOCK (with or without a table list) are not written to the binary\nlog in any case because they would cause problems if replicated to a\nslave.\n\nThe FLUSH statement causes an implicit commit. See\nhttp://dev.mysql.com/doc/refman/5.5/en/implicit-commit.html.\n\nThe RESET statement is similar to FLUSH. See [HELP RESET], for\ninformation about using the RESET statement with replication.\n\nURL: https://mariadb.com/kb/en/flush/\n\n', '', 'https://mariadb.com/kb/en/flush/'),
(327, 'BEGIN END', 23, 'Syntax:\n[begin_label:] BEGIN\n    [statement_list]\nEND [end_label]\n\nBEGIN ... END syntax is used for writing compound statements, which can\nappear within stored programs (stored procedures and functions,\ntriggers, and events). A compound statement can contain multiple\nstatements, enclosed by the BEGIN and END keywords. statement_list\nrepresents a list of one or more statements, each terminated by a\nsemicolon (;) statement delimiter. The statement_list itself is\noptional, so the empty compound statement (BEGIN END) is legal.\n\nBEGIN ... END blocks can be nested.\n\nUse of multiple statements requires that a client is able to send\nstatement strings containing the ; statement delimiter. In the mysql\ncommand-line client, this is handled with the delimiter command.\nChanging the ; end-of-statement delimiter (for example, to //) permit ;\nto be used in a program body. For an example, see\nhttps://mariadb.com/kb/en/stored-procedure-overview/.\n\nA BEGIN ... END block can be labeled. See [HELP labels].\n\nURL: https://mariadb.com/kb/en/begin-end/\n\n', '', 'https://mariadb.com/kb/en/begin-end/'),
(328, 'SHOW PROCEDURE STATUS', 26, 'Syntax:\nSHOW PROCEDURE STATUS\n    [LIKE \'pattern\' | WHERE expr]\n\nThis statement is a MySQL extension. It returns characteristics of a\nstored procedure, such as the database, name, type, creator, creation\nand modification dates, and character set information. A similar\nstatement, SHOW FUNCTION STATUS, displays information about stored\nfunctions (see [HELP SHOW FUNCTION STATUS]).\n\nThe LIKE clause, if present, indicates which procedure or function\nnames to match. The WHERE clause can be given to select rows using more\ngeneral conditions, as discussed in\nhttps://mariadb.com/kb/en/extended-show/.\n\nURL: https://mariadb.com/kb/en/show-procedure-status/\n\n', 'MariaDB> SHOW PROCEDURE STATUS LIKE \'sp1\'\\G\n*************************** 1. row ***************************\n                  Db: test\n                Name: sp1\n                Type: PROCEDURE\n             Definer: testuser@localhost\n            Modified: 2004-08-03 15:29:37\n             Created: 2004-08-03 15:29:37\n       Security_type: DEFINER\n             Comment:\ncharacter_set_client: latin1\ncollation_connection: latin1_swedish_ci\n  Database Collation: latin1_swedish_ci\n', 'https://mariadb.com/kb/en/show-procedure-status/'),
(329, 'DESCRIBE', 28, 'Syntax:\n{DESCRIBE | DESC} tbl_name [col_name | wild]\n\nDESCRIBE provides information about the columns in a table. It is a\nshortcut for SHOW COLUMNS FROM. These statements also display\ninformation for views. (See [HELP SHOW COLUMNS].)\n\ncol_name can be a column name, or a string containing the SQL \"%\" and\n\"_\" wildcard characters to obtain output only for the columns with\nnames matching the string. There is no need to enclose the string\nwithin quotation marks unless it contains spaces or other special\ncharacters.\n\nMariaDB> DESCRIBE City;\n+------------+----------+------+-----+---------+----------------+\n| Field      | Type     | Null | Key | Default | Extra          |\n+------------+----------+------+-----+---------+----------------+\n| Id         | int(11)  | NO   | PRI | NULL    | auto_increment |\n| Name       | char(35) | NO   |     |         |                |\n| Country    | char(3)  | NO   | UNI |         |                |\n| District   | char(20) | YES  | MUL |         |                |\n| Population | int(11)  | NO   |     | 0       |                |\n+------------+----------+------+-----+---------+----------------+\n5 rows in set (0.00 sec)\n\nThe description for SHOW COLUMNS provides more information about the\noutput columns (see [HELP SHOW COLUMNS]).\n\nURL: https://mariadb.com/kb/en/describe/\n\n', '', 'https://mariadb.com/kb/en/describe/'),
(330, 'SHOW WARNINGS', 26, 'Syntax:\nSHOW WARNINGS [LIMIT [offset,] row_count]\nSHOW COUNT(*) WARNINGS\n\nSHOW WARNINGS shows information about the conditions (errors, warnings,\nand notes) that resulted from the last statement in the current session\nthat generated messages. It shows nothing if the last statement used a\ntable and generated no messages. (That is, a statement that uses a\ntable but generates no messages clears the message list.) Statements\nthat do not use tables and do not generate messages have no effect on\nthe message list.\n\nWarnings are generated for DML statements such as INSERT, UPDATE, and\nLOAD DATA INFILE as well as DDL statements such as CREATE TABLE and\nALTER TABLE.\n\nSHOW WARNINGS is also used following EXPLAIN EXTENDED, to display the\nextra information generated by EXPLAIN when the EXTENDED keyword is\nused. See https://mariadb.com/kb/en/explain#explain-extended.\n\nThe LIMIT clause has the same syntax as for the SELECT statement. See\nhttps://mariadb.com/kb/en/select/.\n\nA related statement, SHOW ERRORS, shows only the error conditions (it\nexcludes warnings and notes). See [HELP SHOW ERRORS].\n\nThe SHOW COUNT(*) WARNINGS statement displays the total number of\nerrors, warnings, and notes. You can also retrieve this number from the\nwarning_count system variable:\n\nSHOW COUNT(*) WARNINGS;\nSELECT @@warning_count;\n\nURL: https://mariadb.com/kb/en/show-warnings/\n\n', '', 'https://mariadb.com/kb/en/show-warnings/'),
(331, 'DROP USER', 10, 'Syntax:\nDROP USER user [, user] ...\n\nThe DROP USER statement removes one or more MySQL accounts and their\nprivileges. It removes privilege rows for the account from all grant\ntables. To use this statement, you must have the global CREATE USER\nprivilege or the DELETE privilege for the mysql database. Each account\nname uses the format described in\nhttps://mariadb.com/kb/en/create-user#account-names. For example:\n\nDROP USER \'jeffrey\'@\'localhost\';\n\nIf you specify only the user name part of the account name, a host name\npart of \'%\' is used.\n\nURL: https://mariadb.com/kb/en/drop-user/\n\n', '', 'https://mariadb.com/kb/en/drop-user/'),
(332, 'STDDEV_POP', 16, 'Syntax:\nSTDDEV_POP(expr)\n\nReturns the population standard deviation of expr (the square root of\nVAR_POP()). You can also use STD() or STDDEV(), which are equivalent\nbut not standard SQL.\n\nSTDDEV_POP() returns NULL if there were no matching rows.\n\nURL: https://mariadb.com/kb/en/stddev_pop/\n\n', '', 'https://mariadb.com/kb/en/stddev_pop/'),
(333, 'SHOW CHARACTER SET', 26, 'Syntax:\nSHOW CHARACTER SET\n    [LIKE \'pattern\' | WHERE expr]\n\nThe SHOW CHARACTER SET statement shows all available character sets.\nThe LIKE clause, if present, indicates which character set names to\nmatch. The WHERE clause can be given to select rows using more general\nconditions, as discussed in\nhttps://mariadb.com/kb/en/extended-show/. For example:\n\nMariaDB> SHOW CHARACTER SET LIKE \'latin%\';\n+---------+-----------------------------+-------------------+--------+\n| Charset | Description                 | Default collation | Maxlen |\n+---------+-----------------------------+-------------------+--------+\n| latin1  | cp1252 West European        | latin1_swedish_ci |      1 |\n| latin2  | ISO 8859-2 Central European | latin2_general_ci |      1 |\n| latin5  | ISO 8859-9 Turkish          | latin5_turkish_ci |      1 |\n| latin7  | ISO 8859-13 Baltic          | latin7_general_ci |      1 |\n+---------+-----------------------------+-------------------+--------+\n\nURL: https://mariadb.com/kb/en/show-character-set/\n\n', '', 'https://mariadb.com/kb/en/show-character-set/'),
(334, 'SUBSTRING', 37, 'Syntax:\nSUBSTRING(str,pos), SUBSTRING(str FROM pos), SUBSTRING(str,pos,len),\nSUBSTRING(str FROM pos FOR len)\n\nThe forms without a len argument return a substring from string str\nstarting at position pos. The forms with a len argument return a\nsubstring len characters long from string str, starting at position\npos. The forms that use FROM are standard SQL syntax. It is also\npossible to use a negative value for pos. In this case, the beginning\nof the substring is pos characters from the end of the string, rather\nthan the beginning. A negative value may be used for pos in any of the\nforms of this function.\n\nFor all forms of SUBSTRING(), the position of the first character in\nthe string from which the substring is to be extracted is reckoned as\n1.\n\nURL: https://mariadb.com/kb/en/substring/\n\n', 'MariaDB> SELECT SUBSTRING(\'Quadratically\',5);\n        -> \'ratically\'\nMariaDB> SELECT SUBSTRING(\'foobarbar\' FROM 4);\n        -> \'barbar\'\nMariaDB> SELECT SUBSTRING(\'Quadratically\',5,6);\n        -> \'ratica\'\nMariaDB> SELECT SUBSTRING(\'Sakila\', -3);\n        -> \'ila\'\nMariaDB> SELECT SUBSTRING(\'Sakila\', -5, 3);\n        -> \'aki\'\nMariaDB> SELECT SUBSTRING(\'Sakila\' FROM -4 FOR 2);\n        -> \'ki\'\n', 'https://mariadb.com/kb/en/substring/'),
(335, 'ISEMPTY', 36, 'IsEmpty(g)\n\nReturns 1 if the geometry value g is the empty geometry, 0 if it is not\nempty, and -1 if the argument is NULL. If the geometry is empty, it\nrepresents the empty point set.\n\nURL: https://mariadb.com/kb/en/isempty/\n\n', '', 'https://mariadb.com/kb/en/isempty/'),
(336, 'SHOW FUNCTION STATUS', 26, 'Syntax:\nSHOW FUNCTION STATUS\n    [LIKE \'pattern\' | WHERE expr]\n\nThis statement is similar to SHOW PROCEDURE STATUS but for stored\nfunctions. See [HELP SHOW PROCEDURE STATUS].\n\nURL: https://mariadb.com/kb/en/show-function-status/\n\n', '', 'https://mariadb.com/kb/en/show-function-status/'),
(337, 'LTRIM', 37, 'Syntax:\nLTRIM(str)\n\nReturns the string str with leading space characters removed.\n\nURL: https://mariadb.com/kb/en/ltrim/\n\n', 'MariaDB> SELECT LTRIM(\'  barbar\');\n        -> \'barbar\'\n', 'https://mariadb.com/kb/en/ltrim/'),
(338, 'INTERSECTS', 30, 'Intersects(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 spatially intersects g2.\n\nURL: https://mariadb.com/kb/en/intersects/\n\n', '', 'https://mariadb.com/kb/en/intersects/'),
(339, 'CALL', 27, 'Syntax:\nCALL sp_name([parameter[,...]])\nCALL sp_name[()]\n\nThe CALL statement invokes a stored procedure that was defined\npreviously with CREATE PROCEDURE.\n\nStored procedures that take no arguments can be invoked without\nparentheses. That is, CALL p() and CALL p are equivalent.\n\nCALL can pass back values to its caller using parameters that are\ndeclared as OUT or INOUT parameters. When the procedure returns, a\nclient program can also obtain the number of rows affected for the\nfinal statement executed within the routine: At the SQL level, call the\nROW_COUNT() function; from the C API, call the mysql_affected_rows()\nfunction.\n\nURL: https://mariadb.com/kb/en/call/\n\n', '', 'https://mariadb.com/kb/en/call/'),
(340, 'MBRDISJOINT', 6, 'MBRDisjoint(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangles of\nthe two geometries g1 and g2 are disjoint (do not intersect).\n\nURL: https://mariadb.com/kb/en/mbrdisjoint/\n\n', '', 'https://mariadb.com/kb/en/mbrdisjoint/'),
(341, 'VALUES', 14, 'Syntax:\nVALUES(col_name)\n\nIn an INSERT ... ON DUPLICATE KEY UPDATE statement, you can use the\nVALUES(col_name) function in the UPDATE clause to refer to column\nvalues from the INSERT portion of the statement. In other words,\nVALUES(col_name) in the UPDATE clause refers to the value of col_name\nthat would be inserted, had no duplicate-key conflict occurred. This\nfunction is especially useful in multiple-row inserts. The VALUES()\nfunction is meaningful only in the ON DUPLICATE KEY UPDATE clause of\nINSERT statements and returns NULL otherwise. See\nhttps://mariadb.com/kb/en/insert-on-duplicate-key-update/.\n\nURL: https://mariadb.com/kb/en/values/\n\n', 'MariaDB> INSERT INTO table (a,b,c) VALUES (1,2,3),(4,5,6)\n    -> ON DUPLICATE KEY UPDATE c=VALUES(a)+VALUES(b);\n', 'https://mariadb.com/kb/en/values/'),
(342, 'SUBSTRING_INDEX', 37, 'Syntax:\nSUBSTRING_INDEX(str,delim,count)\n\nReturns the substring from string str before count occurrences of the\ndelimiter delim. If count is positive, everything to the left of the\nfinal delimiter (counting from the left) is returned. If count is\nnegative, everything to the right of the final delimiter (counting from\nthe right) is returned. SUBSTRING_INDEX() performs a case-sensitive\nmatch when searching for delim.\n\nURL: https://mariadb.com/kb/en/substring_index/\n\n', 'MariaDB> SELECT SUBSTRING_INDEX(\'www.mariadb.org\', \'.\', 2);\n        -> \'www.mariadb\'\nMariaDB> SELECT SUBSTRING_INDEX(\'www.mariadb.org\', \'.\', -2);\n        -> \'mariadb.org\'\n', 'https://mariadb.com/kb/en/substring_index/'),
(343, 'ENCODE', 12, 'Syntax:\nENCODE(str,pass_str)\n\nEncrypt str using pass_str as the password. To decrypt the result, use\nDECODE().\n\nThe result is a binary string of the same length as str.\n\nThe strength of the encryption is based on how good the random\ngenerator is. It should suffice for short strings.\n\nURL: https://mariadb.com/kb/en/encode/\n\n', '', 'https://mariadb.com/kb/en/encode/'),
(344, 'LOOP', 23, 'Syntax:\n[begin_label:] LOOP\n    statement_list\nEND LOOP [end_label]\n\nLOOP implements a simple loop construct, enabling repeated execution of\nthe statement list, which consists of one or more statements, each\nterminated by a semicolon (;) statement delimiter. The statements\nwithin the loop are repeated until the loop is terminated. Usually,\nthis is accomplished with a LEAVE statement. Within a stored function,\nRETURN can also be used, which exits the function entirely.\n\nNeglecting to include a loop-termination statement results in an\ninfinite loop.\n\nA LOOP statement can be labeled. For the rules regarding label use, see\n[HELP labels].\n\nURL: https://mariadb.com/kb/en/loop/\n\n', 'CREATE PROCEDURE doiterate(p1 INT)\nBEGIN\n  label1: LOOP\n    SET p1 = p1 + 1;\n    IF p1 < 10 THEN\n      ITERATE label1;\n    END IF;\n    LEAVE label1;\n  END LOOP label1;\n  SET @x = p1;\nEND;\n', 'https://mariadb.com/kb/en/loop/'),
(345, 'TRUNCATE', 4, 'Syntax:\nTRUNCATE(X,D)\n\nReturns the number X, truncated to D decimal places. If D is 0, the\nresult has no decimal point or fractional part. D can be negative to\ncause D digits left of the decimal point of the value X to become zero.\n\nURL: https://mariadb.com/kb/en/truncate/\n\n', 'MariaDB> SELECT TRUNCATE(1.223,1);\n        -> 1.2\nMariaDB> SELECT TRUNCATE(1.999,1);\n        -> 1.9\nMariaDB> SELECT TRUNCATE(1.999,0);\n        -> 1\nMariaDB> SELECT TRUNCATE(-1.999,1);\n        -> -1.9\nMariaDB> SELECT TRUNCATE(122,-2);\n       -> 100\nMariaDB> SELECT TRUNCATE(10.28*100,0);\n       -> 1028\n', 'https://mariadb.com/kb/en/truncate/'),
(346, 'TIMESTAMPADD', 31, 'Syntax:\nTIMESTAMPADD(unit,interval,datetime_expr)\n\nAdds the integer expression interval to the date or datetime expression\ndatetime_expr. The unit for interval is given by the unit argument,\nwhich should be one of the following values: MICROSECOND\n(microseconds), SECOND, MINUTE, HOUR, DAY, WEEK, MONTH, QUARTER, or\nYEAR.\n\nIt is possible to use FRAC_SECOND in place of MICROSECOND, but\nFRAC_SECOND is deprecated. FRAC_SECOND was removed in MySQL 5.5.3.\n\nThe unit value may be specified using one of keywords as shown, or with\na prefix of SQL_TSI_. For example, DAY and SQL_TSI_DAY both are legal.\n\nURL: https://mariadb.com/kb/en/timestampadd/\n\n', 'MariaDB> SELECT TIMESTAMPADD(MINUTE,1,\'2003-01-02\');\n        -> \'2003-01-02 00:01:00\'\nMariaDB> SELECT TIMESTAMPADD(WEEK,1,\'2003-01-02\');\n        -> \'2003-01-09\'\n', 'https://mariadb.com/kb/en/timestampadd/'),
(347, 'SHOW', 26, 'SHOW has many forms that provide information about databases, tables,\ncolumns, or status information about the server. This section describes\nthose following:\n\nSHOW AUTHORS\nSHOW {BINARY | MASTER} LOGS\nSHOW BINLOG EVENTS [IN \'log_name\'] [FROM pos] [LIMIT [offset,] row_count]\nSHOW CHARACTER SET [like_or_where]\nSHOW COLLATION [like_or_where]\nSHOW [FULL] COLUMNS FROM tbl_name [FROM db_name] [like_or_where]\nSHOW CONTRIBUTORS\nSHOW CREATE DATABASE db_name\nSHOW CREATE EVENT event_name\nSHOW CREATE FUNCTION func_name\nSHOW CREATE PROCEDURE proc_name\nSHOW CREATE TABLE tbl_name\nSHOW CREATE TRIGGER trigger_name\nSHOW CREATE VIEW view_name\nSHOW DATABASES [like_or_where]\nSHOW ENGINE engine_name {STATUS | MUTEX}\nSHOW [STORAGE] ENGINES\nSHOW ERRORS [LIMIT [offset,] row_count]\nSHOW EVENTS\nSHOW FUNCTION CODE func_name\nSHOW FUNCTION STATUS [like_or_where]\nSHOW GRANTS FOR user\nSHOW INDEX FROM tbl_name [FROM db_name]\nSHOW MASTER STATUS\nSHOW OPEN TABLES [FROM db_name] [like_or_where]\nSHOW PLUGINS\nSHOW PROCEDURE CODE proc_name\nSHOW PROCEDURE STATUS [like_or_where]\nSHOW PRIVILEGES\nSHOW [FULL] PROCESSLIST\nSHOW PROFILE [types] [FOR QUERY n] [OFFSET n] [LIMIT n]\nSHOW PROFILES\nSHOW SLAVE HOSTS\nSHOW SLAVE STATUS\nSHOW [GLOBAL | SESSION] STATUS [like_or_where]\nSHOW TABLE STATUS [FROM db_name] [like_or_where]\nSHOW [FULL] TABLES [FROM db_name] [like_or_where]\nSHOW TRIGGERS [FROM db_name] [like_or_where]\nSHOW [GLOBAL | SESSION] VARIABLES [like_or_where]\nSHOW WARNINGS [LIMIT [offset,] row_count]\n\nlike_or_where:\n    LIKE \'pattern\'\n  | WHERE expr\n\nIf the syntax for a given SHOW statement includes a LIKE \'pattern\'\npart, \'pattern\' is a string that can contain the SQL \"%\" and \"_\"\nwildcard characters. The pattern is useful for restricting statement\noutput to matching values.\n\nSeveral SHOW statements also accept a WHERE clause that provides more\nflexibility in specifying which rows to display. See\nhttps://mariadb.com/kb/en/extended-show/.\n\nURL: https://mariadb.com/kb/en/show/\n\n', '', 'https://mariadb.com/kb/en/show/'),
(348, 'GREATEST', 18, 'Syntax:\nGREATEST(value1,value2,...)\n\nWith two or more arguments, returns the largest (maximum-valued)\nargument. The arguments are compared using the same rules as for\nLEAST().\n\nURL: https://mariadb.com/kb/en/greatest/\n\n', 'MariaDB> SELECT GREATEST(2,0);\n        -> 2\nMariaDB> SELECT GREATEST(34.0,3.0,5.0,767.0);\n        -> 767.0\nMariaDB> SELECT GREATEST(\'B\',\'A\',\'C\');\n        -> \'C\'\n', 'https://mariadb.com/kb/en/greatest/'),
(349, 'SHOW VARIABLES', 26, 'Syntax:\nSHOW [GLOBAL | SESSION] VARIABLES\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW VARIABLES shows the values of MySQL system variables. This\ninformation also can be obtained using the mysqladmin variables\ncommand. The LIKE clause, if present, indicates which variable names to\nmatch. The WHERE clause can be given to select rows using more general\nconditions, as discussed in\nhttps://mariadb.com/kb/en/extended-show/. This\nstatement does not require any privilege. It requires only the ability\nto connect to the server.\n\nWith the GLOBAL modifier, SHOW VARIABLES displays the values that are\nused for new connections to MySQL. As of MySQL 5.5.3, if a variable has\nno global value, no value is displayed. Before 5.5.3, the session value\nis displayed. With SESSION, SHOW VARIABLES displays the values that are\nin effect for the current connection. If no modifier is present, the\ndefault is SESSION. LOCAL is a synonym for SESSION.\nWith a LIKE clause, the statement displays only rows for those\nvariables with names that match the pattern. To obtain the row for a\nspecific variable, use a LIKE clause as shown:\n\nSHOW VARIABLES LIKE \'max_join_size\';\nSHOW SESSION VARIABLES LIKE \'max_join_size\';\n\nTo get a list of variables whose name match a pattern, use the \"%\"\nwildcard character in a LIKE clause:\n\nSHOW VARIABLES LIKE \'%size%\';\nSHOW GLOBAL VARIABLES LIKE \'%size%\';\n\nWildcard characters can be used in any position within the pattern to\nbe matched. Strictly speaking, because \"_\" is a wildcard that matches\nany single character, you should escape it as \"\\_\" to match it\nliterally. In practice, this is rarely necessary.\n\nURL: https://mariadb.com/kb/en/show-variables/\n\n', '', 'https://mariadb.com/kb/en/show-variables/'),
(350, 'BINLOG', 26, 'Syntax:\nBINLOG \'str\'\n\nBINLOG is an internal-use statement. It is generated by the mysqlbinlog\nprogram as the printable representation of certain events in binary log\nfiles. (See https://mariadb.com/kb/en/mysqlbinlog/.)\nThe \'str\' value is a base 64-encoded string the that server decodes to\ndetermine the data change indicated by the corresponding event. This\nstatement requires the SUPER privilege.\n\nURL: https://mariadb.com/kb/en/binlog/\n\n', '', 'https://mariadb.com/kb/en/binlog/'),
(351, 'BIT_AND', 16, 'Syntax:\nBIT_AND(expr)\n\nReturns the bitwise AND of all bits in expr. The calculation is\nperformed with 64-bit (BIGINT) precision.\n\nURL: https://mariadb.com/kb/en/bit_and/\n\n', '', 'https://mariadb.com/kb/en/bit_and/'),
(352, 'SECOND', 31, 'Syntax:\nSECOND(time)\n\nReturns the second for time, in the range 0 to 59.\n\nURL: https://mariadb.com/kb/en/second/\n\n', 'MariaDB> SELECT SECOND(\'10:05:03\');\n        -> 3\n', 'https://mariadb.com/kb/en/second/'),
(353, 'ATAN2', 4, 'Syntax:\nATAN(Y,X), ATAN2(Y,X)\n\nReturns the arc tangent of the two variables X and Y. It is similar to\ncalculating the arc tangent of Y / X, except that the signs of both\narguments are used to determine the quadrant of the result.\n\nURL: https://mariadb.com/kb/en/atan2/\n\n', 'MariaDB> SELECT ATAN(-2,2);\n        -> -0.78539816339745\nMariaDB> SELECT ATAN2(PI(),0);\n        -> 1.5707963267949\n', 'https://mariadb.com/kb/en/atan2/'),
(354, 'MBRCONTAINS', 6, 'MBRContains(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangle of g1\ncontains the Minimum Bounding Rectangle of g2. This tests the opposite\nrelationship as MBRWithin().\n\nURL: https://mariadb.com/kb/en/mbrcontains/\n\n', 'MariaDB> SET @g1 = GeomFromText(\'Polygon((0 0,0 3,3 3,3 0,0 0))\');\nMariaDB> SET @g2 = GeomFromText(\'Point(1 1)\');\nMariaDB> SELECT MBRContains(@g1,@g2), MBRContains(@g2,@g1);\n----------------------+----------------------+\n| MBRContains(@g1,@g2) | MBRContains(@g2,@g1) |\n+----------------------+----------------------+\n|                    1 |                    0 |\n+----------------------+----------------------+\n', 'https://mariadb.com/kb/en/mbrcontains/'),
(355, 'HOUR', 31, 'Syntax:\nHOUR(time)\n\nReturns the hour for time. The range of the return value is 0 to 23 for\ntime-of-day values. However, the range of TIME values actually is much\nlarger, so HOUR can return values greater than 23.\n\nURL: https://mariadb.com/kb/en/hour/\n\n', 'MariaDB> SELECT HOUR(\'10:05:03\');\n        -> 10\nMariaDB> SELECT HOUR(\'272:59:59\');\n        -> 272\n', 'https://mariadb.com/kb/en/hour/'),
(356, 'SELECT', 27, 'Syntax:\nSELECT\n    [ALL | DISTINCT | DISTINCTROW ]\n      [HIGH_PRIORITY]\n      [STRAIGHT_JOIN]\n      [SQL_SMALL_RESULT] [SQL_BIG_RESULT] [SQL_BUFFER_RESULT]\n      [SQL_CACHE | SQL_NO_CACHE] [SQL_CALC_FOUND_ROWS]\n    select_expr [, select_expr ...]\n    [FROM table_references\n    [WHERE where_condition]\n    [GROUP BY {col_name | expr | position}\n      [ASC | DESC], ... [WITH ROLLUP]]\n    [HAVING where_condition]\n    [ORDER BY {col_name | expr | position}\n      [ASC | DESC], ...]\n    [LIMIT {[offset,] row_count | row_count OFFSET offset}]\n    [PROCEDURE procedure_name(argument_list)]\n    [INTO OUTFILE \'file_name\'\n        [CHARACTER SET charset_name]\n        export_options\n      | INTO DUMPFILE \'file_name\'\n      | INTO var_name [, var_name]]\n    [FOR UPDATE | LOCK IN SHARE MODE]]\n\nSELECT is used to retrieve rows selected from one or more tables, and\ncan include UNION statements and subqueries. See [HELP UNION], and\nhttps://mariadb.com/kb/en/subqueries/.\n\nThe most commonly used clauses of SELECT statements are these:\n\no Each select_expr indicates a column that you want to retrieve. There\n  must be at least one select_expr.\n\no table_references indicates the table or tables from which to retrieve\n  rows. Its syntax is described in [HELP JOIN].\n\no The WHERE clause, if given, indicates the condition or conditions\n  that rows must satisfy to be selected. where_condition is an\n  expression that evaluates to true for each row to be selected. The\n  statement selects all rows if there is no WHERE clause.\n\n  In the WHERE expression, you can use any of the functions and\n  operators that MySQL supports, except for aggregate (summary)\n  functions. See\n  https://mariadb.com/kb/en/select#select-expressions, and\n  https://mariadb.com/kb/en/functions-and-operators/.\n\nSELECT can also be used to retrieve rows computed without reference to\nany table.\n\nURL: https://mariadb.com/kb/en/select/\n\n', '', 'https://mariadb.com/kb/en/select/'),
(357, 'COT', 4, 'Syntax:\nCOT(X)\n\nReturns the cotangent of X.\n\nURL: https://mariadb.com/kb/en/cot/\n\n', 'MariaDB> SELECT COT(12);\n        -> -1.5726734063977\nMariaDB> SELECT COT(0);\n        -> NULL\n', 'https://mariadb.com/kb/en/cot/'),
(358, 'SHOW CREATE EVENT', 26, 'Syntax:\nSHOW CREATE EVENT event_name\n\nThis statement displays the CREATE EVENT statement needed to re-create\na given event. It requires the EVENT privilege for the database from\nwhich the event is to be shown. For example (using the same event\ne_daily defined and then altered in [HELP SHOW EVENTS]):\n\nURL: https://mariadb.com/kb/en/show-create-event/\n\n', 'MariaDB> SHOW CREATE EVENT test.e_daily\\G\n*************************** 1. row ***************************\n               Event: e_daily\n            sql_mode:\n           time_zone: SYSTEM\n        Create Event: CREATE EVENT `e_daily`\n                        ON SCHEDULE EVERY 1 DAY\n                        STARTS CURRENT_TIMESTAMP + INTERVAL 6 HOUR\n                        ON COMPLETION NOT PRESERVE\n                        ENABLE\n                        COMMENT \'Saves total number of sessions then\n                                clears the table each day\'\n                        DO BEGIN\n                          INSERT INTO site_activity.totals (time, total)\n                            SELECT CURRENT_TIMESTAMP, COUNT(*)\n                            FROM site_activity.sessions;\n                          DELETE FROM site_activity.sessions;\n                        END\ncharacter_set_client: latin1\ncollation_connection: latin1_swedish_ci\n  Database Collation: latin1_swedish_ci\n', 'https://mariadb.com/kb/en/show-create-event/'),
(359, 'LOAD_FILE', 37, 'Syntax:\nLOAD_FILE(file_name)\n\nReads the file and returns the file contents as a string. To use this\nfunction, the file must be located on the server host, you must specify\nthe full path name to the file, and you must have the FILE privilege.\nThe file must be readable by all and its size less than\nmax_allowed_packet bytes. If the secure_file_priv system variable is\nset to a nonempty directory name, the file to be loaded must be located\nin that directory.\n\nIf the file does not exist or cannot be read because one of the\npreceding conditions is not satisfied, the function returns NULL.\n\nThe character_set_filesystem system variable controls interpretation of\nfile names that are given as literal strings.\n\nURL: https://mariadb.com/kb/en/load_file/\n\n', 'MariaDB> UPDATE t\n            SET blob_col=LOAD_FILE(\'/tmp/picture\')\n            WHERE id=1;\n', 'https://mariadb.com/kb/en/load_file/'),
(360, 'POINTFROMTEXT', 3, 'PointFromText(wkt[,srid])\n\nConstructs a POINT value using its WKT representation and SRID.\n\nURL: https://mariadb.com/kb/en/pointfromtext/\n\n', '', 'https://mariadb.com/kb/en/pointfromtext/'),
(361, 'GROUP_CONCAT', 16, 'Syntax:\nGROUP_CONCAT(expr)\n\nThis function returns a string result with the concatenated non-NULL\nvalues from a group. It returns NULL if there are no non-NULL values.\nThe full syntax is as follows:\n\nGROUP_CONCAT([DISTINCT] expr [,expr ...]\n             [ORDER BY {unsigned_integer | col_name | expr}\n                 [ASC | DESC] [,col_name ...]]\n             [SEPARATOR str_val])\n\nURL: https://mariadb.com/kb/en/group_concat/\n\n', 'MariaDB> SELECT student_name,\n    ->     GROUP_CONCAT(test_score)\n    ->     FROM student\n    ->     GROUP BY student_name;\n', 'https://mariadb.com/kb/en/group_concat/'),
(362, 'DATE_FORMAT', 31, 'Syntax:\nDATE_FORMAT(date,format)\n\nFormats the date value according to the format string.\n\nURL: https://mariadb.com/kb/en/date_format/\n\n', 'MariaDB> SELECT DATE_FORMAT(\'2009-10-04 22:23:00\', \'%W %M %Y\');\n        -> \'Sunday October 2009\'\nMariaDB> SELECT DATE_FORMAT(\'2007-10-04 22:23:00\', \'%H:%i:%s\');\n        -> \'22:23:00\'\nMariaDB> SELECT DATE_FORMAT(\'1900-10-04 22:23:00\',\n    ->                 \'%D %y %a %d %m %b %j\');\n        -> \'4th 00 Thu 04 10 Oct 277\'\nMariaDB> SELECT DATE_FORMAT(\'1997-10-04 22:23:00\',\n    ->                 \'%H %k %I %r %T %S %w\');\n        -> \'22 22 10 10:23:00 PM 22:23:00 00 6\'\nMariaDB> SELECT DATE_FORMAT(\'1999-01-01\', \'%X %V\');\n        -> \'1998 52\'\nMariaDB> SELECT DATE_FORMAT(\'2006-06-00\', \'%d\');\n        -> \'00\'\n', 'https://mariadb.com/kb/en/date_format/'),
(363, 'BENCHMARK', 17, 'Syntax:\nBENCHMARK(count,expr)\n\nThe BENCHMARK() function executes the expression expr repeatedly count\ntimes. It may be used to time how quickly MySQL processes the\nexpression. The result value is always 0. The intended use is from\nwithin the mysql client, which reports query execution times:\n\nURL: https://mariadb.com/kb/en/benchmark/\n\n', 'MariaDB> SELECT BENCHMARK(1000000,ENCODE(\'hello\',\'goodbye\'));\n+----------------------------------------------+\n| BENCHMARK(1000000,ENCODE(\'hello\',\'goodbye\')) |\n+----------------------------------------------+\n|                                            0 |\n+----------------------------------------------+\n1 row in set (4.74 sec)\n', 'https://mariadb.com/kb/en/benchmark/'),
(364, 'YEAR', 31, 'Syntax:\nYEAR(date)\n\nReturns the year for date, in the range 1000 to 9999, or 0 for the\n\"zero\" date.\n\nURL: https://mariadb.com/kb/en/year/\n\n', 'MariaDB> SELECT YEAR(\'1987-01-01\');\n        -> 1987\n', 'https://mariadb.com/kb/en/year/'),
(365, 'SHOW ENGINE', 26, 'Syntax:\nSHOW ENGINE engine_name {STATUS | MUTEX}\n\nSHOW ENGINE displays operational information about a storage engine.\nThe following statements currently are supported:\n\nSHOW ENGINE INNODB STATUS\nSHOW ENGINE INNODB MUTEX\nSHOW ENGINE PERFORMANCE_SCHEMA STATUS\n\nSHOW ENGINE INNODB STATUS displays extensive information from the\nstandard InnoDB Monitor about the state of the InnoDB storage engine.\nFor information about the standard monitor and other InnoDB Monitors\nthat provide information about InnoDB processing, see\nhttp://dev.mysql.com/doc/refman/5.5/en/innodb-monitors.html.\n\nSHOW ENGINE INNODB MUTEX displays InnoDB mutex statistics. The\nstatement displays the following fields:\n\no Type\n\n  Always InnoDB.\n\no Name\n\n  The source file where the mutex is implemented, and the line number\n  in the file where the mutex is created. The line number may change\n  depending on your version of MySQL.\n\no Status\n\n  The mutex status. This field displays several values if UNIV_DEBUG\n  was defined at MySQL compilation time (for example, in include/univ.i\n  in the InnoDB part of the MySQL source tree). If UNIV_DEBUG was not\n  defined, the statement displays only the os_waits value. In the\n  latter case (without UNIV_DEBUG), the information on which the output\n  is based is insufficient to distinguish regular mutexes and mutexes\n  that protect rw-locks (which permit multiple readers or a single\n  writer). Consequently, the output may appear to contain multiple rows\n  for the same mutex.\n\n  o count indicates how many times the mutex was requested.\n\n  o spin_waits indicates how many times the spinlock had to run.\n\n  o spin_rounds indicates the number of spinlock rounds. (spin_rounds\n    divided by spin_waits provides the average round count.)\n\n  o os_waits indicates the number of operating system waits. This\n    occurs when the spinlock did not work (the mutex was not locked\n    during the spinlock and it was necessary to yield to the operating\n    system and wait).\n\n  o os_yields indicates the number of times a the thread trying to lock\n    a mutex gave up its timeslice and yielded to the operating system\n    (on the presumption that permitting other threads to run will free\n    the mutex so that it can be locked).\n\n  o os_wait_times indicates the amount of time (in ms) spent in\n    operating system waits, if the timed_mutexes system variable is 1\n    (ON). If timed_mutexes is 0 (OFF), timing is disabled, so\n    os_wait_times is 0. timed_mutexes is off by default.\n\nInformation from this statement can be used to diagnose system\nproblems. For example, large values of spin_waits and spin_rounds may\nindicate scalability problems.\n\nUse SHOW ENGINE PERFORMANCE_SCHEMA STATUS to inspect the internal\noperation of the Performance Schema code:\n\nMariaDB> SHOW ENGINE PERFORMANCE_SCHEMA STATUS\\G\n...\n*************************** 3. row ***************************\n  Type: performance_schema\n  Name: events_waits_history.row_size\nStatus: 76\n*************************** 4. row ***************************\n  Type: performance_schema\n  Name: events_waits_history.row_count\nStatus: 10000\n*************************** 5. row ***************************\n  Type: performance_schema\n  Name: events_waits_history.memory\nStatus: 760000\n...\n*************************** 57. row ***************************\n  Type: performance_schema\n  Name: performance_schema.memory\nStatus: 26459600\n...\n\nThe intent of this statement is to help the DBA to understand the\neffects that different options have on memory requirements.\n\nName values consist of two parts, which name an internal buffer and an\nattribute of the buffer, respectively:\n\no Internal buffers that are exposed as a table in the\n  performance_schema database are named after the table. Examples:\n  events_waits_history.row_size, mutex_instances.row_count.\n\no Internal buffers that are not exposed as a table are named within\n  parentheses. Examples: (pfs_cond_class).row_size,\n  (pfs_mutex_class).memory.\n\no Values that apply to the Performance Schema as a whole begin with\n  performance_schema. Example: performance_schema.memory.\n\nAttributes have these meanings:\n\no row_size cannot be changed. It is the size of the internal record\n  used by the implementation.\n\no row_count can be changed depending on the configuration options.\n\no For a table, tbl_name.memory is the product of row_size multiplied by\n  row_count. For the Performance Schema as a whole,\n  performance_schema.memory is the sum of all the memory used (the sum\n  of all other memory values).\n\nIn some cases, there is a direct relationship between a configuration\nparameter and a SHOW ENGINE value. For example,\nevents_waits_history_long.row_count corresponds to\nperformance_schema_events_waits_history_long_size. In other cases, the\nrelationship is more complex. For example,\nevents_waits_history.row_count corresponds to\nperformance_schema_events_waits_history_size (the number of rows per\nthread) multiplied by performance_schema_max_thread_instances ( the\nnumber of threads).\n\nURL: https://mariadb.com/kb/en/show-engine/\n\n', '', 'https://mariadb.com/kb/en/show-engine/'),
(366, 'NAME_CONST', 14, 'Syntax:\nNAME_CONST(name,value)\n\nReturns the given value. When used to produce a result set column,\nNAME_CONST() causes the column to have the given name. The arguments\nshould be constants.\n\nMariaDB> SELECT NAME_CONST(\'myname\', 14);\n+--------+\n| myname |\n+--------+\n|     14 |\n+--------+\n\nURL: https://mariadb.com/kb/en/name_const/\n\n', '', 'https://mariadb.com/kb/en/name_const/'),
(367, 'RELEASE_LOCK', 14, 'Syntax:\nRELEASE_LOCK(str)\n\nReleases the lock named by the string str that was obtained with\nGET_LOCK(). Returns 1 if the lock was released, 0 if the lock was not\nestablished by this thread (in which case the lock is not released),\nand NULL if the named lock did not exist. The lock does not exist if it\nwas never obtained by a call to GET_LOCK() or if it has previously been\nreleased.\n\nThe DO statement is convenient to use with RELEASE_LOCK(). See [HELP\nDO].\n\nURL: https://mariadb.com/kb/en/release_lock/\n\n', '', 'https://mariadb.com/kb/en/release_lock/'),
(368, 'IS NULL', 18, 'Syntax:\nIS NULL\n\nTests whether a value is NULL.\n\nURL: https://mariadb.com/kb/en/is-null/\n\n', 'MariaDB> SELECT 1 IS NULL, 0 IS NULL, NULL IS NULL;\n        -> 0, 0, 1\n', 'https://mariadb.com/kb/en/is-null/');
INSERT INTO `help_topic` (`help_topic_id`, `name`, `help_category_id`, `description`, `example`, `url`) VALUES
(369, 'CONVERT_TZ', 31, 'Syntax:\nCONVERT_TZ(dt,from_tz,to_tz)\n\nCONVERT_TZ() converts a datetime value dt from the time zone given by\nfrom_tz to the time zone given by to_tz and returns the resulting\nvalue. Time zones are specified as described in\nhttps://mariadb.com/kb/en/time-zones/. This\nfunction returns NULL if the arguments are invalid.\n\nURL: https://mariadb.com/kb/en/convert_tz/\n\n', 'MariaDB> SELECT CONVERT_TZ(\'2004-01-01 12:00:00\',\'GMT\',\'MET\');\n        -> \'2004-01-01 13:00:00\'\nMariaDB> SELECT CONVERT_TZ(\'2004-01-01 12:00:00\',\'+00:00\',\'+10:00\');\n        -> \'2004-01-01 22:00:00\'\n', 'https://mariadb.com/kb/en/convert_tz/'),
(370, 'TIME_TO_SEC', 31, 'Syntax:\nTIME_TO_SEC(time)\n\nReturns the time argument, converted to seconds.\n\nURL: https://mariadb.com/kb/en/time_to_sec/\n\n', 'MariaDB> SELECT TIME_TO_SEC(\'22:23:00\');\n        -> 80580\nMariaDB> SELECT TIME_TO_SEC(\'00:39:38\');\n        -> 2378\n', 'https://mariadb.com/kb/en/time_to_sec/'),
(371, 'WEEKDAY', 31, 'Syntax:\nWEEKDAY(date)\n\nReturns the weekday index for date (0 = Monday, 1 = Tuesday, ... 6 =\nSunday).\n\nURL: https://mariadb.com/kb/en/weekday/\n\n', 'MariaDB> SELECT WEEKDAY(\'2008-02-03 22:23:00\');\n        -> 6\nMariaDB> SELECT WEEKDAY(\'2007-11-06\');\n        -> 1\n', 'https://mariadb.com/kb/en/weekday/'),
(372, 'EXPORT_SET', 37, 'Syntax:\nEXPORT_SET(bits,on,off[,separator[,number_of_bits]])\n\nReturns a string such that for every bit set in the value bits, you get\nan on string and for every bit not set in the value, you get an off\nstring. Bits in bits are examined from right to left (from low-order to\nhigh-order bits). Strings are added to the result from left to right,\nseparated by the separator string (the default being the comma\ncharacter \",\"). The number of bits examined is given by number_of_bits,\nwhich has a default of 64 if not specified. number_of_bits is silently\nclipped to 64 if larger than 64. It is treated as an unsigned integer,\nso a value of -1 is effectively the same as 64.\n\nURL: https://mariadb.com/kb/en/export_set/\n\n', 'MariaDB> SELECT EXPORT_SET(5,\'Y\',\'N\',\',\',4);\n        -> \'Y,N,Y,N\'\nMariaDB> SELECT EXPORT_SET(6,\'1\',\'0\',\',\',10);\n        -> \'0,1,1,0,0,0,0,0,0,0\'\n', 'https://mariadb.com/kb/en/export_set/'),
(373, 'ALTER SERVER', 39, 'Syntax:\nALTER SERVER  server_name\n    OPTIONS (option [, option] ...)\n\nAlters the server information for server_name, adjusting any of the\noptions permitted in the CREATE SERVER statement. See [HELP CREATE\nSERVER]. The corresponding fields in the mysql.servers table are\nupdated accordingly. This statement requires the SUPER privilege.\n\nURL: https://mariadb.com/kb/en/alter-server/\n\n', 'ALTER SERVER s OPTIONS (USER \'sally\');\n', 'https://mariadb.com/kb/en/alter-server/'),
(374, 'RESIGNAL', 23, 'Syntax:\nRESIGNAL [condition_value]\n    [SET signal_information_item\n    [, signal_information_item] ...]\n\ncondition_value:\n    SQLSTATE [VALUE] sqlstate_value\n  | condition_name\n\nsignal_information_item:\n    condition_information_item_name = simple_value_specification\n\ncondition_information_item_name:\n    CLASS_ORIGIN\n  | SUBCLASS_ORIGIN\n  | MESSAGE_TEXT\n  | MYSQL_ERRNO\n  | CONSTRAINT_CATALOG\n  | CONSTRAINT_SCHEMA\n  | CONSTRAINT_NAME\n  | CATALOG_NAME\n  | SCHEMA_NAME\n  | TABLE_NAME\n  | COLUMN_NAME\n  | CURSOR_NAME\n\ncondition_name, simple_value_specification:\n    (see following discussion)\n\nRESIGNAL passes on the error condition information that is available\nduring execution of a condition handler within a compound statement\ninside a stored procedure or function, trigger, or event. RESIGNAL may\nchange some or all information before passing it on. RESIGNAL is\nrelated to SIGNAL, but instead of originating a condition as SIGNAL\ndoes, RESIGNAL relays existing condition information, possibly after\nmodifying it.\n\nRESIGNAL makes it possible to both handle an error and return the error\ninformation. Otherwise, by executing an SQL statement within the\nhandler, information that caused the handler\'s activation is destroyed.\nRESIGNAL also can make some procedures shorter if a given handler can\nhandle part of a situation, then pass the condition \"up the line\" to\nanother handler.\n\nNo special privileges are required to execute the RESIGNAL statement.\n\nFor condition_value and signal_information_item, the definitions and\nrules are the same for RESIGNAL as for SIGNAL (see [HELP SIGNAL]).\n\nThe RESIGNAL statement takes condition_value and SET clauses, both of\nwhich are optional. This leads to several possible uses:\n\no RESIGNAL alone:\n\nRESIGNAL;\n\no RESIGNAL with new signal information:\n\nRESIGNAL SET signal_information_item [, signal_information_item] ...;\n\no RESIGNAL with a condition value and possibly new signal information:\n\nRESIGNAL condition_value\n    [SET signal_information_item [, signal_information_item] ...];\n\nURL: https://mariadb.com/kb/en/resignal/\n\n', '', 'https://mariadb.com/kb/en/resignal/'),
(375, 'TIME FUNCTION', 31, 'Syntax:\nTIME(expr)\n\nExtracts the time part of the time or datetime expression expr and\nreturns it as a string.\n\nURL: https://mariadb.com/kb/en/time-function/\n\n', 'MariaDB> SELECT TIME(\'2003-12-31 01:02:03\');\n        -> \'01:02:03\'\nMariaDB> SELECT TIME(\'2003-12-31 01:02:03.000123\');\n        -> \'01:02:03.000123\'\n', 'https://mariadb.com/kb/en/time-function/'),
(376, 'DATE_ADD', 31, 'Syntax:\nDATE_ADD(date,INTERVAL expr unit), DATE_SUB(date,INTERVAL expr unit)\n\nThese functions perform date arithmetic. The date argument specifies\nthe starting date or datetime value. expr is an expression specifying\nthe interval value to be added or subtracted from the starting date.\nexpr is a string; it may start with a \"-\" for negative intervals. unit\nis a keyword indicating the units in which the expression should be\ninterpreted.\n\nURL: https://mariadb.com/kb/en/date_add/\n\n', 'MariaDB> SELECT \'2008-12-31 23:59:59\' + INTERVAL 1 SECOND;\n        -> \'2009-01-01 00:00:00\'\nMariaDB> SELECT INTERVAL 1 DAY + \'2008-12-31\';\n        -> \'2009-01-01\'\nMariaDB> SELECT \'2005-01-01\' - INTERVAL 1 SECOND;\n        -> \'2004-12-31 23:59:59\'\nMariaDB> SELECT DATE_ADD(\'2000-12-31 23:59:59\',\n    ->                 INTERVAL 1 SECOND);\n        -> \'2001-01-01 00:00:00\'\nMariaDB> SELECT DATE_ADD(\'2010-12-31 23:59:59\',\n    ->                 INTERVAL 1 DAY);\n        -> \'2011-01-01 23:59:59\'\nMariaDB> SELECT DATE_ADD(\'2100-12-31 23:59:59\',\n    ->                 INTERVAL \'1:1\' MINUTE_SECOND);\n        -> \'2101-01-01 00:01:00\'\nMariaDB> SELECT DATE_SUB(\'2005-01-01 00:00:00\',\n    ->                 INTERVAL \'1 1:1:1\' DAY_SECOND);\n        -> \'2004-12-30 22:58:59\'\nMariaDB> SELECT DATE_ADD(\'1900-01-01 00:00:00\',\n    ->                 INTERVAL \'-1 10\' DAY_HOUR);\n        -> \'1899-12-30 14:00:00\'\nMariaDB> SELECT DATE_SUB(\'1998-01-02\', INTERVAL 31 DAY);\n        -> \'1997-12-02\'\nMariaDB> SELECT DATE_ADD(\'1992-12-31 23:59:59.000002\',\n    ->            INTERVAL \'1.999999\' SECOND_MICROSECOND);\n        -> \'1993-01-01 00:00:01.000001\'\n', 'https://mariadb.com/kb/en/date_add/'),
(377, 'CAST', 37, 'Syntax:\nCAST(expr AS type)\n\nThe CAST() function takes an expression of any type and produces a\nresult value of a specified type, similar to CONVERT(). See the\ndescription of CONVERT() for more information.\n\nURL: https://mariadb.com/kb/en/cast/\n\n', '', 'https://mariadb.com/kb/en/cast/'),
(378, 'SOUNDS LIKE', 37, 'Syntax:\nexpr1 SOUNDS LIKE expr2\n\nThis is the same as SOUNDEX(expr1) = SOUNDEX(expr2).\n\nURL: https://mariadb.com/kb/en/sounds-like/\n\n', '', 'https://mariadb.com/kb/en/sounds-like/'),
(379, 'PERIOD_DIFF', 31, 'Syntax:\nPERIOD_DIFF(P1,P2)\n\nReturns the number of months between periods P1 and P2. P1 and P2\nshould be in the format YYMM or YYYYMM. Note that the period arguments\nP1 and P2 are not date values.\n\nURL: https://mariadb.com/kb/en/period_diff/\n\n', 'MariaDB> SELECT PERIOD_DIFF(200802,200703);\n        -> 11\n', 'https://mariadb.com/kb/en/period_diff/'),
(380, 'LIKE', 37, 'Syntax:\nexpr LIKE pat [ESCAPE \'escape_char\']\n\nPattern matching using SQL simple regular expression comparison.\nReturns 1 (TRUE) or 0 (FALSE). If either expr or pat is NULL, the\nresult is NULL.\n\nThe pattern need not be a literal string. For example, it can be\nspecified as a string expression or table column.\n\nURL: https://mariadb.com/kb/en/like/\n\n', 'MariaDB> SELECT \'David!\' LIKE \'David_\';\n        -> 1\nMariaDB> SELECT \'David!\' LIKE \'%D%v%\';\n        -> 1\n', 'https://mariadb.com/kb/en/like/'),
(381, 'MULTIPOINT', 24, 'MultiPoint(pt1,pt2,...)\n\nConstructs a MultiPoint value using Point or WKB Point arguments.\n\nURL: https://mariadb.com/kb/en/multipoint/\n\n', '', 'https://mariadb.com/kb/en/multipoint/'),
(382, '>>', 19, 'Syntax:\n>>\n\nShifts a longlong (BIGINT) number to the right.\n\nURL: https://mariadb.com/kb/en/shift-right/\n\n', 'MariaDB> SELECT 4 >> 2;\n        -> 1\n', 'https://mariadb.com/kb/en/shift-right/'),
(383, 'FETCH', 23, 'Syntax:\nFETCH [[NEXT] FROM] cursor_name INTO var_name [, var_name] ...\n\nThis statement fetches the next row for the SELECT statement associated\nwith the specified cursor (which must be open), and advances the cursor\npointer. If a row exists, the fetched columns are stored in the named\nvariables. The number of columns retrieved by the SELECT statement must\nmatch the number of output variables specified in the FETCH statement.\n\nIf no more rows are available, a No Data condition occurs with SQLSTATE\nvalue \'02000\'. To detect this condition, you can set up a handler for\nit (or for a NOT FOUND condition). For an example, see\nhttps://mariadb.com/kb/en/cursor-overview/.\n\nURL: https://mariadb.com/kb/en/fetch/\n\n', '', 'https://mariadb.com/kb/en/fetch/'),
(384, 'AVG', 16, 'Syntax:\nAVG([DISTINCT] expr)\n\nReturns the average value of expr. The DISTINCT option can be used to\nreturn the average of the distinct values of expr.\n\nAVG() returns NULL if there were no matching rows.\n\nURL: https://mariadb.com/kb/en/avg/\n\n', 'MariaDB> SELECT student_name, AVG(test_score)\n    ->        FROM student\n    ->        GROUP BY student_name;\n', 'https://mariadb.com/kb/en/avg/'),
(385, 'TRUE FALSE', 29, 'The constants TRUE and FALSE evaluate to 1 and 0, respectively. The\nconstant names can be written in any lettercase.\n\nMariaDB> SELECT TRUE, true, FALSE, false;\n        -> 1, 1, 0, 0\n\nURL: https://mariadb.com/kb/en/true-false/\n\n', '', 'https://mariadb.com/kb/en/true-false/'),
(386, 'MBRWITHIN', 6, 'MBRWithin(g1,g2)\n\nReturns 1 or 0 to indicate whether the Minimum Bounding Rectangle of g1\nis within the Minimum Bounding Rectangle of g2. This tests the opposite\nrelationship as MBRContains().\n\nURL: https://mariadb.com/kb/en/mbrwithin/\n\n', 'MariaDB> SET @g1 = GeomFromText(\'Polygon((0 0,0 3,3 3,3 0,0 0))\');\nMariaDB> SET @g2 = GeomFromText(\'Polygon((0 0,0 5,5 5,5 0,0 0))\');\nMariaDB> SELECT MBRWithin(@g1,@g2), MBRWithin(@g2,@g1);\n+--------------------+--------------------+\n| MBRWithin(@g1,@g2) | MBRWithin(@g2,@g1) |\n+--------------------+--------------------+\n|                  1 |                  0 |\n+--------------------+--------------------+\n', 'https://mariadb.com/kb/en/mbrwithin/'),
(387, 'SESSION_USER', 17, 'Syntax:\nSESSION_USER()\n\nSESSION_USER() is a synonym for USER().\n\nURL: https://mariadb.com/kb/en/session_user/\n\n', '', 'https://mariadb.com/kb/en/session_user/'),
(388, 'IN', 18, 'Syntax:\nexpr IN (value,...)\n\nReturns 1 if expr is equal to any of the values in the IN list, else\nreturns 0. If all values are constants, they are evaluated according to\nthe type of expr and sorted. The search for the item then is done using\na binary search. This means IN is very quick if the IN value list\nconsists entirely of constants. Otherwise, type conversion takes place\naccording to the rules described in\nhttps://mariadb.com/kb/en/type-conversion/, but\napplied to all the arguments.\n\nURL: https://mariadb.com/kb/en/in/\n\n', 'MariaDB> SELECT 2 IN (0,3,5,7);\n        -> 0\nMariaDB> SELECT \'wefwf\' IN (\'wee\',\'wefwf\',\'weg\');\n        -> 1\n', 'https://mariadb.com/kb/en/in/'),
(389, 'QUOTE', 37, 'Syntax:\nQUOTE(str)\n\nQuotes a string to produce a result that can be used as a properly\nescaped data value in an SQL statement. The string is returned enclosed\nby single quotation marks and with each instance of backslash (\"\\\"),\nsingle quote (\"\'\"), ASCII NUL, and Control+Z preceded by a backslash.\nIf the argument is NULL, the return value is the word \"NULL\" without\nenclosing single quotation marks.\n\nURL: https://mariadb.com/kb/en/quote/\n\n', 'MariaDB> SELECT QUOTE(\'Don\\\'t!\');\n        -> \'Don\\\'t!\'\nMariaDB> SELECT QUOTE(NULL);\n        -> NULL\n', 'https://mariadb.com/kb/en/quote/'),
(390, 'HELP COMMAND', 26, 'Syntax:\nMariaDB> help search_string\n\nIf you provide an argument to the help command, mysql uses it as a\nsearch string to access server-side help from the contents of the MySQL\nReference Manual. The proper operation of this command requires that\nthe help tables in the mysql database be initialized with help topic\ninformation .\n\nIf there is no match for the search string, the search fails:\n\nMariaDB> help me\n\nNothing found\nPlease try to run \'help contents\' for a list of all accessible topics\n\nUse help contents to see a list of the help categories:\n\nMariaDB> help contents\nYou asked for help about help category: \"Contents\"\nFor more information, type \'help <item>\', where <item> is one of the\nfollowing categories:\n   Account Management\n   Administration\n   Data Definition\n   Data Manipulation\n   Data Types\n   Functions\n   Functions and Modifiers for Use with GROUP BY\n   Geographic Features\n   Language Structure\n   Plugins\n   Storage Engines\n   Stored Routines\n   Table Maintenance\n   Transactions\n   Triggers\n\nIf the search string matches multiple items, mysql shows a list of\nmatching topics:\n\nMariaDB> help logs\nMany help items for your request exist.\nTo make a more specific request, please type \'help <item>\',\nwhere <item> is one of the following topics:\n   SHOW\n   SHOW BINARY LOGS\n   SHOW ENGINE\n   SHOW LOGS\n\nUse a topic as the search string to see the help entry for that topic:\n\nMariaDB> help show binary logs\nName: \'SHOW BINARY LOGS\'\nDescription:\nSyntax:\nSHOW BINARY LOGS\nSHOW MASTER LOGS\n\nLists the binary log files on the server. This statement is used as\npart of the procedure described in [purge-binary-logs], that shows how\nto determine which logs can be purged.\n\nMariaDB> SHOW BINARY LOGS;\n+---------------+-----------+\n| Log_name      | File_size |\n+---------------+-----------+\n| binlog.000015 |    724935 |\n| binlog.000016 |    733481 |\n+---------------+-----------+\n\nURL: https://mariadb.com/kb/en/help-command/\n\n', '', 'https://mariadb.com/kb/en/help-command/'),
(391, 'QUARTER', 31, 'Syntax:\nQUARTER(date)\n\nReturns the quarter of the year for date, in the range 1 to 4.\n\nURL: https://mariadb.com/kb/en/quarter/\n\n', 'MariaDB> SELECT QUARTER(\'2008-04-01\');\n        -> 2\n', 'https://mariadb.com/kb/en/quarter/'),
(392, 'POSITION', 37, 'Syntax:\nPOSITION(substr IN str)\n\nPOSITION(substr IN str) is a synonym for LOCATE(substr,str).\n\nURL: https://mariadb.com/kb/en/position/\n\n', '', 'https://mariadb.com/kb/en/position/'),
(393, 'SHOW CREATE FUNCTION', 26, 'Syntax:\nSHOW CREATE FUNCTION func_name\n\nThis statement is similar to SHOW CREATE PROCEDURE but for stored\nfunctions. See [HELP SHOW CREATE PROCEDURE].\n\nURL: https://mariadb.com/kb/en/show-create-function/\n\n', '', 'https://mariadb.com/kb/en/show-create-function/'),
(394, 'IS_USED_LOCK', 14, 'Syntax:\nIS_USED_LOCK(str)\n\nChecks whether the lock named str is in use (that is, locked). If so,\nit returns the connection identifier of the client that holds the lock.\nOtherwise, it returns NULL.\n\nURL: https://mariadb.com/kb/en/is_used_lock/\n\n', '', 'https://mariadb.com/kb/en/is_used_lock/'),
(395, 'POLYFROMTEXT', 3, 'PolyFromText(wkt[,srid]), PolygonFromText(wkt[,srid])\n\nConstructs a POLYGON value using its WKT representation and SRID.\n\nURL: https://mariadb.com/kb/en/polyfromtext/\n\n', '', 'https://mariadb.com/kb/en/polyfromtext/'),
(396, 'DES_ENCRYPT', 12, 'Syntax:\nDES_ENCRYPT(str[,{key_num|key_str}])\n\nEncrypts the string with the given key using the Triple-DES algorithm.\n\nThis function works only if MySQL has been configured with SSL support.\nSee https://mariadb.com/kb/en/ssl-connections/.\n\nThe encryption key to use is chosen based on the second argument to\nDES_ENCRYPT(), if one was given. With no argument, the first key from\nthe DES key file is used. With a key_num argument, the given key number\n(0 to 9) from the DES key file is used. With a key_str argument, the\ngiven key string is used to encrypt str.\n\nThe key file can be specified with the --des-key-file server option.\n\nThe return string is a binary string where the first character is\nCHAR(128 | key_num). If an error occurs, DES_ENCRYPT() returns NULL.\n\nThe 128 is added to make it easier to recognize an encrypted key. If\nyou use a string key, key_num is 127.\n\nThe string length for the result is given by this formula:\n\nnew_len = orig_len + (8 - (orig_len % 8)) + 1\n\nEach line in the DES key file has the following format:\n\nkey_num des_key_str\n\nEach key_num value must be a number in the range from 0 to 9. Lines in\nthe file may be in any order. des_key_str is the string that is used to\nencrypt the message. There should be at least one space between the\nnumber and the key. The first key is the default key that is used if\nyou do not specify any key argument to DES_ENCRYPT().\n\nYou can tell MySQL to read new key values from the key file with the\nFLUSH DES_KEY_FILE statement. This requires the RELOAD privilege.\n\nOne benefit of having a set of default keys is that it gives\napplications a way to check for the existence of encrypted column\nvalues, without giving the end user the right to decrypt those values.\n\nURL: https://mariadb.com/kb/en/des_encrypt/\n\n', 'MariaDB> SELECT customer_address FROM customer_table \n     > WHERE crypted_credit_card = DES_ENCRYPT(\'credit_card_number\');\n', 'https://mariadb.com/kb/en/des_encrypt/'),
(397, 'CEIL', 4, 'Syntax:\nCEIL(X)\n\nCEIL() is a synonym for CEILING().\n\nURL: https://mariadb.com/kb/en/ceil/\n\n', '', 'https://mariadb.com/kb/en/ceil/'),
(398, 'LENGTH', 37, 'Syntax:\nLENGTH(str)\n\nReturns the length of the string str, measured in bytes. A multi-byte\ncharacter counts as multiple bytes. This means that for a string\ncontaining five 2-byte characters, LENGTH() returns 10, whereas\nCHAR_LENGTH() returns 5.\n\nURL: https://mariadb.com/kb/en/length/\n\n', 'MariaDB> SELECT LENGTH(\'text\');\n        -> 4\n', 'https://mariadb.com/kb/en/length/'),
(399, 'STR_TO_DATE', 31, 'Syntax:\nSTR_TO_DATE(str,format)\n\nThis is the inverse of the DATE_FORMAT() function. It takes a string\nstr and a format string format. STR_TO_DATE() returns a DATETIME value\nif the format string contains both date and time parts, or a DATE or\nTIME value if the string contains only date or time parts. If the date,\ntime, or datetime value extracted from str is illegal, STR_TO_DATE()\nreturns NULL and produces a warning.\n\nThe server scans str attempting to match format to it. The format\nstring can contain literal characters and format specifiers beginning\nwith %. Literal characters in format must match literally in str.\nFormat specifiers in format must match a date or time part in str. For\nthe specifiers that can be used in format, see the DATE_FORMAT()\nfunction description.\n\nMariaDB> SELECT STR_TO_DATE(\'01,5,2013\',\'%d,%m,%Y\');\n        -> \'2013-05-01\'\nMariaDB> SELECT STR_TO_DATE(\'May 1, 2013\',\'%M %d,%Y\');\n        -> \'2013-05-01\'\n\nScanning starts at the beginning of str and fails if format is found\nnot to match. Extra characters at the end of str are ignored.\n\nMariaDB> SELECT STR_TO_DATE(\'a09:30:17\',\'a%h:%i:%s\');\n        -> \'09:30:17\'\nMariaDB> SELECT STR_TO_DATE(\'a09:30:17\',\'%h:%i:%s\');\n        -> NULL\nMariaDB> SELECT STR_TO_DATE(\'09:30:17a\',\'%h:%i:%s\');\n        -> \'09:30:17\'\n\nUnspecified date or time parts have a value of 0, so incompletely\nspecified values in str produce a result with some or all parts set to\n0:\n\nMariaDB> SELECT STR_TO_DATE(\'abc\',\'abc\');\n        -> \'0000-00-00\'\nMariaDB> SELECT STR_TO_DATE(\'9\',\'%m\');\n        -> \'0000-09-00\'\nMariaDB> SELECT STR_TO_DATE(\'9\',\'%s\');\n        -> \'00:00:09\'\n\nURL: https://mariadb.com/kb/en/str_to_date/\n\n', '', 'https://mariadb.com/kb/en/str_to_date/'),
(400, 'Y', 11, 'Y(p)\n\nReturns the Y-coordinate value for the Point object p as a\ndouble-precision number.\n\nURL: https://mariadb.com/kb/en/y/\n\n', 'MariaDB> SELECT Y(POINT(56.7, 53.34));\n+-----------------------+\n| Y(POINT(56.7, 53.34)) |\n+-----------------------+\n|                 53.34 |\n+-----------------------+\n', 'https://mariadb.com/kb/en/y/'),
(401, 'CHECKSUM TABLE', 20, 'Syntax:\nCHECKSUM TABLE tbl_name [, tbl_name] ... [ QUICK | EXTENDED ]\n\nCHECKSUM TABLE reports a table checksum. This statement requires the\nSELECT privilege for the table.\n\nWith QUICK, the live table checksum is reported if it is available, or\nNULL otherwise. This is very fast. A live checksum is enabled by\nspecifying the CHECKSUM=1 table option when you create the table;\ncurrently, this is supported only for MyISAM tables. See [HELP CREATE\nTABLE].\n\nWith EXTENDED, the entire table is read row by row and the checksum is\ncalculated. This can be very slow for large tables.\n\nIf neither QUICK nor EXTENDED is specified, MySQL returns a live\nchecksum if the table storage engine supports it and scans the table\notherwise.\n\nFor a nonexistent table, CHECKSUM TABLE returns NULL and generates a\nwarning.\n\nIn MySQL 5.5, CHECKSUM TABLE returns 0 for partitioned tables unless\nyou include the EXTENDED option. This issue is resolved in MySQL 5.6.\n(Bug #11933226, Bug #60681)\n\nThe checksum value depends on the table row format. If the row format\nchanges, the checksum also changes. For example, the storage format for\nVARCHAR changed between MySQL 4.1 and 5.0, so if a 4.1 table is\nupgraded to MySQL 5.0, the checksum value may change.\n\nURL: https://mariadb.com/kb/en/checksum-table/\n\n', '', 'https://mariadb.com/kb/en/checksum-table/'),
(402, 'NUMINTERIORRINGS', 2, 'NumInteriorRings(poly)\n\nReturns the number of interior rings in the Polygon value poly.\n\nURL: https://mariadb.com/kb/en/numinteriorrings/\n\n', 'MariaDB> SET @poly =\n    -> \'Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))\';\nMariaDB> SELECT NumInteriorRings(GeomFromText(@poly));\n+---------------------------------------+\n| NumInteriorRings(GeomFromText(@poly)) |\n+---------------------------------------+\n|                                     1 |\n+---------------------------------------+\n', 'https://mariadb.com/kb/en/numinteriorrings/'),
(403, 'INTERIORRINGN', 2, 'InteriorRingN(poly,N)\n\nReturns the N-th interior ring for the Polygon value poly as a\nLineString. Rings are numbered beginning with 1.\n\nURL: https://mariadb.com/kb/en/interiorringn/\n\n', 'MariaDB> SET @poly =\n    -> \'Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))\';\nMariaDB> SELECT AsText(InteriorRingN(GeomFromText(@poly),1));\n+----------------------------------------------+\n| AsText(InteriorRingN(GeomFromText(@poly),1)) |\n+----------------------------------------------+\n| LINESTRING(1 1,1 2,2 2,2 1,1 1)              |\n+----------------------------------------------+\n', 'https://mariadb.com/kb/en/interiorringn/'),
(404, 'UTC_TIME', 31, 'Syntax:\nUTC_TIME, UTC_TIME()\n\nReturns the current UTC time as a value in \'HH:MM:SS\' or HHMMSS.uuuuuu\nformat, depending on whether the function is used in a string or\nnumeric context.\n\nURL: https://mariadb.com/kb/en/utc_time/\n\n', 'MariaDB> SELECT UTC_TIME(), UTC_TIME() + 0;\n        -> \'18:07:53\', 180753.000000\n', 'https://mariadb.com/kb/en/utc_time/'),
(405, 'DROP FUNCTION', 39, 'The DROP FUNCTION statement is used to drop stored functions and\nuser-defined functions (UDFs):\n\no For information about dropping stored functions, see [HELP DROP\n  PROCEDURE].\n\no For information about dropping user-defined functions, see [HELP DROP\n  FUNCTION UDF].\n\nURL: https://mariadb.com/kb/en/drop-function/\n\n', '', 'https://mariadb.com/kb/en/drop-function/'),
(406, 'ALTER EVENT', 39, 'Syntax:\nALTER\n    [DEFINER = { user | CURRENT_USER }]\n    EVENT event_name\n    [ON SCHEDULE schedule]\n    [ON COMPLETION [NOT] PRESERVE]\n    [RENAME TO new_event_name]\n    [ENABLE | DISABLE | DISABLE ON SLAVE]\n    [COMMENT \'comment\']\n    [DO event_body]\n\nThe ALTER EVENT statement changes one or more of the characteristics of\nan existing event without the need to drop and recreate it. The syntax\nfor each of the DEFINER, ON SCHEDULE, ON COMPLETION, COMMENT, ENABLE /\nDISABLE, and DO clauses is exactly the same as when used with CREATE\nEVENT. (See [HELP CREATE EVENT].)\n\nAny user can alter an event defined on a database for which that user\nhas the EVENT privilege. When a user executes a successful ALTER EVENT\nstatement, that user becomes the definer for the affected event.\n\nALTER EVENT works only with an existing event:\n\nMariaDB> ALTER EVENT no_such_event \n     >     ON SCHEDULE \n     >       EVERY \'2:3\' DAY_HOUR;\nERROR 1517 (HY000): Unknown event \'no_such_event\'\n\nURL: https://mariadb.com/kb/en/alter-event/\n\n', '', 'https://mariadb.com/kb/en/alter-event/'),
(407, 'STDDEV', 16, 'Syntax:\nSTDDEV(expr)\n\nReturns the population standard deviation of expr. This function is\nprovided for compatibility with Oracle. The standard SQL function\nSTDDEV_POP() can be used instead.\n\nThis function returns NULL if there were no matching rows.\n\nURL: https://mariadb.com/kb/en/stddev/\n\n', '', 'https://mariadb.com/kb/en/stddev/'),
(408, 'DATE_SUB', 31, 'Syntax:\nDATE_SUB(date,INTERVAL expr unit)\n\nSee the description for DATE_ADD().\n\nURL: https://mariadb.com/kb/en/date_sub/\n\n', '', 'https://mariadb.com/kb/en/date_sub/'),
(409, 'PERIOD_ADD', 31, 'Syntax:\nPERIOD_ADD(P,N)\n\nAdds N months to period P (in the format YYMM or YYYYMM). Returns a\nvalue in the format YYYYMM. Note that the period argument P is not a\ndate value.\n\nURL: https://mariadb.com/kb/en/period_add/\n\n', 'MariaDB> SELECT PERIOD_ADD(200801,2);\n        -> 200803\n', 'https://mariadb.com/kb/en/period_add/'),
(410, '|', 19, 'Syntax:\n|\n\nBitwise OR:\n\nURL: https://mariadb.com/kb/en/bitwise-or/\n\n', 'MariaDB> SELECT 29 | 15;\n        -> 31\n', 'https://mariadb.com/kb/en/bitwise-or/'),
(411, 'GEOMFROMTEXT', 3, 'GeomFromText(wkt[,srid]), GeometryFromText(wkt[,srid])\n\nConstructs a geometry value of any type using its WKT representation\nand SRID.\n\nURL: https://mariadb.com/kb/en/geomfromtext/\n\n', '', 'https://mariadb.com/kb/en/geomfromtext/'),
(412, 'UUID_SHORT', 14, 'Syntax:\nUUID_SHORT()\n\nReturns a \"short\" universal identifier as a 64-bit unsigned integer\n(rather than a string-form 128-bit identifier as returned by the UUID()\nfunction).\n\nThe value of UUID_SHORT() is guaranteed to be unique if the following\nconditions hold:\n\no The server_id of the current host is unique among your set of master\n  and slave servers\n\no server_id is between 0 and 255\n\no You do not set back your system time for your server between mysqld\n  restarts\n\no You do not invoke UUID_SHORT() on average more than 16 million times\n  per second between mysqld restarts\n\nThe UUID_SHORT() return value is constructed this way:\n\n  (server_id & 255) << 56\n+ (server_startup_time_in_seconds << 24)\n+ incremented_variable++;\n\nURL: https://mariadb.com/kb/en/uuid_short/\n\n', 'MariaDB> SELECT UUID_SHORT();\n        -> 92395783831158784\n', 'https://mariadb.com/kb/en/uuid_short/'),
(413, 'RIGHT', 37, 'Syntax:\nRIGHT(str,len)\n\nReturns the rightmost len characters from the string str, or NULL if\nany argument is NULL.\n\nURL: https://mariadb.com/kb/en/right/\n\n', 'MariaDB> SELECT RIGHT(\'foobarbar\', 4);\n        -> \'rbar\'\n', 'https://mariadb.com/kb/en/right/'),
(414, 'DATEDIFF', 31, 'Syntax:\nDATEDIFF(expr1,expr2)\n\nDATEDIFF() returns expr1 - expr2 expressed as a value in days from one\ndate to the other. expr1 and expr2 are date or date-and-time\nexpressions. Only the date parts of the values are used in the\ncalculation.\n\nURL: https://mariadb.com/kb/en/datediff/\n\n', 'MariaDB> SELECT DATEDIFF(\'2007-12-31 23:59:59\',\'2007-12-30\');\n        -> 1\nMariaDB> SELECT DATEDIFF(\'2010-11-30 23:59:59\',\'2010-12-31\');\n        -> -31\n', 'https://mariadb.com/kb/en/datediff/'),
(415, 'DROP TABLESPACE', 39, 'Syntax:\nDROP TABLESPACE tablespace_name\n    ENGINE [=] engine_name\n\nThis statement is used with NDB cluster, which is not supported by MariaDB.\n\nURL: https://mariadb.com/kb/en/drop-tablespace/\n\n', '', 'https://mariadb.com/kb/en/drop-tablespace/'),
(416, 'DROP PROCEDURE', 39, 'Syntax:\nDROP {PROCEDURE | FUNCTION} [IF EXISTS] sp_name\n\nThis statement is used to drop a stored procedure or function. That is,\nthe specified routine is removed from the server. You must have the\nALTER ROUTINE privilege for the routine. (If the\nautomatic_sp_privileges system variable is enabled, that privilege and\nEXECUTE are granted automatically to the routine creator when the\nroutine is created and dropped from the creator when the routine is\ndropped. See\nhttps://mariadb.com/kb/en/stored-routine-privileges/.\n)\n\nThe IF EXISTS clause is a MySQL extension. It prevents an error from\noccurring if the procedure or function does not exist. A warning is\nproduced that can be viewed with SHOW WARNINGS.\n\nURL: https://mariadb.com/kb/en/drop-procedure/\n\n', '', 'https://mariadb.com/kb/en/drop-procedure/'),
(417, 'CHECK TABLE', 20, 'Syntax:\nCHECK TABLE tbl_name [, tbl_name] ... [option] ...\n\noption = {FOR UPGRADE | QUICK | FAST | MEDIUM | EXTENDED | CHANGED}\n\nCHECK TABLE checks a table or tables for errors. CHECK TABLE works for\nInnoDB, MyISAM, ARCHIVE, and CSV tables. For MyISAM tables, the key\nstatistics are updated as well.\n\nTo check a table, you must have some privilege for it.\n\nCHECK TABLE can also check views for problems, such as tables that are\nreferenced in the view definition that no longer exist.\n\nCHECK TABLE is supported for partitioned tables, and you can use ALTER\nTABLE ... CHECK PARTITION to check one or more partitions; for more\ninformation, see [HELP ALTER TABLE].\n\nURL: https://mariadb.com/kb/en/sql-commands-check-table/\n\n', '', 'https://mariadb.com/kb/en/sql-commands-check-table/'),
(418, 'BIN', 37, 'Syntax:\nBIN(N)\n\nReturns a string representation of the binary value of N, where N is a\nlonglong (BIGINT) number. This is equivalent to CONV(N,10,2). Returns\nNULL if N is NULL.\n\nURL: https://mariadb.com/kb/en/bin/\n\n', 'MariaDB> SELECT BIN(12);\n        -> \'1100\'\n', 'https://mariadb.com/kb/en/bin/'),
(419, 'INSTALL PLUGIN', 5, 'Syntax:\nINSTALL PLUGIN plugin_name SONAME \'shared_library_name\'\n\nThis statement installs a server plugin. It requires the INSERT\nprivilege for the mysql.plugin table.\n\nplugin_name is the name of the plugin as defined in the plugin\ndescriptor structure contained in the library file (see\nhttp://dev.mysql.com/doc/refman/5.5/en/plugin-data-structures.html).\nPlugin names are not case sensitive. For maximal compatibility, plugin\nnames should be limited to ASCII letters, digits, and underscore\nbecause they are used in C source files, shell command lines, M4 and\nBourne shell scripts, and SQL environments.\n\nshared_library_name is the name of the shared library that contains the\nplugin code. The name includes the file name extension (for example,\nlibmyplugin.so, libmyplugin.dll, or libmyplugin.dylib).\n\nThe shared library must be located in the plugin directory (the\ndirectory named by the plugin_dir system variable). The library must be\nin the plugin directory itself, not in a subdirectory. By default,\nplugin_dir is the plugin directory under the directory named by the\npkglibdir configuration variable, but it can be changed by setting the\nvalue of plugin_dir at server startup. For example, set its value in a\nmy.cnf file:\n\n[mysqld]\nplugin_dir=/path/to/plugin/directory\n\nIf the value of plugin_dir is a relative path name, it is taken to be\nrelative to the MySQL base directory (the value of the basedir system\nvariable).\n\nINSTALL PLUGIN loads and initializes the plugin code to make the plugin\navailable for use. A plugin is initialized by executing its\ninitialization function, which handles any setup that the plugin must\nperform before it can be used. When the server shuts down, it executes\nthe deinitialization function for each plugin that is loaded so that\nthe plugin has a change to perform any final cleanup.\n\nINSTALL PLUGIN also registers the plugin by adding a line that\nindicates the plugin name and library file name to the mysql.plugin\ntable. At server startup, the server loads and initializes any plugin\nthat is listed in the mysql.plugin table. This means that a plugin is\ninstalled with INSTALL PLUGIN only once, not every time the server\nstarts. Plugin loading at startup does not occur if the server is\nstarted with the --skip-grant-tables option.\n\nA plugin library can contain multiple plugins. For each of them to be\ninstalled, use a separate INSTALL PLUGIN statement. Each statement\nnames a different plugin, but all of them specify the same library\nname.\n\nURL: https://mariadb.com/kb/en/install-plugin/\n\n', '', 'https://mariadb.com/kb/en/install-plugin/'),
(420, 'DECLARE CURSOR', 23, 'Syntax:\nDECLARE cursor_name CURSOR FOR select_statement\n\nThis statement declares a cursor and associates it with a SELECT\nstatement that retrieves the rows to be traversed by the cursor. To\nfetch the rows later, use a FETCH statement. The number of columns\nretrieved by the SELECT statement must match the number of output\nvariables specified in the FETCH statement.\n\nThe SELECT statement cannot have an INTO clause.\n\nCursor declarations must appear before handler declarations and after\nvariable and condition declarations.\n\nA stored program may contain multiple cursor declarations, but each\ncursor declared in a given block must have a unique name. For an\nexample, see https://mariadb.com/kb/en/programmatic-and-compound-statements-cursors/.\n\nFor information available through SHOW statements, it is possible in\nmany cases to obtain equivalent information by using a cursor with an\nINFORMATION_SCHEMA table.\n\nURL: https://mariadb.com/kb/en/declare-cursor/\n\n', '', 'https://mariadb.com/kb/en/declare-cursor/'),
(421, 'LOAD DATA', 27, 'Syntax:\nLOAD DATA [LOW_PRIORITY | CONCURRENT] [LOCAL] INFILE \'file_name\'\n    [REPLACE | IGNORE]\n    INTO TABLE tbl_name\n    [CHARACTER SET charset_name]\n    [{FIELDS | COLUMNS}\n        [TERMINATED BY \'string\']\n        [[OPTIONALLY] ENCLOSED BY \'char\']\n        [ESCAPED BY \'char\']\n    ]\n    [LINES\n        [STARTING BY \'string\']\n        [TERMINATED BY \'string\']\n    ]\n    [IGNORE number {LINES | ROWS}]\n    [(col_name_or_user_var,...)]\n    [SET col_name = expr,...]\n\nThe LOAD DATA INFILE statement reads rows from a text file into a table\nat a very high speed. The file name must be given as a literal string.\n\nLOAD DATA INFILE is the complement of SELECT ... INTO OUTFILE. (See\nhttps://mariadb.com/kb/en/select-into/.) To write data\nfrom a table to a file, use SELECT ... INTO OUTFILE. To read the file\nback into a table, use LOAD DATA INFILE. The syntax of the FIELDS and\nLINES clauses is the same for both statements. Both clauses are\noptional, but FIELDS must precede LINES if both are specified.\n\nFor more information about the efficiency of INSERT versus LOAD DATA\nINFILE and speeding up LOAD DATA INFILE, see\nhttp://dev.mysql.com/doc/refman/5.5/en/insert-speed.html.\n\nThe character set indicated by the character_set_database system\nvariable is used to interpret the information in the file. SET NAMES\nand the setting of character_set_client do not affect interpretation of\ninput. If the contents of the input file use a character set that\ndiffers from the default, it is usually preferable to specify the\ncharacter set of the file by using the CHARACTER SET clause. A\ncharacter set of binary specifies \"no conversion.\"\n\nLOAD DATA INFILE interprets all fields in the file as having the same\ncharacter set, regardless of the data types of the columns into which\nfield values are loaded. For proper interpretation of file contents,\nyou must ensure that it was written with the correct character set. For\nexample, if you write a data file with mysqldump -T or by issuing a\nSELECT ... INTO OUTFILE statement in mysql, be sure to use a\n--default-character-set option with mysqldump or mysql so that output\nis written in the character set to be used when the file is loaded with\nLOAD DATA INFILE.\n\n*Note*: It is not possible to load data files that use the ucs2, utf16,\nor utf32 character set.\n\nThe character_set_filesystem system variable controls the\ninterpretation of the file name.\n\nYou can also load data files by using the mysqlimport utility; it\noperates by sending a LOAD DATA INFILE statement to the server. The\n--local option causes mysqlimport to read data files from the client\nhost. You can specify the --compress option to get better performance\nover slow networks if the client and server support the compressed\nprotocol. See https://mariadb.com/kb/en/mysqlimport/.\n\nIf you use LOW_PRIORITY, execution of the LOAD DATA statement is\ndelayed until no other clients are reading from the table. This affects\nonly storage engines that use only table-level locking (such as MyISAM,\nMEMORY, and MERGE).\n\nIf you specify CONCURRENT with a MyISAM table that satisfies the\ncondition for concurrent inserts (that is, it contains no free blocks\nin the middle), other threads can retrieve data from the table while\nLOAD DATA is executing. Using this option affects the performance of\nLOAD DATA a bit, even if no other thread is using the table at the same\ntime.\n\nPrior to MySQL 5.5.1, CONCURRENT was not replicated when using\nstatement-based replication (see Bug #34628). However, it is replicated\nwhen using row-based replication, regardless of the version. See\nhttp://dev.mysql.com/doc/refman/5.5/en/replication-features-load-data.h\ntml, for more information.\n\nThe LOCAL keyword, if specified, is interpreted with respect to the\nclient end of the connection:\n\no If LOCAL is specified, the file is read by the client program on the\n  client host and sent to the server. The file can be given as a full\n  path name to specify its exact location. If given as a relative path\n  name, the name is interpreted relative to the directory in which the\n  client program was started.\n\n  When using LOCAL with LOAD DATA, a copy of the file is created in the\n  server\'s temporary directory. This is not the directory determined by\n  the value of tmpdir or slave_load_tmpdir, but rather the operating\n  system\'s temporary directory, and is not configurable in the MySQL\n  Server. (Typically the system temporary directory is /tmp on Linux\n  systems and C:\\WINDOWS\\TEMP on Windows.) Lack of sufficient space for\n  the copy in this directory can cause the LOAD DATA LOCAL statement to\n  fail.\n\no If LOCAL is not specified, the file must be located on the server\n  host and is read directly by the server. The server uses the\n  following rules to locate the file:\n\n  o If the file name is an absolute path name, the server uses it as\n    given.\n\n  o If the file name is a relative path name with one or more leading\n    components, the server searches for the file relative to the\n    server\'s data directory.\n\n  o If a file name with no leading components is given, the server\n    looks for the file in the database directory of the default\n    database.\n\nNote that, in the non-LOCAL case, these rules mean that a file named as\n./myfile.txt is read from the server\'s data directory, whereas the file\nnamed as myfile.txt is read from the database directory of the default\ndatabase. For example, if db1 is the default database, the following\nLOAD DATA statement reads the file data.txt from the database directory\nfor db1, even though the statement explicitly loads the file into a\ntable in the db2 database:\n\nLOAD DATA INFILE \'data.txt\' INTO TABLE db2.my_table;\n\nWindows path names are specified using forward slashes rather than\nbackslashes. If you do use backslashes, you must double them.\n\nFor security reasons, when reading text files located on the server,\nthe files must either reside in the database directory or be readable\nby all. Also, to use LOAD DATA INFILE on server files, you must have\nthe FILE privilege. See\nhttps://mariadb.com/kb/en/grant/. For\nnon-LOCAL load operations, if the secure_file_priv system variable is\nset to a nonempty directory name, the file to be loaded must be located\nin that directory.\n\nURL: https://mariadb.com/kb/en/load-data-infile/\n\n', '', 'https://mariadb.com/kb/en/load-data-infile/'),
(422, 'MULTILINESTRING', 24, 'MultiLineString(ls1,ls2,...)\n\nConstructs a MultiLineString value using LineString or WKB LineString\narguments.\n\nURL: https://mariadb.com/kb/en/multilinestring/\n\n', '', 'https://mariadb.com/kb/en/multilinestring/'),
(423, 'LOCALTIME', 31, 'Syntax:\nLOCALTIME, LOCALTIME()\n\nLOCALTIME and LOCALTIME() are synonyms for NOW().\n\nURL: https://mariadb.com/kb/en/localtime/\n\n', '', 'https://mariadb.com/kb/en/localtime/'),
(424, 'SHOW RELAYLOG EVENTS', 26, 'Syntax:\nSHOW RELAYLOG EVENTS\n   [IN \'log_name\'] [FROM pos] [LIMIT [offset,] row_count]\n\nShows the events in the relay log of a replication slave. If you do not\nspecify \'log_name\', the first relay log is displayed. This statement\nhas no effect on the master.\n\nURL: https://mariadb.com/kb/en/show-relaylog-events/\n\n', '', 'https://mariadb.com/kb/en/show-relaylog-events/'),
(425, 'MPOINTFROMTEXT', 3, 'MPointFromText(wkt[,srid]), MultiPointFromText(wkt[,srid])\n\nConstructs a MULTIPOINT value using its WKT representation and SRID.\n\nURL: https://mariadb.com/kb/en/mpointfromtext/\n\n', '', 'https://mariadb.com/kb/en/mpointfromtext/'),
(426, 'BLOB', 22, 'BLOB[(M)]\n\nA BLOB column with a maximum length of 65,535 (216 - 1) bytes. Each\nBLOB value is stored using a 2-byte length prefix that indicates the\nnumber of bytes in the value.\n\nAn optional length M can be given for this type. If this is done, MySQL\ncreates the column as the smallest BLOB type large enough to hold\nvalues M bytes long.\n\nURL: https://mariadb.com/kb/en/blob/\n\n', '', 'https://mariadb.com/kb/en/blob/'),
(427, 'SHA1', 12, 'Syntax:\nSHA1(str), SHA(str)\n\nCalculates an SHA-1 160-bit checksum for the string, as described in\nRFC 3174 (Secure Hash Algorithm). The value is returned as a string of\n40 hex digits, or NULL if the argument was NULL. One of the possible\nuses for this function is as a hash key. See the notes at the beginning\nof this section about storing hash values efficiently. You can also use\nSHA1() as a cryptographic function for storing passwords. SHA() is\nsynonymous with SHA1().\n\nAs of MySQL 5.5.3, the return value is a nonbinary string in the\nconnection character set. Before 5.5.3, the return value is a binary\nstring; see the notes at the beginning of this section about using the\nvalue as a nonbinary string.\n\nURL: https://mariadb.com/kb/en/sha1/\n\n', 'MariaDB> SELECT SHA1(\'abc\');\n        -> \'a9993e364706816aba3e25717850c26c9cd0d89d\'\n', 'https://mariadb.com/kb/en/sha1/'),
(428, 'SUBSTR', 37, 'Syntax:\nSUBSTR(str,pos), SUBSTR(str FROM pos), SUBSTR(str,pos,len), SUBSTR(str\nFROM pos FOR len)\n\nSUBSTR() is a synonym for SUBSTRING().\n\nURL: https://mariadb.com/kb/en/substr/\n\n', '', 'https://mariadb.com/kb/en/substr/'),
(429, 'PASSWORD', 12, 'Syntax:\nPASSWORD(str)\n\nCalculates and returns a hashed password string from the plaintext\npassword str and returns a nonbinary string in the connection character\nset (a binary string before MySQL 5.5.3), or NULL if the argument is\nNULL. This function is the SQL interface to the algorithm used by the\nserver to encrypt MySQL passwords for storage in the mysql.user grant\ntable.\n\nThe password hashing method used by PASSWORD() depends on the value of\nthe old_passwords system variable:\n\nURL: https://mariadb.com/kb/en/password/\n\n', 'MariaDB> SET old_passwords = 0;\nMariaDB> SELECT PASSWORD(\'mypass\');\n+-------------------------------------------+\n| PASSWORD(\'mypass\')                        |\n+-------------------------------------------+\n| *6C8989366EAF75BB670AD8EA7A7FC1176A95CEF4 |\n+-------------------------------------------+\n\nMariaDB> SET old_passwords = 1;\nMariaDB> SELECT PASSWORD(\'mypass\');\n+--------------------+\n| PASSWORD(\'mypass\') |\n+--------------------+\n| 6f8c114b58f2ce9e   |\n+--------------------+\n', 'https://mariadb.com/kb/en/password/'),
(430, 'CHAR', 22, '[NATIONAL] CHAR[(M)] [CHARACTER SET charset_name] [COLLATE\ncollation_name]\n\nA fixed-length string that is always right-padded with spaces to the\nspecified length when stored. M represents the column length in\ncharacters. The range of M is 0 to 255. If M is omitted, the length is\n1.\n\n*Note*: Trailing spaces are removed when CHAR values are retrieved\nunless the PAD_CHAR_TO_FULL_LENGTH SQL mode is enabled.\n\nURL: https://mariadb.com/kb/en/char/\n\n', '', 'https://mariadb.com/kb/en/char/'),
(431, 'UTC_DATE', 31, 'Syntax:\nUTC_DATE, UTC_DATE()\n\nReturns the current UTC date as a value in \'YYYY-MM-DD\' or YYYYMMDD\nformat, depending on whether the function is used in a string or\nnumeric context.\n\nURL: https://mariadb.com/kb/en/utc_date/\n\n', 'MariaDB> SELECT UTC_DATE(), UTC_DATE() + 0;\n        -> \'2003-08-14\', 20030814\n', 'https://mariadb.com/kb/en/utc_date/'),
(432, 'DIMENSION', 36, 'Dimension(g)\n\nReturns the inherent dimension of the geometry value g. The result can\nbe -1, 0, 1, or 2. The meaning of these values is given in\nhttps://mariadb.com/kb/en/dimension/.\n\nURL: https://mariadb.com/kb/en/dimension/\n\n', 'MariaDB> SELECT Dimension(GeomFromText(\'LineString(1 1,2 2)\'));\n+------------------------------------------------+\n| Dimension(GeomFromText(\'LineString(1 1,2 2)\')) |\n+------------------------------------------------+\n|                                              1 |\n+------------------------------------------------+\n', 'https://mariadb.com/kb/en/dimension/'),
(433, 'COUNT DISTINCT', 16, 'Syntax:\nCOUNT(DISTINCT expr,[expr...])\n\nReturns a count of the number of rows with different non-NULL expr\nvalues.\n\nCOUNT(DISTINCT) returns 0 if there were no matching rows.\n\nURL: https://mariadb.com/kb/en/count-distinct/\n\n', 'MariaDB> SELECT COUNT(DISTINCT results) FROM student;\n', 'https://mariadb.com/kb/en/count-distinct/'),
(434, 'BIT', 22, 'BIT[(M)]\n\nA bit-field type. M indicates the number of bits per value, from 1 to\n64. The default is 1 if M is omitted.\n\nURL: https://mariadb.com/kb/en/bit/\n\n', '', 'https://mariadb.com/kb/en/bit/'),
(435, 'EQUALS', 30, 'Equals(g1,g2)\n\nReturns 1 or 0 to indicate whether g1 is spatially equal to g2.\n\nURL: https://mariadb.com/kb/en/equals/\n\n', '', 'https://mariadb.com/kb/en/equals/'),
(436, 'SHOW CREATE VIEW', 26, 'Syntax:\nSHOW CREATE VIEW view_name\n\nThis statement shows a CREATE VIEW statement that creates the given\nview.\n\nURL: https://mariadb.com/kb/en/show-create-view/\n\n', '', 'https://mariadb.com/kb/en/show-create-view/'),
(437, 'INTERVAL', 18, 'Syntax:\nINTERVAL(N,N1,N2,N3,...)\n\nReturns 0 if N < N1, 1 if N < N2 and so on or -1 if N is NULL. All\narguments are treated as integers. It is required that N1 < N2 < N3 <\n... < Nn for this function to work correctly. This is because a binary\nsearch is used (very fast).\n\nURL: https://mariadb.com/kb/en/interval/\n\n', 'MariaDB> SELECT INTERVAL(23, 1, 15, 17, 30, 44, 200);\n        -> 3\nMariaDB> SELECT INTERVAL(10, 1, 10, 100, 1000);\n        -> 2\nMariaDB> SELECT INTERVAL(22, 23, 30, 44, 200);\n        -> 0\n', 'https://mariadb.com/kb/en/interval/'),
(438, 'FROM_DAYS', 31, 'Syntax:\nFROM_DAYS(N)\n\nGiven a day number N, returns a DATE value.\n\nURL: https://mariadb.com/kb/en/from_days/\n\n', 'MariaDB> SELECT FROM_DAYS(730669);\n        -> \'2007-07-03\'\n', 'https://mariadb.com/kb/en/from_days/'),
(439, 'ALTER PROCEDURE', 39, 'Syntax:\nALTER PROCEDURE proc_name [characteristic ...]\n\ncharacteristic:\n    COMMENT \'string\'\n  | LANGUAGE SQL\n  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }\n  | SQL SECURITY { DEFINER | INVOKER }\n\nThis statement can be used to change the characteristics of a stored\nprocedure. More than one change may be specified in an ALTER PROCEDURE\nstatement. However, you cannot change the parameters or body of a\nstored procedure using this statement; to make such changes, you must\ndrop and re-create the procedure using DROP PROCEDURE and CREATE\nPROCEDURE.\n\nYou must have the ALTER ROUTINE privilege for the procedure. By\ndefault, that privilege is granted automatically to the procedure\ncreator. This behavior can be changed by disabling the\nautomatic_sp_privileges system variable. See\nhttps://mariadb.com/kb/en/stored-routine-privileges/.\n\nURL: https://mariadb.com/kb/en/alter-procedure/\n\n', '', 'https://mariadb.com/kb/en/alter-procedure/'),
(440, 'BIT_COUNT', 19, 'Syntax:\nBIT_COUNT(N)\n\nReturns the number of bits that are set in the argument N.\n\nURL: https://mariadb.com/kb/en/bit_count/\n\n', 'MariaDB> SELECT BIT_COUNT(29), BIT_COUNT(b\'101010\');\n        -> 4, 3\n', 'https://mariadb.com/kb/en/bit_count/');
INSERT INTO `help_topic` (`help_topic_id`, `name`, `help_category_id`, `description`, `example`, `url`) VALUES
(441, 'OCTET_LENGTH', 37, 'Syntax:\nOCTET_LENGTH(str)\n\nOCTET_LENGTH() is a synonym for LENGTH().\n\nURL: https://mariadb.com/kb/en/octet_length/\n\n', '', 'https://mariadb.com/kb/en/octet_length/'),
(442, 'UTC_TIMESTAMP', 31, 'Syntax:\nUTC_TIMESTAMP, UTC_TIMESTAMP()\n\nReturns the current UTC date and time as a value in \'YYYY-MM-DD\nHH:MM:SS\' or YYYYMMDDHHMMSS.uuuuuu format, depending on whether the\nfunction is used in a string or numeric context.\n\nURL: https://mariadb.com/kb/en/utc_timestamp/\n\n', 'MariaDB> SELECT UTC_TIMESTAMP(), UTC_TIMESTAMP() + 0;\n        -> \'2003-08-14 18:08:04\', 20030814180804.000000\n', 'https://mariadb.com/kb/en/utc_timestamp/'),
(443, 'AES_ENCRYPT', 12, 'Syntax:\nAES_ENCRYPT(str,key_str)\n\nAES_ENCRYPT() and AES_DECRYPT() enable encryption and decryption of\ndata using the official AES (Advanced Encryption Standard) algorithm,\npreviously known as \"Rijndael.\" Encoding with a 128-bit key length is\nused, but you can extend it up to 256 bits by modifying the source. We\nchose 128 bits because it is much faster and it is secure enough for\nmost purposes.\n\nAES_ENCRYPT() encrypts a string and returns a binary string.\nAES_DECRYPT() decrypts the encrypted string and returns the original\nstring. The input arguments may be any length. If either argument is\nNULL, the result of this function is also NULL.\n\nBecause AES is a block-level algorithm, padding is used to encode\nuneven length strings and so the result string length may be calculated\nusing this formula:\n\n16 * (trunc(string_length / 16) + 1)\n\nIf AES_DECRYPT() detects invalid data or incorrect padding, it returns\nNULL. However, it is possible for AES_DECRYPT() to return a non-NULL\nvalue (possibly garbage) if the input data or the key is invalid.\n\nYou can use the AES functions to store data in an encrypted form by\nmodifying your queries:\n\nURL: https://mariadb.com/kb/en/aes_encrypt/\n\n', 'INSERT INTO t VALUES (1,AES_ENCRYPT(\'text\',\'password\'));\n', 'https://mariadb.com/kb/en/aes_encrypt/'),
(444, '+', 4, 'Syntax:\n+\n\nAddition:\n\nURL: https://mariadb.com/kb/en/addition-operator/\n\n', 'MariaDB> SELECT 3+5;\n        -> 8\n', 'https://mariadb.com/kb/en/addition-operator/'),
(445, 'INET_NTOA', 14, 'Syntax:\nINET_NTOA(expr)\n\nGiven a numeric IPv4 network address in network byte order, returns the\ndotted-quad representation of the address as a string. INET_NTOA()\nreturns NULL if it does not understand its argument.\n\nAs of MySQL 5.5.3, the return value is a nonbinary string in the\nconnection character set. Before 5.5.3, the return value is a binary\nstring.\n\nURL: https://mariadb.com/kb/en/inet_ntoa/\n\n', 'MariaDB> SELECT INET_NTOA(167773449);\n        -> \'10.0.5.9\'\n', 'https://mariadb.com/kb/en/inet_ntoa/'),
(446, 'ACOS', 4, 'Syntax:\nACOS(X)\n\nReturns the arc cosine of X, that is, the value whose cosine is X.\nReturns NULL if X is not in the range -1 to 1.\n\nURL: https://mariadb.com/kb/en/acos/\n\n', 'MariaDB> SELECT ACOS(1);\n        -> 0\nMariaDB> SELECT ACOS(1.0001);\n        -> NULL\nMariaDB> SELECT ACOS(0);\n        -> 1.5707963267949\n', 'https://mariadb.com/kb/en/acos/'),
(447, 'ISOLATION', 8, 'Syntax:\nSET [GLOBAL | SESSION] TRANSACTION ISOLATION LEVEL\n  {\n       REPEATABLE READ\n     | READ COMMITTED\n     | READ UNCOMMITTED\n     | SERIALIZABLE\n   }\n\nThis statement sets the transaction isolation level, used for\noperations on InnoDB tables.\n\nScope of the Isolation Level\n\nYou can set the isolation level globally, for the current session, or\nfor the next transaction:\n\no With the GLOBAL keyword, the statement sets the default transaction\n  level globally for all subsequent sessions. Existing sessions are\n  unaffected.\n\no With the SESSION keyword, the statement sets the default transaction\n  level for all subsequent transactions performed within the current\n  session.\n\no Without any SESSION or GLOBAL keyword, the statement sets the\n  isolation level for the next (not started) transaction performed\n  within the current session.\n\nA change to the global default isolation level requires the SUPER\nprivilege. Any session is free to change its session isolation level\n(even in the middle of a transaction), or the isolation level for its\nnext transaction.\n\nSET TRANSACTION ISOLATION LEVEL without GLOBAL or SESSION is not\npermitted while there is an active transaction:\n\nMariaDB> START TRANSACTION;\nQuery OK, 0 rows affected (0.02 sec)\n\nMariaDB> SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;\nERROR 1568 (25001): Transaction isolation level can\'t be changed\nwhile a transaction is in progress\n\nTo set the global default isolation level at server startup, use the\n--transaction-isolation=level option to mysqld on the command line or\nin an option file. Values of level for this option use dashes rather\nthan spaces, so the permissible values are READ-UNCOMMITTED,\nREAD-COMMITTED, REPEATABLE-READ, or SERIALIZABLE. For example, to set\nthe default isolation level to REPEATABLE READ, use these lines in the\n[mysqld] section of an option file:\n\n[mysqld]\ntransaction-isolation = REPEATABLE-READ\n\nIt is possible to check or set the global and session transaction\nisolation levels at runtime by using the tx_isolation system variable:\n\nSELECT @@GLOBAL.tx_isolation, @@tx_isolation;\nSET GLOBAL tx_isolation=\'REPEATABLE-READ\';\nSET SESSION tx_isolation=\'SERIALIZABLE\';\n\nDetails and Usage of Isolation Levels\n\nInnoDB supports each of the transaction isolation levels described here\nusing different locking strategies. You can enforce a high degree of\nconsistency with the default REPEATABLE READ level, for operations on\ncrucial data where ACID compliance is important. Or you can relax the\nconsistency rules with READ COMMITTED or even READ UNCOMMITTED, in\nsituations such as bulk reporting where precise consistency and\nrepeatable results are less important than minimizing the amount of\noverhead for locking. SERIALIZABLE enforces even stricter rules than\nREPEATABLE READ, and is used mainly in specialized situations, such as\nwith XA transactions and for troubleshooting issues with concurrency\nand deadlocks.\n\nFor full information about how these isolation levels work with InnoDB\ntransactions, see\nhttp://dev.mysql.com/doc/refman/5.1/en/innodb-transaction-model.html.\nIn particular, for additional information about InnoDB record-level\nlocks and how it uses them to execute various types of statements, see\nhttp://dev.mysql.com/doc/refman/5.5/en/innodb-record-level-locks.html\nand http://dev.mysql.com/doc/refman/5.5/en/innodb-locks-set.html.\n\nThe following list describes how MySQL supports the different\ntransaction levels. The list goes from the most commonly used level to\nthe least used.\n\no REPEATABLE READ\n\n  This is the default isolation level for InnoDB. For consistent reads,\n  there is an important difference from the READ COMMITTED isolation\n  level: All consistent reads within the same transaction read the\n  snapshot established by the first read. This convention means that if\n  you issue several plain (nonlocking) SELECT statements within the\n  same transaction, these SELECT statements are consistent also with\n  respect to each other. See\n  http://dev.mysql.com/doc/refman/5.5/en/innodb-consistent-read.html.\n\n  For locking reads (SELECT with FOR UPDATE or LOCK IN SHARE MODE),\n  UPDATE, and DELETE statements, locking depends on whether the\n  statement uses a unique index with a unique search condition, or a\n  range-type search condition. For a unique index with a unique search\n  condition, InnoDB locks only the index record found, not the gap\n  before it. For other search conditions, InnoDB locks the index range\n  scanned, using gap locks or next-key (gap plus index-record) locks to\n  block insertions by other sessions into the gaps covered by the\n  range.\n\no READ COMMITTED\n\n  A somewhat Oracle-like isolation level with respect to consistent\n  (nonlocking) reads: Each consistent read, even within the same\n  transaction, sets and reads its own fresh snapshot. See\n  http://dev.mysql.com/doc/refman/5.5/en/innodb-consistent-read.html.\n\n  For locking reads (SELECT with FOR UPDATE or LOCK IN SHARE MODE),\n  InnoDB locks only index records, not the gaps before them, and thus\n  permits the free insertion of new records next to locked records. For\n  UPDATE and DELETE statements, locking depends on whether the\n  statement uses a unique index with a unique search condition (such as\n  WHERE id = 100), or a range-type search condition (such as WHERE id >\n  100). For a unique index with a unique search condition, InnoDB locks\n  only the index record found, not the gap before it. For range-type\n  searches, InnoDB locks the index range scanned, using gap locks or\n  next-key (gap plus index-record) locks to block insertions by other\n  sessions into the gaps covered by the range. This is necessary\n  because \"phantom rows\" must be blocked for MySQL replication and\n  recovery to work.\n\n  *Note*: In MySQL 5.5, if the READ COMMITTED isolation level is used\n  or the innodb_locks_unsafe_for_binlog system variable is enabled,\n  there is no InnoDB gap locking except for foreign-key constraint\n  checking and duplicate-key checking. Also, record locks for\n  nonmatching rows are released after MySQL has evaluated the WHERE\n  condition. If you use READ COMMITTED or enable\n  innodb_locks_unsafe_for_binlog, you must use row-based binary\n  logging.\n\no READ UNCOMMITTED\n\n  SELECT statements are performed in a nonlocking fashion, but a\n  possible earlier version of a row might be used. Thus, using this\n  isolation level, such reads are not consistent. This is also called a\n  \"dirty read.\" Otherwise, this isolation level works like READ\n  COMMITTED.\n\no SERIALIZABLE\n\n  This level is like REPEATABLE READ, but InnoDB implicitly converts\n  all plain SELECT statements to SELECT ... LOCK IN SHARE MODE if\n  autocommit is disabled. If autocommit is enabled, the SELECT is its\n  own transaction. It therefore is known to be read only and can be\n  serialized if performed as a consistent (nonlocking) read and need\n  not block for other transactions. (To force a plain SELECT to block\n  if other transactions have modified the selected rows, disable\n  autocommit.)\n\nURL: https://mariadb.com/kb/en/set-transaction-isolation-level/\n\n', '', 'https://mariadb.com/kb/en/set-transaction-isolation-level/'),
(448, 'CEILING', 4, 'Syntax:\nCEILING(X)\n\nReturns the smallest integer value not less than X.\n\nURL: https://mariadb.com/kb/en/ceiling/\n\n', 'MariaDB> SELECT CEILING(1.23);\n        -> 2\nMariaDB> SELECT CEILING(-1.23);\n        -> -1\n', 'https://mariadb.com/kb/en/ceiling/'),
(449, 'SIN', 4, 'Syntax:\nSIN(X)\n\nReturns the sine of X, where X is given in radians.\n\nURL: https://mariadb.com/kb/en/sin/\n\n', 'MariaDB> SELECT SIN(PI());\n        -> 1.2246063538224e-16\nMariaDB> SELECT ROUND(SIN(PI()));\n        -> 0\n', 'https://mariadb.com/kb/en/sin/'),
(450, 'DAYOFWEEK', 31, 'Syntax:\nDAYOFWEEK(date)\n\nReturns the weekday index for date (1 = Sunday, 2 = Monday, ..., 7 =\nSaturday). These index values correspond to the ODBC standard.\n\nURL: https://mariadb.com/kb/en/dayofweek/\n\n', 'MariaDB> SELECT DAYOFWEEK(\'2007-02-03\');\n        -> 7\n', 'https://mariadb.com/kb/en/dayofweek/'),
(451, 'SHOW PROCESSLIST', 26, 'Syntax:\nSHOW [FULL] PROCESSLIST\n\nSHOW PROCESSLIST shows you which threads are running. You can also get\nthis information from the INFORMATION_SCHEMA PROCESSLIST table or the\nmysqladmin processlist command. If you have the PROCESS privilege, you\ncan see all threads. Otherwise, you can see only your own threads (that\nis, threads associated with the MySQL account that you are using). If\nyou do not use the FULL keyword, only the first 100 characters of each\nstatement are shown in the Info field.\n\nURL: https://mariadb.com/kb/en/show-processlist/\n\n', '', 'https://mariadb.com/kb/en/show-processlist/'),
(452, 'LINEFROMWKB', 32, 'LineFromWKB(wkb[,srid]), LineStringFromWKB(wkb[,srid])\n\nConstructs a LINESTRING value using its WKB representation and SRID.\n\nURL: https://mariadb.com/kb/en/linefromwkb/\n\n', '', 'https://mariadb.com/kb/en/linefromwkb/'),
(453, 'GEOMETRYTYPE', 36, 'GeometryType(g)\n\nReturns as a binary string the name of the geometry type of which the\ngeometry instance g is a member. The name corresponds to one of the\ninstantiable Geometry subclasses.\n\nURL: https://mariadb.com/kb/en/geometrytype/\n\n', 'MariaDB> SELECT GeometryType(GeomFromText(\'POINT(1 1)\'));\n+------------------------------------------+\n| GeometryType(GeomFromText(\'POINT(1 1)\')) |\n+------------------------------------------+\n| POINT                                    |\n+------------------------------------------+\n', 'https://mariadb.com/kb/en/geometrytype/'),
(454, 'CREATE VIEW', 39, 'Syntax:\nCREATE\n    [OR REPLACE]\n    [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]\n    [DEFINER = { user | CURRENT_USER }]\n    [SQL SECURITY { DEFINER | INVOKER }]\n    VIEW view_name [(column_list)]\n    AS select_statement\n    [WITH [CASCADED | LOCAL] CHECK OPTION]\n\nThe CREATE VIEW statement creates a new view, or replaces an existing\none if the OR REPLACE clause is given. If the view does not exist,\nCREATE OR REPLACE VIEW is the same as CREATE VIEW. If the view does\nexist, CREATE OR REPLACE VIEW is the same as ALTER VIEW.\n\nThe select_statement is a SELECT statement that provides the definition\nof the view. (When you select from the view, you select in effect using\nthe SELECT statement.) select_statement can select from base tables or\nother views.\n\nThe view definition is \"frozen\" at creation time, so changes to the\nunderlying tables afterward do not affect the view definition. For\nexample, if a view is defined as SELECT * on a table, new columns added\nto the table later do not become part of the view.\n\nThe ALGORITHM clause affects how MySQL processes the view. The DEFINER\nand SQL SECURITY clauses specify the security context to be used when\nchecking access privileges at view invocation time. The WITH CHECK\nOPTION clause can be given to constrain inserts or updates to rows in\ntables referenced by the view. These clauses are described later in\nthis section.\n\nThe CREATE VIEW statement requires the CREATE VIEW privilege for the\nview, and some privilege for each column selected by the SELECT\nstatement. For columns used elsewhere in the SELECT statement you must\nhave the SELECT privilege. If the OR REPLACE clause is present, you\nmust also have the DROP privilege for the view. CREATE VIEW might also\nrequire the SUPER privilege, depending on the DEFINER value, as\ndescribed later in this section.\n\nWhen a view is referenced, privilege checking occurs as described later\nin this section.\n\nA view belongs to a database. By default, a new view is created in the\ndefault database. To create the view explicitly in a given database,\nspecify the name as db_name.view_name when you create it:\n\nMariaDB> CREATE VIEW test.v AS SELECT * FROM t;\n\nWithin a database, base tables and views share the same namespace, so a\nbase table and a view cannot have the same name.\n\nColumns retrieved by the SELECT statement can be simple references to\ntable columns. They can also be expressions that use functions,\nconstant values, operators, and so forth.\n\nViews must have unique column names with no duplicates, just like base\ntables. By default, the names of the columns retrieved by the SELECT\nstatement are used for the view column names. To define explicit names\nfor the view columns, the optional column_list clause can be given as a\nlist of comma-separated identifiers. The number of names in column_list\nmust be the same as the number of columns retrieved by the SELECT\nstatement.\n\nUnqualified table or view names in the SELECT statement are interpreted\nwith respect to the default database. A view can refer to tables or\nviews in other databases by qualifying the table or view name with the\nproper database name.\n\nA view can be created from many kinds of SELECT statements. It can\nrefer to base tables or other views. It can use joins, UNION, and\nsubqueries. The SELECT need not even refer to any tables. The following\nexample defines a view that selects two columns from another table, as\nwell as an expression calculated from those columns:\n\nMariaDB> CREATE TABLE t (qty INT, price INT);\nMariaDB> INSERT INTO t VALUES(3, 50);\nMariaDB> CREATE VIEW v AS SELECT qty, price, qty*price AS value FROM t;\nMariaDB> SELECT * FROM v;\n+------+-------+-------+\n| qty  | price | value |\n+------+-------+-------+\n|    3 |    50 |   150 |\n+------+-------+-------+\n\nA view definition is subject to the following restrictions:\n\no The SELECT statement cannot contain a subquery in the FROM clause.\n\no The SELECT statement cannot refer to system or user variables.\n\no Within a stored program, the definition cannot refer to program\n  parameters or local variables.\n\no The SELECT statement cannot refer to prepared statement parameters.\n\no Any table or view referred to in the definition must exist. However,\n  after a view has been created, it is possible to drop a table or view\n  that the definition refers to. In this case, use of the view results\n  in an error. To check a view definition for problems of this kind,\n  use the CHECK TABLE statement.\n\no The definition cannot refer to a TEMPORARY table, and you cannot\n  create a TEMPORARY view.\n\no Any tables named in the view definition must exist at definition\n  time.\n\no You cannot associate a trigger with a view.\n\no Aliases for column names in the SELECT statement are checked against\n  the maximum column length of 64 characters (not the maximum alias\n  length of 256 characters).\n\nORDER BY is permitted in a view definition, but it is ignored if you\nselect from a view using a statement that has its own ORDER BY.\n\nFor other options or clauses in the definition, they are added to the\noptions or clauses of the statement that references the view, but the\neffect is undefined. For example, if a view definition includes a LIMIT\nclause, and you select from the view using a statement that has its own\nLIMIT clause, it is undefined which limit applies. This same principle\napplies to options such as ALL, DISTINCT, or SQL_SMALL_RESULT that\nfollow the SELECT keyword, and to clauses such as INTO, FOR UPDATE,\nLOCK IN SHARE MODE, and PROCEDURE.\n\nIf you create a view and then change the query processing environment\nby changing system variables, that may affect the results that you get\nfrom the view:\n\nMariaDB> CREATE VIEW v (mycol) AS SELECT \'abc\';\nQuery OK, 0 rows affected (0.01 sec)\n\nMariaDB> SET sql_mode = \'\';\nQuery OK, 0 rows affected (0.00 sec)\n\nMariaDB> SELECT \"mycol\" FROM v;\n+-------+\n| mycol |\n+-------+\n| mycol |\n+-------+\n1 row in set (0.01 sec)\n\nMariaDB> SET sql_mode = \'ANSI_QUOTES\';\nQuery OK, 0 rows affected (0.00 sec)\n\nMariaDB> SELECT \"mycol\" FROM v;\n+-------+\n| mycol |\n+-------+\n| abc   |\n+-------+\n1 row in set (0.00 sec)\n\nThe DEFINER and SQL SECURITY clauses determine which MySQL account to\nuse when checking access privileges for the view when a statement is\nexecuted that references the view. The valid SQL SECURITY\ncharacteristic values are DEFINER and INVOKER. These indicate that the\nrequired privileges must be held by the user who defined or invoked the\nview, respectively. The default SQL SECURITY value is DEFINER.\n\nIf a user value is given for the DEFINER clause, it should be a MySQL\naccount specified as \'user_name\'@\'host_name\' (the same format used in\nthe GRANT statement), CURRENT_USER, or CURRENT_USER(). The default\nDEFINER value is the user who executes the CREATE VIEW statement. This\nis the same as specifying DEFINER = CURRENT_USER explicitly.\n\nIf you specify the DEFINER clause, these rules determine the valid\nDEFINER user values:\n\no If you do not have the SUPER privilege, the only valid user value is\n  your own account, either specified literally or by using\n  CURRENT_USER. You cannot set the definer to some other account.\n\no If you have the SUPER privilege, you can specify any syntactically\n  valid account name. If the account does not actually exist, a warning\n  is generated.\n\no Although it is possible to create a view with a nonexistent DEFINER\n  account, an error occurs when the view is referenced if the SQL\n  SECURITY value is DEFINER but the definer account does not exist.\n\nFor more information about view security, see\nhttps://mariadb.com/kb/en/stored-routine-privileges/.\n\nWithin a view definition, CURRENT_USER returns the view\'s DEFINER value\nby default. For views defined with the SQL SECURITY INVOKER\ncharacteristic, CURRENT_USER returns the account for the view\'s\ninvoker. For information about user auditing within views, see\nhttp://dev.mysql.com/doc/refman/5.5/en/account-activity-auditing.html.\n\nWithin a stored routine that is defined with the SQL SECURITY DEFINER\ncharacteristic, CURRENT_USER returns the routine\'s DEFINER value. This\nalso affects a view defined within such a routine, if the view\ndefinition contains a DEFINER value of CURRENT_USER.\n\nView privileges are checked like this:\n\no At view definition time, the view creator must have the privileges\n  needed to use the top-level objects accessed by the view. For\n  example, if the view definition refers to table columns, the creator\n  must have some privilege for each column in the select list of the\n  definition, and the SELECT privilege for each column used elsewhere\n  in the definition. If the definition refers to a stored function,\n  only the privileges needed to invoke the function can be checked. The\n  privileges required at function invocation time can be checked only\n  as it executes: For different invocations, different execution paths\n  within the function might be taken.\n\no The user who references a view must have appropriate privileges to\n  access it (SELECT to select from it, INSERT to insert into it, and so\n  forth.)\n\no When a view has been referenced, privileges for objects accessed by\n  the view are checked against the privileges held by the view DEFINER\n  account or invoker, depending on whether the SQL SECURITY\n  characteristic is DEFINER or INVOKER, respectively.\n\no If reference to a view causes execution of a stored function,\n  privilege checking for statements executed within the function depend\n  on whether the function SQL SECURITY characteristic is DEFINER or\n  INVOKER. If the security characteristic is DEFINER, the function runs\n  with the privileges of the DEFINER account. If the characteristic is\n  INVOKER, the function runs with the privileges determined by the\n  view\'s SQL SECURITY characteristic.\n\nExample: A view might depend on a stored function, and that function\nmight invoke other stored routines. For example, the following view\ninvokes a stored function f():\n\nCREATE VIEW v AS SELECT * FROM t WHERE t.id = f(t.name);\n\nSuppose that f() contains a statement such as this:\n\nIF name IS NULL then\n  CALL p1();\nELSE\n  CALL p2();\nEND IF;\n\nThe privileges required for executing statements within f() need to be\nchecked when f() executes. This might mean that privileges are needed\nfor p1() or p2(), depending on the execution path within f(). Those\nprivileges must be checked at runtime, and the user who must possess\nthe privileges is determined by the SQL SECURITY values of the view v\nand the function f().\n\nThe DEFINER and SQL SECURITY clauses for views are extensions to\nstandard SQL. In standard SQL, views are handled using the rules for\nSQL SECURITY DEFINER. The standard says that the definer of the view,\nwhich is the same as the owner of the view\'s schema, gets applicable\nprivileges on the view (for example, SELECT) and may grant them. MySQL\nhas no concept of a schema \"owner\", so MySQL adds a clause to identify\nthe definer. The DEFINER clause is an extension where the intent is to\nhave what the standard has; that is, a permanent record of who defined\nthe view. This is why the default DEFINER value is the account of the\nview creator.\n\nThe optional ALGORITHM clause is a MySQL extension to standard SQL. It\naffects how MySQL processes the view. ALGORITHM takes three values:\nMERGE, TEMPTABLE, or UNDEFINED. The default algorithm is UNDEFINED if\nno ALGORITHM clause is present. For more information, see\nhttps://mariadb.com/kb/en/view-algorithms/.\n\nSome views are updatable. That is, you can use them in statements such\nas UPDATE, DELETE, or INSERT to update the contents of the underlying\ntable. For a view to be updatable, there must be a one-to-one\nrelationship between the rows in the view and the rows in the\nunderlying table. There are also certain other constructs that make a\nview nonupdatable.\n\nThe WITH CHECK OPTION clause can be given for an updatable view to\nprevent inserts or updates to rows except those for which the WHERE\nclause in the select_statement is true.\n\nIn a WITH CHECK OPTION clause for an updatable view, the LOCAL and\nCASCADED keywords determine the scope of check testing when the view is\ndefined in terms of another view. The LOCAL keyword restricts the CHECK\nOPTION only to the view being defined. CASCADED causes the checks for\nunderlying views to be evaluated as well. When neither keyword is\ngiven, the default is CASCADED.\n\nFor more information about updatable views and the WITH CHECK OPTION\nclause, see\nhttps://mariadb.com/kb/en/inserting-and-updating-with-views/.\n\nURL: https://mariadb.com/kb/en/create-view/\n\n', '', 'https://mariadb.com/kb/en/create-view/'),
(455, 'TRIM', 37, 'Syntax:\nTRIM([{BOTH | LEADING | TRAILING} [remstr] FROM] str), TRIM([remstr\nFROM] str)\n\nReturns the string str with all remstr prefixes or suffixes removed. If\nnone of the specifiers BOTH, LEADING, or TRAILING is given, BOTH is\nassumed. remstr is optional and, if not specified, spaces are removed.\n\nURL: https://mariadb.com/kb/en/trim/\n\n', 'MariaDB> SELECT TRIM(\'  bar   \');\n        -> \'bar\'\nMariaDB> SELECT TRIM(LEADING \'x\' FROM \'xxxbarxxx\');\n        -> \'barxxx\'\nMariaDB> SELECT TRIM(BOTH \'x\' FROM \'xxxbarxxx\');\n        -> \'bar\'\nMariaDB> SELECT TRIM(TRAILING \'xyz\' FROM \'barxxyz\');\n        -> \'barx\'\n', 'https://mariadb.com/kb/en/trim/'),
(456, 'IS', 18, 'Syntax:\nIS boolean_value\n\nTests a value against a boolean value, where boolean_value can be TRUE,\nFALSE, or UNKNOWN.\n\nURL: https://mariadb.com/kb/en/is/\n\n', 'MariaDB> SELECT 1 IS TRUE, 0 IS FALSE, NULL IS UNKNOWN;\n        -> 1, 1, 1\n', 'https://mariadb.com/kb/en/is/'),
(457, 'GET_FORMAT', 31, 'Syntax:\nGET_FORMAT({DATE|TIME|DATETIME}, {\'EUR\'|\'USA\'|\'JIS\'|\'ISO\'|\'INTERNAL\'})\n\nReturns a format string. This function is useful in combination with\nthe DATE_FORMAT() and the STR_TO_DATE() functions.\n\nURL: https://mariadb.com/kb/en/get_format/\n\n', 'MariaDB> SELECT DATE_FORMAT(\'2003-10-03\',GET_FORMAT(DATE,\'EUR\'));\n        -> \'03.10.2003\'\nMariaDB> SELECT STR_TO_DATE(\'10.31.2003\',GET_FORMAT(DATE,\'USA\'));\n        -> \'2003-10-31\'\n', 'https://mariadb.com/kb/en/get_format/'),
(458, 'TINYBLOB', 22, 'TINYBLOB\n\nA BLOB column with a maximum length of 255 (28 - 1) bytes. Each\nTINYBLOB value is stored using a 1-byte length prefix that indicates\nthe number of bytes in the value.\n\nURL: https://mariadb.com/kb/en/tinyblob/\n\n', '', 'https://mariadb.com/kb/en/tinyblob/'),
(459, 'SIGNAL', 23, 'Syntax:\nSIGNAL condition_value\n    [SET signal_information_item\n    [, signal_information_item] ...]\n\ncondition_value:\n    SQLSTATE [VALUE] sqlstate_value\n  | condition_name\n\nsignal_information_item:\n    condition_information_item_name = simple_value_specification\n\ncondition_information_item_name:\n    CLASS_ORIGIN\n  | SUBCLASS_ORIGIN\n  | MESSAGE_TEXT\n  | MYSQL_ERRNO\n  | CONSTRAINT_CATALOG\n  | CONSTRAINT_SCHEMA\n  | CONSTRAINT_NAME\n  | CATALOG_NAME\n  | SCHEMA_NAME\n  | TABLE_NAME\n  | COLUMN_NAME\n  | CURSOR_NAME\n\ncondition_name, simple_value_specification:\n    (see following discussion)\n\nSIGNAL is the way to \"return\" an error. SIGNAL provides error\ninformation to a handler, to an outer portion of the application, or to\nthe client. Also, it provides control over the error\'s characteristics\n(error number, SQLSTATE value, message). Without SIGNAL, it is\nnecessary to resort to workarounds such as deliberately referring to a\nnonexistent table to cause a routine to return an error.\n\nNo special privileges are required to execute the SIGNAL statement.\n\nThe condition_value in a SIGNAL statement indicates the error value to\nbe returned. It can be an SQLSTATE value (a 5-character string literal)\nor a condition_name that refers to a named condition previously defined\nwith DECLARE ... CONDITION (see [HELP DECLARE CONDITION]).\n\nAn SQLSTATE value can indicate errors, warnings, or \"not found.\" The\nfirst two characters of the value indicate its error class, as\ndiscussed in\nhttps://mariadb.com/kb/en/signal/#signal-condition-inf\normation-items. Some signal values cause statement termination; see\nhttps://mariadb.com/kb/en/signal/#signal-effects.\n\nThe SQLSTATE value for a SIGNAL statement should not start with \'00\'\nbecause such values indicate success and are not valid for signaling an\nerror. This is true whether the SQLSTATE value is specified directly in\nthe SIGNAL statement or in a named condition referred to in the\nstatement. If the value is invalid, a Bad SQLSTATE error occurs.\n\nTo signal a generic SQLSTATE value, use \'45000\', which means \"unhandled\nuser-defined exception.\"\n\nThe SIGNAL statement optionally includes a SET clause that contains\nmultiple signal items, in a comma-separated list of\ncondition_information_item_name = simple_value_specification\nassignments.\n\nEach condition_information_item_name may be specified only once in the\nSET clause. Otherwise, a Duplicate condition information item error\noccurs.\n\nValid simple_value_specification designators can be specified using\nstored procedure or function parameters, stored program local variables\ndeclared with DECLARE, user-defined variables, system variables, or\nliterals. A character literal may include a _charset introducer.\n\nFor information about permissible condition_information_item_name\nvalues, see\nhttps://mariadb.com/kb/en/signal/#signal-condition-inf\normation-items.\n\nURL: https://mariadb.com/kb/en/signal/\n\n', 'CREATE PROCEDURE p (pval INT)\nBEGIN\n  DECLARE specialty CONDITION FOR SQLSTATE \'45000\';\n  IF pval = 0 THEN\n    SIGNAL SQLSTATE \'01000\';\n  ELSEIF pval = 1 THEN\n    SIGNAL SQLSTATE \'45000\'\n      SET MESSAGE_TEXT = \'An error occurred\';\n  ELSEIF pval = 2 THEN\n    SIGNAL specialty\n      SET MESSAGE_TEXT = \'An error occurred\';\n  ELSE\n    SIGNAL SQLSTATE \'01000\'\n      SET MESSAGE_TEXT = \'A warning occurred\', MYSQL_ERRNO = 1000;\n    SIGNAL SQLSTATE \'45000\'\n      SET MESSAGE_TEXT = \'An error occurred\', MYSQL_ERRNO = 1001;\n  END IF;\nEND;\n', 'https://mariadb.com/kb/en/signal/'),
(460, 'SAVEPOINT', 8, 'Syntax:\nSAVEPOINT identifier\nROLLBACK [WORK] TO [SAVEPOINT] identifier\nRELEASE SAVEPOINT identifier\n\nInnoDB supports the SQL statements SAVEPOINT, ROLLBACK TO SAVEPOINT,\nRELEASE SAVEPOINT and the optional WORK keyword for ROLLBACK.\n\nURL: https://mariadb.com/kb/en/savepoint/\n\n', '', 'https://mariadb.com/kb/en/savepoint/'),
(461, 'USER', 17, 'Syntax:\nUSER()\n\nReturns the current MySQL user name and host name as a string in the\nutf8 character set.\n\nURL: https://mariadb.com/kb/en/user/\n\n', 'MariaDB> SELECT USER();\n        -> \'davida@localhost\'\n', 'https://mariadb.com/kb/en/user/'),
(462, 'LABELS', 23, 'Syntax:\n[begin_label:] BEGIN\n    [statement_list]\nEND [end_label]\n\n[begin_label:] LOOP\n    statement_list\nEND LOOP [end_label]\n\n[begin_label:] REPEAT\n    statement_list\nUNTIL search_condition\nEND REPEAT [end_label]\n\n[begin_label:] WHILE search_condition DO\n    statement_list\nEND WHILE [end_label]\n\nLabels are permitted for BEGIN ... END blocks and for the LOOP, REPEAT,\nand WHILE statements. Label use for those statements follows these\nrules:\n\no begin_label must be followed by a colon.\n\no begin_label can be given without end_label. If end_label is present,\n  it must be the same as begin_label.\n\no end_label cannot be given without begin_label.\n\no Labels at the same nesting level must be distinct.\n\no Labels can be up to 16 characters long.\n\nTo refer to a label within the labeled construct, use an ITERATE or\nLEAVE statement. The following example uses those statements to\ncontinue iterating or terminate the loop:\n\nCREATE PROCEDURE doiterate(p1 INT)\nBEGIN\n  label1: LOOP\n    SET p1 = p1 + 1;\n    IF p1 < 10 THEN ITERATE label1; END IF;\n    LEAVE label1;\n  END LOOP label1;\nEND;\n\nThe scope of a block label does not include the code for handlers\ndeclared within the block. For details, see [HELP DECLARE HANDLER].\n\nURL: https://mariadb.com/kb/en/labels/\n\n', '', 'https://mariadb.com/kb/en/labels/'),
(463, 'ALTER TABLE', 39, 'Syntax:\nALTER [ONLINE | OFFLINE] [IGNORE] TABLE tbl_name\n    [alter_specification [, alter_specification] ...]\n    [partition_options]\n\nalter_specification:\n    table_options\n  | ADD [COLUMN] col_name column_definition\n        [FIRST | AFTER col_name ]\n  | ADD [COLUMN] (col_name column_definition,...)\n  | ADD {INDEX|KEY} [index_name]\n        [index_type] (index_col_name,...) [index_option] ...\n  | ADD [CONSTRAINT [symbol]] PRIMARY KEY\n        [index_type] (index_col_name,...) [index_option] ...\n  | ADD [CONSTRAINT [symbol]]\n        UNIQUE [INDEX|KEY] [index_name]\n        [index_type] (index_col_name,...) [index_option] ...\n  | ADD FULLTEXT [INDEX|KEY] [index_name]\n        (index_col_name,...) [index_option] ...\n  | ADD SPATIAL [INDEX|KEY] [index_name]\n        (index_col_name,...) [index_option] ...\n  | ADD [CONSTRAINT [symbol]]\n        FOREIGN KEY [index_name] (index_col_name,...)\n        reference_definition\n  | ALTER [COLUMN] col_name {SET DEFAULT literal | DROP DEFAULT}\n  | CHANGE [COLUMN] old_col_name new_col_name column_definition\n        [FIRST|AFTER col_name]\n  | MODIFY [COLUMN] col_name column_definition\n        [FIRST | AFTER col_name]\n  | DROP [COLUMN] col_name\n  | DROP PRIMARY KEY\n  | DROP {INDEX|KEY} index_name\n  | DROP FOREIGN KEY fk_symbol\n  | MAX_ROWS = rows\n  | DISABLE KEYS\n  | ENABLE KEYS\n  | RENAME [TO|AS] new_tbl_name\n  | ORDER BY col_name [, col_name] ...\n  | CONVERT TO CHARACTER SET charset_name [COLLATE collation_name]\n  | [DEFAULT] CHARACTER SET [=] charset_name [COLLATE [=] collation_name]\n  | DISCARD TABLESPACE\n  | IMPORT TABLESPACE\n  | FORCE\n  | ADD PARTITION (partition_definition)\n  | DROP PARTITION partition_names\n  | TRUNCATE PARTITION {partition_names | ALL}\n  | COALESCE PARTITION number\n  | REORGANIZE PARTITION [partition_names INTO (partition_definitions)]\n  | ANALYZE PARTITION {partition_names | ALL}\n  | CHECK PARTITION {partition_names | ALL}\n  | OPTIMIZE PARTITION {partition_names | ALL}\n  | REBUILD PARTITION {partition_names | ALL}\n  | REPAIR PARTITION {partition_names | ALL}\n  | PARTITION BY partitioning_expression\n  | REMOVE PARTITIONING\n\nindex_col_name:\n    col_name [(length)] [ASC | DESC]\n\nindex_type:\n    USING {BTREE | HASH}\n\nindex_option:\n    KEY_BLOCK_SIZE [=] value\n  | index_type\n  | WITH PARSER parser_name\n  | COMMENT \'string\'\n\ntable_options:\n    table_option [[,] table_option] ...  (see CREATE TABLE options)\n\npartition_options:\n    (see CREATE TABLE options)\n\nALTER TABLE changes the structure of a table. For example, you can add\nor delete columns, create or destroy indexes, change the type of\nexisting columns, or rename columns or the table itself. You can also\nchange characteristics such as the storage engine used for the table or\nthe table comment.\n\nPartitioning-related clauses for ALTER TABLE can be used with\npartitioned tables for repartitioning, for adding, dropping, merging,\nand splitting partitions, and for performing partitioning maintenance.\nFor more information, see\nhttp://dev.mysql.com/doc/refman/5.5/en/alter-table-partition-operations\n.html.\n\nFollowing the table name, specify the alterations to be made. If none\nare given, ALTER TABLE does nothing.\n\nURL: https://mariadb.com/kb/en/alter-table/\n\n', '', 'https://mariadb.com/kb/en/alter-table/'),
(464, 'MPOINTFROMWKB', 32, 'MPointFromWKB(wkb[,srid]), MultiPointFromWKB(wkb[,srid])\n\nConstructs a MULTIPOINT value using its WKB representation and SRID.\n\nURL: https://mariadb.com/kb/en/mpointfromwkb/\n\n', '', 'https://mariadb.com/kb/en/mpointfromwkb/'),
(465, 'CHAR BYTE', 22, 'The CHAR BYTE data type is an alias for the BINARY data type. This is a\ncompatibility feature.\n\nURL: https://mariadb.com/kb/en/char-byte/\n\n', '', 'https://mariadb.com/kb/en/char-byte/'),
(466, 'REPAIR TABLE', 20, 'Syntax:\nREPAIR [NO_WRITE_TO_BINLOG | LOCAL] TABLE\n    tbl_name [, tbl_name] ...\n    [QUICK] [EXTENDED] [USE_FRM]\n\nREPAIR TABLE repairs a possibly corrupted table. By default, it has the\nsame effect as myisamchk --recover tbl_name. REPAIR TABLE works for\nMyISAM, ARCHIVE, and CSV tables. See\nhttps://mariadb.com/kb/en/myisam-storage-engine/, and\nhttps://mariadb.com/kb/en/archive/, and\nhttps://mariadb.com/kb/en/csv/\n\nThis statement requires SELECT and INSERT privileges for the table.\n\nREPAIR TABLE is supported for partitioned tables. However, the USE_FRM\noption cannot be used with this statement on a partitioned table.\n\nYou can use ALTER TABLE ... REPAIR PARTITION to repair one or more\npartitions; for more information, see [HELP ALTER TABLE], and\nhttp://dev.mysql.com/doc/refman/5.5/en/partitioning-maintenance.html.\n\nURL: https://mariadb.com/kb/en/repair-table/\n\n', '', 'https://mariadb.com/kb/en/repair-table/'),
(467, 'MERGE', 39, 'The MERGE storage engine, also known as the MRG_MyISAM engine, is a\ncollection of identical MyISAM tables that can be used as one.\n\"Identical\" means that all tables have identical column and index\ninformation. You cannot merge MyISAM tables in which the columns are\nlisted in a different order, do not have exactly the same columns, or\nhave the indexes in different order. However, any or all of the MyISAM\ntables can be compressed with myisampack. See\nhttps://mariadb.com/kb/en/myisampack/. Differences in\ntable options such as AVG_ROW_LENGTH, MAX_ROWS, or PACK_KEYS do not\nmatter.\n\nURL: https://mariadb.com/kb/en/merge/\n\n', 'MariaDB> CREATE TABLE t1 (\n    ->    a INT NOT NULL AUTO_INCREMENT PRIMARY KEY,\n    ->    message CHAR(20)) ENGINE=MyISAM;\nMariaDB> CREATE TABLE t2 (\n    ->    a INT NOT NULL AUTO_INCREMENT PRIMARY KEY,\n    ->    message CHAR(20)) ENGINE=MyISAM;\nMariaDB> INSERT INTO t1 (message) VALUES (\'Testing\'),(\'table\'),(\'t1\');\nMariaDB> INSERT INTO t2 (message) VALUES (\'Testing\'),(\'table\'),(\'t2\');\nMariaDB> CREATE TABLE total (\n    ->    a INT NOT NULL AUTO_INCREMENT,\n    ->    message CHAR(20), INDEX(a))\n    ->    ENGINE=MERGE UNION=(t1,t2) INSERT_METHOD=LAST;\n', 'https://mariadb.com/kb/en/merge/'),
(468, 'CREATE TABLE', 39, 'Syntax:\nCREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name\n    (create_definition,...)\n    [table_options]\n    [partition_options]\n\nOr:\n\nCREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name\n    [(create_definition,...)]\n    [table_options]\n    [partition_options]\n    select_statement\n\nOr:\n\nCREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name\n    { LIKE old_tbl_name | (LIKE old_tbl_name) }\n\ncreate_definition:\n    col_name column_definition\n  | [CONSTRAINT [symbol]] PRIMARY KEY [index_type] (index_col_name,...)\n      [index_option] ...\n  | {INDEX|KEY} [index_name] [index_type] (index_col_name,...)\n      [index_option] ...\n  | [CONSTRAINT [symbol]] UNIQUE [INDEX|KEY]\n      [index_name] [index_type] (index_col_name,...)\n      [index_option] ...\n  | {FULLTEXT|SPATIAL} [INDEX|KEY] [index_name] (index_col_name,...)\n      [index_option] ...\n  | [CONSTRAINT [symbol]] FOREIGN KEY\n      [index_name] (index_col_name,...) reference_definition\n  | CHECK (expr)\n\ncolumn_definition:\n    data_type [NOT NULL | NULL] [DEFAULT default_value]\n      [AUTO_INCREMENT] [UNIQUE [KEY] | [PRIMARY] KEY]\n      [COMMENT \'string\']\n      [COLUMN_FORMAT {FIXED|DYNAMIC|DEFAULT}]\n      [STORAGE {DISK|MEMORY|DEFAULT}]\n      [reference_definition]\n\ndata_type:\n    BIT[(length)]\n  | TINYINT[(length)] [UNSIGNED] [ZEROFILL]\n  | SMALLINT[(length)] [UNSIGNED] [ZEROFILL]\n  | MEDIUMINT[(length)] [UNSIGNED] [ZEROFILL]\n  | INT[(length)] [UNSIGNED] [ZEROFILL]\n  | INTEGER[(length)] [UNSIGNED] [ZEROFILL]\n  | BIGINT[(length)] [UNSIGNED] [ZEROFILL]\n  | REAL[(length,decimals)] [UNSIGNED] [ZEROFILL]\n  | DOUBLE[(length,decimals)] [UNSIGNED] [ZEROFILL]\n  | FLOAT[(length,decimals)] [UNSIGNED] [ZEROFILL]\n  | DECIMAL[(length[,decimals])] [UNSIGNED] [ZEROFILL]\n  | NUMERIC[(length[,decimals])] [UNSIGNED] [ZEROFILL]\n  | DATE\n  | TIME\n  | TIMESTAMP\n  | DATETIME\n  | YEAR\n  | CHAR[(length)]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | VARCHAR(length)\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | BINARY[(length)]\n  | VARBINARY(length)\n  | TINYBLOB\n  | BLOB\n  | MEDIUMBLOB\n  | LONGBLOB\n  | TINYTEXT [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | TEXT [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | MEDIUMTEXT [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | LONGTEXT [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | ENUM(value1,value2,value3,...)\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | SET(value1,value2,value3,...)\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | spatial_type\n\nindex_col_name:\n    col_name [(length)] [ASC | DESC]\n\nindex_type:\n    USING {BTREE | HASH}\n\nindex_option:\n    KEY_BLOCK_SIZE [=] value\n  | index_type\n  | WITH PARSER parser_name\n  | COMMENT \'string\'\n\nreference_definition:\n    REFERENCES tbl_name (index_col_name,...)\n      [MATCH FULL | MATCH PARTIAL | MATCH SIMPLE]\n      [ON DELETE reference_option]\n      [ON UPDATE reference_option]\n\nreference_option:\n    RESTRICT | CASCADE | SET NULL | NO ACTION\n\ntable_options:\n    table_option [[,] table_option] ...\n\ntable_option:\n    ENGINE [=] engine_name\n  | AUTO_INCREMENT [=] value\n  | AVG_ROW_LENGTH [=] value\n  | [DEFAULT] CHARACTER SET [=] charset_name\n  | CHECKSUM [=] {0 | 1}\n  | [DEFAULT] COLLATE [=] collation_name\n  | COMMENT [=] \'string\'\n  | CONNECTION [=] \'connect_string\'\n  | DATA DIRECTORY [=] \'absolute path to directory\'\n  | DELAY_KEY_WRITE [=] {0 | 1}\n  | INDEX DIRECTORY [=] \'absolute path to directory\'\n  | INSERT_METHOD [=] { NO | FIRST | LAST }\n  | KEY_BLOCK_SIZE [=] value\n  | MAX_ROWS [=] value\n  | MIN_ROWS [=] value\n  | PACK_KEYS [=] {0 | 1 | DEFAULT}\n  | PASSWORD [=] \'string\'\n  | ROW_FORMAT [=] {DEFAULT|DYNAMIC|FIXED|COMPRESSED|REDUNDANT|COMPACT}\n  | TABLESPACE tablespace_name [STORAGE {DISK|MEMORY|DEFAULT}]\n  | UNION [=] (tbl_name[,tbl_name]...)\n\npartition_options:\n    PARTITION BY\n        { [LINEAR] HASH(expr)\n        | [LINEAR] KEY(column_list)\n        | RANGE{(expr) | COLUMNS(column_list)}\n        | LIST{(expr) | COLUMNS(column_list)} }\n    [PARTITIONS num]\n    [SUBPARTITION BY\n        { [LINEAR] HASH(expr)\n        | [LINEAR] KEY(column_list) }\n      [SUBPARTITIONS num]\n    ]\n    [(partition_definition [, partition_definition] ...)]\n\npartition_definition:\n    PARTITION partition_name\n        [VALUES \n            {LESS THAN {(expr | value_list) | MAXVALUE} \n            | \n            IN (value_list)}]\n        [[STORAGE] ENGINE [=] engine_name]\n        [COMMENT [=] \'comment_text\' ]\n        [DATA DIRECTORY [=] \'data_dir\']\n        [INDEX DIRECTORY [=] \'index_dir\']\n        [MAX_ROWS [=] max_number_of_rows]\n        [MIN_ROWS [=] min_number_of_rows]\n        [TABLESPACE [=] tablespace_name]\n        [NODEGROUP [=] node_group_id]\n        [(subpartition_definition [, subpartition_definition] ...)]\n\nsubpartition_definition:\n    SUBPARTITION logical_name\n        [[STORAGE] ENGINE [=] engine_name]\n        [COMMENT [=] \'comment_text\' ]\n        [DATA DIRECTORY [=] \'data_dir\']\n        [INDEX DIRECTORY [=] \'index_dir\']\n        [MAX_ROWS [=] max_number_of_rows]\n        [MIN_ROWS [=] min_number_of_rows]\n        [TABLESPACE [=] tablespace_name]\n        [NODEGROUP [=] node_group_id]\n\nselect_statement:\n    [IGNORE | REPLACE] [AS] SELECT ...   (Some valid select statement)\n\nCREATE TABLE creates a table with the given name. You must have the\nCREATE privilege for the table.\n\nRules for permissible table names are given in\nhttps://mariadb.com/kb/en/identifier-names/. By default,\nthe table is created in the default database, using the InnoDB storage\nengine. An error occurs if the table exists, if there is no default\ndatabase, or if the database does not exist.\n\nURL: https://mariadb.com/kb/en/create-table/\n\n', '', 'https://mariadb.com/kb/en/create-table/'),
(469, '>', 18, 'Syntax:\n>\n\nGreater than:\n\nURL: https://mariadb.com/kb/en/greater-than/\n\n', 'MariaDB> SELECT 2 > 2;\n        -> 0\n', 'https://mariadb.com/kb/en/greater-than/'),
(470, 'ANALYZE TABLE', 20, 'Syntax:\nANALYZE [NO_WRITE_TO_BINLOG | LOCAL] TABLE\n    tbl_name [, tbl_name] ...\n\nANALYZE TABLE analyzes and stores the key distribution for a table.\nDuring the analysis, the table is locked with a read lock for InnoDB\nand MyISAM. This statement works with InnoDB, Aria and MyISAM tables.\nFor MyISAM tables, this statement is equivalent to using myisamchk\n--analyze.\n\nFor more information on how the analysis works within InnoDB, see\nhttp://dev.mysql.com/doc/refman/5.5/en/innodb-restrictions.html.\n\nMySQL uses the stored key distribution to decide the order in which\ntables should be joined when you perform a join on something other than\na constant. In addition, key distributions can be used when deciding\nwhich indexes to use for a specific table within a query.\n\nThis statement requires SELECT and INSERT privileges for the table.\n\nANALYZE TABLE is supported for partitioned tables, and you can use\nALTER TABLE ... ANALYZE PARTITION to analyze one or more partitions;\nfor more information, see [HELP ALTER TABLE], and\nhttp://dev.mysql.com/doc/refman/5.5/en/partitioning-maintenance.html.\n\nURL: https://mariadb.com/kb/en/analyze-table/\n\n', '', 'https://mariadb.com/kb/en/analyze-table/'),
(471, 'MICROSECOND', 31, 'Syntax:\nMICROSECOND(expr)\n\nReturns the microseconds from the time or datetime expression expr as a\nnumber in the range from 0 to 999999.\n\nURL: https://mariadb.com/kb/en/microsecond/\n\n', 'MariaDB> SELECT MICROSECOND(\'12:00:00.123456\');\n        -> 123456\nMariaDB> SELECT MICROSECOND(\'2009-12-31 23:59:59.000010\');\n        -> 10\n', 'https://mariadb.com/kb/en/microsecond/'),
(472, 'CONSTRAINT', 39, 'InnoDB supports foreign keys, which let you cross-reference related\ndata across tables, and foreign key constraints, which help keep this\nspread-out data consistent. The syntax for an InnoDB foreign key\nconstraint definition in the CREATE TABLE or ALTER TABLE statement\nlooks like this:\n\n[CONSTRAINT [symbol]] FOREIGN KEY\n    [index_name] (index_col_name, ...)\n    REFERENCES tbl_name (index_col_name,...)\n    [ON DELETE reference_option]\n    [ON UPDATE reference_option]\n\nreference_option:\n    RESTRICT | CASCADE | SET NULL | NO ACTION\n\nURL: https://mariadb.com/kb/en/constraint/\n\n', 'CREATE TABLE product (category INT NOT NULL, id INT NOT NULL,\n                      price DECIMAL,\n                      PRIMARY KEY(category, id)) ENGINE=INNODB;\nCREATE TABLE customer (id INT NOT NULL,\n                       PRIMARY KEY (id)) ENGINE=INNODB;\nCREATE TABLE product_order (no INT NOT NULL AUTO_INCREMENT,\n                            product_category INT NOT NULL,\n                            product_id INT NOT NULL,\n                            customer_id INT NOT NULL,\n                            PRIMARY KEY(no),\n                            INDEX (product_category, product_id),\n                            FOREIGN KEY (product_category, product_id)\n                              REFERENCES product(category, id)\n                              ON UPDATE CASCADE ON DELETE RESTRICT,\n                            INDEX (customer_id),\n                            FOREIGN KEY (customer_id)\n                              REFERENCES customer(id)) ENGINE=INNODB;\n', 'https://mariadb.com/kb/en/constraint/');
INSERT INTO `help_topic` (`help_topic_id`, `name`, `help_category_id`, `description`, `example`, `url`) VALUES
(473, 'CREATE SERVER', 39, 'Syntax:\nCREATE SERVER server_name\n    FOREIGN DATA WRAPPER wrapper_name\n    OPTIONS (option [, option] ...)\n\noption:\n  { HOST character-literal\n  | DATABASE character-literal\n  | USER character-literal\n  | PASSWORD character-literal\n  | SOCKET character-literal\n  | OWNER character-literal\n  | PORT numeric-literal }\n\nThis statement creates the definition of a server for use with the\nFEDERATED storage engine. The CREATE SERVER statement creates a new row\nwithin the servers table within the mysql database. This statement\nrequires the SUPER privilege.\n\nThe server_name should be a unique reference to the server. Server\ndefinitions are global within the scope of the server, it is not\npossible to qualify the server definition to a specific database.\nserver_name has a maximum length of 64 characters (names longer than 64\ncharacters are silently truncated), and is case insensitive. You may\nspecify the name as a quoted string.\n\nThe wrapper_name should be mysql, and may be quoted with single\nquotation marks. Other values for wrapper_name are not currently\nsupported.\n\nFor each option you must specify either a character literal or numeric\nliteral. Character literals are UTF-8, support a maximum length of 64\ncharacters and default to a blank (empty) string. String literals are\nsilently truncated to 64 characters. Numeric literals must be a number\nbetween 0 and 9999, default value is 0.\n\n*Note*: Note that the OWNER option is currently not applied, and has no\neffect on the ownership or operation of the server connection that is\ncreated.\n\nThe CREATE SERVER statement creates an entry in the mysql.servers table\nthat can later be used with the CREATE TABLE statement when creating a\nFEDERATED table. The options that you specify will be used to populate\nthe columns in the mysql.servers table. The table columns are\nServer_name, Host, Db, Username, Password, Port and Socket.\n\nURL: https://mariadb.com/kb/en/create-server/\n\n', 'CREATE SERVER s\nFOREIGN DATA WRAPPER mysql\nOPTIONS (USER \'Remote\', HOST \'192.168.1.106\', DATABASE \'test\');\n', 'https://mariadb.com/kb/en/create-server/'),
(474, 'FIELD', 37, 'Syntax:\nFIELD(str,str1,str2,str3,...)\n\nReturns the index (position) of str in the str1, str2, str3, ... list.\nReturns 0 if str is not found.\n\nIf all arguments to FIELD() are strings, all arguments are compared as\nstrings. If all arguments are numbers, they are compared as numbers.\nOtherwise, the arguments are compared as double.\n\nIf str is NULL, the return value is 0 because NULL fails equality\ncomparison with any value. FIELD() is the complement of ELT().\n\nURL: https://mariadb.com/kb/en/field/\n\n', 'MariaDB> SELECT FIELD(\'ej\', \'Hej\', \'ej\', \'Heja\', \'hej\', \'foo\');\n        -> 2\nMariaDB> SELECT FIELD(\'fo\', \'Hej\', \'ej\', \'Heja\', \'hej\', \'foo\');\n        -> 0\n', 'https://mariadb.com/kb/en/field/'),
(475, 'MAKETIME', 31, 'Syntax:\nMAKETIME(hour,minute,second)\n\nReturns a time value calculated from the hour, minute, and second\narguments.\n\nURL: https://mariadb.com/kb/en/maketime/\n\n', 'MariaDB> SELECT MAKETIME(12,15,30);\n        -> \'12:15:30\'\n', 'https://mariadb.com/kb/en/maketime/'),
(476, 'CURDATE', 31, 'Syntax:\nCURDATE()\n\nReturns the current date as a value in \'YYYY-MM-DD\' or YYYYMMDD format,\ndepending on whether the function is used in a string or numeric\ncontext.\n\nURL: https://mariadb.com/kb/en/curdate/\n\n', 'MariaDB> SELECT CURDATE();\n        -> \'2008-06-13\'\nMariaDB> SELECT CURDATE() + 0;\n        -> 20080613\n', 'https://mariadb.com/kb/en/curdate/'),
(477, 'SET PASSWORD', 10, 'Syntax:\nSET PASSWORD [FOR user] =\n    {\n        PASSWORD(\'cleartext password\')\n      | OLD_PASSWORD(\'cleartext password\')\n      | \'encrypted password\'\n    }\n\nThe SET PASSWORD statement assigns a password to an existing MySQL user\naccount. When the read_only system variable is enabled, the SUPER\nprivilege is required to use SET PASSWORD, in addition to whatever\nother privileges might be required.\n\nIf the password is specified using the PASSWORD() or OLD_PASSWORD()\nfunction, the cleartext (unencrypted) password should be given as the\nargument to the function, which hashes the password and returns the\nencrypted password string. If the password is specified without using\neither function, it should be the already encrypted password value as a\nliteral string. In all cases, the encrypted password string must be in\nthe format required by the authentication method used for the account.\n\nThe old_passwords system variable value determines the hashing method\nused by PASSWORD(). If you specify the password using that function and\nSET PASSWORD rejects the password as not being in the correct format,\nit may be necessary to set old_passwords to change the hashing method.\nFor descriptions of the permitted values, see\nhttps://mariadb.com/kb/en/server-system-variables#old_passwords.\n\nWith no FOR user clause, this statement sets the password for the\ncurrent user. (To see which account the server authenticated you as,\ninvoke the CURRENT_USER() function.) Any client who successfully\nconnects to the server using a nonanonymous account can change the\npassword for that account.\n\nWith a FOR user clause, this statement sets the password for the named\nuser. You must have the UPDATE privilege for the mysql database to do\nthis. The user account name uses the format described in\nhttps://mariadb.com/kb/en/create-user#account-names. The user\nvalue should be given as \'user_name\'@\'host_name\', where \'user_name\' and\n\'host_name\' are exactly as listed in the User and Host columns of the\nmysql.user table row. (If you specify only a user name, a host name of\n\'%\' is used.) For example, to set the password for an account with User\nand Host column values of \'bob\' and \'%.example.org\', write the\nstatement like this:\n\nSET PASSWORD FOR \'bob\'@\'%.example.org\' = PASSWORD(\'cleartext password\');\n\nURL: https://mariadb.com/kb/en/set-password/\n\n', '', 'https://mariadb.com/kb/en/set-password/'),
(478, 'ALTER TABLESPACE', 39, 'Syntax:\nALTER TABLESPACE tablespace_name\n    {ADD|DROP} DATAFILE \'file_name\'\n    [INITIAL_SIZE [=] size]\n    [WAIT]\n    ENGINE [=] engine_name\n\nThis statement is used with NDB cluster, which is not supported by MariaDB.\n\nURL: https://mariadb.com/kb/en/alter-tablespace/\n\n', '', 'https://mariadb.com/kb/en/alter-tablespace/'),
(479, 'IF FUNCTION', 7, 'Syntax:\nIF(expr1,expr2,expr3)\n\nIf expr1 is TRUE (expr1 <> 0 and expr1 <> NULL) then IF() returns\nexpr2; otherwise it returns expr3. IF() returns a numeric or string\nvalue, depending on the context in which it is used.\n\nURL: https://mariadb.com/kb/en/if-function/\n\n', 'MariaDB> SELECT IF(1>2,2,3);\n        -> 3\nMariaDB> SELECT IF(1<2,\'yes\',\'no\');\n        -> \'yes\'\nMariaDB> SELECT IF(STRCMP(\'test\',\'test1\'),\'no\',\'yes\');\n        -> \'no\'\n', 'https://mariadb.com/kb/en/if-function/'),
(480, 'ENUM', 22, 'ENUM(\'value1\',\'value2\',...) [CHARACTER SET charset_name] [COLLATE\ncollation_name]\n\nAn enumeration. A string object that can have only one value, chosen\nfrom the list of values \'value1\', \'value2\', ..., NULL or the special \'\'\nerror value. An ENUM column can have a maximum of 65,535 distinct\nvalues. ENUM values are represented internally as integers.\n\nURL: https://mariadb.com/kb/en/enum/\n\n', '', 'https://mariadb.com/kb/en/enum/'),
(481, 'DATABASE', 17, 'Syntax:\nDATABASE()\n\nReturns the default (current) database name as a string in the utf8\ncharacter set. If there is no default database, DATABASE() returns\nNULL. Within a stored routine, the default database is the database\nthat the routine is associated with, which is not necessarily the same\nas the database that is the default in the calling context.\n\nURL: https://mariadb.com/kb/en/database/\n\n', 'MariaDB> SELECT DATABASE();\n        -> \'test\'\n', 'https://mariadb.com/kb/en/database/'),
(482, 'POINTFROMWKB', 32, 'PointFromWKB(wkb[,srid])\n\nConstructs a POINT value using its WKB representation and SRID.\n\nURL: https://mariadb.com/kb/en/pointfromwkb/\n\n', '', 'https://mariadb.com/kb/en/pointfromwkb/'),
(483, 'POWER', 4, 'Syntax:\nPOWER(X,Y)\n\nThis is a synonym for POW().\n\nURL: https://mariadb.com/kb/en/power/\n\n', '', 'https://mariadb.com/kb/en/power/'),
(484, 'ATAN', 4, 'Syntax:\nATAN(X)\n\nReturns the arc tangent of X, that is, the value whose tangent is X.\n\nURL: https://mariadb.com/kb/en/atan/\n\n', 'MariaDB> SELECT ATAN(2);\n        -> 1.1071487177941\nMariaDB> SELECT ATAN(-2);\n        -> -1.1071487177941\n', 'https://mariadb.com/kb/en/atan/'),
(485, 'STRCMP', 37, 'Syntax:\nSTRCMP(expr1,expr2)\n\nSTRCMP() returns 0 if the strings are the same, -1 if the first\nargument is smaller than the second according to the current sort\norder, and 1 otherwise.\n\nURL: https://mariadb.com/kb/en/strcmp/\n\n', 'MariaDB> SELECT STRCMP(\'text\', \'text2\');\n        -> -1\nMariaDB> SELECT STRCMP(\'text2\', \'text\');\n        -> 1\nMariaDB> SELECT STRCMP(\'text\', \'text\');\n        -> 0\n', 'https://mariadb.com/kb/en/strcmp/'),
(486, 'INSERT DELAYED', 27, 'Syntax:\nINSERT DELAYED ...\n\nThe DELAYED option for the INSERT statement is a MySQL extension to\nstandard SQL that is very useful if you have clients that cannot or\nneed not wait for the INSERT to complete. This is a common situation\nwhen you use MySQL for logging and you also periodically run SELECT and\nUPDATE statements that take a long time to complete.\n\nWhen a client uses INSERT DELAYED, it gets an okay from the server at\nonce, and the row is queued to be inserted when the table is not in use\nby any other thread.\n\nAnother major benefit of using INSERT DELAYED is that inserts from many\nclients are bundled together and written in one block. This is much\nfaster than performing many separate inserts.\n\nNote that INSERT DELAYED is slower than a normal INSERT if the table is\nnot otherwise in use. There is also the additional overhead for the\nserver to handle a separate thread for each table for which there are\ndelayed rows. This means that you should use INSERT DELAYED only when\nyou are really sure that you need it.\n\nThe queued rows are held only in memory until they are inserted into\nthe table. This means that if you terminate mysqld forcibly (for\nexample, with kill -9) or if mysqld dies unexpectedly, any queued rows\nthat have not been written to disk are lost.\n\nThere are some constraints on the use of DELAYED:\n\no INSERT DELAYED works only with MyISAM, MEMORY, ARCHIVE, and BLACKHOLE\n  tables. For engines that do not support DELAYED, an error occurs.\n\no An error occurs for INSERT DELAYED if used with a table that has been\n  locked with LOCK TABLES because the insert must be handled by a\n  separate thread, not by the session that holds the lock.\n\no For MyISAM tables, if there are no free blocks in the middle of the\n  data file, concurrent SELECT and INSERT statements are supported.\n  Under these circumstances, you very seldom need to use INSERT DELAYED\n  with MyISAM.\n\no INSERT DELAYED should be used only for INSERT statements that specify\n  value lists. The server ignores DELAYED for INSERT ... SELECT or\n  INSERT ... ON DUPLICATE KEY UPDATE statements.\n\no Because the INSERT DELAYED statement returns immediately, before the\n  rows are inserted, you cannot use LAST_INSERT_ID() to get the\n  AUTO_INCREMENT value that the statement might generate.\n\no DELAYED rows are not visible to SELECT statements until they actually\n  have been inserted.\n\no Prior to MySQL 5.5.7, INSERT DELAYED was treated as a normal INSERT\n  if the statement inserted multiple rows, binary logging was enabled,\n  and the global logging format was statement-based (that is, whenever\n  binlog_format was set to STATEMENT). Beginning with MySQL 5.5.7,\n  INSERT DELAYED is always handled as a simple INSERT (that is, without\n  the DELAYED option) whenever the value of binlog_format is STATEMENT\n  or MIXED. (In the latter case, the statement no longer triggers a\n  switch to row-based logging, and so is logged using the\n  statement-based format.)\n\n  This does not apply when using row-based binary logging mode\n  (binlog_format set to ROW), in which INSERT DELAYED statements are\n  always executed using the DELAYED option as specified, and logged as\n  row-update events.\n\no DELAYED is ignored on slave replication servers, so that INSERT\n  DELAYED is treated as a normal INSERT on slaves. This is because\n  DELAYED could cause the slave to have different data than the master.\n\no Pending INSERT DELAYED statements are lost if a table is write locked\n  and ALTER TABLE is used to modify the table structure.\n\no INSERT DELAYED is not supported for views.\n\no INSERT DELAYED is not supported for partitioned tables.\n\nURL: https://mariadb.com/kb/en/insert-delayed/\n\n', '', 'https://mariadb.com/kb/en/insert-delayed/'),
(487, 'SHOW PROFILE', 26, 'Syntax:\nSHOW PROFILE [type [, type] ... ]\n    [FOR QUERY n]\n    [LIMIT row_count [OFFSET offset]]\n\ntype:\n    ALL\n  | BLOCK IO\n  | CONTEXT SWITCHES\n  | CPU\n  | IPC\n  | MEMORY\n  | PAGE FAULTS\n  | SOURCE\n  | SWAPS\n\nThe SHOW PROFILE and SHOW PROFILES statements display profiling\ninformation that indicates resource usage for statements executed\nduring the course of the current session.\n\nProfiling is controlled by the profiling session variable, which has a\ndefault value of 0 (OFF). Profiling is enabled by setting profiling to\n1 or ON:\n\nMariaDB> SET profiling = 1;\n\nSHOW PROFILES displays a list of the most recent statements sent to the\nserver. The size of the list is controlled by the\nprofiling_history_size session variable, which has a default value of\n15. The maximum value is 100. Setting the value to 0 has the practical\neffect of disabling profiling.\n\nAll statements are profiled except SHOW PROFILE and SHOW PROFILES, so\nyou will find neither of those statements in the profile list.\nMalformed statements are profiled. For example, SHOW PROFILING is an\nillegal statement, and a syntax error occurs if you try to execute it,\nbut it will show up in the profiling list.\n\nSHOW PROFILE displays detailed information about a single statement.\nWithout the FOR QUERY n clause, the output pertains to the most\nrecently executed statement. If FOR QUERY n is included, SHOW PROFILE\ndisplays information for statement n. The values of n correspond to the\nQuery_ID values displayed by SHOW PROFILES.\n\nThe LIMIT row_count clause may be given to limit the output to\nrow_count rows. If LIMIT is given, OFFSET offset may be added to begin\nthe output offset rows into the full set of rows.\n\nBy default, SHOW PROFILE displays Status and Duration columns. The\nStatus values are like the State values displayed by SHOW PROCESSLIST,\nalthough there might be some minor differences in interpretion for the\ntwo statements for some status values (see\nhttp://dev.mysql.com/doc/refman/5.5/en/thread-information.html).\n\nOptional type values may be specified to display specific additional\ntypes of information:\n\no ALL displays all information\n\no BLOCK IO displays counts for block input and output operations\n\no CONTEXT SWITCHES displays counts for voluntary and involuntary\n  context switches\n\no CPU displays user and system CPU usage times\n\no IPC displays counts for messages sent and received\n\no MEMORY is not currently implemented\n\no PAGE FAULTS displays counts for major and minor page faults\n\no SOURCE displays the names of functions from the source code, together\n  with the name and line number of the file in which the function\n  occurs\n\no SWAPS displays swap counts\n\nProfiling is enabled per session. When a session ends, its profiling\ninformation is lost.\n\nURL: https://mariadb.com/kb/en/show-profile/\n\n', 'MariaDB> SELECT @@profiling;\n+-------------+\n| @@profiling |\n+-------------+\n|           0 |\n+-------------+\n1 row in set (0.00 sec)\n\nMariaDB> SET profiling = 1;\nQuery OK, 0 rows affected (0.00 sec)\n\nMariaDB> DROP TABLE IF EXISTS t1;\nQuery OK, 0 rows affected, 1 warning (0.00 sec)\n\nMariaDB> CREATE TABLE T1 (id INT);\nQuery OK, 0 rows affected (0.01 sec)\n\nMariaDB> SHOW PROFILES;\n+----------+----------+--------------------------+\n| Query_ID | Duration | Query                    |\n+----------+----------+--------------------------+\n|        0 | 0.000088 | SET PROFILING = 1        |\n|        1 | 0.000136 | DROP TABLE IF EXISTS t1  |\n|        2 | 0.011947 | CREATE TABLE t1 (id INT) |\n+----------+----------+--------------------------+\n3 rows in set (0.00 sec)\n\nMariaDB> SHOW PROFILE;\n+----------------------+----------+\n| Status               | Duration |\n+----------------------+----------+\n| checking permissions | 0.000040 |\n| creating table       | 0.000056 |\n| After create         | 0.011363 |\n| query end            | 0.000375 |\n| freeing items        | 0.000089 |\n| logging slow query   | 0.000019 |\n| cleaning up          | 0.000005 |\n+----------------------+----------+\n7 rows in set (0.00 sec)\n\nMariaDB> SHOW PROFILE FOR QUERY 1;\n+--------------------+----------+\n| Status             | Duration |\n+--------------------+----------+\n| query end          | 0.000107 |\n| freeing items      | 0.000008 |\n| logging slow query | 0.000015 |\n| cleaning up        | 0.000006 |\n+--------------------+----------+\n4 rows in set (0.00 sec)\n\nMariaDB> SHOW PROFILE CPU FOR QUERY 2;\n+----------------------+----------+----------+------------+\n| Status               | Duration | CPU_user | CPU_system |\n+----------------------+----------+----------+------------+\n| checking permissions | 0.000040 | 0.000038 |   0.000002 |\n| creating table       | 0.000056 | 0.000028 |   0.000028 |\n| After create         | 0.011363 | 0.000217 |   0.001571 |\n| query end            | 0.000375 | 0.000013 |   0.000028 |\n| freeing items        | 0.000089 | 0.000010 |   0.000014 |\n| logging slow query   | 0.000019 | 0.000009 |   0.000010 |\n| cleaning up          | 0.000005 | 0.000003 |   0.000002 |\n+----------------------+----------+----------+------------+\n7 rows in set (0.00 sec)\n', 'https://mariadb.com/kb/en/show-profile/'),
(488, 'SHOW PROCEDURE CODE', 26, 'Syntax:\nSHOW PROCEDURE CODE proc_name\n\nThis statement is a MySQL extension that is available only for servers\nthat have been built with debugging support. It displays a\nrepresentation of the internal implementation of the named stored\nprocedure. A similar statement, SHOW FUNCTION CODE, displays\ninformation about stored functions (see [HELP SHOW FUNCTION CODE]).\n\nBoth statements require that you be the owner of the routine or have\nSELECT access to the mysql.proc table.\n\nIf the named routine is available, each statement produces a result\nset. Each row in the result set corresponds to one \"instruction\" in the\nroutine. The first column is Pos, which is an ordinal number beginning\nwith 0. The second column is Instruction, which contains an SQL\nstatement (usually changed from the original source), or a directive\nwhich has meaning only to the stored-routine handler.\n\nURL: https://mariadb.com/kb/en/show-procedure-code/\n\n', 'MariaDB> DELIMITER //\nMariaDB> CREATE PROCEDURE p1 ()\n    -> BEGIN\n    ->   DECLARE fanta INT DEFAULT 55;\n    ->   DROP TABLE t2;\n    ->   LOOP\n    ->     INSERT INTO t3 VALUES (fanta);\n    ->     END LOOP;\n    ->   END//\nQuery OK, 0 rows affected (0.00 sec)\n\nMariaDB> SHOW PROCEDURE CODE p1//\n+-----+----------------------------------------+\n| Pos | Instruction                            |\n+-----+----------------------------------------+\n|   0 | set fanta@0 55                         |\n|   1 | stmt 9 \"DROP TABLE t2\"                 |\n|   2 | stmt 5 \"INSERT INTO t3 VALUES (fanta)\" |\n|   3 | jump 2                                 |\n+-----+----------------------------------------+\n4 rows in set (0.00 sec)\n', 'https://mariadb.com/kb/en/show-procedure-code/'),
(489, 'MEDIUMTEXT', 22, 'MEDIUMTEXT [CHARACTER SET charset_name] [COLLATE collation_name]\n\nA TEXT column with a maximum length of 16,777,215 (224 - 1) characters.\nThe effective maximum length is less if the value contains multi-byte\ncharacters. Each MEDIUMTEXT value is stored using a 3-byte length\nprefix that indicates the number of bytes in the value.\n\nURL: https://mariadb.com/kb/en/mediumtext/\n\n', '', 'https://mariadb.com/kb/en/mediumtext/'),
(490, 'LN', 4, 'Syntax:\nLN(X)\n\nReturns the natural logarithm of X; that is, the base-e logarithm of X.\nIf X is less than or equal to 0, then NULL is returned.\n\nURL: https://mariadb.com/kb/en/ln/\n\n', 'MariaDB> SELECT LN(2);\n        -> 0.69314718055995\nMariaDB> SELECT LN(-2);\n        -> NULL\n', 'https://mariadb.com/kb/en/ln/'),
(491, 'RETURN', 23, 'Syntax:\nRETURN expr\n\nThe RETURN statement terminates execution of a stored function and\nreturns the value expr to the function caller. There must be at least\none RETURN statement in a stored function. There may be more than one\nif the function has multiple exit points.\n\nThis statement is not used in stored procedures, triggers, or events.\nThe LEAVE statement can be used to exit a stored program of those\ntypes.\n\nURL: https://mariadb.com/kb/en/return/\n\n', '', 'https://mariadb.com/kb/en/return/'),
(492, 'SHOW COLLATION', 26, 'Syntax:\nSHOW COLLATION\n    [LIKE \'pattern\' | WHERE expr]\n\nThis statement lists collations supported by the server. By default,\nthe output from SHOW COLLATION includes all available collations. The\nLIKE clause, if present, indicates which collation names to match. The\nWHERE clause can be given to select rows using more general conditions,\nas discussed in\nhttps://mariadb.com/kb/en/extended-show/. For example:\n\nMariaDB> SHOW COLLATION LIKE \'latin1%\';\n+-------------------+---------+----+---------+----------+---------+\n| Collation         | Charset | Id | Default | Compiled | Sortlen |\n+-------------------+---------+----+---------+----------+---------+\n| latin1_german1_ci | latin1  |  5 |         |          |       0 |\n| latin1_swedish_ci | latin1  |  8 | Yes     | Yes      |       0 |\n| latin1_danish_ci  | latin1  | 15 |         |          |       0 |\n| latin1_german2_ci | latin1  | 31 |         | Yes      |       2 |\n| latin1_bin        | latin1  | 47 |         | Yes      |       0 |\n| latin1_general_ci | latin1  | 48 |         |          |       0 |\n| latin1_general_cs | latin1  | 49 |         |          |       0 |\n| latin1_spanish_ci | latin1  | 94 |         |          |       0 |\n+-------------------+---------+----+---------+----------+---------+\n\nURL: https://mariadb.com/kb/en/show-collation/\n\n', '', 'https://mariadb.com/kb/en/show-collation/'),
(493, 'LOG', 4, 'Syntax:\nLOG(X), LOG(B,X)\n\nIf called with one parameter, this function returns the natural\nlogarithm of X. If X is less than or equal to 0, then NULL is returned.\n\nThe inverse of this function (when called with a single argument) is\nthe EXP() function.\n\nURL: https://mariadb.com/kb/en/log/\n\n', 'MariaDB> SELECT LOG(2);\n        -> 0.69314718055995\nMariaDB> SELECT LOG(-2);\n        -> NULL\n', 'https://mariadb.com/kb/en/log/'),
(494, 'SET SQL_LOG_BIN', 8, 'Syntax:\nSET sql_log_bin = {0|1}\n\nThe sql_log_bin variable controls whether logging to the binary log is\ndone. The default value is 1 (do logging). To change logging for the\ncurrent session, change the session value of this variable. The session\nuser must have the SUPER privilege to set this variable.\n\nBeginning with MySQL 5.5.5, it is no longer possible to set\n@@session.sql_log_bin within a transaction or subquery. (Bug #53437)\n\nURL: https://mariadb.com/kb/en/set-sql_log_bin/\n\n', '', 'https://mariadb.com/kb/en/set-sql_log_bin/'),
(495, '!=', 18, 'Syntax:\n<>, !=\n\nNot equal:\n\nURL: https://mariadb.com/kb/en/not-equal/\n\n', 'MariaDB> SELECT \'.01\' <> \'0.01\';\n        -> 1\nMariaDB> SELECT .01 <> \'0.01\';\n        -> 0\nMariaDB> SELECT \'zapp\' <> \'zappp\';\n        -> 1\n', 'https://mariadb.com/kb/en/not-equal/'),
(496, 'WHILE', 23, 'Syntax:\n[begin_label:] WHILE search_condition DO\n    statement_list\nEND WHILE [end_label]\n\nThe statement list within a WHILE statement is repeated as long as the\nsearch_condition expression is true. statement_list consists of one or\nmore SQL statements, each terminated by a semicolon (;) statement\ndelimiter.\n\nA WHILE statement can be labeled. For the rules regarding label use,\nsee [HELP labels].\n\nURL: https://mariadb.com/kb/en/while/\n\n', 'CREATE PROCEDURE dowhile()\nBEGIN\n  DECLARE v1 INT DEFAULT 5;\n\n  WHILE v1 > 0 DO\n    ...\n    SET v1 = v1 - 1;\n  END WHILE;\nEND;\n', 'https://mariadb.com/kb/en/while/'),
(497, 'AES_DECRYPT', 12, 'Syntax:\nAES_DECRYPT(crypt_str,key_str)\n\nThis function decrypts data using the official AES (Advanced Encryption\nStandard) algorithm. For more information, see the description of\nAES_ENCRYPT().\n\nURL: https://mariadb.com/kb/en/aes_decrypt/\n\n', '', 'https://mariadb.com/kb/en/aes_decrypt/'),
(498, 'DAYNAME', 31, 'Syntax:\nDAYNAME(date)\n\nReturns the name of the weekday for date. The language used for the\nname is controlled by the value of the lc_time_names system variable\n(https://mariadb.com/kb/en/server-system-variables#lc_time_names).\n\nURL: https://mariadb.com/kb/en/dayname/\n\n', 'MariaDB> SELECT DAYNAME(\'2007-02-03\');\n        -> \'Saturday\'\n', 'https://mariadb.com/kb/en/dayname/'),
(499, 'COERCIBILITY', 17, 'Syntax:\nCOERCIBILITY(str)\n\nReturns the collation coercibility value of the string argument.\n\nURL: https://mariadb.com/kb/en/coercibility/\n\n', 'MariaDB> SELECT COERCIBILITY(\'abc\' COLLATE latin1_swedish_ci);\n        -> 0\nMariaDB> SELECT COERCIBILITY(USER());\n        -> 3\nMariaDB> SELECT COERCIBILITY(\'abc\');\n        -> 4\n', 'https://mariadb.com/kb/en/coercibility/'),
(500, 'INT', 22, 'INT[(M)] [UNSIGNED] [ZEROFILL]\n\nA normal-size integer. The signed range is -2147483648 to 2147483647.\nThe unsigned range is 0 to 4294967295.\n\nURL: https://mariadb.com/kb/en/int/\n\n', '', 'https://mariadb.com/kb/en/int/'),
(501, 'GLENGTH', 13, 'GLength(ls)\n\nReturns as a double-precision number the length of the LineString value\nls in its associated spatial reference.\n\nURL: https://mariadb.com/kb/en/glength/\n\n', 'MariaDB> SET @ls = \'LineString(1 1,2 2,3 3)\';\nMariaDB> SELECT GLength(GeomFromText(@ls));\n+----------------------------+\n| GLength(GeomFromText(@ls)) |\n+----------------------------+\n|            2.8284271247462 |\n+----------------------------+\n', 'https://mariadb.com/kb/en/glength/'),
(502, 'RADIANS', 4, 'Syntax:\nRADIANS(X)\n\nReturns the argument X, converted from degrees to radians. (Note that\nπ radians equals 180 degrees.)\n\nURL: https://mariadb.com/kb/en/radians/\n\n', 'MariaDB> SELECT RADIANS(90);\n        -> 1.5707963267949\n', 'https://mariadb.com/kb/en/radians/'),
(503, 'COLLATION', 17, 'Syntax:\nCOLLATION(str)\n\nReturns the collation of the string argument.\n\nURL: https://mariadb.com/kb/en/collation/\n\n', 'MariaDB> SELECT COLLATION(\'abc\');\n        -> \'latin1_swedish_ci\'\nMariaDB> SELECT COLLATION(_utf8\'abc\');\n        -> \'utf8_general_ci\'\n', 'https://mariadb.com/kb/en/collation/'),
(504, 'COALESCE', 18, 'Syntax:\nCOALESCE(value,...)\n\nReturns the first non-NULL value in the list, or NULL if there are no\nnon-NULL values.\n\nURL: https://mariadb.com/kb/en/coalesce/\n\n', 'MariaDB> SELECT COALESCE(NULL,1);\n        -> 1\nMariaDB> SELECT COALESCE(NULL,NULL,NULL);\n        -> NULL\n', 'https://mariadb.com/kb/en/coalesce/'),
(505, 'VERSION', 17, 'Syntax:\nVERSION()\n\nReturns a string that indicates the MySQL server version. The string\nuses the utf8 character set. The value might have a suffix in addition\nto the version number. See the description of the version system\nvariable in\nhttps://mariadb.com/kb/en/server-system-variables#version.\n\nURL: https://mariadb.com/kb/en/version/\n\n', 'MariaDB> SELECT VERSION();\n        -> \'5.5.29-standard\'\n', 'https://mariadb.com/kb/en/version/'),
(506, 'MAKE_SET', 37, 'Syntax:\nMAKE_SET(bits,str1,str2,...)\n\nReturns a set value (a string containing substrings separated by \",\"\ncharacters) consisting of the strings that have the corresponding bit\nin bits set. str1 corresponds to bit 0, str2 to bit 1, and so on. NULL\nvalues in str1, str2, ... are not appended to the result.\n\nURL: https://mariadb.com/kb/en/make_set/\n\n', 'MariaDB> SELECT MAKE_SET(1,\'a\',\'b\',\'c\');\n        -> \'a\'\nMariaDB> SELECT MAKE_SET(1 | 4,\'hello\',\'nice\',\'world\');\n        -> \'hello,world\'\nMariaDB> SELECT MAKE_SET(1 | 4,\'hello\',\'nice\',NULL,\'world\');\n        -> \'hello\'\nMariaDB> SELECT MAKE_SET(0,\'a\',\'b\',\'c\');\n        -> \'\'\n', 'https://mariadb.com/kb/en/make_set/'),
(507, 'FIND_IN_SET', 37, 'Syntax:\nFIND_IN_SET(str,strlist)\n\nReturns a value in the range of 1 to N if the string str is in the\nstring list strlist consisting of N substrings. A string list is a\nstring composed of substrings separated by \",\" characters. If the first\nargument is a constant string and the second is a column of type SET,\nthe FIND_IN_SET() function is optimized to use bit arithmetic. Returns\n0 if str is not in strlist or if strlist is the empty string. Returns\nNULL if either argument is NULL. This function does not work properly\nif the first argument contains a comma (\",\") character.\n\nURL: https://mariadb.com/kb/en/find_in_set/\n\n', 'MariaDB> SELECT FIND_IN_SET(\'b\',\'a,b,c,d\');\n        -> 2\n', 'https://mariadb.com/kb/en/find_in_set/');

-- --------------------------------------------------------

--
-- Table structure for table `host`
--

CREATE TABLE `host` (
  `Host` char(60) NOT NULL DEFAULT '',
  `Db` char(64) NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Host privileges;  Merged with database privileges';

-- --------------------------------------------------------

--
-- Table structure for table `index_stats`
--

CREATE TABLE `index_stats` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `index_name` varchar(64) NOT NULL,
  `prefix_arity` int(11) UNSIGNED NOT NULL,
  `avg_frequency` decimal(12,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Statistics on Indexes';

-- --------------------------------------------------------

--
-- Table structure for table `innodb_index_stats`
--

CREATE TABLE `innodb_index_stats` (
  `database_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `index_name` varchar(64) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `stat_name` varchar(64) NOT NULL,
  `stat_value` bigint(20) UNSIGNED NOT NULL,
  `sample_size` bigint(20) UNSIGNED DEFAULT NULL,
  `stat_description` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `innodb_index_stats`
--

INSERT INTO `innodb_index_stats` (`database_name`, `table_name`, `index_name`, `last_update`, `stat_name`, `stat_value`, `sample_size`, `stat_description`) VALUES
('mysql', 'course', 'PRIMARY', '2025-03-06 17:38:16', 'n_diff_pfx01', 0, 1, 'courseid'),
('mysql', 'course', 'PRIMARY', '2025-03-06 17:38:16', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index'),
('mysql', 'course', 'PRIMARY', '2025-03-06 17:38:16', 'size', 1, NULL, 'Number of pages in the index'),
('mysql', 'faculty', 'PRIMARY', '2025-03-06 16:38:49', 'n_diff_pfx01', 0, 1, 'id'),
('mysql', 'faculty', 'PRIMARY', '2025-03-06 16:38:49', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index'),
('mysql', 'faculty', 'PRIMARY', '2025-03-06 16:38:49', 'size', 1, NULL, 'Number of pages in the index'),
('mysql', 'gtid_slave_pos', 'PRIMARY', '2015-11-24 22:42:49', 'n_diff_pfx01', 0, 1, 'domain_id'),
('mysql', 'gtid_slave_pos', 'PRIMARY', '2015-11-24 22:42:49', 'n_diff_pfx02', 0, 1, 'domain_id,sub_id'),
('mysql', 'gtid_slave_pos', 'PRIMARY', '2015-11-24 22:42:49', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index'),
('mysql', 'gtid_slave_pos', 'PRIMARY', '2015-11-24 22:42:49', 'size', 1, NULL, 'Number of pages in the index'),
('mysql', 'student', 'PRIMARY', '2025-03-06 17:33:06', 'n_diff_pfx01', 0, 1, 'studentid'),
('mysql', 'student', 'PRIMARY', '2025-03-06 17:33:06', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index'),
('mysql', 'student', 'PRIMARY', '2025-03-06 17:33:06', 'size', 1, NULL, 'Number of pages in the index'),
('phpmyadmin', 'pma__bookmark', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx01', 0, 1, 'id'),
('phpmyadmin', 'pma__bookmark', 'PRIMARY', '2015-11-24 22:44:12', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index'),
('phpmyadmin', 'pma__bookmark', 'PRIMARY', '2015-11-24 22:44:12', 'size', 1, NULL, 'Number of pages in the index'),
('phpmyadmin', 'pma__central_columns', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx01', 0, 1, 'db_name'),
('phpmyadmin', 'pma__central_columns', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx02', 0, 1, 'db_name,col_name'),
('phpmyadmin', 'pma__central_columns', 'PRIMARY', '2015-11-24 22:44:12', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index'),
('phpmyadmin', 'pma__central_columns', 'PRIMARY', '2015-11-24 22:44:12', 'size', 1, NULL, 'Number of pages in the index'),
('phpmyadmin', 'pma__column_info', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx01', 0, 1, 'id'),
('phpmyadmin', 'pma__column_info', 'PRIMARY', '2015-11-24 22:44:12', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index'),
('phpmyadmin', 'pma__column_info', 'PRIMARY', '2015-11-24 22:44:12', 'size', 1, NULL, 'Number of pages in the index'),
('phpmyadmin', 'pma__column_info', 'db_name', '2015-11-24 22:44:12', 'n_diff_pfx01', 0, 1, 'db_name'),
('phpmyadmin', 'pma__column_info', 'db_name', '2015-11-24 22:44:12', 'n_diff_pfx02', 0, 1, 'db_name,table_name'),
('phpmyadmin', 'pma__column_info', 'db_name', '2015-11-24 22:44:12', 'n_diff_pfx03', 0, 1, 'db_name,table_name,column_name'),
('phpmyadmin', 'pma__column_info', 'db_name', '2015-11-24 22:44:12', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index'),
('phpmyadmin', 'pma__column_info', 'db_name', '2015-11-24 22:44:12', 'size', 1, NULL, 'Number of pages in the index'),
('phpmyadmin', 'pma__designer_settings', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx01', 0, 1, 'username'),
('phpmyadmin', 'pma__designer_settings', 'PRIMARY', '2015-11-24 22:44:12', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index'),
('phpmyadmin', 'pma__designer_settings', 'PRIMARY', '2015-11-24 22:44:12', 'size', 1, NULL, 'Number of pages in the index'),
('phpmyadmin', 'pma__export_templates', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx01', 0, 1, 'id'),
('phpmyadmin', 'pma__export_templates', 'PRIMARY', '2015-11-24 22:44:12', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index'),
('phpmyadmin', 'pma__export_templates', 'PRIMARY', '2015-11-24 22:44:12', 'size', 1, NULL, 'Number of pages in the index'),
('phpmyadmin', 'pma__export_templates', 'u_user_type_template', '2015-11-24 22:44:12', 'n_diff_pfx01', 0, 1, 'username'),
('phpmyadmin', 'pma__export_templates', 'u_user_type_template', '2015-11-24 22:44:12', 'n_diff_pfx02', 0, 1, 'username,export_type'),
('phpmyadmin', 'pma__export_templates', 'u_user_type_template', '2015-11-24 22:44:12', 'n_diff_pfx03', 0, 1, 'username,export_type,template_name'),
('phpmyadmin', 'pma__export_templates', 'u_user_type_template', '2015-11-24 22:44:12', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index'),
('phpmyadmin', 'pma__export_templates', 'u_user_type_template', '2015-11-24 22:44:12', 'size', 1, NULL, 'Number of pages in the index'),
('phpmyadmin', 'pma__favorite', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx01', 0, 1, 'username'),
('phpmyadmin', 'pma__favorite', 'PRIMARY', '2015-11-24 22:44:12', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index'),
('phpmyadmin', 'pma__favorite', 'PRIMARY', '2015-11-24 22:44:12', 'size', 1, NULL, 'Number of pages in the index'),
('phpmyadmin', 'pma__history', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx01', 0, 1, 'id'),
('phpmyadmin', 'pma__history', 'PRIMARY', '2015-11-24 22:44:12', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index'),
('phpmyadmin', 'pma__history', 'PRIMARY', '2015-11-24 22:44:12', 'size', 1, NULL, 'Number of pages in the index'),
('phpmyadmin', 'pma__history', 'username', '2015-11-24 22:44:12', 'n_diff_pfx01', 0, 1, 'username'),
('phpmyadmin', 'pma__history', 'username', '2015-11-24 22:44:12', 'n_diff_pfx02', 0, 1, 'username,db'),
('phpmyadmin', 'pma__history', 'username', '2015-11-24 22:44:12', 'n_diff_pfx03', 0, 1, 'username,db,table'),
('phpmyadmin', 'pma__history', 'username', '2015-11-24 22:44:12', 'n_diff_pfx04', 0, 1, 'username,db,table,timevalue'),
('phpmyadmin', 'pma__history', 'username', '2015-11-24 22:44:12', 'n_diff_pfx05', 0, 1, 'username,db,table,timevalue,id'),
('phpmyadmin', 'pma__history', 'username', '2015-11-24 22:44:12', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index'),
('phpmyadmin', 'pma__history', 'username', '2015-11-24 22:44:12', 'size', 1, NULL, 'Number of pages in the index'),
('phpmyadmin', 'pma__navigationhiding', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx01', 0, 1, 'username'),
('phpmyadmin', 'pma__navigationhiding', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx02', 0, 1, 'username,item_name'),
('phpmyadmin', 'pma__navigationhiding', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx03', 0, 1, 'username,item_name,item_type'),
('phpmyadmin', 'pma__navigationhiding', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx04', 0, 1, 'username,item_name,item_type,db_name'),
('phpmyadmin', 'pma__navigationhiding', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx05', 0, 1, 'username,item_name,item_type,db_name,table_name'),
('phpmyadmin', 'pma__navigationhiding', 'PRIMARY', '2015-11-24 22:44:12', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index'),
('phpmyadmin', 'pma__navigationhiding', 'PRIMARY', '2015-11-24 22:44:12', 'size', 1, NULL, 'Number of pages in the index'),
('phpmyadmin', 'pma__pdf_pages', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx01', 0, 1, 'page_nr'),
('phpmyadmin', 'pma__pdf_pages', 'PRIMARY', '2015-11-24 22:44:12', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index'),
('phpmyadmin', 'pma__pdf_pages', 'PRIMARY', '2015-11-24 22:44:12', 'size', 1, NULL, 'Number of pages in the index'),
('phpmyadmin', 'pma__pdf_pages', 'db_name', '2015-11-24 22:44:12', 'n_diff_pfx01', 0, 1, 'db_name'),
('phpmyadmin', 'pma__pdf_pages', 'db_name', '2015-11-24 22:44:12', 'n_diff_pfx02', 0, 1, 'db_name,page_nr'),
('phpmyadmin', 'pma__pdf_pages', 'db_name', '2015-11-24 22:44:12', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index'),
('phpmyadmin', 'pma__pdf_pages', 'db_name', '2015-11-24 22:44:12', 'size', 1, NULL, 'Number of pages in the index'),
('phpmyadmin', 'pma__recent', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx01', 0, 1, 'username'),
('phpmyadmin', 'pma__recent', 'PRIMARY', '2015-11-24 22:44:12', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index'),
('phpmyadmin', 'pma__recent', 'PRIMARY', '2015-11-24 22:44:12', 'size', 1, NULL, 'Number of pages in the index'),
('phpmyadmin', 'pma__relation', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx01', 0, 1, 'master_db'),
('phpmyadmin', 'pma__relation', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx02', 0, 1, 'master_db,master_table'),
('phpmyadmin', 'pma__relation', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx03', 0, 1, 'master_db,master_table,master_field'),
('phpmyadmin', 'pma__relation', 'PRIMARY', '2015-11-24 22:44:12', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index'),
('phpmyadmin', 'pma__relation', 'PRIMARY', '2015-11-24 22:44:12', 'size', 1, NULL, 'Number of pages in the index'),
('phpmyadmin', 'pma__relation', 'foreign_field', '2015-11-24 22:44:12', 'n_diff_pfx01', 0, 1, 'foreign_db'),
('phpmyadmin', 'pma__relation', 'foreign_field', '2015-11-24 22:44:12', 'n_diff_pfx02', 0, 1, 'foreign_db,foreign_table'),
('phpmyadmin', 'pma__relation', 'foreign_field', '2015-11-24 22:44:12', 'n_diff_pfx03', 0, 1, 'foreign_db,foreign_table,master_db'),
('phpmyadmin', 'pma__relation', 'foreign_field', '2015-11-24 22:44:12', 'n_diff_pfx04', 0, 1, 'foreign_db,foreign_table,master_db,master_table'),
('phpmyadmin', 'pma__relation', 'foreign_field', '2015-11-24 22:44:12', 'n_diff_pfx05', 0, 1, 'foreign_db,foreign_table,master_db,master_table,master_field'),
('phpmyadmin', 'pma__relation', 'foreign_field', '2015-11-24 22:44:12', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index'),
('phpmyadmin', 'pma__relation', 'foreign_field', '2015-11-24 22:44:12', 'size', 1, NULL, 'Number of pages in the index'),
('phpmyadmin', 'pma__savedsearches', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx01', 0, 1, 'id'),
('phpmyadmin', 'pma__savedsearches', 'PRIMARY', '2015-11-24 22:44:12', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index'),
('phpmyadmin', 'pma__savedsearches', 'PRIMARY', '2015-11-24 22:44:12', 'size', 1, NULL, 'Number of pages in the index'),
('phpmyadmin', 'pma__savedsearches', 'u_savedsearches_username_dbname', '2015-11-24 22:44:12', 'n_diff_pfx01', 0, 1, 'username'),
('phpmyadmin', 'pma__savedsearches', 'u_savedsearches_username_dbname', '2015-11-24 22:44:12', 'n_diff_pfx02', 0, 1, 'username,db_name'),
('phpmyadmin', 'pma__savedsearches', 'u_savedsearches_username_dbname', '2015-11-24 22:44:12', 'n_diff_pfx03', 0, 1, 'username,db_name,search_name'),
('phpmyadmin', 'pma__savedsearches', 'u_savedsearches_username_dbname', '2015-11-24 22:44:12', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index'),
('phpmyadmin', 'pma__savedsearches', 'u_savedsearches_username_dbname', '2015-11-24 22:44:12', 'size', 1, NULL, 'Number of pages in the index'),
('phpmyadmin', 'pma__table_coords', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx01', 0, 1, 'db_name'),
('phpmyadmin', 'pma__table_coords', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx02', 0, 1, 'db_name,table_name'),
('phpmyadmin', 'pma__table_coords', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx03', 0, 1, 'db_name,table_name,pdf_page_number'),
('phpmyadmin', 'pma__table_coords', 'PRIMARY', '2015-11-24 22:44:12', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index'),
('phpmyadmin', 'pma__table_coords', 'PRIMARY', '2015-11-24 22:44:12', 'size', 1, NULL, 'Number of pages in the index'),
('phpmyadmin', 'pma__table_info', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx01', 0, 1, 'db_name'),
('phpmyadmin', 'pma__table_info', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx02', 0, 1, 'db_name,table_name'),
('phpmyadmin', 'pma__table_info', 'PRIMARY', '2015-11-24 22:44:12', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index'),
('phpmyadmin', 'pma__table_info', 'PRIMARY', '2015-11-24 22:44:12', 'size', 1, NULL, 'Number of pages in the index'),
('phpmyadmin', 'pma__table_uiprefs', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx01', 0, 1, 'username'),
('phpmyadmin', 'pma__table_uiprefs', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx02', 0, 1, 'username,db_name'),
('phpmyadmin', 'pma__table_uiprefs', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx03', 0, 1, 'username,db_name,table_name'),
('phpmyadmin', 'pma__table_uiprefs', 'PRIMARY', '2015-11-24 22:44:12', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index'),
('phpmyadmin', 'pma__table_uiprefs', 'PRIMARY', '2015-11-24 22:44:12', 'size', 1, NULL, 'Number of pages in the index'),
('phpmyadmin', 'pma__tracking', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx01', 0, 1, 'db_name'),
('phpmyadmin', 'pma__tracking', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx02', 0, 1, 'db_name,table_name'),
('phpmyadmin', 'pma__tracking', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx03', 0, 1, 'db_name,table_name,version'),
('phpmyadmin', 'pma__tracking', 'PRIMARY', '2015-11-24 22:44:12', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index'),
('phpmyadmin', 'pma__tracking', 'PRIMARY', '2015-11-24 22:44:12', 'size', 1, NULL, 'Number of pages in the index'),
('phpmyadmin', 'pma__userconfig', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx01', 0, 1, 'username'),
('phpmyadmin', 'pma__userconfig', 'PRIMARY', '2015-11-24 22:44:12', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index'),
('phpmyadmin', 'pma__userconfig', 'PRIMARY', '2015-11-24 22:44:12', 'size', 1, NULL, 'Number of pages in the index'),
('phpmyadmin', 'pma__usergroups', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx01', 0, 1, 'usergroup'),
('phpmyadmin', 'pma__usergroups', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx02', 0, 1, 'usergroup,tab'),
('phpmyadmin', 'pma__usergroups', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx03', 0, 1, 'usergroup,tab,allowed'),
('phpmyadmin', 'pma__usergroups', 'PRIMARY', '2015-11-24 22:44:12', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index'),
('phpmyadmin', 'pma__usergroups', 'PRIMARY', '2015-11-24 22:44:12', 'size', 1, NULL, 'Number of pages in the index'),
('phpmyadmin', 'pma__users', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx01', 0, 1, 'username'),
('phpmyadmin', 'pma__users', 'PRIMARY', '2015-11-24 22:44:12', 'n_diff_pfx02', 0, 1, 'username,usergroup'),
('phpmyadmin', 'pma__users', 'PRIMARY', '2015-11-24 22:44:12', 'n_leaf_pages', 1, NULL, 'Number of leaf pages in the index'),
('phpmyadmin', 'pma__users', 'PRIMARY', '2015-11-24 22:44:12', 'size', 1, NULL, 'Number of pages in the index');

-- --------------------------------------------------------

--
-- Table structure for table `innodb_table_stats`
--

CREATE TABLE `innodb_table_stats` (
  `database_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `n_rows` bigint(20) UNSIGNED NOT NULL,
  `clustered_index_size` bigint(20) UNSIGNED NOT NULL,
  `sum_of_other_index_sizes` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `innodb_table_stats`
--

INSERT INTO `innodb_table_stats` (`database_name`, `table_name`, `last_update`, `n_rows`, `clustered_index_size`, `sum_of_other_index_sizes`) VALUES
('mysql', 'course', '2025-03-06 17:38:16', 0, 1, 0),
('mysql', 'faculty', '2025-03-06 16:38:49', 0, 1, 0),
('mysql', 'gtid_slave_pos', '2015-11-24 22:42:49', 0, 1, 0),
('mysql', 'student', '2025-03-06 17:33:06', 0, 1, 0),
('phpmyadmin', 'pma__bookmark', '2015-11-24 22:44:12', 0, 1, 0),
('phpmyadmin', 'pma__central_columns', '2015-11-24 22:44:12', 0, 1, 0),
('phpmyadmin', 'pma__column_info', '2015-11-24 22:44:12', 0, 1, 1),
('phpmyadmin', 'pma__designer_settings', '2015-11-24 22:44:12', 0, 1, 0),
('phpmyadmin', 'pma__export_templates', '2015-11-24 22:44:12', 0, 1, 1),
('phpmyadmin', 'pma__favorite', '2015-11-24 22:44:12', 0, 1, 0),
('phpmyadmin', 'pma__history', '2015-11-24 22:44:12', 0, 1, 1),
('phpmyadmin', 'pma__navigationhiding', '2015-11-24 22:44:12', 0, 1, 0),
('phpmyadmin', 'pma__pdf_pages', '2015-11-24 22:44:12', 0, 1, 1),
('phpmyadmin', 'pma__recent', '2015-11-24 22:44:12', 0, 1, 0),
('phpmyadmin', 'pma__relation', '2015-11-24 22:44:12', 0, 1, 1),
('phpmyadmin', 'pma__savedsearches', '2015-11-24 22:44:12', 0, 1, 1),
('phpmyadmin', 'pma__table_coords', '2015-11-24 22:44:12', 0, 1, 0),
('phpmyadmin', 'pma__table_info', '2015-11-24 22:44:12', 0, 1, 0),
('phpmyadmin', 'pma__table_uiprefs', '2015-11-24 22:44:12', 0, 1, 0),
('phpmyadmin', 'pma__tracking', '2015-11-24 22:44:12', 0, 1, 0),
('phpmyadmin', 'pma__userconfig', '2015-11-24 22:44:12', 0, 1, 0),
('phpmyadmin', 'pma__usergroups', '2015-11-24 22:44:12', 0, 1, 0),
('phpmyadmin', 'pma__users', '2015-11-24 22:44:12', 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Login`
--

CREATE TABLE `Login` (
  `userid` bigint(20) NOT NULL,
  `username` varchar(300) NOT NULL,
  `password` varchar(15) NOT NULL,
  `role` varchar(50) NOT NULL,
  `isactive` binary(2) NOT NULL DEFAULT '\0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Major`
--

CREATE TABLE `Major` (
  `majorid` bigint(20) NOT NULL,
  `majordesc` varchar(400) NOT NULL,
  `minordesc` varchar(400) NOT NULL,
  `orderby` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plugin`
--

CREATE TABLE `plugin` (
  `name` varchar(64) NOT NULL DEFAULT '',
  `dl` varchar(128) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='MySQL plugins';

-- --------------------------------------------------------

--
-- Table structure for table `proc`
--

CREATE TABLE `proc` (
  `db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` char(64) NOT NULL DEFAULT '',
  `type` enum('FUNCTION','PROCEDURE') NOT NULL,
  `specific_name` char(64) NOT NULL DEFAULT '',
  `language` enum('SQL') NOT NULL DEFAULT 'SQL',
  `sql_data_access` enum('CONTAINS_SQL','NO_SQL','READS_SQL_DATA','MODIFIES_SQL_DATA') NOT NULL DEFAULT 'CONTAINS_SQL',
  `is_deterministic` enum('YES','NO') NOT NULL DEFAULT 'NO',
  `security_type` enum('INVOKER','DEFINER') NOT NULL DEFAULT 'DEFINER',
  `param_list` blob NOT NULL,
  `returns` longblob NOT NULL,
  `body` longblob NOT NULL,
  `definer` char(141) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','IGNORE_BAD_TABLE_OPTIONS','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') NOT NULL DEFAULT '',
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `character_set_client` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `collation_connection` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `db_collation` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `body_utf8` longblob DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Stored Procedures';

--
-- Dumping data for table `proc`
--

INSERT INTO `proc` (`db`, `name`, `type`, `specific_name`, `language`, `sql_data_access`, `is_deterministic`, `security_type`, `param_list`, `returns`, `body`, `definer`, `created`, `modified`, `sql_mode`, `comment`, `character_set_client`, `collation_connection`, `db_collation`, `body_utf8`) VALUES
('test', 'AddGeometryColumn', 'PROCEDURE', 'AddGeometryColumn', 'SQL', 'CONTAINS_SQL', 'NO', 'DEFINER', 0x636174616c6f672076617263686172283634292c20745f736368656d612076617263686172283634292c0a202020745f6e616d652076617263686172283634292c2067656f6d657472795f636f6c756d6e2076617263686172283634292c20745f7372696420696e74, '', 0x626567696e0a202073657420407177653d20636f6e6361742827414c544552205441424c4520272c20745f736368656d612c20272e272c20745f6e616d652c20272041444420272c2067656f6d657472795f636f6c756d6e2c272047454f4d45545259205245465f53595354454d5f49443d272c20745f73726964293b2050524550415245206c732066726f6d20407177653b2065786563757465206c733b206465616c6c6f636174652070726570617265206c733b20656e64, '@', '2015-11-24 22:42:53', '2015-11-24 22:42:53', '', '', 'latin1', 'latin1_swedish_ci', 'latin1_swedish_ci', 0x626567696e0a202073657420407177653d20636f6e6361742827414c544552205441424c4520272c20745f736368656d612c20272e272c20745f6e616d652c20272041444420272c2067656f6d657472795f636f6c756d6e2c272047454f4d45545259205245465f53595354454d5f49443d272c20745f73726964293b2050524550415245206c732066726f6d20407177653b2065786563757465206c733b206465616c6c6f636174652070726570617265206c733b20656e64),
('test', 'DropGeometryColumn', 'PROCEDURE', 'DropGeometryColumn', 'SQL', 'CONTAINS_SQL', 'NO', 'DEFINER', 0x636174616c6f672076617263686172283634292c20745f736368656d612076617263686172283634292c0a202020745f6e616d652076617263686172283634292c2067656f6d657472795f636f6c756d6e207661726368617228363429, '', 0x626567696e0a202073657420407177653d20636f6e6361742827414c544552205441424c4520272c20745f736368656d612c20272e272c20745f6e616d652c20272044524f5020272c2067656f6d657472795f636f6c756d6e293b2050524550415245206c732066726f6d20407177653b2065786563757465206c733b206465616c6c6f636174652070726570617265206c733b20656e64, '@', '2015-11-24 22:42:53', '2015-11-24 22:42:53', '', '', 'latin1', 'latin1_swedish_ci', 'latin1_swedish_ci', 0x626567696e0a202073657420407177653d20636f6e6361742827414c544552205441424c4520272c20745f736368656d612c20272e272c20745f6e616d652c20272044524f5020272c2067656f6d657472795f636f6c756d6e293b2050524550415245206c732066726f6d20407177653b2065786563757465206c733b206465616c6c6f636174652070726570617265206c733b20656e64);

-- --------------------------------------------------------

--
-- Table structure for table `procs_priv`
--

CREATE TABLE `procs_priv` (
  `Host` char(60) NOT NULL DEFAULT '',
  `Db` char(64) NOT NULL DEFAULT '',
  `User` char(80) NOT NULL DEFAULT '',
  `Routine_name` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Routine_type` enum('FUNCTION','PROCEDURE') NOT NULL,
  `Grantor` char(141) NOT NULL DEFAULT '',
  `Proc_priv` set('Execute','Alter Routine','Grant') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Procedure privileges';

-- --------------------------------------------------------

--
-- Table structure for table `proxies_priv`
--

CREATE TABLE `proxies_priv` (
  `Host` char(60) NOT NULL DEFAULT '',
  `User` char(80) NOT NULL DEFAULT '',
  `Proxied_host` char(60) NOT NULL DEFAULT '',
  `Proxied_user` char(80) NOT NULL DEFAULT '',
  `With_grant` tinyint(1) NOT NULL DEFAULT 0,
  `Grantor` char(141) NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User proxy privileges';

--
-- Dumping data for table `proxies_priv`
--

INSERT INTO `proxies_priv` (`Host`, `User`, `Proxied_host`, `Proxied_user`, `With_grant`, `Grantor`, `Timestamp`) VALUES
('localhost', 'root', '', '', 1, '', '2015-11-24 22:42:49');

-- --------------------------------------------------------

--
-- Table structure for table `roles_mapping`
--

CREATE TABLE `roles_mapping` (
  `Host` char(60) NOT NULL DEFAULT '',
  `User` char(80) NOT NULL DEFAULT '',
  `Role` char(80) NOT NULL DEFAULT '',
  `Admin_option` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Granted roles';

-- --------------------------------------------------------

--
-- Table structure for table `servers`
--

CREATE TABLE `servers` (
  `Server_name` char(64) NOT NULL DEFAULT '',
  `Host` char(64) NOT NULL DEFAULT '',
  `Db` char(64) NOT NULL DEFAULT '',
  `Username` char(80) NOT NULL DEFAULT '',
  `Password` char(64) NOT NULL DEFAULT '',
  `Port` int(4) NOT NULL DEFAULT 0,
  `Socket` char(64) NOT NULL DEFAULT '',
  `Wrapper` char(64) NOT NULL DEFAULT '',
  `Owner` char(64) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='MySQL Foreign Servers table';

-- --------------------------------------------------------

--
-- Table structure for table `slow_log`
--

CREATE TABLE `slow_log` (
  `start_time` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `user_host` mediumtext NOT NULL,
  `query_time` time(6) NOT NULL,
  `lock_time` time(6) NOT NULL,
  `rows_sent` int(11) NOT NULL,
  `rows_examined` int(11) NOT NULL,
  `db` varchar(512) NOT NULL,
  `last_insert_id` int(11) NOT NULL,
  `insert_id` int(11) NOT NULL,
  `server_id` int(10) UNSIGNED NOT NULL,
  `sql_text` mediumtext NOT NULL,
  `thread_id` bigint(21) UNSIGNED NOT NULL,
  `rows_affected` int(11) NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Slow log';

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE `Student` (
  `studentid` bigint(20) NOT NULL,
  `firstname` varchar(150) NOT NULL,
  `lastname` varchar(150) NOT NULL,
  `email` varchar(300) NOT NULL,
  `classification` varchar(20) NOT NULL,
  `degree` varchar(50) NOT NULL,
  `major` varchar(150) NOT NULL,
  `minor` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='This table will hold the students data.';

-- --------------------------------------------------------

--
-- Table structure for table `tables_priv`
--

CREATE TABLE `tables_priv` (
  `Host` char(60) NOT NULL DEFAULT '',
  `Db` char(64) NOT NULL DEFAULT '',
  `User` char(80) NOT NULL DEFAULT '',
  `Table_name` char(64) NOT NULL DEFAULT '',
  `Grantor` char(141) NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Table_priv` set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view','Trigger') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table privileges';

-- --------------------------------------------------------

--
-- Table structure for table `table_stats`
--

CREATE TABLE `table_stats` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `cardinality` bigint(21) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Statistics on Tables';

-- --------------------------------------------------------

--
-- Table structure for table `time_zone`
--

CREATE TABLE `time_zone` (
  `Time_zone_id` int(10) UNSIGNED NOT NULL,
  `Use_leap_seconds` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Time zones';

-- --------------------------------------------------------

--
-- Table structure for table `time_zone_leap_second`
--

CREATE TABLE `time_zone_leap_second` (
  `Transition_time` bigint(20) NOT NULL,
  `Correction` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Leap seconds information for time zones';

-- --------------------------------------------------------

--
-- Table structure for table `time_zone_name`
--

CREATE TABLE `time_zone_name` (
  `Name` char(64) NOT NULL,
  `Time_zone_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Time zone names';

-- --------------------------------------------------------

--
-- Table structure for table `time_zone_transition`
--

CREATE TABLE `time_zone_transition` (
  `Time_zone_id` int(10) UNSIGNED NOT NULL,
  `Transition_time` bigint(20) NOT NULL,
  `Transition_type_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Time zone transitions';

-- --------------------------------------------------------

--
-- Table structure for table `time_zone_transition_type`
--

CREATE TABLE `time_zone_transition_type` (
  `Time_zone_id` int(10) UNSIGNED NOT NULL,
  `Transition_type_id` int(10) UNSIGNED NOT NULL,
  `Offset` int(11) NOT NULL DEFAULT 0,
  `Is_DST` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `Abbreviation` char(8) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Time zone transition types';

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Host` char(60) NOT NULL DEFAULT '',
  `User` char(80) NOT NULL DEFAULT '',
  `Password` char(41) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Reload_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Shutdown_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Process_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `File_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Show_db_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Super_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Repl_slave_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Repl_client_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_user_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_tablespace_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `ssl_type` enum('','ANY','X509','SPECIFIED') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `ssl_cipher` blob NOT NULL,
  `x509_issuer` blob NOT NULL,
  `x509_subject` blob NOT NULL,
  `max_questions` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `max_updates` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `max_connections` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `max_user_connections` int(11) NOT NULL DEFAULT 0,
  `plugin` char(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `authentication_string` text NOT NULL,
  `password_expired` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `is_role` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `default_role` char(80) NOT NULL DEFAULT '',
  `max_statement_time` decimal(12,6) NOT NULL DEFAULT 0.000000
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and global privileges';

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Host`, `User`, `Password`, `Select_priv`, `Insert_priv`, `Update_priv`, `Delete_priv`, `Create_priv`, `Drop_priv`, `Reload_priv`, `Shutdown_priv`, `Process_priv`, `File_priv`, `Grant_priv`, `References_priv`, `Index_priv`, `Alter_priv`, `Show_db_priv`, `Super_priv`, `Create_tmp_table_priv`, `Lock_tables_priv`, `Execute_priv`, `Repl_slave_priv`, `Repl_client_priv`, `Create_view_priv`, `Show_view_priv`, `Create_routine_priv`, `Alter_routine_priv`, `Create_user_priv`, `Event_priv`, `Trigger_priv`, `Create_tablespace_priv`, `ssl_type`, `ssl_cipher`, `x509_issuer`, `x509_subject`, `max_questions`, `max_updates`, `max_connections`, `max_user_connections`, `plugin`, `authentication_string`, `password_expired`, `is_role`, `default_role`, `max_statement_time`) VALUES
('localhost', 'root', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', '', '', '', 0, 0, 0, 0, '', '', 'N', 'N', '', 0.000000),
('127.0.0.1', 'root', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', '', '', '', 0, 0, 0, 0, '', '', 'N', 'N', '', 0.000000),
('::1', 'root', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', '', '', '', 0, 0, 0, 0, '', '', 'N', 'N', '', 0.000000),
('localhost', '', '', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', '', '', '', '', 0, 0, 0, 0, '', '', 'N', 'N', '', 0.000000),
('localhost', 'pma', '', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', '', '', '', '', 0, 0, 0, 0, '', '', 'N', 'N', '', 0.000000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `columns_priv`
--
ALTER TABLE `columns_priv`
  ADD PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`,`Column_name`);

--
-- Indexes for table `column_stats`
--
ALTER TABLE `column_stats`
  ADD PRIMARY KEY (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `Course`
--
ALTER TABLE `Course`
  ADD PRIMARY KEY (`courseid`);

--
-- Indexes for table `db`
--
ALTER TABLE `db`
  ADD PRIMARY KEY (`Host`,`Db`,`User`),
  ADD KEY `User` (`User`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`db`,`name`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `func`
--
ALTER TABLE `func`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `gtid_slave_pos`
--
ALTER TABLE `gtid_slave_pos`
  ADD PRIMARY KEY (`domain_id`,`sub_id`);

--
-- Indexes for table `help_category`
--
ALTER TABLE `help_category`
  ADD PRIMARY KEY (`help_category_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `help_keyword`
--
ALTER TABLE `help_keyword`
  ADD PRIMARY KEY (`help_keyword_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `help_relation`
--
ALTER TABLE `help_relation`
  ADD PRIMARY KEY (`help_keyword_id`,`help_topic_id`);

--
-- Indexes for table `help_topic`
--
ALTER TABLE `help_topic`
  ADD PRIMARY KEY (`help_topic_id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `host`
--
ALTER TABLE `host`
  ADD PRIMARY KEY (`Host`,`Db`);

--
-- Indexes for table `index_stats`
--
ALTER TABLE `index_stats`
  ADD PRIMARY KEY (`db_name`,`table_name`,`index_name`,`prefix_arity`);

--
-- Indexes for table `innodb_index_stats`
--
ALTER TABLE `innodb_index_stats`
  ADD PRIMARY KEY (`database_name`,`table_name`,`index_name`,`stat_name`);

--
-- Indexes for table `innodb_table_stats`
--
ALTER TABLE `innodb_table_stats`
  ADD PRIMARY KEY (`database_name`,`table_name`);

--
-- Indexes for table `Login`
--
ALTER TABLE `Login`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `Major`
--
ALTER TABLE `Major`
  ADD PRIMARY KEY (`majorid`);

--
-- Indexes for table `plugin`
--
ALTER TABLE `plugin`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `proc`
--
ALTER TABLE `proc`
  ADD PRIMARY KEY (`db`,`name`,`type`);

--
-- Indexes for table `procs_priv`
--
ALTER TABLE `procs_priv`
  ADD PRIMARY KEY (`Host`,`Db`,`User`,`Routine_name`,`Routine_type`),
  ADD KEY `Grantor` (`Grantor`);

--
-- Indexes for table `proxies_priv`
--
ALTER TABLE `proxies_priv`
  ADD PRIMARY KEY (`Host`,`User`,`Proxied_host`,`Proxied_user`),
  ADD KEY `Grantor` (`Grantor`);

--
-- Indexes for table `roles_mapping`
--
ALTER TABLE `roles_mapping`
  ADD UNIQUE KEY `Host` (`Host`,`User`,`Role`);

--
-- Indexes for table `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`Server_name`);

--
-- Indexes for table `Student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`studentid`);

--
-- Indexes for table `tables_priv`
--
ALTER TABLE `tables_priv`
  ADD PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`),
  ADD KEY `Grantor` (`Grantor`);

--
-- Indexes for table `table_stats`
--
ALTER TABLE `table_stats`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `time_zone`
--
ALTER TABLE `time_zone`
  ADD PRIMARY KEY (`Time_zone_id`);

--
-- Indexes for table `time_zone_leap_second`
--
ALTER TABLE `time_zone_leap_second`
  ADD PRIMARY KEY (`Transition_time`);

--
-- Indexes for table `time_zone_name`
--
ALTER TABLE `time_zone_name`
  ADD PRIMARY KEY (`Name`);

--
-- Indexes for table `time_zone_transition`
--
ALTER TABLE `time_zone_transition`
  ADD PRIMARY KEY (`Time_zone_id`,`Transition_time`);

--
-- Indexes for table `time_zone_transition_type`
--
ALTER TABLE `time_zone_transition_type`
  ADD PRIMARY KEY (`Time_zone_id`,`Transition_type_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Host`,`User`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Course`
--
ALTER TABLE `Course`
  MODIFY `courseid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Login`
--
ALTER TABLE `Login`
  MODIFY `userid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Major`
--
ALTER TABLE `Major`
  MODIFY `majorid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time_zone`
--
ALTER TABLE `time_zone`
  MODIFY `Time_zone_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
