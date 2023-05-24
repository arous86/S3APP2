    DROP TABLE IF EXISTS journal_evenements;
    DROP TABLE IF EXISTS Réservation;
    DROP TABLE IF EXISTS Usager_Role;
    DROP TABLE IF EXISTS Usager;
    DROP TABLE IF EXISTS Caracteristiques_Locaux;
    DROP TABLE IF EXISTS Locaux;
    DROP TABLE IF EXISTS Rôle;
    DROP TABLE IF EXISTS APP;
    DROP TABLE IF EXISTS activité_pédagogique;
    DROP TABLE IF EXISTS Caracteristiques;
    DROP TABLE IF EXISTS Fonction;
    DROP TABLE IF EXISTS Pavillon;
    DROP TABLE IF EXISTS Campus;
    DROP TABLE IF EXISTS Programme;
    DROP TABLE IF EXISTS Département;
    DROP TABLE IF EXISTS Faculté;
    DROP TABLE IF EXISTS Université;


    CREATE TABLE Université
    (
        Uni_nom varchar(32) NOT NULL,
        Uni_id int NOT NULL,
        PRIMARY KEY (Uni_id)
    );

    CREATE TABLE Faculté
    (
        Fac_nom varchar(32) NOT NULL,
        Fac_id int NOT NULL,
        Uni_id int NOT NULL,
        PRIMARY KEY (Fac_id),
        FOREIGN KEY (Uni_id) REFERENCES Université(Uni_id)
    );

    CREATE TABLE Département
    (
        Dep_nom varchar(64) NOT NULL,
        Dep_id int NOT NULL,
        Fac_id int NOT NULL,
        PRIMARY KEY (Dep_id),
        FOREIGN KEY (Fac_id) REFERENCES Faculté(Fac_id)
    );

    CREATE TABLE Programme
    (
        Prog_nom varchar(32) NOT NULL,
        Prog_id int NOT NULL,
        Dep_id int NOT NULL,
        PRIMARY KEY (Prog_id),
        FOREIGN KEY (Dep_id) REFERENCES Département(Dep_id)
    );

    CREATE TABLE Campus
    (
        Camp_nom varchar(32) NOT NULL,
        Camp_id int NOT NULL,
        Uni_id int NOT NULL,
        PRIMARY KEY (Camp_id),
        FOREIGN KEY (Uni_id) REFERENCES Université(Uni_id)
    );

    CREATE TABLE Pavillon
    (
        Pav_nom varchar(32) NOT NULL,
        Pav_id varchar(4) NOT NULL,
        Camp_id int NOT NULL,
        PRIMARY KEY (Pav_id),
        FOREIGN KEY (Camp_id) REFERENCES Campus(Camp_id)
    );

    CREATE TABLE Fonction
    (
        Fonc_nom varchar(64) NOT NULL,
        Fonc_id int NOT NULL, -- modif
        PRIMARY KEY (Fonc_id)
    );

    CREATE TABLE Caracteristiques
    (
        Car_nom varchar(64) NOT NULL,
        Car_id int NOT NULL,
        PRIMARY KEY (Car_id)
    );

    CREATE TABLE activité_pédagogique
    (
        act_id varchar(16) NOT NULL,
        act_nom varchar(64) NOT NULL,
        PRIMARY KEY (act_id)
    );

    CREATE TABLE APP
    (
        APP_id varchar(16) NOT NULL,
        APP_nom varchar(64) NOT NULL,
        act_id varchar(16) NOT NULL,
        PRIMARY KEY (APP_id),
        FOREIGN KEY (act_id) REFERENCES activité_pédagogique(act_id)
    );

    CREATE TABLE Rôle
    (
        Rôle_id int NOT NULL,
        rôle_nom varchar(32) NOT NULL,
        PRIMARY KEY (Rôle_id)
    );

    CREATE TABLE Locaux
    (
        Loc_nom varchar(16) NOT NULL,
        Parent_Loc_nom varchar(16),  -- Local parent
        capacite int NOT NULL,
        Notes varchar(64),
        Pav_id varchar(4) NOT NULL,
        Fonc_id int,
        PRIMARY KEY (Loc_nom, Pav_id),
        FOREIGN KEY (Pav_id) REFERENCES Pavillon(Pav_id),
        FOREIGN KEY (Fonc_id) REFERENCES Fonction(Fonc_id),
        FOREIGN KEY (Parent_Loc_nom, Pav_id) REFERENCES Locaux(Loc_nom, Pav_id)
    );

    CREATE TABLE Caracteristiques_Locaux
    (
        Car_id int NOT NULL,
        Loc_nom varchar(16) NOT NULL,
        Pav_id varchar(4) NOT NULL,
        PRIMARY KEY (Car_id, Loc_nom, Pav_id),
        FOREIGN KEY (Car_id) REFERENCES Caracteristiques(Car_id),
        FOREIGN KEY (Loc_nom, Pav_id) REFERENCES Locaux(Loc_nom, Pav_id)
    );

    CREATE TABLE Usager
    (
        cip varchar(16) NOT NULL,
        prenom varchar(32) NOT NULL,
        nom_famille varchar(32) NOT NULL,
        courriel varchar(64) NOT NULL,
        Fac_id int NOT NULL,
        Uni_id int NOT NULL,
        Dep_id int NOT NULL,
        Prog_id int NOT NULL,
        APP_id varchar(16) NOT NULL,
        PRIMARY KEY (cip),
        FOREIGN KEY (Fac_id) REFERENCES Faculté(Fac_id),
        FOREIGN KEY (Uni_id) REFERENCES Université(Uni_id),
        FOREIGN KEY (Dep_id) REFERENCES Département(Dep_id),
        FOREIGN KEY (Prog_id) REFERENCES Programme(Prog_id),
        FOREIGN KEY (APP_id) REFERENCES APP(APP_id)
    );

    CREATE TABLE Usager_Role
    (
        cip varchar(16) NOT NULL,
        Rôle_id int NOT NULL,
        PRIMARY KEY (cip, Rôle_id),
        FOREIGN KEY (cip) REFERENCES Usager(cip),
        FOREIGN KEY (Rôle_id) REFERENCES Rôle(Rôle_id)
    );

    CREATE TABLE Réservation
    (
        start_date TIMESTAMP NOT NULL,
        end_date TIMESTAMP NOT NULL,
        type INT NOT NULL,
        Res_id INT NOT NULL,
        cip varchar(16) NOT NULL,
        Loc_nom varchar(16) NOT NULL,
        Pav_id varchar(4) NOT NULL,
        PRIMARY KEY (Res_id, cip, Loc_nom, Pav_id),
        FOREIGN KEY (cip) REFERENCES Usager(cip),
        FOREIGN KEY (Loc_nom, Pav_id) REFERENCES Locaux(Loc_nom, Pav_id)
    );

    CREATE TABLE journal_evenements (
        id SERIAL PRIMARY KEY,
        type_evenement VARCHAR(255),
        details VARCHAR(255),
        date_evenement TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

    CREATE OR REPLACE FUNCTION reservation_trigger_function()  -- Mettre à jour le journal des événements
        RETURNS TRIGGER AS $$
    BEGIN
        IF TG_OP = 'INSERT' THEN
            INSERT INTO journal_evenements (type_evenement, details)
            VALUES ('Ajout de réservation', 'ID de réservation : ' || NEW.Res_id);
        ELSIF TG_OP = 'DELETE' THEN
            INSERT INTO journal_evenements (type_evenement, details)
            VALUES ('Suppression de réservation', 'ID de réservation : ' || OLD.Res_id);
        END IF;

        RETURN NULL;
    END;
    $$ LANGUAGE plpgsql;

    -- Appel de la fonction de mise à jour du journal des événements
    -- après chaque insertion ou suppression de réservation
    CREATE TRIGGER reservation_trigger
        AFTER INSERT OR DELETE ON Réservation
        FOR EACH ROW
    EXECUTE FUNCTION reservation_trigger_function();



    CREATE OR REPLACE FUNCTION check_reservation_schedule()
        RETURNS TRIGGER AS $$
    BEGIN
        IF EXISTS (
            SELECT *
            FROM Réservation R -- Réservation existante
            WHERE NEW.Loc_nom = R.Loc_nom AND NEW.Pav_id = R.Pav_id
              AND (
                    (NEW.start_date BETWEEN R.start_date AND R.end_date)      -- Début dans une réservation existante
                    OR (NEW.end_date BETWEEN R.start_date AND R.end_date)     -- Fin dans une réservation existante
                    OR (R.start_date BETWEEN NEW.start_date AND NEW.end_date) -- Réserveration existante dans la nouvelle
                )
              AND R.Res_id != NEW.Res_id
        ) THEN
            RAISE EXCEPTION 'Chevauchement de réservation';
        END IF;

        IF NEW.start_date >= NEW.end_date THEN
            RAISE EXCEPTION 'Date de début après date de fin';
        END IF;

        IF NEW.start_date < NOW() THEN
            RAISE EXCEPTION 'Date de début avant la date actuelle';
        END IF;

        -- Local dont le Parent_Loc_nom est déja réservé
        IF EXISTS (
            SELECT *
            FROM Locaux L
            WHERE L.Loc_nom = NEW.Loc_nom AND L.Pav_id = NEW.Pav_id
              AND EXISTS (
                SELECT *
                FROM Réservation R
                WHERE R.Loc_nom = L.Parent_Loc_nom AND R.Pav_id = L.Pav_id
                  AND (
                        (NEW.start_date BETWEEN R.start_date AND R.end_date)      -- Début dans une réservation existante
                        OR (NEW.end_date BETWEEN R.start_date AND R.end_date)     -- Fin dans une réservation existante
                        OR (R.start_date BETWEEN NEW.start_date AND NEW.end_date) -- Réserveration existante dans la nouvelle
                    )
                  AND R.Res_id != NEW.Res_id
            )
        ) THEN
            RAISE EXCEPTION 'Local parent déjà réservé';
        END IF;

        -- Local enfant déja réservé
        IF EXISTS (
            SELECT *
            FROM Locaux L
            WHERE L.Parent_Loc_nom = NEW.Loc_nom AND L.Pav_id = NEW.Pav_id
              AND EXISTS (
                SELECT *
                FROM Réservation R
                WHERE R.Loc_nom = L.Loc_nom AND R.Pav_id = L.Pav_id
                  AND (
                        (NEW.start_date BETWEEN R.start_date AND R.end_date)      -- Début dans une réservation existante
                        OR (NEW.end_date BETWEEN R.start_date AND R.end_date)     -- Fin dans une réservation existante
                        OR (R.start_date BETWEEN NEW.start_date AND NEW.end_date) -- Réserveration existante dans la nouvelle
                    )
                  AND R.Res_id != NEW.Res_id
            )
        ) THEN
            RAISE EXCEPTION 'Local enfant déjà réservé';
        END IF;

        RETURN NEW;
    END;
    $$ LANGUAGE plpgsql;


    -- Appel de la fonction de vérification de la réservation
    -- avant chaque insertion ou mise à jour de réservation
    CREATE TRIGGER check_reservation_schedule
        BEFORE INSERT OR UPDATE ON Réservation
        FOR EACH ROW EXECUTE PROCEDURE check_reservation_schedule();


    -- Fonction permettant de modifier la date de début et de fin d'une réservation
    -- La date de début doit etre inférieure à la date de fin
    -- l'usager doit être un administrateur
    DROP FUNCTION IF EXISTS update_reservation_date;
    CREATE OR REPLACE FUNCTION update_reservation_date(_Res_id INT, _cip varchar(16), _start_date TIMESTAMP, _end_date TIMESTAMP)
        RETURNS BOOLEAN
    AS $$
    BEGIN
        IF EXISTS (
            SELECT *
            FROM Usager_Role UR
            WHERE UR.cip = _cip AND UR.Rôle_id = 4
        ) THEN
            UPDATE Réservation
            SET start_date = _start_date, end_date = _end_date
            WHERE Res_id = _Res_id;
            RETURN TRUE;
        ELSE
            RAISE EXCEPTION 'Usager n''est pas un administrateur';
        END IF;
    END;
    $$ LANGUAGE plpgsql;

    -- Fonction permettant de supprimer une réservation
    -- L'usager doit être un administrateur
    DROP FUNCTION IF EXISTS delete_reservation;
    CREATE OR REPLACE FUNCTION delete_reservation(_Res_id INT, _cip varchar(16))
        RETURNS BOOLEAN
    AS $$
    BEGIN
        IF EXISTS (
            SELECT *
            FROM Usager_Role UR
            WHERE UR.cip = _cip AND UR.Rôle_id = 4
        ) THEN
            DELETE FROM Réservation
            WHERE Res_id = _Res_id;
            RETURN TRUE;
        ELSE
            RAISE EXCEPTION 'Usager n''est pas un administrateur';
        END IF;
    END;
    $$ LANGUAGE plpgsql;

    -- Fonction permettant de créer une réservation
    -- Si l'usager est un administrateur, il peut créer une réservation pour n'importe quel date après la date courante
    -- Si l'usager est un enseignant ou un personnel de soutien, il peut créer une réservation pour 24h après la date courante
    -- Si l'usager est un étudiant, il ne peut pas créer de réservation
    -- Retourne la valeur du Res_id de la réservation créée
    DROP FUNCTION IF EXISTS create_reservation;
    CREATE OR REPLACE FUNCTION create_reservation(_start_date TIMESTAMP, _end_date TIMESTAMP, _type INT, _Res_id INT, _cip varchar(16), _Loc_nom varchar(16), _Pav_id varchar(4))
        RETURNS INT
    AS $$
    BEGIN
        IF EXISTS (
            SELECT *
            FROM Usager_Role UR
            WHERE UR.cip = _cip AND UR.Rôle_id = 4 -- Administrateur
        ) THEN
            INSERT INTO Réservation(start_date, end_date, type, Res_id, cip, Loc_nom, Pav_id)
            VALUES (_start_date, _end_date, _type, _Res_id, _cip, _Loc_nom, _Pav_id);
            RETURN (SELECT Res_id FROM Réservation WHERE start_date = _start_date AND end_date = _end_date AND type = _type AND cip = _cip AND Loc_nom = _Loc_nom AND Pav_id = _Pav_id);
        ELSIF EXISTS (
            SELECT *
            FROM Usager_Role UR
            WHERE UR.cip = _cip AND (UR.Rôle_id = 3 OR UR.Rôle_id = 2) -- Enseignant ou personnel de soutien
        ) THEN
            IF _start_date < NOW() + INTERVAL '24 hours' THEN
                RAISE EXCEPTION 'Date de début de réservation inférieure à 24h après la date courante';
            ELSE
                INSERT INTO Réservation(start_date, end_date, type, Res_id, cip, Loc_nom, Pav_id)
                VALUES (_start_date, _end_date, _type, _Res_id, _cip, _Loc_nom, _Pav_id);
                RETURN (SELECT Res_id FROM Réservation WHERE start_date = _start_date AND end_date = _end_date AND type = _type AND cip = _cip AND Loc_nom = _Loc_nom AND Pav_id = _Pav_id);
            END IF;
        ELSE
            RAISE EXCEPTION 'Usager est un étudiant';
        END IF;
    END;
    $$ LANGUAGE plpgsql;


    DROP FUNCTION IF EXISTS tableau(TIMESTAMP, TIMESTAMP, INT);

    -- Fonction permettant de retourner un tableau de réservations
    -- p_start_date: date de début de la période
    -- p_end_date: date de fin de la période
    -- p_category: catégorie de réservation
    CREATE OR REPLACE FUNCTION tableau(
        p_start_date TIMESTAMP,
        p_end_date TIMESTAMP,
        p_category INT
    )
        RETURNS TABLE (
                          start_date TIMESTAMP,
                          end_date TIMESTAMP,
                          loc_nom VARCHAR(16),
                          pav_id VARCHAR(4),
                          reservation_description VARCHAR(100)
                      )
    AS $$
    DECLARE
        r RECORD;
        num_intervals INT;
    BEGIN
        CREATE TEMPORARY TABLE temp_tableau (
                                                start_date TIMESTAMP,
                                                end_date TIMESTAMP,
                                                loc_nom VARCHAR(16),
                                                pav_id VARCHAR(4),
                                                reservation_description VARCHAR(100)
        );

        -- Calculate the number of 15-minute intervals
        num_intervals := EXTRACT(EPOCH FROM (p_end_date - p_start_date)) / (900::FLOAT / 3600); -- 900 seconds = 15 minutes = 1 interval

        -- Insert rows into temp_tableau for specified p_category
        FOR i IN 0..num_intervals LOOP
                INSERT INTO temp_tableau (start_date, end_date, loc_nom, pav_id)
                SELECT
                        p_start_date + (i * INTERVAL '15 minutes'),
                        p_start_date + ((i + 1) * INTERVAL '15 minutes'),
                        L.loc_nom,
                        L.pav_id
                FROM locaux AS L
                WHERE L.fonc_id = p_category;
            END LOOP;

        -- Update reservation_description
        FOR r IN (
            SELECT Res.start_date, Res.end_date, Res.res_id, Res.loc_nom, Res.pav_id, Res.cip
            FROM réservation AS Res
            WHERE Res.start_date >= p_start_date
              AND Res.end_date <= p_end_date
              AND Res.type = p_category
        ) LOOP
                UPDATE temp_tableau AS temp
                SET reservation_description = r.res_id || '-' || r.loc_nom || '-' || r.cip
                WHERE temp.start_date >= r.start_date
                  AND temp.end_date <= r.end_date
                  AND temp.loc_nom = r.loc_nom
                  AND temp.pav_id = r.pav_id;
            END LOOP;


        -- Return the reservation table
        RETURN QUERY SELECT * FROM temp_tableau ORDER BY start_date, pav_id, loc_nom;

        DROP TABLE temp_tableau;
    END;
    $$ LANGUAGE plpgsql;


