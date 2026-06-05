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
	and deg.level = 'magistrale';

/*
3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
*/
select *
from teachers as t
	join course_teacher as ct
		on t.id = ct.teacher_id
	join courses as c
		on c.id = ct.course_id
having t.id=44;

/*
4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui
sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e
nome
*/
select s.*, dep.name, d.*
from students as s
	join degrees as d
		on d.id = s.degree_id
	join departments as dep
		on dep.id = d.department_id
order by s.name asc, s.surname asc;

/*
5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
*/
select *
from teachers as t
	join course_teacher as ct
		on t.id=ct.teacher_id
	join courses as c
		on c.id = ct.course_id
	join degrees as d
		on d.id = c.degree_id
order by d.name;

/*
6. Selezionare tutti i docenti che insegnano nel Dipartimento di
Matematica (54)
*/
select distinct t.*, d.name
from departments as d
	join degrees as deg
		on deg.department_id = d.id
	join courses as c
		on deg.id = c.degree_id
	join course_teacher as ct
		on c.id = ct.course_id
	join teachers as t
		on t.id = ct.teacher_id
where d.name = 'Dipartimento di Matematica'
order by t.name, t.surname;

/*
7. BONUS: Selezionare per ogni studente il numero di tentativi sostenuti
per ogni esame, stampando anche il voto massimo. Successivamente,
filtrare i tentativi con voto minimo 18.
*/
select s.id, s.name, s.surname, count(es.vote) as esami_totali, max(es.vote) as voto_massimo, min(es.vote) as voto_minimo
from students as s
	join exam_student as es
		on s.id = es.student_id
	join exams as e
		on e.id = es.exam_id
group by s.id, s.name, s.surname
having min(es.vote) >= 18;