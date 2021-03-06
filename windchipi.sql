USE [master]
GO
/****** Object:  Database [FashionShop]    Script Date: 2021-01-19 17:06:36 ******/
CREATE DATABASE [FashionShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Shopping', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Shopping.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Shopping_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Shopping_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FashionShop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FashionShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FashionShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FashionShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FashionShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FashionShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FashionShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [FashionShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FashionShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FashionShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FashionShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FashionShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FashionShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FashionShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FashionShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FashionShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FashionShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FashionShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FashionShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FashionShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FashionShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FashionShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FashionShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FashionShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FashionShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FashionShop] SET  MULTI_USER 
GO
ALTER DATABASE [FashionShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FashionShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FashionShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FashionShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FashionShop] SET DELAYED_DURABILITY = DISABLED 
GO
USE [FashionShop]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 2021-01-19 17:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[comments]    Script Date: 2021-01-19 17:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[product_id] [int] NULL,
	[comment_content] [ntext] NULL,
	[date_created] [datetime] NULL,
 CONSTRAINT [PK_comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[contacts]    Script Date: 2021-01-19 17:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[contacts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[phone] [varchar](50) NULL,
	[message] [ntext] NULL,
	[date_created] [datetime] NULL,
 CONSTRAINT [PK_contacts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[orders]    Script Date: 2021-01-19 17:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[product_id] [int] NULL,
	[number_products] [int] NULL,
	[total_money] [float] NULL,
	[status] [nvarchar](255) NULL,
	[freight_cost] [float] NULL,
	[date_created] [datetime] NULL CONSTRAINT [default_time]  DEFAULT (getdate()),
	[price] [float] NULL,
	[size] [varchar](255) NULL,
	[full_name] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[phone] [varchar](50) NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product_sizes]    Script Date: 2021-01-19 17:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_sizes](
	[product_id] [int] NOT NULL,
	[size_id] [int] NOT NULL,
 CONSTRAINT [PK_product_sizes] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[size_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[products]    Script Date: 2021-01-19 17:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[categories_id] [int] NULL,
	[price] [float] NULL CONSTRAINT [default_price]  DEFAULT ((0)),
	[images] [text] NULL,
	[sold] [int] NULL CONSTRAINT [default_view]  DEFAULT ((0)),
	[total] [int] NULL,
	[describe] [ntext] NULL,
	[images2] [text] NULL,
	[images3] [text] NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[roles]    Script Date: 2021-01-19 17:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[size]    Script Date: 2021-01-19 17:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[size](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
 CONSTRAINT [PK_size] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user_roles]    Script Date: 2021-01-19 17:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_roles](
	[user_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_user_roles] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 2021-01-19 17:06:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](250) NOT NULL,
	[email] [varchar](250) NOT NULL,
	[password] [varchar](250) NOT NULL,
	[phone] [varchar](15) NULL,
	[address] [nvarchar](250) NULL,
	[full_name] [nvarchar](250) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [name]) VALUES (1, N'Áo Kiểu')
INSERT [dbo].[categories] ([id], [name]) VALUES (2, N'Quần')
INSERT [dbo].[categories] ([id], [name]) VALUES (3, N'Áo Thun')
INSERT [dbo].[categories] ([id], [name]) VALUES (4, N'Đầm')
INSERT [dbo].[categories] ([id], [name]) VALUES (5, N'Váy')
SET IDENTITY_INSERT [dbo].[categories] OFF
SET IDENTITY_INSERT [dbo].[comments] ON 

INSERT [dbo].[comments] ([id], [user_id], [product_id], [comment_content], [date_created]) VALUES (2, 12, 1, N'Đầm xinh quá', CAST(N'2021-01-09 01:40:01.290' AS DateTime))
INSERT [dbo].[comments] ([id], [user_id], [product_id], [comment_content], [date_created]) VALUES (4, 6, 50, N'Quần đã đẹp rồi, người mẫu còn đẹp hơn nữa 😍', CAST(N'2021-01-09 01:42:22.497' AS DateTime))
INSERT [dbo].[comments] ([id], [user_id], [product_id], [comment_content], [date_created]) VALUES (5, 7, 55, N'Ai có eo 65 trở lên thì không nên mua nhé, hơi chật', CAST(N'2021-01-09 01:43:25.767' AS DateTime))
INSERT [dbo].[comments] ([id], [user_id], [product_id], [comment_content], [date_created]) VALUES (6, 7, 54, N'Quần năng động, cá tính', CAST(N'2021-01-09 01:43:47.667' AS DateTime))
INSERT [dbo].[comments] ([id], [user_id], [product_id], [comment_content], [date_created]) VALUES (7, 7, 53, N'Nhìn có vẻ đẹp, không biết ở ngoài có giống hình không 😆', CAST(N'2021-01-09 01:44:48.623' AS DateTime))
INSERT [dbo].[comments] ([id], [user_id], [product_id], [comment_content], [date_created]) VALUES (8, 9, 55, N'Mình đặt hàng hơn 2 tuần rồi chưa thấy, shop kiểm tra lại giúp ', CAST(N'2021-01-09 01:46:53.460' AS DateTime))
INSERT [dbo].[comments] ([id], [user_id], [product_id], [comment_content], [date_created]) VALUES (9, 2, 2, N'Mọi người nên mua nhé, sản phẩm tốt', CAST(N'2021-01-09 01:48:03.197' AS DateTime))
INSERT [dbo].[comments] ([id], [user_id], [product_id], [comment_content], [date_created]) VALUES (10, 10, 43, N'Mình đã mua 2 cái váy này và thấy hơi phí tiền. Váy hơi nhăn nhé', CAST(N'2021-01-09 01:50:58.730' AS DateTime))
INSERT [dbo].[comments] ([id], [user_id], [product_id], [comment_content], [date_created]) VALUES (11, 11, 19, N'Áo đẹp nên mình mua thêm 2 cái cho bạn bè 🤣', CAST(N'2021-01-09 01:53:46.480' AS DateTime))
INSERT [dbo].[comments] ([id], [user_id], [product_id], [comment_content], [date_created]) VALUES (12, 8, 26, N'Áo này sexy quá! 😁', CAST(N'2021-01-09 01:54:56.913' AS DateTime))
INSERT [dbo].[comments] ([id], [user_id], [product_id], [comment_content], [date_created]) VALUES (13, 4, 52, N'Quần này mặc đi dã ngoại đẹp nè!', CAST(N'2021-01-09 01:56:53.563' AS DateTime))
INSERT [dbo].[comments] ([id], [user_id], [product_id], [comment_content], [date_created]) VALUES (14, 4, 53, N'đẹp lắm luôn í', CAST(N'2021-01-09 01:58:05.067' AS DateTime))
INSERT [dbo].[comments] ([id], [user_id], [product_id], [comment_content], [date_created]) VALUES (15, 13, 4, N'Sản phẩm đẹp', CAST(N'2021-01-19 16:28:40.523' AS DateTime))
INSERT [dbo].[comments] ([id], [user_id], [product_id], [comment_content], [date_created]) VALUES (16, 6, 57, N'Quần này đẹp ghê, chờ có lương mua liền 😂', CAST(N'2021-01-19 16:58:12.520' AS DateTime))
INSERT [dbo].[comments] ([id], [user_id], [product_id], [comment_content], [date_created]) VALUES (17, 12, 57, N'Sản phẩm tốt, lần sau mình sẽ mua thêm', CAST(N'2021-01-19 16:58:40.417' AS DateTime))
SET IDENTITY_INSERT [dbo].[comments] OFF
SET IDENTITY_INSERT [dbo].[contacts] ON 

INSERT [dbo].[contacts] ([id], [full_name], [email], [phone], [message], [date_created]) VALUES (1, N'Duy Tiền', N'money@gmail.com', N'0975873465	', N'Mong shop nhập thêm hàng Quảng Châu bán, mình rất thích những sản phẩm đó.', CAST(N'2021-01-08 17:16:21.323' AS DateTime))
INSERT [dbo].[contacts] ([id], [full_name], [email], [phone], [message], [date_created]) VALUES (2, N'Hoàng Phi', N'hoangphi@gmail.com', N'0933784684', N'Trang web thật tuyệt', CAST(N'2021-01-08 17:16:52.133' AS DateTime))
INSERT [dbo].[contacts] ([id], [full_name], [email], [phone], [message], [date_created]) VALUES (3, N'Bá Phú', N'phuba3009@gmail.com', N'0784759515', N'Trang web khá ổn, nên cho phép thêm thanh toán online', CAST(N'2021-01-08 17:17:25.227' AS DateTime))
INSERT [dbo].[contacts] ([id], [full_name], [email], [phone], [message], [date_created]) VALUES (4, N'Thu Hiền', N'thuhien@gmail.com', N'0914152874', N'Tôi muốn hợp tác nhập sỉ quần áo, xin hãy phản hồi theo email hoặc sđt này', CAST(N'2021-01-08 17:17:57.047' AS DateTime))
INSERT [dbo].[contacts] ([id], [full_name], [email], [phone], [message], [date_created]) VALUES (5, N'Quang Duy', N'quangduy@gmail.com', N'0733758319', N'Tôi đã đặt hàng hơn 2 tuần rồi nhưng vẫn chưa được nhận hàng, xin hãy kiểm tra giúp tôi theo email này', CAST(N'2021-01-08 17:18:19.257' AS DateTime))
INSERT [dbo].[contacts] ([id], [full_name], [email], [phone], [message], [date_created]) VALUES (6, N'Bảo Hưng', N'denui@gmail.com', N'0783748192', N'Quần áo đẹp lắm ạ, lúc nào có sản phẩm mới thì báo cho mình biết với nhé.', CAST(N'2021-01-08 17:18:43.843' AS DateTime))
INSERT [dbo].[contacts] ([id], [full_name], [email], [phone], [message], [date_created]) VALUES (7, N'Trần Dần', N'trandan1383@gmail.com', N'0973184947', N'Sản phẩm chưa đa dạng lắm, nên bổ sung thêm các mặt hàng khác 😉', CAST(N'2021-01-08 17:19:14.277' AS DateTime))
INSERT [dbo].[contacts] ([id], [full_name], [email], [phone], [message], [date_created]) VALUES (8, N'Anh Tuấn', N'moneytuan@yahoo.com', N'0840389983', N'Trang web ổn, nhưng nên thêm tùy chọn trả tiền online ví dụ như momo, visa', CAST(N'2021-01-08 17:19:45.330' AS DateTime))
INSERT [dbo].[contacts] ([id], [full_name], [email], [phone], [message], [date_created]) VALUES (9, N'Nguyễn Văn Rin', N'rin@gmail.com', N'0981483048', N'Nên phát triển thêm nhiều tính năng như sale, thanh toán qua ví điện tử 😉', CAST(N'2021-01-19 16:28:01.220' AS DateTime))
SET IDENTITY_INSERT [dbo].[contacts] OFF
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [user_id], [product_id], [number_products], [total_money], [status], [freight_cost], [date_created], [price], [size], [full_name], [address], [phone]) VALUES (1, 9, 55, 1, 390000, N'nhận hàng', 0, CAST(N'2021-01-09 01:47:01.237' AS DateTime), 390000, N'M', N'Lý Thu Hiền', N'32 Kinh Dương Vương, Đà Nẵng', N'0876894361')
INSERT [dbo].[orders] ([id], [user_id], [product_id], [number_products], [total_money], [status], [freight_cost], [date_created], [price], [size], [full_name], [address], [phone]) VALUES (2, 2, 2, 1, 625000, N'chờ xác nhận', 0, CAST(N'2021-01-09 01:48:07.357' AS DateTime), 625000, N'S', N'Đặng Văn Bảo Hưng', N'14 Cù Chính Lan, Đà Nẵng', N'0989768432	')
INSERT [dbo].[orders] ([id], [user_id], [product_id], [number_products], [total_money], [status], [freight_cost], [date_created], [price], [size], [full_name], [address], [phone]) VALUES (3, 2, 4, 3, 2085000, N'nhận hàng', 0, CAST(N'2021-01-09 01:48:15.383' AS DateTime), 695000, N'M', N'Đặng Văn Bảo Hưng', N'14 Cù Chính Lan, Đà Nẵng', N'0989768432	')
INSERT [dbo].[orders] ([id], [user_id], [product_id], [number_products], [total_money], [status], [freight_cost], [date_created], [price], [size], [full_name], [address], [phone]) VALUES (4, 2, 49, 3, 1575000, N'nhận hàng', 0, CAST(N'2021-01-09 01:48:28.230' AS DateTime), 525000, N'L', N'Đặng Văn Bảo Hưng', N'14 Cù Chính Lan, Đà Nẵng', N'0989768432	')
INSERT [dbo].[orders] ([id], [user_id], [product_id], [number_products], [total_money], [status], [freight_cost], [date_created], [price], [size], [full_name], [address], [phone]) VALUES (5, 10, 43, 2, 494000, N'đang vận chuyển', 0, CAST(N'2021-01-09 01:49:25.133' AS DateTime), 247000, N'XL', N'Trần Duy Tiền', N'25 Tôn Đức Thắng, Đà Nẵng', N'0871262387')
INSERT [dbo].[orders] ([id], [user_id], [product_id], [number_products], [total_money], [status], [freight_cost], [date_created], [price], [size], [full_name], [address], [phone]) VALUES (6, 11, 19, 3, 885000, N'đang vận chuyển', 0, CAST(N'2021-01-09 01:52:13.263' AS DateTime), 295000, N'S', N'Nguyễn Tấn Tứ', N'04 Nguyễn Tất Thành, Đà Nẵng', N'0389781473')
INSERT [dbo].[orders] ([id], [user_id], [product_id], [number_products], [total_money], [status], [freight_cost], [date_created], [price], [size], [full_name], [address], [phone]) VALUES (7, 11, 16, 2, 360000, N'đang vận chuyển', 0, CAST(N'2021-01-09 01:53:53.863' AS DateTime), 180000, N'S', N'Nguyễn Tấn Tứ', N'04 Nguyễn Tất Thành, Đà Nẵng', N'0389781473')
INSERT [dbo].[orders] ([id], [user_id], [product_id], [number_products], [total_money], [status], [freight_cost], [date_created], [price], [size], [full_name], [address], [phone]) VALUES (8, 11, 13, 1, 395000, N'nhận hàng', 0, CAST(N'2021-01-09 01:53:58.673' AS DateTime), 395000, N'M', N'Nguyễn Tấn Tứ', N'04 Nguyễn Tất Thành, Đà Nẵng', N'0389781473')
INSERT [dbo].[orders] ([id], [user_id], [product_id], [number_products], [total_money], [status], [freight_cost], [date_created], [price], [size], [full_name], [address], [phone]) VALUES (9, 8, 26, 1, 425000, N'đang vận chuyển', 0, CAST(N'2021-01-09 01:55:02.400' AS DateTime), 425000, N'L', N'Trần Hoàng Hải', N'20 Thái Thị Bôi, Đà Nẵng', N'0976812376')
INSERT [dbo].[orders] ([id], [user_id], [product_id], [number_products], [total_money], [status], [freight_cost], [date_created], [price], [size], [full_name], [address], [phone]) VALUES (10, 8, 25, 1, 295000, N'chờ xác nhận', 0, CAST(N'2021-01-09 01:55:08.897' AS DateTime), 295000, N'L', N'Trần Hoàng Hải', N'20 Thái Thị Bôi, Đà Nẵng', N'0976812376')
INSERT [dbo].[orders] ([id], [user_id], [product_id], [number_products], [total_money], [status], [freight_cost], [date_created], [price], [size], [full_name], [address], [phone]) VALUES (12, 8, 53, 1, 430000, N'đang vận chuyển', 0, CAST(N'2021-01-09 01:55:28.573' AS DateTime), 430000, N'L', N'Trần Hoàng Hải', N'20 Thái Thị Bôi, Đà Nẵng', N'0976812376')
INSERT [dbo].[orders] ([id], [user_id], [product_id], [number_products], [total_money], [status], [freight_cost], [date_created], [price], [size], [full_name], [address], [phone]) VALUES (13, 4, 53, 1, 430000, N'đang vận chuyển', 0, CAST(N'2021-01-09 01:57:50.087' AS DateTime), 430000, N'XL', N'Trần Ngọc Anh', N'45 Trường Chinh, Đà Nẵng', N'0871398402	')
INSERT [dbo].[orders] ([id], [user_id], [product_id], [number_products], [total_money], [status], [freight_cost], [date_created], [price], [size], [full_name], [address], [phone]) VALUES (14, 4, 51, 2, 510000, N'nhận hàng', 0, CAST(N'2021-01-09 01:58:22.493' AS DateTime), 255000, N'L', N'Trần Tiểu My', N'43 Trường Chinh, Đà Nẵng', N'0871398402	')
INSERT [dbo].[orders] ([id], [user_id], [product_id], [number_products], [total_money], [status], [freight_cost], [date_created], [price], [size], [full_name], [address], [phone]) VALUES (15, 13, 4, 1, 695000, N'chờ xác nhận', 0, CAST(N'2021-01-19 16:29:02.990' AS DateTime), 695000, N'S', N'Nguyễn Văn Rin', N'23 An Dương Vương, Quảng Nam', N'0986409128')
INSERT [dbo].[orders] ([id], [user_id], [product_id], [number_products], [total_money], [status], [freight_cost], [date_created], [price], [size], [full_name], [address], [phone]) VALUES (16, 12, 57, 1, 495000, N'chờ xác nhận', 0, CAST(N'2021-01-19 16:58:47.813' AS DateTime), 495000, N'S', N'Đoàn Thị Bảo Linh', N'K23/03 Huyền Trân, Đà Nẵng', N'0879276548')
SET IDENTITY_INSERT [dbo].[orders] OFF
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (1, N'ĐẦM FORM BABYDOLL 3 TẦNG TAY PHỒNG', 4, 625000, N'http://localhost:8080/api/files/files/pro_da_1_83683f3650de4096b1d3f59ca6af63f4.webp', 0, 70, N'Miêu tả: Đầm form babydoll 3 tầng tay phồng
- Chất liệu: Cotton pha polyester

- Đầm sơmi form suông, hạ eo, tay ráp lăng, nhấn cut-out và rút dây sau lưng.

- Chất vải có pha ánh kim tuyết xinh xắn.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_da_2_8164c30da87a44e388f623034c867844.webp', N'http://localhost:8080/api/files/files/pro_da_4_7b6939e643114fe5b0b506fb0a7c0174.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (2, N'ĐẦM FORM MINI TRỄ VAI KÈM NỊT', 4, 625000, N'http://localhost:8080/api/files/files/pro_den_1_8c16a67ca4914dc58fa1a6a242cde9c3.webp', 1, 29, N'Miêu tả: Đầm form mini trễ vai kèm nịt
- Đầm mini form A, trễ vai, nhấn dây nịt bọc vải.

- Vải trơn, ít nhăn, có độ dày vừa phải, co giãn nhẹ.

- Thích hợp mặc đi chơi, đi tiệc.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_den_4_1aec003fa441460395bd124fb324e3eb.webp', N'http://localhost:8080/api/files/files/pro_den_6_202ae8cbfb094fd4b31e0623a9108036.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (3, N'ĐẦM MIDI 2 DÂY HOẠ TIẾT HOA DẬP NỔI', 4, 500000, N'http://localhost:8080/api/files/files/pro_hong_1_ae4ce05d8e1a46f3ac46ecae17129d73.webp', 0, 50, N'Miêu tả: Đầm midi 2 dây hoạ tiết hoa dập nổi
- Chất liệu: Sheer ép lưới

- Đầm 2 dây cúp ngực, tùng xòe rã 8 mảnh.

- Chất vải hơi đơ, có độ bung xòe. Bề mặt có hoa văn hình bông hoa, có sợi gân bắt ánh sáng. Phù hợp đi tiệc.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_hong_2_c293c116eaee460f9411b24f44170a65.webp', N'http://localhost:8080/api/files/files/pro_hong_4_706eab4da7804f56b53ee7dda3c1e800.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (4, N'ĐẦM MIDI XẺ LƯNG HOẠ TIẾT GỐM', 4, 695000, N'http://localhost:8080/api/files/files/pro_xanh_duong_1_c2352fdd104f4c0a8d5dd6fa21abe960.webp', 4, 51, N'Miêu tả: Đầm midi xẻ lưng hoạ tiết gốm
- Chất liệu: Voan (có lót)

- Đầm thiết kế cổ V gợi cảm, tôn dáng.

- Chi tiết xẻ lưng tăng thêm phần phóng khoáng cho trang phục.

- Thích hợp diện đi chơi, tiệc tùng, du lịch.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_xanh_duong_4_43f09ba32a7842009f023b3f36cfe7e4.webp', N'http://localhost:8080/api/files/files/pro_xanh_duong_5_908e740edb364b03acf2936da3fec845.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (5, N'ĐẦM TAY PHỒNG HOẠ TIẾT HOUNDSTOOTH', 4, 845000, N'http://localhost:8080/api/files/files/pro_den_1_0199f6fb828b4fa5893e367a82dbc578.webp', 1, 59, N'Miêu tả: Đầm tay phồng hoạ tiết houndstooth
- Chất liệu: Xốp dập nổi họa tiết răng sói

- Đầm tay phồng cúp ngực nhún li phồng ở phần tùng, giúp tôn số đo vòng 1-2.

- Tay phồng khéo léo che được khuyết điểm ở bắp tay.

- Thích hợp đi tiệc sang trọng.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_den_4_f39300dc54114e18a23f3f6854bba921.webp', N'http://localhost:8080/api/files/files/pro_den_5_aba56bb547a444adaee610d23c535b46.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (6, N'ĐẦM MIDI ĐẮP CHÉO VAI NHẤN LY TÙNG', 4, 1099000, N'http://localhost:8080/api/files/files/pro_do_1_739837dfa08f46faa7a9e494f565c119.webp', 0, 30, N'Miêu tả: Đầm midi đắp chéo vai nhấn ly tùng
- Vải trơn, it nhăn, có độ dày vừa  phải, co giãn nhẹ.

- Chất liệu mướt, dày dặn, có giãn nhẹ, đứng form.

- Đầm trễ vai form A xếp li tạo phồng, tôn eo, che bắp tay.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_do_4_7d7f9a62eda342799f3a94c7e11b2157.webp', N'http://localhost:8080/api/files/files/pro_do_5_e0e0cf2153494e928344878e8b5a7a6e.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (7, N'ĐẦM FORM ÔM CỔ VUÔNG NHÚN NGỰC', 4, 675000, N'http://localhost:8080/api/files/files/pro_da_1_be4bc227fd86438fbc55eedc21a2f208.webp', 0, 50, N'Miêu tả: Đầm form ôm cổ vuông nhún ngực
- Chất liệu: Satin

- Form ôm tôn dáng, quyến rũ.

- Điểm nhấn nằm ở phần nhún ngực.

- Phù hợp cho những bữa tiệc sang trọng.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_da_2_2656567022da4d5d837dbad61e3c2eec.webp', N'http://localhost:8080/api/files/files/pro_da_4_eb1ac57b7fbb479ab98a1e567aa4c5b7.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (8, N'ĐẦM 2 DÂY REN CÚP NGỰC TÙNG XẾP LY', 4, 745000, N'http://localhost:8080/api/files/files/pro_den_1_3d733b40b72f4db6839839cfa9cd754e.webp', 0, 55, N'Miêu tả: Đầm 2 dây ren cúp ngực tùng xếp ly
- Chất liệu: Lưới ép họa tiết caro

- Đầm lưới caro hai dây xếp li tạo khối tôn vòng 1, tùng A xếp phồng nhẹ.

- Chất liệu lưới trong suốt sexy, có họa tiết caro dập nổi lên bề mặt tạo sự
mới lạ, bắt mắt.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_den_2_06ea863231ac4fefb8cbcc83aa8da5fe.webp', N'http://localhost:8080/api/files/files/pro_den_4_4a96838a920b4ef2bed170a3938788ac.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (9, N'ĐẦM REN BI FORM ÔM RÚT NHÚN TAY PHỒNG', 4, 730000, N'http://localhost:8080/api/files/files/pro_da_1_8c2ed0e8392b4ee68e675ff66d9e456d.webp', 0, 50, N'Miêu tả: Đầm ren bi form ôm rút nhún tay phồng
- Chất liệu: Lưới ép chấm bi nhung

- Đầm body nhúng lưới, lớp lót màu da tinh tế, tay phồng trendy.

- Chất liệu lưới trong suốt sexy, có họa tiết chấm bi đen dập nổi lên bề mặt tạo sự
mới lạ, bắt mắt.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_da_4_a16591bf2ede45af9f70941d10b69afb.webp', N'http://localhost:8080/api/files/files/pro_da_5_07615129dd4543f2b7810fcf31784b43.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (10, N'ĐẦM KNIT MIDI TRỄ VAI', 4, 655000, N'http://localhost:8080/api/files/files/pro_den_2_e86f3f50330a4ab88dd0e37d7f6ffc04.webp', 0, 40, N'Miêu tả: Đầm knit midi trễ vai
- Chất liệu: Thun xớ sọc

- Đầm midi 2 dây thiết kế trễ vai tôn dáng, gợi cảm mà vẫn mang tới vẻ thanh lịch cho người mặc.

- Thích hợp diện đi chơi, đi tiệc.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_den_4_605de1b2a6a9443686d4fe90c465497f.webp', N'http://localhost:8080/api/files/files/pro_den_5_5578134cc4a74a98ab9005ff1933283f.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (11, N'ĐẦM PHỐI VẢI VOAN CARO CỘT NƠ', 4, 695000, N'http://localhost:8080/api/files/files/pro_xam_4_247951c5681f43f0a4f0025393e4e3b8.webp', 0, 35, N'Miêu tả: Đầm phối vải voan caro cột nơ
- Chất liệu: Polyester hoạ tiết caro phối vải crepe

- Chất vải poly hoạ tiết caro mỏng nhẹ, thoáng mát, ít nhăn.

- Đầm form A phối vải crepe trắng, cột nơ cổ và smocking ở tay.

- Mang đến cho nàng vẻ đẹp thanh lịch, duyên dáng nơi công sở cũng như điểm hẹn.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_xam_5_ec7e6cf4e2da4b77aef7d1cb0a33522d.webp', N'http://localhost:8080/api/files/files/pro_xam_6_22b2d4f4b7134c028621cee54eccf1f6.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (12, N'ĐẦM 2 DÂY XẾP NGỰC TÙNG NHẤN LY', 4, 525000, N'http://localhost:8080/api/files/files/pro_da_1_c7a2bb93081b4a9faec68e04eab4d66b.webp', 0, 50, N'Miêu tả: Đầm 2 dây xếp ngực tùng nhấn ly
- Đầm 2 dây, nhún ngực, điểm nhấn là phần tùng A bất đối xứng.

- Chất vải mềm rủ, thoáng mát, ít nhăn. Bề mặt có sọc ngang, dọc ẩn.

- Thích hợp diện đi chơi, tiệc tùng.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_da_4_bc76390354a84cb297704d8a9d769a68.webp', N'http://localhost:8080/api/files/files/pro_da_5_d430f90dbe6d4c89a1a446f6c620f75a.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (13, N'ÁO THUN TRỄ VAI NHẤN NÚT', 3, 395000, N'http://localhost:8080/api/files/files/pro_den_1_6ecedd442a9b4f6d8c5e8483768af317.webp', 1, 49, N'Miêu tả: Áo thun trễ vai nhấn nút
- Chất liệu: Thun gân

- Áo thun trễ vai, nhấn nút kim loại.

- Chất liệu có độ co giãn tốt, ôm sát body sexy.

- Dễ phối cùng nhiều items khác.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_den_3_2244a7b021924685a2f6418f5b2a37f0.webp', N'http://localhost:8080/api/files/files/pro_den_4_9037b0c5df6047db852f28653d0f6934.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (14, N'ÁO THUN TANK CỔ CAO SỌC NGANG', 3, 245000, N'http://localhost:8080/api/files/files/pro_do_1_b741053826a0469ea6e13d24ea3e0c2c.webp', 0, 50, N'Miêu tả: Áo thun tank cổ cao sọc ngang
- Chất liệu: Thun dệt sọc

- Áo thun ba lỗ họa tiết kẻ sọc.

- Chất liệu thun co giãn tốt, mềm mại thoải mái, hoạ tiết dệt kẻ sọc bắt mắt.

- Năng động, trẻ trung, dễ phối cùng các items khác.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_do_2_386ff9b6464d49bf8cf1c9573f24972f.webp', N'http://localhost:8080/api/files/files/pro_do_4_1db933ee478c414a8bf2fa16b1a73f04.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (15, N'ÁO THUN GÂN CỔ VUÔNG', 3, 295000, N'http://localhost:8080/api/files/files/pro_trang_1_09aed4f532484d538a888793eede94a6.webp', 0, 60, N'Miêu tả: Áo thun gân cổ vuông
- Chất liệu: Thun gân

- Thiết kế cổ vuông gợi cảm mà tinh tế. 

- Kiểu dáng ôm vừa vặn cơ thể vừa thoải mái vừa tôn lên đường cong cuốn hút.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.

', N'http://localhost:8080/api/files/files/pro_trang_2_f239d0be13684d348e4ed1572f115b84.webp', N'http://localhost:8080/api/files/files/pro_trang_3_f04dc1f088534441824878f07f017de2.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (16, N'ÁO THUN GRAPHIC EVERYTHING IS GONNA BE OK CỘT NƠ', 3, 180000, N'http://localhost:8080/api/files/files/pro_trang_2_b15d8a791e804d69964b98b82c9629f6.webp', 2, 48, N'Miêu tả: Áo thun graphic everything is gonna be ok cột nơ
- Chất liệu: Thun cotton

- Mẫu áo thun năng động dáng crop cột nơ với thông điệp "Everything is gonna be ok" và hình vẽ thả tim đầy sinh động khiến người mặc trông đáng yêu, đầy sức sống hơn, rất thích hợp đồng hành cùng bạn mùa Cô Vy.

- Dễ dàng mix&match với nhiều mẫu quần/ chân váy.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_trang_3_fdb1a6ec478b4b419bd187cceecffebb.webp', N'http://localhost:8080/api/files/files/pro_trang_4_e47d8250911248b0b93d7496b71e6dbb.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (17, N'ÁO THUN GRAPHIC STAYHOME STAYSTRONG', 3, 255000, N'http://localhost:8080/api/files/files/pro_trang_1_91b6d26a823c4c0da73eed7a5b7f8701.webp', 0, 50, N'Miêu tả: Áo thun graphic stayhome staystrong
- Chất liệu: Thun cotton

- Mẫu áo thun năng động với thông điệp "stay home, stay strong, stay safe" thích hợp đồng hành cùng bạn mùa Cô Vy.

- Dễ dàng mix&match với nhiều mẫu quần/ chân váy.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_trang_4_44de16e944754d76a33457ac0fed65f5.webp', N'http://localhost:8080/api/files/files/pro_trang_5_64e67c5269574f5da5b3edc488e97c80.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (18, N'ÁO THUN GÂN TANK TOP CỔ CAO', 3, 195000, N'http://localhost:8080/api/files/files/pro_da_1_e94d76e8f587477e876c86d13ff744dd.webp', 0, 60, N'Miêu tả: Áo thun gân tank top cổ cao
- Chất liệu: Thun gân

- Chiếc áo chắc chắn sớm trở thành must-have item của những cô nàng yêu thời trang. Với item này nàng dễ dàng phối cùng chân váy và các rất nhiều mẫu quần để có được set đồ gọn gàng, thanh lịch và quyến rũ.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_da_2_937193788190431c84c6c9d5d18c257a.webp', N'http://localhost:8080/api/files/files/pro_da_4_b5d433da99de4ad3b6ab3239362a79df.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (19, N'ÁO THUN GÂN CỔ THUYỀN TAY DÀI', 3, 295000, N'http://localhost:8080/api/files/files/pro_xanh_duong_1_601f1c3fcba24122a974e694d0c95c7a.webp', 3, 47, N'Miêu tả: Áo thun gân cổ thuyền tay dài
- Chất liệu: Thun gân

- Tiếp tục là một thiết kế basic nhưng vẫn toát lên dáng vẻ sành điệu, cuốn hút cho người mặc. 

- Tính ứng dụng cao, phù hợp với nhiều bối cảnh trong đời sống hằng ngày.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_xanh_duong_2_ff3572561898484dba83853ee05c5071.webp', N'http://localhost:8080/api/files/files/pro_xanh_duong_3_60cef0752abd41e3b13746f29bb8a4e6.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (20, N'ÁO THUN 2 DÂY TANKTOP CƠ BẢN', 3, 35000, N'http://localhost:8080/api/files/files/pro_vang_1_2d5a9a15ec8349a1b9f91abd46f7e92b.webp', 0, 70, N'Miêu tả: Áo thun 2 dây tanktop cơ bản
Mô tả:
- Chất liệu: Thun gân cotton thoáng mát, pha spandex nên tính co giãn cực tốt. Sự kết hợp giúp sản phẩm có độ bền cao và ít nhăn hơn các chất liệu thông thường.
- Áo tank top 2 dây basic với logo MARC được thêu ở thân sau áo, hứa hẹn là một item must-have đốt cháy mùa hè năm nay và được các cô nàng diện nhiều nhất.
- Form dáng ôm gọn vào cơ thể giúp người mặc khoe đường cong triệt để.
- Gồm 4 màu sắc đầy tính giải nhiệt mùa hè: nâu kẻ sọc trendy, xanh dương basic, màu nude trang nhã và vàng trẻ trung.
- Tính tiện dụng cao, dễ mix với nhiều item có sẵn như quần short, jeans, quần ống suông và chân váy mini. Không style nào làm khó được tank top.
Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_vang_2_bda0bcb608b84c5da4a33e7d6c7dd739.webp', N'http://localhost:8080/api/files/files/pro_vang_3_2fda85f8472d4eae8c7d897f74374001.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (21, N'ÁO THUN CƠ BẢN FORM ÔM', 3, 155000, N'http://localhost:8080/api/files/files/pro_den_1_f6c6673d6839467d8aa5182edaf7fa36.jpg', 0, 60, N'Miêu tả: Áo thun cơ bản form ôm
 

Mô tả:

- Chất liệu: Thun cotton
- Áo thun cơ bản cổ tròn tay ngắn, nhiều màu sắc, dễ dàng phối với các item khác. 1 item không thể nào thiếu của các cô nàng hiện đại.
Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_den_2_db486cb07c0145b9aef2f7db3e5d7152.webp', N'http://localhost:8080/api/files/files/pro_den_4_ac921d99005f471a9b5ee4cc42866a15.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (22, N'ÁO THUN TAY DÀI IN LOGO MARC', 3, 118000, N'http://localhost:8080/api/files/files/pro_xanh_la_1_b4e7603860c44d209033a6495f7b138d.webp', 0, 50, N'Miêu tả: Áo thun tay dài in logo MARC
Mô Tả:
- Chất Liệu: 97% Polyester 3% Spandex
- Áo thun cổ lọ tay dài với màu xanh chuối hot trend.
- Điểm nhấn là hoạ tiết in đồ hoạ thương hiệu MARC với kỹ thuật in nhũ hiện đại.
- Một mẫu áo thun hiện đại thời trang khoẻ khoắn dễ phối hợp với nhiều loại trang phục khác nhau.
Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Để tránh ra màu, không ngâm sản phẩm.
- Ủi ở nhiệt độ không quá 180 độ C.
- Nên giặt hấp.', N'http://localhost:8080/api/files/files/pro_xanh_la_3_e701b074c35345cd893b142f4d937051.webp', N'http://localhost:8080/api/files/files/pro_xanh_la_2_1f5fd7318ce4451e9743351869312c12.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (23, N'ÁO THUN CROP TOP TAY CON', 3, 225000, N'http://localhost:8080/api/files/files/pro_hong_4_ffa1e0e1d9da41a280e7add72e7c1df4.webp', 0, 50, N'Miêu tả: Áo thun crop top tay con
- Chất liệu: Thun

- Áo thun độn vai dáng croptop vừa trendy vừa năng động, nhiều tính ứng dụng. Diện cùng jeans, shorts, hay chân váy đều rất xinh và cá tính.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_hong_3_5df6ee8f31594bfe981403962fb55f50.webp', N'http://localhost:8080/api/files/files/pro_hong_2_ab94b637ab824aefb382d3fde171addd.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (24, N'ÁO THUN ĐỘN VAI TRENDY 2020', 3, 140000, N'http://localhost:8080/api/files/files/pro_trang_1_e0a6fa5881264f21bc0cd2d88a7d598b.webp', 0, 50, N'Miêu tả: Áo thun độn vai trendy 2020
- Chất liệu: Thun

- Must-have item của năm nay chính là mẫu áo thun độn vai này. Kết hợp dễ dàng với nhiều mẫu quần/ chân váy cho ra những set đồ năng động và trendy.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_trang_3_e4e62b3e2c6d415188ee3cfd81630e10.webp', N'http://localhost:8080/api/files/files/pro_trang_2_55d9ea84ff214bde8578cbc33aebcc9f.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (25, N'ÁO KNIT SÁT NÁCH CỔ CAO', 1, 295000, N'http://localhost:8080/api/files/files/pro_tim_1_15a6523e07284c659a8590b648259f21.webp', 1, 49, N'Miêu tả: Áo knit sát nách cổ cao
- Chất liệu: Thun sọc

- Áo sát nách form cơ bản với phần cổ cao thanh lịch, quyến rũ.

- Dễ phối với quần jeans, quần tây, chân váy để đi làm, đi chơi.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_tim_3_a746acc9300444e6bf6f8f71ee39b36d.webp', N'http://localhost:8080/api/files/files/pro_tim_4_7c789a28daf04d8198a0572dc4584b30.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (26, N'ÁO KIỂU CROP TAY DÀI NƠ EO', 1, 425000, N'http://localhost:8080/api/files/files/pro_den_1_22bb89f800de4ce69ffe72bfd1d4409a.webp', 1, 49, N'Miêu tả: Áo kiểu crop tay dài nơ eo
- Thiết kế đắp chéo gợi cảm, trendy.

- Hoạ tiết kẻ caro trẻ trung, không kén dáng người.

- Dáng crop tôn lên vòng eo cuốn hút của người mặc.

- Thích hợp diện đi chơi, tiệc nhẹ, đặc biệt nổi bật cho mùa lễ hội.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_den_3_2a6ab65bc68c490baa5f105fd0a8ece5.webp', N'http://localhost:8080/api/files/files/pro_den_4_6c3d757f608848edb69f8bf4945d8d5c.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (27, N'ÁO KNIT TAY DÀI LỆCH VAI', 1, 325000, N'http://localhost:8080/api/files/files/pro_xanh_la_1_a0146ea58e5e43dcab070d274006bf82.webp', 0, 50, N'Miêu tả: Áo knit tay dài lệch vai
- Chất liệu: Thun xớ sọc

- Thiết kế lệch vai đầy ngẫu hứng và độc đáo.

- Tôn dáng, gợi cảm nhưng vẫn kín đáo vừa phải.

- Thích hợp diện đi chơi, tiệc tùng, lễ hội.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_xanh_la_2_5fa05828199c434f84e8240f82cfa006.webp', N'http://localhost:8080/api/files/files/pro_xanh_la_4_163b25a50ba448b99b4c9ea799fa0772.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (28, N'ÁO KIỂU SATIN LỆCH VAI RÚT DÂY', 1, 425000, N'http://localhost:8080/api/files/files/pro_hong_1_82104202282e46c8822aca0fd729db4a.webp', 0, 50, N'Miêu tả: Áo kiểu satin lệch vai rút dây
- Chất liệu: Satin

- Thiết kế lệch vai mới lạ, ấn tượng

- Mang tới dáng vẻ gợi cảm mà vẫn tinh tế, sang trọng

- Đi chơi, đi tiệc đều rất phù hợp

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_hong_4_023fea86a0d14af0ba856517c8d77ea3.webp', N'http://localhost:8080/api/files/files/pro_hong_2_91d96fc70a7b4ab9a11db3c07e16b9ce.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (29, N'ÁO KIỂU CROP TAY PHỒNG HOẠ TIẾT GINGHAM', 1, 395000, N'http://localhost:8080/api/files/files/pro_hong_1_dc8a550cc537430c93bf2f1e1c820b69.webp', 0, 50, N'Miêu tả: Áo kiểu crop tay phồng hoạ tiết gingham
- Chất liệu: Polyester

- Form dáng trẻ trung, năng động.

- Thiết kế cổ vuông thanh lịch mà vẫn gợi cảm.

- Kết hợp được với nhiều items khác mang tới những bộ cánh năng động và cuốn hút.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_hong_2_8e3e7150f1584f7e9db80f099a73785d.webp', N'http://localhost:8080/api/files/files/pro_hong_3_45f083567b56456ebf5199f86ceaaf1a.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (30, N'ÁO KHOÁC FORM CROP CỔ TRÒN', 1, 685000, N'http://localhost:8080/api/files/files/pro_trang_1_abf29c0c813c4bb4bda066a068c737f8.webp', 0, 50, N'Miêu tả: Áo khoác form crop cổ tròn
- Áo khoác form dáng trendy, đang làm mưa làm gió trên mọi mặt trận.

- Dễ phối, có thể kết hợp theo set có sẵn.

- Sang trọng, tinh tế, phù hợp với nhiều bối cảnh.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_trang_2_be15cd4773e24c6483308a9b87cd104f.webp', N'http://localhost:8080/api/files/files/pro_trang_4_0eb5a9e2aa8d49a6a898fabbdd4c51e2.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (31, N'ÁO KIỂU NHÚN NGỰC TAY DÀI SMOCKING', 1, 425000, N'http://localhost:8080/api/files/files/pro_den_1_af4108fabe434b2baab28f3c45e156d5.webp', 0, 50, N'Miêu tả: Áo kiểu nhún ngực tay dài smocking
- Chất liệu: Voan (có lót)

- Thiết kế cổ vuông gợi cảm, trendy. Phần smoking giúp tôn vòng một.

- Tay phồng giúp che khuyết điểm bắp tay cho người mặc

- Thích hợp diện đi chơi, dạo phố, tiệc nhẹ

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.

', N'http://localhost:8080/api/files/files/pro_den_2_98de5902c7ec40c4a32833631a4bc882.webp', N'http://localhost:8080/api/files/files/pro_den_3_15dea3b5023447b68a2cce728ff9fbd4.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (32, N'ÁO TRỄ VAI SMOCKING LƯNG HOẠ TIẾT', 1, 455000, N'http://localhost:8080/api/files/files/pro_hong_1_257f917a139b4be981b07e69408abca7.webp', 0, 50, N'Miêu tả: Áo trễ vai smocking lưng hoạ tiết
- Chất liệu: Chiffon

- Áo trễ vai tay phồng, có phần smocking ngay eo tôn dáng mang tới cảm giác sexy. Có thể phối với quần jean, quần shorts, váy chữ A.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_hong_4_31d1fd7b06e24753b8078e9e239048d5.webp', N'http://localhost:8080/api/files/files/pro_hong_3_90754a572dce4034b688ab5df943b5e1.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (33, N'ÁO SƠ MI DÀI TAY CROP CỘT DÂY', 1, 230000, N'http://localhost:8080/api/files/files/pro_den_1_6d21578bf9d54abaa4be5b4364b853df.webp', 0, 50, N'Miêu tả: Áo sơ mi dài tay crop cột dây
- Sơmi dáng crop có bề mặt vải dệt sọc và chi tiết thắt nơ ở eo làm điểm nhấn đầy ấn tượng.
- Thích hợp đi làm, đi shopping, đi dạo cuối tuần.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_den_4_331d039591db464d8131519ebf5b2fe1.webp', N'http://localhost:8080/api/files/files/pro_den_3_2de2eb58f4764ae0a94653a18d799414.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (34, N'ÁO SƠ MI NẮP TÚI SATIN', 1, 250000, N'http://localhost:8080/api/files/files/pro_xanh_duong_2_f5911dcea3d64ebba1a8d287890d587b.webp', 0, 50, N'Miêu tả: Áo sơ mi nắp túi satin
- Thuộc BST mới nhất của MARC.

- Chất liệu satin sang trọng, quyến rũ.

- Form dáng rộng rãi thoải mái, tạo cảm giác dễ chịu cho người mặc.

- Thiết kế basic trên nền chất liệu satin sang trọng khiến item trở nên thu hút, bổi bật hơn. 

- Chi tiết nắp túi làm điểm nhấn cho trang phục.

- Phù hợp cho môi trường công sở, đi làm và đi chơi đều xinh xắn, thanh lịch.

Hướng dẫn bảo quản:

- Tránh xếp và gấp nhiều, nên treo móc để giữ phần dập li không biến dạng.
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_xanh_duong_1_0563d125481a476d853267d9873e6df0.webp', N'http://localhost:8080/api/files/files/pro_xanh_duong_5_329f7eeac090465491afe64baf743453.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (35, N'ÁO SƠ MI CROP NHÚN EO', 1, 149000, N'http://localhost:8080/api/files/files/pro_den_1_0d2fba53fe1a4bd6a45e0552e924eb45.webp', 0, 50, N'Miêu tả: Áo sơ mi crop nhún eo
- Sơmi croptop cơ bản có bề mặt vải dệt sọc. Phần bo thun tiện dụng, trẻ trung.
- Thích hợp đi làm, đi shopping, đi dạo cuối tuần.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_den_3_a71d189c9cc34eddbadd83c7e678704b.webp', N'http://localhost:8080/api/files/files/pro_den_4_7d5a7d26e49141cbad0c9823bbace8aa.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (36, N'ÁO KIỂU TAY DÀI CROP XẺ NGỰC', 1, 395000, N'http://localhost:8080/api/files/files/pro_tim_1_ecbed0acef334f03b02d7860611b8891.webp', 0, 60, N'Miêu tả: Áo kiểu tay dài crop xẻ ngực
- Thiết kế vừa thanh lịch, duyên dáng lại có chút gì đó gợi cảm. Hứa hẹn đây là sẽ item được rất nhiều cô nàng ưa chuộng. Bên cạnh đó thiết kế cũng có tính ứng dụng cao khi dễ dàng kết hợp với nhiều mẫu quần và chân váy khác nhau. 

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_tim_5_6335c7c5a8ed4dbebdd7db22194a26d4.webp', N'http://localhost:8080/api/files/files/pro_tim_4_e29498e11df8456496612ae23bf014b1.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (37, N'VÁY RÚT NHÚN LƯNG LIỀN', 5, 395000, N'http://localhost:8080/api/files/files/pro_xam_1_eb7711c5c5da4befae73bc38b81640bd.webp', 0, 55, N'Miêu tả: Váy rút nhún lưng liền
- Chất liệu: Lụa

- Thiết kế dây rút nhún nhẹ chỗ thắt lưng chắc chắn là điểm nhấn xinh yêu thu hút mọi ánh nhìn. Với mẫu chân váy này nàng có thể diện đi làm, đi chơi đều vô cùng thanh lịch, thướt tha.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_xam_2_d939d31fb51b46f3985b6d91d4a50f4d.webp', N'http://localhost:8080/api/files/files/pro_xam_3_97690f5feeda47c6bdfc1559f393df61.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (38, N'VÁY MIDI XẾP LI HỢP', 5, 495000, N'http://localhost:8080/api/files/files/pro_hong_1_3272ebe1c8c248f19e78b0989c0ebe30.webp', 0, 50, N'Miêu tả: Váy midi xếp li hợp
- Chân váy xếp li mang đến sự thanh lịch, vừa cổ điển lại thướt tha cho người mặc. Item này nàng phối với sơ mi, áo kiểu đến công sở vô cùng phù hợp. Để diện đi chơi nàng có thể dễ dàng mix cùng áo thun kiểu dáng trẻ trung nhé.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_hong_2_48a7b685be58405a9ad2ca9a3c8148c8.webp', N'http://localhost:8080/api/files/files/pro_hong_3_dde5aa7920a9482cbadfe6be01c473e3.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (39, N'VÁY MINI NHẤN LY PHỒNG', 5, 230000, N'http://localhost:8080/api/files/files/pro_trang_1_6c549e31454942d5aadc316724c727b9.webp', 0, 40, N'Miêu tả: Váy mini nhấn ly phồng
- Item cực hot nhà MARC. Vừa ra mắt đã thuộc top best-seller.

- Thiết kế nhấn ly nhẹ nhàng mà hiệu quả, khéo léo tôn dáng cho người mặc.

- Độ dài vừa phải, phù hợp với nhiều môi trường và bối cảnh.

- Mang tới cảm giác trẻ trung, năng động và không bao giờ lỗi mốt.

- Phù hợp đi làm và cho những chuyến đi chơi, gặp gỡ bạn bè hay đi hẹn hò. 

- Mix cùng áo thun, croptop để có những set đồ trendy, thời thượng nhất.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_trang_2_74fc0a84dcb2464cbde038ca101f4a40.webp', N'http://localhost:8080/api/files/files/pro_trang_3_7f7e8ed865214788bf709a86c2af3d23.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (40, N'VÁY MINI NHÚN RÃ', 5, 455000, N'http://localhost:8080/api/files/files/pro_hong_4_48e5d233facb4aa88be38f5505b17520.webp', 0, 50, N'Miêu tả: Váy mini nhún rã
- Chân váy mini xinh xắn được may form dáng xoè trên tone hồng cực đáng yêu, trẻ trung.

- Thích hợp diện đi chơi, cà phê cùng bạn bè hay đi hẹn hò.

Hướng dẫn bảo quản:

- Tránh xếp và gấp nhiều, nên treo móc để giữ phần dập li không biến dạng.
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_hong_2_ef904e244f36415fa9898dd3d0b1c53a.webp', N'http://localhost:8080/api/files/files/pro_hong_3_d116ccbfafa54929822fea2e5422373b.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (41, N'VÁY HOẠ TIẾT NGỰA VẰN', 5, 215000, N'http://localhost:8080/api/files/files/pro_xam_3_df20d2452d4f41aaa03f354558196d06.webp', 0, 50, N'Miêu tả: Váy hoạ tiết ngựa vằn
- Chất liệu: Voan cát

- Thuộc BST mới nhất của MARC

- Có lớp lót dày dặn, kín đáo

- Thiết kế nhún 1 bên khéo léo che bụng dưới. Kết hợp đường xẻ 1 bên tạo sự quyến rũ, duyên dáng khi di chuyển.
- Thích hợp diện đi shopping, đi cà phê cuối tuần.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_xam_2_f325a665ee8b4a5cb01ef6c784506ece.webp', N'http://localhost:8080/api/files/files/pro_xam_1_878539e8b2334c0db98b2df6fccb18e6.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (42, N'VÁY MIDI NHUNG TĂM', 5, 370000, N'http://localhost:8080/api/files/files/pro_den_1_3ff5d79f2d474243977ce083ca638b58.webp', 0, 50, N'Miêu tả: Váy midi nhung tăm
- Chất liệu: Nhung tăm

- Váy midi dáng cơ bản cần có cho tủ đồ của mọi cô nàng. Hiện đại và timeless, không lỗi mốt. Phối cùng sơ mi, áo kiểu, áo thun cho nàng dáng vẻ thanh lịch, quý phái.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_den_2_73e536ab8d7f46cab5ef8753b5249771.webp', N'http://localhost:8080/api/files/files/pro_den_3_49dc2ec37f2e4e78bff442e6de413612.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (43, N'VÁY MIDI RÃ 6 MẢNH', 5, 247000, N'http://localhost:8080/api/files/files/pro_xam_1_9d5206ed90ff48c09fe826f764b2078b.webp', 2, 53, N'Miêu tả: Váy midi rã 6 mảnh
- Chân váy midi thanh lịch thích hợp mặc đi làm, đi cà phê.

- Thiết kế có độ xoè rũ làm tăng thêm phần thướt tha, nữ tính cho người mặc.

Hướng dẫn bảo quản:

- Tránh xếp và gấp nhiều, nên treo móc để giữ phần dập li không biến dạng.
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_xam_2_5382c0422606427990c1ea05f1b28b39.webp', N'http://localhost:8080/api/files/files/pro_xam_3_ac39542d36ea426c853f6469912ea884.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (44, N'VÁY FORM ÔM PHỐI DÂY KÉO BÈO', 5, 499000, N'http://localhost:8080/api/files/files/pro_nau_1_adac3f31394647c4a4d75b0bc07f4161.webp', 0, 35, N'Miêu tả: Váy form ôm phối dây kéo bèo
- Chất liệu: Kaki bố

- Chân váy form ôm tôn dáng, thanh lịch.

- Kết hợp với phần dây kéo được cách điệu thêm bèo nhún điệu đà, tạo điểm nhấn.

- Hứa hẹn là item không thể thiếu đối với các cô gái công sở vì sự tiện dụng, dễ phối mà vẫn ấn tượng đi kèm sự nữ tính, thanh lịch và sang trọng.

Hướng dẫn bảo quản:

- Giặt ở nhiệt độ thường.

- Không dùng chất tẩy.

- Phơi trong bóng râm.

- Không ngâm quần áo để tránh ra màu.

- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_nau_2_1d435dade7874c549ed2bf210694e420.webp', N'http://localhost:8080/api/files/files/pro_nau_4_29adee3c8b304334944ad913857cd040.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (45, N'VÁY TENNIS MINI XẾP LY', 5, 355000, N'http://localhost:8080/api/files/files/pro_den_1_c0a833c14d694e7eb51d218324d183b4.webp', 0, 70, N'Miêu tả: Váy tennis mini xếp ly
- Item mang tới sự trẻ trung, năng động cho người mặc

- Kiểu váy tennis xếp ly không bao giờ lỗi mốt

- Tiện dụng, dễ phối với nhiều items khác

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_den_3_37149b0c4cba4733b0eda62c613654bd.webp', N'http://localhost:8080/api/files/files/pro_den_4_d57f0dd998b442ccb0712789f80d8728.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (46, N'VÁY MINI BASIC HOẠ TIẾT ZICZAC', 5, 410000, N'http://localhost:8080/api/files/files/pro_trang_1_ba507e72e47a46b1aff73231636d7532.webp', 0, 55, N'Miêu tả: Váy mini basic hoạ tiết ziczac
- Thiết kế cơ bản nhưng tạo cảm giác mới mẻ nhờ chất liệu đặc biệt.

- Phối chung cả set bật lên nét sang trọng, tinh tế.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_trang_3_f593b2a364344cbc92182a5b2dcd8bd0.webp', N'http://localhost:8080/api/files/files/pro_trang_4_c8a2313f1b454dd191622f23ed39f299.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (47, N'QUẦN TÂY FORM BAGGY XẺ LAI', 2, 495000, N'http://localhost:8080/api/files/files/pro_xanh_la_1_6db6dda4c8284a4ba066ccf3086e3b8c.webp', 0, 80, N'Miêu tả: Quần tây form baggy xẻ lai
- Quần form baggy, xẻ ống.

- Chất vải co giãn, bề mặt có gân sọc. Không nhăn.

- Kiểu dáng hiện đại, dễ phối.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_xanh_la_3_bd864b8a5148464190e1844574ce06b0.webp', N'http://localhost:8080/api/files/files/pro_xanh_la_4_53688bc52e8d4fbeb3a77b367aa81f05.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (48, N'QUẦN LƯNG LIỀN ỐNG SUÔNG', 2, 480000, N'http://localhost:8080/api/files/files/pro_xanh_la_1_c58a0ce307ef4686b78ceca545ccc9f5.webp', 0, 40, N'Miêu tả: Quần lưng liền ống suông
- Chất liệu: cotton

- Mẫu quần form dáng cơ bản, hiện đại, dễ phối với những mẫu áo có sẵn trong tủ đồ của nàng. Phù hợp môi trường công sở lịch sự, diện đi chơi cũng cực sang trọng, tinh tế.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_xanh_la_2_feafba7e3e624767b367a21696a098d3.webp', N'http://localhost:8080/api/files/files/pro_xanh_la_4_bf000345016842e8b914f417c4b4916b.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (49, N'QUẦN TÂY ỐNG RỘNG PHỐI LY', 2, 525000, N'http://localhost:8080/api/files/files/pro_xanh_duong_1_14c7bef30675422f87b68949e8edd0b7.webp', 3, 57, N'Miêu tả: Quần tây ống rộng phối ly
- Chất liệu: Polyester

- Quần tây ống rộng từ lâu đã là must - have item của nhiều cô nàng, không riêng gì các quý cô công sở. Mùa thu này MARC mang đến một mẫu quần tây ống rộng có phối ly để làm đa dạng tủ đồ của nàng.

- Mix với sơ mi, áo thun hay phối dạng layer đều rất đẹp và thanh lịch.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_xanh_duong_2_d73f49cbee1441cab8709350c45d932f.webp', N'http://localhost:8080/api/files/files/pro_xanh_duong_4_c37759c255044e3f9862bd09ec2fe0f7.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (50, N'QUẦN CULOTTES DẬP LY', 2, 397000, N'http://localhost:8080/api/files/files/pro_trang_1_0e0f3d5928bf415e80d203affa901116.webp', 0, 60, N'Miêu tả: Quần culottes dập ly
- Chất liệu: Lụa cát dập ly

- Hot item mới dành cho các nàng yêu thời trang. Đi làm, đi chơi đều phù hợp. Đặc biệt thanh lịch và thời thượng khi phối cùng sơ mi, áo kiểu.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_trang_3_2a2d907c15d44ba385e596138240243a.webp', N'http://localhost:8080/api/files/files/pro_trang_4_4e28b015995d47fb8edbe2fad7eb6b9c.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (51, N'QUẦN ỐNG SUÔNG NHÚN THUN LƯNG', 2, 255000, N'http://localhost:8080/api/files/files/pro_da_1_ad5f00b13dd84c059e36499f5df7ecbc.webp', 2, 78, N'Miêu tả: Quần ống suông nhún thun lưng
- Thiết kế ống rộng, xếp li thân trước che bụng dưới và đùi. Thân sau lưng thun tiện dụng.
- Thích hợp mặc nhà, đi siêu thị, đi dạo.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_da_4_cdbd0452428644a3b4290461b9599263.webp', N'http://localhost:8080/api/files/files/pro_den_3_7333caa108be4f86a2a34bdfca66531b.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (52, N'QUẦN SHORT NGANG GỐI NHẤN LY', 2, 455000, N'http://localhost:8080/api/files/files/pro_nau_1_4d628101874f440a8cc63f0863b0703b.webp', 0, 70, N'Miêu tả: Quần short ngang gối nhấn ly
- Chất liệu: Kaki mịn

- Quần short nhấn li, có túi xéo. Rất hợp cho những buổi đi chơi, du lịch, dạo phố. Item mang tới cảm giác thoải mái, dễ chịu cho người mặc.

Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_nau_3_9a55d14d8eb345ada77768adb1ff05f1.webp', N'http://localhost:8080/api/files/files/pro_nau_4_d80295b6ac9543099068ef983e16214a.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (53, N'QUẦN ỐNG SUÔNG LƯNG RỜI TÚI HÀM ẾCH', 2, 430000, N'http://localhost:8080/api/files/files/pro_da_2_6ca73e648ef049f784cc06648d1b3c0f.webp', 2, 88, N'Miêu tả: Quần ống suông lưng rời túi hàm ếch
Mô Tả:
- Chất Liệu: Kaki
- Thiết kế quần ống suông đơn giản, dễ dàng kết hợp với các loại áo kiểu nhiều chi tiết.
Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Để tránh ra màu, không ngâm sản phẩm.
- Ủi ở nhiệt độ không quá 180 độ C.
- Nên giặt hấp.', N'http://localhost:8080/api/files/files/pro_da_4_e5e5fe45c3b040e78e5e65a5851e3793.webp', N'http://localhost:8080/api/files/files/pro_da_3_57a69f7c235f477daca315cbf4566f4f.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (54, N'QUẦN LƯNG THUN RÚT DÂY 2 TÚI HỘP', 2, 495000, N'http://localhost:8080/api/files/files/pro_da_1_98f89326be314aaab9e4f5a112cf040c.webp', 0, 65, N'Miêu tả: Quần lưng thun rút dây 2 túi hộp
MÔ TẢ SẢN PHẨM:

Chất liệu sản phẩm: 100% polyester

Quần dài túi hộp được thiết kế với lưng thun và bo thun ở cổ chân , chất liệu kaki thoáng mát năng động

HƯỚNG DẪN BẢO QUẢN:

- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_da_3_c2d7266e8f0242a3b299fdec2764c5c4.webp', N'http://localhost:8080/api/files/files/pro_da_2_959b1db0c20c4c278bc8b130a8e9667e.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (55, N'QUẦN TÂY ÔM LY ĐỨNG', 2, 390000, N'http://localhost:8080/api/files/files/pro_hong_1_e16e7ffe36874bad90136ecdc883483f.webp', 1, 39, N'Miêu tả: Quần tây ôm ly đứng
Mô tả:
- Chất liệu: Phi bóng mờ
- Slim trouser với phần ống loe nhẹ, chất vải phi bóng mờ giúp giữ form quần đứng.
- Mẫu thiết kế khiến người mặc trông thanh lịch và nữ tính.
Hướng dẫn bảo quản:
- Giặt ở nhiệt độ thường.
- Không dùng chất tẩy.
- Phơi trong bóng râm.
- Không ngâm quần áo để tránh ra màu.
- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/pro_hong_4_dcdcedac8f5a4184b5ba7364cd9abaf6.webp', N'http://localhost:8080/api/files/files/pro_hong_5_93a5b4c5b98c42e48feb7fc620a0c4bf.webp')
INSERT [dbo].[products] ([id], [name], [categories_id], [price], [images], [sold], [total], [describe], [images2], [images3]) VALUES (57, N'QUẦN ỐNG SUÔNG CƠ BẢN', 2, 495000, N'http://localhost:8080/api/files/files/07.webp', 1, 49, N'Miêu tả: Quần ống suông cơ bản
- Chất liệu: Lụa dẻo

- Mẫu quần ống suông này hứa hẹn là item không thể thiếu cho các tín đồ thời trang. Thiết kế cơ bản nhưng mang hơi thở hiện đại, cực kỳ tôn dáng và sành điệu. Item này có thể đồng hành cùng nàng đến văn phòng hoặc mix cùng những mẫu áo thun, croptop cho ra set đồ đi chơi cực hút mắt.

Hướng dẫn bảo quản:

- Giặt ở nhiệt độ thường.

- Không dùng chất tẩy.

- Phơi trong bóng râm.

- Không ngâm quần áo để tránh ra màu.

- Ủi ở nhiệt độ không quá 180 độ C.', N'http://localhost:8080/api/files/files/08.webp', N'http://localhost:8080/api/files/files/09.webp')
SET IDENTITY_INSERT [dbo].[products] OFF
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([id], [name]) VALUES (1, N'ROLE_USER')
INSERT [dbo].[roles] ([id], [name]) VALUES (2, N'ROLE_MODERATOR')
INSERT [dbo].[roles] ([id], [name]) VALUES (3, N'ROLE_ADMIN')
SET IDENTITY_INSERT [dbo].[roles] OFF
SET IDENTITY_INSERT [dbo].[size] ON 

INSERT [dbo].[size] ([id], [name]) VALUES (1, N'S')
INSERT [dbo].[size] ([id], [name]) VALUES (2, N'M')
INSERT [dbo].[size] ([id], [name]) VALUES (3, N'L')
INSERT [dbo].[size] ([id], [name]) VALUES (4, N'XL')
INSERT [dbo].[size] ([id], [name]) VALUES (5, N'XXL')
SET IDENTITY_INSERT [dbo].[size] OFF
INSERT [dbo].[user_roles] ([user_id], [role_id]) VALUES (1, 1)
INSERT [dbo].[user_roles] ([user_id], [role_id]) VALUES (1, 3)
INSERT [dbo].[user_roles] ([user_id], [role_id]) VALUES (2, 1)
INSERT [dbo].[user_roles] ([user_id], [role_id]) VALUES (3, 1)
INSERT [dbo].[user_roles] ([user_id], [role_id]) VALUES (4, 1)
INSERT [dbo].[user_roles] ([user_id], [role_id]) VALUES (5, 1)
INSERT [dbo].[user_roles] ([user_id], [role_id]) VALUES (6, 1)
INSERT [dbo].[user_roles] ([user_id], [role_id]) VALUES (7, 1)
INSERT [dbo].[user_roles] ([user_id], [role_id]) VALUES (8, 1)
INSERT [dbo].[user_roles] ([user_id], [role_id]) VALUES (9, 1)
INSERT [dbo].[user_roles] ([user_id], [role_id]) VALUES (10, 1)
INSERT [dbo].[user_roles] ([user_id], [role_id]) VALUES (11, 1)
INSERT [dbo].[user_roles] ([user_id], [role_id]) VALUES (12, 1)
INSERT [dbo].[user_roles] ([user_id], [role_id]) VALUES (13, 1)
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [email], [password], [phone], [address], [full_name]) VALUES (1, N'admin', N'admin@gmail.com', N'$2a$10$lkGOsa.9mzKfXppFi05dg.qM8iBkbxcP30buQkjMWZRRXGC3WRSqm', N'0339178080', N'K53/25 Huỳnh Ngọc Huệ, Đà Nẵng', N'Nguyễn Văn Hòa')
INSERT [dbo].[users] ([id], [username], [email], [password], [phone], [address], [full_name]) VALUES (2, N'baohung', N'denui98@gmail.com', N'$2a$10$MHAmWU4cVwcNUS5KLcyuuua7EQrtlCfQom4joczIXAfThe6MaEife', N'0989768432	', N'14 Cù Chính Lan, Đà Nẵng', N'Đặng Văn Bảo Hưng')
INSERT [dbo].[users] ([id], [username], [email], [password], [phone], [address], [full_name]) VALUES (3, N'baphu', N'baphu3098@gmail.com', N'$2a$10$UY5XQfxf8.OQ3oesTuqu6uEoR/dVQw4Q4/Fi4i53sqhz9YbnGKkqG', N'0861533890', N'90 Hàm Nghi, Đà Nẵng', N'Tạ Bá Phú')
INSERT [dbo].[users] ([id], [username], [email], [password], [phone], [address], [full_name]) VALUES (4, N'ngocanh', N'ngocanh98@gmail.com', N'$2a$10$kyxyf9PqP6kGI3P95tC1pel27JXbFpwE1FKBjNdKWnqHpMKiYFF2K', N'0871398402	', N'45 Trường Chinh, Đà Nẵng', N'Trần Ngọc Anh')
INSERT [dbo].[users] ([id], [username], [email], [password], [phone], [address], [full_name]) VALUES (5, N'hoangphi', N'petrusvo@gmail.com', N'$2a$10$6lVZroYAGmpogXg3THPr2OFLx9JYTVu25WN0kAbR7u0vCr2xOst82', N'0987167854	', N'12 Tô Hiệu, Đà Nẵng', N'Võ Nguyễn Hoàng Phi')
INSERT [dbo].[users] ([id], [username], [email], [password], [phone], [address], [full_name]) VALUES (6, N'quangduy', N'onlylight0209@yahoo.com', N'$2a$10$30qEoaDKdrhk4AijwBJfG.Trb7cnxe3OtKiTcsjZE9lg7Hbt0Aj8m', N'0331954390', N'23/14 Trần Cao Vân, Đà Nẵng', N'Trần Quang Duy')
INSERT [dbo].[users] ([id], [username], [email], [password], [phone], [address], [full_name]) VALUES (7, N'anhkhoa', N'khoatall11@gmail.com', N'$2a$10$A3d9un719.PjvzD1Bezy1e00.OIRghwYFr4KrsRmue.5lS1atlGlG', N'0998367451', N'90 Trưng Nữ Vương, Đà Nẵng', N'Đoàn Anh Khoa')
INSERT [dbo].[users] ([id], [username], [email], [password], [phone], [address], [full_name]) VALUES (8, N'hoanghai', N'haiduoi29@gmail.com', N'$2a$10$a0SDYEU43zNA9EpsEhQ7IOi3szraTBymQbrhi5ADanOp2PFCsFqjy', N'0976812376', N'20 Thái Thị Bôi, Đà Nẵng', N'Trần Hoàng Hải')
INSERT [dbo].[users] ([id], [username], [email], [password], [phone], [address], [full_name]) VALUES (9, N'thuhien', N'thutiendola@yahoo.com', N'$2a$10$ptIeW4o4yr1w/tUINVXH8ecVdctWdvFIyp997PsVgrG0TCdnc5KbK', N'0876894361', N'32 Kinh Dương Vương, Đà Nẵng', N'Lý Thu Hiền')
INSERT [dbo].[users] ([id], [username], [email], [password], [phone], [address], [full_name]) VALUES (10, N'duytien', N'moneytien@gmail.com', N'$2a$10$smz4fAyhSObC4PgRi5tS2OiML8iDawplpEGYl9zpCrGV5O1.Mo/o2', N'0871262387', N'25 Tôn Đức Thắng, Đà Nẵng', N'Trần Duy Tiền')
INSERT [dbo].[users] ([id], [username], [email], [password], [phone], [address], [full_name]) VALUES (11, N'tantu', N'tantunn@yahoo.com', N'$2a$10$FkOB6ej20ZMjdMdMkRyniuCONc8R1ZfHEWAqZi4szh1yfOxOUKI0C', N'0389781473', N'04 Nguyễn Tất Thành, Đà Nẵng', N'Nguyễn Tấn Tứ')
INSERT [dbo].[users] ([id], [username], [email], [password], [phone], [address], [full_name]) VALUES (12, N'baolinh', N'baolinh@gmail.com', N'$2a$10$B14l7z5y4VkIW2nQTQ7obeWkFtLlDLNklazGOnCf9XParKzWMXb5e', N'0879276548', N'K23/03 Huyền Trân, Đà Nẵng', N'Đoàn Thị Bảo Linh')
INSERT [dbo].[users] ([id], [username], [email], [password], [phone], [address], [full_name]) VALUES (13, N'vanrin', N'rin@gmail.com', N'$2a$10$QZT9r.ri5lDACL4w2cJsSOX1FG4f8blWxUnlbH.H9OFa67EVxlR4m', N'0986409128', N'23 Tam Kỳ, Quảng Nam', N'Nguyễn Văn Rin')
SET IDENTITY_INSERT [dbo].[users] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK6dotkott2kjsp8vw4d0m25fb7]    Script Date: 2021-01-19 17:06:36 ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [UK6dotkott2kjsp8vw4d0m25fb7] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UKr43af9ap4edm43mmtq01oddj6]    Script Date: 2021-01-19 17:06:36 ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [UKr43af9ap4edm43mmtq01oddj6] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_email]    Script Date: 2021-01-19 17:06:36 ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [unique_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [unique_username]    Script Date: 2021-01-19 17:06:36 ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [unique_username] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [fk_comments_products] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [fk_comments_products]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [fk_comments_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [fk_comments_users]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [fk_orders_products] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [fk_orders_products]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [fk_orders_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [fk_orders_users]
GO
ALTER TABLE [dbo].[product_sizes]  WITH CHECK ADD  CONSTRAINT [fk_product_productsizes] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[product_sizes] CHECK CONSTRAINT [fk_product_productsizes]
GO
ALTER TABLE [dbo].[product_sizes]  WITH CHECK ADD  CONSTRAINT [FK_product_sizes_size] FOREIGN KEY([size_id])
REFERENCES [dbo].[size] ([id])
GO
ALTER TABLE [dbo].[product_sizes] CHECK CONSTRAINT [FK_product_sizes_size]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [fk_products_categories] FOREIGN KEY([categories_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [fk_products_categories]
GO
ALTER TABLE [dbo].[user_roles]  WITH CHECK ADD  CONSTRAINT [fk_roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[user_roles] CHECK CONSTRAINT [fk_roles]
GO
ALTER TABLE [dbo].[user_roles]  WITH CHECK ADD  CONSTRAINT [fk_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[user_roles] CHECK CONSTRAINT [fk_user]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [check_price] CHECK  (([price]>=(0)))
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [check_price]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [check_total] CHECK  (([total]>=(0)))
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [check_total]
GO
USE [master]
GO
ALTER DATABASE [FashionShop] SET  READ_WRITE 
GO
