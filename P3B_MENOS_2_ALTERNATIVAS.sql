--------------------------------------------------------
--  DDL for View P3B_MENOS_2_ALTERNATIVAS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "EVALUACION3"."P3B_MENOS_2_ALTERNATIVAS" ("NOMBRE", "IDPREGUNTA", "NUM_ALTERNATIVAS") AS 
  select evaluacion.nombre, pregunta.idpregunta, count(alternativa.idalternativa) as num_alternativas
from evaluacion
join pregunta on pregunta.idevaluacion = evaluacion.idevaluacion
join alternativa
on alternativa.idpregunta = pregunta.idpregunta having count(alternativa.idalternativa)<3
group by evaluacion.nombre, pregunta.idpregunta
;
