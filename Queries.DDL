

INSERT INTO MEMBERS (MemberID, Name, Email, Phone, MemberStatus, LoyaltyID, MemberScheduleID, FitnessGoal)
VALUES (1, 'Owen Beattie', 'owenb@gmail.com', '123-456-7890', 'Active', 1, null, 'Weight Loss');


-- Insert a new event
INSERT INTO EVENTS (EventID, Name, Description, Type, Size, EventScheduleID, TrainerID)
VALUES (2, 'Yoga Class', 'Relaxing yoga session', 'Yoga', 15, null, null);


-- Insert a new trainer
INSERT INTO TRAINERS (TrainerID, Name, Email, Phone, TrainerScheduleID)
VALUES (1, 'Larry Wheels', 'larrywheels@gmail.com', '555-123-4567', null);


-- Insert a new schedule
INSERT INTO SCHEDULES (ScheduleID, Date, Time, Type, RoomID)
VALUES (1, '2023-12-20', '15:30:00', 'Yoga Class', null);


-- Insert a new room
INSERT INTO ROOMS (RoomID, Name, Capacity)
VALUES (1, 'Yoga Room', 25);

-- Update RoomID for ScheduleID 1
UPDATE SCHEDULES
SET RoomID = 1  -- Replace with the new RoomID
WHERE ScheduleID = 1;

-- Update TrainerID and EventScheduleID for EventID 1
UPDATE EVENTS
SET TrainerID = 1, 
    EventScheduleID = 1  
WHERE EventID = 1;

UPDATE TRAINERS
SET TrainerScheduleID = 1
WHERE TrainerID = 1;

-- Update MemberScheduleID for MemberID 1
UPDATE MEMBERS
SET MemberScheduleID = 1
WHERE MemberID = 1;

-- Insert a new transaction
INSERT INTO TRANSACTIONS (TransactionID, Type, Date, Amount, MemberID, LoyaltyID)
VALUES (1, 'Purchase', '2023-12-18', 75.50, 1, null);
