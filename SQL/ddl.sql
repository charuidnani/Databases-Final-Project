CREATE TABLE Members (
    MemberID SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    Password VARCHAR(255),
    Address TEXT,
    PhoneNumber VARCHAR(20),
    FitnessGoals TEXT,
    HealthMetrics TEXT
);

CREATE TABLE Trainers (
    TrainerId SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    Specialization VARCHAR(255),
    Availability TIMESTAMP -- Use TIMESTAMP for date and time
);

CREATE TABLE AdminStaff (
    StaffID SERIAL PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    Role VARCHAR(255)
);

CREATE TABLE FitnessClasses (
    ClassID SERIAL PRIMARY KEY,
    ClassName VARCHAR(255),
    Schedule TIMESTAMP, -- Use TIMESTAMP for date and time
    RoomID INT,
    TrainerID INT,
    MaxParticipants INT,
    CurrentParticipants INT,
    FOREIGN KEY (TrainerID) REFERENCES Trainers(TrainerId)
);

CREATE TABLE PersonalTrainingSession (
    SessionID SERIAL PRIMARY KEY,
    Schedule TIMESTAMP, -- Use TIMESTAMP for date and time
    MemberID INT,
    TrainerID INT,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (TrainerID) REFERENCES Trainers(TrainerId)
);

CREATE TABLE RoomBookings (
    BookingID SERIAL PRIMARY KEY,
    RoomID INT,
    BookingTime TIMESTAMP, -- Use TIMESTAMP for date and time
    MemberID INT,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

CREATE TABLE EquipmentMaintenance (
    EquipmentID SERIAL PRIMARY KEY,
    EquipmentName VARCHAR(255),
    LastCheck DATE,
    CurrentCheck DATE,
    Status VARCHAR(100),
    StaffID INT,
    FOREIGN KEY (StaffID) REFERENCES AdminStaff(StaffID)
);

CREATE TABLE Billing (
    BillID SERIAL PRIMARY KEY,
    MemberID INT,
    StaffID INT,
    Amount DECIMAL(10,2),
    BillDate DATE,
    Status VARCHAR(100),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (StaffID) REFERENCES AdminStaff(StaffID)
);

CREATE TABLE WearableDevice (
    DeviceID SERIAL PRIMARY KEY,
    MemberID INT,
    SessionID INT,
    DeviceType VARCHAR(100),
    WorkoutTime TIMESTAMP, -- Use TIMESTAMP for date and time
    HeartRate INT,
    ActiveCalories INT,
    Steps INT,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (SessionID) REFERENCES PersonalTrainingSession(SessionID)
);
