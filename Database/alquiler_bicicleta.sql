-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-02-2023 a las 17:05:35
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `alquiler_bicicleta`
--
CREATE DATABASE IF NOT EXISTS `alquiler_bicicleta` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `alquiler_bicicleta`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquiler`
--

CREATE TABLE `alquiler` (
  `idAlquiler` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idBicicleta` int(11) NOT NULL,
  `idTarifa` int(11) NOT NULL,
  `total` decimal(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alquiler`
--

INSERT INTO `alquiler` (`idAlquiler`, `fecha`, `idUsuario`, `idBicicleta`, `idTarifa`, `total`) VALUES
(1, '2023-02-18', 3, 1, 1, '23500.00'),
(2, '2023-02-18', 2, 3, 3, '62000.00'),
(3, '2023-02-17', 1, 2, 2, '36500.00'),
(4, '2023-02-19', 4, 4, 4, '83500.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquiler_extra`
--

CREATE TABLE `alquiler_extra` (
  `idAlquiler` int(11) NOT NULL,
  `idExtra` int(11) NOT NULL,
  `cantidad` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alquiler_extra`
--

INSERT INTO `alquiler_extra` (`idAlquiler`, `idExtra`, `cantidad`) VALUES
(1, 1, 1),
(1, 2, 1),
(1, 6, 1),
(1, 10, 1),
(2, 1, 1),
(2, 4, 1),
(2, 5, 1),
(2, 10, 1),
(3, 1, 1),
(3, 2, 1),
(3, 10, 1),
(4, 1, 1),
(4, 2, 1),
(4, 10, 1),
(4, 12, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bicicleta`
--

CREATE TABLE `bicicleta` (
  `idBicicleta` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `bicicleta`
--

INSERT INTO `bicicleta` (`idBicicleta`, `nombre`, `descripcion`) VALUES
(1, 'Gama 400 wh', 'Bicicleta eléctrica de montaña básica para disfrutar del paisaje en familia o pareja. La autonomía de las bicicletas de la gama 400 Kh es aproximadamente de 40 kilómetros de recorrido y para rutas de entre 800 – 1000 metros de desnivel.'),
(2, 'Gama 500 wh', 'BTT eléctrica de montaña de buena conducción para rutas técnicas, donde el conductor busca retos y diversión. La autonomía en este caso tiene un alcance alrededor de 1000 – 1200 metros de desnivel, en rutas que no deben superar 40 – 60 kilómetros de recorrido. Menos desnivel permite un recorrido más largo y al revés.'),
(3, 'Gama 600 wh', 'La bicicleta eléctrica MTB para rutas de alto nivel. La autonomía en este caso tiene un alcance alrededor de 1200 – 1500 metros de desnivel, en rutas que no deben superar 40 – 60 kilómetros de recorrido. Menos desnivel permite un recorrido más largo y al revés.'),
(4, 'Gama Fat', 'Las bicicletas de la gama FAT no destacan por su autonomía, sino por la tremenda conducción y el estupendo comportamiento en las bajadas.  En estas bicicletas de enduro los diseñadores han puesto la énfasis en la diversión y en la superación de los tramos técnicos de las rutas, siendo las subidas pan comido.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `extra`
--

CREATE TABLE `extra` (
  `idExtra` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `extra`
--

INSERT INTO `extra` (`idExtra`, `nombre`, `descripcion`, `precio`) VALUES
(1, 'Casco de bicicleta', 'El casco de ciclismo es un elemento de seguridad imprescindible. En Bobi’s Bikes lo incluimos en el alquiler de cualquier bicicleta. Sólo tienes que indicar la talla que usas, durante la reserva.', '0.00'),
(2, 'Funda de gel para sillí', 'Es ideal para las personas que no usan la bicicleta habitualmente. El gel reduce el área de presión en la zona del perineo, haciendo que la experiencia sea mucho más confortable.', '1500.00'),
(3, 'Pedales Shimano', 'Los pedales SHIMANO SPD tienen un diseño ultracompacto y ligero. El eje sellado del cojinete del cartucho mantiene hacia fuera el agua y el barro.', '3500.00'),
(4, 'Pedales de Look', 'Los Pedales Look son idóneos para ciclistas ocasionales o de iniciación que buscan un modelo ligero y fiable. Su superficie de contacto ancha, ofreciendo una excelente estabilidad de pedaleo.', '3500.00'),
(5, 'Tija sillín con suspensió', 'La tija SR-Suntour SP12 NCX filtra los golpes y vibraciones que recibe la columna en el terreno irregular. Ideal para bicicletas rígidas, sin suspensión trasera.', '3500.00'),
(6, 'Set de luces', 'Las luces que ofrecemos son útiles para ver al anochecer, pero también para ser visto. Se cargan por un enchufe de USB, así que le sirven también si alquila la bicicleta varios días.', '2000.00'),
(7, 'Remolque para niños', 'Pueden ir hasta dos niños en el carro. Peso máximo del niño/a: 20 kg. Altura máxima: 110 cm. Equipado con cinturones de 5 puntos para garantizar una mayor seguridad.', '7000.00'),
(8, 'Silla para bebés', 'La silla portabebés es un asiento que se adapta a la bicicleta para que pueda llevar a su hijo contigo y disfrutar juntos del paseo, la naturaleza y el aire. Aguantan un peso máximo de 20 kg.', '3500.00'),
(9, 'Remolque – tercera rueda', 'El semi tandem es ideal para niños que aún no pueden montar en bicicleta eléctrica.  Altura niño/a: 110 y 125cm. Es imprescindible saber ir en bicicleta.', '2500.00'),
(10, 'Bolsa herramientas', 'La bolsa herramientas básica incluye: Bomba de aire, Candado con llave, Navaja de herramientas, Parches para la cámara, Dos desmontables, Guantes de vinilo', '0.00'),
(11, 'Bolsa herramientas PRO', 'Bolsa herramientas PRO contiene todo lo que lleva la bolsa básica, más: Troncha cadenas, Un eslabón, Set para insertar mechas, Cámara de repuesto, Palancas desmontables', '7000.00'),
(12, 'Soporte para celular', 'El soporte garantiza un agarre seguro y te permite montar y desmontar su dispositivo móvil en cuestión de segundos. Lo fijamos en el manillar de la bici del leader. Para móviles de 56 a 85 mm.', '7000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifa`
--

CREATE TABLE `tarifa` (
  `idTarifa` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tarifa`
--

INSERT INTO `tarifa` (`idTarifa`, `nombre`, `descripcion`, `precio`) VALUES
(1, '1 día', 'Alquiler 1 día', '20000.00'),
(2, '2 días', 'Alquiler 2 días', '35000.00'),
(3, '3 días', 'Alquiler 3 días', '55000.00'),
(4, '4 días', 'Alquiler 4 días', '75000.00'),
(5, '5 días', 'Alquiler 5 días', '90000.00'),
(6, '6 días', 'Alquiler 6 días', '110000.00'),
(7, '7 días', 'Alquler 7 días', '120000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `identificacion` varchar(18) NOT NULL,
  `nombreCompleto` varchar(150) DEFAULT NULL,
  `email` varchar(60) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `identificacion`, `nombreCompleto`, `email`, `telefono`) VALUES
(1, '123456789', 'Carolina Barrientos Corrales', 'cbarrientosc@prueba.com', '11112233'),
(2, '222334455', 'Gabriel Porras Torres', 'gtorresp@prueba.com', '22223344'),
(3, '333445566', 'Miranda Navarro Salas', 'mnavarros@prueba.com', '33335566'),
(4, '444556677', 'Daniel Mora Obando', 'dmorao@prueba.com', '44445566');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD PRIMARY KEY (`idAlquiler`),
  ADD KEY `fk_alquiler_usuario_idx` (`idUsuario`),
  ADD KEY `fk_alquiler_bicicleta_idx` (`idBicicleta`),
  ADD KEY `fk_alquiler_tarifa_idx` (`idTarifa`);

--
-- Indices de la tabla `alquiler_extra`
--
ALTER TABLE `alquiler_extra`
  ADD PRIMARY KEY (`idAlquiler`,`idExtra`),
  ADD KEY `fk_alquiler_extra_extra_idx` (`idExtra`);

--
-- Indices de la tabla `bicicleta`
--
ALTER TABLE `bicicleta`
  ADD PRIMARY KEY (`idBicicleta`);

--
-- Indices de la tabla `extra`
--
ALTER TABLE `extra`
  ADD PRIMARY KEY (`idExtra`);

--
-- Indices de la tabla `tarifa`
--
ALTER TABLE `tarifa`
  ADD PRIMARY KEY (`idTarifa`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  MODIFY `idAlquiler` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `bicicleta`
--
ALTER TABLE `bicicleta`
  MODIFY `idBicicleta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `extra`
--
ALTER TABLE `extra`
  MODIFY `idExtra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tarifa`
--
ALTER TABLE `tarifa`
  MODIFY `idTarifa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD CONSTRAINT `fk_alquiler_bicicleta` FOREIGN KEY (`idBicicleta`) REFERENCES `bicicleta` (`idBicicleta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_alquiler_tarifa` FOREIGN KEY (`idTarifa`) REFERENCES `tarifa` (`idTarifa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_alquiler_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `alquiler_extra`
--
ALTER TABLE `alquiler_extra`
  ADD CONSTRAINT `fk_alquiler_extra_alquiler` FOREIGN KEY (`idAlquiler`) REFERENCES `alquiler` (`idAlquiler`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_alquiler_extra_extra` FOREIGN KEY (`idExtra`) REFERENCES `extra` (`idExtra`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
