-- Insertion des fonctions
-- DÉBUT
INSERT INTO Fonction(Fonc_nom, Fonc_id) VALUES ('Salle de classe générale', '0110');
INSERT INTO Fonction(Fonc_nom, Fonc_id) VALUES ('Salle de classe spécialisée', '0111');
INSERT INTO Fonction(Fonc_nom, Fonc_id) VALUES ('Salle de séminaire', '0120');
INSERT INTO Fonction(Fonc_nom, Fonc_id) VALUES ('Cubicules', '0121');
INSERT INTO Fonction(Fonc_nom, Fonc_id) VALUES ('Laboratoire informatique', '0210');
INSERT INTO Fonction(Fonc_nom, Fonc_id) VALUES ('Laboratoire d’enseignement spécialisé', '0211');
INSERT INTO Fonction(Fonc_nom, Fonc_id) VALUES ('Atelier', '0212');
INSERT INTO Fonction(Fonc_nom, Fonc_id) VALUES ('Salle à dessin', '0213');
INSERT INTO Fonction(Fonc_nom, Fonc_id) VALUES ('Atelier (civil)', '0214');
INSERT INTO Fonction(Fonc_nom, Fonc_id) VALUES ('Salle de musique', '0215');
INSERT INTO Fonction(Fonc_nom, Fonc_id) VALUES ('Atelier sur 2 étages, conjoint avec autre local', '0216');
INSERT INTO Fonction(Fonc_nom, Fonc_id) VALUES ('Salle de conférence', '0217');
INSERT INTO Fonction(Fonc_nom, Fonc_id) VALUES ('Salle de réunion', '0372');
INSERT INTO Fonction(Fonc_nom, Fonc_id) VALUES ('Salle d’entrevue et de tests', '0373');
INSERT INTO Fonction(Fonc_nom, Fonc_id) VALUES ('Salle de lecture ou de consultation', '0510');
INSERT INTO Fonction(Fonc_nom, Fonc_id) VALUES ('Auditorium', '0620');
INSERT INTO Fonction(Fonc_nom, Fonc_id) VALUES ('Salle de concert', '0625');
INSERT INTO Fonction(Fonc_nom, Fonc_id) VALUES ('Salle d’audience', '0640');
INSERT INTO Fonction(Fonc_nom, Fonc_id) VALUES ('Salon du personnel', '0930');
INSERT INTO Fonction(Fonc_nom, Fonc_id) VALUES ('Studio d’enregistrement', '1030');
INSERT INTO Fonction(Fonc_nom, Fonc_id) VALUES ('Hall d’entrée', '1260');
-- FIN

-- Insersion des Caracteristiques
-- DÉBUT
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Connexion à Internet', 0);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Tables fixes en U et chaises mobiles', 1);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Monoplaces', 2);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Tables fixes et chaises fixes', 3);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Tables pour 2 ou + et chaises mobiles', 6);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Tables mobiles et chaises mobiles', 7);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Tables hautes et chaises hautes', 8);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Tables fixes et chaises mobiles', 9);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Écran', 11);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Rétroprojecteur', 14);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Gradins', 15);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Fenêtres', 16);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('1 piano', 17);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('2 pianos', 18);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Autres instruments', 19);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Système de son', 20);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Salle réservée (spéciale)', 21);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Ordinateurs PC', 22);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Ordinateurs SUN pour génie électrique', 23);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Ordinateurs (oscillomètre et multimètre)', 25);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Ordinateurs modélisation des structures', 26);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Ordinateurs PC', 27);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Équipement pour microélectronique', 28);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Équipement pour génie électrique', 29);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Ordinateurs et équipement pour mécatroni', 30);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Équipement métrologie', 31);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Équipement de machinerie', 32);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Équipement de géologie', 33);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Équipement pour la caractérisation', 34);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Équipement pour la thermodynamique', 35);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Équipement pour génie civil', 36);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Télévision', 37);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('VHS', 38);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Hauts parleurs', 39);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Micro', 40);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Magnétophone à cassette', 41);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Amplificateur audio', 42);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Local barré', 43);
INSERT INTO Caracteristiques(Car_nom, Car_id) VALUES ('Prise réseau', 44);
-- FIN

-- Insertion des universités
-- DÉBUT
INSERT INTO Université (Uni_nom, Uni_id) VALUES ('Université de Shebrooke', 1);
-- FIN

-- Insertion des facultés
-- DÉBUT
INSERT INTO Faculté (Fac_nom, Fac_id, Uni_id) VALUES ('Faculté de Génie', 1, 1);
-- FIN

-- Insertion des départements
-- DÉBUT
INSERT INTO Département (Dep_nom, Dep_id, Fac_id) VALUES ('Génie électrique et Génie informatique', 1, 1);
INSERT INTO Département (Dep_nom, Dep_id, Fac_id) VALUES ('Génie mécanique', 2, 1);
INSERT INTO Département (Dep_nom, Dep_id, Fac_id) VALUES ('Génie chimique et biotechnologique', 3, 1);
INSERT INTO Département (Dep_nom, Dep_id, Fac_id) VALUES ('Génie civil et du bâtiment', 4, 1);
-- FIN

-- Insertion des programmes
-- DÉBUT
INSERT INTO Programme (prog_nom, prog_id, dep_id) VALUES ('Génie électrique', 1, 1);
INSERT INTO Programme (prog_nom, prog_id, dep_id) VALUES ('Génie informatique', 2, 1);
INSERT INTO Programme (prog_nom, prog_id, dep_id) VALUES ('Génie mécanique', 3, 2);
INSERT INTO Programme (prog_nom, prog_id, dep_id) VALUES ('Génie chimique', 4, 3);
INSERT INTO Programme (prog_nom, prog_id, dep_id) VALUES ('Génie biotechnologique', 5, 3);
INSERT INTO Programme (prog_nom, prog_id, dep_id) VALUES ('Génie civil', 6, 4);
INSERT INTO Programme (prog_nom, prog_id, dep_id) VALUES ('Génie du bâtiment', 7, 4);
-- FIN

-- Insertion des campus
-- DÉBUT
INSERT INTO Campus(Camp_nom, Camp_id, Uni_id) VALUES ('Campus principal', 1, 1);
INSERT INTO Campus(Camp_nom, Camp_id, Uni_id) VALUES ('Campus de Longueuil', 2, 1);
INSERT INTO Campus(Camp_nom, Camp_id, Uni_id) VALUES ('Campus de la santé', 3, 1);
-- FIN

-- Insertion des pavillons
-- DÉBUT
INSERT INTO Pavillon(Pav_nom, Pav_id, Camp_id) VALUES ('Pavillon J.-Armand-Bombardier', 'C1', 1);
INSERT INTO Pavillon(Pav_nom, Pav_id, Camp_id) VALUES ('Pavillon Marie-Victorin', 'D7', 1);
-- FIN

-- Insertion des activités pédagogiques
-- DÉBUT
INSERT INTO activité_pédagogique(act_id, act_nom) VALUES ('GIF302', 'Conception d''un système informatique distrib.');
INSERT INTO activité_pédagogique(act_id, act_nom) VALUES ('GIF332', 'Réseaux et protocoles de communication');
INSERT INTO activité_pédagogique(act_id, act_nom) VALUES ('GIF333', 'Théorie groupes et algèbre abstraite en ing.');
INSERT INTO activité_pédagogique(act_id, act_nom) VALUES ('GIF350', 'Modèles de conception');
INSERT INTO activité_pédagogique(act_id, act_nom) VALUES ('GIF371', 'Ondes guidées');
INSERT INTO activité_pédagogique(act_id, act_nom) VALUES ('GIF380', 'Sécurité informatique et cryptographie');
INSERT INTO activité_pédagogique(act_id, act_nom) VALUES ('GIF391', 'Systèmes distribués et informatique en nuage');
INSERT INTO activité_pédagogique(act_id, act_nom) VALUES ('GIF620', 'Bases de données');
-- FIN

-- Insertion des APP
-- DÉBUT
INSERT INTO APP (APP_id, APP_nom, act_id) VALUES ('APP 1', 'Modèles de conception', 'GIF350');
INSERT INTO APP (APP_id, APP_nom, act_id) VALUES ('APP 2', 'Bases de données', 'GIF620');
INSERT INTO APP (APP_id, APP_nom, act_id) VALUES ('APP 3', 'Systèmes répartis', 'GIF391');
INSERT INTO APP (APP_id, APP_nom, act_id) VALUES ('APP 4', 'Réseaux et protocoles de communication', 'GIF332');
INSERT INTO APP (APP_id, APP_nom, act_id) VALUES ('APP 5', 'Propagation d''ondes électromagnétiques', 'GIF371');
INSERT INTO APP (APP_id, APP_nom, act_id) VALUES ('APP 6', 'Sécurité informatique et cryptographie', 'GIF380');
-- FIN

-- Insertion des rôles
-- DÉBUT
INSERT INTO Rôle(Rôle_id, rôle_nom) VALUES (1, 'Étudiant');
INSERT INTO Rôle(Rôle_id, rôle_nom) VALUES (2, 'Enseignants');
INSERT INTO Rôle(Rôle_id, rôle_nom) VALUES (3, 'Personnel de soutien');
INSERT INTO Rôle(Rôle_id, rôle_nom) VALUES (4, 'Administrateur');
-- FIN

-- Insertion des locaux
-- DÉBUT
INSERT INTO Locaux(Loc_nom, capacite, Notes, Pav_id, Fonc_id) VALUES ('C1-1007', 21, 'Grand', 'C1', 0212);
INSERT INTO Locaux(Loc_nom, capacite, Notes, Pav_id, Fonc_id) VALUES ('C1-2018', 10, 'Matériaux composite', 'C1', 0212);
INSERT INTO Locaux(Loc_nom, capacite, Notes, Pav_id, Fonc_id) VALUES ('C1-2055', 24, null, 'C1', 0211);
INSERT INTO Locaux(Loc_nom, capacite, Notes, Pav_id, Fonc_id) VALUES ('C1-3035', 60, null, 'C1', 0210);
INSERT INTO Caracteristiques_Locaux(Car_id, Loc_nom, Pav_id) VALUES (22, 'C1-3035', 'C1');
INSERT INTO Caracteristiques_Locaux(Car_id, Loc_nom, Pav_id) VALUES (31, 'C1-3035', 'C1');
-- FIN

-- Insertion des cubicules
-- DÉBUT
INSERT INTO Locaux(Loc_nom, Parent_Loc_nom, Pav_id, capacite, Fonc_id) VALUES ('C1-3035-1', 'C1-3035', 'C1', 10, 0210);
INSERT INTO Locaux(Loc_nom, Parent_Loc_nom, Pav_id, capacite, Fonc_id) VALUES ('C1-3035-2', 'C1-3035', 'C1', 10, 0210);
INSERT INTO Locaux(Loc_nom, Parent_Loc_nom, Pav_id, capacite, Fonc_id) VALUES ('C1-3035-3', 'C1-3035', 'C1', 10, 0210);
INSERT INTO Locaux(Loc_nom, Parent_Loc_nom, Pav_id, capacite, Fonc_id) VALUES ('C1-3035-4', 'C1-3035', 'C1', 10, 0210);
INSERT INTO Locaux(Loc_nom, Parent_Loc_nom, Pav_id, capacite, Fonc_id) VALUES ('C1-3035-5', 'C1-3035', 'C1', 10, 0210);
INSERT INTO Locaux(Loc_nom, Parent_Loc_nom, Pav_id, capacite, Fonc_id) VALUES ('C1-3035-6', 'C1-3035', 'C1', 10, 0210);
-- FIN

-- Insertion des usagers
-- DÉBUT
INSERT INTO Usager(cip, prenom, nom_famille, courriel, Fac_id, Uni_id, Dep_id, Prog_id, APP_id) VALUES ('ower1302', 'Rohan', 'Owens', 'ower1302@usherbrooke.ca', 1, 1, 1, 1, 'APP 1'); -- Étudiant
INSERT INTO Usager_Role(cip, Rôle_id) VALUES ('ower1302', 1);

INSERT INTO Usager(cip, prenom, nom_famille, courriel, Fac_id, Uni_id, Dep_id, Prog_id, APP_id) VALUES ('hend3944', 'Dewitt', 'Henderson', 'hend3944@usherbrooke.ca', 1, 1, 1, 1, 'APP 1'); -- Enseignant
INSERT INTO Usager_Role(cip, Rôle_id) VALUES ('hend3944', 2);

INSERT INTO Usager(cip, prenom, nom_famille, courriel, Fac_id, Uni_id, Dep_id, Prog_id, APP_id) VALUES ('joyb0207', 'Bryony', 'Joyce', 'joyb0207@usherbrooke.ca', 1, 1, 1, 1, 'APP 1'); -- Enseignante ET personnel de soutien
INSERT INTO Usager_Role(cip, Rôle_id) VALUES ('joyb0207', 2);
INSERT INTO Usager_Role(cip, Rôle_id) VALUES ('joyb0207', 3);

INSERT INTO Usager(cip, prenom, nom_famille, courriel, Fac_id, Uni_id, Dep_id, Prog_id, APP_id) VALUES ('maym4544', 'Mateo', 'May', 'maym4544@usherbrooke.ca', 1, 1, 1, 1, 'APP 1'); -- Administrateur
INSERT INTO Usager_Role(cip, Rôle_id) VALUES ('maym4544', 4);
-- FIN




