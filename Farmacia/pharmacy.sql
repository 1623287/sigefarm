-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-04-2022 a las 01:29:16
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pharmacy`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_credentials`
--

CREATE TABLE `admin_credentials` (
  `USERNAME` varchar(50) COLLATE utf16_bin NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf16_bin NOT NULL,
  `PHARMACY_NAME` varchar(100) COLLATE utf16_bin NOT NULL,
  `EMAIL` varchar(100) COLLATE utf16_bin NOT NULL,
  `CONTACT_NUMBER` varchar(9) COLLATE utf16_bin NOT NULL,
  `ADDRESS` varchar(100) COLLATE utf16_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Volcado de datos para la tabla `admin_credentials`
--

INSERT INTO `admin_credentials` (`USERNAME`, `PASSWORD`, `PHARMACY_NAME`, `EMAIL`, `CONTACT_NUMBER`, `ADDRESS`) VALUES
('admin', 'admin123', 'Crystal Farma S.A', 'sistemas@crystalfarma.com', '992839182', 'Av. Olivos 423');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `customers`
--

CREATE TABLE `customers` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(20) COLLATE utf16_bin NOT NULL,
  `CONTACT_NUMBER` varchar(10) COLLATE utf16_bin NOT NULL,
  `ADDRESS` varchar(100) COLLATE utf16_bin NOT NULL,
  `DOCTOR_NAME` varchar(20) COLLATE utf16_bin NOT NULL,
  `DOCTOR_ADDRESS` varchar(100) COLLATE utf16_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Volcado de datos para la tabla `customers`
--

INSERT INTO `customers` (`ID`, `NAME`, `CONTACT_NUMBER`, `ADDRESS`, `DOCTOR_NAME`, `DOCTOR_ADDRESS`) VALUES
(4, 'Segundo Holguin', '934567690', 'Jr. Callao 234', 'Dr. Fausto Gutierrez', 'Av. Tacna 341'),
(6, 'Ginebra Ortiz', '965687269', 'Av. Aviación 612', 'Dr. Ernesto Caceres', 'Jr. Gamarra 351'),
(11, 'Santos Zegarra', '962369896', 'Calle Tarata 812', 'Dra. Adriana Melgar', 'Av. Caquetá 316'),
(13, 'Estefany Solares', '956236994', 'Pasaje Olaya 273', 'Dr. Mario Puentes', 'Av. Cieneguilla 468'),
(14, 'Alejandro Galvez', '980285472', 'Jr. Ica 561', 'Dr. Carlos Mejia', 'Paseo Colón 361');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoices`
--

CREATE TABLE `invoices` (
  `INVOICE_ID` int(11) NOT NULL,
  `NET_TOTAL` double NOT NULL DEFAULT 0,
  `INVOICE_DATE` date NOT NULL DEFAULT current_timestamp(),
  `CUSTOMER_ID` int(11) NOT NULL,
  `TOTAL_AMOUNT` double NOT NULL,
  `TOTAL_DISCOUNT` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Volcado de datos para la tabla `invoices`
--

INSERT INTO `invoices` (`INVOICE_ID`, `NET_TOTAL`, `INVOICE_DATE`, `CUSTOMER_ID`, `TOTAL_AMOUNT`, `TOTAL_DISCOUNT`) VALUES
(1, 30, '2021-10-19', 14, 30, 0),
(2, 2626, '2021-10-19', 6, 2626, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicines`
--

CREATE TABLE `medicines` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) COLLATE utf16_bin NOT NULL,
  `PACKING` varchar(20) COLLATE utf16_bin NOT NULL,
  `GENERIC_NAME` varchar(100) COLLATE utf16_bin NOT NULL,
  `SUPPLIER_NAME` varchar(100) COLLATE utf16_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Volcado de datos para la tabla `medicines`
--

INSERT INTO `medicines` (`ID`, `NAME`, `PACKING`, `GENERIC_NAME`, `SUPPLIER_NAME`) VALUES
(1, 'Panadol', '10 tab', 'Paracetamol', 'RoxFarma S.A.'),
(2, 'Amoxiclin', '10 tab', 'Amoxicilina', 'Bayer S.A.'),
(4, 'Eritromin', '15 tab', 'Eritromicina', 'Bago S.A.'),
(5, 'Zitrolab', '10 tab', 'Azitromicina', 'Markos S.A.'),
(6, 'Arapride', '20 tab', 'Omeprazol', 'Merck '),
(7, 'Panadol', '10', 'Paracetamol', 'RoxFarma S.A.'),
(8, 'Zitrolab', '6', 'Azitromicina', 'Griffith S.A.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicines_stock`
--

CREATE TABLE `medicines_stock` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) COLLATE utf16_bin NOT NULL,
  `BATCH_ID` varchar(20) COLLATE utf16_bin NOT NULL,
  `EXPIRY_DATE` varchar(10) COLLATE utf16_bin NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `MRP` double NOT NULL,
  `RATE` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Volcado de datos para la tabla `medicines_stock`
--

INSERT INTO `medicines_stock` (`ID`, `NAME`, `BATCH_ID`, `EXPIRY_DATE`, `QUANTITY`, `MRP`, `RATE`) VALUES
(1, 'Amoxiclin', 'AMOX12', '12/34', 2, 2626, 26),
(2, 'Zitrolab', 'ZIT327', '12/42', 4, 15, 12),
(3, 'Eritromin', 'ERI327', '01/23', 3, 30, 24),
(4, 'Panadol', 'PAN325', '05/22', 9, 32.65, 28);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchases`
--

CREATE TABLE `purchases` (
  `SUPPLIER_NAME` varchar(100) COLLATE utf16_bin NOT NULL,
  `INVOICE_NUMBER` int(11) NOT NULL,
  `VOUCHER_NUMBER` int(11) NOT NULL,
  `PURCHASE_DATE` varchar(10) COLLATE utf16_bin NOT NULL,
  `TOTAL_AMOUNT` double NOT NULL,
  `PAYMENT_STATUS` varchar(20) COLLATE utf16_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Volcado de datos para la tabla `purchases`
--

INSERT INTO `purchases` (`SUPPLIER_NAME`, `INVOICE_NUMBER`, `VOUCHER_NUMBER`, `PURCHASE_DATE`, `TOTAL_AMOUNT`, `PAYMENT_STATUS`) VALUES
('RoxFarma S.A.', 3, 1, '2022-04-03', 28, 'PAID'),
('RoxFarma S.A.', 4, 2, '2022-04-03', 140, 'PAID'),
('Griffith S.A.', 1, 3, '2022-04-01', 96, 'DUE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suppliers`
--

CREATE TABLE `suppliers` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) COLLATE utf16_bin NOT NULL,
  `EMAIL` varchar(100) COLLATE utf16_bin NOT NULL,
  `CONTACT_NUMBER` varchar(10) COLLATE utf16_bin NOT NULL,
  `ADDRESS` varchar(100) COLLATE utf16_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Volcado de datos para la tabla `suppliers`
--

INSERT INTO `suppliers` (`ID`, `NAME`, `EMAIL`, `CONTACT_NUMBER`, `ADDRESS`) VALUES
(1, 'RoxFarma S.A.', 'desai@roxfarma.com', '994872424', 'Calle Republica 432'),
(2, 'Bago S.A.', 'anderson@bago.com', '945632963', 'Av. Prado 451'),
(9, 'Bayer S.A.', 'jones@bayer.com', '938683637', 'Jr. San Isidro 721'),
(10, 'Abbott Laboratories S.A.', 'robinson@abbott.com', '937355538', 'Av. Dominguez 812'),
(11, 'Miller S.A.', 'zhall@miller.com', '975734385', 'Jr. Sucre 614'),
(12, 'Powell S.A.', 'sebastian@powell.co.uk', '967868752', 'Av. Cieneguilla 378'),
(13, 'Griffith S.A.', 'joanne@griffith.com.uk', '966626226', 'Av. Reducto 891'),
(14, 'Ward S.A.', 'helen.moore@ward.co.uk', '936347335', 'Jr. Wiesse 915'),
(15, 'Siegfried S.A.', 'hughes.phoebe@siegfried.com', '953838835', 'Jr. Canevaro 898'),
(20, 'Simpson S.A.', 'ashley.thomas@simpson.com', '953517935', 'Jr. Canevaro 927'),
(23, 'Lewis S.A.', 'donald@lewis.com', '962917142', 'Av. Emancipacion 917'),
(24, 'Merck & Dohme', 'bradley@merk.com', '961278642', 'Calle Diagonal 813'),
(25, 'Teva S.A.', 'timothy@teva.com', '962371842', 'Av. Garzón 917'),
(26, 'Química Suiza S.A.', 'jackson@suizalab.com', '962469173', 'Av. Canada 956'),
(28, 'Roche S.A.', 'mitchell@roche.com', '962468194', 'Av. Canta Callao 918'),
(29, 'Tecnofarma S.A.', 'steven@tecnofarm.com', '962471932', 'Calle Brasil 219'),
(30, 'Roemmer', 'novak@roemmer.com', '989178412', 'Calle Los Olmos 783');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin_credentials`
--
ALTER TABLE `admin_credentials`
  ADD PRIMARY KEY (`USERNAME`);

--
-- Indices de la tabla `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`INVOICE_ID`);

--
-- Indices de la tabla `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `medicines_stock`
--
ALTER TABLE `medicines_stock`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `BATCH_ID` (`BATCH_ID`);

--
-- Indices de la tabla `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`VOUCHER_NUMBER`);

--
-- Indices de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `customers`
--
ALTER TABLE `customers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `invoices`
--
ALTER TABLE `invoices`
  MODIFY `INVOICE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `medicines`
--
ALTER TABLE `medicines`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `medicines_stock`
--
ALTER TABLE `medicines_stock`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `purchases`
--
ALTER TABLE `purchases`
  MODIFY `VOUCHER_NUMBER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
