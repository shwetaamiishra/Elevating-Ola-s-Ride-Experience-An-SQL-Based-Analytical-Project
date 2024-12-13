CREATE DATABASE Ola;
use Ola;

# Retrieve all successful bookings:
CREATE VIEW successful_bookings AS
SELECT * from bookings
WHERE Booking_Status = "Success";
 
 
# Find the average ride distance for each vehicle type:
CREATE VIEW ride_distance_for_each_vehicle AS
SELECT Vehicle_Type, avg(Ride_Distance) AS Avg_Distance
FROM bookings
GROUP BY Vehicle_Type;



# Get the total number of cancelled rides by customers:
CREATE VIEW cancelled_rides_by_customers AS
SELECT COUNT(*) FROM Bookings WHERE Booking_status = "Canceled by Customer";


# List the top 5 customers who booked the highest number of rides:
CREATE VIEW Top_5_Customers AS
SELECT Customer_id, COUNT(Booking_id) AS Total_rides
FROM Bookings
GROUP BY Customer_id
ORDER BY Total_rides DESC LIMIT 5;




# Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW Rides_cancelled_by_drivers_P_C_Issues AS
SELECT COUNT(*) FROM Bookings WHERE Canceled_Rides_by_Driver = "Personal & Car related issue";



# Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT * FROM Bookings;
CREATE VIEW Max_Min_Driver_Rating AS
SELECT MAX(Driver_Ratings) AS Max_Rating,
MIN(Driver_Ratings) AS Min_Rating
FROM Bookings WHERE Vehicle_Type = 'Prime Sedan';

# Retrieve all rides where payment was made using UPI:
CREATE VIEW UPI_Payment AS
SELECT * FROM Bookings WHERE Payment_Method = 'UPI';

# Find the average customer rating per vehicle type:
CREATE VIEW  AVG_Cust_Rating AS
SELECT Vehicle_Type, AVG(Customer_Rating) AS avg_customer_rating
FROM Bookings
GROUP BY Vehicle_Type;

# Calculate the total booking value of rides completed successfully:
Create View total_successful_ride_value As
 SELECT SUM(Booking_Value) as total_successful_ride_value
 FROM bookings
 WHERE Booking_Status = 'Success';
 
# List all incomplete rides along with the reason:
Create View Incomplete_Rides_Reason As
 SELECT Booking_ID, Incomplete_Rides_Reason
 FROM bookings
 WHERE Incomplete_Rides = 'Yes';
