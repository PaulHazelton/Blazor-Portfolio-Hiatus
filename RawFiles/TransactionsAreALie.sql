BEGIN TRY
	BEGIN TRANSACTION Asdf
		Update OrganizationDescriptions SET Description = 'Asdf' WHERE Id = 8

		BEGIN TRANSACTION QWER
			INSERT INTO OrganizationDescriptions (Id, Description) VALUES (11, 'Test');
		ROLLBACK -- rollsback qwer
	COMMIT
END TRY
BEGIN CATCH
	ROLLBACK -- rollsback asdf
END CATCH


SELECT * FROM OrganizationDescriptions
Update OrganizationDescriptions SET Description = 'Test' WHERE Id = 8

EXEC(N'
BEGIN TRANSACTION
	
Update OrganizationDescriptions SET Description = ''Asdf'' WHERE Id = 8
INSERT INTO OrganizationDescriptions (Id, Description) VALUES (11, ''Test'');

COMMIT')