insert into dueno (dni, apellido, nombre, telefono, domicilio) values
  ('30111222', 'Gómez',     'María',  '1145551111', 'Av. Rivadavia 1200'),
  ('28222333', 'Pérez',     'Juan',   '1145552222', 'Calle Falsa 123'),
  ('32333444', 'Fernández', 'Lucía',  '1145553333', 'Mitre 456'),
  ('29444555', 'Sosa',      'Diego',  '1145554444', 'San Martín 789'),
  ('35555666', 'Alvarez',   'Rocío',  null,         'Belgrano 321');

insert into veterinario (matricula, apellido, nombre, especialidad) values
  (1001, 'Ramírez', 'Ana',       'Clínica general'),
  (1002, 'Torres',  'Pablo',     'Cirugía'),
  (1003, 'Díaz',    'Carolina',  'Dermatología'),
  (1004, 'Molina',  'Ezequiel',  'Clínica general');

insert into medicamento (nombre, droga, presentacion) values
  ('Amoxicilina 500mg',   'Amoxicilina',  'Comprimidos'),
  ('Meloxicam',           'Meloxicam',    'Suspensión oral'),
  ('Ivermectina',         'Ivermectina',  'Inyectable'),
  ('Cefalexina',          'Cefalexina',   'Comprimidos'),
  ('Prednisolona',        'Prednisolona', 'Comprimidos'),
  ('Furosemida',          'Furosemida',   'Comprimidos'),
  ('Doxiciclina',         'Doxiciclina',  'Cápsulas'),
  ('Vacuna Antirrábica',  null,           'Inyectable'),
  ('Ranitidina',          'Ranitidina',   'Comprimidos');

insert into mascota (id_dueno, nombre, especie, raza, fecha_nac, peso_kg) values
  (1, 'Rocky', 'Perro',   'Labrador',           '2019-05-10', 28.50),
  (1, 'Michi', 'Gato',    'Siamés',             '2021-02-14', 4.20),
  (2, 'Toby',  'Perro',   'Caniche',            '2020-08-01', 6.00),
  (2, 'Luna',  'Gato',    'Común europeo',      '2022-01-20', 3.80),
  (3, 'Rocky', 'Perro',   'Ovejero Alemán',     '2018-03-15', 35.00),
  (3, 'Michi', 'Gato',    'Persa',              '2020-11-05', 4.50),
  (3, 'Pipo',  'Ave',     null,                 '2021-07-01', 0.30),
  (4, 'Nina',  'Perro',   'Beagle',             '2017-09-09', 12.00),
  (4, 'Coco',  'Conejo',  null,                 '2023-04-01', 1.80),
  (4, 'Bruno', 'Perro',   'Boxer',              '2024-05-01', 15.00);

insert into consulta (id_mascota, matricula, fecha, motivo, diagnostico) values
  (1, 1001, '2023-03-10', 'Control anual',               'Sano'),
  (1, 1002, '2023-09-15', 'Cojera pata trasera',          'Esguince leve'),
  (2, 1001, '2023-04-02', 'Vacunación',                   'Aplicada sin reacciones'),
  (3, 1003, '2023-05-20', 'Picazón intensa',              'Dermatitis alérgica'),
  (3, 1003, '2023-11-02', 'Control dermatitis',           'Mejoría notable'),
  (4, 1001, '2023-06-18', 'Chequeo general',              'Sano'),
  (5, 1002, '2023-07-01', 'Herida en pata',               'Sutura realizada'),
  (5, 1001, '2024-01-15', 'Control post-operatorio',      'Cicatrización correcta'),
  (6, 1003, '2023-08-09', 'Caspa y picazón',              'Dermatitis leve'),
  (7, 1001, '2023-08-25', 'Chequeo plumaje',              'Sano'),
  (8, 1002, '2023-02-11', 'Dificultad para respirar',     'Insuficiencia cardíaca leve'),
  (8, 1002, '2023-12-05', 'Control cardíaco',             'Estable con medicación'),
  (9, 1001, '2024-02-01', 'Chequeo general',              'Sano'),
  (1, 1001, '2024-02-20', 'Vómitos',                      'Gastritis'),
  (4, 1003, '2024-03-05', 'Control anual',                'Sano'),
  (9, 1001, '2024-03-10', 'Vacunación',                   'Aplicada sin reacciones');

insert into receta (id_consulta, id_medicamento, dosis, frecuencia, duracion_dias) values
  (2,  2, '0.1mg/kg cada 24hs',  '1 vez al día',   5),
  (4,  5, '5mg cada 12hs',       '2 veces al día', 10),
  (4,  4, '250mg cada 8hs',      '3 veces al día', 7),
  (5,  5, '2.5mg cada 24hs',     '1 vez al día',   5),
  (7,  1, '500mg cada 12hs',     '2 veces al día', 7),
  (7,  2, '0.1mg/kg cada 24hs',  '1 vez al día',   3),
  (8,  1, '500mg cada 12hs',     '2 veces al día', 5),
  (9,  4, '250mg cada 12hs',     '2 veces al día', 7),
  (11, 6, '12.5mg cada 12hs',    '2 veces al día', 30),
  (12, 6, '12.5mg cada 12hs',    '2 veces al día', 30),
  (14, 9, '2mg/kg cada 12hs',    '2 veces al día', 7);
