-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 27 avr. 2024 à 12:09
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `matchadb`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`) VALUES
('1111', 'yassine amri', 'yassinamri156@gmail.com', '1234'),
('1115', 'imen sdiri', 'imensdiri@esen.tn', 'azerty123');

-- --------------------------------------------------------

--
-- Structure de la table `cart`
--

CREATE TABLE `cart` (
  `id` varchar(20) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `product_id` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `price`, `qty`) VALUES
('7BqKQ6qcA3IWon4lCHjL', '', '1114', 85, 1),
('8QQSZWKpU1CfpO2qVRDb', '', '1120', 46, 1);

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `id` varchar(20) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(25) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` varchar(20) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `address_type` varchar(10) NOT NULL,
  `methode` varchar(50) NOT NULL,
  `product_id` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` varchar(2) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `payment_status` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` varchar(20) NOT NULL,
  `name` varchar(250) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `product_detail` varchar(1000) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`, `product_detail`, `status`) VALUES
('1111', 'Cocoa Chai Matcha Tea', 65, '../images/spicy shy.png', 'CHAI TEA POWDER 100% ORGANIC\r\nHigh quality organic spicy chai tea powder with cocoa. Discover the perfect blend of organic cocoa and spicy chai tea powder.', 'CHAI TEA POWDER 100% ORGANIC'),
('1112', 'Original Matcha Tea', 66, '../images/matcha organic', '100% ORGANIC GREEN TEA POWER\r\nCeremonial quality organic matcha tea powder from Uji, Kyoto, Japan. Sweet and pleasant flavor.', '100% ORGANIC GREEN TEA POWER'),
('1113', 'Premium Matcha Tea', 112, '../images/premium.png', '100% ORGANIC GREEN TEA POWDER\r\nHigh quality ceremonial quality organic matcha tea powder from Uji, Kyoto, Japan. Natural flavor slightly sweet and pleasant.', '100% ORGANIC GREEN TEA POWDER\r\n'),
('1114', 'Culinary Matcha Tea', 85, '../images/Culinary.png', '100% ORGANIC GREEN TEA POWDER\r\nCulinary quality organic matcha tea powder from Uji, Kyoto, Japan. Perfect flavor to make recipes with matcha tea.', '100% ORGANIC GREEN TEA POWDER'),
('1115', 'Matcha Balance Set', 155, '../images/set1.png', 'TWO QUALITIES MATCHA SET\r\nIdeal for taking matcha at home, at work or to take with you and consume at any time. With this set you can compare and taste two qualities of matcha.', 'MATCHA SET'),
('1116', 'Ritual Expert Set', 214, '../images/set2.png', 'PREMIUM MATCHA SET\r\nWith this set, making matcha is quick and easy. With the measuring spoon, your matcha always stays the same, and the bamboo whisk will help you completely dissolve the matcha and create a thin layer of foam.', 'PREMIUM MATCHA SET'),
('1117', 'Advanced Matcha Set', 141, '../images/packet1.png', 'TWO QUALITIES MATCHA SET\r\nWith this set, making matcha is quick and easy: with the measuring spoon, your matcha always stays the same and the bamboo whisk will help you dissolve the matcha completely and create a thin layer of foam.', 'TWO QUALITIES MATCHA SET'),
('1118', 'Erythritol Organic', 49, '../images/Erythritol.png', 'THE ALTERNATIVE TO SUGAR\r\nWith a sweet and pleasant taste that, unlike sugar, does not affect blood sugar levels and has a very low number of calories.', 'THE ALTERNATIVE TO SUGAR\r\n'),
('1119', 'Chawan Ceramic Bowl', 79, '../images/bowl.png', 'MATCHA PREPARATION ESSENTIALS\r\nThis unique Chawan ceramic bowl is a timeless and elegant work of art, handcrafted with love and care. Enjoy the beauty of classic enamel and ceramics that will last for years', 'MATCHA PREPARATION ESSENTIALS'),
('1120', 'Chasen Bamboo Whisk', 46, '../images/bamboo.png', 'MATCHA PREPARATION ESSENTIALS\r\nThe 100 tooth bamboo or chasen whisk is a traditional Japanese accessory, which is used to dissolve matcha green tea.\r\n', 'MATCHA PREPARATION ESSENTIALS'),
('1121', 'Electric foamer', 132, '../images/foamer.png', 'QUICK MATCHA PREPARATION\r\nThe perfect accessory for those who want to dissolve matcha faster. It is also perfect for frothing milk, whether hot or cold.', 'QUICK MATCHA PREPARATION'),
('1122', 'Matcha measuring spoon', 19, '../images/spoon.png', 'MATCHA PREPARATION ESSENTIALS\r\nProduced with highly resistant stainless steel (18/10), it has the exact measurement of 1 gram of matcha tea.', 'MATCHA PREPARATION ESSENTIALS\r\n');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `user_type` varchar(100) NOT NULL DEFAULT 'user'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_type`) VALUES
('Ohtzkt680zq5TwP69YEv', 'imen sdiri', 'imen.sdiri@esen.tn', 'imen123', 'user'),
('p2MXrcSofh7hZnWdL8nI', 'oussema', 'khemirioussama@gmail.com', '123', 'user'),
('oZLnwqq2Jzmd24yTPCPR', 'wwssemaa', 'oussemaa@bb.tt', '123', 'user'),
('JApY0AWGDUrqbBn04S0c', 'yacine', 'yacine@gmail.com', 'yacine123', 'user'),
('5KFzQ3HPdxeQm1Ve54u3', 'ali rihani', 'alirihani@gmail.com', 'ali123', 'user'),
('daKJmBmAVqB5OSYMfMtJ', 'slma', 'salma@gmail', 'salma', 'user'),
('BayWQ5m8RjmZtsaFk4bz', 'zeineb amri', 'zeinebamri@gmail.com', '1223', 'user');

-- --------------------------------------------------------

--
-- Structure de la table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` varchar(20) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `product_id` varchar(20) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `product_id`, `price`) VALUES
('v3vLeHPDmOGZWDoC69UM', '', '1119', 79),
('0IBJHKdJ4bwbKCvkBv3h', '', '1118', 49),
('mLb1dvMkm6UJr3cLp2VJ', '', '1113', 112),
('QacietrvIljAfKnixuIw', '', '1112', 66);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
