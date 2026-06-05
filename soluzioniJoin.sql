/* Terza consegna */

/* Join */

/*
1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
*/
select *
from students as s
	join degrees as d
		on d.id = s.degree_id
having d.name = 'Corso di Laurea in Economia';

/*
2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di
Neuroscienze
*/
select *
from departments as dep
	join degrees as deg
		on dep.id = deg.department_id
having dep.name = 'Dipartimento di Neuroscienze'
	and deg.level = 'magistrale'

/*
3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
*/
select *
from teachers as t
	join course_teacher as ct
		on t.id = ct.teacher_id
	join courses as c
		on c.id = ct.course_id
having t.id=44

