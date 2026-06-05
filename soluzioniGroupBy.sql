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

/*
3. Calcolare la media dei voti di ogni appello d'esame
*/
select c.name, avg(es.vote) as avg_vote
from exam_student as es
	join exams as e
		on e.id = es.exam_id
	join courses as c
		on c.id = e.course_id
group by c.name;

