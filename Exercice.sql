-- *************************
-- EXERCICES
-- *************************
+-------------+-------------+----------+------+---------------+-----
| id_employes | prenom      | nom      | sexe | service       | date_embauche | salaire |
+-------------+-------------+----------+------+---------------+-----
|         350 | Jean-pierre | Laborde  | m    | direction     | 1999-12-09    |    5000 |
|         388 | Clement     | Gallet   | m    | commercial    | 2000-01-15    |    2300 |
|         415 | Thomas      | Winter   | m    | commercial    | 2000-05-03    |    3550 |
|         417 | Chloe       | Dubar    | f    | production    | 2001-09-05    |    1900 |
|         491 | Elodie      | Fellier  | f    | secretariat   | 2002-02-22    |    1600 |
|         509 | Fabrice     | Grand    | m    | comptabilite  | 2003-02-20    |    1900 |
|         547 | Melanie     | Collier  | f    | commercial    | 2004-09-08    |    3100 |
|         592 | Laura       | Blanchet | f    | direction     | 2005-06-09    |    4500 |
|         627 | Guillaume   | Miller   | m    | commercial    | 2006-07-02    |    1900 |
|         655 | Celine      | Perrin   | f    | commercial    | 2006-09-10    |    2700 |
|         699 | Julien      | Cottet   | m    | autre         | 2007-01-18    |    1870 |
|         701 | Mathieu     | Vignal   | m    | informatique  | 2008-12-03    |    2000 |
|         739 | Thierry     | Desprez  | m    | secretariat   | 2009-11-17    |    1500 |
|         780 | Amandine    | Thoyer   | f    | communication | 2010-01-23    |    1500 |
|         802 | Damien      | Durand   | m    | informatique  | 2010-07-05    |    2250 |
|         854 | Daniel      | Chevel   | m    | informatique  | 2011-09-28    |    1700 |
|         876 | Nathalie    | Martin   | f    | juridique     | 2012-01-12    |    3200 |
|         900 | Benoit      | Lagarde  | m    | production    | 2013-01-03    |    2550 |
|         933 | Emilie      | Sennard  | f    | commercial    | 2014-09-11    |    1800 |
|         990 | Stephanie   | Lafaye   | f    | assistant     | 2015-06-02    |    1775 |
|        2000 | test2       | test2    | m    | marketing     | 2019-12-11    |    2600 |
+-------------+-------------+----------+------+---------------+-----


-- 1. afficher le service de l'employé 547
SELECT service FROM employes WHERE id_employes=547;
+------------+
| service    |
+------------+
| commercial |
+------------+
-- 2. afficher la date d'embauche d'amandine
SELECT date_embauche FROM employes WHERE prenom='amandine';
+---------------+
| date_embauche |
+---------------+
| 2010-01-23    |
+---------------+
-- 3. afficher le nombre de commerciaux
SELECT COUNT(service) FROM employes WHERE service='commercial';
+----------------+
| COUNT(service) |
+----------------+
|              6 |
+----------------+
-- 4. afficher le cout des commerciaux sur 1 ans
SELECT SUM(salaire *12) FROM employes WHERE service='commercial';
+------------------+
| SUM(salaire *12) |
+------------------+
|           184200 |
+------------------+
-- 5. afficher le salaires moyen par services
SELECT service,AVG(salaire) FROM employes GROUP BY service;
+---------------+--------------------+
| service       | AVG(salaire)       |
+---------------+--------------------+
| assistant     |               1775 |
| autre         |               1870 |
| commercial    | 2558.3333333333335 |
| communication |               1500 |
| comptabilite  |               1900 |
| direction     |               4750 |
| informatique  | 1983.3333333333333 |
| juridique     |               3200 |
| marketing     |               2600 |
| production    |               2225 |
| secretariat   |               1550 |
+---------------+--------------------+
-- 6. afficher le nombre de recrutement sur 2010 (vous donnez une syntaxe parmi 3 possible)
SELECT COUNT(date_embauche) FROM employes WHERE date_embauche BETWEEN '2010-01-01' AND '2010-12-31';
+----------------------+
| COUNT(date_embauche) |
+----------------------+
|                    2 |
+----------------------+
SELECT COUNT(date_embauche) FROM employes WHERE date_embauche LIKE '2010%';
+----------------------+
| COUNT(date_embauche) |
+----------------------+
|                    2 |
+----------------------+
SELECT COUNT(date_embauche) FROM employes WHERE year(date_embauche) ='2010';
+----------------------+
| COUNT(date_embauche) |
+----------------------+
|                    2 |
+----------------------+
SELECT COUNT(date_embauche) FROM employes WHERE date_embauche >='2010-01-01' AND date_embauche <= '2010-12-31';
+----------------------+
| COUNT(date_embauche) |
+----------------------+
|                    2 |
+----------------------+
-- 7. Augmenter le salaire de chaque employé de +100
UPDATE employes SET salaire = salaire+100;
+-------------+-------------+----------+------+---------------+---------------+---------+
| id_employes | prenom      | nom      | sexe | service       | date_embauche | salaire |
+-------------+-------------+----------+------+---------------+-----
|         350 | Jean-pierre | Laborde  | m    | direction     | 1999-12-09    |    5100 |
|         388 | Clement     | Gallet   | m    | commercial    | 2000-01-15    |    2400 |
|         415 | Thomas      | Winter   | m    | commercial    | 2000-05-03    |    3650 |
|         417 | Chloe       | Dubar    | f    | production    | 2001-09-05    |    2000 |
|         491 | Elodie      | Fellier  | f    | secretariat   | 2002-02-22    |    1700 |
|         509 | Fabrice     | Grand    | m    | comptabilite  | 2003-02-20    |    2000 |
|         547 | Melanie     | Collier  | f    | commercial    | 2004-09-08    |    3200 |
|         592 | Laura       | Blanchet | f    | direction     | 2005-06-09    |    4600 |
|         627 | Guillaume   | Miller   | m    | commercial    | 2006-07-02    |    2000 |
|         655 | Celine      | Perrin   | f    | commercial    | 2006-09-10    |    2800 |
|         699 | Julien      | Cottet   | m    | secretariat   | 2007-01-18    |    1490 |
|         701 | Mathieu     | Vignal   | m    | informatique  | 2008-12-03    |    2100 |
|         739 | Thierry     | Desprez  | m    | secretariat   | 2009-11-17    |    1600 |
|         780 | Amandine    | Thoyer   | f    | communication | 2010-01-23    |    1600 |
|         802 | Damien      | Durand   | m    | informatique  | 2010-07-05    |    2350 |
|         854 | Daniel      | Chevel   | m    | informatique  | 2011-09-28    |    1800 |
|         876 | Nathalie    | Martin   | f    | juridique     | 2012-01-12    |    3300 |
|         900 | Benoit      | Lagarde  | m    | production    | 2013-01-03    |    2650 |
|         933 | Emilie      | Sennard  | f    | commercial    | 2014-09-11    |    1900 |
|         990 | Stephanie   | Lafaye   | f    | assistant     | 2015-06-02    |    1875 |
+-------------+-------------+----------+------+---------------+-----
-- 8. afficher le nombre de services différents
SELECT COUNT(DISTINCT service) FROM employes;
+-------------------------+
| COUNT(DISTINCT service) |
+-------------------------+
|                       9 |
+-------------------------+

-- 9. afficher le nombre d'employe par service
SELECT COUNT(nom),service FROM employes GROUP BY service;
+------------+---------------+
| COUNT(nom) | service       |
+------------+---------------+
|          1 | assistant     |
|          1 | autre         |
|          6 | commercial    |
|          1 | communication |
|          1 | comptabilite  |
|          2 | direction     |
|          3 | informatique  |
|          1 | juridique     |
|          1 | marketing     |
|          2 | production    |
|          2 | secretariat   |
+------------+---------------+
-- 10. afficher les infos du commercial ayant le salaire le plus eleve
SELECT * FROM employes WHERE service='commercial' ORDER BY salaire DESC LIMIT 1;
+-------------+--------+--------+------+------------+---------------
| id_employes | prenom | nom    | sexe | service    | date_embauche | salaire |
+-------------+--------+--------+------+------------+---------------
|         415 | Thomas | Winter | m    | commercial | 2000-05-03    |    3650 |
+-------------+--------+--------+------+------------+---------------
-- 11.afficher les info de l'employé embauché en dernier.
SELECT * FROM employes WHERE date_embauche ORDER BY date_embauche DESC LIMIT 1;
+-------------+-----------+--------+------+-----------+---------------+---------+
| id_employes | prenom    | nom    | sexe | service   | date_embauche | salaire |
+-------------+-----------+--------+------+-----------+---------------+---------+
|         990 | Stephanie | Lafaye | f    | assistant | 2015-06-02    |    1875 |
+-------------+-----------+--------+------+-----------+-------------

-- ******************************************
-- Exercice  
-- ******************************************

-- 1. afficher l'id_abonne de laura 
SELECT id_abonne FROM abonne WHERE prenom='laura';
+-----------+
| id_abonne |
+-----------+
|         4 |
+-----------+
-- 2. abonne d'id_abonne 2 est venu emprunter un livre a quelles dates (date_sortie)?
SELECT date_sortie FROM emprunt WHERE id_abonne=2;
+-------------+
| date_sortie |
+-------------+
| 2011-12-18  |
| 2012-03-20  |
| 2013-06-15  |
+-------------+
-- 3. combien d'emprunt on ete effectue en tout ?
SELECT COUNT(id_emprunt) FROM emprunt;
+-------------------+
| COUNT(id_emprunt) |
+-------------------+
|                 8 |
+-------------------+
-- 4. combien de livre sont sortie le 2011-12-19 ?
SELECT COUNT(id_livre) FROM emprunt WHERE date_sortie='2011-12-19';
+-------------------+
| COUNT(id_livre)   |
+-------------------+
|                 3 |
+-------------------+
-- 5. une vie est de quel auteur ?
SELECT auteur FROM livre WHERE titre='Une vie';
+-------------------+
| auteur            |
+-------------------+
| GUY DE MAUPASSANT |
+-------------------+
-- 6. quel id livre est le plus emprunter ?
SELECT id_livre,COUNT(id_emprunt) FROM emprunt GROUP BY id_livre -- tester a ce stade
ORDER BY COUNT(id_emprunt) DESC LIMIT 0,1;
+----------+-------------------+
| id_livre | COUNT(id_emprunt) |
+----------+-------------------+
|      100 |                 3 |
+----------+-------------------+

-- 7. quel id_abonne emprunte le plus de livre ?
SELECT id_abonne,COUNT(id_emprunt) AS nombre FROM emprunt GROUP BY id_abonne -- tester a ce stade
ORDER BY nombre DESC LIMIT 1;
+-----------+-------------------+
| id_abonne | COUNT(id_emprunt) |
+-----------+-------------------+
|         2 |                 3 |
+-----------+-------------------+

-- *****************************
-- Exercices de Jointure:
-- *****************************


CREATE DATABASE taxis;
USE taxis;

-- puis on importe le contenu source taxis_sans_les_contraintes.sql

-- 1. qui conduit(prenom) la voiture d'id 503 en requete de jointure;
SELECT conducteur.prenom, association_vehicule_conducteur.id_vehicule FROM conducteur INNER JOIN association_vehicule_conducteur ON conducteur.id_conducteur = association_vehicule_conducteur.id_conducteur WHERE association_vehicule_conducteur.id_vehicule = 503;
+----------+-------------+
| prenom   | id_vehicule |
+----------+-------------+
| Philippe |         503 |
+----------+-------------+
-- 2. qui conduit quel modele (prenom, modele)
SELECT conducteur.prenom, vehicule.modele FROM conducteur INNER JOIN association_vehicule_conducteur ON conducteur.id_conducteur = association_vehicule_conducteur.id_conducteur INNER JOIN vehicule ON association_vehicule_conducteur.id_vehicule = vehicule.id_vehicule;
+----------+--------+
| prenom   | modele |
+----------+--------+
| Julien   | 807    |
| Morgane  | C8     |
| Philippe | Cls    |
| Philippe | 807    |
| Amelie   | Touran |
+----------+--------+

-- 3. ajouter vous dans la liste des conducteur.
INSERT INTO conducteur (prenom, nom) VALUES ('Stitch','Peluche');
-- 4. afficher TOUS les conducteur (prenom) meme ceux qui n'ont pas de véhicule ainsi que les modèles
SELECT c.prenom, v.modele FROM conducteur c LEFT JOIN association_vehicule_conducteur a ON c.id_conducteur = a.id_conducteur LEFT JOIN vehicule v ON a.id_vehicule = v.id_vehicule;
+----------+--------+
| prenom   | modele |
+----------+--------+
| Julien   | 807    |
| Morgane  | C8     |
| Philippe | Cls    |
| Amelie   | Touran |
| Philippe | 807    |
| Alex     | NULL   |
| Stitch   | NULL   |
+----------+--------+

-- 5. ajouter un vehicule 
INSERT INTO vehicule VALUES(NULL,'Seat','Alambra','bleu','AT-258-VB');

-- 6. puis afficher tous les modele y compris ceux qui n'ont pas de chauffeur et le prenom des conducteur

SELECT v.modele, c.prenom FROM conducteur c RIGHT JOIN association_vehicule_conducteur a ON c.id_conducteur = a.id_conducteur RIGHT JOIN vehicule v ON a.id_vehicule = v.id_vehicule;

+---------+----------+
| modele  | prenom   |
+---------+----------+
| 807     | Julien   |
| 807     | Philippe |
| C8      | Morgane  |
| Cls     | Philippe |
| Touran  | Amelie   |
| Octavia | NULL     |
| Passat  | NULL     |
| Alambra | NULL     |
+---------+----------+

-- 7. afficher TOUS les prenoms y compris ceux qui n'ont pas de vehicules et tous les modeles y compris ceux qui n'ont pas de chauffeur
(SELECT c.prenom, v.modele FROM conducteur c LEFT JOIN association_vehicule_conducteur a ON c.id_conducteur = a.id_conducteur LEFT JOIN vehicule v ON a.id_vehicule = v.id_vehicule) UNION (SELECT c.prenom, v.modele FROM conducteur c RIGHT JOIN association_vehicule_conducteur a ON c.id_conducteur = a.id_conducteur RIGHT JOIN vehicule v ON a.id_vehicule = v.id_vehicule);
+----------+---------+
| prenom   | modele  |
+----------+---------+
| Julien   | 807     |
| Morgane  | C8      |
| Philippe | Cls     |
| Amelie   | Touran  |
| Philippe | 807     |
| Alex     | NULL    |
| Stitch   | NULL    |
| NULL     | Octavia |
| NULL     | Passat  |
+----------+---------+
