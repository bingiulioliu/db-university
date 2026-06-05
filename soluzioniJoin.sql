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


