
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
 foto_profil varchar (200) default NULL,
 foto_ktp varchar (200) default NULL,
 created_at datetime default NULL
)

INSERT INTO users
(id, email, password, username, nama, nik, alamat_ktp, alamat_domisili, no_hp, foto_profil, foto_ktp, created_at)
VALUES
('qwerty', 'test@test.com', '$2y$12$M0hCaXN3Tlh0dmE5cWZCe.tVP/FtBGE/92.ZUs08lo7PBBy.aLy7m', 'test', 'Test', '0000000000000000', 'Sby', 'Smg', '081111111111', 'user.png', 'ktp.png', '2020-04-21 22:18:44')

CREATE TABLE fasilitaskost (
    id varchar (200) primary key,
    nama varchar (200) NOT NULL,
    created_at datetime default NULL
)

CREATE TABLE periodekost (
    id varchar (200) primary key,
    nama varchar (200) NOT NULL,
    created_at datetime default NULL
)

CREATE TABLE kost (
    id varchar (200) primary key,
    id_user varchar (200) NOT NULL,
    nama varchar (200) NOT NULL,
    jumlah_transaksi int default NULL,
    created_at datetime default NULL
)

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

CREATE TABLE kostfasilitaskost (
    id varchar (200) primary key,
    id_kost varchar (200) NOT NULL,
    id_fasilitas_kost varchar (200) NOT NULL,
    created_at datetime default NULL
)

CREATE TABLE kostperiodekost (
    id varchar (200) primary key,
    id_kost varchar (200) NOT NULL,
    id_periode_kost varchar (200) NOT NULL,
    created_at datetime default NULL
)

CREATE TABLE transaksi (
    id varchar (200) primary key,
    id_kamar varchar (200) NOT NULL,
    id_user varchar (200) NOT NULL,
    waktu_mulai datetime NOT NULL,
    waktu_selesai datetime NOT NULL,
    status varchar (100) default 'Pending',
    metode_pembayaran varchar (100) default NULL,
    bukti_pembayaran varchar (100) default NULL,
    created_at datetime default NULL
)