-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 18 Mar 2021, 19:03:49
-- Sunucu sürümü: 10.4.10-MariaDB
-- PHP Sürümü: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `randevu`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ayarlar`
--

DROP TABLE IF EXISTS `ayarlar`;
CREATE TABLE IF NOT EXISTS `ayarlar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_title` text NOT NULL,
  `site_favicon` varchar(255) NOT NULL,
  `site_slogan` text NOT NULL,
  `site_description` text NOT NULL,
  `site_keywords` text NOT NULL,
  `site_copright` varchar(255) NOT NULL,
  `site_facebook` varchar(255) NOT NULL,
  `site_twitter` varchar(255) NOT NULL,
  `site_instagram` varchar(255) NOT NULL,
  `site_analytics` text NOT NULL,
  `site_telefon` varchar(255) NOT NULL,
  `site_fax` varchar(255) NOT NULL,
  `site_calsaat` text NOT NULL,
  `site_eposta` text NOT NULL,
  `site_adres` text NOT NULL,
  `site_gorunum` text NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `ayarlar`
--

INSERT INTO `ayarlar` (`id`, `site_title`, `site_favicon`, `site_slogan`, `site_description`, `site_keywords`, `site_copright`, `site_facebook`, `site_twitter`, `site_instagram`, `site_analytics`, `site_telefon`, `site_fax`, `site_calsaat`, `site_eposta`, `site_adres`, `site_gorunum`, `updatedAt`) VALUES
(1, 'Meli Berber', 'favicon.', 'MELİ Berber', 'MELİ Berber Sizi Baştan Yaratacak', 'randevu formu, yiğithan bulat', 'Copyright © 2021 <a target=\"_blank\" title=\"Yiğithan Bulat\" href=\"https://www.yigithanbulat.com\">Yiğithan BULAT</a> tarafından kodlanmıştır.', 'https://www.facebook.com/bulatii', 'https://www.twitter.com/erdalbaggals', 'https://www.instagram.com/yigithanbulat', '', '0555 555 55 55', '0555 555 55 55', 'Pazartesi - Cumartesi 08:30 - 20:30', 'deneme@deneme.com', 'Adres buraya gelecek...', '1', '2018-07-28 07:45:48');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `destektalepleri`
--

DROP TABLE IF EXISTS `destektalepleri`;
CREATE TABLE IF NOT EXISTS `destektalepleri` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alanid` int(11) NOT NULL,
  `baslik` text NOT NULL,
  `isim` text NOT NULL,
  `eposta` text NOT NULL,
  `kullanicicevap` text NOT NULL,
  `yoneticicevap` text NOT NULL,
  `durum` text NOT NULL,
  `tarih` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hizmetler`
--

DROP TABLE IF EXISTS `hizmetler`;
CREATE TABLE IF NOT EXISTS `hizmetler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `urunresim` varchar(255) NOT NULL,
  `urunbaslik` text NOT NULL,
  `urunicerik` text NOT NULL,
  `urunfiyat` int(11) NOT NULL,
  `tarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `ekleyen` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Tablo döküm verisi `hizmetler`
--

INSERT INTO `hizmetler` (`id`, `urunresim`, `urunbaslik`, `urunicerik`, `urunfiyat`, `tarih`, `ekleyen`) VALUES
(1, '1589666289.jpg', 'Saç Kestirme', 'Hizmet İçeriği', 30, '2019-04-05 17:39:56', 'Mehmet'),
(2, '1589581023.jpg', 'Sakal Kestirme', 'Hizmet İçeriği', 15, '2019-04-10 09:04:05', 'Mehmet'),
(3, 'resimyok.jpg', 'Saç + Sakal Kestirme', 'Hizmet İçeriği', 45, '2019-04-06 10:36:40', 'Mehmet'),
(4, '1589581036.jpg', 'Saç Boyama', 'Hizmet İçeriği', 40, '2019-04-06 10:56:47', 'Mehmet'),
(5, '1589581056.jpg', 'Yüz Bakım', 'Hizmet İçeriği', 30, '2019-04-06 10:56:47', 'Mehmet');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `randevular`
--

DROP TABLE IF EXISTS `randevular`;
CREATE TABLE IF NOT EXISTS `randevular` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `adsoyad` text COLLATE utf8_turkish_ci NOT NULL,
  `telefon` text COLLATE utf8_turkish_ci NOT NULL,
  `heskodu` varchar(12) COLLATE utf8_turkish_ci NOT NULL,
  `hizmet` text COLLATE utf8_turkish_ci NOT NULL,
  `fiyat` text COLLATE utf8_turkish_ci NOT NULL,
  `randevu_tarihi` date NOT NULL,
  `randevu_saati` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `aciklama` text COLLATE utf8_turkish_ci NOT NULL,
  `yoneticicevap` text COLLATE utf8_turkish_ci NOT NULL,
  `durum` text CHARACTER SET utf8 NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `randevular`
--

INSERT INTO `randevular` (`id`, `adsoyad`, `telefon`, `heskodu`, `hizmet`, `fiyat`, `randevu_tarihi`, `randevu_saati`, `aciklama`, `yoneticicevap`, `durum`, `createdAt`) VALUES
(51, 'Yiğithan Bulat', '05445444444', 'A1b2-1234-16', 'Saç + Sakal Kestirme', '45', '2021-03-18', '8:30', 'sassa', 'Tamamlanmış', '1', '2021-03-18 04:19:34'),
(54, 'Volkan Demirel', '0555 273 73 73', 'A1b2-1234-15', 'Saç Boyama', '40', '2021-03-31', '18:00', 'volkan demirel', 'Onaylı', '1', '2021-03-18 04:31:28'),
(55, 'Fernando Muslera', '0332 322 32 32', 'A1b2-1234-14', 'Saç Kestirme', '30', '2021-03-23', '17:00', 'kaleecii', 'Tamamlanmış', '1', '2021-03-18 04:31:52'),
(56, 'Fatih Terim', '0554 554 54 54', 'A1b2-1234-13', 'Saç + Sakal Kestirme', '45', '2021-03-19', '16:30', 'İMPARATOR', 'Yeni', '1', '2021-03-18 04:32:55'),
(57, 'arda turan', '0552 123 12 12', 'A1b2-1234-17', 'Sakal Kestirme', '15', '2021-03-30', '19:30', 'deneme', 'İptal', '1', '2021-03-18 19:59:53');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yoneticiler`
--

DROP TABLE IF EXISTS `yoneticiler`;
CREATE TABLE IF NOT EXISTS `yoneticiler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alanid` text NOT NULL,
  `kullaniciadi` text NOT NULL,
  `email` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `adiniz` text NOT NULL,
  `aciklama` text NOT NULL,
  `telefon` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `yoneticiler`
--

INSERT INTO `yoneticiler` (`id`, `alanid`, `kullaniciadi`, `email`, `password`, `adiniz`, `aciklama`, `telefon`) VALUES
(1, '', 'demo', 'demo@demo.com', 'demo', 'demo', 'Demo', 'demo');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
