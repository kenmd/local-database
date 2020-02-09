
-- download AdventureWorks2017.bak to shared-data/backup/
-- https://github.com/microsoft/sql-server-samples/releases/tag/adventureworks

-- Restore a SQL Server database in a Linux Docker container
-- https://docs.microsoft.com/en-us/sql/linux/tutorial-restore-backup-in-sql-server-container?view=sql-server-2017

RESTORE FILELISTONLY FROM DISK = '/shared-data/backup/AdventureWorks2017.bak'

RESTORE DATABASE AdventureWorks2017
FROM DISK = '/shared-data/backup/AdventureWorks2017.bak'
WITH MOVE 'AdventureWorks2017' TO '/var/opt/mssql/data/AdventureWorks2017.mdf',
MOVE 'AdventureWorks2017_log' TO '/var/opt/mssql/data/AdventureWorks2017.ldf',
STATS = 10


SELECT Name
FROM sys.Databases
