--------------------------------------------------------
--  DDL for View P3A_SIN_PREGUNTAS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "EVALUACION3"."P3A_SIN_PREGUNTAS" ("IDEVALUACION", "NOMBRE", "NUM_PREGUNTAS") AS 
  select evaluacion.idevaluacion, evaluacion.nombre, count(pregunta.idpregunta) as num_preguntas from evaluacion full join pregunta on evaluacion.idevaluacion = pregunta.idevaluacion having count(pregunta.idpregunta)<1 group by  evaluacion.idevaluacion, evaluacion.nombre order by evaluacion.idevaluacion
;
