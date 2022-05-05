CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[FirstName] [nvarchar](256) NOT NULL,
	[LastName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [uniqueidentifier] NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurants](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Street] [nvarchar](100) NOT NULL,
	[ZipCode] [char](5) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[Phone] [varchar](20) NULL,
	[ImageUrl] [varchar](1000) NULL,
	[WebSite] [varchar](1000) NULL,
 CONSTRAINT [PK_Restaurants] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [FirstName], [LastName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'7e8e8970-1eb1-4f79-9f8e-08da2c14fc25', N'marco.minerva@gmail.com', N'MARCO.MINERVA@GMAIL.COM', N'Marco', N'Minerva', N'marco.minerva@gmail.com', N'MARCO.MINERVA@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEMOuOtMnT7MLCeykhKnLtY5n8n8q3xJuOSV6iw+qNe/+hIV2XGDFvxdgKaSBhBRZ8Q==', N'GAOTPON6HJQUZVLEEA6NZUJZTZIU3UKV', N'b7540b00-7ee7-4183-9530-89a4de3c44d9', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[Restaurants] ([Id], [Name], [Street], [ZipCode], [City], [Phone], [ImageUrl], [WebSite]) VALUES (N'093be30a-4908-42b4-9578-078f700490da', N'My Dream - Ristorante & Pizzeria', N'Via Lungomare 100', N'18018', N'Arma di Taggia', N'0184 460234
', N'https://media-cdn.tripadvisor.com/media/photo-s/0b/a7/8f/1e/my-dream-ristorante-pizzeria.jpg', N'https://www.tripadvisor.it/Restaurant_Review-g1400557-d10159661-Reviews-My_Dream_Ristorante_Pizzeria-Arma_di_Taggia_Italian_Riviera_Liguria.html')
GO
INSERT [dbo].[Restaurants] ([Id], [Name], [Street], [ZipCode], [City], [Phone], [ImageUrl], [WebSite]) VALUES (N'87d21c2d-fa18-4a76-84ec-0986ae21439f', N'I Portici', N'Via Soleri 14', N'18018', N'Taggia', N'0184 462007', N'https://media-cdn.tripadvisor.com/media/photo-s/14/98/89/c6/tavolate-sotto-i-portici.jpg', N'https://www.facebook.com/I-Portici-144037015705203/')
GO
INSERT [dbo].[Restaurants] ([Id], [Name], [Street], [ZipCode], [City], [Phone], [ImageUrl], [WebSite]) VALUES (N'ce451da6-91e0-4286-b1c2-0a6d8850fc5e', N'12 Apostoli', N'Corticella San Marco 3', N'37121', N'Verona', NULL, N'https://www.12apostoli.com/assets/img/banner/1920/storia_famiglia_1.jpg', N'https://www.12apostoli.com/')
GO
INSERT [dbo].[Restaurants] ([Id], [Name], [Street], [ZipCode], [City], [Phone], [ImageUrl], [WebSite]) VALUES (N'5f8898f1-5b3f-4d6f-8fcc-1888bbc893ae', N'Casa Perbellini', N'Piazza San Zeno 16', N'37121', N'Verona', NULL, N'https://www.casaperbellini.com/wp-content/uploads/2014/05/fronte.jpg', N'https://www.casaperbellini.com/en/')
GO
INSERT [dbo].[Restaurants] ([Id], [Name], [Street], [ZipCode], [City], [Phone], [ImageUrl], [WebSite]) VALUES (N'3326cfa6-7dd2-4a4d-a4dc-1d6f0a118bd6', N'Ristorante Pizzeria La Darsena', N'Via Lungomare 213', N'18018', N'Arma di Taggia', N'0184 43579
', N'https://media-cdn.tripadvisor.com/media/photo-s/0a/b6/67/9d/la-darsena-ac.jpg', N'https://www.facebook.com/pages/category/Pizza-Place/Ristorante-Pizzeria-La-Darsena-Arma-di-Taggia-131118086961579/')
GO
INSERT [dbo].[Restaurants] ([Id], [Name], [Street], [ZipCode], [City], [Phone], [ImageUrl], [WebSite]) VALUES (N'51f4eea6-4258-40db-b4f8-20f3057a9dee', N'Gallo''s & Co', N'Via Piave, 30', N'37069', N'Villafranca di Verona', NULL, N'https://www.gallos.it/wp-content/uploads/2020/12/villafranca_inner_.jpg', N'https://www.gallos.it/villafranca/')
GO
INSERT [dbo].[Restaurants] ([Id], [Name], [Street], [ZipCode], [City], [Phone], [ImageUrl], [WebSite]) VALUES (N'44228c29-e254-45f4-8456-21122b660fc4', N'Ristorante Da Rocco', N'Strada Villetta', N'18038', N'Sanremo', N'0184 503208', N'https://th.bing.com/th/id/R.20c4c00085033c4a7f71c1456b21f462?rik=%2bBNxsbBQtBRWvA&riu=http%3a%2f%2fwww.hotelrocco.it%2fimg%2fgallery_ristorante_01.jpg&ehk=fE7nAqpileEMZ%2b1YKOByW36MNmh9zSS1bQ%2faIOFCSqg%3d&risl=&pid=ImgRaw&r=0', N'https://www.facebook.com/pages/Ristorante-Da-Rocco/130870023733965')
GO
INSERT [dbo].[Restaurants] ([Id], [Name], [Street], [ZipCode], [City], [Phone], [ImageUrl], [WebSite]) VALUES (N'4460163a-7daf-4754-a989-386480dfa7b7', N'Ristorante Castelin', N'Via Roma 9', N'18018', N'Taggia', N'0184 475500
', N'https://media-cdn.tripadvisor.com/media/photo-s/0b/84/e1/41/interno-del-bar.jpg', N'https://www.facebook.com/RistoranteCastelin')
GO
INSERT [dbo].[Restaurants] ([Id], [Name], [Street], [ZipCode], [City], [Phone], [ImageUrl], [WebSite]) VALUES (N'd1e72cd3-873b-4d9e-a7fb-3c4dcbd98e28', N'Ristorante Pizzeria Napoletana', N'Via Cristoforo Colombo 280', N'18018', N'Arma di Taggia', N'0184 448433
', N'https://media-cdn.tripadvisor.com/media/photo-s/0d/5b/4d/21/da-cassini-a.jpg', N'https://www.tripadvisor.it/Restaurant_Review-g1400557-d2297138-Reviews-Ristorante_Pizzeria_Napoletana-Arma_di_Taggia_Italian_Riviera_Liguria.html')
GO
INSERT [dbo].[Restaurants] ([Id], [Name], [Street], [ZipCode], [City], [Phone], [ImageUrl], [WebSite]) VALUES (N'fc57357e-5ae5-4be4-8bc1-47f033c1601f', N'Ristorante Pizzeria Tre Poli', N'Via Privata Rio Masso 41', N'18038', N'Sanremo', N'0184 660711', N'https://fastly.4sqi.net/img/general/width960/QWG1UW341X2LADW4LDCZMM4KGS2SMFGZJ5DHAEQ0V5YU5EP3.jpg', N'https://www.ristorantetrepoli.it/')
GO
INSERT [dbo].[Restaurants] ([Id], [Name], [Street], [ZipCode], [City], [Phone], [ImageUrl], [WebSite]) VALUES (N'b474dc2a-e7d9-4887-8274-4e7edb9967c0', N'Ristorante Pizzeria Solidago', N'Traversa I Stazione 24', N'18018', N'Arma di Taggia', N'0184 43108
', N'http://www.solidagohotel.com/images/sala_1.jpg', N'http://www.solidagohotel.com/')
GO
INSERT [dbo].[Restaurants] ([Id], [Name], [Street], [ZipCode], [City], [Phone], [ImageUrl], [WebSite]) VALUES (N'60d99ed7-6a48-4a1e-ba30-539a75ee7723', N'Al bersagliere', N'Via Dietro Pallone 1', N'37121', N'Verona', NULL, N'http://www.trattoriaalbersagliere.it/wp-content/uploads/2019/09/famiglia-ramponi-04-150x150.jpg', N'http://www.trattoriaalbersagliere.it/
')
GO
INSERT [dbo].[Restaurants] ([Id], [Name], [Street], [ZipCode], [City], [Phone], [ImageUrl], [WebSite]) VALUES (N'b35edd4b-4c89-4a6a-8372-5468cab2c1fc', N'Ristorante Pizzeria Punta Mare', N'Via Lungomare 1', N'18018', N'Arma di Taggia', N'0184 43510', N'https://media-cdn.tripadvisor.com/media/photo-s/01/f3/72/54/caption.jpg', N'https://www.tripadvisor.it/Restaurant_Review-g1400557-d2230335-Reviews-Ristorante_Pizzeria_Punta_Mare-Arma_di_Taggia_Italian_Riviera_Liguria.html')
GO
INSERT [dbo].[Restaurants] ([Id], [Name], [Street], [ZipCode], [City], [Phone], [ImageUrl], [WebSite]) VALUES (N'd979f9b8-dca0-4690-a58a-64a5171b03d3', N'Mexì', N'Via Staffali 20', N'37062', N'Dossobuono', NULL, N'https://mexi.it/download/decv/196/header-contatti.jpg?20180302171813', N'https://mexi.it/')
GO
INSERT [dbo].[Restaurants] ([Id], [Name], [Street], [ZipCode], [City], [Phone], [ImageUrl], [WebSite]) VALUES (N'2d2807f1-f759-4db1-983c-7de79d82b26a', N'Hostaria la Diligenza', N'Via Al Mare 125', N'18038', N'Bussana', N'0184 513022', N'https://media-cdn.tripadvisor.com/media/photo-s/06/6c/f8/bd/sala-interna-con-forno.jpg', N'https://www.facebook.com/Hostaria-della-diligenza-380337258806027/')
GO
INSERT [dbo].[Restaurants] ([Id], [Name], [Street], [ZipCode], [City], [Phone], [ImageUrl], [WebSite]) VALUES (N'5435e802-296f-442e-9bba-85cd1409427a', N'Sinfonia Ristorante Pizzeria Live Music', N'Via Biancheri 24', N'18038', N'Bussana', N'0184 633590
', N'https://fastly.4sqi.net/img/general/width960/55714239_9UtdfsOBEC0ANkHn08hy9UsN5npWVF0xauFFFGJy6Ww.jpg', N'https://www.facebook.com/sinfoniabussana')
GO
INSERT [dbo].[Restaurants] ([Id], [Name], [Street], [ZipCode], [City], [Phone], [ImageUrl], [WebSite]) VALUES (N'ae9ae971-6554-4a5f-9530-88c798dad060', N'La Conchiglia', N'Via Lungomare 33', N'18018', N'Arma di Taggia', N'0184 43169
', N'https://www.buongiornogourmet.it/wp-content/uploads/2020/05/IMG_20200524_193935-1024x506.jpg', N'https://www.facebook.com/RistoranteLaConchigliaArmadiTaggia')
GO
INSERT [dbo].[Restaurants] ([Id], [Name], [Street], [ZipCode], [City], [Phone], [ImageUrl], [WebSite]) VALUES (N'7dc8e9ec-3852-4f8d-b14b-95f9c1d78c90', N'Gourmet
', N'Via Staffali, 42', N'37062', N'Dossobuono', NULL, N'https://www.gourmetpizzaecucina.com/data/files/clm/84/slide1_1920_1920.jpg', N'https://www.gourmetpizzaecucina.com/')
GO
INSERT [dbo].[Restaurants] ([Id], [Name], [Street], [ZipCode], [City], [Phone], [ImageUrl], [WebSite]) VALUES (N'a89fca91-21d2-471d-a0d9-9c6f32311ee3', N'L''Airone', N'Piazza Eroi Sanremesi 12', N'18038', N'Sanremo', N'0184 531469', N'http://1.bp.blogspot.com/-u5s_13DX4Lk/VJ2NfkpvNZI/AAAAAAAAPkI/VJgAdDV61z0/s1600/DSC_0034.JPG', N'http://www.ristorantelairone.it/')
GO
INSERT [dbo].[Restaurants] ([Id], [Name], [Street], [ZipCode], [City], [Phone], [ImageUrl], [WebSite]) VALUES (N'431f5bab-ccad-43b1-968c-c96c735d520a', N'Osteria del Cavallo Bianco', N'Via Rimembranza, 4', N'18018', N'Taggia', N'0184 460124
', N'https://media-cdn.tripadvisor.com/media/photo-s/09/95/35/ca/20151122-130521-largejpg.jpg', N'https://latopinadellavalleargentina.wordpress.com/2012/12/06/osteria-cavallo-bianco')
GO
INSERT [dbo].[Restaurants] ([Id], [Name], [Street], [ZipCode], [City], [Phone], [ImageUrl], [WebSite]) VALUES (N'4a04ab60-4bb0-4c9f-aa31-e3530fae38ea', N'Ristorante Hotel Roma', N'Via della Cornice 10', N'18018', N'Arma di Taggia', N'0184 43076
', N'https://th.bing.com/th/id/R.0b479fffc29e713413bb01a1b8f1d4f2?rik=rDVgDUnSVhqEiA&riu=http%3a%2f%2fmedia-cdn.tripadvisor.com%2fmedia%2fphoto-s%2f02%2f8f%2fa9%2fa1%2fristorante-roma.jpg&ehk=rDodMsQtQvmVGsmKlO17kwzXdEX1AvGWbRHeK0AOlAI%3d&risl=&pid=ImgRaw&r=0', N'http://www.albergoroma-franco.it/')
GO
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
