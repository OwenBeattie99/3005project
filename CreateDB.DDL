-- Create MEMBERS table
CREATE TABLE MEMBERS (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(20),
    MemberStatus VARCHAR(50),
    LoyaltyID INT,
    MemberScheduleID INT,
    FitnessGoal VARCHAR(100)
);

-- Create EVENTS table
CREATE TABLE EVENTS (
    EventID INT PRIMARY KEY,
    Name VARCHAR(255),
    Description TEXT,
    Type VARCHAR(50),
    Size INT,
    EventScheduleID INT,
    TrainerID INT
);

-- Create TRAINERS table
CREATE TABLE TRAINERS (
    TrainerID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(20),
    TrainerScheduleID INT
);

-- Create SCHEDULES table
CREATE TABLE SCHEDULES (
    ScheduleID INT PRIMARY KEY,
    Date DATE,
    Time TIME,
    Type VARCHAR(50),
    RoomID INT
);

-- Create ROOMS table
CREATE TABLE ROOMS (
    RoomID INT PRIMARY KEY,
    Name VARCHAR(255),
    Capacity INT
);

-- Create EQUIPMENT table
CREATE TABLE EQUIPMENT (
    EquipmentID INT PRIMARY KEY,
    Name VARCHAR(255),
    RoomID INT
);

-- Create TRANSACTIONS table
CREATE TABLE TRANSACTIONS (
    TransactionID INT PRIMARY KEY,
    Type VARCHAR(50),
    Date DATE,
    Amount DECIMAL(10, 2),
    MemberID INT,
    LoyaltyID INT
);

-- Create LOYALTYPOINTS table
CREATE TABLE LOYALTYPOINTS (
    LoyaltyID INT PRIMARY KEY,
    RemainingPoints INT,
    EarnedPoints INT,
    MemberID INT
);

-- Create ADMINS table
CREATE TABLE ADMINS (
    AdminID INT PRIMARY KEY,
    Username VARCHAR(255),
    Password VARCHAR(255)
);

-- Create ATTENDS table
CREATE TABLE ATTENDS (
    EventID INT,
    MemberID INT,
    TrainerID INT,
    PRIMARY KEY (EventID, MemberID, TrainerID)
);

-- Add foreign key constraints

-- MEMBERS table foreign keys
ALTER TABLE MEMBERS
    ADD CONSTRAINT FK_Members_Schedule
    FOREIGN KEY (MemberScheduleID) REFERENCES SCHEDULES(ScheduleID);

-- EVENTS table foreign keys
ALTER TABLE EVENTS
    ADD CONSTRAINT FK_Events_Schedule
    FOREIGN KEY (EventScheduleID) REFERENCES SCHEDULES(ScheduleID);

ALTER TABLE EVENTS
    ADD CONSTRAINT FK_Events_Trainer
    FOREIGN KEY (TrainerID) REFERENCES TRAINERS(TrainerID);

-- TRAINERS table foreign keys
ALTER TABLE TRAINERS
    ADD CONSTRAINT FK_Trainers_Schedule
    FOREIGN KEY (TrainerScheduleID) REFERENCES SCHEDULES(ScheduleID);

-- SCHEDULES table foreign keys
ALTER TABLE SCHEDULES
    ADD CONSTRAINT FK_Schedules_Room
    FOREIGN KEY (RoomID) REFERENCES ROOMS(RoomID);

-- EQUIPMENT table foreign keys
ALTER TABLE EQUIPMENT
    ADD CONSTRAINT FK_Equipment_Room
    FOREIGN KEY (RoomID) REFERENCES ROOMS(RoomID);

-- TRANSACTIONS table foreign keys
ALTER TABLE TRANSACTIONS
    ADD CONSTRAINT FK_Transactions_Members
    FOREIGN KEY (MemberID) REFERENCES MEMBERS(MemberID);

ALTER TABLE TRANSACTIONS
    ADD CONSTRAINT FK_Transactions_LoyaltyPoints
    FOREIGN KEY (LoyaltyID) REFERENCES LOYALTYPOINTS(LoyaltyID);

-- LOYALTYPOINTS table foreign keys
ALTER TABLE LOYALTYPOINTS
    ADD CONSTRAINT FK_LoyaltyPoints_Members
    FOREIGN KEY (MemberID) REFERENCES MEMBERS(MemberID);

-- ATTENDS table foreign keys
ALTER TABLE ATTENDS
    ADD CONSTRAINT FK_Attends_Events
    FOREIGN KEY (EventID) REFERENCES EVENTS(EventID);

ALTER TABLE ATTENDS
    ADD CONSTRAINT FK_Attends_Members
    FOREIGN KEY (MemberID) REFERENCES MEMBERS(MemberID);

ALTER TABLE ATTENDS
    ADD CONSTRAINT FK_Attends_Trainers
    FOREIGN KEY (TrainerID) REFERENCES TRAINERS(TrainerID);
