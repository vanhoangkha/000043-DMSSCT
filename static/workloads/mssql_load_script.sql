---- ideas coming from the followig links/resources:
-- https://dzone.com/articles/generating-millions-of-rows-in-sql-server
-- https://www.brentozar.com/archive/2015/05/how-to-fake-load-tests-with-sqlquerystress/
-- https://gist.github.com/BrentOzar/12b8ac33a67f02f413d30529caff5676
-- https://github.com/leerssej/SEDESchema/blob/master/info_schema_create_tables.sql


USE [dms_sample]
GO

CREATE TABLE [dbo].[Posts](
	[Id] [int] NOT NULL identity,
	[PostTypeId] [tinyint] NOT NULL,
	[AcceptedAnswerId] [int] NULL,
	[ParentId] [int] NULL,
	[CreationDate] [datetime] NOT NULL,
	[DeletionDate] [datetime] NULL,
	[Score] [int] NOT NULL,
	[ViewCount] [int] NULL,
	[Body] [nvarchar](800) NULL,
	[OwnerUserId] [int] NULL,
	[OwnerDisplayName] [nvarchar](40) NULL,
	[LastEditorUserId] [int] NULL,
	[LastEditorDisplayName] [nvarchar](40) NULL,
	[LastEditDate] [datetime] NULL,
	[LastActivityDate] [datetime] NULL,
	[Title] [nvarchar](250) NULL,
	[Tags] [nvarchar](250) NULL,
	[AnswerCount] [int] NULL,
	[CommentCount] [int] NULL,
	[FavoriteCount] [int] NULL,
	[ClosedDate] [datetime] NULL,
	[CommunityOwnedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Users](
	[Id] [int] NOT NULL identity,
	[Reputation] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[DisplayName] [nvarchar](40) NULL,
	[LastAccessDate] [datetime] NOT NULL,
	[WebsiteUrl] [nvarchar](200) NULL,
	[Location] [nvarchar](100) NULL,
	[AboutMe] [nvarchar](800) NULL,
	[Views] [int] NOT NULL,
	[UpVotes] [int] NOT NULL,
	[DownVotes] [int] NOT NULL,
	[ProfileImageUrl] [nvarchar](200) NULL,
	[EmailHash] [varchar](32) NULL,
	[AccountId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Votes](
	[Id] [int] NOT NULL identity,
	[PostId] [int] NOT NULL,
	[VoteTypeId] [tinyint] NOT NULL,
	[UserId] [int] NULL,
	[CreationDate] [datetime] NULL,
	[BountyAmount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
-- Dependent SP to add rows

IF OBJECT_ID ('dbo.addRowsPosts', 'P') IS NOT NULL

	DROP PROCEDURE dbo.addRowsPosts;

GO

CREATE PROCEDURE dbo.addRowsPosts 

	@rowsNumber int

AS

BEGIN

	SET NOCOUNT ON

	-- start point for adding rows

	DECLARE @iteration INT = 0

	WHILE @iteration < @rowsNumber

		BEGIN

			--get a random int from 0 to 1000

			DECLARE @posttypeid INT = (CAST(RAND()*1000 AS INT)%255)+1

            DECLARE @acceptedanswerid INT = CAST(RAND()*1000 AS INT)

            DECLARE @parentid INT = CAST(RAND()*1000 AS INT)

            DECLARE @creation_date datetime = dateadd(day, 0-CAST(RAND()*1000 AS INT), getdate())

            DECLARE @deletion_date datetime = dateadd(day, CAST(RAND()*1000 AS INT), @creation_date)
            
            DECLARE @score INT = CAST(RAND()*100 AS INT)

            DECLARE @viewcount INT = CAST(RAND()*10000 AS INT)

            DECLARE @owneruserid INT = CAST(RAND()*100000 AS INT)

            DECLARE @lasteditoruserid INT = CAST(RAND()*100000 AS INT)

            DECLARE @lastedit_date datetime = dateadd(day, 0-CAST(RAND()*100 AS INT), getdate())

            DECLARE @lastactivity_date datetime = dateadd(day, 0-CAST(RAND()*100 AS INT), getdate())

            DECLARE @answercount int = CAST(RAND()*10000 AS INT)

            DECLARE @commentcount int = CAST(RAND()*100000 AS INT)

            DECLARE @favoritecount int = CAST(RAND()*10000 AS INT)

            DECLARE @closed_date datetime = dateadd(day, 0-CAST(RAND()*100 AS INT), getdate())

            DECLARE @communityowned_date datetime = dateadd(day, 0-CAST(RAND()*100 AS INT), getdate())

			-- generate random nvarchar
			-- get a random nvarchar ascii char 65 to 128
			DECLARE @body NVARCHAR(150) = N'' --empty string for start
			DECLARE @length INT = CAST(RAND() * 150 AS INT) --random length of nvarchar
			WHILE @length <> 0 --in loop we will randomize chars till the last one
				BEGIN
					SELECT @body = @body + CHAR(CAST(RAND() * 63 + 65 as INT))
					SET @length = @length - 1 --next iteration
				END

            -- generate random nvarchar
			-- get a random nvarchar ascii char 65 to 128
			DECLARE @ownerdisplayname NVARCHAR(20) = N'' --empty string for start
			set @length = CAST(RAND() * 20 AS INT) --random length of nvarchar
			WHILE @length <> 0 --in loop we will randomize chars till the last one
				BEGIN
					SELECT @ownerdisplayname = @ownerdisplayname + CHAR(CAST(RAND() * 63 + 65 as INT))
					SET @length = @length - 1 --next iteration
				END

            -- generate random nvarchar
			-- get a random nvarchar ascii char 65 to 128
			DECLARE @lasteditordisplayname NVARCHAR(20) = N'' --empty string for start
			set @length = CAST(RAND() * 20 AS INT) --random length of nvarchar
			WHILE @length <> 0 --in loop we will randomize chars till the last one
				BEGIN
					SELECT @lasteditordisplayname = @lasteditordisplayname + CHAR(CAST(RAND() * 63 + 65 as INT))
					SET @length = @length - 1 --next iteration
				END

-- generate random nvarchar
			-- get a random nvarchar ascii char 65 to 128
			DECLARE @title NVARCHAR(30) = N'' --empty string for start
			set @length = CAST(RAND() * 30 AS INT) --random length of nvarchar
			WHILE @length <> 0 --in loop we will randomize chars till the last one
				BEGIN
					SELECT @title = @title + CHAR(CAST(RAND() * 63 + 65 as INT))
					SET @length = @length - 1 --next iteration
				END

-- generate random nvarchar
			-- get a random nvarchar ascii char 65 to 128
			DECLARE @tags NVARCHAR(20) = N'' --empty string for start
			set @length = CAST(RAND() * 20 AS INT) --random length of nvarchar
			WHILE @length <> 0 --in loop we will randomize chars till the last one
				BEGIN
					SELECT @tags = @tags + CHAR(CAST(RAND() * 63 + 65 as INT))
					SET @length = @length - 1 --next iteration
				END

			--insert data

			INSERT INTO dbo.Posts
			VALUES (--@id,
				@posttypeid, @acceptedanswerid, @parentid, @creation_date, @deletion_date, @score
                , @viewcount, @body, @owneruserid, @ownerdisplayname, @lasteditoruserid, @lasteditordisplayname, @lastedit_date
                , @lastactivity_date, @title, @tags, @answercount, @commentcount, @favoritecount, @closed_date, @communityowned_date)

			SET @iteration += 1

		END

	SET NOCOUNT OFF

END
GO

IF OBJECT_ID ('dbo.addRowsUsers', 'P') IS NOT NULL

	DROP PROCEDURE dbo.addRowsUsers;

GO

CREATE PROCEDURE dbo.addRowsUsers 

	@rowsNumber int

AS

BEGIN

	SET NOCOUNT ON

	-- start point for adding rows

	DECLARE @iteration INT = 0

	WHILE @iteration < @rowsNumber

		BEGIN

			--get a random int from 0 to 1000

			DECLARE @reputation INT = CAST(RAND()*10000 AS INT)

            DECLARE @creation_date datetime = dateadd(day, 0-CAST(RAND()*1000 AS INT), getdate())

            DECLARE @lastaccess_date datetime = dateadd(day, CAST(RAND()*1000 AS INT), @creation_date)
            
            DECLARE @views INT = CAST(RAND()*10000 AS INT)

            DECLARE @upvotes INT = CAST(RAND()*1000 AS INT)

            DECLARE @downvotes INT = CAST(RAND()*1000 AS INT) 

            DECLARE @accountid INT = CAST(RAND()*10000 AS INT)

			-- generate random nvarchar
			-- get a random nvarchar ascii char 65 to 128
			DECLARE @displayname NVARCHAR(30) = N'' --empty string for start
			DECLARE @length INT = CAST(RAND() * 30 AS INT) --random length of nvarchar
			WHILE @length <> 0 --in loop we will randomize chars till the last one
				BEGIN
					SELECT @displayname = @displayname + CHAR(CAST(RAND() * 63 + 65 as INT))
					SET @length = @length - 1 --next iteration
				END

            -- generate random nvarchar
			-- get a random nvarchar ascii char 65 to 128
			DECLARE @emailhash NVARCHAR(30) = N'' --empty string for start
			set @length = CAST(RAND() * 30 AS INT) --random length of nvarchar
			WHILE @length <> 0 --in loop we will randomize chars till the last one
				BEGIN
					SELECT @emailhash = @emailhash + CHAR(CAST(RAND() * 63 + 65 as INT))
					SET @length = @length - 1 --next iteration
				END

			--insert data

			INSERT INTO dbo.Users
			VALUES (--@id, 
				@reputation, @creation_date, @displayname, @lastaccess_date
                , null, null, null, @views, @upvotes, @downvotes, null
                , @emailhash, @accountid)

			SET @iteration += 1

		END

	SET NOCOUNT OFF

END
GO

IF OBJECT_ID ('dbo.addRowsVotes', 'P') IS NOT NULL

	DROP PROCEDURE dbo.addRowsVotes;

GO

CREATE PROCEDURE dbo.addRowsVotes 

	@rowsNumber int

AS

BEGIN

	SET NOCOUNT ON

	-- start point for adding rows

	DECLARE @iteration INT = 0

	WHILE @iteration < @rowsNumber

		BEGIN

			--get a random int from 0 to 1000

			DECLARE @postid INT = CAST(RAND()*1000000 AS INT)

            DECLARE @votetypeid INT = (CAST(RAND()*1000 AS INT)%255)+1

            DECLARE @userid INT = CAST(RAND()*10000 AS INT)

            DECLARE @creation_date datetime = dateadd(day, CAST(RAND()*1000 AS INT), getdate())
            
            DECLARE @bountyamount INT = CAST(RAND()*10000 AS INT)

			-- generate random nvarchar
			-- get a random nvarchar ascii char 65 to 128
			DECLARE @displayname NVARCHAR(30) = N'' --empty string for start
			DECLARE @length INT = CAST(RAND() * 30 AS INT) --random length of nvarchar
			WHILE @length <> 0 --in loop we will randomize chars till the last one
				BEGIN
					SELECT @displayname = @displayname + CHAR(CAST(RAND() * 63 + 65 as INT))
					SET @length = @length - 1 --next iteration
				END

            -- generate random nvarchar
			-- get a random nvarchar ascii char 65 to 128
			DECLARE @emailhash NVARCHAR(30) = N'' --empty string for start
			set @length = CAST(RAND() * 30 AS INT) --random length of nvarchar
			WHILE @length <> 0 --in loop we will randomize chars till the last one
				BEGIN
					SELECT @emailhash = @emailhash + CHAR(CAST(RAND() * 63 + 65 as INT))
					SET @length = @length - 1 --next iteration
				END

			--insert data

			INSERT INTO dbo.Votes
			VALUES (--@id, 
				@postid, @votetypeid, @userid, @creation_date, @bountyamount
                )

			SET @iteration += 1

		END

	SET NOCOUNT OFF

END
GO


--SP to throttle CDC 

IF OBJECT_ID('dbo.usp_RandomQ') IS NULL
 EXEC ('CREATE PROCEDURE dbo.usp_RandomQ AS RETURN 0;')
GO

ALTER PROCEDURE dbo.usp_RandomQ @query_count INT WITH RECOMPILE
AS

DECLARE @iteration INT = 0;

while @iteration < @query_count
begin
/* Source: https://gist.github.com/BrentOzar/12b8ac33a67f02f413d30529caff5676 */
DECLARE @Id INT = CAST(RAND() * 10000000 AS INT);

IF @Id % 12 = 0
  EXEC dbo.addRowsPosts 10000 ELSE IF @Id % 11 = 0
  EXEC dbo.addRowsVotes 10000 ELSE IF @Id % 10 = 0
  EXEC dbo.addRowsUsers 1000 ELSE IF @Id % 9 = 0
  EXEC dbo.addRowsPosts 10000 ELSE IF @Id % 8 = 0
  EXEC dbo.addRowsVotes 10000 ELSE IF @Id % 7 = 0
  EXEC dbo.addRowsUsers 1000 ELSE IF @Id % 6 = 0
  EXEC dbo.addRowsPosts 10000 ELSE IF @Id % 5 = 0
	EXEC dbo.addRowsVotes 10000 ELSE IF @Id % 4 = 0
	EXEC dbo.addRowsPosts 10000 ELSE IF @Id % 3 = 0
	EXEC dbo.addRowsVotes 10000
	ELSE IF @Id % 2 = 0 EXEC dbo.addRowsUsers 1000

SET @iteration += 1
end
GO