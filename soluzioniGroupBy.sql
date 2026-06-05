/*Terza consegna*/
/* ### Group by*/

/*
1. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
*/
select office_address, count(*) as 'numero_insegnanti'
from teachers t
group by office_address;

/*
2. Contare quanti iscritti ci sono stati ogni anno
*/
select year(enrolment_date) as anno_iscrizione, count(*) as enrolments
from students s
group by year(enrolment_date)
order by anno_iscrizione

