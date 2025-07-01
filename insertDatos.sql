--Inserción de datos para tabla Paciente

INSERT INTO Paciente (nombre, apellido, dni, telefono, direccion) VALUES
('Juan', 'Pérez', '12345678', '1123456789', 'Calle 1'),
('María', 'Gómez', '87654321', '1198765432', 'Calle 2'),
('Carlos', 'Fernández', '11223344', '1133344455', 'Calle 3'),
('Lucía', 'Martínez', '22334455', '1144455566', 'Calle 4'),
('Ana', 'Torres', '33445566', '1155566677', 'Calle 5'),
('Diego', 'López', '44556677', '1166677788', 'Calle 6'),
('Jorge', 'Ramírez', '55667788', '1177788899', 'Calle 7'),
('Laura', 'Sánchez', '66778899', '1188899900', 'Calle 8'),
('Pedro', 'Ruiz', '77889900', '1199900011', 'Calle 9'),
('Florencia', 'Silva', '88990011', '1100001112', 'Calle 10');

--Ahora inserción de datos para la tabla Empleado

INSERT INTO Empleado (nombre, apellido, dni, puesto, telefono) VALUES
('Andrea', 'Molina', '11112222', 'Cajera', '1133221100'),
('Lucas', 'Farias', '22223333', 'Farmacéutico', '1133221101'),
('Paula', 'Suárez', '33334444', 'Cajera', '1133221102'),
('Martín', 'Quiroga', '44445555', 'Farmacéutico', '1133221103'),
('Camila', 'Benítez', '55556666', 'Supervisor', '1133221104'),
('Tomás', 'Domínguez', '66667777', 'Cajero', '1133221105'),
('Valeria', 'Luna', '77778888', 'Farmacéutica', '1133221106'),
('Nicolás', 'Herrera', '88889999', 'Cajero', '1133221107'),
('Julieta', 'Correa', '99990000', 'Supervisor', '1133221108'),
('Federico', 'Vega', '00001111', 'Repositor', '1133221109');

--Inserción de datos para la tablita Medicamento

INSERT INTO Medicamento (nombre, descripcion, precio, stock) VALUES
('Paracetamol', 'Analgésico y antipirético', 500.00, 20),
('Ibuprofeno', 'Analgésico, antiinflamatorio', 650.00, 15),
('Amoxicilina', 'Antibiótico de amplio espectro', 1200.00, 8),
('Omeprazol', 'Inhibidor de la bomba de protones', 900.00, 30),
('Loratadina', 'Antihistamínico', 700.00, 12),
('Vitamina C', 'Suplemento vitamínico', 300.00, 25),
('Diclofenac', 'Antiinflamatorio', 850.00, 6),
('Metformina', 'Antidiabético oral', 1100.00, 18),
('Salbutamol', 'Broncodilatador', 950.00, 10),
('Ranitidina', 'Antiácido', 400.00, 22);


-- Inserción de datos para tabla Receta
INSERT INTO Receta (id_paciente, fecha, medico) VALUES
(1, '2024-06-01', 'Dr. García'),
(2, '2024-06-02', 'Dra. López'),
(3, '2024-06-03', 'Dr. Ramírez'),
(4, '2024-06-04', 'Dra. Torres'),
(5, '2024-06-05', 'Dr. Suárez'),
(6, '2024-06-06', 'Dra. González'),
(7, '2024-06-07', 'Dr. Martínez'),
(8, '2024-06-08', 'Dra. Romero'),
(9, '2024-06-09', 'Dr. Castro'),
(10, '2024-06-10', 'Dra. Medina');

-- Inserción para DetalleReceta
INSERT INTO DetalleReceta (id_receta, id_medicamento, cantidad) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(3, 4, 1),
(4, 5, 1),
(5, 6, 2),
(6, 7, 1),
(7, 8, 1),
(8, 9, 2),
(9, 10, 1);

-- Inserción de datos para tabla Venta
INSERT INTO Venta (id_empleado, id_paciente, fecha, total) VALUES
(1, 1, '2024-06-01 10:00:00', 1000.00),
(2, 2, '2024-06-02 11:00:00', 1300.00),
(3, 3, '2024-06-03 12:00:00', 1500.00),
(4, 4, '2024-06-04 13:00:00', 1200.00),
(5, 5, '2024-06-05 14:00:00', 2000.00),
(6, 6, '2024-06-06 15:00:00', 1700.00),
(7, 7, '2024-06-07 16:00:00', 1100.00),
(8, 8, '2024-06-08 17:00:00', 900.00),
(9, 9, '2024-06-09 18:00:00', 800.00),
(10, 10, '2024-06-10 19:00:00', 750.00);

-- Inserción para DetalleVenta
INSERT INTO DetalleVenta (id_venta, id_medicamento, cantidad, precio_unitario) VALUES
(1, 1, 2, 500.00),
(2, 2, 2, 650.00),
(3, 3, 1, 1200.00),
(4, 4, 1, 900.00),
(5, 5, 2, 700.00),
(6, 6, 2, 300.00),
(7, 7, 1, 850.00),
(8, 8, 1, 1100.00),
(9, 9, 2, 950.00),
(10, 10, 1, 400.00);

-- Inserción de datos para tabla Proveedor
INSERT INTO Proveedor (nombre, telefono, direccion) VALUES
('Laboratorio Alfa', '1111111111', 'Av. Siempre Viva 123'),
('Laboratorio Beta', '2222222222', 'Calle Falsa 456'),
('Distribuidora Gamma', '3333333333', 'Ruta 9 Km 10'),
('Pharma S.A.', '4444444444', 'Mitre 202'),
('MedicPlus', '5555555555', 'San Martín 303'),
('Droguería Delta', '6666666666', 'Belgrano 404'),
('Biofarma', '7777777777', 'Colón 505'),
('VitaLab', '8888888888', 'Sarmiento 606'),
('Interpharma', '9999999999', 'Independencia 707'),
('Farmex', '0000000000', 'Perón 808');

-- Inserción de datos para tabla Compra
INSERT INTO Compra (id_proveedor, fecha, total) VALUES
(1, '2024-06-01', 10000.00),
(2, '2024-06-02', 12000.00),
(3, '2024-06-03', 8000.00),
(4, '2024-06-04', 9000.00),
(5, '2024-06-05', 15000.00),
(6, '2024-06-06', 7000.00),
(7, '2024-06-07', 11000.00),
(8, '2024-06-08', 9500.00),
(9, '2024-06-09', 8900.00),
(10, '2024-06-10', 10000.00);

-- Inserción para DetalleCompra
INSERT INTO DetalleCompra (id_compra, id_medicamento, cantidad, precio_unitario) VALUES
(1, 1, 20, 400.00),
(2, 2, 30, 500.00),
(3, 3, 10, 1000.00),
(4, 4, 15, 800.00),
(5, 5, 25, 600.00),
(6, 6, 20, 250.00),
(7, 7, 15, 700.00),
(8, 8, 10, 950.00),
(9, 9, 12, 850.00),
(10, 10, 18, 300.00);

-- ObraSocial
INSERT INTO ObraSocial (nombre, telefono, email) VALUES
('PAMI', '0800-333-0001', 'pami@obrasocial.com'),
('OSDE', '0800-333-0002', 'osde@obrasocial.com'),
('IOMA', '0800-333-0003', 'ioma@obrasocial.com'),
('Swiss Medical', '0800-333-0004', 'swiss@obrasocial.com'),
('Galeno', '0800-333-0005', 'galeno@obrasocial.com'),
('Sancor Salud', '0800-333-0006', 'sancor@obrasocial.com'),
('Federada', '0800-333-0007', 'federada@obrasocial.com'),
('Union Personal', '0800-333-0008', 'up@obrasocial.com'),
('OSPIL', '0800-333-0009', 'ospil@obrasocial.com'),
('AMFFA', '0800-333-0010', 'amffa@obrasocial.com');

-- PacienteObraSocial
INSERT INTO PacienteObraSocial (id_paciente, id_obra_social, numero_afiliado) VALUES
(1, 9, 'AFIL00001'),
(2, 8, 'AFIL00002'),
(3, 10, 'AFIL00003'),
(4, 1, 'AFIL00004'),
(5, 9, 'AFIL00005'),
(6, 4, 'AFIL00006'),
(7, 6, 'AFIL00007'),
(8, 7, 'AFIL00008'),
(9, 6, 'AFIL00009'),
(10, 2, 'AFIL00010');

-- Turno
INSERT INTO Turno (id_paciente, fecha, motivo) VALUES
(3, '2025-07-03 09:00:00', 'Motivo 1'),
(10, '2025-07-03 09:30:00', 'Motivo 2'),
(5, '2025-07-03 10:00:00', 'Motivo 3'),
(1, '2025-07-03 10:30:00', 'Motivo 4'),
(2, '2025-07-03 11:00:00', 'Motivo 5'),
(6, '2025-07-03 11:30:00', 'Motivo 6'),
(9, '2025-07-03 12:00:00', 'Motivo 7'),
(3, '2025-07-03 12:30:00', 'Motivo 8'),
(1, '2025-07-03 13:00:00', 'Motivo 9'),
(10, '2025-07-03 13:30:00', 'Motivo 10');

-- HistorialPrecio
INSERT INTO HistorialPrecio (id_medicamento, precio_anterior, precio_nuevo, fecha_cambio) VALUES
(1, 924.82, 993.27, '2025-06-22'),
(2, 1686.06, 1748.46, '2025-06-15'),
(3, 1500.48, 1557.64, '2025-06-21'),
(4, 516.09, 567.83, '2025-06-13'),
(5, 1684.3, 1763.87, '2025-06-12'),
(6, 573.7, 626.37, '2025-06-01'),
(7, 1511.44, 1555.03, '2025-06-08'),
(8, 982.37, 1065.26, '2025-06-28'),
(9, 996.06, 1081.88, '2025-06-14'),
(10, 1774.82, 1828.96, '2025-06-23');

-- MovimientoStock
INSERT INTO MovimientoStock (id_medicamento, tipo, cantidad, fecha) VALUES
(6, 'entrada', 25, '2025-06-01 00:00:00'),
(7, 'salida', 97, '2025-06-02 00:00:00'),
(3, 'ajuste', 74, '2025-06-03 00:00:00'),
(1, 'salida', 31, '2025-06-04 00:00:00'),
(6, 'entrada', 37, '2025-06-05 00:00:00'),
(9, 'entrada', 59, '2025-06-06 00:00:00'),
(2, 'ajuste', 91, '2025-06-07 00:00:00'),
(4, 'entrada', 63, '2025-06-08 00:00:00'),
(10, 'ajuste', 2, '2025-06-09 00:00:00'),
(1, 'entrada', 91, '2025-06-10 00:00:00');

-- UsuarioSistema
INSERT INTO UsuarioSistema (nombre_usuario, rol, email, contrasena) VALUES
('user1', 'Rol1', 'user1@mail.com', 'pass1'),
('user2', 'Rol2', 'user2@mail.com', 'pass2'),
('user3', 'Rol3', 'user3@mail.com', 'pass3'),
('user4', 'Rol4', 'user4@mail.com', 'pass4'),
('user5', 'Rol5', 'user5@mail.com', 'pass5'),
('user6', 'Rol6', 'user6@mail.com', 'pass6'),
('user7', 'Rol7', 'user7@mail.com', 'pass7'),
('user8', 'Rol8', 'user8@mail.com', 'pass8'),
('user9', 'Rol9', 'user9@mail.com', 'pass9'),
('user10', 'Rol10', 'user10@mail.com', 'pass10');

-- BitacoraCambios
INSERT INTO BitacoraCambios (tabla_afectada, id_usuario, accion, fecha) VALUES
('Venta', 4, 'DELETE', '2025-06-02 00:00:00'),
('Venta', 7, 'UPDATE', '2025-06-03 00:00:00'),
('Medicamento', 4, 'UPDATE', '2025-06-04 00:00:00'),
('Venta', 9, 'DELETE', '2025-06-05 00:00:00'),
('Venta', 6, 'INSERT', '2025-06-06 00:00:00'),
('Stock', 1, 'INSERT', '2025-06-07 00:00:00'),
('Venta', 3, 'INSERT', '2025-06-08 00:00:00'),
('Stock', 10, 'DELETE', '2025-06-09 00:00:00'),
('Stock', 1, 'INSERT', '2025-06-10 00:00:00'),
('Venta', 10, 'INSERT', '2025-06-11 00:00:00');

-- CategoriaMedicamento
INSERT INTO CategoriaMedicamento (nombre) VALUES
('Antibióticos'),
('Analgésicos'),
('Antiinflamatorios'),
('Antihistamínicos'),
('Antisépticos'),
('Broncodilatadores'),
('Cardiovasculares'),
('Diuréticos'),
('Gastrointestinales'),
('Psicotrópicos');

-- MedicamentoCategoria
INSERT INTO MedicamentoCategoria (id_medicamento, id_categoria) VALUES
(10, 1),
(7, 9),
(4, 3),
(6, 6),
(1, 1),
(6, 10),
(6, 3),
(10, 10),
(3, 5),
(9, 3);

-- Con esto insertamos datos en todas las tablas
