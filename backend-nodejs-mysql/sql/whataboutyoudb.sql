-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-10-2019 a las 13:36:32
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `whataboutyoudb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles`
--

CREATE TABLE `articles` (
  `id_article` int(11) NOT NULL,
  `titlearticle` varchar(50) NOT NULL,
  `textarticle` text NOT NULL,
  `autorarticle` varchar(50) NOT NULL,
  `categoryarticle` varchar(50) DEFAULT NULL,
  `tagsarticle` varchar(100) DEFAULT NULL,
  `data_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `articles`
--

INSERT INTO `articles` (`id_article`, `titlearticle`, `textarticle`, `autorarticle`, `categoryarticle`, `tagsarticle`, `data_created`, `id_user`) VALUES
(1, 'La depresion', 'bla bla bla bla bla bla bla bla bla bla', 'Juan', 'Psychology', NULL, '2019-10-21 11:17:05', 1),
(2, 'La esquizofrenia', 'bla bla bla bla bla bla bla bla bla bla', 'Juan', 'Psychology', NULL, '2019-10-21 11:17:05', 1),
(3, 'JavaScript and Vue', 'bla bla bla bla bla bla bla bla bla bla', 'Fran', 'Programming', NULL, '2019-10-21 11:17:05', 2),
(4, 'OVNII!!', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Mistery', NULL, '2019-10-21 11:17:05', 3),
(5, 'BigFOOT!!', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Mistery', NULL, '2019-10-21 11:17:05', 3),
(6, 'APPEARS A NEW BLACK HOLE !!', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Physical', NULL, '2019-10-21 11:17:05', 3),
(7, 'CR7 breaks an eyebrow', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Social Life', NULL, '2019-10-21 11:17:05', 3),
(8, 'Tonsil and emotions', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Psychology', NULL, '2019-10-21 11:17:05', 3),
(9, 'Aprendizaje Vicario', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Psychology', NULL, '2019-10-21 11:17:05', 3),
(10, 'How to survive a zombie atack ', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Others', NULL, '2019-10-21 11:17:05', 3),
(11, 'Genius phrases', 'Simplicity is the ultimate sophistication -Leonardo Da Vinci- ', 'Maria', 'Others', NULL, '2019-10-21 11:17:05', 4),
(12, 'AJAX or FETCH?', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Programming', NULL, '2019-10-21 11:17:05', 3),
(13, 'Matias Prats do another joke!', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Social Life', NULL, '2019-10-21 11:17:05', 3),
(14, 'Quark or smaller?', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Physical', NULL, '2019-10-21 11:17:05', 3),
(15, 'MemoryUniverse', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Mistery', NULL, '2019-10-21 11:17:05', 3),
(16, 'short term memory', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Psychology', NULL, '2019-10-21 11:17:05', 3),
(17, 'Sex learning: Gen SRY', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Psychology', NULL, '2019-10-21 11:17:05', 3),
(18, 'El chupacabras!!', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Mistery', NULL, '2019-10-21 11:17:05', 3),
(19, 'Feel the flow: what it is?', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Psychology', NULL, '2019-10-21 11:17:06', 3),
(20, 'Body language!', 'bla bla bla bla bla bla bla bla bla bla', 'Carlos', 'Psychology', NULL, '2019-10-21 11:17:06', 3),
(21, 'Nuevo Gran Hermano 201', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris auctor pretium viverra. Nunc aliquam erat pellentesque arcu consequat efficitur eget eu erat. Integer urna velit, semper non arcu ac, consectetur ornare diam. Pellentesque orci quam, molestie nec ante id, pretium molestie dolor. Nunc sit amet consequat nulla, vel commodo dolor. Vivamus a turpis vitae leo ultricies interdum. Phasellus nec tellus maximus, tincidunt massa sit amet, semper ex. Duis maximus pretium lectus vel porttitor. Proin tincidunt orci in risus faucibus, nec pulvinar mauris molestie. Proin sed ultrices augue. Quisque malesuada neque vel libero pellentesque, quis posuere lorem volutpat.', 'Fran', 'Social Life', 'GH,personas,famosos', '2019-10-21 11:22:27', 2),
(22, 'Como ser  asertivo con las personas', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris auctor pretium viverra. Nunc aliquam erat pellentesque arcu consequat efficitur eget eu erat. Integer urna velit, semper non arcu ac, consectetur ornare diam. Pellentesque orci quam, molestie nec ante id, pretium molestie dolor. Nunc sit amet consequat nulla, vel commodo dolor. Vivamus a turpis vitae leo ultricies interdum. Phasellus nec tellus maximus, tincidunt massa sit amet, semper ex. Duis maximus pretium lectus vel porttitor. Proin tincidunt orci in risus faucibus, nec pulvinar mauris molestie. Proin sed ultrices augue. Quisque malesuada neque vel libero pellentesque, quis posuere lorem volutpat.', 'Fran', 'Psychology', 'personas,asertividad ,psicologia', '2019-10-21 11:23:25', 2),
(23, 'El caso raro de la oveja Dolly', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris auctor pretium viverra. Nunc aliquam erat pellentesque arcu consequat efficitur eget eu erat. Integer urna velit, semper non arcu ac, consectetur ornare diam. Pellentesque orci quam, molestie nec ante id, pretium molestie dolor. Nunc sit amet consequat nulla, vel commodo dolor. Vivamus a turpis vitae leo ultricies interdum. Phasellus nec tellus maximus, tincidunt massa sit amet, semper ex. Duis maximus pretium lectus vel porttitor. Proin tincidunt orci in risus faucibus, nec pulvinar mauris molestie. Proin sed ultrices augue. Quisque malesuada neque vel libero pellentesque, quis posuere lorem volutpat.', 'Fran', 'Mistery', 'ciencia,raro', '2019-10-21 11:24:21', 2),
(24, 'Nuevo Gran Hermano 201', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris auctor pretium viverra. Nunc aliquam erat pellentesque arcu consequat efficitur eget eu erat. Integer urna velit, semper non arcu ac, consectetur ornare diam. Pellentesque orci quam, molestie nec ante id, pretium molestie dolor. Nunc sit amet consequat nulla, vel commodo dolor. Vivamus a turpis vitae leo ultricies interdum. Phasellus nec tellus maximus, tincidunt massa sit amet, semper ex. Duis maximus pretium lectus vel porttitor. Proin tincidunt orci in risus faucibus, nec pulvinar mauris molestie. Proin sed ultrices augue. Quisque malesuada neque vel libero pellentesque, quis posuere lorem volutpat.', 'Fran', 'Social Life', 'GH,personas,famosos', '2019-10-21 11:24:27', 2),
(25, 'Messi vs Cristiano', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris auctor pretium viverra. Nunc aliquam erat pellentesque arcu consequat efficitur eget eu erat. Integer urna velit, semper non arcu ac, consectetur ornare diam. Pellentesque orci quam, molestie nec ante id, pretium molestie dolor. Nunc sit amet consequat nulla, vel commodo dolor. Vivamus a turpis vitae leo ultricies interdum. Phasellus nec tellus maximus, tincidunt massa sit amet, semper ex. Duis maximus pretium lectus vel porttitor. Proin tincidunt orci in risus faucibus, nec pulvinar mauris molestie. Proin sed ultrices augue. Quisque malesuada neque vel libero pellentesque, quis posuere lorem volutpat.', 'Fran', '', 'messi,cr7,cristiano,futbol', '2019-10-21 11:25:13', 2),
(26, 'Como ser  asertivo con las personas', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris auctor pretium viverra. Nunc aliquam erat pellentesque arcu consequat efficitur eget eu erat. Integer urna velit, semper non arcu ac, consectetur ornare diam. Pellentesque orci quam, molestie nec ante id, pretium molestie dolor. Nunc sit amet consequat nulla, vel commodo dolor. Vivamus a turpis vitae leo ultricies interdum. Phasellus nec tellus maximus, tincidunt massa sit amet, semper ex. Duis maximus pretium lectus vel porttitor. Proin tincidunt orci in risus faucibus, nec pulvinar mauris molestie. Proin sed ultrices augue. Quisque malesuada neque vel libero pellentesque, quis posuere lorem volutpat.', 'Fran', 'Psychology', 'personas,asertividad ,psicologia', '2019-10-21 11:25:25', 2),
(27, 'Analizando a messi', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris auctor pretium viverra. Nunc aliquam erat pellentesque arcu consequat efficitur eget eu erat. Integer urna velit, semper non arcu ac, consectetur ornare diam. Pellentesque orci quam, molestie nec ante id, pretium molestie dolor. Nunc sit amet consequat nulla, vel commodo dolor. Vivamus a turpis vitae leo ultricies interdum. Phasellus nec tellus maximus, tincidunt massa sit amet, semper ex. Duis maximus pretium lectus vel porttitor. Proin tincidunt orci in risus faucibus, nec pulvinar mauris molestie. Proin sed ultrices augue. Quisque malesuada neque vel libero pellentesque, quis posuere lorem volutpat.', 'Fran', 'Others', 'messi,futbol', '2019-10-21 11:26:05', 2),
(28, 'El caso raro de la oveja Dolly', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris auctor pretium viverra. Nunc aliquam erat pellentesque arcu consequat efficitur eget eu erat. Integer urna velit, semper non arcu ac, consectetur ornare diam. Pellentesque orci quam, molestie nec ante id, pretium molestie dolor. Nunc sit amet consequat nulla, vel commodo dolor. Vivamus a turpis vitae leo ultricies interdum. Phasellus nec tellus maximus, tincidunt massa sit amet, semper ex. Duis maximus pretium lectus vel porttitor. Proin tincidunt orci in risus faucibus, nec pulvinar mauris molestie. Proin sed ultrices augue. Quisque malesuada neque vel libero pellentesque, quis posuere lorem volutpat.', 'Fran', 'Mistery', 'ciencia,raro', '2019-10-21 11:26:21', 2),
(29, 'Analizando a Cristiano Ronaldo', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris auctor pretium viverra. Nunc aliquam erat pellentesque arcu consequat efficitur eget eu erat. Integer urna velit, semper non arcu ac, consectetur ornare diam. Pellentesque orci quam, molestie nec ante id, pretium molestie dolor. Nunc sit amet consequat nulla, vel commodo dolor. Vivamus a turpis vitae leo ultricies interdum. Phasellus nec tellus maximus, tincidunt massa sit amet, semper ex. Duis maximus pretium lectus vel porttitor. Proin tincidunt orci in risus faucibus, nec pulvinar mauris molestie. Proin sed ultrices augue. Quisque malesuada neque vel libero pellentesque, quis posuere lorem volutpat.', 'Fran', 'Others', 'cr7,cristiano,futbol', '2019-10-21 11:26:30', 2),
(30, 'Messi vs Cristiano', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris auctor pretium viverra. Nunc aliquam erat pellentesque arcu consequat efficitur eget eu erat. Integer urna velit, semper non arcu ac, consectetur ornare diam. Pellentesque orci quam, molestie nec ante id, pretium molestie dolor. Nunc sit amet consequat nulla, vel commodo dolor. Vivamus a turpis vitae leo ultricies interdum. Phasellus nec tellus maximus, tincidunt massa sit amet, semper ex. Duis maximus pretium lectus vel porttitor. Proin tincidunt orci in risus faucibus, nec pulvinar mauris molestie. Proin sed ultrices augue. Quisque malesuada neque vel libero pellentesque, quis posuere lorem volutpat.', 'Fran', '', 'messi,cr7,cristiano,futbol', '2019-10-21 11:27:13', 2),
(31, 'Los quarkz vuelven!', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris auctor pretium viverra. Nunc aliquam erat pellentesque arcu consequat efficitur eget eu erat. Integer urna velit, semper non arcu ac, consectetur ornare diam. Pellentesque orci quam, molestie nec ante id, pretium molestie dolor. Nunc sit amet consequat nulla, vel commodo dolor. Vivamus a turpis vitae leo ultricies interdum. Phasellus nec tellus maximus, tincidunt massa sit amet, semper ex. Duis maximus pretium lectus vel porttitor. Proin tincidunt orci in risus faucibus, nec pulvinar mauris molestie. Proin sed ultrices augue. Quisque malesuada neque vel libero pellentesque, quis posuere lorem volutpat.', 'Fran', 'Physical', 'ciencia', '2019-10-21 11:27:35', 2),
(32, 'Analizando a messi', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris auctor pretium viverra. Nunc aliquam erat pellentesque arcu consequat efficitur eget eu erat. Integer urna velit, semper non arcu ac, consectetur ornare diam. Pellentesque orci quam, molestie nec ante id, pretium molestie dolor. Nunc sit amet consequat nulla, vel commodo dolor. Vivamus a turpis vitae leo ultricies interdum. Phasellus nec tellus maximus, tincidunt massa sit amet, semper ex. Duis maximus pretium lectus vel porttitor. Proin tincidunt orci in risus faucibus, nec pulvinar mauris molestie. Proin sed ultrices augue. Quisque malesuada neque vel libero pellentesque, quis posuere lorem volutpat.', 'Fran', 'Others', 'messi,futbol', '2019-10-21 11:28:05', 2),
(33, 'Analizando a Cristiano Ronaldo', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris auctor pretium viverra. Nunc aliquam erat pellentesque arcu consequat efficitur eget eu erat. Integer urna velit, semper non arcu ac, consectetur ornare diam. Pellentesque orci quam, molestie nec ante id, pretium molestie dolor. Nunc sit amet consequat nulla, vel commodo dolor. Vivamus a turpis vitae leo ultricies interdum. Phasellus nec tellus maximus, tincidunt massa sit amet, semper ex. Duis maximus pretium lectus vel porttitor. Proin tincidunt orci in risus faucibus, nec pulvinar mauris molestie. Proin sed ultrices augue. Quisque malesuada neque vel libero pellentesque, quis posuere lorem volutpat.', 'Fran', 'Others', 'cr7,cristiano,futbol', '2019-10-21 11:28:30', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forumposts`
--

CREATE TABLE `forumposts` (
  `id_forumpost` int(11) NOT NULL,
  `titleforumpost` varchar(50) NOT NULL,
  `textforumpost` text NOT NULL,
  `autorforumpost` varchar(50) NOT NULL,
  `categoryforumpost` varchar(50) NOT NULL,
  `tagsforumpost` varchar(100) DEFAULT NULL,
  `data_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `forumposts`
--

INSERT INTO `forumposts` (`id_forumpost`, `titleforumpost`, `textforumpost`, `autorforumpost`, `categoryforumpost`, `tagsforumpost`, `data_created`, `id_user`) VALUES
(1, 'Por que...', 'tra tra tra tra tra tra tra tra tra tra tra', 'Juan', 'Psychology', NULL, '2019-10-21 11:17:06', 1),
(2, 'Y si...', 'tra tra tra tra tra tra tra tra tra tra tra', 'Juan', 'Mistery', NULL, '2019-10-21 11:17:06', 1),
(3, 'Que piensan de...', 'tra tra tra tra tra tra tra tra tra tra tra', 'Fran', 'Others', NULL, '2019-10-21 11:17:06', 2),
(4, 'Alguna vez...', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris auctor pretium viverra. Nunc aliquam erat pellentesque arcu consequat efficitur eget eu erat. Integer urna velit, semper non arcu ac, consectetur ornare diam. Pellentesque orci quam, molestie nec ante id, pretium molestie dolor. Nunc sit amet consequat nulla, vel commodo dolor. Vivamus a turpis vitae leo ultricies interdum. Phasellus nec tellus maximus, tincidunt massa sit amet, semper ex. Duis maximus pretium lectus vel porttitor. Proin tincidunt orci in risus faucibus, nec pulvinar mauris molestie. Proin sed ultrices augue. Quisque malesuada neque vel libero pellentesque, quis posuere lorem volutpat.', 'Fran', 'Others', 'raro,once', '2019-10-21 11:29:33', 2),
(5, 'El otro dia por la calle...', '', 'Fran', 'Mistery', 'raro,street', '2019-10-21 11:30:05', 2),
(6, 'advices about mind health', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris auctor pretium viverra. Nunc aliquam erat pellentesque arcu consequat efficitur eget eu erat. Integer urna velit, semper non arcu ac, consectetur ornare diam. Pellentesque orci quam, molestie nec ante id, pretium molestie dolor. Nunc sit amet consequat nulla, vel commodo dolor. Vivamus a turpis vitae leo ultricies interdum. Phasellus nec tellus maximus, tincidunt massa sit amet, semper ex. Duis maximus pretium lectus vel porttitor. Proin tincidunt orci in risus faucibus, nec pulvinar mauris molestie. Proin sed ultrices augue. Quisque malesuada neque vel libero pellentesque, quis posuere lorem volutpat.', 'Fran', 'Psychology', 'health,mind,advices', '2019-10-21 11:30:34', 2),
(7, 'Vue or Angular?', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris auctor pretium viverra. Nunc aliquam erat pellentesque arcu consequat efficitur eget eu erat. Integer urna velit, semper non arcu ac, consectetur ornare diam. Pellentesque orci quam, molestie nec ante id, pretium molestie dolor. Nunc sit amet consequat nulla, vel commodo dolor. Vivamus a turpis vitae leo ultricies interdum. Phasellus nec tellus maximus, tincidunt massa sit amet, semper ex. Duis maximus pretium lectus vel porttitor. Proin tincidunt orci in risus faucibus, nec pulvinar mauris molestie. Proin sed ultrices augue. Quisque malesuada neque vel libero pellentesque, quis posuere lorem volutpat.', 'Fran', 'Programming', 'developer,vue,angular', '2019-10-21 11:31:07', 2),
(8, 'what is about Vue?', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris auctor pretium viverra. Nunc aliquam erat pellentesque arcu consequat efficitur eget eu erat. Integer urna velit, semper non arcu ac, consectetur ornare diam. Pellentesque orci quam, molestie nec ante id, pretium molestie dolor. Nunc sit amet consequat nulla, vel commodo dolor. Vivamus a turpis vitae leo ultricies interdum. Phasellus nec tellus maximus, tincidunt massa sit amet, semper ex. Duis maximus pretium lectus vel porttitor. Proin tincidunt orci in risus faucibus, nec pulvinar mauris molestie. Proin sed ultrices augue. Quisque malesuada neque vel libero pellentesque, quis posuere lorem volutpat.', 'Fran', 'Programming', 'vue,programming', '2019-10-21 11:31:28', 2),
(9, 'Black hole . what do you think...?', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris auctor pretium viverra. Nunc aliquam erat pellentesque arcu consequat efficitur eget eu erat. Integer urna velit, semper non arcu ac, consectetur ornare diam. Pellentesque orci quam, molestie nec ante id, pretium molestie dolor. Nunc sit amet consequat nulla, vel commodo dolor. Vivamus a turpis vitae leo ultricies interdum. Phasellus nec tellus maximus, tincidunt massa sit amet, semper ex. Duis maximus pretium lectus vel porttitor. Proin tincidunt orci in risus faucibus, nec pulvinar mauris molestie. Proin sed ultrices augue. Quisque malesuada neque vel libero pellentesque, quis posuere lorem volutpat.', 'Fran', 'Physical', 'hole,black,think', '2019-10-21 11:31:57', 2),
(10, 'the popular social thought', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris auctor pretium viverra. Nunc aliquam erat pellentesque arcu consequat efficitur eget eu erat. Integer urna velit, semper non arcu ac, consectetur ornare diam. Pellentesque orci quam, molestie nec ante id, pretium molestie dolor. Nunc sit amet consequat nulla, vel commodo dolor. Vivamus a turpis vitae leo ultricies interdum. Phasellus nec tellus maximus, tincidunt massa sit amet, semper ex. Duis maximus pretium lectus vel porttitor. Proin tincidunt orci in risus faucibus, nec pulvinar mauris molestie. Proin sed ultrices augue. Quisque malesuada neque vel libero pellentesque, quis posuere lorem volutpat.', 'Fran', 'Social Life', 'think,thought,social', '2019-10-21 11:32:29', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `useremail` varchar(50) NOT NULL,
  `userpassword` varchar(100) NOT NULL,
  `userage` int(11) DEFAULT NULL,
  `data_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_user`, `username`, `useremail`, `userpassword`, `userage`, `data_created`) VALUES
(1, 'Juan', 'juan@hotmail.com', 'juan1234', 25, '2019-10-21 11:17:04'),
(2, 'Fran', 'fran@hotmail.com', 'fran1234', 22, '2019-10-21 11:17:04'),
(3, 'Carlos', 'carlos@hotmail.com', 'carlos1234', 29, '2019-10-21 11:17:04'),
(4, 'Maria', 'maria@hotmail.com', 'maria1234', 39, '2019-10-21 11:17:05'),
(5, 'Elena', 'Elena@hotmail.com', 'Elena1234', 25, '2019-10-21 11:17:05'),
(6, 'Alberto', 'alberto@hotmail.com', 'alberto1234', 34, '2019-10-21 11:17:05'),
(7, 'Isabel', 'isabel@hotmail.com', 'isabel1234', 19, '2019-10-21 11:17:05');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id_article`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `forumposts`
--
ALTER TABLE `forumposts`
  ADD PRIMARY KEY (`id_forumpost`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articles`
--
ALTER TABLE `articles`
  MODIFY `id_article` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `forumposts`
--
ALTER TABLE `forumposts`
  MODIFY `id_forumpost` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Filtros para la tabla `forumposts`
--
ALTER TABLE `forumposts`
  ADD CONSTRAINT `forumposts_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
