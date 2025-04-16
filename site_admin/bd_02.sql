-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16-Abr-2025 às 14:20
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_02`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tlm` varchar(9) NOT NULL,
  `username` varchar(50) NOT NULL,
  `pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `admin`
--

INSERT INTO `admin` (`id`, `nome`, `email`, `tlm`, `username`, `pass`) VALUES
(2, '', '', '', 'ruby', '123'),
(4, '', '', '', 'filipa', '999'),
(6, 'Filipa Loureiro', 'filipairinaloureiro@gmail.com', '919191912', 'floureiro', '$2y$10$OZgiPyFZR.n/W7nbIaGqYeVPpF3DnPvbFju077oox.ju5hOrScBFi'),
(7, 'Ruby Macedo', 'rubym@gmail.com', '912222654', 'ruby', '$2y$10$JPun3WVMdKnQTmAx3Kjzo.5cSvmdgGvrjbZTlKWIS3l.bmCVTCGm6'),
(8, 'Liliana Rocha', 'lil_roc@gmail.com', '911999000', 'lili', '$2y$10$gePpJGh0SGWeDvprCg5yNe1brjKLWy4yvo4vuxTtF2pig/L1my7BC');

-- --------------------------------------------------------

--
-- Estrutura da tabela `artigo`
--

CREATE TABLE `artigo` (
  `id` int(11) NOT NULL,
  `descr` varchar(100) NOT NULL,
  `ano` int(4) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `preco` decimal(8,2) NOT NULL,
  `foto` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `artigo`
--

INSERT INTO `artigo` (`id`, `descr`, `ano`, `id_marca`, `id_categoria`, `preco`, `foto`) VALUES
(4, 'Relógio Rolex Oyster Date', 1965, 5, 1, 3200.90, 'https://www.hashtagwatchco.com/products/rolex-date-15223-oyster-perpetual-two-tone-steel-gold-jubilee-wristwatch-circa-1989'),
(6, 'Vestido de Seda Vintage 1920\'s', 1920, 8, 2, 120.00, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.jywal.com%2Fwp-content%2Fuploads%2FJYWAL-646_2.jpg&f=1&nofb=1&ipt=e476bccdec3548b41e7772257854cd975a249a9fcb50fc065124b221e935d0b6'),
(7, 'Disco de Vinil - Introducing... The Beatles', 1964, 11, 6, 56.49, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimages.pristineauction.com%2F146%2F1465119%2Fmain_1585936848-Vintage-1964-The-Beatles-Introducing-The-Beatles-Vinyl-Record-Album-PristineAuc'),
(8, 'Moeda de Dólar - Estados Unidos da América', 1796, 12, 10, 34.00, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimages.bonanzastatic.com%2Fafu%2Fimages%2Fa584%2Fb41f%2F9ab6_9659996022%2F1796_liberty_coin1.jpg&f=1&nofb=1&ipt=daaed68e03ee1f126d1e362ff66b'),
(9, 'Livro \"Orgulho e Preconceito\" - Jane Austen', 1893, 13, 8, 55.00, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2F736x%2F06%2F0d%2Fce%2F060dce14783c3d7ceca223df41165097--vintage-book-covers-pride-and-prejudice.jpg&f=1&nofb=1&ipt=979d0f6283'),
(10, 'Brinquedo Camião de Ferro', 1936, 9, 9, 32.00, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F1f%2F6d%2F84%2F1f6d84696b0c770a39c905194819c8cb.jpg&f=1&nofb=1&ipt=55e81bae91b99cfba82bd22a460338e52d0cb80da84e65'),
(11, 'Corset Circa Vitoriano', 1880, 8, 2, 45.00, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F24%2F37%2F15%2F243715bb2bc782e5bde56a81c29b9e57.jpg&f=1&nofb=1&ipt=7e655f907bcb71a54ccfaae71eaa77cbb7499cb97087d2');

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrinho`
--

CREATE TABLE `carrinho` (
  `id_carrinho` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `id_artigo` int(11) NOT NULL,
  `qtd` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `carrinho`
--

INSERT INTO `carrinho` (`id_carrinho`, `username`, `id_artigo`, `qtd`) VALUES
(4, 'rui', 3, 2),
(5, 'rui', 2, 4),
(6, 'ana', 1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`) VALUES
(1, 'Joalheria & Relógios'),
(2, 'Moda'),
(5, 'Casa & Decoração'),
(6, 'Música & Som'),
(7, 'Tecnologia Retro'),
(8, 'Livros & Papelaria'),
(9, 'Brinquedos & Jogos'),
(10, 'Coleções'),
(11, 'Miscelânia');

-- --------------------------------------------------------

--
-- Estrutura da tabela `favoritos`
--

CREATE TABLE `favoritos` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `id_artigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `favoritos`
--

INSERT INTO `favoritos` (`id`, `username`, `id_artigo`) VALUES
(7, 'rui', 3),
(11, 'ana', 2),
(12, 'ana', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `marca`
--

CREATE TABLE `marca` (
  `id` int(11) NOT NULL,
  `marca` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `marca`
--

INSERT INTO `marca` (`id`, `marca`) VALUES
(1, 'Stradivarius'),
(5, 'Rolex'),
(6, 'Nike'),
(8, 'Dressing Vintage'),
(9, 'Happy Toys'),
(10, 'House&Rules'),
(11, 'Retro Music, Lda.'),
(12, 'Indefinido'),
(13, 'Miles & Miles'),
(14, 'Hubley');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `tlm` varchar(9) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `nome`, `email`, `tlm`, `username`, `password`) VALUES
(1, 'Rui', 'rui_borges@gmail.com', '923876456', 'rui', '123'),
(2, 'Ana Catarina', 'ana@outlook.pt', '912878765', 'ana', '456');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `artigo`
--
ALTER TABLE `artigo`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD PRIMARY KEY (`id_carrinho`);

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `artigo`
--
ALTER TABLE `artigo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `carrinho`
--
ALTER TABLE `carrinho`
  MODIFY `id_carrinho` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de tabela `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
