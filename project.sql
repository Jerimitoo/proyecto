-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-11-2021 a las 18:57:35
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `project`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventory_npc`
--

CREATE TABLE `inventory_npc` (
  `object` int(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='info del inventario del comerciante ';

--
-- Volcado de datos para la tabla `inventory_npc`
--

INSERT INTO `inventory_npc` (`object`) VALUES
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(10),
(11),
(12),
(13),
(14),
(15),
(16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventory_player`
--

CREATE TABLE `inventory_player` (
  `object` int(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='informacion del inventario del jugador';

--
-- Volcado de datos para la tabla `inventory_player`
--

INSERT INTO `inventory_player` (`object`) VALUES
(1),
(9),
(14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `items`
--

CREATE TABLE `items` (
  `code_obj` int(2) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `value` int(4) UNSIGNED NOT NULL,
  `descripcion` varchar(400) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='almacena datos de los diferentes objetos de skyrim';

--
-- Volcado de datos para la tabla `items`
--

INSERT INTO `items` (`code_obj`, `name`, `type`, `value`, `descripcion`) VALUES
(1, 'Posción de vida', 'Hechizo', 3, 'Te cura un 25 de vida.'),
(2, 'Posción de velocidad de ataque ', 'Hechizo', 2, 'Te da un 13% de velocidad de ataque por 30 sec.'),
(3, 'Poscion de daño', 'Hechizo', 4, 'Te aumenta un 30% de daño por 1 min.'),
(4, 'Armadura ligera (pies)', 'Armadura', 5, 'Ligera pero resistente, sin duda la mejor opción para poder moverse rápido. '),
(5, 'Armadura ligera (piernas)', 'Armadura', 7, 'La mejor opción para poder atacar mas rápido a tus enemigos.'),
(6, 'Armadura ligera (torso)', 'Armadura', 10, 'Sin duda la mejor opción para atacar a tus enemigos.'),
(7, 'Armadura ligera (yelmo)', 'Armadura', 5, 'No la mejor opción si a protección se refiere.'),
(8, 'Arco', 'Arma', 7, 'La mejor opción para atacar a tus enemigos, desde larga distancia.'),
(9, 'Espada a una mano', 'Arma', 4, 'Arma con poco daño pero ligera.'),
(10, 'Espada a dos manos', 'Arma', 10, 'Mucho daño pero poca movilidad.'),
(11, 'Hacha nordica', 'Arma', 10, 'Un arma con un potente daño y buena movilidad.'),
(12, 'Mc´menu', 'Comida', 15, 'Hamburguesa, Fresco, Papas y helado. Oferton. '),
(13, 'Happymeal ', 'Comida', 11, 'Juguete mc, Hamburguesa, fresco.'),
(14, 'Caballo', 'Transporte', 500, 'La mejor opción para transportarte por Skyrim'),
(15, 'Trampa de oso', 'Varios', 13, 'La trampa no es muy útil... pero si consigues cazar un animal grande, te pueden dar buenas recompensas. '),
(16, 'Ticket para ver a coldplay', 'Varios', 999, '...');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `npc`
--

CREATE TABLE `npc` (
  `race` int(2) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='datos del comerciante ';

--
-- Volcado de datos para la tabla `npc`
--

INSERT INTO `npc` (`race`, `name`) VALUES
(9, 'Ragnar lodbrok');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `player`
--

CREATE TABLE `player` (
  `race` int(2) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='player data';

--
-- Volcado de datos para la tabla `player`
--

INSERT INTO `player` (`race`, `name`) VALUES
(9, 'Floki Snow');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `razas`
--

CREATE TABLE `razas` (
  `id_raza` int(2) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(300) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='data races ';

--
-- Volcado de datos para la tabla `razas`
--

INSERT INTO `razas` (`id_raza`, `name`, `description`) VALUES
(1, 'Alto elfo', 'También conocidos como “altmer” en su tierra natal de la isla de Estivalia, los altos elfos son los más dotados entre todas las razas para las artes arcanas. Pueden recurrir a su poder Aristocrático para regenerar magia rápidamente.\r\n\r\n'),
(2, 'Argoniano', 'Esta raza reptiliana está muy bien adaptada a los pantanos de Ciénaga Negra, su tierra, y ha desarrollado una resistencia natural a las enfermedades y la aptitud de respirar bajo el agua. Puede echar mano de su Piel de hist para recuperar salud rápidamente.\r\n\r\n'),
(3, 'Bretón', 'Además de su rápida y perceptiva comprensión de la hechicería, incluso los más humildes bretones pueden jactarse de su resistencia a la magia. Los bretones pueden recurrir a su poder de Piel de dragón para absorber hechizos.\r\n\r\n'),
(4, 'Elfo del bosque', 'La gente del clan de los bosques que hay al oeste de Bosque Valen, también conocidos como los “bosmer”. Los elfos de los bosques son buenos exploradores y ladrones, y no hay mejores arqueros en toda Tamriel. Cuentan con una resistencia natural a los venenos y enfermedades y pueden ordenar a los anim'),
(5, 'Elfo oscuro', 'También conocidos como “dunmer” en su patria, Morrowind, los elfos oscuros son famosos por su sigilo y sus artes mágicas. Son resistentes al fuego por naturaleza y pueden recurrir a su Ira del antepasado para rodearse de fuego.\r\n\r\n'),
(6, 'Guardia Rojo', 'Los guerreros guardias rojos de Páramo del Martillo son los de mayor talento de Tamriel, tienen una constitución recia y una resistencia natural al veneno. Pueden recurrir a una Subida de adrenalina en combate.\r\n\r\n'),
(7, 'Imperial', 'Estos nativos de Cyrodiil, que han demostrado su astucia en el comercio y la diplomacia, son también hábiles en el combate y en el uso de la magia. Allá donde pueda haber monedas de oro, parece que los Imperiales siempre encuentran más. Pueden recurrir a la Voz del emperador para calmar a un enemigo'),
(8, 'Khajiita', 'Naturales de la provincia de Elsweyr, son inteligentes, rápidos y ágiles. Resultan ladrones excelentes debido a su sigilo natural. Todos los khajiitas pueden ver en la oscuridad a voluntad y sus ataques con las garras resultan mortales.\r\n\r\n'),
(9, 'Nordico', 'Los ciudadanos de Skyrim suelen ser altos y rubios. Fuertes y recios en general, los nórdicos son famosos por su resistencia al frío y su talento como guerreros. Pueden usar el Grito de batalla para hacer huir a sus oponentes.\r\n\r\n'),
(10, 'Orco', 'A los habitantes de las montañas de Wrothgaria y la Cola del Dragón, los herreros orcos, se les valora por su artesanía. Las tropas orcas con armadura pesada se encuentran entre las mejores del Imperio y resultan temibles cuando utilizan su Ira del berserk.\r\n\r\n');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `inventory_npc`
--
ALTER TABLE `inventory_npc`
  ADD UNIQUE KEY `object` (`object`);

--
-- Indices de la tabla `inventory_player`
--
ALTER TABLE `inventory_player`
  ADD UNIQUE KEY `object` (`object`);

--
-- Indices de la tabla `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`code_obj`);

--
-- Indices de la tabla `npc`
--
ALTER TABLE `npc`
  ADD UNIQUE KEY `race` (`race`);

--
-- Indices de la tabla `player`
--
ALTER TABLE `player`
  ADD UNIQUE KEY `race` (`race`);

--
-- Indices de la tabla `razas`
--
ALTER TABLE `razas`
  ADD PRIMARY KEY (`id_raza`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `items`
--
ALTER TABLE `items`
  MODIFY `code_obj` int(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `npc`
--
ALTER TABLE `npc`
  MODIFY `race` int(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `player`
--
ALTER TABLE `player`
  MODIFY `race` int(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `razas`
--
ALTER TABLE `razas`
  MODIFY `id_raza` int(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inventory_npc`
--
ALTER TABLE `inventory_npc`
  ADD CONSTRAINT `FK_inventory_npc_razas` FOREIGN KEY (`object`) REFERENCES `items` (`code_obj`);

--
-- Filtros para la tabla `inventory_player`
--
ALTER TABLE `inventory_player`
  ADD CONSTRAINT `FK_inventory_player_razas` FOREIGN KEY (`object`) REFERENCES `items` (`code_obj`);

--
-- Filtros para la tabla `npc`
--
ALTER TABLE `npc`
  ADD CONSTRAINT `FK_npc_razas` FOREIGN KEY (`race`) REFERENCES `razas` (`id_raza`);

--
-- Filtros para la tabla `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `FK_player_razas` FOREIGN KEY (`race`) REFERENCES `razas` (`id_raza`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
