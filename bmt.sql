create database bookmytrip;
use bookmytrip;

CREATE TABLE BMT_UserDetails (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    confirmPassword VARCHAR(255) NOT NULL,
    contactNo VARCHAR(15) NOT NULL,
    state VARCHAR(255) NOT NULL,
    pinCode VARCHAR(10) NOT NULL,
    address TEXT NOT NULL,
    partnerType VARCHAR(50) NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	modifiedAt TIMESTAMP NULL
);

CREATE TABLE BMT_Packages_TX (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    days INT,
    nights INT,
    totalPrice DECIMAL(10, 2),
	createdBy INT,
	createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	modifiedAt TIMESTAMP NULL,
	FOREIGN KEY (createdBy) REFERENCES BMT_UserDetails(id)
);


CREATE TABLE BMT_Destinations_TX (
    id INT PRIMARY KEY AUTO_INCREMENT,
    packageId INT,
    city VARCHAR(255),
    days INT,
    FOREIGN KEY (packageId) REFERENCES BMT_Packages_TX(id)
);

CREATE TABLE BMT_Images_TX (
    id INT PRIMARY KEY AUTO_INCREMENT,
    packageId INT,
    imageUrl VARCHAR(255),
    FOREIGN KEY (packageId) REFERENCES BMT_Packages_TX(id)
);

CREATE TABLE BMT_Days_TX (
    id INT PRIMARY KEY AUTO_INCREMENT,
    packageId INT,
    title VARCHAR(255),
    FOREIGN KEY (packageId) REFERENCES BMT_Packages_TX(id)
);

CREATE TABLE BMT_Itinerary_TX (
    id INT PRIMARY KEY AUTO_INCREMENT,
    dayId INT,
    title VARCHAR(255),
    description TEXT,
    type VARCHAR(50),
    image VARCHAR(255),
    price DECIMAL(10, 2),
    isRemove BOOLEAN,
    rating DECIMAL(2, 1),
    FOREIGN KEY (dayId) REFERENCES BMT_Days_TX(id)
);

CREATE TABLE BMT_ItineraryPlaces_TX (
    id INT PRIMARY KEY AUTO_INCREMENT,
    itineraryId INT,
    placeName VARCHAR(255),
	description TEXT,
    FOREIGN KEY (itineraryId) REFERENCES BMT_Itinerary_TX(id)
);

CREATE TABLE BMT_Packages (
    id INT PRIMARY KEY AUTO_INCREMENT,
	refId INT,
    title VARCHAR(255),
    days INT,
    nights INT,
    totalPrice DECIMAL(10, 2),
	createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	modifiedAt TIMESTAMP NULL,
	FOREIGN KEY (refId) REFERENCES BMT_Packages_TX(id)
);


CREATE TABLE BMT_Destinations (
    id INT PRIMARY KEY AUTO_INCREMENT,
    packageId INT,
    city VARCHAR(255),
    days INT,
    FOREIGN KEY (packageId) REFERENCES BMT_Packages(id)
);

CREATE TABLE BMT_Images (
    id INT PRIMARY KEY AUTO_INCREMENT,
    packageId INT,
    imageUrl VARCHAR(255),
    FOREIGN KEY (packageId) REFERENCES BMT_Packages(id)
);

CREATE TABLE BMT_Days (
    id INT PRIMARY KEY AUTO_INCREMENT,
    packageId INT,
    title VARCHAR(255),
    FOREIGN KEY (packageId) REFERENCES BMT_Packages(id)
);

CREATE TABLE BMT_Itinerary (
    id INT PRIMARY KEY AUTO_INCREMENT,
    dayId INT,
    title VARCHAR(255),
    description TEXT,
    type VARCHAR(50),
    image VARCHAR(255),
    price DECIMAL(10, 2),
    isRemove BOOLEAN,
    rating DECIMAL(2, 1),
    FOREIGN KEY (dayId) REFERENCES BMT_Itinerary(id)
);

CREATE TABLE BMT_ItineraryPlaces (
    id INT PRIMARY KEY AUTO_INCREMENT,
    itineraryId INT,
    placeName VARCHAR(255),
	description TEXT,
    FOREIGN KEY (itineraryId) REFERENCES BMT_Itinerary(id)
);

CREATE TABLE BMT_Booking_history(
    id INT PRIMARY KEY AUTO_INCREMENT,
    packageId INT,
	userId INT,
    startdate VARCHAR(20),
    enddate INT,
	price DECIMAL(10, 2),
	createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	modifiedAt TIMESTAMP NULL,
    FOREIGN KEY (packageId) REFERENCES BMT_Packages(id),
	FOREIGN KEY (userId) REFERENCES BMT_UserDetails(id)
);

CREATE TABLE BMT_Booking_Itinerary(
    id INT PRIMARY KEY AUTO_INCREMENT,
    bookingId INT,
    itineraryId INT,
  
    FOREIGN KEY (itineraryId) REFERENCES BMT_Itinerary(id),
    FOREIGN KEY (bookingId) REFERENCES BMT_Booking_history(id)
);

INSERT INTO `bmt_userdetails` VALUES (1,'SuperAdmin','SuperAdmin@bmt.com','849f1575ccfbf3a4d6cf00e6c5641b7fd4da2ed3e212c2d79ba9161a5a432ff0','849f1575ccfbf3a4d6cf00e6c5641b7fd4da2ed3e212c2d79ba9161a5a432ff0','9876543210','Punjab','152024','Street 1, Citry, India','superadmin','2024-07-14 16:04:38',NULL);

