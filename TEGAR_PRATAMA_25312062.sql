DROP DATABASE IF EXISTS perpustakaan_tegar;
CREATE DATABASE perpustakaan_tegar;
USE perpustakaan_tegar;

CREATE TABLE anggota (
    id_anggota INT PRIMARY KEY,
    nama VARCHAR(100),
    kelas VARCHAR(20),
    no_hp VARCHAR(15)
);

CREATE TABLE peminjaman (
    id_peminjaman INT PRIMARY KEY,
    id_anggota INT,
    judul_buku VARCHAR(100),
    tanggal_pinjam DATE,
    status VARCHAR(20),
    FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota)
);

INSERT INTO anggota (id_anggota, nama, kelas, no_hp) VALUES
(1, 'Andi Saputra', 'IF25A', '081234567801'),
(2, 'Budi Santoso', 'IF25A', '081234567802'),
(3, 'Citra Lestari', 'SI25A', '081234567803'),
(4, 'Dinda Putri', 'SI25A', '081234567804'),
(5, 'Eko Pratama', 'IF25B', '081234567805');

SELECT * FROM anggota;

INSERT INTO peminjaman (id_peminjaman, id_anggota, judul_buku, tanggal_pinjam, status) VALUES
(101, 1, 'Dasar-Dasar SQL', '2026-10-01', 'Dipinjam'),
(102, 1, 'Pemrograman Python', '2026-10-03', 'Kembali'),
(103, 2, 'Sistem Basis Data', '2026-10-05', 'Dipinjam'),
(104, 3, 'Algoritma dan Pemrograman', '2026-10-06', 'Dipinjam'),
(105, 5, 'Database MySQL', '2026-10-07', 'Kembali'),
(106, 2, 'Pemrograman Web', '2026-10-08', 'Dipinjam');

SELECT * FROM peminjaman;

SELECT * FROM anggota;

SELECT * FROM peminjaman;

SELECT * FROM anggota WHERE kelas = 'IF25A';

UPDATE peminjaman SET status = 'Kembali' WHERE id_peminjaman = 101;

UPDATE anggota SET no_hp = '082345678903' WHERE id_anggota = 3;

DELETE FROM peminjaman WHERE id_peminjaman = 106;

INSERT INTO anggota (id_anggota, nama, kelas, no_hp) 
VALUES (6, 'Tegar Pratama', 'IF25A', '081234567899');

INSERT INTO peminjaman (id_peminjaman, id_anggota, judul_buku, tanggal_pinjam, status) 
VALUES (107, 6, 'Arsitektur Komputer', '2026-10-09', 'Dipinjam');

SELECT a.nama, a.kelas, p.judul_buku, p.tanggal_pinjam, p.status
FROM anggota a
JOIN peminjaman p ON a.id_anggota = p.id_anggota;

SELECT p.* 
FROM peminjaman p
JOIN anggota a ON p.id_anggota = a.id_anggota
WHERE a.nama = 'Andi Saputra';

SELECT DISTINCT a.*
FROM anggota a
JOIN peminjaman p ON a.id_anggota = p.id_anggota
WHERE p.status = 'Dipinjam';

INSERT INTO peminjaman (id_peminjaman, id_anggota, judul_buku, tanggal_pinjam, status) 
VALUES (108, 99, 'Jaringan Komputer', '2026-10-10', 'Dipinjam');