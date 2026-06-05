/*Terza consegna*/
/* ### Group by*/

/*
1. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
*/
select office_address, count(*) as 'numero_insegnanti'
from teachers t
group by office_address;
