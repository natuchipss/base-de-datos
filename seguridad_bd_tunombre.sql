-- ===============================================
-- SEGURIDAD EN BASE DE DATOS - MySQL 8.0
-- Autor: [Tu Nombre]
-- Archivo: seguridad_bd_tunombre.sql
-- ===============================================

-- 1️⃣ CREAR BASE DE DATOS
CREATE DATABASE IF NOT EXISTS empresa_segura;
USE empresa_segura;

-- 2️⃣ CREAR TABLAS DE EJEMPLO (si no las tienes importadas)
CREATE TABLE IF NOT EXISTS empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    cargo VARCHAR(50),
    salario DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS departamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS salarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    monto DECIMAL(10,2),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id)
);

-- 3️⃣ CREAR USUARIOS
-- Usuario de RRHH (puede ver y modificar empleados)
CREATE USER IF NOT EXISTS 'admin_rrhh'@'localhost' IDENTIFIED BY 'Admin123*';

-- Usuario analista (solo puede consultar)
CREATE USER IF NOT EXISTS 'analista_bi'@'localhost' IDENTIFIED BY 'Analista123*';

-- Usuario desarrollador (puede leer y modificar)
CREATE USER IF NOT EXISTS 'desarrollador'@'localhost' IDENTIFIED BY 'Dev123*';

-- 4️⃣ ASIGNAR PERMISOS (C = consultar, P = procesar)

-- 🟢 admin_rrhh: acceso total SOLO a empleados
GRANT SELECT, INSERT, UPDATE, DELETE ON empresa_segura.empleados TO 'admin_rrhh'@'localhost';

-- 🔵 analista_bi: solo puede consultar (C)
GRANT SELECT ON empresa_segura.* TO 'analista_bi'@'localhost';

-- 🟣 desarrollador: puede consultar y procesar (P)
GRANT SELECT, INSERT, UPDATE ON empresa_segura.* TO 'desarrollador'@'localhost';

-- 5️⃣ APLICAR CAMBIOS
FLUSH PRIVILEGES;

-- 6️⃣ VERIFICAR PERMISOS DE CADA USUARIO
SHOW GRANTS FOR 'admin_rrhh'@'localhost';
SHOW GRANTS FOR 'analista_bi'@'localhost';
SHOW GRANTS FOR 'desarrollador'@'localhost';

-- ===============================================
-- FIN DEL SCRIPT
-- ===============================================
