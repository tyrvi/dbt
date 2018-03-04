CREATE TABLE AIRPORT (
  Airport_code varchar(10) NOT NULL,
  Name varchar(20) NOT NULL,
  City varchar(20) NOT NULL,
  State varchar(50),
  PRIMARY KEY (Airport_code)
);

CREATE TABLE FLIGHT (
  Flight_number varchar(10) NOT NULL,
  Airline varchar(20) NOT NULL,
  Weekdays varchar(10),
  PRIMARY KEY (Flight_number)
);

CREATE TABLE FLIGHT_LEG (
  Flight_number varchar(10) NOT NULL,
  Leg_number varchar(10) NOT NULL,
  Departure_airport_code varchar(10) NOT NULL,
  Scheduled_departure_time time NOT NULL,
  Arrival_airport_code varchar(10) NOT NULL,
  Scheduled_arrival_time time NOT NULL,
  PRIMARY KEY (Flight_number, Leg_number),
  FOREIGN KEY (Flight_number) REFERENCES FLIGHT (Flight_number)
);

CREATE TABLE LEG_INSTANCE (
  Flight_number varchar(10) NOT NULL,
  Leg_number varchar(10) NOT NULL,
  Date date NOT NULL,
  Number_of_available_seats int NOT NULL,
  Airplane_id varchar(10) NOT NULL,
  Departure_airport_code varchar(10) NOT NULL,
  Departure_time time NOT NULL,
  Arrival_airport_code varchar(10) NOT NULL,
  Arrival_time time NOT NULL,
  PRIMARY KEY (Flight_number, Leg_number, Date),
  FOREIGN KEY (Flight_number) REFERENCES FLIGHT (Flight_number),
  FOREIGN Key (Leg_number) REFERENCES FLIGHT_LEG (Leg_number)
);

CREATE TABLE FARE (
  Flight_number varchar(10) NOT NULL,
  Fare_code varchar(10) NOT NULL,
  Amount float NOT NULL,
  Restrictions varchar(10),
  PRIMARY KEY (Flight_number, Fare_code),
  FOREIGN KEY (Flight_number) REFERENCES FLIGHT (Flight_number)
);

CREATE TABLE AIRPLANE_TYPE (
  Airplane_type_name varchar(10) NOT NULL,
  Max_seats int NOT NULL,
  Company varchar(20) NOT NULL,
  PRIMARY Key (Airplane_type_name)
);

CREATE TABLE CAN_LAND (
  Airplane_type_name varchar(10) NOT NULL,
  Airport_code varchar(10) NOT NULL,
  PRIMARY KEY (Airplane_type_name, Airport_code),
  FOREIGN KEY (Airplane_type_name) REFERENCES AIRPLANE_TYPE (Airplane_type_name)
  FOREIGN KEY (Airport_code) REFERENCES AIRPORT (Airport_code)
);

CREATE TABLE AIRPLANE (
  Airplane_id varchar(10) NOT NULL,
  Total_number_of_seats int NOT NULL,
  Airplane_type varchar(10) NOT NULL,
  PRIMARY KEY (Airplane_id),
  FOREIGN KEY (Airplane_type) REFERENCES AIRPLANE_TYPE (Airplane_type_name)
);

CREATE TABLE SEAT_RESERVATION (
  Flight_number varchar(10) NOT NULL,
  Leg_number varchar(10) NOT NULL,
  Date date NOT NULL,
  Seat_number varchar(5) NOT NULL,
  Customer_name varchar(50) NOT NULL,
  Customer_phone varchar(15) NOT NULL,
  PRIMARY KEY (Flight_number, Leg_number, Date, Seat_number),
  FOREIGN KEY (Flight_number) REFERENCES FLIGHT (Flight_number),
  FOREIGN KEY (Leg_number) REFERENCES LEG_INSTANCE (Leg_number),
  FOREIGN KEY (Date) REFERENCES LEG_INSTANCE (Date),
);