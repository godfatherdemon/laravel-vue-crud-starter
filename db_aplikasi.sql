/*
 Navicat Premium Data Transfer

 Source Server         : mariaDb
 Source Server Type    : MariaDB
 Source Server Version : 100420
 Source Host           : localhost:3306
 Source Schema         : db_aplikasi

 Target Server Type    : MariaDB
 Target Server Version : 100420
 File Encoding         : 65001

 Date: 18/08/2021 07:34:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for application
-- ----------------------------
DROP TABLE IF EXISTS `application`;
CREATE TABLE `application`  (
  `application_id` int(10) NOT NULL COMMENT 'Id aplikasi, e.g. 102010101',
  `no_registrasi` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Nomor registrasi',
  `opd_id` int(11) NOT NULL COMMENT 'Id organisasi perangkat daerah',
  `nama_pic` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nama Penangggung Jawab',
  `jabatan_pic` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Jabatan Penanggung Jawab',
  `alamat_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Alamat Penanggung Jawab',
  `email_pic` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Email Penanggung Jawab',
  `kontak_pic` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'No HP Penanggung Jawab',
  `nama_pic_teknis` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Nama Penanggung Jawab Teknis',
  `alamat_pic_teknis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Alamat Penanggung Jawab Teknis',
  `jabatan_pic_teknis` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Jabatan Penanggung Jawab Teknis',
  `email_pic_teknis` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Email Penanggung Jawab Teknis',
  `kontak_pic_teknis` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'No HP Penanggung Jawab Teknis',
  `development_year` smallint(6) NOT NULL COMMENT 'tahun awal pengembangan',
  `app_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Nama aplikasi',
  `short_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Nama sngkat aplikasi, e.g. SIKD, Simaya, Sambara',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Alamat website aplikasi',
  `legal_basis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Dasar Hukum Operasionalisasi Layanan',
  `service_sop` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Standar Prosedur Operasionalisasi Layanan',
  `usage_status_id` smallint(6) NOT NULL COMMENT 'Status pemanfaatan aplikasi\n0 = belum digunakan\n1 = digunakan secara berkalanjutan\n2 = digunakan secara bulanan\n3 = digunakan secara tahunan\n99 = tidak lagi digunakan\n',
  `funding_source_id` smallint(6) NOT NULL COMMENT 'Sumber pendanaan\n0 = tidak ada\n1 = APBN\n2 = APBD\n3 = APBN dan APBD\n9 = Lainnya',
  `jabar_gov_role_id` smallint(6) NOT NULL COMMENT 'Peran pemerintah provinsi jawa barat dalam sistem elektronik',
  `urusan_category_id` smallint(6) NOT NULL COMMENT 'Sesuai UU no. 23 2014: 1 = wajib dasar; 2 = wajib non-dasar; 3 = pilihan\n',
  `electronic_data_type_id` smallint(6) NOT NULL COMMENT 'Sesuai PP 71 2019, e.g. sektor teknologi informasi dan komunikasi, sektor keuangan.',
  `is_public_service` enum('Pelayanan Publik','Bukan Pelayanan Publik') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Pelayanan Publik' COMMENT 'non/pelayanan publik',
  `public_service_type_id` smallint(6) NOT NULL COMMENT 'Jenis pelayanan publik',
  `id_service_range` smallint(6) NOT NULL COMMENT 'Lingkup wilayah pelayanan: lokal, regional, nasional, internasional',
  `developer_type_id` smallint(6) NOT NULL COMMENT 'Id tipe developer: pusat, mandiri, pihak ketiga, kerja sama.',
  `security_support` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Sistem Pengaman Pendukung Aplikasi',
  `certified_application` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Sertifikasi Aplikasi',
  `is_online_access` enum('Online','Offline') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Dapat diakses secara online atau offline',
  `server_ownership_type_id` smallint(6) NOT NULL COMMENT 'Tipe kepemilikan server: milik sendiri, hosting, pihak ketiga, pusat, dll.',
  `server_ownership_detail` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Keterangan kepemilikan server aplikasi',
  `server_location_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Tipe lokasi server: di PD, di Diskominfo, di Kementerian, di LN, dll.',
  `estimated_user` int(5) NOT NULL COMMENT 'Estimasi Jumlah Pengunjung dalam satu waktu',
  `server_specification` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Spesifikasi Server : Dual Core, 8 GB RAM, 320GB HDD',
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'Tanggal terakhir data dimodifikasi',
  `update_by` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Pengguna terakhir yang melakukan modifikasi',
  PRIMARY KEY (`application_id`) USING BTREE,
  INDEX `FK_app_developer`(`developer_type_id`) USING BTREE,
  INDEX `FK_app_electronic`(`electronic_data_type_id`) USING BTREE,
  INDEX `FK_app_funding_source`(`funding_source_id`) USING BTREE,
  INDEX `FK_app_opd`(`opd_id`) USING BTREE,
  INDEX `FK_app_public_service`(`public_service_type_id`) USING BTREE,
  INDEX `FK_app_role`(`jabar_gov_role_id`) USING BTREE,
  INDEX `FK_app_server_owner`(`server_ownership_type_id`) USING BTREE,
  INDEX `FK_app_service_scope`(`id_service_range`) USING BTREE,
  INDEX `FK_app_urusan`(`urusan_category_id`) USING BTREE,
  INDEX `FK_app_usage_status`(`usage_status_id`) USING BTREE,
  INDEX `application_id`(`application_id`) USING BTREE,
  CONSTRAINT `FK_app_developer` FOREIGN KEY (`developer_type_id`) REFERENCES `p_developer_type` (`developer_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_app_electronic` FOREIGN KEY (`electronic_data_type_id`) REFERENCES `p_electronic_data_type` (`electronic_data_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_app_funding_source` FOREIGN KEY (`funding_source_id`) REFERENCES `p_funding_source` (`funding_source_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_app_opd` FOREIGN KEY (`opd_id`) REFERENCES `opd` (`opd_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_app_public_service` FOREIGN KEY (`public_service_type_id`) REFERENCES `p_public_service_type` (`public_service_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_app_role` FOREIGN KEY (`jabar_gov_role_id`) REFERENCES `p_jabar_prov_role` (`jabar_prov_role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_app_server_owner` FOREIGN KEY (`server_ownership_type_id`) REFERENCES `p_server_ownership_type` (`server_ownership_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_app_service_scope` FOREIGN KEY (`id_service_range`) REFERENCES `p_service_range` (`id_service_range`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_app_urusan` FOREIGN KEY (`urusan_category_id`) REFERENCES `p_urusan_category` (`urusan_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_app_usage_status` FOREIGN KEY (`usage_status_id`) REFERENCES `p_usage_status` (`usage_status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of application
-- ----------------------------
INSERT INTO `application` VALUES (1, 'APP-0001', 1, 'Test PIC', 'Jabatan PIC', 'Alamat PIC', 'emalPIC', '08888888888', 'PIC TEKNIS', 'ALAMAT PIC TEKNIS', 'JABATAN PIC TEKNIS', 'email pic teknis', '08999999999', 2021, 'Nama Aplikasi', 'Nama_APP', 'Belum ada URL', 'Belum Dasar Hukum', 'Belum Ada SOP', 1, 2, 1, 1, 6, 'Bukan Pelayanan Publik', 6, 1, 1, 'Pengamanan HTTPS', 'Belum ada Sertifikat Aplikasi', 'Online', 2, 'Hosting di Diskominfo', 'Hosting di Diskominfo', 500, 'RAM 8 GB, HDD 250 GB', '2021-08-16 10:42:06', 'Admin');
INSERT INTO `application` VALUES (101010102, '', 1, 'Rizki Hustiniasari, S.T,. M.T', 'Kasi Pelayanan Pengembangan dan Pengelolaan Aplikasi Umum dan Aplikasi Khusus yang Terintegrasi', 'Bandung', 'rizki.hustiniasari@jabarprov.g', '0813-1589-5930', 'Ipul Syaifulloh', 'Bandung', 'Tenaga Teknis', 'syaiful.muflih95@gmail.com', '082240074905', 2020, 'Service Desk', 'service desk', 'servicedesk.jabarprov.go.id', 'Tidak ada', 'SOP PERMINTAAN / PENGADUAN SERVICEDESK 1.        Pengguna membuka alamat servicedesk.jabarprov.go.id 2.        Pengguna Login pada aplikasi 3.        Klik “Permintaan Baru” untuk memulai membuat permintaan/pengaduan pada aplikasi  4.        Pastikan sudah', 1, 2, 1, 1, 6, 'Pelayanan Publik', 1, 2, 1, 'menggunakan username dan password', 'Tidak Ada', 'Online', 2, 'Data Center Diskominfo Provinsi Jawa Barat', 'Data Center Diskominfo Provinsi Jawa Barat', 200, 'RAM 8 GB', '2021-08-15 19:35:42', '');

-- ----------------------------
-- Table structure for application_type_detail
-- ----------------------------
DROP TABLE IF EXISTS `application_type_detail`;
CREATE TABLE `application_type_detail`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `application_id` int(10) NOT NULL,
  `application_type_id` smallint(6) NOT NULL,
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'Tanggal terakhir data dimodifikasi',
  `update_by` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Pengguna terakhir yang melakukan modifikasi',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_app_type`(`application_type_id`) USING BTREE,
  INDEX `FK_app`(`application_id`) USING BTREE,
  INDEX `application_id`(`application_id`) USING BTREE,
  CONSTRAINT `FK_app` FOREIGN KEY (`application_id`) REFERENCES `application` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_app_type` FOREIGN KEY (`application_type_id`) REFERENCES `p_application_type` (`application_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of application_type_detail
-- ----------------------------
INSERT INTO `application_type_detail` VALUES (1, 1, 3, '2021-08-16 10:48:45', 'Admin');
INSERT INTO `application_type_detail` VALUES (3, 1, 4, '2021-08-16 15:28:25', '');

-- ----------------------------
-- Table structure for database_type_detail
-- ----------------------------
DROP TABLE IF EXISTS `database_type_detail`;
CREATE TABLE `database_type_detail`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `application_id` int(10) NOT NULL,
  `database_type_id` smallint(6) NOT NULL,
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'Tanggal terakhir data dimodifikasi',
  `update_by` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Pengguna terakhir yang melakukan modifikasi',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_app_db`(`application_id`) USING BTREE,
  INDEX `FK_db_detail`(`database_type_id`) USING BTREE,
  CONSTRAINT `FK_app_db` FOREIGN KEY (`application_id`) REFERENCES `application` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_db_detail` FOREIGN KEY (`database_type_id`) REFERENCES `p_database_type` (`database_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of database_type_detail
-- ----------------------------
INSERT INTO `database_type_detail` VALUES (1, 1, 1, '2021-08-16 10:49:00', 'Admin');

-- ----------------------------
-- Table structure for document_type
-- ----------------------------
DROP TABLE IF EXISTS `document_type`;
CREATE TABLE `document_type`  (
  `document_type_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `document_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'Tanggal terakhir data dimodifikasi',
  `update_by` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Pengguna terakhir yang melakukan modifikasi',
  PRIMARY KEY (`document_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of document_type
-- ----------------------------
INSERT INTO `document_type` VALUES (1, 'Tidak Ada', 'Tidak Ada Dokumen', '2021-08-16 10:49:59', 'Admin');
INSERT INTO `document_type` VALUES (2, 'Dokumentasi aplikasi', 'proses bisnis, struktur, modul', '2021-08-16 10:50:39', '');
INSERT INTO `document_type` VALUES (3, 'Dokumen SOP', 'Standar Operasional Prosedur', '2021-08-16 10:50:39', '');
INSERT INTO `document_type` VALUES (4, 'Dokumentasi database', 'Dokumentasi database (termasuk perancangan)', '2021-08-16 10:51:16', '');
INSERT INTO `document_type` VALUES (5, 'Dokumen manual bagi administrator', 'Dokumen manual bagi administrator', '2021-08-16 10:51:16', '');
INSERT INTO `document_type` VALUES (6, 'Dokumen manual bagi pengguna', 'Dokumen manual bagi pengguna', '2021-08-16 10:51:49', '');
INSERT INTO `document_type` VALUES (7, 'Dokumen manual instalasi', 'Dokumen manual instalasi', '2021-08-16 10:51:49', '');
INSERT INTO `document_type` VALUES (8, 'Dokumen manual penanganan masalah (troubleshoting)', 'Dokumen manual penanganan masalah (troubleshoting)', '2021-08-16 10:52:15', '');
INSERT INTO `document_type` VALUES (9, 'Dokumen konfigurasi akhir', 'Dokumen konfigurasi akhir', '2021-08-16 10:52:15', '');
INSERT INTO `document_type` VALUES (10, 'Source code', 'Source code', '2021-08-16 10:52:23', '');

-- ----------------------------
-- Table structure for document_type_detail
-- ----------------------------
DROP TABLE IF EXISTS `document_type_detail`;
CREATE TABLE `document_type_detail`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `application_id` int(10) NOT NULL,
  `document_type_id` smallint(6) NOT NULL,
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'Tanggal terakhir data dimodifikasi',
  `update_by` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Pengguna terakhir yang melakukan modifikasi',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_app_doc`(`application_id`) USING BTREE,
  INDEX `FK_doc_detail`(`document_type_id`) USING BTREE,
  CONSTRAINT `FK_app_doc` FOREIGN KEY (`application_id`) REFERENCES `application` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_doc_detail` FOREIGN KEY (`document_type_id`) REFERENCES `document_type` (`document_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of document_type_detail
-- ----------------------------
INSERT INTO `document_type_detail` VALUES (1, 1, 2, '2021-08-16 10:52:47', '');
INSERT INTO `document_type_detail` VALUES (2, 1, 3, '2021-08-16 10:52:47', '');

-- ----------------------------
-- Table structure for framework_type_detail
-- ----------------------------
DROP TABLE IF EXISTS `framework_type_detail`;
CREATE TABLE `framework_type_detail`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `application_id` int(10) NOT NULL,
  `framework_type_id` int(6) NOT NULL,
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'Tanggal terakhir data dimodifikasi',
  `update_by` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Pengguna terakhir yang melakukan modifikasi',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_app_framework`(`application_id`) USING BTREE,
  INDEX `FK_framework_detail`(`framework_type_id`) USING BTREE,
  CONSTRAINT `FK_app_framework` FOREIGN KEY (`application_id`) REFERENCES `application` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_framework_detail` FOREIGN KEY (`framework_type_id`) REFERENCES `p_framework_type` (`framework_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of framework_type_detail
-- ----------------------------
INSERT INTO `framework_type_detail` VALUES (1, 1, 1, '2021-08-16 10:53:02', '');

-- ----------------------------
-- Table structure for input_device
-- ----------------------------
DROP TABLE IF EXISTS `input_device`;
CREATE TABLE `input_device`  (
  `input_device_id` int(10) NOT NULL AUTO_INCREMENT,
  `input_device_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'Tanggal terakhir data dimodifikasi',
  `update_by` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Pengguna terakhir yang melakukan modifikasi',
  PRIMARY KEY (`input_device_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of input_device
-- ----------------------------
INSERT INTO `input_device` VALUES (1, 'Tidak ada', 'Tidak ada', '2021-08-16 10:53:58', '');
INSERT INTO `input_device` VALUES (2, 'Biometric', 'Biometric', '2021-08-16 10:53:58', '');
INSERT INTO `input_device` VALUES (3, 'RFID Reader', 'RFID Reader', '2021-08-16 10:53:58', '');
INSERT INTO `input_device` VALUES (4, 'Camera', 'Camera', '2021-08-16 10:54:13', '');
INSERT INTO `input_device` VALUES (5, 'Sensor IoT', 'Sensor IoT', '2021-08-16 10:54:13', '');

-- ----------------------------
-- Table structure for input_device_detail
-- ----------------------------
DROP TABLE IF EXISTS `input_device_detail`;
CREATE TABLE `input_device_detail`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `application_id` int(10) NOT NULL,
  `input_device_id` int(10) NOT NULL,
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'Tanggal terakhir data dimodifikasi',
  `update_by` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Pengguna terakhir yang melakukan modifikasi',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_app_input`(`application_id`) USING BTREE,
  INDEX `FK_input_detail`(`input_device_id`) USING BTREE,
  CONSTRAINT `FK_app_input` FOREIGN KEY (`application_id`) REFERENCES `application` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_input_detail` FOREIGN KEY (`input_device_id`) REFERENCES `input_device` (`input_device_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of input_device_detail
-- ----------------------------
INSERT INTO `input_device_detail` VALUES (1, 1, 1, '2021-08-16 10:54:29', '');

-- ----------------------------
-- Table structure for opd
-- ----------------------------
DROP TABLE IF EXISTS `opd`;
CREATE TABLE `opd`  (
  `opd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id organisasi perangkat daerah',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Nama perangkat daerah',
  `short_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Nama singkat OPD, e.g. Diskominfo, Dispusipda',
  `eselon_pimpinan` varchar(5) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Eselon yang memimpin perangkat daerah tersebut: I.b, II.a, II.b',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'alamat kantor',
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `update_by` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`opd_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Menyimpan data perangkat daerah setara eselon I atau II.' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of opd
-- ----------------------------
INSERT INTO `opd` VALUES (1, 'Dinas Komunikasi Dan Informatika', 'DISKOMINFO', '', 'Jl. Tamansari No. 55 Bandung\r\n', '2021-02-04 10:02:59', '');
INSERT INTO `opd` VALUES (2, 'Dewan Perwakilan Rakyat Daerah Jawa Barat', 'DPRD JABAR', '', 'Jl. Diponegoro No.27, Citarum, Kec. Bandung Wetan, Kota Bandung\r\n', '2021-02-04 10:06:18', '');
INSERT INTO `opd` VALUES (3, 'Satuan Polisi Pamong Praja', 'SATPOL PP', '', 'Jalan Banda No. 28 Bandung\r\n', '2021-02-04 10:17:00', '');
INSERT INTO `opd` VALUES (4, 'Inspektorat Provinsi Jawa Barat', 'INSPEKTORAT', '', 'Jl. Surapati No.4, Citarum, Kec. Bandung Wetan, Kota Bandung', '2021-02-04 10:17:00', '');
INSERT INTO `opd` VALUES (5, 'Dinas Tenaga Kerja Dan Transmigrasi', 'DISNAKERTRANS', '', 'Jl. Soekarno-Hatta No.532, Sekejati, Kec. Buahbatu, Kota Bandung, Jawa Barat ', '2021-02-04 10:28:12', '');
INSERT INTO `opd` VALUES (6, 'Dinas Tanaman Pangan dan Hortikultura', 'DISTANHOR', '', 'Jl. Surapati No.71, Sadang Serang, Kecamatan Coblong, Kota Bandung, Jawa Barat 40133', '2021-02-04 10:30:58', '');
INSERT INTO `opd` VALUES (7, 'Dinas Sumber Daya Air', 'DSDA', '', 'Jl. Braga No.137, Babakan Ciamis, Kec. Sumur Bandung, Kota Bandung, Jawa Barat 40111', '2021-02-04 10:34:37', '');
INSERT INTO `opd` VALUES (8, 'Dinas Sosial', 'DISSOS', '', 'Jl. Jend. H. Amir Machmud No.331, Cigugur Tengah, Kec. Cimahi Tengah, Kota Cimahi, Jawa Barat 40522', '2021-02-04 10:34:37', '');
INSERT INTO `opd` VALUES (9, 'Dinas Perumahan Dan Permukiman', 'DISPERKIM', '', 'Jl. Kawaluyaan Indah Raya No.4, Jatisari, Kec. Buahbatu, Kota Bandung, Jawa Barat 40286', '2021-02-04 10:36:44', '');
INSERT INTO `opd` VALUES (10, 'Dinas Perkebunan', 'DISBUN', '', 'Jl. Surapati No.67, Sadang Serang, Kecamatan Coblong, Kota Bandung, Jawa Barat 40133', '2021-02-04 10:38:35', '');
INSERT INTO `opd` VALUES (11, 'Dinas Perpustakaan dan Kearsipan Daerah', 'DISPUSIPDA', '', 'Jl. Kawaluyaan Indah III No.4, Jatisari, Kec. Buahbatu, Kota Bandung, Jawa Barat 40286', '2021-02-04 10:38:35', '');
INSERT INTO `opd` VALUES (12, 'Dinas Pendidikan', 'DISDIK', '', 'Jl. Dr. Rajiman No.6, Pasir Kaliki, Kec. Cicendo, Kota Bandung, Jawa Barat 40171', '2021-02-04 10:42:43', '');
INSERT INTO `opd` VALUES (13, 'Dinas Perhubungan', 'DISHUB', '', 'Jl. Sukabumi No.1, Kacapiring, Kec. Batununggal, Kota Bandung, Jawa Barat 40271', '2021-02-04 10:42:43', '');
INSERT INTO `opd` VALUES (14, 'Dinas Perdagangan dan Perindustrian', 'DISPERINDAG', '', 'Jl. Asia Afrika No.146, Paledang, Kec. Lengkong, Kota Bandung, Jawa Barat 40261', '2021-02-04 10:45:58', '');
INSERT INTO `opd` VALUES (15, 'DINAS PENANAMAN MODAL DAN PELAYANAN TERPADU SATU PINTU', 'DPMPTSP', '', 'Jalan Windu Nomor 26 Bandung 40263', '2021-02-04 10:45:58', '');
INSERT INTO `opd` VALUES (16, 'Dinas Pemuda Dan Olahraga', 'DISPORA', '', 'Jl. Pacuan Kuda No.140, Sukamiskin, Kec. Arcamanik, Kota Bandung, Jawa Barat 40293', '2021-02-04 10:48:27', '');
INSERT INTO `opd` VALUES (17, 'Dinas Pemberdayaan Perempuan Perlindungan Anak dan Keluarga Berencana', 'DP3AKB', '', 'Jl. Sumatera No.50, Citarum, Kec. Bandung Wetan, Kota Bandung, Jawa Barat 40115', '2021-02-04 10:48:27', '');
INSERT INTO `opd` VALUES (18, 'Dinas Pemberdayaan Masyarakat Dan Desa', 'DPMD', '', 'Jl. Soekarno-Hatta No.466, Batununggal, Kec. Bandung Kidul, Kota Bandung, Jawa Barat 40266', '2021-02-04 10:55:04', '');
INSERT INTO `opd` VALUES (19, 'Dinas Pariwisata Dan Kebudayaan', 'DISPARBUD', '', 'Jl. L.L.R.E. Martadinata No. 209, Bandung 40114', '2021-02-04 10:55:04', '');
INSERT INTO `opd` VALUES (20, 'Dinas Lingkungan Hidup', 'DLH', '', 'Jl. Kawaluyaan Indah Raya No. 6 Bandung Jawa Barat', '2021-02-04 10:55:04', '');
INSERT INTO `opd` VALUES (21, 'Dinas Koperasi dan Usaha Kecil Dan Menengah', 'DISKUMKM', '', 'Jl. Soekarno-Hatta No.705, Jatisari, Kec. Buahbatu, Kota Bandung, Jawa Barat 40286', '2021-02-04 10:59:08', '');
INSERT INTO `opd` VALUES (22, 'Dinas Ketahanan PAngan Dan Peternakan', 'DKPP', '', 'Jl. Kawaluyaan Indah Raya No.6, Jatisari, Kec. Buahbatu, Kota Bandung, Jawa Barat 40286', '2021-02-04 10:59:08', '');
INSERT INTO `opd` VALUES (23, 'Dinas Kesehatan', 'DINKES', '', 'Jl. Pasteur No.25, Pasir Kaliki, Kec. Cicendo, Kota Bandung, Jawa Barat 40171', '2021-02-04 10:59:08', '');
INSERT INTO `opd` VALUES (24, 'Dinas Kependudukan Dan Pencatatan Sipil', 'DISDUKCAPIL', '', 'Jl. Ciumbuleuit No.2, Cipaganti, Kecamatan Coblong, Kota Bandung, Jawa Barat 40131', '2021-02-04 11:02:40', '');
INSERT INTO `opd` VALUES (25, 'Dinas Kelautan Dan Perikanan', 'DKP', '', 'Jl. Wastukencana No.17, Babakan Ciamis, Kec. Sumur Bandung, Kota Bandung, Jawa Barat 40117', '2021-02-04 11:02:40', '');
INSERT INTO `opd` VALUES (26, 'Dinas Kehutanan', 'DISHUT', '', 'Jl. Soekarno-Hatta No.751, Cisaranten Endah, Kec. Arcamanik, Kota Bandung, Jawa Barat 40292', '2021-02-04 11:08:08', '');
INSERT INTO `opd` VALUES (27, 'Dinas Energi Dan Sumber Daya Mineral', 'DESDM', '', 'Jl. Soekarno-Hatta No. 576 Bandung 42086', '2021-02-04 11:08:08', '');
INSERT INTO `opd` VALUES (28, 'Biro Umum Jawa Barat', 'BIRO UMUM', '', 'Jl. Diponegoro No. 22 Bandung', '2021-02-04 11:22:22', '');
INSERT INTO `opd` VALUES (29, 'Biro Perekonomian Jawa Barat', 'BIRO PEREKONOMIAN', '', 'Jl. Diponegoro No. 22 Bandung', '2021-02-04 11:22:22', '');
INSERT INTO `opd` VALUES (30, 'Biro Pengadaan Barang Dan Jasa\r\n', 'Biro PBJ', '', 'Jl. Diponegoro No.22, Citarum, Kec. Bandung Wetan, Kota Bandung, Jawa Barat 40115', '2021-02-04 12:01:34', '');
INSERT INTO `opd` VALUES (31, 'BIRO PEMERINTAHAN DAN KERJASAMA', 'BIRO PEMKSM', '', 'Jl. Diponegoro No. 22 Bandung', '2021-02-04 12:01:34', '');
INSERT INTO `opd` VALUES (32, 'Biro Pelayanan dan Pengembangan Sosial', 'BIRO BANGSOS', '', 'Jl. Diponegoro No. 22 Bandung', '2021-02-04 12:03:53', '');
INSERT INTO `opd` VALUES (33, 'Biro Organisasi', 'BIRO ORGANISASI', '', 'Jl. Diponegoro No. 22 Bandung', '2021-02-04 12:03:53', '');
INSERT INTO `opd` VALUES (34, 'Biro Hukum Dan Hak Asasi Manusia', 'BIRO HUKUM & HAM', '', 'Jl. Diponegoro No. 22 Bandung ', '2021-02-04 13:11:29', '');
INSERT INTO `opd` VALUES (35, 'Humas Jawa Barat', 'HUMAS', '', 'Jl. Diponegoro No. 22 Bandung ', '2021-02-04 13:11:29', '');
INSERT INTO `opd` VALUES (36, 'Biro Badan Usaha Milik Daerah dan Investasi', 'BIRO BUMD', '', 'Jl. Diponegoro No. 22 Bandung', '2021-02-05 11:04:15', '');
INSERT INTO `opd` VALUES (37, 'Badan Perencanaan Pembangunan Daerah ', 'BAPPEDA', '', 'JL. Insinyur Jl. Ir. H. Juanda No.287, Dago, Kecamatan Coblong, Kota Bandung, Jawa Barat 40135', '2021-02-04 13:16:59', '');
INSERT INTO `opd` VALUES (38, 'Badan Penghubung', 'BANHUB', '', 'Jalan Pembangunan II No.3-5 Jakarta Pusat', '2021-02-04 13:16:59', '');
INSERT INTO `opd` VALUES (39, 'Badan Pengembangan Sumber Daya Manusia', 'BPSDM', '', 'Jl. Windu No. 26 Bandung ', '2021-02-04 13:21:02', '');
INSERT INTO `opd` VALUES (40, 'Badan Pengelolaan Keuangan dan Aset Daerah', 'BPKAD', '', 'Jl. Diponegoro No. 22 Bandung ', '2021-02-04 13:21:02', '');
INSERT INTO `opd` VALUES (41, 'Badan Penelitian dan Pengembangan Daerah', 'BP2D', '', 'Jl. Citarum No. 8 BANDUNG', '2021-02-04 13:21:02', '');
INSERT INTO `opd` VALUES (42, 'Badan Pendapatan Daerah', 'BAPENDA', '', 'Jl. Soekarno Hatta No. 528 Bandung', '2021-02-04 13:26:40', '');
INSERT INTO `opd` VALUES (43, 'Badan Penanggulangan Bencana Daerah', 'BPBD', '', 'Jl. Soekarno-Hatta No. 629 Bandung', '2021-02-04 13:26:40', '');
INSERT INTO `opd` VALUES (44, 'Badan Kepegawaian Daerah', 'BKD', '', 'Jl. Ternate No. 2 Bandung', '2021-02-04 13:26:40', '');
INSERT INTO `opd` VALUES (45, 'Badan Kesatuan Bangsa dan Politik', 'BAKESBANGPOL', '', 'Jl. Supratman No. 44 Bandung', '2021-02-04 13:26:40', '');
INSERT INTO `opd` VALUES (46, 'Dinas Bina Marga Dan Penataan Ruang ', 'DBMTR', '', 'Jl. Asia Afrika Jl. Braga No.79-81, Braga, Kec. Lengkong, Kota Bandung, Jawa Barat ', '2021-02-05 13:47:19', '');

-- ----------------------------
-- Table structure for os_type_detail
-- ----------------------------
DROP TABLE IF EXISTS `os_type_detail`;
CREATE TABLE `os_type_detail`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `application_id` int(10) NOT NULL,
  `os_type_id` smallint(6) NOT NULL,
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'Tanggal terakhir data dimodifikasi',
  `update_by` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Pengguna terakhir yang melakukan modifikasi',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_app_os`(`application_id`) USING BTREE,
  INDEX `FK_os_detail`(`os_type_id`) USING BTREE,
  CONSTRAINT `FK_app_os` FOREIGN KEY (`application_id`) REFERENCES `application` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_os_detail` FOREIGN KEY (`os_type_id`) REFERENCES `p_os_type` (`os_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of os_type_detail
-- ----------------------------
INSERT INTO `os_type_detail` VALUES (1, 1, 1, '2021-08-16 10:54:43', '');

-- ----------------------------
-- Table structure for p_application_type
-- ----------------------------
DROP TABLE IF EXISTS `p_application_type`;
CREATE TABLE `p_application_type`  (
  `application_type_id` smallint(6) NOT NULL COMMENT 'Id bentuk sistem elektronik atau aplikasi',
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'nama kategori bentuk sistem elektronik',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'deskripsi kategori bentuk aplikasi',
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'tanggal terakhir dimodifikasi',
  `update_by` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'pengguna terakhir yang memodifikasi',
  PRIMARY KEY (`application_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Bentuk aplikasi atau sistem elektronik: sistem informasi berbasis web, situs web informasional, aplikasi desktop standalone, mobile app.' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_application_type
-- ----------------------------
INSERT INTO `p_application_type` VALUES (1, 'Situs Web informasional', 'Kumpulan informasi pada halaman web yang dapat diakses melalui internet.', '2021-02-04 11:31:16', '');
INSERT INTO `p_application_type` VALUES (2, 'Sistem berbasis desktop', 'Sistem yang menghasilkan informasi yang diakses melalui aplikasi yang diinstall secara khusus di PC pengguna', '2021-02-04 11:31:19', '');
INSERT INTO `p_application_type` VALUES (3, 'Sistem berbasis web', 'Sistem yang menghasilkan informasi yang diakses melalui browser', '2021-02-04 11:31:23', '');
INSERT INTO `p_application_type` VALUES (4, 'Sistem berbasis mobile', 'Sistem yang menghasilkan informasi yang diakses melalui aplikasi yang diinstal pada perangkat mobile (android/iOS)', '2021-02-04 11:31:27', '');

-- ----------------------------
-- Table structure for p_database_type
-- ----------------------------
DROP TABLE IF EXISTS `p_database_type`;
CREATE TABLE `p_database_type`  (
  `database_type_id` smallint(6) NOT NULL COMMENT 'id jenis database',
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'nama database',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'deskripsi database',
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'tanggal terakhir dimodifikasi',
  `update_by` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'pengguna terakhir yang memodifikasi',
  PRIMARY KEY (`database_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Jenis database: MySQL, PostgreSQL, Oracle, MongoDB, dll.' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_database_type
-- ----------------------------
INSERT INTO `p_database_type` VALUES (1, 'MySQL', '', '2021-02-04 10:58:32', '');
INSERT INTO `p_database_type` VALUES (2, 'PostgreSQL', '', '2021-02-04 10:58:32', '');
INSERT INTO `p_database_type` VALUES (3, 'Oracle', '', '2021-02-04 10:58:48', '');
INSERT INTO `p_database_type` VALUES (4, 'MongoDB', '', '2021-02-04 10:58:48', '');

-- ----------------------------
-- Table structure for p_developer_type
-- ----------------------------
DROP TABLE IF EXISTS `p_developer_type`;
CREATE TABLE `p_developer_type`  (
  `developer_type_id` smallint(6) NOT NULL COMMENT 'id tipe developer',
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'nama jenis atau tipe developer',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'deskripsi jenis developer',
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'tanggal terakhir dimodifikasi',
  `update_by` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'pengguna terakhir yang memodifikasi',
  PRIMARY KEY (`developer_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Tipe developer: pusat, mandiri, pihak ketiga, kerja sama.' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_developer_type
-- ----------------------------
INSERT INTO `p_developer_type` VALUES (1, 'Mandiri', 'Dikembangkan oleh staff Perangkat Daerah (ASN/Pegawai Pemerintah dengan Perjanjian Kerja', '2021-02-04 10:33:08', '');
INSERT INTO `p_developer_type` VALUES (2, 'Kerjasama', 'Dikembangkan oleh tenaga ahli dari luar Perangkat Daerah', '2021-02-04 10:33:08', '');
INSERT INTO `p_developer_type` VALUES (3, 'Pihak Ketiga', 'Dikembangkan oleh perusahaan konsultan teknologi informasi', '2021-02-04 10:33:45', '');
INSERT INTO `p_developer_type` VALUES (4, 'Pusat', 'Dikembangkan oleh Pemerintah Pusat', '2021-02-04 10:33:45', '');

-- ----------------------------
-- Table structure for p_electronic_data_type
-- ----------------------------
DROP TABLE IF EXISTS `p_electronic_data_type`;
CREATE TABLE `p_electronic_data_type`  (
  `electronic_data_type_id` smallint(6) NOT NULL COMMENT 'id jenis data elektronik strategis',
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'nama jenis data elektronik strategis',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'deskripsi jenis data elektronik strategis',
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'tanggal terakhir dimodifikasi',
  `update_by` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'pengguna terakhir yang memodifikasi',
  PRIMARY KEY (`electronic_data_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Jenis data elektronik strategis sesuai PP 71 tahun 2019, e.g. sektor teknologi informasi dan komunikasi, sektor keuangan.\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_electronic_data_type
-- ----------------------------
INSERT INTO `p_electronic_data_type` VALUES (1, 'Administrasi', 'Sektor administrasi pemerintahan', '2021-02-04 10:07:53', '');
INSERT INTO `p_electronic_data_type` VALUES (2, 'ESDM', 'Sektor energi dan sumber daya mineral', '2021-02-04 10:07:53', '');
INSERT INTO `p_electronic_data_type` VALUES (3, 'Trasnportasi', 'Sektor transportasi', '2021-02-04 10:08:36', '');
INSERT INTO `p_electronic_data_type` VALUES (4, 'Keuangan', 'Sektor keuangan', '2021-02-04 10:08:36', '');
INSERT INTO `p_electronic_data_type` VALUES (5, 'Kesehatan', 'Sektor kesehatan', '2021-02-04 10:09:10', '');
INSERT INTO `p_electronic_data_type` VALUES (6, 'TIK', 'Sektor teknologi informasi dan komunikasi', '2021-02-04 10:09:10', '');
INSERT INTO `p_electronic_data_type` VALUES (7, 'Pangan', 'Sektor pangan', '2021-02-04 10:09:38', '');
INSERT INTO `p_electronic_data_type` VALUES (8, 'Pertahanan', 'Sektor pertahanan', '2021-02-04 10:09:38', '');
INSERT INTO `p_electronic_data_type` VALUES (9, 'Other', '', '2021-02-04 10:09:44', '');

-- ----------------------------
-- Table structure for p_framework_type
-- ----------------------------
DROP TABLE IF EXISTS `p_framework_type`;
CREATE TABLE `p_framework_type`  (
  `framework_type_id` int(6) NOT NULL COMMENT 'id jenis framework',
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'nama framework',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'deskripsi framework',
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'tanggal terakhir dimodifikasi',
  `update_by` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'pengguna terakhir yang memodifikasi',
  PRIMARY KEY (`framework_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Jenis framework: laravel, CodeIgniter, wordpress, dll.' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_framework_type
-- ----------------------------
INSERT INTO `p_framework_type` VALUES (1, 'Laravel', '', '2021-02-04 10:56:37', '');
INSERT INTO `p_framework_type` VALUES (2, 'CodeIgniter', '', '2021-02-04 10:56:37', '');
INSERT INTO `p_framework_type` VALUES (3, 'Spring', '', '2021-02-04 10:56:37', '');
INSERT INTO `p_framework_type` VALUES (4, 'Wordpress', '', '2021-02-04 10:56:37', '');
INSERT INTO `p_framework_type` VALUES (5, 'ASP.Net', '', '2021-02-04 10:57:04', '');
INSERT INTO `p_framework_type` VALUES (6, 'Angular JS', '', '2021-02-04 10:56:37', '');

-- ----------------------------
-- Table structure for p_funding_source
-- ----------------------------
DROP TABLE IF EXISTS `p_funding_source`;
CREATE TABLE `p_funding_source`  (
  `funding_source_id` smallint(6) NOT NULL COMMENT 'id sumber pendanaan',
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'nama sumber pendanaan',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'deskripsi sumber pendanaan',
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'tanggal terakhir dimodifikasi',
  `update_by` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'pengguna terakhir yang memodifikasi',
  PRIMARY KEY (`funding_source_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Sumber pendanaan\n0 = tidak ada\n1 = APBN\n2 = APBD\n3 = APBN dan APBD\n9 = Lainnya\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_funding_source
-- ----------------------------
INSERT INTO `p_funding_source` VALUES (1, 'APBN', 'Menggunakan dana APBN', '2021-02-04 09:54:10', '');
INSERT INTO `p_funding_source` VALUES (2, 'APBD', 'APBD Provinsi Jawa Barat', '2021-02-04 09:54:10', '');

-- ----------------------------
-- Table structure for p_jabar_prov_role
-- ----------------------------
DROP TABLE IF EXISTS `p_jabar_prov_role`;
CREATE TABLE `p_jabar_prov_role`  (
  `jabar_prov_role_id` smallint(6) NOT NULL COMMENT 'id jenis layanan publik',
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'nama peran',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'deskripsi peran',
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'tanggal terakhir dimodifikasi',
  `update_by` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'pengguna terakhir yang memodifikasi',
  PRIMARY KEY (`jabar_prov_role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Peran pemerintah provinsi jawa barat dalam sistem elektronik\n1: Sistem Owner: jika Perangkat Daerah adalah pemilik proses bisnis dan/atau sumber pendanaan\n2: Operator: jika Perangkat Daerah bertugas melakukan update data/informasi untuk lingkup tertentu\n3: Local Administrator : jika Perangkat Daerah diserahi kewenangan pengaturan user untuk lingkup tertentu\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_jabar_prov_role
-- ----------------------------
INSERT INTO `p_jabar_prov_role` VALUES (1, 'Sistem Owner', 'Jika Perangkat Daerah adalah pemilik proses bisnis dan/atau sumber pendanaan', '2021-02-04 09:57:55', '');
INSERT INTO `p_jabar_prov_role` VALUES (2, 'Local Administrator', 'Jika Perangkat Daerah diserahi kewenangan pengaturan user untuk lingkup tertentu', '2021-02-04 09:57:55', '');
INSERT INTO `p_jabar_prov_role` VALUES (3, 'Operator', 'Jika Perangkat Daerah bertugas melakukan update data/informasi untuk lingkup tertentu', '2021-02-04 09:58:20', '');

-- ----------------------------
-- Table structure for p_os_family
-- ----------------------------
DROP TABLE IF EXISTS `p_os_family`;
CREATE TABLE `p_os_family`  (
  `os_family_id` smallint(6) NOT NULL COMMENT 'id family sistem operasi',
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'nama famili sistem operasi',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'deskripsi famili sistem operasi',
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'tanggal terakhir dimodifikasi',
  `update_by` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'pengguna terakhir yang memodifikasi',
  PRIMARY KEY (`os_family_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Family sistem operasi: Windows, Linux, Unix, dll.' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_os_family
-- ----------------------------
INSERT INTO `p_os_family` VALUES (1, 'Windows', '', '2021-02-04 11:07:37', '');
INSERT INTO `p_os_family` VALUES (2, 'Linux', '', '2021-02-04 11:07:37', '');
INSERT INTO `p_os_family` VALUES (3, 'Unix', '', '2021-02-04 11:07:37', '');

-- ----------------------------
-- Table structure for p_os_type
-- ----------------------------
DROP TABLE IF EXISTS `p_os_type`;
CREATE TABLE `p_os_type`  (
  `os_type_id` smallint(6) NOT NULL COMMENT 'id jenis sistem operasi',
  `os_family` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Id famili sistem operasi: Windows, Linux, Unix',
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'nama jenisi sistem operasi: Ubuntu untuk Linux, Windows Server untuk Windows, Solaris untuk Unix.',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'deskripsi jenis sistem operasi',
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'tanggal terakhir dimodifikasi',
  `update_by` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'pengguna terakhir yang memodifikasi',
  PRIMARY KEY (`os_type_id`) USING BTREE,
  INDEX `FK_os_family`(`os_family`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Jenis distribusi atau edisi dari famili sistem operasi tertentu: Ubuntu, Debian, Red Hat, Windows Server, Solaris dll.' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_os_type
-- ----------------------------
INSERT INTO `p_os_type` VALUES (1, 'Windows', 'Windows Server 2016', '', '2021-08-15 10:59:10', '');
INSERT INTO `p_os_type` VALUES (2, 'Windows', 'Windows Server 2019', '', '2021-08-15 10:59:12', '');
INSERT INTO `p_os_type` VALUES (3, 'Linux', 'Ubuntu', '', '2021-08-15 10:59:17', '');
INSERT INTO `p_os_type` VALUES (4, 'Linux', 'Centos', '', '2021-08-15 10:59:18', '');
INSERT INTO `p_os_type` VALUES (5, 'Linux', 'Red Hat', '', '2021-08-15 10:59:20', '');
INSERT INTO `p_os_type` VALUES (6, 'Linux', 'Debian', '', '2021-08-15 14:32:10', '');

-- ----------------------------
-- Table structure for p_programming_language
-- ----------------------------
DROP TABLE IF EXISTS `p_programming_language`;
CREATE TABLE `p_programming_language`  (
  `programming_language_id` smallint(6) NOT NULL COMMENT 'id jenis bahasa pemrograman',
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'nama bahasa pemrograman',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'deskripsi bahasa pemrograman',
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'tanggal terakhir dimodifikasi',
  `update_by` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'pengguna terakhir yang memodifikasi',
  PRIMARY KEY (`programming_language_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Jenis bahasa pemrograman: Java, JavaScript, PHP, Python, C, C++, C#, dll.' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_programming_language
-- ----------------------------
INSERT INTO `p_programming_language` VALUES (1, 'Java', '', '2021-02-04 10:52:09', '');
INSERT INTO `p_programming_language` VALUES (2, 'C', '', '2021-02-04 10:52:09', '');
INSERT INTO `p_programming_language` VALUES (3, 'Visual basic', '', '2021-02-04 10:52:09', '');
INSERT INTO `p_programming_language` VALUES (4, 'PHP', '', '2021-02-04 10:52:09', '');
INSERT INTO `p_programming_language` VALUES (5, 'HTML', '', '2021-02-04 10:52:09', '');
INSERT INTO `p_programming_language` VALUES (6, 'Javascript', '', '2021-02-04 10:52:09', '');
INSERT INTO `p_programming_language` VALUES (7, 'Python', '', '2021-02-04 10:52:32', '');
INSERT INTO `p_programming_language` VALUES (8, 'Ruby', '', '2021-02-04 10:52:32', '');

-- ----------------------------
-- Table structure for p_public_service_type
-- ----------------------------
DROP TABLE IF EXISTS `p_public_service_type`;
CREATE TABLE `p_public_service_type`  (
  `public_service_type_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'id jenis layanan publik',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Nama jenis layanan publik:\n01. pelaporan\n02. pembayaran\ndst',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `update_by` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`public_service_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Jenis layanan publik\r\n- pendaftaran\r\n- publikasi informasi\r\n- pelaporan masyarakat\r\n- perizinan\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_public_service_type
-- ----------------------------
INSERT INTO `p_public_service_type` VALUES (1, 'Pelaporan masyarakat ', 'Jika sistem elektronik menyediakan layanan untuk pelaporan masyarakat', '2021-02-04 03:13:20', '');
INSERT INTO `p_public_service_type` VALUES (2, 'Pembayaran', 'Jika sistem elektronik menyediakan layanan pembayaran', '2021-02-04 03:13:20', '');
INSERT INTO `p_public_service_type` VALUES (3, 'Pendaftaran', 'Jika sistem elektronik menyediakan layanan pendaftaran', '2021-02-04 03:13:56', '');
INSERT INTO `p_public_service_type` VALUES (4, 'Perizinan', 'Jika sistem elektronik menyediakan layanan perizinan', '2021-02-04 03:13:56', '');
INSERT INTO `p_public_service_type` VALUES (5, 'Publikasi informasi', 'Jika sistem elektronik menyediakan layanan publikasi informasi', '2021-02-04 03:14:22', '');
INSERT INTO `p_public_service_type` VALUES (6, 'Other', NULL, '2021-02-04 03:14:22', '');

-- ----------------------------
-- Table structure for p_server_ownership_type
-- ----------------------------
DROP TABLE IF EXISTS `p_server_ownership_type`;
CREATE TABLE `p_server_ownership_type`  (
  `server_ownership_type_id` smallint(6) NOT NULL COMMENT 'id jenis kepemilikan server aplikasi',
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'nama jenis atau tipe kepemilikan server',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'deskripsi jenis kepemilikan server',
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'tanggal terakhir dimodifikasi',
  `update_by` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'pengguna terakhir yang memodifikasi',
  PRIMARY KEY (`server_ownership_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Tipe kepemilikan server aplikasi: milik sendiri, hosting, pihak ketiga, pusat, dll.' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_server_ownership_type
-- ----------------------------
INSERT INTO `p_server_ownership_type` VALUES (1, 'Milik sendiri', '', '2021-02-04 03:40:13', '');
INSERT INTO `p_server_ownership_type` VALUES (2, 'Diskominfo', 'Hosting di Diskominfo Provinsi Jawa Barat', '2021-02-04 03:40:13', '');
INSERT INTO `p_server_ownership_type` VALUES (3, 'Other', 'Apabila sewa di pihak ketiga', '2021-02-04 03:40:31', '');

-- ----------------------------
-- Table structure for p_service_range
-- ----------------------------
DROP TABLE IF EXISTS `p_service_range`;
CREATE TABLE `p_service_range`  (
  `id_service_range` smallint(5) NOT NULL,
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp,
  `update_by` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  INDEX `id_service_range`(`id_service_range`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_service_range
-- ----------------------------
INSERT INTO `p_service_range` VALUES (1, 'Lokal', 'Sistem Elektronik hanya melayani pengguna di lingkup internal Instansi', '2021-02-04 10:28:49', '');
INSERT INTO `p_service_range` VALUES (2, 'Regional', 'Sistem Elektronik melayani pengguna di lingkup Provinsi Jawa Barat', '2021-02-04 10:29:55', '');
INSERT INTO `p_service_range` VALUES (3, 'Nasional', 'Sistem Elektronik melayani pengguna di seluruh Indonesia', '2021-02-04 10:29:55', '');
INSERT INTO `p_service_range` VALUES (4, 'Internasional', 'Sistem Elektronik melayani pengguna dari berbagai negara', '2021-02-04 10:30:15', '');

-- ----------------------------
-- Table structure for p_urusan_category
-- ----------------------------
DROP TABLE IF EXISTS `p_urusan_category`;
CREATE TABLE `p_urusan_category`  (
  `urusan_category_id` smallint(6) NOT NULL COMMENT 'id kategori urusan',
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'nama kategori urusan',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'deskripsi kategori urusan',
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'tanggal terakhir dimodifikasi',
  `update_by` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'pengguna terakhir yang memodifikasi',
  PRIMARY KEY (`urusan_category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Kategori urusan sesuai UU no. 23 tahun 2014:\n- 1 = wajib dasar\n- 2 = wajib non-dasar\n- 3 = pilihan' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_urusan_category
-- ----------------------------
INSERT INTO `p_urusan_category` VALUES (1, 'Wajib Dasar', 'Meliputi pendidikan, kesehatan, pekerjaan umum dan penataan ruang, perumahan rakyat dan Kawasan permukiman, ketentraman, ketertiban umum dan perlindungan masyarakat dan sosial', '2021-02-04 10:04:50', '');
INSERT INTO `p_urusan_category` VALUES (2, 'Wajib non-dasar', 'Meliputi tenaga kerja, pemberdayaan perempuan dan perlindungan anak, pangan, pertanahan, lingkungan hidup, administrasi kependudukan dan pencatatan sipil, pemberdayaan masyarakat dan desa, pengendalian penduduk dan keluarga berencana, perhubungan, komunik', '2021-02-04 10:04:55', '');
INSERT INTO `p_urusan_category` VALUES (3, 'Pilihan', 'Meliputi kelautan dan perikanan, pariwisata, pertanian, kehutanan, energi dan sumber daya mineral, perdagangan, perindustrian dan transmigrasi', '2021-02-04 10:04:59', '');

-- ----------------------------
-- Table structure for p_usage_status
-- ----------------------------
DROP TABLE IF EXISTS `p_usage_status`;
CREATE TABLE `p_usage_status`  (
  `usage_status_id` smallint(6) NOT NULL COMMENT 'id status pemanfaatan',
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'nama pemanfaatan',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'deskripsi pemanfaatan',
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'tanggal terakhir dimodifikasi',
  `update_by` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'pengguna terakhir yang memodifikasi',
  PRIMARY KEY (`usage_status_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Status pemanfaatan aplikasi\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_usage_status
-- ----------------------------
INSERT INTO `p_usage_status` VALUES (1, 'continue', 'Digunakan secara berkelanjutan', '2021-02-04 09:50:07', '');
INSERT INTO `p_usage_status` VALUES (2, 'mingguan', 'Digunakan secara mingguan', '2021-02-04 09:50:07', '');
INSERT INTO `p_usage_status` VALUES (3, 'bulanan', 'Digunakan secara bulanan', '2021-02-04 09:50:34', '');
INSERT INTO `p_usage_status` VALUES (4, 'tahunan', 'Digunakan secara tahunan', '2021-02-04 09:50:34', '');
INSERT INTO `p_usage_status` VALUES (5, 'dev', 'Belum digunakan (akan dikembangkan)', '2021-02-04 09:51:26', '');
INSERT INTO `p_usage_status` VALUES (6, 'discontinued', 'Tidak lagi digunakan', '2021-02-04 09:51:26', '');

-- ----------------------------
-- Table structure for p_web_server_type
-- ----------------------------
DROP TABLE IF EXISTS `p_web_server_type`;
CREATE TABLE `p_web_server_type`  (
  `web_server_type_id` smallint(6) NOT NULL COMMENT 'id jenis web server',
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'nama web server',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'deskripsi web server',
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'tanggal terakhir dimodifikasi',
  `update_by` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'pengguna terakhir yang memodifikasi',
  PRIMARY KEY (`web_server_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Jenis web server: Apache, IIS, NGINX, dll.' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_web_server_type
-- ----------------------------
INSERT INTO `p_web_server_type` VALUES (1, 'Apache', '', '2021-02-04 11:03:08', '');
INSERT INTO `p_web_server_type` VALUES (2, 'Nginx', '', '2021-02-04 11:03:08', '');
INSERT INTO `p_web_server_type` VALUES (3, 'Lighttpd', '', '2021-02-04 11:03:08', '');
INSERT INTO `p_web_server_type` VALUES (4, 'OpenLiteSpeed', '', '2021-02-04 11:03:08', '');
INSERT INTO `p_web_server_type` VALUES (5, 'NodeJS', '', '2021-02-04 11:03:08', '');

-- ----------------------------
-- Table structure for programming_language_detail
-- ----------------------------
DROP TABLE IF EXISTS `programming_language_detail`;
CREATE TABLE `programming_language_detail`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `application_id` int(10) NOT NULL,
  `programming_language_id` smallint(6) NULL DEFAULT NULL,
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'Tanggal terakhir data dimodifikasi',
  `update_by` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Pengguna terakhir yang melakukan modifikasi',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_app_programming`(`application_id`) USING BTREE,
  INDEX `FK_programming_detail`(`programming_language_id`) USING BTREE,
  CONSTRAINT `FK_app_programming` FOREIGN KEY (`application_id`) REFERENCES `application` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_programming_detail` FOREIGN KEY (`programming_language_id`) REFERENCES `p_programming_language` (`programming_language_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of programming_language_detail
-- ----------------------------
INSERT INTO `programming_language_detail` VALUES (1, 1, 4, '2021-08-16 10:54:55', '');

-- ----------------------------
-- Table structure for service_user
-- ----------------------------
DROP TABLE IF EXISTS `service_user`;
CREATE TABLE `service_user`  (
  `service_user_id` int(5) NOT NULL,
  `service_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'Tanggal terakhir data dimodifikasi',
  `update_by` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Pengguna terakhir yang melakukan modifikasi',
  PRIMARY KEY (`service_user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of service_user
-- ----------------------------
INSERT INTO `service_user` VALUES (1, 'Instansi Pemerintah', '2021-08-15 19:32:50', '');
INSERT INTO `service_user` VALUES (2, 'Masyarakat Luas', '2021-08-15 19:32:50', '');
INSERT INTO `service_user` VALUES (3, 'Pelaku Usaha', '2021-08-15 19:33:09', '');

-- ----------------------------
-- Table structure for service_user_detail
-- ----------------------------
DROP TABLE IF EXISTS `service_user_detail`;
CREATE TABLE `service_user_detail`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `application_id` int(10) NOT NULL,
  `service_user_id` int(5) NOT NULL,
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'Tanggal terakhir data dimodifikasi',
  `update_by` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Pengguna terakhir yang melakukan modifikasi',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_app_service_user`(`application_id`) USING BTREE,
  INDEX `FK_service_user_detail`(`service_user_id`) USING BTREE,
  CONSTRAINT `FK_app_service_user` FOREIGN KEY (`application_id`) REFERENCES `application` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_service_user_detail` FOREIGN KEY (`service_user_id`) REFERENCES `service_user` (`service_user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of service_user_detail
-- ----------------------------
INSERT INTO `service_user_detail` VALUES (1, 1, 1, '2021-08-16 10:55:11', '');

-- ----------------------------
-- Table structure for web_server_type_detail
-- ----------------------------
DROP TABLE IF EXISTS `web_server_type_detail`;
CREATE TABLE `web_server_type_detail`  (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `application_id` int(10) NOT NULL,
  `web_server_type_id` smallint(6) NULL DEFAULT NULL,
  `last_update` timestamp(0) NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP COMMENT 'Tanggal terakhir data dimodifikasi',
  `update_by` varchar(18) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Pengguna terakhir yang melakukan modifikasi',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_app_web_server`(`application_id`) USING BTREE,
  INDEX `FK_web_server_detail`(`web_server_type_id`) USING BTREE,
  CONSTRAINT `FK_app_web_server` FOREIGN KEY (`application_id`) REFERENCES `application` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_web_server_detail` FOREIGN KEY (`web_server_type_id`) REFERENCES `p_web_server_type` (`web_server_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_server_type_detail
-- ----------------------------
INSERT INTO `web_server_type_detail` VALUES (1, 1, 1, '2021-08-16 10:55:22', '');

-- ----------------------------
-- View structure for aplikasi
-- ----------------------------
DROP VIEW IF EXISTS `aplikasi`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `aplikasi` AS SELECT  a.application_id, 
		no_registrasi, 
        b.name AS nama_opd, 
        nama_pic, 
        jabatan_pic, 
        alamat_pic, 
        email_pic, 
        kontak_pic, 
        nama_pic_teknis, 
        alamat_pic_teknis, 
        jabatan_pic_teknis, 
        email_pic_teknis, 
        kontak_pic_teknis, 
        development_year, 
        app_name, 
        a.short_name, 
        url, 
        legal_basis, 
        service_sop, 
        c.name AS usage_status, 
        d.name AS funding_source, 
        e.name AS jabar_gov_role, 
        f.name AS urusan_category, 
        g.name AS electronic_data_type, 
        is_public_service, 
        h.name AS public_service_type,   
        GROUP_CONCAT(DISTINCT su.service_user) AS user_service,
        i.name AS service_range, 
        j.name AS developer_type, 
        GROUP_CONCAT(DISTINCT tipe.name) AS application_type,
        security_support, 
        certified_application, 
        is_online_access, 
        k.name AS server_ownership_type, 
        server_ownership_detail, 
        server_location_type, 
        GROUP_CONCAT(DISTINCT input.input_device_name) AS device_input,
        estimated_user, 
        server_specification, 
        GROUP_CONCAT(DISTINCT prog.name) AS programming_language,
        GROUP_CONCAT(DISTINCT frame.name) AS framework,
        GROUP_CONCAT(DISTINCT db.name) AS database_type,
        GROUP_CONCAT(DISTINCT web.name) AS web_server,
        GROUP_CONCAT(DISTINCT os.name) AS os,
        GROUP_CONCAT(DISTINCT doc.document_name) AS document,
        a.last_update, 
        a.update_by 
FROM application a JOIN opd b ON a.opd_id=b.opd_id 
	JOIN p_usage_status c ON a.usage_status_id=c.usage_status_id 
    JOIN p_funding_source d ON a.funding_source_id=d.funding_source_id 
    JOIN p_jabar_prov_role e ON a.jabar_gov_role_id=e.jabar_prov_role_id 
    JOIN p_urusan_category f ON a.urusan_category_id=f.urusan_category_id 
    JOIN p_electronic_data_type g ON a.electronic_data_type_id=g.electronic_data_type_id 
    JOIN p_public_service_type h ON a.public_service_type_id=h.public_service_type_id
    JOIN p_service_range i ON a.id_service_range=i.id_service_range
    JOIN p_developer_type j ON a.developer_type_id=j.developer_type_id
    JOIN p_server_ownership_type k ON a.server_ownership_type_id=k.server_ownership_type_id
    JOIN service_user_detail sd ON a.application_id=sd.application_id 
    JOIN service_user su ON sd.service_user_id=su.service_user_id
    JOIN application_type_detail typed ON a.application_id=typed.application_id
    JOIN p_application_type tipe ON typed.application_type_id=tipe.application_type_id
    JOIN input_device_detail inputd ON a.application_id=inputd.application_id
    JOIN input_device input ON inputd.input_device_id=input.input_device_id
    JOIN programming_language_detail progd ON a.application_id=progd.application_id
    JOIN p_programming_language prog ON progd.programming_language_id=prog.programming_language_id
    JOIN framework_type_detail frd ON a.application_id=frd.application_id
    JOIN p_framework_type frame ON frd.framework_type_id=frame.framework_type_id
    JOIN database_type_detail dbd ON a.application_id=dbd.application_id
    JOIN p_database_type db ON dbd.database_type_id=db.database_type_id
    JOIN web_server_type_detail webd ON a.application_id=webd.application_id
    JOIN p_web_server_type web ON webd.web_server_type_id=web.web_server_type_id
    JOIN os_type_detail osd ON a.application_id=osd.application_id
    JOIN p_os_type os ON osd.os_type_id=os.os_type_id
    JOIN document_type_detail docd ON a.application_id=docd.application_id
    JOIN document_type doc ON docd.document_type_id=doc.document_type_id ;

SET FOREIGN_KEY_CHECKS = 1;
