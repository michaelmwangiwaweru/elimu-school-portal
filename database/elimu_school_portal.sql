-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2026 at 02:28 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elimu school portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_announcements`
--

CREATE TABLE `tbl_announcements` (
  `id` int(11) NOT NULL,
  `title` varchar(90) NOT NULL,
  `announcement` longtext NOT NULL,
  `create_date` datetime NOT NULL,
  `level` int(11) NOT NULL COMMENT '0 = Teachers, 1 = Student, 2 = Both'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_announcements`
--

INSERT INTO `tbl_announcements` (`id`, `title`, `announcement`, `create_date`, `level`) VALUES
(3, 'reporting date', '<p>we shall resume our classes on 31,may 2026 kindly note that</p>', '2026-03-24 12:50:32', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_classes`
--

CREATE TABLE `tbl_classes` (
  `id` int(11) NOT NULL,
  `name` varchar(90) NOT NULL,
  `registration_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_classes`
--

INSERT INTO `tbl_classes` (`id`, `name`, `registration_date`) VALUES
(11, 'Form four 2026', '2026-03-25 18:03:35'),
(12, 'Form three 2026', '2026-03-25 18:03:56'),
(13, 'Grade 10, 2026', '2026-03-25 18:04:43');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_division_system`
--

CREATE TABLE `tbl_division_system` (
  `division` varchar(50) NOT NULL,
  `min` int(11) NOT NULL,
  `max` int(11) NOT NULL,
  `min_point` int(11) NOT NULL,
  `max_point` int(11) NOT NULL,
  `points` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_division_system`
--

INSERT INTO `tbl_division_system` (`division`, `min`, `max`, `min_point`, `max_point`, `points`) VALUES
('0', 0, 29, 34, 35, 5),
('1', 75, 100, 7, 17, 1),
('2', 65, 74, 18, 21, 2),
('3', 45, 64, 22, 25, 3),
('4', 30, 44, 26, 33, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_exam_results`
--

CREATE TABLE `tbl_exam_results` (
  `id` int(11) NOT NULL,
  `student` varchar(20) NOT NULL,
  `class` int(11) NOT NULL,
  `subject_combination` int(11) NOT NULL,
  `term` int(11) NOT NULL,
  `score` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_exam_results`
--

INSERT INTO `tbl_exam_results` (`id`, `student`, `class`, `subject_combination`, `term`, `score`) VALUES
(87, 'REG2026017', 13, 21, 2, 80),
(88, 'REG2026017', 13, 22, 2, 44),
(89, 'REG2026017', 13, 23, 2, 67),
(90, 'REG2026017', 13, 24, 2, 65),
(91, 'REG2026017', 13, 25, 2, 86),
(92, 'REG2026017', 13, 26, 2, 78),
(93, 'REG2026017', 13, 27, 2, 90),
(94, 'REG2026017', 13, 28, 2, 88),
(95, 'REG202631', 13, 21, 2, 80),
(96, 'REG202631', 13, 22, 2, 78),
(97, 'REG202631', 13, 23, 2, 67),
(98, 'REG202631', 13, 24, 2, 68),
(99, 'REG202631', 13, 25, 2, 84),
(100, 'REG202631', 13, 26, 2, 82),
(101, 'REG202631', 13, 27, 2, 90),
(102, 'REG202631', 13, 28, 2, 50);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_grade_system`
--

CREATE TABLE `tbl_grade_system` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `min` double NOT NULL,
  `max` double NOT NULL,
  `remark` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_grade_system`
--

INSERT INTO `tbl_grade_system` (`id`, `name`, `min`, `max`, `remark`) VALUES
(1, 'A', 75, 100, 'Excellent'),
(2, 'B', 65, 74, 'Very Good'),
(3, 'C', 45, 64, 'Good'),
(4, 'D', 30, 44, 'Satisfactory'),
(5, 'F', 0, 29, 'Fail');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login_sessions`
--

CREATE TABLE `tbl_login_sessions` (
  `session_key` varchar(90) NOT NULL,
  `staff` int(11) DEFAULT NULL,
  `student` varchar(20) DEFAULT NULL,
  `ip_address` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_login_sessions`
--

INSERT INTO `tbl_login_sessions` (`session_key`, `staff`, `student`, `ip_address`) VALUES
('D6WDMTM41L3W2TKOUXH1', NULL, 'REG202631', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_school`
--

CREATE TABLE `tbl_school` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `logo` varchar(50) NOT NULL,
  `result_system` int(11) NOT NULL COMMENT '0 = Average, 1 = Division',
  `allow_results` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_school`
--

INSERT INTO `tbl_school` (`id`, `name`, `logo`, `result_system`, `allow_results`) VALUES
(1, 'ELIMU SCHOOLS  ', 'school_logo1774859860.png', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_smtp`
--

CREATE TABLE `tbl_smtp` (
  `id` int(11) NOT NULL,
  `server` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `port` varchar(255) NOT NULL,
  `encryption` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_smtp`
--

INSERT INTO `tbl_smtp` (`id`, `server`, `username`, `password`, `port`, `encryption`, `status`) VALUES
(1, 'smtp server here', 'smtp username here', 'smtp password here', '587', 'tls', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_staff`
--

CREATE TABLE `tbl_staff` (
  `id` int(11) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `email` varchar(90) NOT NULL,
  `password` varchar(90) NOT NULL,
  `level` int(11) NOT NULL COMMENT '0 = Admin, 1 = Academic, 2 = Teacher',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0 = Blocked, 1 = Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_staff`
--

INSERT INTO `tbl_staff` (`id`, `fname`, `lname`, `gender`, `email`, `password`, `level`, `status`) VALUES
(1, 'Michael', 'Mwangi', 'Male', 'mwangimichael@gmail.com', '$2y$10$MeOBYtzXGhrlLQb6bXhdGOZ2P7LuloAatmXIoY4WudEnfLK4BeUMu', 0, 1),
(24, 'Waweru', 'Mwangi', 'Male', 'waweru@gmail.com', '$2y$10$qeVDVD8fNSnQ8HrOzpMsYOy8X3g2B.HuNKT/ZErsa6S/kAZH.MAY6', 1, 1),
(25, 'HAMISI', 'SIMON', 'Male', 'simon.elm@gmail.com', '$2y$10$CMKGCO4caQlaxyZmkmPkPeicwsWm/6bzC.p5UpjrMHoQmUbsx6nvK', 2, 1),
(26, 'Joan', 'Kemboi', 'Female', 'joan22@gmail.com', '$2y$10$8xNKJjTABhDrZvH6PAOjcOJ7SS/zGoc8PgsXf6prFF5gX74R17A8u', 2, 1),
(27, 'John', 'Kamau', 'Male', 'john.kamau@kenyateachers.co.ke', '$2y$10$KS5qAIANq1jcnbAUPEztVOnG80hlTXs37/hwbhHLHsIyT/rUMN/2G', 2, 1),
(28, 'Mary', 'Wanjiku', 'Female', 'mary.wanjiku@kenyateachers.co.ke', '$2y$10$xR1/yl4rcqLr9QMx1ku2ueEU/lXckoWDZO2q6UxDME2iGOhWOBSZO', 2, 1),
(29, 'Peter', 'Otieno', 'Male', 'peter.otieno@kenyateachers.co.ke', '$2y$10$Q5DLs0qw0NBFKDZJXRyMd.8KcvsW4XzZ3CsgvVM5SVhymluYW19cG', 2, 1),
(30, 'Jane', 'Akinyi', 'Female', 'jane.akinyi@kenyateachers.co.ke', '$2y$10$viXQo/9chemoPVE5pb.ASOIpgl.xu1ozyLkgSz7DyO2aa3iodB7t2', 2, 1),
(31, 'David', 'Kiprop', 'Male', 'david.kiprop@kenyateachers.co.ke', '$2y$10$BRE0O7kJ8w9GyHUL60sTp.EB7mbNXJM871vzRVfVz8m.pGK7o8586', 2, 1),
(32, 'Elizabeth', 'Muthoni', 'Male', 'elizabeth.muthoni@kenyateachers.co.ke', '$2y$10$FRwvc5Rf8CZWKHD6iKCuwOnROt6gG1JzzNEMh3lVHbsy5U/0k/IVK', 2, 1),
(33, 'Samuel', 'Omondi', 'Male', 'samuel.omondi@kenyateachers.co.ke', '$2y$10$vVTL6bu0cJxa7Q1LVcoZHu4yrRGllnmz5hPzOGm21gNmJvqQmB2di', 2, 1),
(34, 'Grace', 'Nyambura', 'Female', 'grace.nyambura@kenyateachers.co.ke', '$2y$10$0Tppah9kB7wXUlzvn5gXVebEDrcTZju0Kgz6h4oxEbZup8g6kCF8y', 2, 1),
(35, 'Michael', 'Chege', 'Male', 'michael.chege@kenyateachers.co.ke', '$2y$10$9aAWa5w5MDzbl3l5VZDkf.PRLHH/4pfLsQQHS7iITTuxJhV1/pTFa', 2, 1),
(36, 'Anne', 'Atieno', 'Female', 'anne.atieno@kenyateachers.co.ke', '$2y$10$o7alOl/4jFrkN4HC936P8OU5Ev5mDDUp08U2/wZOT1U5yr9663fwm', 2, 1),
(37, 'Joseph', 'Njuguna', 'Male', 'joseph.njuguna@kenyateachers.co.ke', '$2y$10$NcTXXnZuxyRXjSt7A7sFseVBdhSccFO8nkru5baO.lrMV0lYlH3mm', 2, 1),
(40, 'Ruth', 'Wangari', 'Female', 'ruth.wangari@kenyateachers.co.ke', '$2y$10$GvSB2PpKX7dqOcNuQ0TKzewi1VcH2zgbDgN23edynm4F3t312yjjC', 2, 1),
(41, 'James', 'Odhiambo', 'Male', 'james.odhiambo@kenyateachers.co.ke', '$2y$10$GVobM3b9wDsb.98T6Q0WduTxZN83Xm.mEQ/EgoG0Yj8AQC.U5qKIC', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_students`
--

CREATE TABLE `tbl_students` (
  `id` varchar(20) NOT NULL,
  `fname` varchar(70) NOT NULL,
  `mname` varchar(70) NOT NULL,
  `lname` varchar(70) NOT NULL,
  `gender` varchar(7) NOT NULL,
  `email` varchar(90) NOT NULL,
  `class` int(11) NOT NULL,
  `password` varchar(90) NOT NULL,
  `level` int(11) NOT NULL DEFAULT 3 COMMENT '3 = student',
  `display_image` varchar(50) NOT NULL DEFAULT 'Blank',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0 = Disabled, 1 = Enabled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_students`
--

INSERT INTO `tbl_students` (`id`, `fname`, `mname`, `lname`, `gender`, `email`, `class`, `password`, `level`, `display_image`, `status`) VALUES
('ELM/0023', 'HENRY', 'KIPCHUMBA', 'ONES', 'Male', 'form four 2026', 11, '$2y$10$Qxp5KAxs88mo.bmIC//7EO4FWGhL/LVpr5Nz9Q7pb4QN6sLSg3PE2', 3, 'DEFAULT', 1),
('ELP/0020', 'JAMES', 'CLINTON', 'OBURE', 'Male', 'james@gmail.com', 11, '$2y$10$7qFiRUhg5QI8TKmxkccEhOOpXkv6xShtvIDzciNzp4MfO08sWwToq', 3, 'avator_1774453099.png', 1),
('ELP/0021', 'NELLY', 'MUNGAI', 'SERAH', 'Female', 'nellymunga.elm.@gmail.com', 11, '$2y$10$NlBM3.mOXOkduQzGBEN2SuUU10ZUi4YJNsUyzGyZQiq.l0fvwzLSm', 3, 'avator_1774453511.png', 1),
('ELP/0022', 'FIDEL', 'JOHN', 'WALTER', 'Male', 'fidel.elm@gmail.com', 11, '$2y$10$dBjqxUsOZZ.NR6Reuq3CX.5mzd4KDithse8DstXpBf9RylN5CgKZa', 3, 'avator_1774453875.png', 1),
('REG2026001', 'Faith', 'Otieno', 'Female', 'Female', 'faith.otieno1@gmail.com', 13, '$2y$10$s6ESCZFT.XVa/PKuqtm0Ruzyzp3ZsMXx7bdAyHUcux68ZsUCIZKp2', 3, 'DEFAULT', 1),
('REG2026002', 'Kevin', 'Kiptoo', 'Male', 'Male', 'kevin.kiptoo2@gmail.com', 13, '$2y$10$liBo21WxzMSA2lPCHgFhueADU3blo7sqc28GiBQPS2CwEWyz3YpuO', 3, 'DEFAULT', 1),
('REG2026003', 'Lilian', 'Wanjiku', 'Female', 'Female', 'lilian.wanjiku3@gmail.com', 13, '$2y$10$.kHZZfCE3R4q5P.6exJsT.o/NBdugfPTc9Cviq8KvV8vt32hnr.D2', 3, 'DEFAULT', 1),
('REG2026004', 'Daniel', 'Mutua', 'Male', 'Male', 'daniel.mutua4@gmail.com', 13, '$2y$10$6OowqsxMXXV6rOwsGxwBGu04B1Nj7dx7WDIOY8fNVARQw6vBFSeDS', 3, 'DEFAULT', 1),
('REG2026005', 'Grace', 'Njoroge', 'Female', 'Female', 'grace.njoroge5@gmail.com', 13, '$2y$10$8zBJP73S5DmBYCZhApiL7uVbxTid7nrIwzsjJZGU1wbrqM3PNWRni', 3, 'DEFAULT', 1),
('REG2026006', 'Samuel', 'Omondi', 'Male', 'Male', 'samuel.omondi6@gmail.com', 13, '$2y$10$VLojJ.RzI2bZAx1ia2PyAurNiMcnw9oy7CxoFWK193ALGGiFXENu2', 3, 'DEFAULT', 1),
('REG2026007', 'Mercy', 'Cherono', 'Female', 'Female', 'mercy.cherono7@gmail.com', 13, '$2y$10$2NiFBH4pUWUrUfeNxtiM3ONWdK17PoWDcUH9MWDfGyjVFLkzDQooS', 3, 'DEFAULT', 1),
('REG2026008', 'Peter', 'Kamau', 'Male', 'Male', 'peter.kamau8@gmail.com', 13, '$2y$10$I/OjdTkeyiWRilNfSG0bbe26nVD83Lam/BthUM/4mP5om5YbV3NPW', 3, 'DEFAULT', 1),
('REG2026009', 'Esther', 'Achieng', 'Female', 'Female', 'esther.achieng9@gmail.com', 13, '$2y$10$XCndsCN7KRulbHvAepD2tuF3kvOpvKYK7CpxPlOnwXVB.92GiUuOa', 3, 'DEFAULT', 1),
('REG2026010', 'Brian', 'Mwangi', 'Male', 'Male', 'brian.mwangi10@gmail.com', 13, '$2y$10$BICUEumrZVT/Dm5fFHA9aOU9mqHiw0pSIV27Kd6HHlQ.SEjoQpx3y', 3, 'DEFAULT', 1),
('REG2026011', 'Faith', 'Otieno', 'Female', 'Female', 'faith.otieno11@gmail.com', 13, '$2y$10$RrHoaBmVRaTZ2Lx3/H58WeWn037XhqmMIGh4YzomT6KAJH2WN4hM.', 3, 'DEFAULT', 1),
('REG2026012', 'Kevin', 'Kiptoo', 'Male', 'Male', 'kevin.kiptoo12@gmail.com', 13, '$2y$10$zY8YFpm1wblKKyNyY6YJ5eqwWxIypw/Rbuy33NyQH2JMNvoDBHsHG', 3, 'DEFAULT', 1),
('REG2026013', 'Lilian', 'Wanjiku', 'Female', 'Female', 'lilian.wanjiku13@gmail.com', 13, '$2y$10$j1gJFwLiyVHW74BZLnI0q.eel5.ouR8QkMI9enqeViBM5d/A1BGRG', 3, 'DEFAULT', 1),
('REG2026014', 'Daniel', 'Mutua', 'Male', 'Male', 'daniel.mutua14@gmail.com', 13, '$2y$10$uGiyE1tYgictDDBKW8AFCufRHZ/sQVY9R4udX3yYw1xvgCnNNtWKi', 3, 'DEFAULT', 1),
('REG2026015', 'Grace', 'Njoroge', 'Female', 'Female', 'grace.njoroge15@gmail.com', 13, '$2y$10$uRJYcGJXNSrpPrZWhfwxu.PxJ7328AZd8pG8e7YbJimnknNqB76Em', 3, 'DEFAULT', 1),
('REG2026016', 'Samuel', 'Omondi', 'Male', 'Male', 'samuel.omondi16@gmail.com', 13, '$2y$10$nbO3h0iU/TG5BL18Cp5eT.repyxZ1jN3KBAlS1ADw86aZZNJUxLnq', 3, 'DEFAULT', 1),
('REG2026017', 'Mercy', 'Cherono', 'Female', 'Female', 'mercy.cherono17@gmail.com', 13, '$2y$10$JSIW7YweJdoqpGfNtT9H1eX28UPfz1tzy2Xx3CWoSK4wVoZh.h1XC', 3, 'DEFAULT', 1),
('REG2026018', 'Peter', 'Kamau', 'Male', 'Male', 'peter.kamau18@gmail.com', 13, '$2y$10$GG2T0tH3JeFfYNha/fgDHesl5W0fqQ6fJaillhSUal2kvQtL2OZJC', 3, 'DEFAULT', 1),
('REG2026019', 'Esther', 'Achieng', 'Female', 'Female', 'esther.achieng19@gmail.com', 13, '$2y$10$VY/33xRLa3mEqDyk6mDZgeYc.Nrr5jG0u.pfJT4WzHZjS7yYNda1W', 3, 'DEFAULT', 1),
('REG2026020', 'Brian', 'Mwangi', 'Male', 'Male', 'brian.mwangi20@gmail.com', 13, '$2y$10$at4jYmF02qpMqIKSrhoRpOnF96rh5eW3sscvbCNtmONaYhHluBrOm', 3, 'DEFAULT', 1),
('REG2026021', 'Faith', 'Otieno', 'Female', 'Female', 'faith.otieno21@gmail.com', 13, '$2y$10$V3v1TBYqkPTlq5k6pJCncefkQqN/91G2TmL2UJ8oVaIx2QcBurXLK', 3, 'DEFAULT', 1),
('REG2026022', 'Kevin', 'Kiptoo', 'Male', 'Male', 'kevin.kiptoo22@gmail.com', 13, '$2y$10$AFu7SXHWo3WLm/vPLi53BebqIP4W5DQXBh5iRxEa43q9yvEHRVESK', 3, 'DEFAULT', 1),
('REG2026023', 'Lilian', 'Wanjiku', 'Female', 'Female', 'lilian.wanjiku23@gmail.com', 13, '$2y$10$BOEtvGzI0NtAhsk6.ijg.OP2EfnoZZCpPlekNO0uUkqR8q7/Pr78i', 3, 'DEFAULT', 1),
('REG2026024', 'Daniel', 'Mutua', 'Male', 'Male', 'daniel.mutua24@gmail.com', 13, '$2y$10$nAqPZ2jrEAiH4GjGYbSFsOxxcUCo8S0iOGy.hulIv6yQWAkPZOGJC', 3, 'DEFAULT', 1),
('REG2026025', 'Grace', 'Njoroge', 'Female', 'Female', 'grace.njoroge25@gmail.com', 13, '$2y$10$iKLjePR2GoSN1SMQ/IKj3uZpImT7K2ge5Hwnzsbm55LABorjc5VJm', 3, 'DEFAULT', 1),
('REG2026026', 'Samuel', 'Omondi', 'Male', 'Male', 'samuel.omondi26@gmail.com', 13, '$2y$10$/EvEQ/wAm4alxml1vsp4Sek90IWC.dFAyNyR1KI74tv.6L/kGloai', 3, 'DEFAULT', 1),
('REG2026027', 'Mercy', 'Cherono', 'Female', 'Female', 'mercy.cherono27@gmail.com', 13, '$2y$10$W1PL4GDAs86TkHV77YVlz.ICKbwmHjNp0V04BaDc8TFDt3r2VJiWS', 3, 'DEFAULT', 1),
('REG2026028', 'Peter', 'Kamau', 'Male', 'Male', 'peter.kamau28@gmail.com', 13, '$2y$10$US25xTPFa0JS8ZTb3yP91OMA6Rv7jk7iZhwwIDAKJrNhTmqSPaYqK', 3, 'DEFAULT', 1),
('REG2026029', 'Esther', 'Achieng', 'Female', 'Female', 'esther.achieng29@gmail.com', 13, '$2y$10$XwRRF4BOXPtGuEXYHcE7zu5NyTE08Grzhd612sF.7ARgFjdiWxhVC', 3, 'DEFAULT', 1),
('REG2026030', 'Brian', 'Mwangi', 'Male', 'Male', 'brian.mwangi30@gmail.com', 13, '$2y$10$4n8KmPlIATl8gFMoGgV5cuLeQVOle0iVVpCnuw3ZGPz6bvOX7oXBO', 3, 'DEFAULT', 1),
('REG202631', 'Fabian', 'Kiprop', 'Ishmael', 'Male', 'kipropfab@gmail.com', 13, '$2y$10$9SBGVLGKa5YLBoyO2zyeFuzeDCjtgKnK.yVpT.NiRsIGqGY8lvM0.', 3, 'DEFAULT', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subjects`
--

CREATE TABLE `tbl_subjects` (
  `id` int(11) NOT NULL,
  `name` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_subjects`
--

INSERT INTO `tbl_subjects` (`id`, `name`) VALUES
(7, 'History'),
(8, 'Civics'),
(9, 'Biology'),
(10, 'Physics'),
(11, 'Chemistry'),
(12, 'Literature'),
(23, 'Computer'),
(24, 'Mathematics'),
(25, 'Special Needs'),
(26, 'Kiswahili'),
(27, 'Business Studies'),
(28, 'Agriculture'),
(29, 'Home Science'),
(30, 'English'),
(31, 'Geography');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subject_combinations`
--

CREATE TABLE `tbl_subject_combinations` (
  `id` int(11) NOT NULL,
  `class` varchar(100) NOT NULL,
  `subject` int(11) NOT NULL,
  `teacher` int(11) NOT NULL,
  `reg_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_subject_combinations`
--

INSERT INTO `tbl_subject_combinations` (`id`, `class`, `subject`, `teacher`, `reg_date`) VALUES
(21, 'a:3:{i:0;s:2:\"11\";i:1;s:2:\"12\";i:2;s:2:\"13\";}', 10, 25, '2026-03-30 13:25:51'),
(22, 'a:2:{i:0;s:2:\"12\";i:1;s:2:\"13\";}', 9, 25, '2026-03-30 13:26:27'),
(23, 'a:3:{i:0;s:2:\"11\";i:1;s:2:\"12\";i:2;s:2:\"13\";}', 28, 26, '2026-03-30 13:28:31'),
(24, 'a:3:{i:0;s:2:\"11\";i:1;s:2:\"12\";i:2;s:2:\"13\";}', 27, 26, '2026-03-30 13:29:50'),
(25, 'a:3:{i:0;s:2:\"11\";i:1;s:2:\"12\";i:2;s:2:\"13\";}', 29, 28, '2026-03-30 13:30:48'),
(26, 'a:3:{i:0;s:2:\"11\";i:1;s:2:\"12\";i:2;s:2:\"13\";}', 7, 28, '2026-03-30 13:31:42'),
(27, 'a:3:{i:0;s:2:\"11\";i:1;s:2:\"12\";i:2;s:2:\"13\";}', 24, 29, '2026-03-30 13:32:45'),
(28, 'a:3:{i:0;s:2:\"11\";i:1;s:2:\"12\";i:2;s:2:\"13\";}', 31, 29, '2026-03-30 13:35:25');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_terms`
--

CREATE TABLE `tbl_terms` (
  `id` int(11) NOT NULL,
  `name` varchar(90) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '	0 = Disabled , 1 = Enabled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_terms`
--

INSERT INTO `tbl_terms` (`id`, `name`, `status`) VALUES
(1, 'Midterm March 2026', 1),
(2, 'Terminal June 2026', 1),
(3, 'Midterm September 2026', 1),
(4, 'Annual November 2026', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_announcements`
--
ALTER TABLE `tbl_announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_classes`
--
ALTER TABLE `tbl_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_division_system`
--
ALTER TABLE `tbl_division_system`
  ADD PRIMARY KEY (`division`);

--
-- Indexes for table `tbl_exam_results`
--
ALTER TABLE `tbl_exam_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student` (`student`),
  ADD KEY `class` (`class`),
  ADD KEY `subject_combination` (`subject_combination`),
  ADD KEY `term` (`term`);

--
-- Indexes for table `tbl_grade_system`
--
ALTER TABLE `tbl_grade_system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_login_sessions`
--
ALTER TABLE `tbl_login_sessions`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `staff` (`staff`),
  ADD KEY `student` (`student`);

--
-- Indexes for table `tbl_school`
--
ALTER TABLE `tbl_school`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_smtp`
--
ALTER TABLE `tbl_smtp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_staff`
--
ALTER TABLE `tbl_staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_students`
--
ALTER TABLE `tbl_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class` (`class`);

--
-- Indexes for table `tbl_subjects`
--
ALTER TABLE `tbl_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_subject_combinations`
--
ALTER TABLE `tbl_subject_combinations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class` (`class`),
  ADD KEY `teacher` (`teacher`),
  ADD KEY `subject` (`subject`);

--
-- Indexes for table `tbl_terms`
--
ALTER TABLE `tbl_terms`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_announcements`
--
ALTER TABLE `tbl_announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_classes`
--
ALTER TABLE `tbl_classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_exam_results`
--
ALTER TABLE `tbl_exam_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `tbl_grade_system`
--
ALTER TABLE `tbl_grade_system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_school`
--
ALTER TABLE `tbl_school`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_smtp`
--
ALTER TABLE `tbl_smtp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_staff`
--
ALTER TABLE `tbl_staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `tbl_subjects`
--
ALTER TABLE `tbl_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `tbl_subject_combinations`
--
ALTER TABLE `tbl_subject_combinations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tbl_terms`
--
ALTER TABLE `tbl_terms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_exam_results`
--
ALTER TABLE `tbl_exam_results`
  ADD CONSTRAINT `tbl_exam_results_ibfk_1` FOREIGN KEY (`student`) REFERENCES `tbl_students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_exam_results_ibfk_2` FOREIGN KEY (`class`) REFERENCES `tbl_classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_exam_results_ibfk_3` FOREIGN KEY (`subject_combination`) REFERENCES `tbl_subject_combinations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_exam_results_ibfk_4` FOREIGN KEY (`term`) REFERENCES `tbl_terms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_login_sessions`
--
ALTER TABLE `tbl_login_sessions`
  ADD CONSTRAINT `tbl_login_sessions_ibfk_1` FOREIGN KEY (`staff`) REFERENCES `tbl_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_login_sessions_ibfk_2` FOREIGN KEY (`student`) REFERENCES `tbl_students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_students`
--
ALTER TABLE `tbl_students`
  ADD CONSTRAINT `tbl_students_ibfk_1` FOREIGN KEY (`class`) REFERENCES `tbl_classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_subject_combinations`
--
ALTER TABLE `tbl_subject_combinations`
  ADD CONSTRAINT `tbl_subject_combinations_ibfk_2` FOREIGN KEY (`subject`) REFERENCES `tbl_subjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_subject_combinations_ibfk_3` FOREIGN KEY (`teacher`) REFERENCES `tbl_staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
