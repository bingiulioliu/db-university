/* 1. GLI STUDENTI "ESTIVI"
Selezionare il nome completo (usando CONCAT) e la data di nascita di tutti gli studenti nati nei mesi di giugno, 
luglio e agosto, ordinati dal più giovane al più vecchio. */
SELECT CONCAT(s.name, ' ', s.surname) AS `fullname`, s.date_of_birth
FROM `students` `s`
WHERE MONTH(s.date_of_birth) IN (6,7,8)
ORDER BY `s`.`date_of_birth` DESC;

/* 2. RICERCA E PULIZIA EMAIL
Selezionare tutti gli insegnanti che hanno un indirizzo email che non finisce né con .it né con .com. 
*/
SELECT *
FROM `teachers`
WHERE `teachers`.`email` NOT LIKE '%.it' 
	AND `teachers`.`email` NOT LIKE '%.com';

/* 3. CORSI CON CFU "PESANTI" (MA NON TROPPO)
Selezionare tutti i corsi che hanno un numero di CFU compreso tra 6 e 12 (inclusi), escludendo però i corsi del primo anno. 
*/
SELECT *
FROM `courses`
WHERE `courses`.`cfu` <= 12 
	AND `courses`.`cfu` >= 6
    AND `courses`.`year` NOT LIKE 1;

/* 4. ESAMI IN UN GIORNO SPECIFICO DELLA SETTIMANA
Trovare tutti gli appelli d'esame che si sono tenuti di lunedì, indipendentemente dall'anno o dal mese. 
*/
SELECT *
FROM `exams`
WHERE WEEKDAY(`exams`.`date`) = 0;

/* 5. IL DIPARTIMENTO MISTERIOSO (ADATTATO ALLA STRUTTURA DELLA TABELLA)
Selezionare tutti i capi di dipartimento (head_of_department) il cui intero testo inserito nella colonna termina con la lettera "A". */
SELECT *
FROM `departments`
WHERE `departments`.`head_of_department` LIKE '%a';

/* 6. CONTROLLO DI SICUREZZA SULLE STRINGHE
Trovare tutti gli studenti il cui cognome è composto da esattamente 5 caratteri. */
SELECT *
FROM `students`
WHERE students.surname LIKE '_____';

SELECT *
FROM `students`
WHERE CHAR_LENGTH(students.surname) = 5;

/* 7. STATISTICHE CFU PER ANNO
Selezionare l'anno del corso (year), il valore massimo di CFU e il valore minimo di CFU per quell'anno. 
Rinomina le colonne dei risultati come "anno_corso", "cfu_massimi" e "cfu_minimi". 
*/
SELECT courses.year AS 'anno_corso',
	MAX(courses.cfu) AS 'cfu_massimi', 
	MIN(courses.cfu) AS 'cfu_minimi'
FROM `courses`
GROUP BY courses.year;