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


 -- EBTREGA 2
 -- VISTAS
 -- La primera muestra ventas por cada laburante
CREATE VIEW vista_ventas_por_empleado AS
SELECT 
    e.id_empleado,
    CONCAT(e.nombre, ' ', e.apellido) AS nombre_empleado,
    COUNT(v.id_venta) AS cantidad_ventas,
    SUM(v.total) AS total_vendido
FROM Empleado e
LEFT JOIN Venta v ON e.id_empleado = v.id_empleado
GROUP BY e.id_empleado, e.nombre, e.apellido;

-- La segunda por si falta stock
CREATE VIEW vista_stock_bajo AS
SELECT 
    id_medicamento,
    nombre,
    stock
FROM Medicamento
WHERE stock <= 10;

-- La tercera los pacientes con sus recetas pertinentes
CREATE VIEW vista_recetas_por_paciente AS
SELECT 
    p.id_paciente,
    CONCAT(p.nombre, ' ', p.apellido) AS nombre_paciente,
    COUNT(r.id_receta) AS cantidad_recetas,
    MAX(r.fecha) AS ultima_receta
FROM Paciente p
LEFT JOIN Receta r ON p.id_paciente = r.id_paciente
GROUP BY p.id_paciente, p.nombre, p.apellido;

 --FUNCIONES
 -- La primer funcion para calcular el valor de las ventas
DELIMITER //

CREATE FUNCTION fn_total_venta(venta_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT SUM(precio_unitario * cantidad)
    INTO total
    FROM DetalleVenta
    WHERE id_venta = venta_id;

    RETURN IFNULL(total, 0);
END //

DELIMITER ;

-- La segunda funcion es para retornar el stock de X medicamento
DELIMITER //

CREATE FUNCTION fn_stock_medicamento(medicamento_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE stock_actual INT;

    SELECT stock
    INTO stock_actual
    FROM Medicamento
    WHERE id_medicamento = medicamento_id;

    RETURN IFNULL(stock_actual, 0);
END //

DELIMITER ;


 -- Stored Proceduressss
  --Inserta ventas, actualizamos stock
DELIMITER //

CREATE PROCEDURE sp_insertar_venta(
    IN p_id_empleado INT,
    IN p_id_paciente INT,
    IN p_fecha DATETIME,
    IN p_medicamento1 INT,
    IN p_cantidad1 INT,
    IN p_precio1 DECIMAL(8,2),
    IN p_medicamento2 INT,
    IN p_cantidad2 INT,
    IN p_precio2 DECIMAL(8,2)
)
BEGIN
    DECLARE v_id_venta INT;
    DECLARE total DECIMAL(10,2);

    SET total = (p_cantidad1 * p_precio1) + (p_cantidad2 * p_precio2);

    INSERT INTO Venta (id_empleado, id_paciente, fecha, total)
    VALUES (p_id_empleado, p_id_paciente, p_fecha, total);

    SET v_id_venta = LAST_INSERT_ID();

    INSERT INTO DetalleVenta (id_venta, id_medicamento, cantidad, precio_unitario)
    VALUES
        (v_id_venta, p_medicamento1, p_cantidad1, p_precio1),
        (v_id_venta, p_medicamento2, p_cantidad2, p_precio2);

    UPDATE Medicamento SET stock = stock - p_cantidad1 WHERE id_medicamento = p_medicamento1;
    UPDATE Medicamento SET stock = stock - p_cantidad2 WHERE id_medicamento = p_medicamento2;
END //

DELIMITER ;

-- El segundo por si queremos actualizar el stock de forma manual
DELIMITER //

CREATE PROCEDURE sp_actualizar_stock(
    IN p_id_medicamento INT,
    IN p_nuevo_stock INT
)
BEGIN
    UPDATE Medicamento
    SET stock = p_nuevo_stock
    WHERE id_medicamento = p_id_medicamento;
END //

DELIMITER ;


-- VARIANTE USANDO TRIGGER
 -- Si preferimos no hacerlo con el Stored Procedure, esto resta el stock cuando insertamos una venta (en teoria)
DELIMITER //

CREATE TRIGGER tr_descuento_stock_despues_venta
AFTER INSERT ON DetalleVenta
FOR EACH ROW
BEGIN
    UPDATE Medicamento
    SET stock = stock - NEW.cantidad
    WHERE id_medicamento = NEW.id_medicamento;
END //

DELIMITER ;

