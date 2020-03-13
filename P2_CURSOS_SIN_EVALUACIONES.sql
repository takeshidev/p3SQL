--------------------------------------------------------
--  DDL for View P2_CURSOS_SIN_EVALUACIONES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "EVALUACION3"."P2_CURSOS_SIN_EVALUACIONES" ("IDCURSO", "NUMERO_EVALUACIONES") AS 
  select curso.idcurso, count(evaluacion.nombre) as Numero_Evaluaciones
from curso, programa, evaluacion
where (curso.idprograma = programa.idprograma and evaluacion.idprograma = programa.idprograma) having count(evaluacion.nombre)<1
GROUP BY curso.idcurso
order by curso.idcurso
;
