# S3APP2: Base de donnees

# À remettre:

POUR LE RAPPORT

- Modèle conceptuel de donnees
- Modèle relationnel de donnees
- Procédure pour le tableau de réservation (Gestion de cubicules, Chevauchement des réservations)
- Modèle en étoile de l’entrepôt de données

*Chaque section doit être accompagnée d'une courte réflexion, plus spécifiquement
la section "Modèle relationnel de données" dit expliquer brièvement les méthodes
d'indexation utilisées. La section "Modèle en étoile de l'entrepôt de données" doit
expliquer la notion d'entrepôt de données et comment elle s'intègrerait dans le
système de réservation.*

POUR LES FICHIERS

La remise aura la forme d'un PDF avec le contenu et dans l'ordre indiqué.

# Règles de réservation

Application dédiée aux membres de la Faculté qui sont sous la responsabilité d'un
département.

Les dépatements sont :
- Génie électrique et Génie informatique
- Génie mécanique
- Génie chimique et biotechnologie
- Génie civil et du bâtiment

Les membres de la Faculté peuvent vérifier la disponibilité et faire la réservation
des salles libres.

Un membre peut faire à l'avance un réservation pour une catégorie de local.

*Le statut du membre, la catégorie de local et le département d'appartenance du
membre déterminera combien de temps à l'avance un membre peut réserver un local.*

Certains locaux ne sont disponibles que pour certains status des membres. Ces
status sont:
- Étudiants
- Enseignants
- Personnel de soutien
- Administrateurs

*Un membre de la Faculté peut avoir plusieurs statuts*

Certains privilège seront accordés aux statuts tels que:
- Peut réserver plus de 24 heures
- Peut seulement voir les réservations mais pas en créer
- Peut effacer les réservations d’un autre usager

On doit connaitre les ressources d'un local. L'application doit permettre
de gérer les locaux avec leurs caractéristiques respectives:
- Capacité
- Tableaux
- Ordinateurs
- Salle multimédia

Et leur quantité respective dans chaque local. La BDD doit s'assurer qu'on
ne peut insérer des réservations qui seront en conflit entre elles.

Les locaux sont dans des pavillons qui eux appartiennent à des campus. Ainsi il
y a le Campus de Longueuil, le Campus de l’Ouest et le Campus de l’Est.

Les pavillons sont identifiés par un nom tel que par exemple, le pavillon J-Armand Bombar-
dier et le pavillon Marie-Victorin. Pour éviter le dédoublement d’identificateur, vous utiliserez
le système de classement du service des immeubles qui utilise une lettre et un chiffre pour un
pavillon (ex : D7 pour Marie-Victorin) et un numéro avec possibilité de tiret entre les chiffres
pour un local spécifique. Par exemple le C1-3125 est un laboratoire du pavillon J.-Armand
Bombardier. Certains locaux peuvent être divisé en sous-local (cubicule). Par exemple le
local C1-3035 peut être divisé en 6 cubicules. Donc il est possible qu’un local ait un local
parent.
