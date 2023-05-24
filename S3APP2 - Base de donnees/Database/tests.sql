-- Réservation par un édutiant
SELECT create_reservation(_start_date := '2023-06-01 13:00:00', _end_date := '2023-06-01 17:00:00', _res_id := 0, _type := 0, _cip := 'ower1302', _loc_nom := 'C1-1007', _pav_id := 'C1');

-- Réserver par un professeur délai inférieur à 24 heures
SELECT create_reservation(_start_date := '2023-05-23 13:00:00', _end_date := '2023-05-23 17:00:00', _res_id := 1, _type := 0, _cip := 'hend3944', _loc_nom := 'C1-1007', _pav_id := 'C1');

-- Réserver par un professeur délai supérieur à 24 heures
SELECT create_reservation(_start_date := '2023-06-01 13:00:00', _end_date := '2023-06-01 17:00:00', _res_id := 1, _type := 0, _cip := 'hend3944', _loc_nom := 'C1-1007', _pav_id := 'C1');

-- Réserver par un admin délai inférieur à 24 heures
SELECT create_reservation(_start_date := '2023-05-24 13:00:00', _end_date := '2023-05-24 17:00:00', _res_id := 2, _type := 0, _cip := 'maym4544', _loc_nom := 'C1-3035', _pav_id := 'C1');

-- Réserver pour une date passée
SELECT create_reservation(_start_date := '2020-05-23 13:00:00', _end_date := '2020-05-23 17:00:00', _res_id := 3, _type := 0, _cip := 'maym4544', _loc_nom := 'C1-3035', _pav_id := 'C1');

-- Update par un admin
SELECT update_reservation_date(1,'maym4544', '2019-01-01 00:00:00', '2019-01-01 01:00:00');

-- Update par un usager qui n'est pas admin
SELECT update_reservation_date(1,'joyb0207', '2020-01-01 00:00:00', '2020-01-01 01:00:00');

-- Delete par un usaer qui n'est pas admin
SELECT delete_reservation(1,'joyb0207');

-- Delete par un admin
SELECT delete_reservation(1,'maym4544');

-- Réservation du C1-3035
SELECT create_reservation(_start_date := '2023-06-01 13:00:00', _end_date := '2023-06-01 17:00:00', _res_id := 1, _type := 0, _cip := 'maym4544', _loc_nom := 'C1-3035', _pav_id := 'C1');
SELECT create_reservation(_start_date := '2023-06-01 13:00:00', _end_date := '2023-06-01 17:00:00', _res_id := 2, _type := 0, _cip := 'maym4544', _loc_nom := 'C1-3035-1', _pav_id := 'C1');

SELECT delete_reservation(1,'maym4544');



SELECT create_reservation(_start_date := '2023-06-23 15:00:00', _end_date := '2023-06-23 17:00:00', _res_id := 1, _type := 0210, _cip := 'maym4544', _loc_nom := 'C1-3035', _pav_id := 'C1');
SELECT * FROM tableau('2023-06-23 08:00:00', '2023-06-23 18:00:00', 0210);


