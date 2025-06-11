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
