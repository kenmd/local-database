
-- download WideWorldImporters-Full.bak to shared-data/backup/
-- https://github.com/microsoft/sql-server-samples/releases/tag/wide-world-importers-v1.0

-- Restore a SQL Server database in a Linux Docker container
-- https://docs.microsoft.com/en-us/sql/linux/tutorial-restore-backup-in-sql-server-container?view=sql-server-2017

RESTORE FILELISTONLY FROM DISK = '/shared-data/backup/WideWorldImporters-Full.bak'

RESTORE DATABASE WideWorldImporters
FROM DISK = '/shared-data/backup/WideWorldImporters-Full.bak'
WITH MOVE 'WWI_Primary' TO '/var/opt/mssql/data/WideWorldImporters.mdf',
MOVE 'WWI_UserData' TO '/var/opt/mssql/data/WideWorldImporters_userdata.ndf',
MOVE 'WWI_Log' TO '/var/opt/mssql/data/WideWorldImporters.ldf',
MOVE 'WWI_InMemory_Data_1' TO '/var/opt/mssql/data/WideWorldImporters_InMemory_Data_1',
STATS = 10


SELECT Name
FROM sys.Databases
