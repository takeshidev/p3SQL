--------------------------------------------------------
--  DDL for View P3C_CANTIDAD_ALTERNATIVAS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "EVALUACION3"."P3C_CANTIDAD_ALTERNATIVAS" ("IDPREGUNTA", "CANTIDAD_ALTERNATIVAS", "CANTIDAD_CORRECTAS") AS 
  select pregunta.idpregunta, count(alternativa.idalternativa) as Cantidad_alternativas, sum(alternativa.correcta) as cantidad_correctas from pregunta join alternativa on alternativa.idpregunta = pregunta.idpregunta having sum(alternativa.correcta)=0 or sum(alternativa.correcta)=count(alternativa.idalternativa)  group by pregunta.idpregunta order by idpregunta
;
