USE [master]
GO
/****** Object:  Database [Hastane Randevu Sistemi]    Script Date: 16.07.2024 03:31:19 ******/
CREATE DATABASE [Hastane Randevu Sistemi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hastane Randevu Sistemi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Hastane Randevu Sistemi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hastane Randevu Sistemi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Hastane Randevu Sistemi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hastane Randevu Sistemi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET RECOVERY FULL 
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET  MULTI_USER 
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Hastane Randevu Sistemi', N'ON'
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET QUERY_STORE = ON
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Hastane Randevu Sistemi]
GO
/****** Object:  Table [dbo].[Departman]    Script Date: 16.07.2024 03:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departman](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[isim] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doktor]    Script Date: 16.07.2024 03:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doktor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Doktor] [nvarchar](50) NOT NULL,
	[Departman id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uygun Randevular]    Script Date: 16.07.2024 03:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uygun Randevular](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Tarih] [smalldatetime] NOT NULL,
	[Doktor id] [int] NOT NULL,
	[Uygun mu] [bit] NOT NULL,
	[HastaID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Uygun Randevular View]    Script Date: 16.07.2024 03:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Uygun Randevular View]
AS
SELECT uygun.id, uygun.Tarih, uygun.[Doktor id], doktor.Doktor, doktor.[Departman id], dep.isim
FROM     dbo.Departman AS dep INNER JOIN
                  dbo.Doktor AS doktor ON dep.id = doktor.[Departman id] INNER JOIN
                  dbo.[Uygun Randevular] AS uygun ON doktor.id = uygun.[Doktor id] AND uygun.[Uygun mu] = 1
GO
/****** Object:  Table [dbo].[Hastalar]    Script Date: 16.07.2024 03:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hastalar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Hasta Adi] [nvarchar](50) NOT NULL,
	[Randevu id] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Departman] ON 

INSERT [dbo].[Departman] ([id], [isim]) VALUES (1, N'Kulak Burun Boğaz')
INSERT [dbo].[Departman] ([id], [isim]) VALUES (2, N'Göz Hastalıkları')
INSERT [dbo].[Departman] ([id], [isim]) VALUES (3, N'İç Hastalıkları')
INSERT [dbo].[Departman] ([id], [isim]) VALUES (4, N'Psikiyatri')
INSERT [dbo].[Departman] ([id], [isim]) VALUES (5, N'Kardiyoloji')
INSERT [dbo].[Departman] ([id], [isim]) VALUES (6, N'Cildiye')
SET IDENTITY_INSERT [dbo].[Departman] OFF
GO
SET IDENTITY_INSERT [dbo].[Doktor] ON 

INSERT [dbo].[Doktor] ([id], [Doktor], [Departman id]) VALUES (2, N'Tarık Demir', 1)
INSERT [dbo].[Doktor] ([id], [Doktor], [Departman id]) VALUES (3, N'Osman Gündüz', 2)
INSERT [dbo].[Doktor] ([id], [Doktor], [Departman id]) VALUES (4, N'Mahsun Karaca', 3)
INSERT [dbo].[Doktor] ([id], [Doktor], [Departman id]) VALUES (5, N'Gülsüm Bulut', 4)
INSERT [dbo].[Doktor] ([id], [Doktor], [Departman id]) VALUES (7, N'Mehmet Ali Yazar', 5)
INSERT [dbo].[Doktor] ([id], [Doktor], [Departman id]) VALUES (8, N'Zeynep Karaca', 6)
INSERT [dbo].[Doktor] ([id], [Doktor], [Departman id]) VALUES (9, N'Hasan Ali Yücel', 1)
INSERT [dbo].[Doktor] ([id], [Doktor], [Departman id]) VALUES (10, N'İrem Yazar', 1)
SET IDENTITY_INSERT [dbo].[Doktor] OFF
GO
SET IDENTITY_INSERT [dbo].[Hastalar] ON 

INSERT [dbo].[Hastalar] ([id], [Hasta Adi], [Randevu id]) VALUES (1, N'Hasta1', NULL)
INSERT [dbo].[Hastalar] ([id], [Hasta Adi], [Randevu id]) VALUES (2, N'Hasta2', NULL)
INSERT [dbo].[Hastalar] ([id], [Hasta Adi], [Randevu id]) VALUES (3, N'Hasta3', NULL)
INSERT [dbo].[Hastalar] ([id], [Hasta Adi], [Randevu id]) VALUES (4, N'Hasta4', NULL)
INSERT [dbo].[Hastalar] ([id], [Hasta Adi], [Randevu id]) VALUES (5, N'Hasta5', NULL)
INSERT [dbo].[Hastalar] ([id], [Hasta Adi], [Randevu id]) VALUES (6, N'Hasta6', NULL)
INSERT [dbo].[Hastalar] ([id], [Hasta Adi], [Randevu id]) VALUES (7, N'Hasta7', NULL)
INSERT [dbo].[Hastalar] ([id], [Hasta Adi], [Randevu id]) VALUES (8, N'Hasta8', NULL)
INSERT [dbo].[Hastalar] ([id], [Hasta Adi], [Randevu id]) VALUES (9, N'Hasta9', NULL)
INSERT [dbo].[Hastalar] ([id], [Hasta Adi], [Randevu id]) VALUES (10, N'Hasta10', NULL)
SET IDENTITY_INSERT [dbo].[Hastalar] OFF
GO
SET IDENTITY_INSERT [dbo].[Uygun Randevular] ON 

INSERT [dbo].[Uygun Randevular] ([id], [Tarih], [Doktor id], [Uygun mu], [HastaID]) VALUES (1, CAST(N'2024-07-15T09:00:00' AS SmallDateTime), 3, 1, NULL)
INSERT [dbo].[Uygun Randevular] ([id], [Tarih], [Doktor id], [Uygun mu], [HastaID]) VALUES (2, CAST(N'2024-07-15T10:00:00' AS SmallDateTime), 9, 1, NULL)
INSERT [dbo].[Uygun Randevular] ([id], [Tarih], [Doktor id], [Uygun mu], [HastaID]) VALUES (3, CAST(N'2024-07-15T11:00:00' AS SmallDateTime), 7, 1, NULL)
INSERT [dbo].[Uygun Randevular] ([id], [Tarih], [Doktor id], [Uygun mu], [HastaID]) VALUES (5, CAST(N'2024-07-15T12:00:00' AS SmallDateTime), 8, 1, NULL)
INSERT [dbo].[Uygun Randevular] ([id], [Tarih], [Doktor id], [Uygun mu], [HastaID]) VALUES (7, CAST(N'2024-07-15T13:00:00' AS SmallDateTime), 4, 1, NULL)
INSERT [dbo].[Uygun Randevular] ([id], [Tarih], [Doktor id], [Uygun mu], [HastaID]) VALUES (10, CAST(N'2024-07-15T14:00:00' AS SmallDateTime), 2, 1, NULL)
INSERT [dbo].[Uygun Randevular] ([id], [Tarih], [Doktor id], [Uygun mu], [HastaID]) VALUES (11, CAST(N'2024-07-15T15:00:00' AS SmallDateTime), 5, 1, NULL)
INSERT [dbo].[Uygun Randevular] ([id], [Tarih], [Doktor id], [Uygun mu], [HastaID]) VALUES (12, CAST(N'2024-07-15T16:00:00' AS SmallDateTime), 10, 1, NULL)
SET IDENTITY_INSERT [dbo].[Uygun Randevular] OFF
GO
/****** Object:  StoredProcedure [dbo].[Randevu Al]    Script Date: 16.07.2024 03:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[Randevu Al]
	@HastaID INT,
    @RandevuID INT
AS
BEGIN
	UPDATE [Uygun Randevular]
	SET [Uygun mu] = 0, HastaID = @HastaID
	WHERE [Uygun Randevular].id = @RandevuID;
END;
--EXEC [Uygun Randevuları Getir] @DepartmanId = 2, @Tarih1 = '2024-07-14', @Tarih2 = '2024-07-16';

--EXEC [Randevu Al] @HastaID = 2, @RandevuID = 3;

--EXEC [Randevu Iptal] @HastaID = 2, @RandevuID = 3;
GO
/****** Object:  StoredProcedure [dbo].[Randevu Iptal]    Script Date: 16.07.2024 03:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE       PROCEDURE [dbo].[Randevu Iptal]
	@HastaID INT,
    @RandevuID INT
AS
BEGIN
	UPDATE [Uygun Randevular]
	SET [Uygun mu] = 1, HastaID = NULL
	WHERE [Uygun Randevular].id = @RandevuID;

	UPDATE [Hastalar]
	SET [Randevu id] = NULL
	WHERE [Hastalar].id = @HastaID;
END;
GO
/****** Object:  StoredProcedure [dbo].[Uygun Randevuları Getir]    Script Date: 16.07.2024 03:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[Uygun Randevuları Getir]
    @DepartmanId INT,
	@Tarih1 smalldatetime,
	@Tarih2 smalldatetime
AS
BEGIN
    SELECT
        uygun.[id] AS RandevuId,
        uygun.[Tarih] AS RandevuTarihi,
        uygun.[Doktor id] AS DoktorId,
        doktor.[Doktor] AS DoktorAdi,
        doktor.[Departman id] AS DepartmanId,
        dep.[isim] AS DepartmanAdi
    FROM
        Departman dep
    INNER JOIN
        [Doktor] doktor ON dep.id = doktor.[Departman id]
    INNER JOIN
        [Uygun Randevular] uygun ON doktor.id = uygun.[Doktor id] AND uygun.[Uygun mu]=1
    WHERE
        dep.id = @DepartmanId AND uygun.Tarih BETWEEN @Tarih1 and @Tarih2;
END;
GO
/****** Object:  Trigger [dbo].[triggerHastayaRandevuAta]    Script Date: 16.07.2024 03:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   TRIGGER [dbo].[triggerHastayaRandevuAta]
ON [dbo].[Uygun Randevular]
AFTER UPDATE
AS
BEGIN
    DECLARE @HastaID INT, @RandevuID INT;
	SELECT @HastaID = [HastaID], @RandevuID = id from inserted;

    UPDATE Hastalar SET [Randevu id] = @RandevuID WHERE Hastalar.id = @HastaID;
END;
GO
ALTER TABLE [dbo].[Uygun Randevular] ENABLE TRIGGER [triggerHastayaRandevuAta]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "dep"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 126
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "doktor"
            Begin Extent = 
               Top = 126
               Left = 48
               Bottom = 267
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "uygun"
            Begin Extent = 
               Top = 273
               Left = 48
               Bottom = 436
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Uygun Randevular View'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Uygun Randevular View'
GO
USE [master]
GO
ALTER DATABASE [Hastane Randevu Sistemi] SET  READ_WRITE 
GO
