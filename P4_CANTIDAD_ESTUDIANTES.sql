--------------------------------------------------------
--  DDL for View P4_CANTIDAD_ESTUDIANTES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "EVALUACION3"."P4_CANTIDAD_ESTUDIANTES" ("IDCURSO", "CANTIDADALUMN") AS 
  SELECT curso.idcurso,COUNT(estudiante.nombre) as CantidadAlumn FROM curso left JOIN estudiante ON curso.idcurso = estudiante.idcurso group by curso.idcurso order by curso.idcurso
;
