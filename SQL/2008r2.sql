USE [master]
GO
/****** Object:  Database [1294_FurkanYasar]    Script Date: 12.05.2019 14:59:54 ******/
CREATE DATABASE [1294_FurkanYasar] ON  PRIMARY 
( NAME = N'1294_FurkanYasar', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\1294_FurkanYasar.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'1294_FurkanYasar_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\1294_FurkanYasar_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [1294_FurkanYasar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [1294_FurkanYasar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET ARITHABORT OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [1294_FurkanYasar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [1294_FurkanYasar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET  DISABLE_BROKER 
GO
ALTER DATABASE [1294_FurkanYasar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [1294_FurkanYasar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [1294_FurkanYasar] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [1294_FurkanYasar] SET  MULTI_USER 
GO
ALTER DATABASE [1294_FurkanYasar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [1294_FurkanYasar] SET DB_CHAINING OFF 
GO
USE [1294_FurkanYasar]
GO
/****** Object:  Table [dbo].[tblGununSozu]    Script Date: 12.05.2019 14:59:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGununSozu](
	[SozID] [int] IDENTITY(1,1) NOT NULL,
	[GununSozu] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tblGunuSozu] PRIMARY KEY CLUSTERED 
(
	[SozID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblKategoriler]    Script Date: 12.05.2019 14:59:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKategoriler](
	[Kategoriid] [int] IDENTITY(1,1) NOT NULL,
	[Kategori] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblKategoriler] PRIMARY KEY CLUSTERED 
(
	[Kategoriid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblKisiler]    Script Date: 12.05.2019 14:59:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblKisiler](
	[Kisiid] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [varchar](50) NOT NULL,
	[Mail] [varchar](50) NOT NULL,
	[Parola] [varchar](50) NOT NULL,
	[Tarih] [date] NOT NULL CONSTRAINT [DF_tblKisiler_Tarih]  DEFAULT (getdate()),
 CONSTRAINT [PK_tblKisiler] PRIMARY KEY CLUSTERED 
(
	[Kisiid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblKonular]    Script Date: 12.05.2019 14:59:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKonular](
	[Konuid] [int] IDENTITY(1,1) NOT NULL,
	[KonuBaslik] [nvarchar](max) NOT NULL,
	[KonuIcerik] [nvarchar](max) NOT NULL,
	[Tarih] [datetime] NOT NULL CONSTRAINT [DF_tblKonular_Tarih]  DEFAULT (getdate()),
	[Kisiid] [int] NOT NULL,
	[Kategoriid] [int] NOT NULL,
	[GoruntulenmeSayisi] [int] NULL CONSTRAINT [DF_tblKonular_GoruntulenmeSayisi]  DEFAULT ((1)),
 CONSTRAINT [PK_tblKonular] PRIMARY KEY CLUSTERED 
(
	[Konuid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblYorumlar]    Script Date: 12.05.2019 14:59:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblYorumlar](
	[Yorumid] [int] IDENTITY(1,1) NOT NULL,
	[Yorum] [nvarchar](max) NOT NULL,
	[Tarih] [datetime] NOT NULL CONSTRAINT [DF_tblYorumlar_Tarih]  DEFAULT (getdate()),
	[Kisiid] [int] NOT NULL,
	[Konuid] [int] NOT NULL,
 CONSTRAINT [PK_tblYorumlar] PRIMARY KEY CLUSTERED 
(
	[Yorumid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblGununSozu] ON 

INSERT [dbo].[tblGununSozu] ([SozID], [GununSozu]) VALUES (1, N'Acaba sırf dünya için mi yaratılmışsın ki, bütün vaktini ona sarf ediyorsun? - Risale-i Nur')
SET IDENTITY_INSERT [dbo].[tblGununSozu] OFF
SET IDENTITY_INSERT [dbo].[tblKategoriler] ON 

INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (1, N'Spor')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (2, N'Eğitim')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (3, N'Sağlık')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (4, N'Teknoloji')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (5, N'Gündem')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (6, N'Moda')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (8, N'Yemek')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (9, N'Aşk İlişkileri')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (10, N'Alışveriş')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (11, N'Saç Bakım')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (12, N'Cilt Bakım')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (13, N'Film')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (14, N'Ekonomi')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (15, N'Tatil')
INSERT [dbo].[tblKategoriler] ([Kategoriid], [Kategori]) VALUES (16, N'Diğer')
SET IDENTITY_INSERT [dbo].[tblKategoriler] OFF
SET IDENTITY_INSERT [dbo].[tblKisiler] ON 

INSERT [dbo].[tblKisiler] ([Kisiid], [KullaniciAdi], [Mail], [Parola], [Tarih]) VALUES (9, N'admin', N'furkanyasar19@outlook.com', N'11234', CAST(N'2019-05-12' AS Date))
INSERT [dbo].[tblKisiler] ([Kisiid], [KullaniciAdi], [Mail], [Parola], [Tarih]) VALUES (10, N'furkany', N'furkany@hotmail.com', N'1234', CAST(N'2019-05-12' AS Date))
INSERT [dbo].[tblKisiler] ([Kisiid], [KullaniciAdi], [Mail], [Parola], [Tarih]) VALUES (11, N'onelemir', N'onele@hotmail.com', N'yemek123', CAST(N'2019-05-12' AS Date))
INSERT [dbo].[tblKisiler] ([Kisiid], [KullaniciAdi], [Mail], [Parola], [Tarih]) VALUES (12, N'muko', N'bocut@outlook.com', N'muco1905', CAST(N'2019-05-12' AS Date))
INSERT [dbo].[tblKisiler] ([Kisiid], [KullaniciAdi], [Mail], [Parola], [Tarih]) VALUES (13, N'canpo', N'canb@hotmail.com', N'49625', CAST(N'2019-05-12' AS Date))
INSERT [dbo].[tblKisiler] ([Kisiid], [KullaniciAdi], [Mail], [Parola], [Tarih]) VALUES (14, N'serceis', N'ismail@outlook.com', N'sercee2', CAST(N'2019-05-12' AS Date))
INSERT [dbo].[tblKisiler] ([Kisiid], [KullaniciAdi], [Mail], [Parola], [Tarih]) VALUES (15, N'deliali', N'veli@hotmail.com', N'559964', CAST(N'2019-05-12' AS Date))
INSERT [dbo].[tblKisiler] ([Kisiid], [KullaniciAdi], [Mail], [Parola], [Tarih]) VALUES (16, N'kasapsabahattin', N'kasaps@gmail.com', N'564547', CAST(N'2019-05-12' AS Date))
INSERT [dbo].[tblKisiler] ([Kisiid], [KullaniciAdi], [Mail], [Parola], [Tarih]) VALUES (17, N'sonkullanici', N'son@gmail.com', N'7894', CAST(N'2019-05-12' AS Date))
SET IDENTITY_INSERT [dbo].[tblKisiler] OFF
SET IDENTITY_INSERT [dbo].[tblKonular] ON 

INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid], [GoruntulenmeSayisi]) VALUES (92, N'Hangi takımın küme düşmesine daha çok üzülürsünüz?', N'Yine bir futbol', CAST(N'2019-05-12 11:26:30.730' AS DateTime), 12, 1, 1)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid], [GoruntulenmeSayisi]) VALUES (93, N'Galatasaray’ın 2-1 geriden gelip de 3-2 ye çevirmesi hakkında düşünceleriniz neler?', N'Ayrıca bu iki golü Diagne bin atması da ayrı bir mesele
', CAST(N'2019-05-12 11:27:07.050' AS DateTime), 15, 1, 2)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid], [GoruntulenmeSayisi]) VALUES (94, N'Hangi mesleği asla yapmazsınız?
', N'Ben asla öğretmen olmam mesela
', CAST(N'2019-05-12 11:30:32.660' AS DateTime), 13, 2, 2)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid], [GoruntulenmeSayisi]) VALUES (95, N'Kopek dislerimden biri salaniyor duserse buyuk sorun olurmu?
', N'Ztn hafif bosluk vardi desteksiz oldugu icin sanirim salanmaya basladi eskiden salanmiodu simdi o duserse ne olcak:(?
', CAST(N'2019-05-12 11:33:14.333' AS DateTime), 11, 3, 3)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid], [GoruntulenmeSayisi]) VALUES (96, N'İos ile android boks maçı yapsa kim kazanır?
', N'İos parçalar bence', CAST(N'2019-05-12 11:35:01.050' AS DateTime), 14, 4, 9)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid], [GoruntulenmeSayisi]) VALUES (97, N'İnternet üzerinden para kazandığınız siteler var mı?
', N'Paylaşır mısınız?
', CAST(N'2019-05-12 11:37:43.840' AS DateTime), 12, 4, 3)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid], [GoruntulenmeSayisi]) VALUES (98, N'Az parayla nasıl ek gelir oluşturabilirsiniz?
', N'Sabit gelirli bireyler yani asgari ücretle çalışan kişiler ay sonunu göremiyor bu sebepten ötürü ek gelir ihtiyacı doğuyor.
', CAST(N'2019-05-12 11:41:01.707' AS DateTime), 16, 5, 2)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid], [GoruntulenmeSayisi]) VALUES (99, N'Takım elbiseye yakışan en güzel aksesuar hangisi?
', N'Hangi aksesuar takım elbiseyi daha şık yapıyor?
', CAST(N'2019-05-12 11:44:15.443' AS DateTime), 11, 6, 2)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid], [GoruntulenmeSayisi]) VALUES (100, N'Malum yaz geldi, sizin heyecanla beklediğiniz meyve hangisi?
', N'Malum yaz geldi, sizin heyecanla beklediğiniz meyve hangisi? 
', CAST(N'2019-05-12 11:45:45.850' AS DateTime), 12, 8, 6)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid], [GoruntulenmeSayisi]) VALUES (101, N'Yöreniz nesiyle meşurdur?
', N'Adana yı bilen bilir , kebap, şalgam, bici bici, falan filan
', CAST(N'2019-05-12 11:47:55.257' AS DateTime), 11, 8, 3)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid], [GoruntulenmeSayisi]) VALUES (102, N'Nasıl Bir Düğün İsterdiniz?
', N'Düğünününz nasıl olsun?
', CAST(N'2019-05-12 11:51:21.793' AS DateTime), 13, 9, 2)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid], [GoruntulenmeSayisi]) VALUES (103, N'Anneler gününde ne hediye  alacaksınız?
', N'Başta annem olmak üzere tüm anneler günü kutlu olsun
', CAST(N'2019-05-12 11:53:09.383' AS DateTime), 12, 10, 5)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid], [GoruntulenmeSayisi]) VALUES (104, N'Uzun saçlı erkekler gösterişçi mi, karizmatik mi?
', N'Soru Ortada', CAST(N'2019-05-12 11:55:58.303' AS DateTime), 16, 11, 5)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid], [GoruntulenmeSayisi]) VALUES (105, N'Kısa saç mı? Uzun saç mı?
', N'Cesur olup kısa saçı mı, klasikleşen uzun saç mı? Senin tercihin.
', CAST(N'2019-05-12 11:57:42.810' AS DateTime), 12, 11, 2)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid], [GoruntulenmeSayisi]) VALUES (106, N'DİZİ ya da FİLM ?
', N'yabancı dizi ya da film önerirmisiniz?
', CAST(N'2019-05-12 11:59:56.233' AS DateTime), 12, 13, 5)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid], [GoruntulenmeSayisi]) VALUES (107, N'Türkiye''deki ekonomik durum sizce de çok kötü değil mi?
', N'Ne zaman süper güç olacağız
', CAST(N'2019-05-12 12:02:31.093' AS DateTime), 16, 14, 3)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid], [GoruntulenmeSayisi]) VALUES (108, N'Pazar gününüzü nasıl değerlendiriyorsunuz?
', N'Ben kendimi dağlara attım ', CAST(N'2019-05-12 12:04:54.493' AS DateTime), 13, 15, 2)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid], [GoruntulenmeSayisi]) VALUES (109, N'Nerde yaşıyorsunuz?
', N'Ben İstanbul', CAST(N'2019-05-12 12:09:22.087' AS DateTime), 11, 16, 8)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid], [GoruntulenmeSayisi]) VALUES (110, N'Ehliyetiniz var mı?
', N'Varsa hangi sınıf?
', CAST(N'2019-05-12 12:11:15.523' AS DateTime), 12, 16, 6)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid], [GoruntulenmeSayisi]) VALUES (111, N'Oruç zorluyormu sizi', N'Elhamdulillah iftarda bile suyu mecburluktan içiyorum', CAST(N'2019-05-12 12:28:45.003' AS DateTime), 11, 16, 7)
INSERT [dbo].[tblKonular] ([Konuid], [KonuBaslik], [KonuIcerik], [Tarih], [Kisiid], [Kategoriid], [GoruntulenmeSayisi]) VALUES (112, N'Site Bilgilendirme', N'<p>G&uuml;n&uuml;n s&ouml;z&uuml;n&uuml; değiştirmek i&ccedil;in admin ile giriş yapınız</p>', CAST(N'2019-05-12 12:43:22.997' AS DateTime), 9, 10, 5)
SET IDENTITY_INSERT [dbo].[tblKonular] OFF
SET IDENTITY_INSERT [dbo].[tblYorumlar] ON 

INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (118, N'Fenerbahçe küme düşmez bunu kafaniza şokun Fenerbahçe haricinde de kim. duserse düşsün umrumda olmaz

', CAST(N'2019-05-12 11:27:41.673' AS DateTime), 11, 92)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (119, N'Fener düşerse en çok ona sevineceğim

', CAST(N'2019-05-12 11:27:55.160' AS DateTime), 13, 92)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (121, N'Galatasaray sonuna kadar hakketti ve kazandı. İlk yarıdaki fırsatları değerlendirsek maç farka gidecekti 
', CAST(N'2019-05-12 11:28:46.240' AS DateTime), 14, 93)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (122, N'Millet konuşuyor yok hakem Galatasaray''a şans. Verdi su bu iyide. Bu hakemler Fenerbahçe maçında başka. maclardada puan kaybettirdi aynı şey bir kerede Galatasaray''ın yanında oldular ondan boş yapmamak lazım ligde olan şeyler bunlar keşke hiç olmasa

', CAST(N'2019-05-12 11:29:17.880' AS DateTime), 12, 93)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (123, N'“Asla yapmam” diyebileceğim bir meslek yok, büyük konuşmamak lazım', CAST(N'2019-05-12 11:31:05.263' AS DateTime), 14, 94)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (124, N'Doktorluk yapamam icim bir tuhaf oluyo biseyler kesilip dikilince

', CAST(N'2019-05-12 11:31:25.537' AS DateTime), 11, 94)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (125, N'Yuhh naptın knka ôyle 
En güclü dis
Kökü en uzun dis
Nasıl becerdin onu', CAST(N'2019-05-12 11:33:39.233' AS DateTime), 12, 95)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (126, N'Bişe olmaz

', CAST(N'2019-05-12 11:33:55.910' AS DateTime), 13, 95)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (127, N'Fenerbahçeliyiz olm biz yense yenilse kalbimiz samsungla ', CAST(N'2019-05-12 11:35:20.940' AS DateTime), 11, 96)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (128, N'İkisininde çok iyi ve leş gibi özellikleri var soru çok saçma kıyaslama yapılamaz

', CAST(N'2019-05-12 11:35:41.687' AS DateTime), 12, 96)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (129, N'AnTuTu puanlarında android uper-cut çalışıyor devamlı...
iOS hâlâ kendine gelemedi.', CAST(N'2019-05-12 11:36:01.357' AS DateTime), 13, 96)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (130, N'Android döver seni ah yapar sana ', CAST(N'2019-05-12 11:36:13.723' AS DateTime), 11, 96)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (131, N'Android kamerası daha iyi ama ', CAST(N'2019-05-12 11:36:28.310' AS DateTime), 16, 96)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (132, N'yoktur öyle bişey çalışmadan para kazanma var mı yahu

', CAST(N'2019-05-12 11:38:03.443' AS DateTime), 11, 97)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (133, N'Zamanında ben de çok aradım ama yok.

', CAST(N'2019-05-12 11:38:14.483' AS DateTime), 13, 97)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (134, N'Zor bir süreç.

', CAST(N'2019-05-12 11:38:23.010' AS DateTime), 15, 97)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (135, N'Peçete veya su gibi şeyler satarak olabilir..

', CAST(N'2019-05-12 11:41:39.820' AS DateTime), 13, 98)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (136, N'Zor ya kolay gelsin

', CAST(N'2019-05-12 11:41:49.683' AS DateTime), 14, 98)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (137, N'Kol düğmeleri.. saat demiyorum cünkü olmazsa olmazdır

', CAST(N'2019-05-12 11:44:39.643' AS DateTime), 15, 99)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (138, N'Karpuz..

', CAST(N'2019-05-12 11:46:14.290' AS DateTime), 13, 100)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (139, N'kiraz vişne

', CAST(N'2019-05-12 11:46:25.683' AS DateTime), 14, 100)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (140, N'göbeğim gibi bir karpuz ', CAST(N'2019-05-12 11:46:35.927' AS DateTime), 15, 100)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (141, N'Şeftali', CAST(N'2019-05-12 11:46:51.247' AS DateTime), 11, 100)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (142, N'Kenyalıyım ben. Maraton koşucularımız atletlerimiz sporcularımız meşhur

', CAST(N'2019-05-12 11:48:16.263' AS DateTime), 12, 101)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (143, N'Kayısı ', CAST(N'2019-05-12 11:48:51.637' AS DateTime), 13, 101)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (144, N'düğüne harcayacağım parayla yurt dışında kaliteli bir tatil isterim

', CAST(N'2019-05-12 11:51:42.240' AS DateTime), 14, 102)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (145, N'Salonda isterdim de aile kalabalık, ama çözüm vardır illa

', CAST(N'2019-05-12 11:51:53.513' AS DateTime), 16, 102)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (146, N'Her sene aldigim hediyeyi begenmiyor ya  yarin kahvalti ismarlicam guzel bir yerde

', CAST(N'2019-05-12 11:53:35.593' AS DateTime), 15, 103)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (147, N'Telefon almayı düşünüyorum.

', CAST(N'2019-05-12 11:53:55.683' AS DateTime), 11, 103)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (148, N'hiçbir şey

', CAST(N'2019-05-12 11:54:10.990' AS DateTime), 13, 103)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (149, N'Bilezik

', CAST(N'2019-05-12 11:54:37.257' AS DateTime), 15, 103)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (150, N'Gösterişci.

', CAST(N'2019-05-12 11:56:15.263' AS DateTime), 14, 104)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (151, N'Uzun saç erkeklere ayrı bir hava katıyor. Daha bir karizmatik oluyorlar

', CAST(N'2019-05-12 11:56:30.797' AS DateTime), 12, 104)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (152, N'Kadına benzememek şartı ile çokta uzun olmadan iyi olur Sünnet sonuçta', CAST(N'2019-05-12 11:57:11.760' AS DateTime), 11, 104)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (153, N'Uzun saç vazgeçilmez tutkum.

', CAST(N'2019-05-12 11:58:03.130' AS DateTime), 15, 105)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (154, N'Uzun saç tercihim ama çok uzunda değil

', CAST(N'2019-05-12 11:58:18.980' AS DateTime), 14, 105)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (155, N'Aamir ve Salman Khan pişman olmazsın. Aamirden 3 idiots, salman dan ise sevginin gücü. Ayrıca Esaretin Bedeli de çok iyi', CAST(N'2019-05-12 12:01:04.870' AS DateTime), 11, 106)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (156, N'Leonardo di caprionun ne zindanları diye bir filmi var izlemesen öl

', CAST(N'2019-05-12 12:01:20.500' AS DateTime), 13, 106)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (157, N'Kankaaa cennet mahallesi izle ben Şu an onu izliyorum skskskssısısıs

', CAST(N'2019-05-12 12:01:31.023' AS DateTime), 15, 106)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (158, N'Atın intikamı

', CAST(N'2019-05-12 12:01:47.430' AS DateTime), 16, 106)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (159, N'Alım gücü yok dereceye vardı, bankalar icralara başlarsa hırsızlıklar ve intiharlar her geçen gün artacak. Allah korusun.!

', CAST(N'2019-05-12 12:02:51.607' AS DateTime), 15, 107)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (160, N'Tübitak soğan ve patatesleri otomatik soyacak öğrenci keşfedene dek böyleyiz

', CAST(N'2019-05-12 12:03:21.163' AS DateTime), 14, 107)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (161, N'Ben de alışverişe gidiyorum.. ', CAST(N'2019-05-12 12:05:37.867' AS DateTime), 12, 108)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (162, N'Bu siteyi yaparak :D', CAST(N'2019-05-12 12:06:03.937' AS DateTime), 11, 108)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (163, N'Kocaeli ama memnun degilim

', CAST(N'2019-05-12 12:09:49.423' AS DateTime), 13, 109)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (164, N'Karabük

', CAST(N'2019-05-12 12:10:01.950' AS DateTime), 14, 109)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (165, N'Bursa', CAST(N'2019-05-12 12:10:12.903' AS DateTime), 15, 109)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (166, N'Zonguldak', CAST(N'2019-05-12 12:10:33.830' AS DateTime), 16, 109)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (167, N'isviçre', CAST(N'2019-05-12 12:10:47.650' AS DateTime), 12, 109)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (168, N'11 yıldır var...
Bakıyorumda yorumlara hala ehliyeti olmayanlar var ne kadar üzücü bir durum bence şart', CAST(N'2019-05-12 12:19:03.500' AS DateTime), 13, 110)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (169, N'Hayır, ama bu 2 ay sonra almayı düşünüyorum inşallah ', CAST(N'2019-05-12 12:19:17.413' AS DateTime), 11, 110)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (170, N'Araç için var sadece ama motor içinde alıcam ilerde

', CAST(N'2019-05-12 12:19:36.823' AS DateTime), 14, 110)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (171, N'evdeysem sıkıntı yokda dışarda susuyorum', CAST(N'2019-05-12 12:29:26.580' AS DateTime), 12, 111)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (173, N'Allah yardım ediyor ya', CAST(N'2019-05-12 12:29:43.570' AS DateTime), 13, 111)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (174, N'<p>havalar &ccedil;ok sıcak değil ya g&ouml;z&uuml;m sıkıntı yok hallediyoruz bi şekilde</p>', CAST(N'2019-05-12 12:38:57.357' AS DateTime), 10, 111)
INSERT [dbo].[tblYorumlar] ([Yorumid], [Yorum], [Tarih], [Kisiid], [Konuid]) VALUES (175, N'<p>daha 18 girmedim ağustosu bekliyom hayırlısıya alırız annem</p>', CAST(N'2019-05-12 12:39:41.490' AS DateTime), 10, 110)
SET IDENTITY_INSERT [dbo].[tblYorumlar] OFF
ALTER TABLE [dbo].[tblKonular]  WITH CHECK ADD  CONSTRAINT [FK_tblKonular_tblKategoriler] FOREIGN KEY([Kategoriid])
REFERENCES [dbo].[tblKategoriler] ([Kategoriid])
GO
ALTER TABLE [dbo].[tblKonular] CHECK CONSTRAINT [FK_tblKonular_tblKategoriler]
GO
ALTER TABLE [dbo].[tblKonular]  WITH CHECK ADD  CONSTRAINT [FK_tblKonular_tblKisiler] FOREIGN KEY([Kisiid])
REFERENCES [dbo].[tblKisiler] ([Kisiid])
GO
ALTER TABLE [dbo].[tblKonular] CHECK CONSTRAINT [FK_tblKonular_tblKisiler]
GO
ALTER TABLE [dbo].[tblYorumlar]  WITH CHECK ADD  CONSTRAINT [FK_tblYorumlar_tblKisiler] FOREIGN KEY([Kisiid])
REFERENCES [dbo].[tblKisiler] ([Kisiid])
GO
ALTER TABLE [dbo].[tblYorumlar] CHECK CONSTRAINT [FK_tblYorumlar_tblKisiler]
GO
ALTER TABLE [dbo].[tblYorumlar]  WITH CHECK ADD  CONSTRAINT [FK_tblYorumlar_tblKonular] FOREIGN KEY([Konuid])
REFERENCES [dbo].[tblKonular] ([Konuid])
GO
ALTER TABLE [dbo].[tblYorumlar] CHECK CONSTRAINT [FK_tblYorumlar_tblKonular]
GO
USE [master]
GO
ALTER DATABASE [1294_FurkanYasar] SET  READ_WRITE 
GO
