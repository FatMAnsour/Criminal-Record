USE [CriminalRecord]
GO
/****** Object:  Table [dbo].[Administrator]    Script Date: 1/5/2022 1:55:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Administrator](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[pass] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[criminal]    Script Date: 1/5/2022 1:55:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[criminal](
	[criminal_id] [int] IDENTITY(1,1) NOT NULL,
	[criminal_dob] [varchar](50) NOT NULL,
	[criminal_address] [varchar](100) NOT NULL,
	[criminal_FN] [varchar](50) NOT NULL,
	[criminal_MN] [varchar](50) NOT NULL,
	[criminal_LN] [varchar](50) NOT NULL,
	[blood_type] [varchar](5) NULL,
	[body_build] [varchar](1000) NULL,
	[gender] [varchar](1) NOT NULL,
	[criminal_weight] [float] NULL,
	[criminal_height] [float] NULL,
	[occupation] [varchar](100) NOT NULL,
	[marital_statues] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[criminal_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[criminal_history]    Script Date: 1/5/2022 1:55:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[criminal_history](
	[history_crID] [int] NOT NULL,
	[history_ofID] [int] NOT NULL,
	[charge] [varchar](100) NOT NULL,
	[sentence] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[history_crID] ASC,
	[history_ofID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[evidences]    Script Date: 1/5/2022 1:55:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[evidences](
	[evidence] [varchar](100) NOT NULL,
	[id_offence] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[nationalities]    Script Date: 1/5/2022 1:55:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nationalities](
	[nationality] [varchar](20) NOT NULL,
	[id_criminal] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[offence]    Script Date: 1/5/2022 1:55:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[offence](
	[offence_id] [int] IDENTITY(1,1) NOT NULL,
	[offence_type] [varchar](50) NOT NULL,
	[offence_place] [varchar](100) NOT NULL,
	[offence_time] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[offence_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[victim]    Script Date: 1/5/2022 1:55:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[victim](
	[victim_id] [int] IDENTITY(1,1) NOT NULL,
	[victim_age] [int] NOT NULL,
	[gender] [varchar](1) NOT NULL,
	[victim_FN] [varchar](50) NOT NULL,
	[victim_MN] [varchar](50) NOT NULL,
	[victim_LN] [varchar](50) NOT NULL,
	[victim_occupation] [varchar](20) NOT NULL,
	[country] [varchar](20) NOT NULL,
	[id_offence] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[victim_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[criminal_history]  WITH CHECK ADD FOREIGN KEY([history_crID])
REFERENCES [dbo].[criminal] ([criminal_id])
GO
ALTER TABLE [dbo].[criminal_history]  WITH CHECK ADD FOREIGN KEY([history_ofID])
REFERENCES [dbo].[offence] ([offence_id])
GO
ALTER TABLE [dbo].[evidences]  WITH CHECK ADD FOREIGN KEY([id_offence])
REFERENCES [dbo].[offence] ([offence_id])
GO
ALTER TABLE [dbo].[nationalities]  WITH CHECK ADD FOREIGN KEY([id_criminal])
REFERENCES [dbo].[criminal] ([criminal_id])
GO
ALTER TABLE [dbo].[victim]  WITH CHECK ADD FOREIGN KEY([id_offence])
REFERENCES [dbo].[offence] ([offence_id])
GO
