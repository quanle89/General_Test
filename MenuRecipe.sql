--Ingredient
CREATE TABLE [dbo].[Ingredient](
	[ID] [varchar](20) NOT NULL PRIMARY KEY,
	[Name] [varchar](50) NULL,
	[Unit of Measure] [varchar](10) NULL
) 
--Instruction
CREATE TABLE [dbo].[Instruction](
	[ID] [varchar](20) NOT NULL PRIMARY KEY,
	[Description] [varchar](200) NULL,
)
--Menu
CREATE TABLE [dbo].[Menu](
	[No] [varchar](20) NOT NULL PRIMARY KEY, --No of Menu
	[Name] [varchar](50) NULL, --Name of Menu
	[Price] [decimal](18, 0) NULL, --Price of Menu
)
--Recipe Header
CREATE TABLE [dbo].[Recipe Header](
	[ID] [varchar](20) NOT NULL PRIMARY KEY, --ID of Recipe Header
	[Menu No] [varchar](20) NOT NULL, --link to table Menu, one menu consist many Recipes
	[Description] [varchar](50) NULL, --Desciption of recipe
	CONSTRAINT PK_Menu FOREIGN KEY ([Menu No]) REFERENCES [Menu]([No])
)
--Recipe Ingredient
CREATE TABLE [dbo].[Recipe Ingredient Line](
	[Recipe ID] [varchar](20) NOT NULL, --link to Recipe Header
	[Line No] [int] IDENTITY(1,1) NOT NULL, --One Recipe Header consist many Ingredients
	[Quantity] [decimal](18, 0) NULL, --Quantity of ingredient
	[Unit of Measure] [varchar](10) NULL, --Unit of measure of ingredient
	[Ingredient ID] [varchar](20) NULL, --link to table Ingredient
	[Ingredient Name] [varchar](50) NULL, --Ingredient name
	PRIMARY KEY ([Recipe ID],[Line No]),
	CONSTRAINT [PK_Recipe Header] FOREIGN KEY ([Recipe ID]) REFERENCES [Recipe Header]([ID]), --link to Recipe Header
	CONSTRAINT [PK_Ingredient] FOREIGN KEY ([Ingredient ID]) REFERENCES [Ingredient]([ID]) --link to table Ingredient
)
--Recipe Instruction
CREATE TABLE [dbo].[Recipe Instruction Line](
	[Recipe ID] [varchar](20) NOT NULL, --link to Recipe Header
	[Line No] [int] IDENTITY(1,1) NOT NULL, --One Recipe Header consist many Instructions
	[Instruction ID] [varchar](20) NULL, --link to table Instruction
	[Instruction Name] [varchar](50) NULL, --Instruction name
	PRIMARY KEY ([Recipe ID],[Line No]),
	CONSTRAINT [PK_Recipe Header_1] FOREIGN KEY ([Recipe ID]) REFERENCES [Recipe Header]([ID]), --link to Recipe Header
	CONSTRAINT [PK_Instruction] FOREIGN KEY ([Instruction ID]) REFERENCES [Instruction]([ID]) --link to table Instruction
)
