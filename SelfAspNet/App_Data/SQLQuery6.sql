USE [C:\USERS\SSSHS\SOURCE\REPOS\SELFASPNET\SELFASPNET\APP_DATA\SELFASP.MDF]
GO

DECLARE	@return_value Int,
		@recnum int

SELECT	@recnum = NULL

EXEC	@return_value = [dbo].[AlbumFilter]
		@category = N'動物',
		@recnum = @recnum OUTPUT

SELECT	@recnum as N'@recnum'

SELECT	@return_value as 'Return Value'

GO
