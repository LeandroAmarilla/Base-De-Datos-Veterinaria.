-- ============================================================
-- La veterinaria — esquema para Supabase (PostgreSQL)
-- Basado en veterinariaresolucion.md
--
-- 6 tablas para 5 entidades: DUENO, MASCOTA, VETERINARIO,
-- CONSULTA, MEDICAMENTO + RECETA (nace de la N:M entre
-- CONSULTA y MEDICAMENTO, con "dosis" viviendo en el cruce).
--
-- Corré este script entero en el SQL Editor de Supabase.
-- Es idempotente: podés volver a correrlo las veces que quieras.
-- ============================================================

-- Orden de borrado inverso a las dependencias (FK)
drop table if exists receta cascade;
drop table if exists consulta cascade;
drop table if exists mascota cascade;
drop table if exists medicamento cascade;
drop table if exists veterinario cascade;
drop table if exists dueno cascade;

-- ------------------------------------------------------------
-- DUENO
-- ------------------------------------------------------------
create table dueno (
  id_dueno  int generated always as identity primary key,
  dni       varchar(10) unique,
  apellido  varchar(60) not null,
  nombre    varchar(60),
  telefono  varchar(30),
  domicilio varchar(120)
);

-- ------------------------------------------------------------
-- VETERINARIO
-- matricula NO se autogenera: la asigna el colegio profesional.
-- Es el unico caso del modelo donde la PK vino dada, no se inventa.
-- ------------------------------------------------------------
create table veterinario (
  matricula    int primary key,
  apellido     varchar(60) not null,
  nombre       varchar(60),
  especialidad varchar(60)
);

-- ------------------------------------------------------------
-- MEDICAMENTO
-- ------------------------------------------------------------
create table medicamento (
  id_medicamento int generated always as identity primary key,
  nombre         varchar(80) not null,
  droga          varchar(80),
  presentacion   varchar(60)
);

-- ------------------------------------------------------------
-- MASCOTA (FK -> dueno, lado "muchos")
-- ------------------------------------------------------------
create table mascota (
  id_mascota int generated always as identity primary key,
  id_dueno   int not null references dueno (id_dueno),
  nombre     varchar(60) not null,
  especie    varchar(30),
  raza       varchar(40),
  fecha_nac  date,
  peso_kg    decimal(5,2)
);

create index idx_mascota_dueno on mascota (id_dueno);

-- ------------------------------------------------------------
-- CONSULTA (FK -> mascota, FK -> veterinario)
-- ------------------------------------------------------------
create table consulta (
  id_consulta int generated always as identity primary key,
  id_mascota  int not null references mascota (id_mascota),
  matricula   int not null references veterinario (matricula),
  fecha       date not null,
  motivo      varchar(200),
  diagnostico varchar(400)
);

create index idx_consulta_mascota on consulta (id_mascota);
create index idx_consulta_veterinario on consulta (matricula);
create index idx_consulta_fecha on consulta (fecha);

-- ------------------------------------------------------------
-- RECETA — la tabla que "nace sola": el cruce N:M entre
-- CONSULTA y MEDICAMENTO. La dosis vive aca, no en MEDICAMENTO
-- (no es la misma para un gato de 3kg que para un ovejero de 40kg)
-- ni en CONSULTA (una consulta puede recetar varios medicamentos).
-- ------------------------------------------------------------
create table receta (
  id_consulta    int not null references consulta (id_consulta),
  id_medicamento int not null references medicamento (id_medicamento),
  dosis          varchar(60) not null,
  frecuencia     varchar(60),
  duracion_dias  int,
  primary key (id_consulta, id_medicamento)
);
