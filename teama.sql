use teama;

CREATE TABLE users(
    users_id int NOT NULL PRIMARY KEY,
	users_name VARCHAR(50),
	users_phno NVARCHAR(20),
	users_email NVARCHAR(50),
	users_password NVARCHAR(50),
	wallet NUMERIC(10,2)
);

CREATE TABLE driver(
    driver_id INT NOT NULL PRIMARY KEY,
	driver_name VARCHAR(50),
	driver_phno NVARCHAR(20),
	vehicle_number NVARCHAR(15),
	driver_rating INT
);

CREATE TABLE trip(
	trip_id INT NOT NULL PRIMARY KEY,
	users_id INT ,
	driver_id INT,
	distance INT,
	start_loc VARCHAR(100),
	end_loc VARCHAR(100),
	Amount NUMERIC(10,2),
	FOREIGN KEY (users_id) REFERENCES users(users_id),
	FOREIGN KEY (driver_id) REFERENCES driver(driver_id)
);




CREATE TABLE rider_info(
    users_id  INT,
	rider_name VARCHAR(50),
	rider_phno NVARCHAR(15),
	FOREIGN KEY (users_id) REFERENCES users(users_id)
);

CREATE TABLE payment(
     trip_id INT,
	 payment_id INT,
	 payment_mode VARCHAR(100),
	 Amount NUMERIC(10,2),
	 FOREIGN KEY (trip_id) REFERENCES trip(trip_id)
);

CREATE TABLE vehicle (
   driver_id INT NOT NULL PRIMARY KEY,
   vehicle_number NVARCHAR(100) UNIQUE ,
   vehicle_type VARCHAR(20),
   vehicle_model VARCHAR(20),
   amount_per_km NUMERIC(10,2),
   number_of_people INT
);


CREATE TABLE rental( 
     trip_id INT,
	 vehicle_number NVARCHAR(100),
	 FOREIGN KEY (trip_id) REFERENCES trip(trip_id),
	 FOREIGN KEY (vehicle_number) REFERENCES vehicle(vehicle_number)
);

INSERT INTO users (users_id, users_name, users_phno, users_email, users_password, wallet)
VALUES
    (201, 'John Doe', '1234567890', 'john@example.com', 'password1', 100.00),
    (202, 'Jane Smith', '9876543210', 'jane@example.com', 'password2', 150.50),
    (203, 'Alice Johnson', '5555555555', 'alice@example.com', 'password3', 200.75),
    (204, 'Bob Williams', '9999988999', 'bob@example.com', 'password4', 75.25),
    (205, 'Emily Brown', '7777770077', 'emily@example.com', 'password5', 300.00),
    (206, 'Michael Davis', '4554444444', 'michael@example.com', 'password6', 50.00),
    (207, 'Olivia Garcia', '6666666666', 'olivia@example.com', 'password7', 175.25),
    (208, 'David Rodriguez', '2222222222', 'david@example.com', 'password8', 225.50),
    (209, 'Sophia Martinez', '8888888888', 'sophia@example.com', 'password9', 125.75),
    (210, 'William Hernandez', '3333333333', 'william@example.com', 'password10', 275.00);

INSERT INTO driver (driver_id, driver_name, driver_phno, vehicle_number, driver_rating)
VALUES
    (101, 'Michael Smith', '1234567890', 'ABC123', 4),
    (102, 'Jennifer Brown', '9876543210', 'XYZ456', 5),
    (103, 'Daniel Johnson', '123454322', 'PQR789', 4),
    (104, 'Sophia Williams', '9922999999', 'LMN456', 3),
    (105, 'David Lee', '2222200222', 'DEF123', 5),
    (106, 'Emma Davis', '3456789012', 'GHI789', 4),
    (107, 'Noah Garcia', '45678901234', 'JKL456', 4),
    (108, 'Olivia Rodriguez', '6666886666', 'MNO123', 3),
    (109, 'Lucas Martinez', '789012345', 'QRS789', 5),
    (110, 'Isabella Hernandez', '7890123456', 'TUV456', 4);

INSERT INTO trip (trip_id, users_id, driver_id, distance, start_loc, end_loc, Amount)
VALUES
    (301, 201, 101, 10, 'Bangalore Central', 'Whitefield', 25.50),
    (302, 202, 102, 15, 'Kempegowda International Airport', 'MG Road', 35.75),
    (303, 202, 103, 20, 'Electronic City', 'Indiranagar', 45.00),
    (304, 204, 104, 25, 'Yelahanka', 'Jayanagar', 55.25),
    (305, 205, 105, 30, 'KR Puram', 'Banashankari', 65.50),
    (306, 206, 106, 35, 'Marathahalli', 'Malleshwaram', 75.75),
    (307, 207, 107, 40, 'Hosur Road', 'Basavanagudi', 85.00),
    (308, 208, 108, 45, 'Electronic City Phase 2', 'Hebbal', 95.25),
    (309, 209, 109, 50, 'Bellandur', 'Koramangala', 105.50),
    (310, 210, 110, 55, 'Silk Board', 'BTM Layout', 115.75);

INSERT INTO rider_info (users_id, rider_name, rider_phno)
VALUES
    (201, 'John Doe', '1234567880'),
    (202, 'Jane Smith', '9876543210'),
    (203, 'Alice Johnson', '5555555555'),
    (204, 'Bob Williams', '9999988999'),
    (205, 'Emily Brown', '7777770077'),
    (206, 'Michael Davis', '4554444444'),
    (207, 'Olivia Garcia', '6666886666'),
    (208, 'David Rodriguez', '2222200222'),
    (209, 'Sophia Martinez', '8888008888'),
    (210, 'William Hernandez', '3333300333');

INSERT INTO payment (trip_id, payment_id, payment_mode, Amount)
VALUES
    (301, 123512, 'Credit Card', 25.50),
    (302, 223512, 'Debit Card', 35.75),
    (303, 323512, 'Cash', 45.00),
    (304, 423512, 'Wallet', 55.25),
    (305, 523512, 'Credit Card', 65.50),
    (306, 623512, 'Cash', 75.75),
    (307, 723512, 'Debit Card', 85.00),
    (308, 823512, 'Wallet', 95.25),
    (309, 923512, 'Credit Card', 105.50),
    (310, 123512, 'Cash', 115.75);

INSERT INTO vehicle ( driver_id, vehicle_number, vehicle_type, vehicle_model, amount_per_km, number_of_people)
VALUES
   
    ( 201, 'ABC123', 'auto', 'mahindra', 0.50, 4),
    ( 202, 'PQR789', 'car', 'Ford Fiesta', 0.40, 4),
    ( 203, 'DEF123', 'bike', 'Honda', 0.60, 4);
select * from vehicle;

INSERT INTO rental (trip_id, vehicle_number)
VALUES
    (301, 'ABC123'),
    (302, 'PQR789'),
    (303, 'DEF123');

-- Create the stored procedure
CREATE PROCEDURE UpdateWalletBalance (
    @user_id INT,
    @amount NUMERIC(10,2)
)
AS
BEGIN
    -- Update the wallet balance of the user
    UPDATE users
    SET wallet = wallet + @amount
    WHERE users_id = @user_id;

    -- Print or return the updated wallet balance
    SELECT wallet
    FROM users
    WHERE users_id = @user_id;
END;

exec UpdateWalletBalance @user_id = 201,@amount = 20;

