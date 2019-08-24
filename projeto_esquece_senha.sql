-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 08-Nov-2017 às 21:15
-- Versão do servidor: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projeto_esquece_senha`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `email`, `senha`) VALUES
(1, 'paulojoao@unesc.net', 'a87ff679a2f3e71d9181a67b7542122c'),
(2, 'delfina@unesc.net', 'c81e728d9d4c2f636f067f89cc14862c');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_token`
--

CREATE TABLE `usuario_token` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `expirado_em` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuario_token`
--

INSERT INTO `usuario_token` (`id`, `id_usuario`, `hash`, `used`, `expirado_em`) VALUES
(9, 1, '0a39403a00f09837c2f9d7605022e258', 1, '2017-10-01 22:55:00'),
(10, 1, 'c4fbb6c22fdeb60112b3a37e9fba9786', 1, '2017-10-01 22:56:00'),
(11, 1, '8664ef84e74cbea64739e35997b797ef', 1, '2017-10-01 22:58:00'),
(12, 1, 'aeec9de1e74bf9c008eb7de0c6b01fa9', 1, '2017-10-01 22:58:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indexes for table `usuario_token`
--
ALTER TABLE `usuario_token`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `usuario_token`
--
ALTER TABLE `usuario_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
