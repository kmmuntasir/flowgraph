-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 08, 2021 at 08:19 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flowgraph`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `admin_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `admin_pass` varchar(255) NOT NULL,
  `admin_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `admin_phone` varchar(20) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_email`, `admin_pass`, `admin_name`, `admin_phone`, `is_deleted`) VALUES
(1, 'admin@mail.com', '202CB962AC59075B964B07152D234B70', 'Admin', NULL, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `graph`
--

CREATE TABLE `graph` (
  `graph_id` int(10) UNSIGNED NOT NULL,
  `graph_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `graph_json` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `graph_thumb` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `graph_datetime` datetime NOT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `graph`
--

INSERT INTO `graph` (`graph_id`, `graph_name`, `user_id`, `graph_json`, `graph_thumb`, `graph_datetime`, `is_deleted`) VALUES
(1, 'Larger between two numbers', 1, '{ \"class\": \"go.GraphLinksModel\",\n  \"linkFromPortIdProperty\": \"fromPort\",\n  \"linkToPortIdProperty\": \"toPort\",\n  \"nodeDataArray\": [ \n{\"category\":\"start\", \"text\":\"Start\", \"key\":-2, \"loc\":\"-200 -200\"},\n{\"category\":\"io\", \"text\":\"Read X, Y\", \"key\":-4, \"loc\":\"-200 -130\"},\n{\"category\":\"condition\", \"text\":\"X > Y\", \"key\":-5, \"loc\":\"-200 -40\"},\n{\"category\":\"comment\", \"text\":\"A flowchart for comparing\\ntwo numbers to find out which is larger\", \"key\":-6, \"loc\":\"-30 -180\"},\n{\"category\":\"end\", \"text\":\"Stop\", \"key\":-8, \"loc\":\"-200 120\"},\n{\"category\":\"io\", \"text\":\"Print X\", \"key\":-9, \"loc\":\"-400 40\"},\n{\"category\":\"io\", \"text\":\"Print Y\", \"key\":-10, \"loc\":\"-20 40\"}\n ],\n  \"linkDataArray\": [ \n{\"from\":-2, \"to\":-4, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[-200,-175.23282552319904,-200,-165.23282552319904,-200,-161.19805338659953,-200,-161.19805338659953,-200,-157.16328125,-200,-147.16328125]},\n{\"from\":-4, \"to\":-5, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[-200,-112.83671875000002,-200,-102.83671875000002,-200,-93.331640625,-200,-93.331640625,-200,-83.8265625,-200,-73.8265625]},\n{\"from\":-5, \"to\":-9, \"fromPort\":\"L\", \"toPort\":\"T\", \"visible\":true, \"points\":[-256.078125,-39.99999999999999,-266.078125,-39.99999999999999,-400,-39.99999999999999,-400,-13.581640624999995,-400,12.836718750000003,-400,22.836718750000003]},\n{\"from\":-5, \"to\":-10, \"fromPort\":\"R\", \"toPort\":\"T\", \"visible\":true, \"points\":[-143.921875,-39.99999999999999,-133.921875,-39.99999999999999,-20,-39.99999999999999,-20,-13.581640624999997,-20,12.83671875,-20,22.83671875], \"text\":\"No\"},\n{\"from\":-10, \"to\":-8, \"fromPort\":\"B\", \"toPort\":\"R\", \"points\":[-20,57.16328125,-20,67.16328125,-20,120,-92.91806216572607,120,-165.83612433145214,120,-175.83612433145214,120]},\n{\"from\":-9, \"to\":-8, \"fromPort\":\"B\", \"toPort\":\"L\", \"points\":[-400,57.163281250000004,-400,67.16328125000001,-400,120,-317.08193783427396,120,-234.1638756685479,120,-224.1638756685479,120]}\n ]}', '9c09e40c5f.jpeg', '2019-01-07 01:52:33', b'0'),
(2, 'All numbers from 1 to N', 1, '{ \"class\": \"go.GraphLinksModel\",\n  \"linkFromPortIdProperty\": \"fromPort\",\n  \"linkToPortIdProperty\": \"toPort\",\n  \"nodeDataArray\": [ \n{\"category\":\"start\", \"text\":\"Start\", \"key\":-2, \"loc\":\"-150 -200\"},\n{\"category\":\"io\", \"text\":\"Input N\", \"key\":-4, \"loc\":\"-150 -80\"},\n{\"category\":\"step\", \"text\":\"k := 1\", \"key\":-3, \"loc\":\"-150 -140\"},\n{\"category\":\"condition\", \"text\":\"k <= N ?\", \"key\":-5, \"loc\":\"-150 20\"},\n{\"category\":\"step\", \"text\":\"k := k + 1\", \"key\":-7, \"loc\":\"110 120\"},\n{\"category\":\"end\", \"text\":\"Stop\", \"key\":-8, \"loc\":\"-340 180\"},\n{\"category\":\"comment\", \"text\":\"A flowchart for printing all the natural numbers starting from 1 to N\", \"key\":-9, \"loc\":\"40 -70\"},\n{\"category\":\"io\", \"text\":\"display k\", \"key\":-10, \"loc\":\"-10 120\"}\n ],\n  \"linkDataArray\": [ \n{\"from\":-2, \"to\":-3, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[-150,-175.23282552319904,-150,-165.23282552319904,-150,-165.23282552319904,-150,-167.16328125,-150,-167.16328125,-150,-157.16328125]},\n{\"from\":-3, \"to\":-4, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[-150,-122.83671875000002,-150,-112.83671875000002,-150,-110.00000000000001,-150,-110.00000000000001,-150,-107.16328125000001,-150,-97.16328125000001]},\n{\"from\":-4, \"to\":-5, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[-150,-62.83671874999999,-150,-52.83671874999999,-150,-38.331640625,-149.99999999999997,-38.331640625,-149.99999999999997,-23.826562500000005,-149.99999999999997,-13.826562500000005]},\n{\"from\":-5, \"to\":-10, \"fromPort\":\"B\", \"toPort\":\"L\", \"visible\":true, \"points\":[-150,53.8265625,-150,63.8265625,-150,119.99999999999999,-111.64892578125,119.99999999999999,-73.2978515625,119.99999999999999,-63.2978515625,119.99999999999999]},\n{\"from\":-10, \"to\":-7, \"fromPort\":\"R\", \"toPort\":\"L\", \"points\":[43.2978515625,119.99999999999999,53.2978515625,119.99999999999999,55.27587890625,119.99999999999999,55.27587890625,120,57.25390625,120,67.25390625,120]},\n{\"from\":-7, \"to\":-5, \"fromPort\":\"R\", \"toPort\":\"R\", \"points\":[152.74609375,120,162.74609375,120,162.74609375,19.999999999999996,50.748046875000014,19.999999999999996,-61.24999999999997,19.999999999999996,-71.24999999999997,19.999999999999996]},\n{\"from\":-5, \"to\":-8, \"fromPort\":\"L\", \"toPort\":\"T\", \"visible\":true, \"points\":[-228.74999999999997,19.999999999999996,-238.74999999999997,19.999999999999996,-340,19.999999999999996,-340,82.91806216572606,-340,145.8361243314521,-340,155.8361243314521], \"text\":\"No\"}\n ]}', 'abbe068d53.jpeg', '2019-01-07 03:01:05', b'0'),
(3, 'Sum of all numbers from 1 to N', 1, '{ \"class\": \"go.GraphLinksModel\",\n  \"linkFromPortIdProperty\": \"fromPort\",\n  \"linkToPortIdProperty\": \"toPort\",\n  \"nodeDataArray\": [ \n{\"category\":\"start\", \"text\":\"Start\", \"key\":-2, \"loc\":\"-150 -200\"},\n{\"category\":\"io\", \"text\":\"Input N\", \"key\":-4, \"loc\":\"-150 -80\"},\n{\"category\":\"step\", \"text\":\"k := 1, sum := 0\", \"key\":-3, \"loc\":\"-150 -140\"},\n{\"category\":\"condition\", \"text\":\"k <= N ?\", \"key\":-5, \"loc\":\"-150 20\"},\n{\"category\":\"step\", \"text\":\"sum := sum + k\", \"key\":-6, \"loc\":\"-10 120\"},\n{\"category\":\"step\", \"text\":\"k := k + 1\", \"key\":-7, \"loc\":\"160 120\"},\n{\"category\":\"end\", \"text\":\"Stop\", \"key\":-8, \"loc\":\"-340 180\"},\n{\"category\":\"comment\", \"text\":\"A flowchart for printing the sum of all the natural numbers starting from 1 to N\", \"key\":-9, \"loc\":\"40 -80\"},\n{\"category\":\"io\", \"text\":\"Show sum\", \"key\":-11, \"loc\":\"-340 100\"}\n ],\n  \"linkDataArray\": [ \n{\"from\":-2, \"to\":-3, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[-150,-175.23282552319904,-150,-165.23282552319904,-150,-165.23282552319904,-150,-167.16328125000004,-150,-167.16328125000004,-150,-157.16328125000004]},\n{\"from\":-3, \"to\":-4, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[-150,-122.83671875000005,-150,-112.83671875000005,-150,-110.00000000000003,-150,-110.00000000000003,-150,-107.16328125,-150,-97.16328125]},\n{\"from\":-4, \"to\":-5, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[-150,-62.83671874999999,-150,-52.83671874999999,-150,-38.331640625,-150.00000000000003,-38.331640625,-150.00000000000003,-23.826562500000005,-150.00000000000003,-13.826562500000005]},\n{\"from\":-5, \"to\":-6, \"fromPort\":\"B\", \"toPort\":\"L\", \"visible\":true, \"points\":[-150,53.8265625,-150,63.8265625,-150,120.00000000000003,-118.373046875,120.00000000000003,-86.74609375000001,120.00000000000003,-76.74609375000001,120.00000000000003]},\n{\"from\":-6, \"to\":-7, \"fromPort\":\"R\", \"toPort\":\"L\", \"points\":[56.74609375,120,66.74609375,120,86.99999999999994,120,86.99999999999994,120.00000000000006,107.25390624999987,120.00000000000006,117.25390624999987,120.00000000000006]},\n{\"from\":-7, \"to\":-5, \"fromPort\":\"R\", \"toPort\":\"R\", \"points\":[202.7460937499999,120.00000000000006,212.7460937499999,120.00000000000006,212.7460937499999,20,75.74804687499994,20,-61.25,20,-71.25,20]},\n{\"from\":-5, \"to\":-11, \"fromPort\":\"L\", \"toPort\":\"T\", \"visible\":true, \"points\":[-228.75,20,-238.75,20,-340,20,-340,46.418359375,-340,72.83671875,-340,82.83671875], \"text\":\"No\"},\n{\"from\":-11, \"to\":-8, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[-340,117.16328125000001,-340,127.16328125000001,-340,136.49970279072608,-340,136.49970279072608,-340,145.8361243314521,-340,155.8361243314521]}\n ]}', '36d7bf56a6.jpeg', '2019-01-07 03:05:18', b'0'),
(4, 'Grading System Flowchart', 1, '{ \"class\": \"go.GraphLinksModel\",\n  \"linkFromPortIdProperty\": \"fromPort\",\n  \"linkToPortIdProperty\": \"toPort\",\n  \"nodeDataArray\": [ \n{\"category\":\"start\", \"text\":\"Start\", \"key\":-2, \"loc\":\"-620 -220\"},\n{\"category\":\"io\", \"text\":\"Get m\", \"key\":-4, \"loc\":\"-450 -310\"},\n{\"category\":\"condition\", \"text\":\"m < 0\", \"key\":-5, \"loc\":\"-450 -230\"},\n{\"category\":\"comment\", \"text\":\"Here, m is Mark for a specific subject\", \"key\":-6, \"loc\":\"-150 -320\"},\n{\"category\":\"condition\", \"text\":\"m < 33\", \"key\":-7, \"loc\":\"-300 -280\"},\n{\"category\":\"condition\", \"text\":\"m < 40\", \"key\":-8, \"loc\":\"-150 -240\"},\n{\"category\":\"condition\", \"text\":\"m < 50\", \"key\":-9, \"loc\":\"10 -280\"},\n{\"category\":\"condition\", \"text\":\"m < 60\", \"key\":-10, \"loc\":\"0 -20\"},\n{\"category\":\"condition\", \"text\":\"m < 70\", \"key\":-11, \"loc\":\"-170 10\"},\n{\"category\":\"condition\", \"text\":\"m < 80\", \"key\":-12, \"loc\":\"-350 10\"},\n{\"category\":\"condition\", \"text\":\"m <= 100\", \"key\":-13, \"loc\":\"-550 10\"},\n{\"category\":\"end\", \"text\":\"Stop\", \"key\":-21, \"loc\":\"-640 -50\"},\n{\"category\":\"io\", \"text\":\"Print \\\"Invalid Input\\\"\", \"key\":-23, \"loc\":\"-450 -140\"},\n{\"category\":\"io\", \"text\":\"Print \\\"Grade F\\\"\", \"key\":-24, \"loc\":\"-320 -190\"},\n{\"category\":\"io\", \"text\":\"Print \\\"Grade D\\\"\", \"key\":-25, \"loc\":\"-150 -140\"},\n{\"category\":\"io\", \"text\":\"Print \\\"Grade C\\\"\", \"key\":-26, \"loc\":\"-10 -190\"},\n{\"category\":\"io\", \"text\":\"Print \\\"Grade B\\\"\", \"key\":-27, \"loc\":\"40 60\"},\n{\"category\":\"io\", \"text\":\"Print \\\"Grade A-\\\"\", \"key\":-28, \"loc\":\"-60 100\"},\n{\"category\":\"io\", \"text\":\"Print \\\"Grade A\\\"\", \"key\":-29, \"loc\":\"-220 100\"},\n{\"category\":\"io\", \"text\":\"Print \\\"Invalid Input\\\"\", \"key\":-30, \"loc\":\"-560 100\"},\n{\"category\":\"io\", \"text\":\"Print \\\"Grade A+\\\"\", \"key\":-31, \"loc\":\"-380 100\"}\n ],\n  \"linkDataArray\": [ \n{\"from\":-2, \"to\":-4, \"fromPort\":\"R\", \"toPort\":\"L\", \"points\":[-595.2328255231989,-219.99999999999986,-585.2328255231989,-219.99999999999986,-542.0363346365995,-219.99999999999986,-542.0363346365995,-310,-498.83984374999994,-310,-488.83984374999994,-310]},\n{\"from\":-4, \"to\":-5, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[-449.99999999999994,-292.83671875,-449.99999999999994,-282.83671875,-449.99999999999994,-278.331640625,-449.9999999999999,-278.331640625,-449.9999999999999,-273.8265625,-449.9999999999999,-263.8265625]},\n{\"from\":-5, \"to\":-7, \"fromPort\":\"R\", \"toPort\":\"L\", \"visible\":true, \"points\":[-392.1406249999999,-230.00000000000003,-382.1406249999999,-230.00000000000003,-379.44921874999994,-230.00000000000003,-379.44921874999994,-280,-376.7578125,-280,-366.7578125,-280], \"text\":\"No\"},\n{\"from\":-7, \"to\":-8, \"fromPort\":\"R\", \"toPort\":\"L\", \"visible\":true, \"points\":[-233.2421875,-280,-223.2421875,-280,-223.2421875,-260,-226.7578125,-260,-226.7578125,-240.00000000000003,-216.7578125,-240.00000000000003], \"text\":\"No\"},\n{\"from\":-8, \"to\":-9, \"fromPort\":\"R\", \"toPort\":\"L\", \"visible\":true, \"points\":[-83.2421875,-240.00000000000003,-73.2421875,-240.00000000000003,-69.99999999999994,-240.00000000000003,-69.99999999999994,-280,-66.75781249999989,-280,-56.757812499999886,-280], \"text\":\"No\"},\n{\"from\":-9, \"to\":-10, \"fromPort\":\"R\", \"toPort\":\"R\", \"visible\":true, \"points\":[76.75781250000011,-280,86.75781250000011,-280,86.75781250000011,-20,81.75781250000011,-20,76.75781250000011,-20,66.75781250000011,-20], \"text\":\"No\"},\n{\"from\":-10, \"to\":-11, \"fromPort\":\"L\", \"toPort\":\"R\", \"visible\":true, \"points\":[-66.75781249999989,-20,-76.75781249999989,-20,-84.99999999999994,-20,-84.99999999999994,10,-93.2421875,10,-103.2421875,10], \"text\":\"No\"},\n{\"from\":-11, \"to\":-12, \"fromPort\":\"L\", \"toPort\":\"R\", \"visible\":true, \"points\":[-236.7578125,10,-246.7578125,10,-260,10,-260,10,-273.2421875,10,-283.2421875,10], \"text\":\"No\"},\n{\"from\":-12, \"to\":-13, \"fromPort\":\"L\", \"toPort\":\"R\", \"visible\":true, \"points\":[-416.7578125,10,-426.7578125,10,-440.87890625,10,-440.87890625,10,-455,10,-465,10], \"text\":\"No\"},\n{\"from\":-5, \"to\":-23, \"fromPort\":\"B\", \"toPort\":\"T\", \"visible\":true, \"points\":[-449.9999999999999,-196.17343750000003,-449.9999999999999,-186.17343750000003,-450,-186.17343750000003,-450,-186.17343750000003,-450,-167.16328125,-450,-157.16328125]},\n{\"from\":-23, \"to\":-21, \"fromPort\":\"B\", \"toPort\":\"R\", \"points\":[-450,-122.83671875000002,-450,-112.83671875000002,-450,-49.999999999999986,-527.9180621657264,-49.999999999999986,-605.8361243314528,-49.999999999999986,-615.8361243314528,-49.999999999999986]},\n{\"from\":-7, \"to\":-24, \"fromPort\":\"B\", \"toPort\":\"T\", \"visible\":true, \"points\":[-300,-246.17343750000003,-300,-236.17343750000003,-300,-226.66835937500002,-320,-226.66835937500002,-320,-217.16328125,-320,-207.16328125]},\n{\"from\":-24, \"to\":-21, \"fromPort\":\"B\", \"toPort\":\"R\", \"points\":[-320,-172.83671875000002,-320,-162.83671875000002,-320,-49.999999999999986,-462.9180621657264,-49.999999999999986,-605.8361243314528,-49.999999999999986,-615.8361243314528,-49.999999999999986]},\n{\"from\":-8, \"to\":-25, \"fromPort\":\"B\", \"toPort\":\"T\", \"visible\":true, \"points\":[-150,-206.17343750000003,-150,-196.17343750000003,-150,-181.66835937500002,-150,-181.66835937500002,-150,-167.16328125,-150,-157.16328125]},\n{\"from\":-25, \"to\":-21, \"fromPort\":\"B\", \"toPort\":\"R\", \"points\":[-150,-122.83671875000002,-150,-112.83671875000002,-150,-49.999999999999986,-377.9180621657264,-49.999999999999986,-605.8361243314528,-49.999999999999986,-615.8361243314528,-49.999999999999986]},\n{\"from\":-9, \"to\":-26, \"fromPort\":\"B\", \"toPort\":\"T\", \"visible\":true, \"points\":[10.000000000000114,-246.17343750000003,10.000000000000114,-236.17343750000003,10.000000000000114,-226.66835937500002,-9.999999999999886,-226.66835937500002,-9.999999999999886,-217.16328125,-9.999999999999886,-207.16328125]},\n{\"from\":-26, \"to\":-21, \"fromPort\":\"B\", \"toPort\":\"R\", \"points\":[-9.999999999999886,-172.83671875000002,-9.999999999999886,-162.83671875000002,-9.999999999999886,-164,-9.999999999999886,-164,-9.999999999999886,-116,-76,-116,-76,-49.999999999999986,-605.8361243314528,-49.999999999999986,-615.8361243314528,-49.999999999999986]},\n{\"from\":-10, \"to\":-27, \"fromPort\":\"B\", \"toPort\":\"T\", \"visible\":true, \"points\":[1.1368683772161603e-13,13.826562500000001,1.1368683772161603e-13,23.8265625,1.1368683772161603e-13,28.331640624999967,40.00000000000017,28.331640624999967,40.00000000000017,32.83671874999993,40.00000000000017,42.83671874999993]},\n{\"from\":-27, \"to\":-21, \"fromPort\":\"B\", \"toPort\":\"L\", \"points\":[40.00000000000017,77.16328124999993,40.00000000000017,87.16328124999993,40.00000000000017,84,40,84,40,127,-674,127,-674,-49.999999999999986,-674.1638756685485,-49.999999999999986,-664.1638756685485,-49.999999999999986]},\n{\"from\":-11, \"to\":-28, \"fromPort\":\"B\", \"toPort\":\"T\", \"visible\":true, \"points\":[-170,43.8265625,-170,53.8265625,-170,63.33164062499996,-60.000000000000085,63.33164062499996,-60.000000000000085,72.83671874999993,-60.000000000000085,82.83671874999993]},\n{\"from\":-28, \"to\":-21, \"fromPort\":\"B\", \"toPort\":\"L\", \"points\":[-60.000000000000085,117.16328124999993,-60.000000000000085,127.16328124999993,-674.1638756685485,127.16328124999993,-674.1638756685485,38.58164062499997,-674.1638756685485,-49.999999999999986,-664.1638756685485,-49.999999999999986]},\n{\"from\":-12, \"to\":-29, \"fromPort\":\"B\", \"toPort\":\"T\", \"visible\":true, \"points\":[-350,43.8265625,-350,53.8265625,-350,63.33164062499996,-220,63.33164062499996,-220,72.83671874999993,-220,82.83671874999993]},\n{\"from\":-29, \"to\":-21, \"fromPort\":\"B\", \"toPort\":\"L\", \"points\":[-220,117.16328124999993,-220,127.16328124999993,-674.1638756685485,127.16328124999993,-674.1638756685485,38.58164062499997,-674.1638756685485,-49.999999999999986,-664.1638756685485,-49.999999999999986]},\n{\"from\":-13, \"to\":-31, \"fromPort\":\"B\", \"toPort\":\"T\", \"visible\":true, \"points\":[-550,43.8265625,-550,53.8265625,-550,63.33164062499996,-380.00000000000006,63.33164062499996,-380.00000000000006,72.83671874999993,-380.00000000000006,82.83671874999993]},\n{\"from\":-13, \"to\":-30, \"fromPort\":\"L\", \"toPort\":\"T\", \"visible\":true, \"points\":[-635,10,-645,10,-645,62.33164062499996,-559.9999999999999,62.33164062499996,-559.9999999999999,72.83671874999993,-559.9999999999999,82.83671874999993], \"text\":\"No\"},\n{\"from\":-30, \"to\":-21, \"fromPort\":\"B\", \"toPort\":\"L\", \"points\":[-559.9999999999999,117.16328124999993,-559.9999999999999,127.16328124999993,-674.1638756685485,127.16328124999993,-674.1638756685485,38.58164062499997,-674.1638756685485,-49.999999999999986,-664.1638756685485,-49.999999999999986]},\n{\"from\":-31, \"to\":-21, \"fromPort\":\"B\", \"toPort\":\"L\", \"points\":[-380.00000000000006,117.16328124999993,-380.00000000000006,127.16328124999993,-674.1638756685485,127.16328124999993,-674.1638756685485,38.58164062499997,-674.1638756685485,-49.999999999999986,-664.1638756685485,-49.999999999999986]}\n ]}', '11b209df1f.jpeg', '2019-01-07 03:17:40', b'0'),
(5, 'Axis Test Graph', 1, '{ \"class\": \"go.GraphLinksModel\",\n  \"linkFromPortIdProperty\": \"fromPort\",\n  \"linkToPortIdProperty\": \"toPort\",\n  \"nodeDataArray\": [ \n{\"category\":\"start\", \"text\":\"Start\", \"key\":-2, \"loc\":\"-300 -100\"},\n{\"category\":\"end\", \"text\":\"Stop\", \"key\":-7, \"loc\":\"-200 0\"},\n{\"category\":\"start\", \"text\":\"Start\", \"key\":-3, \"loc\":\"-410 40\"},\n{\"category\":\"start\", \"text\":\"Start\", \"key\":-4, \"loc\":\"-520 -200\"},\n{\"category\":\"start\", \"text\":\"Start\", \"key\":-5, \"loc\":\"-170 -180\"},\n{\"category\":\"end\", \"text\":\"Stop\", \"key\":-6, \"loc\":\"-410 -100\"},\n{\"category\":\"end\", \"text\":\"Stop\", \"key\":-8, \"loc\":\"-360 -250\"},\n{\"category\":\"end\", \"text\":\"Stop\", \"key\":-9, \"loc\":\"-80 100\"}\n ],\n  \"linkDataArray\": [ \n{\"from\":-4, \"to\":-6, \"fromPort\":\"B\", \"toPort\":\"L\", \"points\":[-520,-175.23282552319904,-520,-165.23282552319904,-520,-100,-482.08193783427396,-100,-444.16387566854786,-100,-434.16387566854786,-100]},\n{\"from\":-2, \"to\":-8, \"fromPort\":\"L\", \"toPort\":\"R\", \"points\":[-324.76717447680096,-100,-334.76717447680096,-100,-334.76717447680096,-175.30164940412652,-325.8361243314521,-175.30164940412652,-325.8361243314521,-249.99999999999997,-335.8361243314521,-249.99999999999997]},\n{\"from\":-5, \"to\":-7, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[-170,-155.23282552319904,-170,-145.23282552319904,-170,-89.69835059587345,-200,-89.69835059587345,-200,-34.163875668547874,-200,-24.163875668547877]},\n{\"from\":-3, \"to\":-9, \"fromPort\":\"B\", \"toPort\":\"L\", \"points\":[-410,64.76717447680096,-410,74.76717447680096,-410,100,-262.08193783427396,100,-114.16387566854787,100,-104.16387566854787,100]}\n ]}', '6bb86d4783.jpeg', '2019-01-09 02:11:03', b'0'),
(6, 'Expression Parsing Test Graph', 1, '{ \"class\": \"go.GraphLinksModel\",\n  \"linkFromPortIdProperty\": \"fromPort\",\n  \"linkToPortIdProperty\": \"toPort\",\n  \"nodeDataArray\": [ \n{\"category\":\"start\", \"text\":\"Start\", \"key\":-2, \"loc\":\"-120 -200\"},\n{\"category\":\"io\", \"text\":\"Read x, y, a, b\", \"key\":-4, \"loc\":\"-120 -130\"},\n{\"category\":\"step\", \"text\":\"p:=q:=r:=((x+y)*(a-b))/7\", \"key\":-3, \"loc\":\"-120 -50\"},\n{\"category\":\"end\", \"text\":\"Stop\", \"key\":-7, \"loc\":\"-120 50\"}\n ],\n  \"linkDataArray\": [ \n{\"from\":-2, \"to\":-4, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[-120,-175.23282552319904,-120,-165.23282552319904,-120,-161.19805338659953,-120,-161.19805338659953,-120,-157.16328125,-120,-147.16328125]},\n{\"from\":-4, \"to\":-3, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[-120,-112.83671875000002,-120,-102.83671875000002,-120,-94.331640625,-120,-94.331640625,-120,-85.8265625,-120,-75.8265625]},\n{\"from\":-3, \"to\":-7, \"fromPort\":\"B\", \"toPort\":\"T\", \"points\":[-120,-24.17343749999999,-120,-14.173437499999991,-120,0.8313434157260602,-120.00000000000001,0.8313434157260602,-120.00000000000001,15.836124331452112,-120.00000000000001,25.836124331452112]}\n ]}', '5b1def6685.jpeg', '2019-01-12 01:05:16', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_phone` varchar(20) DEFAULT NULL,
  `is_deleted` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_email`, `user_pass`, `user_name`, `user_phone`, `is_deleted`) VALUES
(1, 'user_a@gmail.com', '202CB962AC59075B964B07152D234B70', 'John Mayer', NULL, b'0'),
(2, 'user_b@gmail.com', '202CB962AC59075B964B07152D234B70', 'Jane Doe', NULL, b'0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`,`admin_email`);

--
-- Indexes for table `graph`
--
ALTER TABLE `graph`
  ADD PRIMARY KEY (`graph_id`),
  ADD KEY `graph_FK_1` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`,`user_email`),
  ADD UNIQUE KEY `user_id` (`user_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `graph`
--
ALTER TABLE `graph`
  MODIFY `graph_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `graph`
--
ALTER TABLE `graph`
  ADD CONSTRAINT `graph_FK_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
