--------------------------------------------------------
--  DDL for View P1_NUMERO_EVALUACIONES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "EVALUACION3"."P1_NUMERO_EVALUACIONES" ("IDCURSO", "NUMERO_EVALUACIONES") AS 
  select curso.idcurso, count(evaluacion.nombre) as Numero_Evaluaciones
from curso, programa, evaluacion
where curso.idprograma = programa.idprograma and evaluacion.idprograma = programa.idprograma   
GROUP BY curso.idcurso
order by curso.idcurso
;
