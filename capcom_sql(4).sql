-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-10-2025 a las 07:49:02
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `capcom_sql`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disponibilidad`
--

CREATE TABLE `disponibilidad` (
  `ID_DISPONIBILIDAD` varchar(50) NOT NULL,
  `PORCENTAJE_DISPONIBILIDAD` tinyint(4) DEFAULT NULL CHECK (`PORCENTAJE_DISPONIBILIDAD` between 0 and 100),
  `ID_EMPLEADO` varchar(50) DEFAULT NULL,
  `ID_PROYECTO` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `disponibilidad`
--

INSERT INTO `disponibilidad` (`ID_DISPONIBILIDAD`, `PORCENTAJE_DISPONIBILIDAD`, `ID_EMPLEADO`, `ID_PROYECTO`) VALUES
('DISP001', 75, 'EMP001', 'PROY001'),
('DISP006', 80, 'EMP005', 'PROY002'),
('DISP007', 60, 'EMP006', 'PROY003'),
('DISP008', 50, 'EMP009', 'PROY001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `ID_EMPLEADO` varchar(50) NOT NULL,
  `NUMERO_CELULAR` varchar(15) DEFAULT NULL,
  `NOMBRE` varchar(100) DEFAULT NULL,
  `IDENTIFICACION` varchar(20) DEFAULT NULL,
  `FECHA_NACIMIENTO` date DEFAULT NULL,
  `ESTADO_LABORAL` enum('Activo','Licencia','Baja') DEFAULT 'Activo',
  `DEPARTAMENTO` varchar(50) DEFAULT NULL,
  `CARGO` varchar(50) DEFAULT NULL,
  `FECHA_INGRESO` date DEFAULT NULL,
  `CORREO` varchar(100) DEFAULT 'sin_correo@capcom.com'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`ID_EMPLEADO`, `NUMERO_CELULAR`, `NOMBRE`, `IDENTIFICACION`, `FECHA_NACIMIENTO`, `ESTADO_LABORAL`, `DEPARTAMENTO`, `CARGO`, `FECHA_INGRESO`, `CORREO`) VALUES
('EMP001', '0991234567', 'Laura Martínez', '1723456789', '1990-05-15', 'Activo', 'Diseño de Juegos', 'Diseñadora Principal', '2022-03-01', 'laura.martinez@capcom.com'),
('EMP005', '0991111111', 'Ana Torres', '1723456793', '1991-04-12', 'Activo', 'Programación', 'Desarrolladora Backend', '2022-05-10', 'ana.torres@capcom.com'),
('EMP006', '0992222222', 'Luis Gómez', '1723456794', '1987-09-30', 'Activo', 'Arte', 'Artista Conceptual', '2021-11-20', 'luis.gomez@capcom.com'),
('EMP009', '0995555555', 'Valeria Ruiz', '1723456797', '1995-12-05', 'Activo', 'Guion', 'Narradora', '2024-01-12', 'valeria.ruiz@capcom.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_habilidad`
--

CREATE TABLE `empleado_habilidad` (
  `ID_EMPLEADO` varchar(50) NOT NULL,
  `ID_HABILIDAD` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado_habilidad`
--

INSERT INTO `empleado_habilidad` (`ID_EMPLEADO`, `ID_HABILIDAD`) VALUES
('EMP001', 'HAB001'),
('EMP005', 'HAB002'),
('EMP006', 'HAB003'),
('EMP009', 'HAB004');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_portafolio`
--

CREATE TABLE `empleado_portafolio` (
  `ID_EMPLEADO` varchar(50) NOT NULL,
  `ID_PORTAFOLIO` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado_portafolio`
--

INSERT INTO `empleado_portafolio` (`ID_EMPLEADO`, `ID_PORTAFOLIO`) VALUES
('EMP001', 'PORT001'),
('EMP005', 'PORT002'),
('EMP006', 'PORT003'),
('EMP009', 'PORT004');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidad`
--

CREATE TABLE `habilidad` (
  `ID_HABILIDAD` varchar(50) NOT NULL,
  `NOMBRE_HABILIDAD` varchar(100) DEFAULT NULL,
  `NIVEL_EXPERIENCIA` enum('Básico','Intermedio','Avanzado','Experto') DEFAULT NULL,
  `FECHA_CERTIFICACION` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `habilidad`
--

INSERT INTO `habilidad` (`ID_HABILIDAD`, `NOMBRE_HABILIDAD`, `NIVEL_EXPERIENCIA`, `FECHA_CERTIFICACION`) VALUES
('HAB001', 'Diseño de interfaces', 'Avanzado', '2024-08-10'),
('HAB002', 'Programación en C++', 'Experto', '2023-06-20'),
('HAB003', 'Modelado 3D', 'Avanzado', '2024-03-12'),
('HAB004', 'Narrativa interactiva', 'Intermedio', '2024-11-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_proyectos`
--

CREATE TABLE `historial_proyectos` (
  `ID_HISTORIAL` varchar(50) NOT NULL,
  `ID_EMPLEADO` varchar(50) DEFAULT NULL,
  `ID_PROYECTO` varchar(50) DEFAULT NULL,
  `ROL_DESEMPENADO` varchar(100) DEFAULT NULL,
  `LOGROS_CONTRIBUCIONES` text DEFAULT NULL,
  `FECHA_LOGRO` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial_proyectos`
--

INSERT INTO `historial_proyectos` (`ID_HISTORIAL`, `ID_EMPLEADO`, `ID_PROYECTO`, `ROL_DESEMPENADO`, `LOGROS_CONTRIBUCIONES`, `FECHA_LOGRO`) VALUES
('HIST001', 'EMP001', 'PROY001', 'Diseñadora de Interfaz', 'Diseñó el sistema de menús y HUD del juego', '2025-08-30'),
('HIST002', 'EMP005', 'PROY002', 'Desarrolladora Backend', 'Implementó el sistema de red para peleas online', '2025-08-15'),
('HIST003', 'EMP006', 'PROY003', 'Artista Conceptual', 'Diseñó los entornos del bosque encantado', '2025-09-20'),
('HIST004', 'EMP009', 'PROY001', 'Narradora', 'Escribió el guion de la misión final', '2025-08-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `portafolio`
--

CREATE TABLE `portafolio` (
  `ID_PORTAFOLIO` varchar(50) NOT NULL,
  `EJEMPLO_TRABAJO` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `portafolio`
--

INSERT INTO `portafolio` (`ID_PORTAFOLIO`, `EJEMPLO_TRABAJO`) VALUES
('PORT001', 'Diseño de interfaz para Resident Evil 9'),
('PORT002', 'Sistema de combate para Street Fighter VI'),
('PORT003', 'Diseño de criaturas para Monster Hunter World 2'),
('PORT004', 'Narrativa para Resident Evil 10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE `proyecto` (
  `ID_PROYECTO` varchar(50) NOT NULL,
  `NOMBRE_PROYECTO` varchar(100) DEFAULT NULL,
  `FECHA_INICIO` date DEFAULT NULL,
  `FECHA_FIN` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`ID_PROYECTO`, `NOMBRE_PROYECTO`, `FECHA_INICIO`, `FECHA_FIN`) VALUES
('PROY001', 'Resident Evil 9', '2025-01-10', '2025-08-30'),
('PROY002', 'Street Fighter VI DLC', '2025-02-01', '2025-09-01'),
('PROY003', 'Monster Hunter World 2', '2025-03-15', '2025-10-15');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_disponibilidad`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_disponibilidad` (
`empleado` varchar(100)
,`nombre_proyecto` varchar(100)
,`porcentaje_disponibilidad` tinyint(4)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_empleados_activos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_empleados_activos` (
`id_empleado` varchar(50)
,`nombre` varchar(100)
,`departamento` varchar(50)
,`cargo` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_empleados_portafolio`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_empleados_portafolio` (
`nombre` varchar(100)
,`ejemplo_trabajo` text
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_habilidades_empleado`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_habilidades_empleado` (
`empleado` varchar(100)
,`nombre_habilidad` varchar(100)
,`nivel_experiencia` enum('Básico','Intermedio','Avanzado','Experto')
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_historial_proyectos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_historial_proyectos` (
`empleado` varchar(100)
,`nombre_proyecto` varchar(100)
,`rol_desempenado` varchar(100)
,`logros_contribuciones` text
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_disponibilidad`
--
DROP TABLE IF EXISTS `vista_disponibilidad`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_disponibilidad`  AS SELECT `e`.`NOMBRE` AS `empleado`, `p`.`NOMBRE_PROYECTO` AS `nombre_proyecto`, `d`.`PORCENTAJE_DISPONIBILIDAD` AS `porcentaje_disponibilidad` FROM ((`disponibilidad` `d` join `empleado` `e` on(`d`.`ID_EMPLEADO` = `e`.`ID_EMPLEADO`)) join `proyecto` `p` on(`d`.`ID_PROYECTO` = `p`.`ID_PROYECTO`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_empleados_activos`
--
DROP TABLE IF EXISTS `vista_empleados_activos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_empleados_activos`  AS SELECT `empleado`.`ID_EMPLEADO` AS `id_empleado`, `empleado`.`NOMBRE` AS `nombre`, `empleado`.`DEPARTAMENTO` AS `departamento`, `empleado`.`CARGO` AS `cargo` FROM `empleado` WHERE `empleado`.`ESTADO_LABORAL` = 'Activo' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_empleados_portafolio`
--
DROP TABLE IF EXISTS `vista_empleados_portafolio`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_empleados_portafolio`  AS SELECT `e`.`NOMBRE` AS `nombre`, `p`.`EJEMPLO_TRABAJO` AS `ejemplo_trabajo` FROM ((`empleado` `e` join `empleado_portafolio` `ep` on(`e`.`ID_EMPLEADO` = `ep`.`ID_EMPLEADO`)) join `portafolio` `p` on(`ep`.`ID_PORTAFOLIO` = `p`.`ID_PORTAFOLIO`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_habilidades_empleado`
--
DROP TABLE IF EXISTS `vista_habilidades_empleado`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_habilidades_empleado`  AS SELECT `e`.`NOMBRE` AS `empleado`, `h`.`NOMBRE_HABILIDAD` AS `nombre_habilidad`, `h`.`NIVEL_EXPERIENCIA` AS `nivel_experiencia` FROM ((`empleado` `e` join `empleado_habilidad` `eh` on(`e`.`ID_EMPLEADO` = `eh`.`ID_EMPLEADO`)) join `habilidad` `h` on(`eh`.`ID_HABILIDAD` = `h`.`ID_HABILIDAD`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_historial_proyectos`
--
DROP TABLE IF EXISTS `vista_historial_proyectos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_historial_proyectos`  AS SELECT `e`.`NOMBRE` AS `empleado`, `p`.`NOMBRE_PROYECTO` AS `nombre_proyecto`, `h`.`ROL_DESEMPENADO` AS `rol_desempenado`, `h`.`LOGROS_CONTRIBUCIONES` AS `logros_contribuciones` FROM ((`historial_proyectos` `h` join `empleado` `e` on(`h`.`ID_EMPLEADO` = `e`.`ID_EMPLEADO`)) join `proyecto` `p` on(`h`.`ID_PROYECTO` = `p`.`ID_PROYECTO`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `disponibilidad`
--
ALTER TABLE `disponibilidad`
  ADD PRIMARY KEY (`ID_DISPONIBILIDAD`),
  ADD KEY `ID_EMPLEADO` (`ID_EMPLEADO`),
  ADD KEY `ID_PROYECTO` (`ID_PROYECTO`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`ID_EMPLEADO`);

--
-- Indices de la tabla `empleado_habilidad`
--
ALTER TABLE `empleado_habilidad`
  ADD PRIMARY KEY (`ID_EMPLEADO`,`ID_HABILIDAD`),
  ADD KEY `ID_HABILIDAD` (`ID_HABILIDAD`);

--
-- Indices de la tabla `empleado_portafolio`
--
ALTER TABLE `empleado_portafolio`
  ADD PRIMARY KEY (`ID_EMPLEADO`),
  ADD UNIQUE KEY `ID_PORTAFOLIO` (`ID_PORTAFOLIO`);

--
-- Indices de la tabla `habilidad`
--
ALTER TABLE `habilidad`
  ADD PRIMARY KEY (`ID_HABILIDAD`);

--
-- Indices de la tabla `historial_proyectos`
--
ALTER TABLE `historial_proyectos`
  ADD PRIMARY KEY (`ID_HISTORIAL`),
  ADD KEY `ID_EMPLEADO` (`ID_EMPLEADO`),
  ADD KEY `ID_PROYECTO` (`ID_PROYECTO`);

--
-- Indices de la tabla `portafolio`
--
ALTER TABLE `portafolio`
  ADD PRIMARY KEY (`ID_PORTAFOLIO`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`ID_PROYECTO`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `disponibilidad`
--
ALTER TABLE `disponibilidad`
  ADD CONSTRAINT `disponibilidad_ibfk_1` FOREIGN KEY (`ID_EMPLEADO`) REFERENCES `empleado` (`ID_EMPLEADO`),
  ADD CONSTRAINT `disponibilidad_ibfk_2` FOREIGN KEY (`ID_PROYECTO`) REFERENCES `proyecto` (`ID_PROYECTO`);

--
-- Filtros para la tabla `empleado_habilidad`
--
ALTER TABLE `empleado_habilidad`
  ADD CONSTRAINT `empleado_habilidad_ibfk_1` FOREIGN KEY (`ID_EMPLEADO`) REFERENCES `empleado` (`ID_EMPLEADO`),
  ADD CONSTRAINT `empleado_habilidad_ibfk_2` FOREIGN KEY (`ID_HABILIDAD`) REFERENCES `habilidad` (`ID_HABILIDAD`);

--
-- Filtros para la tabla `empleado_portafolio`
--
ALTER TABLE `empleado_portafolio`
  ADD CONSTRAINT `empleado_portafolio_ibfk_1` FOREIGN KEY (`ID_EMPLEADO`) REFERENCES `empleado` (`ID_EMPLEADO`),
  ADD CONSTRAINT `empleado_portafolio_ibfk_2` FOREIGN KEY (`ID_PORTAFOLIO`) REFERENCES `portafolio` (`ID_PORTAFOLIO`);

--
-- Filtros para la tabla `historial_proyectos`
--
ALTER TABLE `historial_proyectos`
  ADD CONSTRAINT `historial_proyectos_ibfk_1` FOREIGN KEY (`ID_EMPLEADO`) REFERENCES `empleado` (`ID_EMPLEADO`),
  ADD CONSTRAINT `historial_proyectos_ibfk_2` FOREIGN KEY (`ID_PROYECTO`) REFERENCES `proyecto` (`ID_PROYECTO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
