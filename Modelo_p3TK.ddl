-- Generado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   en:        2020-03-13 17:49:16 CLST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE alternativa (
    idalternativa     INTEGER NOT NULL,
    descripcion       VARCHAR2(300 CHAR),
    correcta          CHAR(1),
    porcentajepuntos  FLOAT(2),
    idpregunta        INTEGER NOT NULL,
    idevaluacion      INTEGER NOT NULL,
    idprograma        INTEGER NOT NULL
);

COMMENT ON COLUMN alternativa.correcta IS
    '1=correcta
0=incorrecta';

ALTER TABLE alternativa
    ADD CONSTRAINT alternativa_pk PRIMARY KEY ( idalternativa,
                                                idpregunta,
                                                idevaluacion,
                                                idprograma );

CREATE TABLE aplicaciontest (
    idaplicacion  INTEGER NOT NULL,
    idestudiante  INTEGER NOT NULL,
    idcurso       INTEGER NOT NULL,
    idprograma    INTEGER NOT NULL,
    evaluacion    INTEGER,
    pregunta      INTEGER,
    respuesta     VARCHAR2(300 CHAR)
);

COMMENT ON COLUMN aplicaciontest.evaluacion IS
    'identificador de la evaluacion a la que corresponde la hoja de respuestas';

ALTER TABLE aplicaciontest ADD CONSTRAINT aplicaciontest_pk PRIMARY KEY ( idaplicacion );

CREATE TABLE curso (
    idcurso     INTEGER NOT NULL,
    idprograma  INTEGER NOT NULL
);

ALTER TABLE curso ADD CONSTRAINT curso_pk PRIMARY KEY ( idcurso,
                                                        idprograma );

CREATE TABLE estudiante (
    idestudiante  INTEGER NOT NULL,
    nombre        VARCHAR2(100 CHAR),
    idcurso       INTEGER NOT NULL,
    idprograma    INTEGER NOT NULL
);

ALTER TABLE estudiante
    ADD CONSTRAINT estudiante_pk PRIMARY KEY ( idestudiante,
                                               idcurso,
                                               idprograma );

CREATE TABLE evaluacion (
    idevaluacion   INTEGER NOT NULL,
    nombre         VARCHAR2(50 CHAR),
    descripcion    VARCHAR2(100 CHAR),
    unidad         INTEGER,
    autor          VARCHAR2(50 CHAR),
    fechacreacion  DATE,
    idprograma     INTEGER NOT NULL,
    programa       INTEGER
);

ALTER TABLE evaluacion ADD CONSTRAINT evaluacion_pk PRIMARY KEY ( idevaluacion,
                                                                  idprograma );

CREATE TABLE pregunta (
    idpregunta    INTEGER NOT NULL,
    enunciado     VARCHAR2(300 CHAR),
    puntajetotal  FLOAT(2),
    idevaluacion  INTEGER NOT NULL,
    idprograma    INTEGER NOT NULL
);

ALTER TABLE pregunta
    ADD CONSTRAINT pregunta_pk PRIMARY KEY ( idpregunta,
                                             idevaluacion,
                                             idprograma );

CREATE TABLE programa (
    idprograma  INTEGER NOT NULL,
    nombre      VARCHAR2(100 CHAR)
);

ALTER TABLE programa ADD CONSTRAINT programa_pk PRIMARY KEY ( idprograma );

ALTER TABLE alternativa
    ADD CONSTRAINT alternativa_pregunta_fk FOREIGN KEY ( idpregunta,
                                                         idevaluacion,
                                                         idprograma )
        REFERENCES pregunta ( idpregunta,
                              idevaluacion,
                              idprograma );

ALTER TABLE aplicaciontest
    ADD CONSTRAINT aplicaciontest_estudiante_fk FOREIGN KEY ( idestudiante,
                                                              idcurso,
                                                              idprograma )
        REFERENCES estudiante ( idestudiante,
                                idcurso,
                                idprograma );

ALTER TABLE curso
    ADD CONSTRAINT curso_programa_fk FOREIGN KEY ( idprograma )
        REFERENCES programa ( idprograma );

ALTER TABLE estudiante
    ADD CONSTRAINT estudiante_curso_fk FOREIGN KEY ( idcurso,
                                                     idprograma )
        REFERENCES curso ( idcurso,
                           idprograma );

ALTER TABLE evaluacion
    ADD CONSTRAINT evaluacion_programa_fk FOREIGN KEY ( idprograma )
        REFERENCES programa ( idprograma );

ALTER TABLE pregunta
    ADD CONSTRAINT pregunta_evaluacion_fk FOREIGN KEY ( idevaluacion,
                                                        idprograma )
        REFERENCES evaluacion ( idevaluacion,
                                idprograma );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             13
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
