-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost
-- 生成日時: 2022-09-22 02:37:30
-- サーバのバージョン： 10.4.22-MariaDB
-- PHP のバージョン: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `kihonjouhou`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `jenre`
--

CREATE TABLE `jenre` (
  `id` int(11) NOT NULL,
  `jenre_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `jenre`
--

INSERT INTO `jenre` (`id`, `jenre_name`) VALUES
(1, 'データ構造'),
(2, 'ソフトウェア'),
(3, 'コンピュータ構成要素'),
(4, '企業活動'),
(5, 'セキュリティ'),
(6, 'マルチメディア'),
(7, 'ネットワーク'),
(8, 'プロジェクトマネジメント'),
(9, 'データベース'),
(10, 'システム構成要素');

-- --------------------------------------------------------

--
-- テーブルの構造 `tango`
--

CREATE TABLE `tango` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `meaning` varchar(255) NOT NULL,
  `jenre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `tango`
--

INSERT INTO `tango` (`id`, `name`, `keyword`, `meaning`, `jenre_id`) VALUES
(1, 'スループット', 'プリンタ', '単位当たりの仕事量', 10),
(2, 'スタック(LIFO)', 'null', '後入れ先出しのデータ構造\r\nPＵＳＨ命令とＰＯＰ命令によって操作', 1),
(3, 'シノニム', 'ハッシュ探索法\r\n', '格納先のアドレスが衝突すること\r\n', 1),
(4, 'シノニム', '直接編成ファイル', 'キー返還によって求めた格納アドレスが同じになること', 2),
(5, 'メモリインタリーブ', '連続したメモリへのアクセスを高速化', '物理量は1つの主記憶領域を論理的な複数の領域に分けて並列アクセスすること', 3),
(6, 'ワークシェアリング', '勤務時間短縮、仕事配分の見直し', '従業員一人当たりの労働時間を短縮したりする方法', 4);

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `jenre`
--
ALTER TABLE `jenre`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `tango`
--
ALTER TABLE `tango`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `jenre`
--
ALTER TABLE `jenre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- テーブルの AUTO_INCREMENT `tango`
--
ALTER TABLE `tango`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
