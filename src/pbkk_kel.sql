
DROP TABLE IF EXISTS dbo.users
DROP TABLE IF EXISTS dbo.fasilitaskost
DROP TABLE IF EXISTS dbo.periodekost
DROP TABLE IF EXISTS dbo.kost
DROP TABLE IF EXISTS dbo.kamar
DROP TABLE IF EXISTS dbo.kostfasilitaskost
DROP TABLE IF EXISTS dbo.kostperiodekost
DROP TABLE IF EXISTS dbo.transaksi

CREATE TABLE users (
 id varchar (200) primary key,
 email varchar (200) NOT NULL,
 password text NOT NULL,
 username varchar (200) NOT NULL,
 nama varchar (200) NOT NULL,
 nik varchar (17) unique NOT NULL,
 alamat_ktp varchar (100) NOT NULL,
 alamat_domisili varchar (100) NOT NULL,
 no_hp varchar (15) NOT NULL,
 peran varchar (20) NOT NULL,
 foto_profil varchar (200) default NULL,
 foto_ktp varchar (200) default NULL,
 created_at datetime default NULL
)

INSERT INTO users
(id, email, password, username, nama, nik, alamat_ktp, alamat_domisili, no_hp, peran, foto_profil, foto_ktp, created_at)
VALUES
('qwerty', 'test@test.com', '$2y$12$dWVaaCtWMHlKUDhZbkR3Ue7JWSEWLG4SoQcpW4vlBYhNkiNgzXyAi', 'test', 'Test', '0000000000000000', 'Sby', 'Smg', '081111111111', 'Admin', 'user.png', 'ktp.png', '2020-04-21 22:18:44'),
('pml1', 'pml@test.com', '$2y$12$dWVaaCtWMHlKUDhZbkR3Ue7JWSEWLG4SoQcpW4vlBYhNkiNgzXyAi', 'pemilik', 'Pemilik', '0000000000000001', 'Sby', 'Sby', '082222222222', 'Pemilik', 'user.png', 'ktp.png', '2020-04-21 22:18:44')

CREATE TABLE fasilitaskost (
    id varchar (200) primary key,
    nama varchar (200) NOT NULL,
    created_at datetime default NULL
)

INSERT INTO fasilitaskost
(id, nama, created_at)
VALUES
('fasl1', 'Car Park', '2020-04-21 22:18:44'),
('fasl2', 'Wifi', '2020-04-21 22:18:44'),
('fasl3', 'Kitchen', '2020-04-21 22:18:44'),
('fasl4', 'Refrigerator', '2020-04-21 22:18:44'),
('fasl5', 'Washing Machine', '2020-04-21 22:18:44'),
('fasl6', 'TV', '2020-04-21 22:18:44'),
('fasl7', 'AC', '2020-04-21 22:18:44'),
('fasl8', '24 Hour', '2020-04-21 22:18:44'),
('fasl9', 'Woman Only', '2020-04-21 22:18:44'),
('fasl10', 'Man Only', '2020-04-21 22:18:44')

CREATE TABLE periodekost (
    id varchar (200) primary key,
    nama varchar (200) NOT NULL,
    created_at datetime default NULL
)

INSERT INTO periodekost
(id, nama, created_at)
VALUES
('1', 'Day', '2020-04-21 22:18:44'),
('2', 'Week', '2020-04-21 22:18:44'),
('3', 'Month', '2020-04-21 22:18:44'),
('4', 'Year', '2020-04-21 22:18:44')

CREATE TABLE kost (
    id varchar (200) primary key,
    id_user varchar (200) NOT NULL,
    nama varchar (200) NOT NULL,
    jumlah_transaksi int default 0,
    created_at datetime default NULL
)

INSERT INTO kost
(id, id_user, nama, jumlah_transaksi, created_at)
VALUES
('kost1', 'pml1', 'Kost Indah', 0, '2020-04-21 22:18:44')

CREATE TABLE kamar (
    id varchar (200) primary key,
    id_kost varchar (200) NOT NULL,
    nama varchar (200) NOT NULL,
    harga float NOT NULL,
    panjang float default NULL,
    lebar float default NULL,
    status varchar (100) default 'Available',
    created_at datetime default NULL
)

INSERT INTO kamar
(id, id_kost, nama, harga, panjang, lebar, status, created_at)
VALUES
('kamar1', 'kost1', 'Kamar Indah 1', 1000000, 5, 5, 'Available', '2020-04-21 22:18:44')

CREATE TABLE kostfasilitaskost (
    id varchar (200) primary key,
    id_kost varchar (200) NOT NULL,
    id_fasilitas_kost varchar (200) NOT NULL,
    created_at datetime default NULL
)

INSERT INTO kostfasilitaskost
(id, id_kost, id_fasilitas_kost, created_at)
VALUES
('kfk1', 'kost1', 'fasl1', '2020-04-21 22:18:44'),
('kfk2', 'kost1', 'fasl2', '2020-04-21 22:18:44'),
('kfk3', 'kost1', 'fasl3', '2020-04-21 22:18:44')

CREATE TABLE kostperiodekost (
    id varchar (200) primary key,
    id_kost varchar (200) NOT NULL,
    id_periode_kost varchar (200) NOT NULL,
    created_at datetime default NULL
)

INSERT INTO kostperiodekost
(id, id_kost, id_periode_kost, created_at)
VALUES
('kpk1', 'kost1', 'prd1', '2020-04-21 22:18:44'),
('kpk2', 'kost1', 'prd2', '2020-04-21 22:18:44'),
('kpk3', 'kost1', 'prd3', '2020-04-21 22:18:44'),
('kpk4', 'kost1', 'prd4', '2020-04-21 22:18:44')

CREATE TABLE transaksi (
    id varchar (200) primary key,
    id_kamar varchar (200) NOT NULL,
    id_user varchar (200) NOT NULL,
    waktu_mulai datetime NOT NULL,
    waktu_selesai datetime NOT NULL,
    admin float default 0,
    sub_total float default 0,
    total float default 0,
    status varchar (100) default 'Pending',
    metode_pembayaran varchar (100) default NULL,
    bukti_pembayaran varchar (100) default NULL,
    created_at datetime default NULL
)