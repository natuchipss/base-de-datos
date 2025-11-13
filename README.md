# 📘 Proyecto: Gestión de Usuarios y Roles en MySQL

## 🧩 Descripción
Este proyecto implementa la creación de una base de datos llamada **empresa_segura**, junto con la definición de **usuarios, roles y permisos específicos** para cada perfil dentro de una organización.  
El objetivo es aplicar conceptos de **seguridad, control de acceso y privilegios** en sistemas de gestión de bases de datos.

---

## 🛠️ Tecnologías utilizadas
- MySQL Server 8.0+
- MySQL Workbench
- Visual Studio Code / Visual Studio (opcional)
- Sistema operativo: Windows 10 o superior

---

## 🧱 Estructura de la base de datos

| Tabla | Descripción |
|--------|--------------|
| empleados | Almacena información del personal, como nombre, cargo y salario. |
| departamentos | Contiene los departamentos de la empresa. |
| usuarios_sistema | Guarda el registro de usuarios y roles asignados (opcional según diseño). |

---

## 👥 Usuarios creados

| Usuario | Contraseña | Permisos | Descripción |
|----------|-------------|-----------|--------------|
| admin_rrhh | Admin123* | SELECT, INSERT, UPDATE, DELETE en tabla empleados | Encargado del área de Recursos Humanos |
| analista_bi | Analista123* | Solo SELECT en empleados y departamentos | Analista de datos |
| desarrollador | Dev123* | SELECT, INSERT, UPDATE, DELETE en todas las tablas | Personal técnico con acceso completo |

---

## 📜 Script principal (SQL)
El script SQL utilizado incluye las siguientes instrucciones principales:

```sql
CREATE DATABASE empresa_segura;
USE empresa_segura;

CREATE TABLE empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    cargo VARCHAR(100),
    salario DECIMAL(10,2)
);

CREATE TABLE departamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

-- Creación de usuarios
CREATE USER 'admin_rrhh'@'%' IDENTIFIED BY 'Admin123*';
CREATE USER 'analista_bi'@'%' IDENTIFIED BY 'Analista123*';
CREATE USER 'desarrollador'@'%' IDENTIFIED BY 'Dev123*';

-- Asignación de privilegios
GRANT SELECT, INSERT, UPDATE, DELETE ON empresa_segura.empleados TO 'admin_rrhh'@'%';
GRANT SELECT ON empresa_segura.* TO 'analista_bi'@'%';
GRANT ALL PRIVILEGES ON empresa_segura.* TO 'desarrollador'@'%';

FLUSH PRIVILEGES;
```

---

## 🧪 Pruebas realizadas
- Verificación de permisos con `SHOW GRANTS FOR 'usuario'@'%';`
- Ejecución de consultas `SELECT`, `INSERT`, `UPDATE` y `DELETE` según privilegios asignados.
- Validación de restricciones de acceso para usuarios sin privilegios de escritura.

---

## 📸 Evidencias sugeridas
1. Captura del script ejecutado correctamente en MySQL Workbench.  
2. Capturas de cada `SHOW GRANTS` por usuario.  
3. Prueba de acceso exitosa y de intento fallido por falta de permisos.  
4. Captura de los datos insertados por cada usuario.

---

## 🧾 Autor
**Nombre:** Natalia Salcedo Ortega  
**Materia:** Bases de Datos  
**Profesor:** [Nombre del profesor]  
**Fecha:** [Agrega la fecha de entrega]

---
© 2025 Natalia Salcedo Ortega. Proyecto académico.