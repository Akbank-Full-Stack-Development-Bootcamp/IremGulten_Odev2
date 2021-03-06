USE [Library]
GO
/****** Object:  Table [dbo].[Editorler]    Script Date: 10.06.2021 23:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editorler](
	[EditorID] [int] IDENTITY(1,1) NOT NULL,
	[EditorAd] [nvarchar](15) NOT NULL,
	[EditorSoyad] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Editorler] PRIMARY KEY CLUSTERED 
(
	[EditorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kitaplar]    Script Date: 10.06.2021 23:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kitaplar](
	[KitapID] [int] IDENTITY(1,1) NOT NULL,
	[KitapAd] [nvarchar](50) NOT NULL,
	[YazarID] [int] NOT NULL,
	[TurID] [int] NOT NULL,
	[EditorID] [int] NOT NULL,
	[YayineviID] [int] NOT NULL,
	[SayfaSayisi] [int] NOT NULL,
	[KitapKonusu] [nvarchar](350) NULL,
 CONSTRAINT [PK_Kitaplar] PRIMARY KEY CLUSTERED 
(
	[KitapID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KitaplarTurler]    Script Date: 10.06.2021 23:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KitaplarTurler](
	[KitapID] [int] NOT NULL,
	[TurID] [int] NOT NULL,
 CONSTRAINT [PK_KitaplarTurler] PRIMARY KEY CLUSTERED 
(
	[KitapID] ASC,
	[TurID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turler]    Script Date: 10.06.2021 23:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turler](
	[TurId] [int] IDENTITY(1,1) NOT NULL,
	[TurAd] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Turler] PRIMARY KEY CLUSTERED 
(
	[TurId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yayinevleri]    Script Date: 10.06.2021 23:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yayinevleri](
	[YayineviID] [int] IDENTITY(1,1) NOT NULL,
	[YayineviAd] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_Yayinevleri] PRIMARY KEY CLUSTERED 
(
	[YayineviID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yazarlar]    Script Date: 10.06.2021 23:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yazarlar](
	[YazarID] [int] IDENTITY(1,1) NOT NULL,
	[YazarName] [nvarchar](20) NOT NULL,
	[YazarSurname] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Yazarlar] PRIMARY KEY CLUSTERED 
(
	[YazarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Kitaplar]  WITH CHECK ADD  CONSTRAINT [FK_Kitaplar_Editorler] FOREIGN KEY([EditorID])
REFERENCES [dbo].[Editorler] ([EditorID])
GO
ALTER TABLE [dbo].[Kitaplar] CHECK CONSTRAINT [FK_Kitaplar_Editorler]
GO
ALTER TABLE [dbo].[Kitaplar]  WITH CHECK ADD  CONSTRAINT [FK_Kitaplar_Yayinevleri] FOREIGN KEY([YayineviID])
REFERENCES [dbo].[Yayinevleri] ([YayineviID])
GO
ALTER TABLE [dbo].[Kitaplar] CHECK CONSTRAINT [FK_Kitaplar_Yayinevleri]
GO
ALTER TABLE [dbo].[Kitaplar]  WITH CHECK ADD  CONSTRAINT [FK_Kitaplar_Yazarlar] FOREIGN KEY([YazarID])
REFERENCES [dbo].[Yazarlar] ([YazarID])
GO
ALTER TABLE [dbo].[Kitaplar] CHECK CONSTRAINT [FK_Kitaplar_Yazarlar]
GO
ALTER TABLE [dbo].[KitaplarTurler]  WITH CHECK ADD  CONSTRAINT [FK_KitaplarTurler_Kitaplar] FOREIGN KEY([KitapID])
REFERENCES [dbo].[Kitaplar] ([KitapID])
GO
ALTER TABLE [dbo].[KitaplarTurler] CHECK CONSTRAINT [FK_KitaplarTurler_Kitaplar]
GO
ALTER TABLE [dbo].[KitaplarTurler]  WITH CHECK ADD  CONSTRAINT [FK_KitaplarTurler_Turler] FOREIGN KEY([TurID])
REFERENCES [dbo].[Turler] ([TurId])
GO
ALTER TABLE [dbo].[KitaplarTurler] CHECK CONSTRAINT [FK_KitaplarTurler_Turler]
GO
