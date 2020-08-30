
CREATE TABLE SnackMachine (
    SnackMachineID int NOT NULL PRIMARY KEY IDENTITY,
    OneCentCount int NOT NULL,
    TenCentCount int NOT NULL,
    QuarterCount int NOT NULL,
    OneDollarCount int NOT NULL,
    FiveDollarCount int NOT NULL,
    TwentyDollarCount int NOT NULL
);

INSERT INTO SnackMachine VALUES
(1, 1, 1, 1, 1, 1);

CREATE TABLE Slot (
    SlotID int NOT NULL PRIMARY KEY IDENTITY,
    Quantity int NOT NULL,
    Price decimal(19,4) NOT NULL,
    SnackID int NOT NULL,
    SnackMachineID int NOT NULL,
    Position int NOT NULL,
    CONSTRAINT AK_SlotID UNIQUE(SnackMachineID, Position)
);

INSERT INTO Slot (Quantity, Price, SnackID, SnackMachineID, Position) VALUES
(10, 3.00, 1, 1, 1),
(15, 2.00, 2, 1, 2),
(20, 1.00, 3, 1, 3);

CREATE TABLE Snack (
    SnackID int NOT NULL PRIMARY KEY IDENTITY,
    Name nvarchar(64) NOT NULL
);

INSERT INTO Snack (Name) VALUES
('Chocolate'), ('Soda'), ('Gum');
