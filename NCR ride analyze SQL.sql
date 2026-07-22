create database ncr_project;
use ncr_project;
show tables;

select count(*) 
from uber_bookings;

select *
from uber_bookings;

describe uber_bookings;

show columns from uber_bookings;

select * 
from uber_bookings
limit 10;

-- total revenue
select sum(`Booking value`) as total_revenue
from uber_bookings;

-- vehicle wise revenue
select
	`vehicle type`,
    sum(`booking value`) as total_revenue
from uber_bookings
group by `vehicle type`
order by total_revenue desc;

-- vehicle wise bookings
select 
	`vehicle type`,
    count(*) as total_booking
from uber_bookings
group by `vehicle type`
order by total_booking desc;

-- top pickup location
select `pickup location`, count(*) as top_booking
from uber_bookings
group by `pickup location`
order by top_booking desc
limit 10;

-- top drop location
select `drop location`, count(*) as drop_location
from uber_bookings
group by `drop location`
order by drop_location desc
limit 10;

-- payment method analyze
select `payment method`, count(*) as payment_method
from uber_bookings
group by `payment method`;

-- average customers rating vehicle type
select `vehicle type`,
	avg(`customer rating`)
from uber_bookings
group by `vehicle type`;

-- cancellation analyze
select 
	`booking status`, count(*) as reason
from uber_bookings
group by `booking status`;

-- reason for cancellation  by customer
select 
	`Reason for cancelling by Customer`, count(*) as cancel_reason
from uber_bookings
group by `Reason for cancelling by Customer`;

-- "Driver Cancellation Reason"
select 
	`Driver Cancellation Reason`, count(*) as Reason_Driver
from uber_bookings
group by `Driver Cancellation Reason`;

-- Incomplete Ride Reasons
select
	`Incomplete Rides Reason`, count(*) as incomplete_reason
from uber_bookings
group by `Incomplete Rides Reason`;

-- total revenue
select sum(`booking value`) from uber_bookings;

-- highest revenue vehicle
select 
	`vehicle type`,
    sum(`booking value`) as top_revenue
from uber_bookings
group by `vehicle type`
order by top_revenue desc;

-- monthly revenue trend
SELECT 
    MONTH(`Date`) AS Month_No,
    MONTHNAME(`Date`) AS Month_Name,
    SUM(`Booking Value`) AS Total_Revenue
FROM uber_bookings
GROUP BY MONTH(`Date`), MONTHNAME(`Date`)
ORDER BY MONTH(`Date`);

-- Time Analysis for booking
select 
	hour(`Time`) as Hours,
    count(*) as no_of_Booking_id
from uber_bookings
group by hour(`Time`)
order by hours;

