# FarmaciaDB por Daniel Ariguel

POR EL MOMENTO LAS TABLAS Y SUS CARACTERISTICAS SON LAS SIGUIENTES:

Tabla Campo Nombre Completo Tipo de Dato Clave
Paciente id_paciente ID del paciente INT PK
Paciente nombre Nombre VARCHAR(50)
Paciente apellido Apellido VARCHAR(50)
Paciente dni DNI CHAR(8) UNIQUE
Paciente telefono Teléfono VARCHAR(20)
Paciente direccion Dirección VARCHAR(100)

Empleado id_empleado ID del empleado INT PK
Empleado nombre Nombre VARCHAR(50)
Empleado apellido Apellido VARCHAR(50)
Empleado dni DNI CHAR(8) UNIQUE
Empleado puesto Puesto VARCHAR(50)
Empleado telefono Teléfono VARCHAR(20)

Medicamento id_medicamento ID del medicamento INT PK
Medicamento nombre Nombre VARCHAR(100)
Medicamento descripcion Descripción TEXT
Medicamento precio Precio DECIMAL(8,2)
Medicamento stock Stock INT

Receta id_receta ID de receta INT PK
Receta id_paciente ID del paciente INT FK
Receta fecha Fecha DATE
Receta medico Médico VARCHAR(100)

DetalleReceta id_receta ID de receta INT PK, FK
DetalleReceta id_medicamento ID medicamento INT PK, FK
DetalleReceta cantidad Cantidad INT

Venta id_venta ID venta INT PK
Venta id_empleado ID empleado INT FK
Venta id_paciente ID paciente INT FK
Venta fecha Fecha DATETIME
Venta total Total DECIMAL(8,2)

DetalleVenta id_venta ID venta INT PK, FK
DetalleVenta id_medicamento ID medicamento INT PK, FK
DetalleVenta cantidad Cantidad INT
DetalleVenta precio_unitario Precio unitario DECIMAL(8,2)
