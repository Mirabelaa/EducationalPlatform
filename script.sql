USE [Scoala]
GO
/****** Object:  Table [dbo].[Absenta]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Absenta](
	[id_absenta] [int] IDENTITY(1,1) NOT NULL,
	[id_elev] [int] NULL,
	[id_prof] [int] NULL,
	[id_materie] [int] NULL,
	[data] [date] NULL,
	[motivata] [bit] NULL,
	[motivabila] [bit] NULL,
	[semestru] [int] NULL,
 CONSTRAINT [PK_Absenta] PRIMARY KEY CLUSTERED 
(
	[id_absenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[id_admin] [int] IDENTITY(1,1) NOT NULL,
	[Nume] [nvarchar](50) NULL,
	[Username] [nvarchar](50) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[id_admin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clasa]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clasa](
	[id_clasa] [int] IDENTITY(1,1) NOT NULL,
	[an] [int] NULL,
	[litera] [char](1) NULL,
	[id_specializare] [int] NULL,
 CONSTRAINT [PK_Clasa] PRIMARY KEY CLUSTERED 
(
	[id_clasa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Diriginte]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diriginte](
	[id_prof] [int] NOT NULL,
	[id_clasa] [int] NOT NULL,
 CONSTRAINT [PK_Diriginte] PRIMARY KEY CLUSTERED 
(
	[id_prof] ASC,
	[id_clasa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Elev]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Elev](
	[id_elev] [int] IDENTITY(1,1) NOT NULL,
	[Nume] [nvarchar](50) NULL,
	[Prenume] [nvarchar](50) NULL,
	[Username] [nvarchar](50) NULL,
	[id_clasa] [int] NULL,
 CONSTRAINT [PK_Elev] PRIMARY KEY CLUSTERED 
(
	[id_elev] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inregistrare]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inregistrare](
	[Username] [nvarchar](50) NOT NULL,
	[Parola] [nvarchar](50) NULL,
	[Rol] [nvarchar](50) NULL,
	[activ] [bit] NULL,
 CONSTRAINT [PK_Inregistrare] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materiale_didactice]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materiale_didactice](
	[id_material] [int] IDENTITY(1,1) NOT NULL,
	[cale] [nvarchar](50) NULL,
 CONSTRAINT [PK_Materiale_didactice] PRIMARY KEY CLUSTERED 
(
	[id_material] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materie]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materie](
	[id_materie] [int] IDENTITY(1,1) NOT NULL,
	[denumire] [nvarchar](50) NULL,
 CONSTRAINT [PK_Materie] PRIMARY KEY CLUSTERED 
(
	[id_materie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medie]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medie](
	[id_medie] [int] IDENTITY(1,1) NOT NULL,
	[id_elev] [int] NULL,
	[id_prof] [int] NULL,
	[id_materie] [int] NULL,
	[media] [int] NULL,
	[semestru] [int] NULL,
 CONSTRAINT [PK_Medie] PRIMARY KEY CLUSTERED 
(
	[id_medie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nota]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nota](
	[id_nota] [int] IDENTITY(1,1) NOT NULL,
	[id_elev] [int] NULL,
	[id_prof] [int] NULL,
	[id_materie] [int] NULL,
	[data] [date] NULL,
	[nota] [int] NULL,
	[teza] [bit] NULL,
	[semestru] [int] NULL,
 CONSTRAINT [PK_Nota] PRIMARY KEY CLUSTERED 
(
	[id_nota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prof_materie]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prof_materie](
	[id_materie] [int] NOT NULL,
	[id_prof] [int] NOT NULL,
 CONSTRAINT [PK_Prof_materie] PRIMARY KEY CLUSTERED 
(
	[id_materie] ASC,
	[id_prof] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prof_materie_clasa]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prof_materie_clasa](
	[id_materie] [int] NOT NULL,
	[id_prof] [int] NOT NULL,
	[id_clasa] [int] NOT NULL,
	[id_material] [int] NOT NULL,
 CONSTRAINT [PK_prof_materie_clasa] PRIMARY KEY CLUSTERED 
(
	[id_materie] ASC,
	[id_prof] ASC,
	[id_clasa] ASC,
	[id_material] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesor]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesor](
	[id_prof] [int] IDENTITY(1,1) NOT NULL,
	[Nume] [nvarchar](50) NULL,
	[Prenume] [nvarchar](50) NULL,
	[Username] [nvarchar](50) NULL,
 CONSTRAINT [PK_Profesor] PRIMARY KEY CLUSTERED 
(
	[id_prof] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specializare]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specializare](
	[id_specializare] [int] IDENTITY(1,1) NOT NULL,
	[denumire] [nvarchar](50) NULL,
 CONSTRAINT [PK_Specializare] PRIMARY KEY CLUSTERED 
(
	[id_specializare] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specializare_materie]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specializare_materie](
	[id_specializare] [int] NOT NULL,
	[id_materie] [int] NOT NULL,
	[teza] [bit] NULL,
 CONSTRAINT [PK_Specializare_materie] PRIMARY KEY CLUSTERED 
(
	[id_specializare] ASC,
	[id_materie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Absenta] ON 

INSERT [dbo].[Absenta] ([id_absenta], [id_elev], [id_prof], [id_materie], [data], [motivata], [motivabila], [semestru]) VALUES (1, 1, 9, 1, CAST(N'2019-10-10' AS Date), 1, 1, 1)
INSERT [dbo].[Absenta] ([id_absenta], [id_elev], [id_prof], [id_materie], [data], [motivata], [motivabila], [semestru]) VALUES (2, 1, 9, 2, CAST(N'2019-10-12' AS Date), 1, 1, 1)
INSERT [dbo].[Absenta] ([id_absenta], [id_elev], [id_prof], [id_materie], [data], [motivata], [motivabila], [semestru]) VALUES (3, 6, 9, 2, CAST(N'2020-02-02' AS Date), 1, 1, 2)
INSERT [dbo].[Absenta] ([id_absenta], [id_elev], [id_prof], [id_materie], [data], [motivata], [motivabila], [semestru]) VALUES (4, 6, 9, 2, CAST(N'2020-03-03' AS Date), 1, 1, 2)
INSERT [dbo].[Absenta] ([id_absenta], [id_elev], [id_prof], [id_materie], [data], [motivata], [motivabila], [semestru]) VALUES (5, 6, 9, 2, CAST(N'2020-04-04' AS Date), 1, 1, 2)
SET IDENTITY_INSERT [dbo].[Absenta] OFF
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([id_admin], [Nume], [Username]) VALUES (4, N'Mirabela', N'mirabela.admin')
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Clasa] ON 

INSERT [dbo].[Clasa] ([id_clasa], [an], [litera], [id_specializare]) VALUES (1, 12, N'A', 1)
INSERT [dbo].[Clasa] ([id_clasa], [an], [litera], [id_specializare]) VALUES (2, 12, N'B', 2)
INSERT [dbo].[Clasa] ([id_clasa], [an], [litera], [id_specializare]) VALUES (3, 12, N'C', 3)
INSERT [dbo].[Clasa] ([id_clasa], [an], [litera], [id_specializare]) VALUES (4, 12, N'D', 4)
SET IDENTITY_INSERT [dbo].[Clasa] OFF
GO
INSERT [dbo].[Diriginte] ([id_prof], [id_clasa]) VALUES (9, 2)
INSERT [dbo].[Diriginte] ([id_prof], [id_clasa]) VALUES (10, 1)
INSERT [dbo].[Diriginte] ([id_prof], [id_clasa]) VALUES (12, 4)
INSERT [dbo].[Diriginte] ([id_prof], [id_clasa]) VALUES (15, 3)
GO
SET IDENTITY_INSERT [dbo].[Elev] ON 

INSERT [dbo].[Elev] ([id_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (1, N'Alinaaa', N'Maria', N'maria.elev', 1)
INSERT [dbo].[Elev] ([id_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (2, N'Manea', N'Adina', N'adina.elev', 3)
INSERT [dbo].[Elev] ([id_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (3, N'Radu', N'Cosmin', N'cosmin.elev', 2)
INSERT [dbo].[Elev] ([id_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (4, N'Carabulea', N'Denis', N'denis.elev', 2)
INSERT [dbo].[Elev] ([id_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (5, N'Vornicu', N'Valeria', N'valeria.elev', 3)
INSERT [dbo].[Elev] ([id_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (6, N'Cenusa', N'Ionut', N'ionut.elev', 1)
INSERT [dbo].[Elev] ([id_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (7, N'Amariei                                 ', N'Ana                                     ', N'ana.elev                                ', 3)
INSERT [dbo].[Elev] ([id_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (11, N'adriana', N'frumy                             ', N'RFE                                     ', 2)
INSERT [dbo].[Elev] ([id_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (13, N'eu                                      ', N'eu                                      ', N'eu                                      ', 2)
INSERT [dbo].[Elev] ([id_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (14, N'rt                                      ', N'g                                       ', N'rt                                      ', 3)
INSERT [dbo].[Elev] ([id_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (15, N'Banana                                 ', N'banana                                  ', N'aman                                    ', 3)
INSERT [dbo].[Elev] ([id_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (16, N'asa                                     ', N'da                                      ', N'askj                                    ', 2)
INSERT [dbo].[Elev] ([id_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (22, N'Rata', N'xdfcvg', N'marina.elev', 1)
INSERT [dbo].[Elev] ([id_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (23, N'Pancescu', N'Simona', N'simona.elev', 1)
INSERT [dbo].[Elev] ([id_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (24, N'Vila', N'Catrina', N'catrina.elev', 1)
INSERT [dbo].[Elev] ([id_elev], [Nume], [Prenume], [Username], [id_clasa]) VALUES (25, N'adfh', N'dedaf', N'trguj', 2)
SET IDENTITY_INSERT [dbo].[Elev] OFF
GO
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'a.elev', N'a', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'a.n', N'aabjh', N'prof', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'aa', N'bb', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'aaaaa', N'aaaaaa', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'aab', N'aa', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'adina.elev', N'adina', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'alex.prof', N'alex', N'prof', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'aman', N'nab', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'ana.elev', N'ana', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'ana.prof', N'anaaa', N'prof', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'ancuta.prof', N'ancuta', N'prof', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'as', N'ass', N'prof', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'askj', N'swed', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'catrina.elev', N'catrina', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'cosmin.elev', N'cosmin', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'cosmina.elev', N'cosmina', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'costin.prof', N'costin', N'prof', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'denis.elev', N'denis', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'denisa.prof', N'denisa', N'prof', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'eu', N'eu', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'eu.elev', N'eu', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'fara.prof', N'mine', N'prof', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'florin.prof', N'florin', N'prof', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'ionut.elev', N'ionut', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'k', N'koihugy', N'elev', 0)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'lamaia.prof', N'lamaia', N'prof', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'mama.prof', N'tata', N'prof', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'maria.elev', N'maria1', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'marina.elev', N'cosmina', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'matei.prof', N'matei', N'prof', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'mi.elev', N'mi', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'mihaela.prof', N'mihaela', N'prof', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'mira.elev', N'mira', N'elev', 0)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'mirabela.admin', N'mirabela', N'admin', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'qwer', N'qwe', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'RFE', N'FDFD', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'rt', N'rt', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'simona.elev', N'simona', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'titu.prof', N'titu', N'prof', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'trguj', N'fgfvvg', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'uyghb', N'bhbh', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'valeria.elev', N'valeria', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'vlad.prof', N'vlad', N'prof', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'xcfvg', N'hj', N'elev', 1)
INSERT [dbo].[Inregistrare] ([Username], [Parola], [Rol], [activ]) VALUES (N'xsdcf', N'bvg', N'elev', 1)
GO
SET IDENTITY_INSERT [dbo].[Materiale_didactice] ON 

INSERT [dbo].[Materiale_didactice] ([id_material], [cale]) VALUES (1, N'kl')
INSERT [dbo].[Materiale_didactice] ([id_material], [cale]) VALUES (2, N'jj')
SET IDENTITY_INSERT [dbo].[Materiale_didactice] OFF
GO
SET IDENTITY_INSERT [dbo].[Materie] ON 

INSERT [dbo].[Materie] ([id_materie], [denumire]) VALUES (1, N'matematica')
INSERT [dbo].[Materie] ([id_materie], [denumire]) VALUES (2, N'romana')
INSERT [dbo].[Materie] ([id_materie], [denumire]) VALUES (3, N'informatica')
INSERT [dbo].[Materie] ([id_materie], [denumire]) VALUES (4, N'chimie')
INSERT [dbo].[Materie] ([id_materie], [denumire]) VALUES (5, N'fizica')
INSERT [dbo].[Materie] ([id_materie], [denumire]) VALUES (6, N'logica')
INSERT [dbo].[Materie] ([id_materie], [denumire]) VALUES (7, N'latina')
INSERT [dbo].[Materie] ([id_materie], [denumire]) VALUES (8, N'geografie')
INSERT [dbo].[Materie] ([id_materie], [denumire]) VALUES (9, N'istorie')
INSERT [dbo].[Materie] ([id_materie], [denumire]) VALUES (10, N'engleza')
INSERT [dbo].[Materie] ([id_materie], [denumire]) VALUES (11, N'var')
INSERT [dbo].[Materie] ([id_materie], [denumire]) VALUES (12, N'germana')
INSERT [dbo].[Materie] ([id_materie], [denumire]) VALUES (13, N'franceza')
INSERT [dbo].[Materie] ([id_materie], [denumire]) VALUES (15, N'id1                                     ')
INSERT [dbo].[Materie] ([id_materie], [denumire]) VALUES (16, N'id1                                     ')
INSERT [dbo].[Materie] ([id_materie], [denumire]) VALUES (17, N'id15                                    ')
INSERT [dbo].[Materie] ([id_materie], [denumire]) VALUES (18, N'nou                                     ')
SET IDENTITY_INSERT [dbo].[Materie] OFF
GO
SET IDENTITY_INSERT [dbo].[Nota] ON 

INSERT [dbo].[Nota] ([id_nota], [id_elev], [id_prof], [id_materie], [data], [nota], [teza], [semestru]) VALUES (15, 6, 9, 2, CAST(N'2019-10-15' AS Date), 10, 0, 1)
INSERT [dbo].[Nota] ([id_nota], [id_elev], [id_prof], [id_materie], [data], [nota], [teza], [semestru]) VALUES (16, 6, 9, 2, CAST(N'2019-11-07' AS Date), 7, 0, 1)
INSERT [dbo].[Nota] ([id_nota], [id_elev], [id_prof], [id_materie], [data], [nota], [teza], [semestru]) VALUES (17, 6, 10, 3, CAST(N'2019-05-05' AS Date), 8, 0, 2)
INSERT [dbo].[Nota] ([id_nota], [id_elev], [id_prof], [id_materie], [data], [nota], [teza], [semestru]) VALUES (18, 1, 9, 1, CAST(N'2019-10-10' AS Date), 10, 0, 1)
INSERT [dbo].[Nota] ([id_nota], [id_elev], [id_prof], [id_materie], [data], [nota], [teza], [semestru]) VALUES (19, 6, 9, 2, CAST(N'2019-05-05' AS Date), 10, 0, 2)
INSERT [dbo].[Nota] ([id_nota], [id_elev], [id_prof], [id_materie], [data], [nota], [teza], [semestru]) VALUES (20, 1, 9, 1, CAST(N'2019-10-29' AS Date), 6, 0, 1)
INSERT [dbo].[Nota] ([id_nota], [id_elev], [id_prof], [id_materie], [data], [nota], [teza], [semestru]) VALUES (21, 6, 9, 2, CAST(N'2019-06-06' AS Date), 8, 0, 2)
SET IDENTITY_INSERT [dbo].[Nota] OFF
GO
INSERT [dbo].[Prof_materie] ([id_materie], [id_prof]) VALUES (1, 9)
INSERT [dbo].[Prof_materie] ([id_materie], [id_prof]) VALUES (2, 9)
INSERT [dbo].[Prof_materie] ([id_materie], [id_prof]) VALUES (3, 10)
INSERT [dbo].[Prof_materie] ([id_materie], [id_prof]) VALUES (4, 10)
INSERT [dbo].[Prof_materie] ([id_materie], [id_prof]) VALUES (5, 10)
INSERT [dbo].[Prof_materie] ([id_materie], [id_prof]) VALUES (7, 12)
INSERT [dbo].[Prof_materie] ([id_materie], [id_prof]) VALUES (8, 12)
INSERT [dbo].[Prof_materie] ([id_materie], [id_prof]) VALUES (9, 13)
INSERT [dbo].[Prof_materie] ([id_materie], [id_prof]) VALUES (10, 13)
INSERT [dbo].[Prof_materie] ([id_materie], [id_prof]) VALUES (11, 9)
INSERT [dbo].[Prof_materie] ([id_materie], [id_prof]) VALUES (11, 13)
INSERT [dbo].[Prof_materie] ([id_materie], [id_prof]) VALUES (12, 13)
INSERT [dbo].[Prof_materie] ([id_materie], [id_prof]) VALUES (13, 13)
INSERT [dbo].[Prof_materie] ([id_materie], [id_prof]) VALUES (18, 13)
GO
INSERT [dbo].[prof_materie_clasa] ([id_materie], [id_prof], [id_clasa], [id_material]) VALUES (1, 9, 1, 1)
INSERT [dbo].[prof_materie_clasa] ([id_materie], [id_prof], [id_clasa], [id_material]) VALUES (1, 9, 2, 1)
INSERT [dbo].[prof_materie_clasa] ([id_materie], [id_prof], [id_clasa], [id_material]) VALUES (2, 9, 1, 1)
INSERT [dbo].[prof_materie_clasa] ([id_materie], [id_prof], [id_clasa], [id_material]) VALUES (2, 9, 2, 1)
INSERT [dbo].[prof_materie_clasa] ([id_materie], [id_prof], [id_clasa], [id_material]) VALUES (3, 10, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Profesor] ON 

INSERT [dbo].[Profesor] ([id_prof], [Nume], [Prenume], [Username]) VALUES (9, N'Costin', N'Alex', N'alex.prof')
INSERT [dbo].[Profesor] ([id_prof], [Nume], [Prenume], [Username]) VALUES (10, N'Minea', N'Vlad', N'vlad.prof')
INSERT [dbo].[Profesor] ([id_prof], [Nume], [Prenume], [Username]) VALUES (12, N'Popescu', N'Ancuta', N'ancuta.prof')
INSERT [dbo].[Profesor] ([id_prof], [Nume], [Prenume], [Username]) VALUES (13, N'Ionescu', N'Matei', N'matei.prof')
INSERT [dbo].[Profesor] ([id_prof], [Nume], [Prenume], [Username]) VALUES (15, N'Fara                                    ', N'Tine                                  ', N'fara.prof                               ')
SET IDENTITY_INSERT [dbo].[Profesor] OFF
GO
SET IDENTITY_INSERT [dbo].[Specializare] ON 

INSERT [dbo].[Specializare] ([id_specializare], [denumire]) VALUES (1, N'mate-info')
INSERT [dbo].[Specializare] ([id_specializare], [denumire]) VALUES (2, N'filologie')
INSERT [dbo].[Specializare] ([id_specializare], [denumire]) VALUES (3, N'stiintele naturii')
INSERT [dbo].[Specializare] ([id_specializare], [denumire]) VALUES (4, N'stiinte sociale')
SET IDENTITY_INSERT [dbo].[Specializare] OFF
GO
INSERT [dbo].[Specializare_materie] ([id_specializare], [id_materie], [teza]) VALUES (1, 1, 1)
INSERT [dbo].[Specializare_materie] ([id_specializare], [id_materie], [teza]) VALUES (1, 2, 1)
INSERT [dbo].[Specializare_materie] ([id_specializare], [id_materie], [teza]) VALUES (1, 3, 1)
INSERT [dbo].[Specializare_materie] ([id_specializare], [id_materie], [teza]) VALUES (1, 4, 0)
INSERT [dbo].[Specializare_materie] ([id_specializare], [id_materie], [teza]) VALUES (1, 5, 0)
INSERT [dbo].[Specializare_materie] ([id_specializare], [id_materie], [teza]) VALUES (1, 8, 0)
INSERT [dbo].[Specializare_materie] ([id_specializare], [id_materie], [teza]) VALUES (1, 15, 0)
INSERT [dbo].[Specializare_materie] ([id_specializare], [id_materie], [teza]) VALUES (1, 18, 0)
INSERT [dbo].[Specializare_materie] ([id_specializare], [id_materie], [teza]) VALUES (2, 1, 0)
INSERT [dbo].[Specializare_materie] ([id_specializare], [id_materie], [teza]) VALUES (2, 2, 1)
INSERT [dbo].[Specializare_materie] ([id_specializare], [id_materie], [teza]) VALUES (2, 6, 1)
INSERT [dbo].[Specializare_materie] ([id_specializare], [id_materie], [teza]) VALUES (2, 9, 1)
INSERT [dbo].[Specializare_materie] ([id_specializare], [id_materie], [teza]) VALUES (2, 10, 0)
INSERT [dbo].[Specializare_materie] ([id_specializare], [id_materie], [teza]) VALUES (3, 1, 0)
INSERT [dbo].[Specializare_materie] ([id_specializare], [id_materie], [teza]) VALUES (3, 2, 1)
INSERT [dbo].[Specializare_materie] ([id_specializare], [id_materie], [teza]) VALUES (3, 4, 0)
INSERT [dbo].[Specializare_materie] ([id_specializare], [id_materie], [teza]) VALUES (3, 7, 0)
INSERT [dbo].[Specializare_materie] ([id_specializare], [id_materie], [teza]) VALUES (3, 11, 1)
INSERT [dbo].[Specializare_materie] ([id_specializare], [id_materie], [teza]) VALUES (4, 1, 0)
INSERT [dbo].[Specializare_materie] ([id_specializare], [id_materie], [teza]) VALUES (4, 2, 1)
INSERT [dbo].[Specializare_materie] ([id_specializare], [id_materie], [teza]) VALUES (4, 4, 0)
INSERT [dbo].[Specializare_materie] ([id_specializare], [id_materie], [teza]) VALUES (4, 6, 1)
GO
ALTER TABLE [dbo].[Absenta]  WITH CHECK ADD  CONSTRAINT [FK_Absenta_Elev] FOREIGN KEY([id_elev])
REFERENCES [dbo].[Elev] ([id_elev])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Absenta] CHECK CONSTRAINT [FK_Absenta_Elev]
GO
ALTER TABLE [dbo].[Absenta]  WITH CHECK ADD  CONSTRAINT [FK_Absenta_Prof_materie] FOREIGN KEY([id_materie], [id_prof])
REFERENCES [dbo].[Prof_materie] ([id_materie], [id_prof])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Absenta] CHECK CONSTRAINT [FK_Absenta_Prof_materie]
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_Inregistrare1] FOREIGN KEY([Username])
REFERENCES [dbo].[Inregistrare] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_Inregistrare1]
GO
ALTER TABLE [dbo].[Clasa]  WITH CHECK ADD  CONSTRAINT [FK_Clasa_Specializare] FOREIGN KEY([id_specializare])
REFERENCES [dbo].[Specializare] ([id_specializare])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Clasa] CHECK CONSTRAINT [FK_Clasa_Specializare]
GO
ALTER TABLE [dbo].[Diriginte]  WITH CHECK ADD  CONSTRAINT [FK_Diriginte_Clasa] FOREIGN KEY([id_clasa])
REFERENCES [dbo].[Clasa] ([id_clasa])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Diriginte] CHECK CONSTRAINT [FK_Diriginte_Clasa]
GO
ALTER TABLE [dbo].[Diriginte]  WITH CHECK ADD  CONSTRAINT [FK_Diriginte_Profesor] FOREIGN KEY([id_prof])
REFERENCES [dbo].[Profesor] ([id_prof])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Diriginte] CHECK CONSTRAINT [FK_Diriginte_Profesor]
GO
ALTER TABLE [dbo].[Elev]  WITH CHECK ADD  CONSTRAINT [FK_Elev_Clasa] FOREIGN KEY([id_clasa])
REFERENCES [dbo].[Clasa] ([id_clasa])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Elev] CHECK CONSTRAINT [FK_Elev_Clasa]
GO
ALTER TABLE [dbo].[Elev]  WITH CHECK ADD  CONSTRAINT [FK_Elev_Inregistrare] FOREIGN KEY([Username])
REFERENCES [dbo].[Inregistrare] ([Username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Elev] CHECK CONSTRAINT [FK_Elev_Inregistrare]
GO
ALTER TABLE [dbo].[Medie]  WITH CHECK ADD  CONSTRAINT [FK_Medie_Elev] FOREIGN KEY([id_elev])
REFERENCES [dbo].[Elev] ([id_elev])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Medie] CHECK CONSTRAINT [FK_Medie_Elev]
GO
ALTER TABLE [dbo].[Medie]  WITH CHECK ADD  CONSTRAINT [FK_Medie_Prof_materie] FOREIGN KEY([id_materie], [id_prof])
REFERENCES [dbo].[Prof_materie] ([id_materie], [id_prof])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Medie] CHECK CONSTRAINT [FK_Medie_Prof_materie]
GO
ALTER TABLE [dbo].[Nota]  WITH CHECK ADD  CONSTRAINT [FK_Nota_Elev] FOREIGN KEY([id_elev])
REFERENCES [dbo].[Elev] ([id_elev])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nota] CHECK CONSTRAINT [FK_Nota_Elev]
GO
ALTER TABLE [dbo].[Nota]  WITH CHECK ADD  CONSTRAINT [FK_Nota_Prof_materie1] FOREIGN KEY([id_materie], [id_prof])
REFERENCES [dbo].[Prof_materie] ([id_materie], [id_prof])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nota] CHECK CONSTRAINT [FK_Nota_Prof_materie1]
GO
ALTER TABLE [dbo].[Prof_materie]  WITH CHECK ADD  CONSTRAINT [FK_Prof_materie_Materie] FOREIGN KEY([id_materie])
REFERENCES [dbo].[Materie] ([id_materie])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Prof_materie] CHECK CONSTRAINT [FK_Prof_materie_Materie]
GO
ALTER TABLE [dbo].[Prof_materie]  WITH CHECK ADD  CONSTRAINT [FK_Prof_materie_Profesor] FOREIGN KEY([id_prof])
REFERENCES [dbo].[Profesor] ([id_prof])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Prof_materie] CHECK CONSTRAINT [FK_Prof_materie_Profesor]
GO
ALTER TABLE [dbo].[prof_materie_clasa]  WITH CHECK ADD  CONSTRAINT [FK_prof_materie_clasa_Clasa] FOREIGN KEY([id_clasa])
REFERENCES [dbo].[Clasa] ([id_clasa])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[prof_materie_clasa] CHECK CONSTRAINT [FK_prof_materie_clasa_Clasa]
GO
ALTER TABLE [dbo].[prof_materie_clasa]  WITH CHECK ADD  CONSTRAINT [FK_prof_materie_clasa_Materiale_didactice] FOREIGN KEY([id_material])
REFERENCES [dbo].[Materiale_didactice] ([id_material])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[prof_materie_clasa] CHECK CONSTRAINT [FK_prof_materie_clasa_Materiale_didactice]
GO
ALTER TABLE [dbo].[prof_materie_clasa]  WITH CHECK ADD  CONSTRAINT [FK_prof_materie_clasa_Prof_materie] FOREIGN KEY([id_materie], [id_prof])
REFERENCES [dbo].[Prof_materie] ([id_materie], [id_prof])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[prof_materie_clasa] CHECK CONSTRAINT [FK_prof_materie_clasa_Prof_materie]
GO
ALTER TABLE [dbo].[Specializare_materie]  WITH CHECK ADD  CONSTRAINT [FK_Specializare_materie_Materie] FOREIGN KEY([id_materie])
REFERENCES [dbo].[Materie] ([id_materie])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Specializare_materie] CHECK CONSTRAINT [FK_Specializare_materie_Materie]
GO
ALTER TABLE [dbo].[Specializare_materie]  WITH CHECK ADD  CONSTRAINT [FK_Specializare_materie_Specializare] FOREIGN KEY([id_specializare])
REFERENCES [dbo].[Specializare] ([id_specializare])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Specializare_materie] CHECK CONSTRAINT [FK_Specializare_materie_Specializare]
GO
/****** Object:  StoredProcedure [dbo].[AdaugaDiriginte]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AdaugaDiriginte]
@id_prof int,
@id_clasa int
AS
BEGIN
	insert into Diriginte(id_prof, id_clasa)
	values (@id_prof, @id_clasa)
END
GO
/****** Object:  StoredProcedure [dbo].[AdaugareInregistrare]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AdaugareInregistrare]
@username nvarchar(50),
@parola nvarchar(50),
@rol nvarchar(50), 
@activ bit
AS

BEGIN
	insert into Inregistrare(Username, Parola, Rol, activ) values(@username, @parola, @rol, @activ)
END
GO
/****** Object:  StoredProcedure [dbo].[AddAbsenta]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddAbsenta]
	@id_elev int,
	@id_prof int,
	@id_materie int,
	@data date,
	@motivata bit,
	@motivabila bit,
	@semestru int

AS
SET IDENTITY_INSERT Absenta ON
BEGIN
	BEGIN TRANSACTION
        DECLARE @id_absenta int;
        SELECT @id_absenta = coalesce((select max(id_absenta) + 1 from Absenta), 1)
    COMMIT      
	insert into Absenta(id_absenta, id_elev, id_prof, id_materie, data, motivata, motivabila, semestru)
	values(@id_absenta, @id_elev, @id_prof, @id_materie, @data, @motivata, @motivabila, @semestru)
END
GO
/****** Object:  StoredProcedure [dbo].[AddElev]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddElev]
	@Nume nvarchar(40),
	@Prenume nvarchar(40),
	@Username nvarchar(40),
	@id_clasa int


AS
SET IDENTITY_INSERT Elev ON
BEGIN
	BEGIN TRANSACTION
        DECLARE @id_elev int;
        SELECT @id_elev = coalesce((select max(id_elev) + 1 from Elev), 1)
    COMMIT      
	insert into Elev(id_elev,Nume,Prenume,Username,id_clasa)
	values(@id_elev,@Nume,@Prenume,@Username,@id_clasa)
END
GO
/****** Object:  StoredProcedure [dbo].[AddMaterie]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddMaterie]
	@denumire nchar(40)

AS
SET IDENTITY_INSERT Materie ON
BEGIN
	BEGIN TRANSACTION
        DECLARE @id_materie int;
        SELECT @id_materie = coalesce((select max(id_materie) + 1 from Materie), 1)
    COMMIT      
	insert into Materie(id_materie, denumire)
	values (@id_materie, @denumire)
END

GO
/****** Object:  StoredProcedure [dbo].[AddNota]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddNota]
	@id_elev int,
	@id_prof int,
	@id_materie int,
	@data date,
	@nota int,
	@teza bit,
	@semestru int

AS
SET IDENTITY_INSERT Nota ON
BEGIN
	BEGIN TRANSACTION
        DECLARE @id_nota int;
        SELECT @id_nota = coalesce((select max(id_nota) + 1 from Nota), 1)
    COMMIT      
	insert into Nota(id_nota, id_elev, id_prof, id_materie, data, nota, teza, semestru)
	values(@id_nota, @id_elev, @id_prof, @id_materie, @data, @nota, @teza, @semestru)
END

GO
/****** Object:  StoredProcedure [dbo].[AddProf]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddProf]
	@Nume nchar(40),
	@Prenume nchar(40),
	@Username nchar(40)
AS
SET IDENTITY_INSERT Profesor ON
BEGIN
	BEGIN TRANSACTION
        DECLARE @id_prof int;
        SELECT @id_prof = coalesce((select max(id_prof) + 1 from Profesor), 1)
    COMMIT      
	insert into Profesor(id_prof,Nume,Prenume,Username)
	values(@id_prof,@Nume,@Prenume,@Username)
END
GO
/****** Object:  StoredProcedure [dbo].[AfisareAbsente]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AfisareAbsente]
	@id_elev int
AS
BEGIN
	select Absenta.data as data, Materie.denumire as materie, CASE WHEN Absenta.motivata = 1 THEN 'Da' ELSE 'Nu' END as motivata,
	CASE WHEN Absenta.motivabila = 1 THEN 'Da' ELSE 'Nu' END as motivabila, Absenta.semestru as semestru from Absenta 
	inner join Prof_materie on Absenta.id_materie=Prof_materie.id_materie and Absenta.id_prof=Prof_materie.id_prof inner join Materie on 
	Prof_materie.id_materie=Materie.id_materie inner join Specializare_materie on Specializare_materie.id_materie=Materie.id_materie inner join 
	Specializare on Specializare.id_specializare=Specializare_materie.id_specializare inner join Clasa on Clasa.id_specializare=Specializare.id_specializare 
	inner join Elev on Elev.id_clasa=Clasa.id_clasa where Absenta.id_elev=@id_elev and Elev.id_elev=@id_elev order by data;
END
GO
/****** Object:  StoredProcedure [dbo].[AfisareAbsenteNemotivateElev]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AfisareAbsenteNemotivateElev]
	@id_elev int
AS
BEGIN
	select Elev.Nume as nume, Elev.Prenume as prenume, Absenta.data as data, Materie.denumire as materie, CASE WHEN Absenta.motivata = 1 THEN 'Da' ELSE 'Nu' 
	END as motivata, CASE WHEN Absenta.motivabila = 1 THEN 'Da' ELSE 'Nu' END as motivabila, Absenta.semestru as semestru from Absenta  
	inner join Prof_materie on Absenta.id_materie=Prof_materie.id_materie and Absenta.id_prof=Prof_materie.id_prof inner join 
	Materie on Prof_materie.id_materie=Materie.id_materie inner join Elev on Absenta.id_elev=Elev.id_elev inner join Profesor on
	Profesor.id_prof=Absenta.id_prof inner join Clasa on Clasa.id_clasa=Elev.id_clasa
	where 
	Elev.id_elev=@id_elev and Absenta.motivata=0
	order by data;
END
GO
/****** Object:  StoredProcedure [dbo].[AfisareAbsenteNemotivatePeClasa]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AfisareAbsenteNemotivatePeClasa]
	@id_clasa int
AS
BEGIN
	select Elev.Nume as nume, Elev.Prenume as prenume, Absenta.data as data, Materie.denumire as materie, CASE WHEN Absenta.motivata = 1 THEN 'Da' ELSE 'Nu' 
	END as motivata, CASE WHEN Absenta.motivabila = 1 THEN 'Da' ELSE 'Nu' END as motivabila, Absenta.semestru as semestru from Absenta  
	inner join Prof_materie on Absenta.id_materie=Prof_materie.id_materie and Absenta.id_prof=Prof_materie.id_prof inner join 
	Materie on Prof_materie.id_materie=Materie.id_materie inner join Elev on Absenta.id_elev=Elev.id_elev inner join Profesor on
	Profesor.id_prof=Absenta.id_prof inner join Clasa on Clasa.id_clasa=Elev.id_clasa
	where 
	Clasa.id_clasa=@id_clasa and Absenta.motivata=0
	order by data;
END
GO
/****** Object:  StoredProcedure [dbo].[AfisareAbsentePeClasa]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AfisareAbsentePeClasa]
	@id_clasa int
AS
BEGIN
	select Elev.Nume as nume, Elev.Prenume as prenume, Absenta.data as data, Materie.denumire as materie, CASE WHEN Absenta.motivata = 1 THEN 'Da' ELSE 'Nu' 
	END as motivata, CASE WHEN Absenta.motivabila = 1 THEN 'Da' ELSE 'Nu' END as motivabila, Absenta.semestru as semestru from Absenta  
	inner join Prof_materie on Absenta.id_materie=Prof_materie.id_materie and Absenta.id_prof=Prof_materie.id_prof inner join 
	Materie on Prof_materie.id_materie=Materie.id_materie inner join Elev on Absenta.id_elev=Elev.id_elev inner join Profesor on
	Profesor.id_prof=Absenta.id_prof inner join Clasa on Clasa.id_clasa=Elev.id_clasa
	where 
	Clasa.id_clasa=@id_clasa
	order by data;
END
GO
/****** Object:  StoredProcedure [dbo].[AfisareAbsenteProf]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AfisareAbsenteProf] 
	@id_prof int
AS
BEGIN
	select Elev.Nume as nume, Elev.Prenume as prenume, Absenta.data as data, Materie.denumire as materie, CASE WHEN Absenta.motivata = 1 THEN 'Da' ELSE 'Nu' 
	END as motivata, CASE WHEN Absenta.motivabila = 1 THEN 'Da' ELSE 'Nu' END as motivabila, Absenta.semestru as semestru from Absenta  
	inner join Prof_materie on Absenta.id_materie=Prof_materie.id_materie and Absenta.id_prof=Prof_materie.id_prof inner join 
	Materie on Prof_materie.id_materie=Materie.id_materie inner join Elev on Absenta.id_elev=Elev.id_elev inner join Profesor on
	Profesor.id_prof=Absenta.id_prof
	where 
	Absenta.id_prof=@id_prof and Profesor.id_prof=@id_prof
	order by data;
END
GO
/****** Object:  StoredProcedure [dbo].[AfisareMaterii]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AfisareMaterii]
	@id_elev int
AS
BEGIN
	select Materie.denumire, Materie.id_materie from Materie inner join Specializare_materie on Specializare_materie.id_materie=Materie.id_materie inner join 
	Specializare on Specializare.id_specializare=Specializare_materie.id_specializare inner join Clasa on 
	Clasa.id_specializare=Specializare.id_specializare
	inner join Elev on Clasa.id_clasa=Elev.id_clasa where Elev.id_elev=@id_elev order by Materie.denumire
END
GO
/****** Object:  StoredProcedure [dbo].[AfisareNote]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AfisareNote] 
	@id_elev int
AS
BEGIN
	select Nota.id_nota as id, Nota.nota as nota, Materie.denumire as materie, Nota.data as data, Nota.semestru as semestru, CASE WHEN Nota.teza =1 THEN 'Da' ELSE 'Nu' END as teza
	from Nota inner join Prof_materie on 
	Nota.id_materie=Prof_materie.id_materie and Nota.id_prof=Prof_materie.id_prof inner join Materie on Prof_materie.id_materie=Materie.id_materie
	inner join Specializare_materie on Specializare_materie.id_materie=Materie.id_materie inner join Specializare on
	Specializare.id_specializare=Specializare_materie.id_specializare
	inner join Clasa on Clasa.id_specializare=Specializare.id_specializare inner join Elev on Elev.id_clasa=Clasa.id_clasa where 
	Nota.id_elev=@id_elev and
	Elev.id_elev=@id_elev
	order by nota;
END
GO
/****** Object:  StoredProcedure [dbo].[AfisareNoteProf]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AfisareNoteProf] 
	@id_prof int
AS
BEGIN
	select Elev.Nume as nume, Elev.Prenume as prenume, Nota.nota as nota, Materie.denumire as materie, Nota.data as data, 
	Nota.semestru as semestru, CASE WHEN Nota.teza =1 THEN 'Da' ELSE 'Nu' END as teza from Nota inner join Prof_materie on 
	Nota.id_materie=Prof_materie.id_materie and Nota.id_prof=Prof_materie.id_prof inner join Materie on Prof_materie.id_materie=Materie.id_materie
	inner join Elev on Nota.id_elev=Elev.id_elev
	inner join Profesor on
	Profesor.id_prof=Nota.id_prof
	where 
	Nota.id_prof=@id_prof and Profesor.id_prof=@id_prof
	order by nota;
END
GO
/****** Object:  StoredProcedure [dbo].[ClasaDiriginte]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ClasaDiriginte]
@id_prof int
AS
BEGIN
	select id_clasa from Diriginte where Diriginte.id_prof=@id_prof
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteMaterie]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteMaterie]
	@id int
AS
BEGIN
	delete from Materie
	where id_materie = @id
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteNota]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteNota]
	@id int
AS
BEGIN
	delete from Nota
	where id_nota = @id
END
GO
/****** Object:  StoredProcedure [dbo].[DeletePerson]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeletePerson]
	@id int
AS
BEGIN
	delete from Elev
	where id_elev = @id
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteProf]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE  [dbo].[DeleteProf]
	@id int
AS
BEGIN
	delete from Profesor
	where id_prof = @id
END
GO
/****** Object:  StoredProcedure [dbo].[DiriginteExista]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DiriginteExista]
@id_prof int,
@id_clasa int
AS
	declare @ReturnValue int
BEGIN
	if exists(select id_prof from Diriginte where Diriginte.id_prof=@id_prof and Diriginte.id_clasa=@id_clasa)
		select @ReturnValue=1
	else if exists(select id_prof from Diriginte where Diriginte.id_prof=@id_prof)
		select @ReturnValue=2
	else if exists(select id_prof from Diriginte where Diriginte.id_clasa=@id_clasa)
		select @ReturnValue=3
	else select @ReturnValue=0
select @ReturnValue as val
END
GO
/****** Object:  StoredProcedure [dbo].[ElevInClasa]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ElevInClasa]
@id_elev int,
@id_clasa int
AS
	declare @ReturnValue int
BEGIN
	if exists(select @id_clasa from Elev where Elev.id_elev=@id_elev and Elev.id_clasa=@id_clasa)
		select @ReturnValue=1
	else select @ReturnValue=0
select @ReturnValue as val
END
GO
/****** Object:  StoredProcedure [dbo].[EsteDiriginte]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EsteDiriginte]
@id_prof int
AS
declare @ReturnValue int
BEGIN
	if exists(select id_prof from Diriginte where Diriginte.id_prof=@id_prof)
		select @ReturnValue=1
	else select @ReturnValue=0
select @ReturnValue as val
END
GO
/****** Object:  StoredProcedure [dbo].[GetDiriginti]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetDiriginti]
AS
BEGIN
	select Profesor.Nume as nume, Profesor.Prenume as prenume, Profesor.Username as username, Inregistrare.Parola as parola, Clasa.an as an,
	Clasa.litera as litera from Profesor inner join Inregistrare on Profesor.Username=Inregistrare.Username inner join Diriginte on Profesor.id_prof=Diriginte.id_prof
	inner join Clasa on Clasa.id_clasa=Diriginte.id_clasa
END
GO
/****** Object:  StoredProcedure [dbo].[GetElevi]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetElevi]
	
AS
BEGIN
	select Elev.Nume as nume, Elev.Prenume as prenume, Elev.Username as username, Clasa.an as an, Clasa.litera as litera, Inregistrare.Parola as parola
	from Clasa inner join Elev on Elev.id_clasa=Clasa.id_clasa inner join Inregistrare on Elev.Username=Inregistrare.Username
END

GO
/****** Object:  StoredProcedure [dbo].[GetEleviClasa]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetEleviClasa]
	@id_clasa int
AS
BEGIN
	select Elev.Nume as nume, Elev.Prenume as prenume, Elev.id_elev as id
	from Clasa inner join Elev on Elev.id_clasa=Clasa.id_clasa and Clasa.id_clasa=@id_clasa
END
GO
/****** Object:  StoredProcedure [dbo].[GetIdAbsenta]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetIdAbsenta]
	@id_elev int,
	@id_materie int,
	@data date,
	@semestru int
AS
BEGIN
	select id_absenta from Absenta where id_elev=@id_elev and id_materie=@id_materie and data=@data and semestru=@semestru
END

GO
/****** Object:  StoredProcedure [dbo].[GetIdAdmin]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetIdAdmin]
	@username varchar(40)
AS
BEGIN
	select id_admin from Admin where Username=@username
END
GO
/****** Object:  StoredProcedure [dbo].[GetIdClasa]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetIdClasa]
	@an int,
	@litera nvarchar(1)
AS
BEGIN
	select id_clasa from Clasa where an=@an and litera=@litera
END
GO
/****** Object:  StoredProcedure [dbo].[GetIdClasaElev]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetIdClasaElev]
@id_elev int
AS
 BEGIN
 select id_clasa from Elev where Elev.id_elev=@id_elev
 END
GO
/****** Object:  StoredProcedure [dbo].[GetIdElev]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetIdElev]
	@username varchar(40)
AS
BEGIN
	select id_elev from Elev where Username=@username
END
GO
/****** Object:  StoredProcedure [dbo].[GetIdElevFromNume]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetIdElevFromNume]
	@nume varchar(40),
	@prenume varchar(40)
AS
BEGIN
	select id_elev from Elev where Nume=@nume and Prenume=@prenume
END
GO
/****** Object:  StoredProcedure [dbo].[GetIdMaterie]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetIdMaterie]
	@denumire varchar(40)
AS
BEGIN
	select id_materie from Materie where denumire=@denumire
END
GO
/****** Object:  StoredProcedure [dbo].[GetIdNota]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetIdNota]
	@id_elev int,
	@id_prof int,
	@id_materie int,
	@data date,
	@nota int,
	@semestru int,
	@teza bit
AS
BEGIN
	select id_nota from Nota where id_elev=@id_elev and id_prof=@id_prof and id_materie=@id_materie and data=@data and semestru=@semestru and teza=@teza
	and nota=@nota
END
GO
/****** Object:  StoredProcedure [dbo].[GetIdProf]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetIdProf]
	@username varchar(40)
AS
BEGIN
	select id_prof from Profesor where Username=@username
END
GO
/****** Object:  StoredProcedure [dbo].[GetIdProfFromNumePrenume]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetIdProfFromNumePrenume]
	@nume nvarchar(40),
	@prenume nvarchar(40)
AS
BEGIN
	select id_prof from Profesor where Nume=@nume and Prenume=@prenume
END
GO
/****** Object:  StoredProcedure [dbo].[GetIdSpecializare]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===========================================
CREATE PROCEDURE [dbo].[GetIdSpecializare]
	@nume varchar(40)
AS
BEGIN
	select id_specializare from Specializare where denumire=@nume
END
GO
/****** Object:  StoredProcedure [dbo].[GetMaterii]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetMaterii]
	
AS
BEGIN
	select Materie.denumire as materie, Profesor.Nume as nume, Profesor.Prenume as prenume from Materie inner join Prof_materie on
	Materie.id_materie=Prof_materie.id_materie inner join Profesor on Prof_materie.id_prof=Profesor.id_prof
END
GO
/****** Object:  StoredProcedure [dbo].[GetMateriiFaraProf]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetMateriiFaraProf]
AS
BEGIN
	select Materie.denumire as materie, Materie.id_materie as id from Materie
END
GO
/****** Object:  StoredProcedure [dbo].[GetNumePrenumeAdmin]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetNumePrenumeAdmin]
	@id_admin int
AS
BEGIN
	select Nume from Admin where id_admin=@id_admin
END
GO
/****** Object:  StoredProcedure [dbo].[GetNumePrenumeElev]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetNumePrenumeElev]
	@id_elev int
AS
BEGIN
	select Nume, Prenume from Elev where id_elev=@id_elev
END
GO
/****** Object:  StoredProcedure [dbo].[GetNumePrenumeProf]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetNumePrenumeProf]
	@id_prof int
AS
BEGIN
	select Nume, Prenume from Profesor where id_prof=@id_prof
END
GO
/****** Object:  StoredProcedure [dbo].[GetProfi]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetProfi]
AS
BEGIN
	select Profesor.Nume as nume, Profesor.Prenume as prenume, Profesor.Username as username, Inregistrare.Parola as parola from Profesor
	inner join Inregistrare on Profesor.Username=Inregistrare.Username
END
GO
/****** Object:  StoredProcedure [dbo].[GetRol]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetRol]
	@username nvarchar(40)
AS
declare @rol varchar(5)
BEGIN
	Select @rol= 
	case when Rol='elev' then 'elev'
		 when Rol='admin' then 'admin'
		 when Rol='prof' then 'prof'
	end
	from Inregistrare where Username=@username
END
select @rol
GO
/****** Object:  StoredProcedure [dbo].[Id_clasaExista]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Id_clasaExista]
@id_clasa int
AS
	declare @ReturnValue int
BEGIN
	if exists(select id_clasa from Clasa where Clasa.id_clasa=@id_clasa)
		select @ReturnValue=1
	else if not exists(select id_clasa from Clasa where Clasa.id_clasa=@id_clasa)
		select @ReturnValue=0
select @ReturnValue as val
END
GO
/****** Object:  StoredProcedure [dbo].[Logare]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Logare]
	@username nchar(40),
	@parola nchar(40)
	
AS
declare @ReturnValue int
BEGIN
	IF EXISTS (SELECT * FROM Inregistrare WHERE Username=@username)
 BEGIN
    SELECT  @ReturnValue = 
            CASE WHEN Parola = @parola AND activ = 1 THEN 1  -- parola corecta cont activ
                 WHEN activ = 0 THEN 2   -- cont inactiv
                 WHEN Parola <> @parola  THEN 3  -- parola gresita
                ELSE 0                                              
            END
    FROM Inregistrare WHERE Username=@username
END
ELSE IF NOT EXISTS (SELECT * FROM Inregistrare WHERE Username=@username)
 BEGIN
    SET @ReturnValue = 0
END
select @ReturnValue as val
END
GO
/****** Object:  StoredProcedure [dbo].[MotiveazaAbsenta]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MotiveazaAbsenta] 
	@id_absenta int,
	@motivata bit
AS
BEGIN
	update	Absenta
	set		[motivata]='true'
	where	id_absenta=@id_absenta
END
GO
/****** Object:  StoredProcedure [dbo].[NumarareAbsenteNemotivateElev]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NumarareAbsenteNemotivateElev]
	@id_elev int
AS
BEGIN
	select count(id_absenta) from Absenta  
	inner join Prof_materie on Absenta.id_materie=Prof_materie.id_materie and Absenta.id_prof=Prof_materie.id_prof inner join 
	Materie on Prof_materie.id_materie=Materie.id_materie inner join Elev on Absenta.id_elev=Elev.id_elev inner join Profesor on
	Profesor.id_prof=Absenta.id_prof inner join Clasa on Clasa.id_clasa=Elev.id_clasa
	where 
	Elev.id_elev=@id_elev and Absenta.motivata=0
END
GO
/****** Object:  StoredProcedure [dbo].[NumarareAbsenteNemotivatePeClasa]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NumarareAbsenteNemotivatePeClasa]
	@id_clasa int
AS
BEGIN
	select count(id_absenta) from Absenta  
	inner join Prof_materie on Absenta.id_materie=Prof_materie.id_materie and Absenta.id_prof=Prof_materie.id_prof inner join 
	Materie on Prof_materie.id_materie=Materie.id_materie inner join Elev on Absenta.id_elev=Elev.id_elev inner join Profesor on
	Profesor.id_prof=Absenta.id_prof inner join Clasa on Clasa.id_clasa=Elev.id_clasa
	where 
	Clasa.id_clasa=@id_clasa and Absenta.motivata=0
END
GO
/****** Object:  StoredProcedure [dbo].[NumarareAbsentePeClasa]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NumarareAbsentePeClasa]
	@id_clasa int
AS
BEGIN
	select count(id_absenta) from Absenta  
	inner join Prof_materie on Absenta.id_materie=Prof_materie.id_materie and Absenta.id_prof=Prof_materie.id_prof inner join 
	Materie on Prof_materie.id_materie=Materie.id_materie inner join Elev on Absenta.id_elev=Elev.id_elev inner join Profesor on
	Profesor.id_prof=Absenta.id_prof inner join Clasa on Clasa.id_clasa=Elev.id_clasa
	where 
	Clasa.id_clasa=@id_clasa
END
GO
/****** Object:  StoredProcedure [dbo].[ProfMaterieClasaExista]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ProfMaterieClasaExista]
@id_prof int,
@id_materie int,
@id_clasa int
AS
	declare @ReturnValue int
BEGIN
	if exists(select id_prof from prof_materie_clasa where prof_materie_clasa.id_prof=@id_prof and prof_materie_clasa.id_materie=@id_materie and 
				prof_materie_clasa.id_clasa=@id_clasa)
		select @ReturnValue=1
	else if exists(select id_prof from prof_materie_clasa where prof_materie_clasa.id_prof=@id_prof and prof_materie_clasa.id_materie=@id_materie)
			select @ReturnValue=2
	else if exists(select id_prof from prof_materie_clasa where prof_materie_clasa.id_materie=@id_materie and prof_materie_clasa.id_clasa=@id_clasa)
			select @ReturnValue=3
	else if exists(select id_prof from prof_materie_clasa where prof_materie_clasa.id_clasa=@id_clasa and prof_materie_clasa.id_prof=@id_prof)
			select @ReturnValue=4
	else select @ReturnValue=0
select @ReturnValue as val
END
GO
/****** Object:  StoredProcedure [dbo].[ProfMaterieExista]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[ProfMaterieExista]
@id_prof int,
@id_materie int
AS
	declare @ReturnValue int
BEGIN
	if exists(select id_prof from Prof_materie where Prof_materie.id_prof=@id_prof and Prof_materie.id_materie=@id_materie)
		select @ReturnValue=1
	else if not exists(select id_prof from Prof_materie where Prof_materie.id_prof=@id_prof and Prof_materie.id_materie=@id_materie)
		select @ReturnValue=0
select @ReturnValue as val
END
GO
/****** Object:  StoredProcedure [dbo].[SpecializareMaterieExista]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SpecializareMaterieExista]
@id_specializare int,
@id_materie int
AS
	declare @ReturnValue int
BEGIN
	if exists(select id_specializare from Specializare_materie where Specializare_materie.id_specializare=@id_specializare and 
		Specializare_materie.id_materie=@id_materie)
		select @ReturnValue=1
	else if not exists(select id_specializare from Specializare_materie where Specializare_materie.id_specializare=@id_specializare and 
		Specializare_materie.id_materie=@id_materie)
		select @ReturnValue=0
select @ReturnValue as val
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateElev]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateElev] 
	@id_elev int,
	@nume nvarchar(50),
	@prenume nvarchar(50),
	@username nvarchar(50),
	@id_clasa int
AS
BEGIN
	update	Elev
	set		[Nume] = @nume, 
			[Prenume] = @prenume,
			[Username] = @username,
			[id_clasa]=@id_clasa
	where	id_elev = @id_elev
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateInregistrare]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateInregistrare]
	@username nvarchar(50),
	@parola nvarchar(50)
AS
BEGIN
	update	Inregistrare
	set		[Parola]=@parola
	where	Username=@username
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateMaterie]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateMaterie] 
	@id_materie int,
	@denumire nvarchar(50)
	
AS
BEGIN
	update	Materie
	set	[denumire]=@denumire
	where	id_materie=@id_materie
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateProf]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateProf] 
	@id_prof int,
	@nume nvarchar(50),
	@prenume nvarchar(50),
	@username nvarchar(50)
AS
BEGIN
	update	Profesor
	set		[Nume] = @nume, 
			[Prenume] = @prenume,
			[Username] = @username
	where	id_prof = @id_prof
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateProfMaterie]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateProfMaterie]
@id_prof int,
@id_materie int
AS
BEGIN
	insert into Prof_materie(id_prof, id_materie)
	values (@id_prof, @id_materie)
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateSpecializareMaterie]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateSpecializareMaterie]
@id_specializare int,
@id_materie int,
@teza bit
AS
BEGIN
	insert into Specializare_materie(id_specializare, id_materie, teza)
	values (@id_specializare, @id_materie, @teza)
END
GO
/****** Object:  StoredProcedure [dbo].[UsernameExista]    Script Date: 01-Jun-21 2:01:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsernameExista]
@username nvarchar(40)
AS
	declare @ReturnValue int
BEGIN
	if exists(select Username from Inregistrare where Inregistrare.Username=@username)
		select @ReturnValue=1
	else if not exists(select Username from Inregistrare where Inregistrare.Username=@username)
		select @ReturnValue=0
select @ReturnValue as val
END
GO
