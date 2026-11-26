CREATE DATABASE IF NOT EXISTS AulaPredict;
USE AulaPredict;

CREATE TABLE Desempeno_Academico (

    -- Identificacion
    id_alumno INT AUTO_INCREMENT PRIMARY KEY,

    -- Factores de contexto
    horas_trabajo INT NOT NULL
        CHECK (horas_trabajo BETWEEN 0 AND 48),

    traslado_minutos INT NOT NULL
        CHECK (traslado_minutos BETWEEN 0 AND 180),

    cantidad_materias INT NOT NULL
        CHECK (cantidad_materias BETWEEN 1 AND 6),

    recursa BOOLEAN NOT NULL
        CHECK (recursa IN (0, 1)),

    -- Primer parcial
    parcial_1 DECIMAL(4,2) DEFAULT NULL
        CHECK (parcial_1 BETWEEN 0 AND 10),

    asistencia_1 DECIMAL(5,4) DEFAULT NULL
        CHECK (asistencia_1 BETWEEN 0 AND 1),

    tareas_1 DECIMAL(5,4) DEFAULT NULL
        CHECK (tareas_1 BETWEEN 0 AND 1),

    participaciones_1 DECIMAL(5,4) DEFAULT NULL
        CHECK (participaciones_1 BETWEEN 0 AND 1),

    notas_1 BOOLEAN DEFAULT NULL
        CHECK (notas_1 IN (0, 1)),

    -- Segundo parcial
    parcial_2 DECIMAL(4,2) DEFAULT NULL
        CHECK (parcial_2 BETWEEN 0 AND 10),

    asistencia_2 DECIMAL(5,4) DEFAULT NULL
        CHECK (asistencia_2 BETWEEN 0 AND 1),

    tareas_2 DECIMAL(5,4) DEFAULT NULL
        CHECK (tareas_2 BETWEEN 0 AND 1),

    participaciones_2 DECIMAL(5,4) DEFAULT NULL
        CHECK (participaciones_2 BETWEEN 0 AND 1),

    notas_2 BOOLEAN DEFAULT NULL
        CHECK (notas_2 IN (0, 1)),

    -- Tercer parcial
    parcial_3 DECIMAL(4,2) DEFAULT NULL
        CHECK (parcial_3 BETWEEN 0 AND 10),

    asistencia_3 DECIMAL(5,4) DEFAULT NULL
        CHECK (asistencia_3 BETWEEN 0 AND 1),

    tareas_3 DECIMAL(5,4) DEFAULT NULL
        CHECK (tareas_3 BETWEEN 0 AND 1),

    participaciones_3 DECIMAL(5,4) DEFAULT NULL
        CHECK (participaciones_3 BETWEEN 0 AND 1),

    notas_3 BOOLEAN DEFAULT NULL
        CHECK (notas_3 IN (0, 1)),

    -- Variables calculadas (no almacenadas)
    promedio_final DECIMAL(8,6)
        GENERATED ALWAYS AS (
            (parcial_1 + parcial_2 + parcial_3) / 3
        ) VIRTUAL,

    reprobado BOOLEAN
        GENERATED ALWAYS AS (
            CASE
                WHEN parcial_1 IS NULL
                  OR parcial_2 IS NULL
                  OR parcial_3 IS NULL THEN NULL
                WHEN parcial_1 + parcial_2 + parcial_3 < 18 THEN 1
                ELSE 0
            END
        ) VIRTUAL

);
