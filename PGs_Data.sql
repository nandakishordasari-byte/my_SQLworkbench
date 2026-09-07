use algonex;
create table PGs_Data(
    Estb_year INT,
    PG_id INT PRIMARY KEY,
    PG_name VARCHAR(100),
    Address_Area VARCHAR(200),
    pincode INT,
    Category VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    Owner_Name VARCHAR(100),
    Parking VARCHAR(20),
    Gym VARCHAR(20),
    Lift VARCHAR(20),
    Contact VARCHAR(15),
    Rent DECIMAL(10,2),
    Sharing VARCHAR(30),a
    Deposit DECIMAL(10,2),
    Food_Specials VARCHAR(200),
    Facilities VARCHAR(500),
    Feedback VARCHAR(300),
    Rules VARCHAR(500),
    Rating DECIMAL(2,1),
    SecurityCCTV VARCHAR(10),
    Self_Cooking VARCHAR(10)
);
select*from PGs_Data;
INSERT INTO PGs_Data VALUES
(2018, 101, 'Sri Lakshmi PG', 'Marathahalli Bridge', 560037, 'Boys',
 'Bengaluru', 'Karnataka', 'Ramesh Kumar', 'Yes', 'No', 'Yes',
 '9876543210', 8500, '3 Sharing', 17000,
 'South Indian Meals', 'WiFi, Washing Machine, Hot Water, TV',
 'Good food and clean rooms', 'No smoking, No loud music', 4.2, 'Yes', 'No'),

(2019, 102, 'Sai Comfort PG', 'Munnekollal, Marathahalli', 560037, 'Girls',
 'Bengaluru', 'Karnataka', 'Sujatha Reddy', 'Yes', 'Yes', 'Yes',
 '9876543211', 9500, '2 Sharing', 19000,
 'North and South Indian Food', 'WiFi, Gym, Laundry, CCTV',
 'Safe and comfortable', 'Entry before 10 PM', 4.5, 'Yes', 'No'),

(2017, 103, 'Green View PG', 'Outer Ring Road, Marathahalli', 560037, 'Boys',
 'Bengaluru', 'Karnataka', 'Mahesh Rao', 'Yes', 'Yes', 'No',
 '9876543212', 7500, '4 Sharing', 15000,
 'Vegetarian Food', 'WiFi, Hot Water, Laundry',
 'Affordable and good location', 'No alcohol allowed', 4.0, 'Yes', 'Yes'),

(2020, 104, 'Royal Stay PG', 'Kalamandir Road, Marathahalli', 560037, 'Unisex',
 'Bengaluru', 'Karnataka', 'Anil Kumar', 'Yes', 'Yes', 'Yes',
 '9876543213', 11000, 'Single', 22000,
 'Veg and Non-Veg', 'WiFi, Gym, Lift, Laundry, AC',
 'Premium facilities', 'Maintain cleanliness', 4.6, 'Yes', 'Yes'),

(2016, 105, 'Balaji PG', 'Marathahalli Village', 560037, 'Boys',
 'Bengaluru', 'Karnataka', 'Srinivas', 'Yes', 'No', 'No',
 '9876543214', 7000, '4 Sharing', 14000,
 'South Indian Food', 'WiFi, Hot Water, Washing Machine',
 'Budget friendly', 'No smoking', 3.9, 'Yes', 'No'),

(2021, 106, 'Comfort Nest PG', 'Kundalahalli Gate, Marathahalli', 560037, 'Girls',
 'Bengaluru', 'Karnataka', 'Priya Sharma', 'No', 'Yes', 'Yes',
 '9876543215', 10500, '2 Sharing', 21000,
 'Healthy Vegetarian Meals', 'WiFi, Gym, Lift, CCTV, Laundry',
 'Very clean and secure', 'Entry before 9:30 PM', 4.7, 'Yes', 'No'),

(2018, 107, 'Metro Residency PG', 'Spice Garden, Marathahalli', 560037, 'Boys',
 'Bengaluru', 'Karnataka', 'Karthik', 'Yes', 'No', 'Yes',
 '9876543216', 9000, '2 Sharing', 18000,
 'South Indian Meals', 'WiFi, Lift, Hot Water, Laundry',
 'Good connectivity', 'Visitors not allowed after 8 PM', 4.1, 'Yes', 'Yes'),

(2022, 108, 'Elite Living PG', 'AECS Layout, Marathahalli', 560037, 'Unisex',
 'Bengaluru', 'Karnataka', 'Vikram Singh', 'Yes', 'Yes', 'Yes',
 '9876543217', 13000, 'Single', 26000,
 'Multi Cuisine Food', 'AC, WiFi, Gym, Lift, Laundry',
 'Excellent facilities', 'No parties allowed', 4.8, 'Yes', 'Yes'),

(2019, 109, 'Sri Durga PG', 'Doddanekundi Road, Marathahalli', 560037, 'Girls',
 'Bengaluru', 'Karnataka', 'Lakshmi Devi', 'Yes', 'No', 'Yes',
 '9876543218', 8200, '3 Sharing', 16000,
 'Vegetarian Food', 'WiFi, Hot Water, CCTV',
 'Good safety and food', 'Entry before 10 PM', 4.2, 'Yes', 'No'),

(2015, 110, 'Sunshine PG', 'Marathahalli Main Road', 560037, 'Boys',
 'Bengaluru', 'Karnataka', 'Ravi Kumar', 'Yes', 'No', 'No',
 '9876543219', 6500, '4 Sharing', 13000,
 'Home Style Food', 'WiFi, Washing Machine',
 'Low cost and decent', 'No alcohol and smoking', 3.8, 'No', 'Yes'),

(2020, 111, 'Urban Stay PG', 'Munnekollal Road, Marathahalli', 560037, 'Unisex',
 'Bengaluru', 'Karnataka', 'Deepak Sharma', 'Yes', 'Yes', 'Yes',
 '9876543220', 12000, 'Single', 24000,
 'Veg and Non-Veg Food', 'WiFi, Gym, AC, Lift, CCTV',
 'Modern and comfortable', 'Maintain silence after 11 PM', 4.6, 'Yes', 'Yes'),

(2017, 112, 'Sree Residency PG', 'Near Marathahalli Bridge', 560037, 'Girls',
 'Bengaluru', 'Karnataka', 'Geetha', 'No', 'No', 'Yes',
 '9876543221', 7800, '3 Sharing', 15600,
 'South Indian Meals', 'WiFi, Lift, Hot Water',
 'Friendly environment', 'Entry before 10 PM', 4.0, 'Yes', 'No'),

(2023, 113, 'Blue Sky PG', 'Kundalahalli, Marathahalli', 560037, 'Boys',
 'Bengaluru', 'Karnataka', 'Arjun Reddy', 'Yes', 'Yes', 'Yes',
 '9876543222', 11500, '2 Sharing', 23000,
 'High Protein Food', 'WiFi, Gym, Laundry, CCTV',
 'Good for IT employees', 'No smoking inside rooms', 4.5, 'Yes', 'Yes'),

(2016, 114, 'Peaceful Home PG', 'Marathahalli Village Road', 560037, 'Girls',
 'Bengaluru', 'Karnataka', 'Meena Reddy', 'Yes', 'No', 'No',
 '9876543223', 7200, '4 Sharing', 14400,
 'Vegetarian South Indian Food', 'WiFi, Hot Water, Laundry',
 'Affordable and peaceful', 'No late entry', 3.9, 'Yes', 'No'),

(2024, 115, 'Skyline Premium PG', 'Outer Ring Road, Marathahalli', 560037, 'Unisex',
 'Bengaluru', 'Karnataka', 'Rahul Verma', 'Yes', 'Yes', 'Yes',
 '9876543224', 14000, 'Single', 28000,
 'Premium Multi Cuisine Food', 'AC, WiFi, Gym, Lift, CCTV, Laundry',
 'Excellent premium stay', 'Professional behavior required', 4.9, 'Yes', 'Yes');
 select * from pgs_data;