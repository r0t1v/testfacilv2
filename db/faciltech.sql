-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13-Maio-2023 às 18:26
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `faciltech`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_banco`
--

CREATE TABLE `tb_banco` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_banco`
--

INSERT INTO `tb_banco` (`codigo`, `nome`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_contrato`
--

CREATE TABLE `tb_contrato` (
  `codigo` int(11) NOT NULL,
  `prazo` date DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `data_inclusao` date DEFAULT NULL,
  `convenio_servico` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_contrato`
--

INSERT INTO `tb_contrato` (`codigo`, `prazo`, `valor`, `data_inclusao`, `convenio_servico`) VALUES
(1, '2000-02-01', 200, '2000-01-01', 1),
(2, '2000-03-01', 500, '2000-01-01', 2),
(3, '2000-04-01', 800, '2000-01-01', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_convenio`
--

CREATE TABLE `tb_convenio` (
  `codigo` int(11) NOT NULL,
  `convenio` int(11) DEFAULT NULL,
  `verba` double DEFAULT NULL,
  `banco` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_convenio`
--

INSERT INTO `tb_convenio` (`codigo`, `convenio`, `verba`, `banco`) VALUES
(1, 1, 12000, 1),
(2, 2, 2000, 2),
(3, 3, 8000, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_convenio_servico`
--

CREATE TABLE `tb_convenio_servico` (
  `codigo` int(11) NOT NULL,
  `convenio` int(11) DEFAULT NULL,
  `servico` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tb_convenio_servico`
--

INSERT INTO `tb_convenio_servico` (`codigo`, `convenio`, `servico`) VALUES
(1, 1, 'SAUDE'),
(2, 2, 'ALIMENTACAO'),
(3, 3, 'MORADIA');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tb_banco`
--
ALTER TABLE `tb_banco`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices para tabela `tb_contrato`
--
ALTER TABLE `tb_contrato`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `convenio_servico` (`convenio_servico`);

--
-- Índices para tabela `tb_convenio`
--
ALTER TABLE `tb_convenio`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `banco` (`banco`),
  ADD KEY `convenio` (`convenio`);

--
-- Índices para tabela `tb_convenio_servico`
--
ALTER TABLE `tb_convenio_servico`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `tb_convenio` (`convenio`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_banco`
--
ALTER TABLE `tb_banco`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_contrato`
--
ALTER TABLE `tb_contrato`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_convenio`
--
ALTER TABLE `tb_convenio`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_convenio_servico`
--
ALTER TABLE `tb_convenio_servico`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tb_contrato`
--
ALTER TABLE `tb_contrato`
  ADD CONSTRAINT `tb_contrato_ibfk_1` FOREIGN KEY (`convenio_servico`) REFERENCES `tb_convenio_servico` (`codigo`);

--
-- Limitadores para a tabela `tb_convenio`
--
ALTER TABLE `tb_convenio`
  ADD CONSTRAINT `tb_convenio_ibfk_1` FOREIGN KEY (`banco`) REFERENCES `tb_banco` (`codigo`);

--
-- Limitadores para a tabela `tb_convenio_servico`
--
ALTER TABLE `tb_convenio_servico`
  ADD CONSTRAINT `tb_convenio` FOREIGN KEY (`convenio`) REFERENCES `tb_convenio` (`convenio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
