-- Generado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   en:        2020-03-15 22:35:11 CLST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE alternativa (
    idalternativa                INTEGER NOT NULL,
    descripcion                  VARCHAR2(300 CHAR),
    correcta                     CHAR(1),
    porcentajepuntos             FLOAT(2),
    pregunta_idpregunta          INTEGER NOT NULL,
    pregunta_idevaluacion        INTEGER NOT NULL,
    pregunta_idprograma          INTEGER NOT NULL,
    aplicaciontest_idaplicacion  INTEGER NOT NULL
);

COMMENT ON COLUMN alternativa.correcta IS
    '1=correcta
0=incorrecta';

CREATE UNIQUE INDEX alternativa__idx ON
    alternativa (
        aplicaciontest_idaplicacion
    ASC );

ALTER TABLE alternativa
    ADD CONSTRAINT alternativa_pk PRIMARY KEY ( idalternativa,
                                                pregunta_idpregunta,
                                                pregunta_idevaluacion,
                                                pregunta_idprograma );

CREATE TABLE aplicaciontest (
    idaplicacion             INTEGER NOT NULL,
    estudiante_idestudiante  INTEGER NOT NULL,
    estudiante_idcurso       INTEGER NOT NULL,
    estudiante_idprograma    INTEGER NOT NULL,
    evaluacion               INTEGER,
    pregunta                 INTEGER,
    respuesta                VARCHAR2(300 CHAR)
);

COMMENT ON COLUMN aplicaciontest.evaluacion IS
    'identificador de la evaluacion a la que corresponde la hoja de respuestas';

ALTER TABLE aplicaciontest ADD CONSTRAINT aplicaciontest_pk PRIMARY KEY ( idaplicacion );

CREATE TABLE curso (
    idcurso              INTEGER NOT NULL,
    programa_idprograma  INTEGER NOT NULL
);

ALTER TABLE curso ADD CONSTRAINT curso_pk PRIMARY KEY ( idcurso,
                                                        programa_idprograma );

CREATE TABLE estudiante (
    idestudiante      INTEGER NOT NULL,
    nombre            VARCHAR2(100 CHAR),
    curso_idcurso     INTEGER NOT NULL,
    curso_idprograma  INTEGER NOT NULL
);

ALTER TABLE estudiante
    ADD CONSTRAINT estudiante_pk PRIMARY KEY ( idestudiante,
                                               curso_idcurso,
                                               curso_idprograma );

CREATE TABLE evaluacion (
    idevaluacion                 INTEGER NOT NULL,
    nombre                       VARCHAR2(50 CHAR),
    descripcion                  VARCHAR2(100 CHAR),
    unidad                       INTEGER,
    autor                        VARCHAR2(50 CHAR),
    fechacreacion                DATE,
    programa_idprograma          INTEGER NOT NULL,
    programa                     INTEGER,
    aplicaciontest_idaplicacion  INTEGER NOT NULL
);

CREATE UNIQUE INDEX evaluacion__idx ON
    evaluacion (
        aplicaciontest_idaplicacion
    ASC );

ALTER TABLE evaluacion ADD CONSTRAINT evaluacion_pk PRIMARY KEY ( idevaluacion,
                                                                  programa_idprograma );

CREATE TABLE pregunta (
    idpregunta                   INTEGER NOT NULL,
    enunciado                    VARCHAR2(300 CHAR),
    puntajetotal                 FLOAT(2),
    evaluacion_idevaluacion      INTEGER NOT NULL,
    evaluacion_idprograma        INTEGER NOT NULL,
    aplicaciontest_idaplicacion  INTEGER NOT NULL
);

CREATE UNIQUE INDEX pregunta__idx ON
    pregunta (
        aplicaciontest_idaplicacion
    ASC );

ALTER TABLE pregunta
    ADD CONSTRAINT pregunta_pk PRIMARY KEY ( idpregunta,
                                             evaluacion_idevaluacion,
                                             evaluacion_idprograma );

CREATE TABLE programa (
    idprograma  INTEGER NOT NULL,
    nombre      VARCHAR2(100 CHAR)
);

ALTER TABLE programa ADD CONSTRAINT programa_pk PRIMARY KEY ( idprograma );

ALTER TABLE alternativa
    ADD CONSTRAINT alternativa_aplicaciontest_fk FOREIGN KEY ( aplicaciontest_idaplicacion )
        REFERENCES aplicaciontest ( idaplicacion );

ALTER TABLE alternativa
    ADD CONSTRAINT alternativa_pregunta_fk FOREIGN KEY ( pregunta_idpregunta,
                                                         pregunta_idevaluacion,
                                                         pregunta_idprograma )
        REFERENCES pregunta ( idpregunta,
                              evaluacion_idevaluacion,
                              evaluacion_idprograma );

ALTER TABLE aplicaciontest
    ADD CONSTRAINT aplicaciontest_estudiante_fk FOREIGN KEY ( estudiante_idestudiante,
                                                              estudiante_idcurso,
                                                              estudiante_idprograma )
        REFERENCES estudiante ( idestudiante,
                                curso_idcurso,
                                curso_idprograma );

ALTER TABLE curso
    ADD CONSTRAINT curso_programa_fk FOREIGN KEY ( programa_idprograma )
        REFERENCES programa ( idprograma );

ALTER TABLE estudiante
    ADD CONSTRAINT estudiante_curso_fk FOREIGN KEY ( curso_idcurso,
                                                     curso_idprograma )
        REFERENCES curso ( idcurso,
                           programa_idprograma );

ALTER TABLE evaluacion
    ADD CONSTRAINT evaluacion_aplicaciontest_fk FOREIGN KEY ( aplicaciontest_idaplicacion )
        REFERENCES aplicaciontest ( idaplicacion );

ALTER TABLE evaluacion
    ADD CONSTRAINT evaluacion_programa_fk FOREIGN KEY ( programa_idprograma )
        REFERENCES programa ( idprograma );

ALTER TABLE pregunta
    ADD CONSTRAINT pregunta_aplicaciontest_fk FOREIGN KEY ( aplicaciontest_idaplicacion )
        REFERENCES aplicaciontest ( idaplicacion );

ALTER TABLE pregunta
    ADD CONSTRAINT pregunta_evaluacion_fk FOREIGN KEY ( evaluacion_idevaluacion,
                                                        evaluacion_idprograma )
        REFERENCES evaluacion ( idevaluacion,
                                programa_idprograma );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             3
-- ALTER TABLE                             16
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
