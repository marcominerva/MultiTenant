CREATE TABLE [dbo].[Restaurants](
	[Id] UNIQUEIDENTIFIER NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Street] [nvarchar](100) NOT NULL,
	[ZipCode] [char](5) NOT NULL,
	[City] VARCHAR(50) NOT NULL,
	[Phone] [varchar](20) NULL,
	[ImageUrl] [varchar](1000) NULL,
	[WebSite] [varchar](1000) NULL,
 CONSTRAINT [PK_Restaurants] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
))
GO