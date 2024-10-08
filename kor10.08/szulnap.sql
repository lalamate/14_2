-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Okt 08. 11:42
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `szulnap`
--
CREATE DATABASE IF NOT EXISTS `szulnap` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `szulnap`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szuletesnapok`
--

CREATE TABLE `szuletesnapok` (
  `vnev` varchar(8) DEFAULT NULL,
  `knev` varchar(8) DEFAULT NULL,
  `szul` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `szuletesnapok`
--

INSERT INTO `szuletesnapok` (`vnev`, `knev`, `szul`) VALUES
('Lakatos', 'Flóra', '1978-08-29'),
('Orsós', 'Kinga', '1985-09-29'),
('Orosz', 'Viktória', '1978-03-28'),
('Bálint', 'Gréta', '1975-12-05'),
('Barta', 'Donát', '1988-12-22'),
('Török', 'Richárd', '1972-03-15'),
('Orbán', 'Zente', '1981-08-07'),
('Papp', 'Milla', '1989-12-03'),
('Szőke', 'Gábor', '1978-04-20'),
('Soós', 'Roland', '1978-03-09'),
('Gáspár', 'Rebeka', '1976-05-10'),
('Balázs', 'Anna', '1988-12-23'),
('Lukács', 'Imre', '1991-06-07'),
('Sándor', 'Emili', '1991-02-13'),
('Csonka', 'Linett', '1995-12-20'),
('Balázs', 'Nándor', '1984-03-24'),
('Juhász', 'Máté', '1979-11-09'),
('Fülöp', 'János', '1973-04-27'),
('Fülöp', 'Lili', '1998-09-22'),
('Jakab', 'Emese', '1970-10-02'),
('Takács', 'Miklós', '1985-02-08'),
('Hegedüs', 'Hanga', '1973-03-02'),
('Fülöp', 'Barbara', '1977-12-13'),
('Szilágyi', 'Bíborka', '1998-02-01'),
('Soós', 'György', '1979-11-26'),
('Jónás', 'Péter', '1976-01-24'),
('Faragó', 'Elena', '1983-11-10'),
('Budai', 'Linett', '1980-02-24'),
('Gáspár', 'Áron', '1984-03-21'),
('Orsós', 'Petra', '1975-06-04'),
('Pataki', 'Panna', '1998-03-25'),
('Balogh', 'Liza', '1985-01-02'),
('Tamás', 'Szofi', '1999-05-05'),
('Bakos', 'Péter', '1975-08-12'),
('Illés', 'Mihály', '1993-11-04'),
('Horváth', 'Hunor', '1981-03-24'),
('Kovács', 'György', '1972-02-12'),
('Halász', 'Richárd', '1988-07-25'),
('Orosz', 'Panna', '1985-07-13'),
('Antal', 'Bendegúz', '1975-06-03'),
('Hegedűs', 'József', '1979-04-17'),
('Veres', 'Lara', '1983-02-03'),
('Lakatos', 'Fanni', '1972-11-26'),
('Szabó', 'Benedek', '1980-01-28'),
('Bogdán', 'Csongor', '1992-09-25'),
('Kiss', 'Benett', '1994-03-04'),
('Tóth', 'Barnabás', '1984-02-07'),
('Bognár', 'Ármin', '1996-03-07'),
('Orsós', 'Luca', '1971-01-29'),
('Major', 'Áron', '1987-03-18'),
('Szabó', 'Bíborka', '1986-05-29'),
('Illés', 'Csaba', '1992-02-14'),
('Balogh', 'Dorottya', '1980-11-05'),
('Boros', 'Emili', '1973-07-20'),
('Vass', 'Szabolcs', '1988-05-17'),
('Kis', 'Erik', '1992-06-21'),
('Szücs', 'Gergely', '1991-06-05'),
('Pál', 'Panna', '1983-05-08'),
('Bodnár', 'Liliána', '1977-09-11'),
('Major', 'Lajos', '1982-06-15'),
('Török', 'Tímea', '1983-02-01'),
('Székely', 'József', '1980-08-26'),
('Kovács', 'Richárd', '1972-06-04'),
('Németh', 'Kende', '1993-01-11'),
('Fodor', 'Borbála', '1991-02-17'),
('Faragó', 'Lia', '1973-08-24'),
('Major', 'Bendegúz', '1979-03-17'),
('Orosz', 'Rozina', '1992-08-18'),
('Péter', 'Lia', '1972-12-04'),
('Kelemen', 'Dorottya', '1997-02-19'),
('Papp', 'Sándor', '1997-02-23'),
('László', 'Marcell', '1982-07-18'),
('Szilágyi', 'Sándor', '1985-08-14'),
('Lukács', 'Noémi', '1988-09-02'),
('Sárközi', 'János', '1974-11-19'),
('Török', 'Luca', '1988-10-25'),
('Hegedűs', 'Vince', '2000-10-29'),
('László', 'Lajos', '1996-10-08'),
('Barna', 'Martin', '1983-07-05'),
('Oláh', 'Tímea', '1989-06-19'),
('Máté', 'Abigél', '1998-08-29'),
('Pál', 'Alíz', '2000-02-04'),
('László', 'Vencel', '1998-10-29'),
('Balogh', 'Tamara', '1997-06-14'),
('Jónás', 'Zselyke', '1971-10-26'),
('Oláh', 'Blanka', '1998-07-27'),
('Kozma', 'Elizabet', '1986-07-02'),
('Kovács', 'Zsombor', '1993-10-09'),
('Gáspár', 'Bende', '1992-07-08'),
('Pataki', 'Fruzsina', '1976-04-14'),
('Fodor', 'Dávid', '1971-08-04'),
('Máté', 'Zénó', '1974-03-28'),
('Szabó', 'Dalma', '1971-11-28'),
('Tóth', 'Attila', '1982-09-14'),
('Pál', 'Péter', '1985-09-25'),
('Szabó', 'Mirkó', '1976-02-10'),
('Kiss', 'Miklós', '1985-04-04'),
('Pintér', 'Milán', '1995-11-20'),
('Szűcs', 'Zselyke', '1990-06-05'),
('Juhász', 'Dóra', '1976-02-27');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
