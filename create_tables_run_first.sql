-- Create Wind Table


USE [StarSchema]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Wind](
	[IdWind] [int] IDENTITY(1,1) NOT NULL,
	[windSpeed] [int] NULL,
	[windRun] [decimal](18, 0) NULL,
	[windChill] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdWind] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Create Weather Table


USE [StarSchema]
GO

/****** Object:  Table [dbo].[Weather]    Script Date: 09/06/2022 10:54:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Weather](
	[IdWeather] [int] IDENTITY(1,1) NOT NULL,
	[hiTemp] [decimal](18, 0) NULL,
	[lowTemp] [decimal](18, 0) NULL,
	[avgTemp] [decimal](18, 0) NULL,
	[humidity] [int] NULL,
	[heatIndex] [decimal](18, 0) NULL,
	[bar] [decimal](18, 0) NULL,
	[rainfall] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdWeather] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Create Time Table


USE [StarSchema]
GO

/****** Object:  Table [dbo].[Time]    Script Date: 09/06/2022 10:54:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Time](
	[IdTime] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NULL,
	[month] [int] NULL,
	[hour] [int] NULL,
	[time] [time](0) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Create Site Table


USE [StarSchema]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Site](
	[IdSite] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSite] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


-- Create Energy Table


USE [StarSchema]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Energy](
	[IdEnergy] [int] IDENTITY(1,1) NOT NULL,
	[IdSite] [int] NULL,
	[IdTime] [int] NULL,
	[IdWeather] [int] NULL,
	[IdWind] [int] NULL,
	[solarRad] [int] NULL,
	[energyProd] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEnergy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Energy]  WITH CHECK ADD  CONSTRAINT [FK_IdSite] FOREIGN KEY([IdSite])
REFERENCES [dbo].[Site] ([IdSite])
GO

ALTER TABLE [dbo].[Energy] CHECK CONSTRAINT [FK_IdSite]
GO

ALTER TABLE [dbo].[Energy]  WITH CHECK ADD  CONSTRAINT [FK_IdTime] FOREIGN KEY([IdTime])
REFERENCES [dbo].[Time] ([IdTime])
GO

ALTER TABLE [dbo].[Energy] CHECK CONSTRAINT [FK_IdTime]
GO

ALTER TABLE [dbo].[Energy]  WITH CHECK ADD  CONSTRAINT [FK_IdWeather] FOREIGN KEY([IdWeather])
REFERENCES [dbo].[Weather] ([IdWeather])
GO

ALTER TABLE [dbo].[Energy] CHECK CONSTRAINT [FK_IdWeather]
GO

ALTER TABLE [dbo].[Energy]  WITH CHECK ADD  CONSTRAINT [FK_IdWind] FOREIGN KEY([IdWind])
REFERENCES [dbo].[Wind] ([IdWind])
GO

ALTER TABLE [dbo].[Energy] CHECK CONSTRAINT [FK_IdWind]
GO





