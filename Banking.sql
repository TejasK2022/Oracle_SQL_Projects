CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    Balance DECIMAL(15, 2),
    CONSTRAINT fk_customer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    Amount DECIMAL(15, 2),
    TransactionType VARCHAR(10), -- 'Deposit' or 'Withdrawal'
    TransactionDate TIMESTAMP,
    CONSTRAINT fk_account FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);
/*Opening a New Account*/
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone)
VALUES (1, 'Tejas', 'Kamble', 'Tejas@fakemail.com', '1234567890');

INSERT INTO Accounts (AccountID, CustomerID, Balance)
VALUES (101, 1, 1000.00);

/* Deposit Making*/
INSERT INTO Transactions (TransactionID, AccountID, Amount, TransactionType, TransactionDate)
VALUES (1, 101, 500.00, 'Deposit', CURRENT_TIMESTAMP);

UPDATE Accounts
SET Balance = Balance + 500.00
WHERE AccountID = 101;

/*Withdrawal Making*/
INSERT INTO Transactions (TransactionID, AccountID, Amount, TransactionType, TransactionDate)
VALUES (2, 101, 200.00, 'Withdrawal', CURRENT_TIMESTAMP);

UPDATE Accounts
SET Balance = Balance - 200.00
WHERE AccountID = 101;

/*Account Balance Check*/
SELECT Balance
FROM Accounts
WHERE AccountID = 101;

/*Transaction History*/
SELECT *
FROM Transactions
WHERE AccountID = 101;

