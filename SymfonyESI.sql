-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 23 jan. 2019 à 13:51
-- Version du serveur :  5.7.21
-- Version de PHP :  7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `symfonyesi`
--
CREATE DATABASE IF NOT EXISTS `symfonyesi` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `symfonyesi`;

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

DROP TABLE IF EXISTS `cours`;
CREATE TABLE IF NOT EXISTS `cours` (
  `ID_Cours` int(10) NOT NULL AUTO_INCREMENT,
  `Moment_Journee` tinyint(1) NOT NULL,
  `Nb_Heures` int(3) NOT NULL,
  `ID_Jour` int(10) NOT NULL,
  `ID_Matiere` int(10) NOT NULL,
  PRIMARY KEY (`ID_Cours`),
  KEY `ID_Jour` (`ID_Jour`),
  KEY `ID_Matiere` (`ID_Matiere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

DROP TABLE IF EXISTS `etat`;
CREATE TABLE IF NOT EXISTS `etat` (
  `ID_Etat` int(10) NOT NULL AUTO_INCREMENT,
  `Libelle` varchar(2) NOT NULL,
  PRIMARY KEY (`ID_Etat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `jour`
--

DROP TABLE IF EXISTS `jour`;
CREATE TABLE IF NOT EXISTS `jour` (
  `ID_Jour` int(10) NOT NULL AUTO_INCREMENT,
  `Date_Jour` date NOT NULL,
  `ID_Etat` int(10) NOT NULL,
  `ID_Semaine` int(10) NOT NULL,
  PRIMARY KEY (`ID_Jour`),
  KEY `ID_Etat` (`ID_Etat`),
  KEY `ID_Semaine` (`ID_Semaine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `ID_Matiere` int(10) NOT NULL AUTO_INCREMENT,
  `Nom_Matiere` varchar(100) NOT NULL,
  `Nb_Heure` int(3) NOT NULL,
  `Initiales` varchar(20) NOT NULL,
  `ID_Intervenant` int(10) NOT NULL,
  PRIMARY KEY (`ID_Matiere`),
  KEY `ID_Intervenant` (`ID_Intervenant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `ID_Message` int(10) NOT NULL AUTO_INCREMENT,
  `Contenu` varchar(1000) NOT NULL,
  `ID_Expediteur` int(10) NOT NULL,
  `ID_Destinataire` int(10) NOT NULL,
  PRIMARY KEY (`ID_Message`),
  KEY `ID_Destinataire` (`ID_Destinataire`),
  KEY `ID_Expediteur` (`ID_Expediteur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

DROP TABLE IF EXISTS `personnel`;
CREATE TABLE IF NOT EXISTS `personnel` (
  `ID_Personnel` int(10) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Num_Tel` varchar(10) NOT NULL,
  `Mail` varchar(30) NOT NULL,
  `Est_Intervenant` tinyint(1) NOT NULL,
  `Mdp` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_Personnel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `semaine`
--

DROP TABLE IF EXISTS `semaine`;
CREATE TABLE IF NOT EXISTS `semaine` (
  `ID_Semaine` int(10) NOT NULL AUTO_INCREMENT,
  `Date_Debut` date NOT NULL,
  `Date_Fin` date NOT NULL,
  PRIMARY KEY (`ID_Semaine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cours`
--
ALTER TABLE `cours`
  ADD CONSTRAINT `cours_ibfk_1` FOREIGN KEY (`ID_Jour`) REFERENCES `jour` (`ID_Jour`),
  ADD CONSTRAINT `cours_ibfk_2` FOREIGN KEY (`ID_Matiere`) REFERENCES `matiere` (`ID_Matiere`);

--
-- Contraintes pour la table `jour`
--
ALTER TABLE `jour`
  ADD CONSTRAINT `jour_ibfk_1` FOREIGN KEY (`ID_Etat`) REFERENCES `etat` (`ID_Etat`),
  ADD CONSTRAINT `jour_ibfk_2` FOREIGN KEY (`ID_Semaine`) REFERENCES `semaine` (`ID_Semaine`);

--
-- Contraintes pour la table `matiere`
--
ALTER TABLE `matiere`
  ADD CONSTRAINT `matiere_ibfk_1` FOREIGN KEY (`ID_Intervenant`) REFERENCES `personnel` (`ID_Personnel`);

--
-- Contraintes pour la table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`ID_Destinataire`) REFERENCES `personnel` (`ID_Personnel`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`ID_Expediteur`) REFERENCES `personnel` (`ID_Personnel`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
