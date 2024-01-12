-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 12. Jan 2024 um 21:31
-- Server-Version: 10.4.28-MariaDB
-- PHP-Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `webshopdatabase`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `order`
--

CREATE TABLE `order` (
  `OrderID` char(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Amount` int(11) NOT NULL DEFAULT 1,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `Versand` varchar(50) DEFAULT NULL,
  `finalSum` float DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `product`
--

CREATE TABLE `product` (
  `ProductID` int(10) NOT NULL,
  `TYP` varchar(50) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Price` float NOT NULL,
  `Img` varchar(300) DEFAULT NULL,
  `ProductDescription` text DEFAULT NULL,
  `ProductInfos` text DEFAULT NULL,
  `Stock` int(10) DEFAULT NULL
) ;

--
-- Daten für Tabelle `product`
--

INSERT INTO `product` (`ProductID`, `TYP`, `Name`, `Price`, `Img`, `ProductDescription`, `ProductInfos`, `Stock`) VALUES
(1, 'SmartPhone', 'IPhone14 PRO', 1299, 'iphone14pro.jpg', 'The Iphone 14 PRO is the newest IPhone on the market and is uncompareable with any Other. There is no reason to not buy one!', '6 Core CPU A16 Bionic Chip', 1000),
(2, 'SmartPhone', 'IPhone14', 999, 'iphone14.jpg', 'The Iphone 14 is a very Modern Phone. Buy It if you do not have money for a IPhone 14 Pro! ', '5 Core CPU A15 Bionic Chip', 1000),
(3, 'SmartPhone', 'IPhone13', 799, 'iphone13.jpg', 'The Iphone 13 is a bit older then the IPhone 14 Series but also not bad.', '4 Core CPU A15 Bionic Chip', 1000),
(4, 'SmartPhone', 'IPhone SE (Hä hast du kein geld für was besseres?)', 549, 'iphonese.jpg', 'No money to buy the other SmartPhones from Apple. No problem the IPhone SE was made just for you!', '4 Core CPU A15 Bionic Chip', 1000),
(5, 'PC', 'Mac Studio', 2399, 'macstudio.jpg', 'To much money and dont like windows PCs? Then buy the Mac Studio!', '12 Core CPU M2 MAX Bionic Chip', 1000),
(6, 'PC', 'MacBook Pro', 2399, 'macbookpro.jpg', 'To much money and dont like windows Desktops? Then buy the MacBook Pro!', '12 Core CPU M2 MAX Bionic Chip', 1000),
(7, 'PC', 'IMac', 1549, 'imac.jpg', 'Want to waste your money and buy everything from Apple? Then also buy this one.', '8 Core CPU M1 Bionic Chip', 1000),
(8, 'Equipment', 'Apple Watch Ultra', 999, 'applewatchultra.jpg', 'You have enough money to invest into a Rolex but want to waste it intsed? Buy the Apple Watch Ultra', 'Dual Core S8 Chip', 1000),
(9, 'Equipment', 'AirPods Pro 2', 299, 'airpodspro2.jpg', 'You do not want to hear you surroundings and also want to flex? Buy the AirPods Pro 2', 'H1 Headset Chip', 1000),
(10, 'Equipment', 'AirPods Max', 629, 'airpodsmax.jpg', 'You do not want to hear you surroundings, want to flex and dont like Inear headset? Buy the AirPods Max!', 'H1 Headset Chip', 1000),
(11, 'Equipment', 'Apple Watch Ultra 2', 829, 'applewatchultra2.jpg', 'You have enough money to invest into a Rolex but want to waste it intsed? Buy the Apple Watch Ultra 2. It is made aut of titanium!!!', 'H1 Headset Chip', 1000);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shoppingcart`
--

CREATE TABLE `shoppingcart` (
  `UserID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Amount` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `UserID` int(10) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `Password` varchar(500) NOT NULL,
  `Google2FSecret` varchar(50) NOT NULL,
  `LoginStatus` int(11) NOT NULL DEFAULT 0,
  `OnlineStatus` tinyint(1) NOT NULL,
  `LastOnline` datetime DEFAULT NULL,
  `Resolution` varchar(50) DEFAULT NULL
) ;

--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `useronline`
--

CREATE TABLE `useronline` (
  `ID` int(10) NOT NULL,
  `numOnline` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `useronline`
--

INSERT INTO `useronline` (`ID`, `numOnline`) VALUES
(0, 0);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`OrderID`,`UserID`,`ProductID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indizes für die Tabelle `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indizes für die Tabelle `shoppingcart`
--
ALTER TABLE `shoppingcart`
  ADD PRIMARY KEY (`UserID`,`ProductID`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- Indizes für die Tabelle `useronline`
--
ALTER TABLE `useronline`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `product`
--
ALTER TABLE `product`
  MODIFY `ProductID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
