-- Empiezo por crear la base de datos (por ahora es para una farmacia, pero no estoy seguro de si sera el final). Comparto tambien que estuve 128 años resolviendo un problema con la conexion
-- al final era una configuracion en el panel de control, en "region", que como es considerada BETA viene deshabilitada a veces. Ademas reinicie el servicio MYSQL80, aunque eso solo no solucionaba
CREATE DATABASE IF NOT EXISTS FarmaciaDB;
USE FarmaciaDB;

-- Voy creando las distintas tablas. Tabla: Paciente
CREATE TABLE Paciente (
    id_paciente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    dni CHAR(8) UNIQUE NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    direccion VARCHAR(100) NOT NULL
);

-- Ahora los laburantes. Tabla: Empleado
CREATE TABLE Empleado (
    id_empleado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    dni CHAR(8) UNIQUE NOT NULL,
    puesto VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL
);

-- Tabla: Medicamento
CREATE TABLE Medicamento (
    id_medicamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR (150) NOT NULL,
    precio DECIMAL(8,2) NOT NULL,
    stock INT NOT NULL
);

-- Para la mayoria de los medicamentos se requieren recetas. Tabla: Receta
CREATE TABLE Receta (
    id_receta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    fecha DATE NOT NULL,
    medico VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente)
);

-- Tabla: DetalleReceta
CREATE TABLE DetalleReceta (
    id_receta INT,
    id_medicamento INT,
    cantidad INT,
    PRIMARY KEY (id_receta, id_medicamento),
    FOREIGN KEY (id_receta) REFERENCES Receta(id_receta),
    FOREIGN KEY (id_medicamento) REFERENCES Medicamento(id_medicamento)
);

-- Tabla: Venta
CREATE TABLE Venta (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    id_paciente INT,
    fecha DATETIME,
    total DECIMAL(8,2),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado),
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente)
);

-- Tabla: DetalleVenta
CREATE TABLE DetalleVenta (
    id_venta INT,
    id_medicamento INT,
    cantidad INT,
    precio_unitario DECIMAL(8,2),
    PRIMARY KEY (id_venta, id_medicamento),
    FOREIGN KEY (id_venta) REFERENCES Venta(id_venta),
    FOREIGN KEY (id_medicamento) REFERENCES Medicamento(id_medicamento)
);
