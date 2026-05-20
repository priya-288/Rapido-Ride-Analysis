
Create database rapido 
select *
from [dbo].[ride]

-- checking the duplicate
WITH dup_cte as(
select *,
ROW_NUMBER() Over(Partition by source,services,date,time,ride_status,destination,duration,distance,ride_charge,misc_charge,total_fare,payment_method Order by ride_id) as row_num
from [dbo].[ride]
) 
select *
from dup_cte
where row_num>1
--there is no duplicate rows


select * into new_ride1
from [dbo].[ride]


-- checking the information of data
select *
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME='new_ride1'

--from above we find out ride_charge,misc_charge,total_fare have null values
select count(*)
from new_ride
where ride_charge is NULL
select count(*)
from new_ride
where misc_charge is NULL
select count(*)
from new_ride
where total_fare is NULL
-- But for now we will not delete the nulls because all cencelled ride have null charges so we will replace it with 0

Update new_ride1
SET
ride_charge=ISNULL(ride_charge,0),
misc_charge=ISNULL(misc_charge,0),
total_fare=ISNULL(total_fare,0),

Update new_ride1
set payment_method = 'Not Available'
where payment_method = 'nan';

select *
from new_ride1

alter table new_ride1
alter column total_fare int;

alter table new_ride1
alter column ride_charge int;

alter table new_ride1
alter column misc_charge int;

--Q1. Which service type has the highest number of rides?
select count(services) as [Services Count],services
from new_ride1
group by services
order by [Services Count] desc
-- Bike service has the highest ride volume, followed by auto and cab economy

--Q2. Which service generates the highest revenue?
select sum(total_fare) as [revenue],services
from new_ride1
group by services
order by [revenue] desc
-- Bike ride has the highest revenue

--Q3 Which service has the highest cancellation rate?  
-- Fromula for cancelled ride (cancelled ride/total ride)*100
select ROUND(
	100.0* Sum(Case
			when ride_status like 'cancelled' then 1
			else 0
			end) / count(*),2) as [Cancelled Rate]
	,services
from new_ride1
group by services
order by [Cancelled Rate] desc
-- cab economy and Bike have highest cancellation rate

--Q4. At what time of day do cancellations peak?
with CTE as(
select *,
	Case
		when time between '05:00:00' and '11:59:59' then 'Morning'
		when time between '12:00:00' and '17:59:59' then 'Afternoon'
		when time between '18:00:00' and '23:59:59' then 'Evening'
		else 'MidNight'
    end as [Time_frame]
from new_ride1
) 
select count(Time_frame) as [Cancelled Ride],Time_frame
from CTE
where ride_status like 'cancelled'
group by Time_frame
order by [Cancelled Ride] desc
-- At Morning rides are cancelled the most

--Q5. At what time of day ride peak?
with CTE as(
select *,
	Case
		when time between '05:00:00' and '11:59:59' then 'Morning'
		when time between '12:00:00' and '17:59:59' then 'Afternoon'
		when time between '18:00:00' and '23:59:59' then 'Evening'
		else 'MidNight'
    end as [Time_frame]
from new_ride1
) 
select count(Time_frame) as [Total Ride],Time_frame
from CTE
group by Time_frame
order by [Total Ride] desc
--Morning hours experience the highest ride activity, indicating peak customer demand during commuting hours.


--Q6 Which source-destination pairs face frequent cancellations?
select concat(source,'-',destination) as [pick_drop],count(*) as [cancellation_count]
from new_ride1
where ride_status = 'cancelled' 
group by source, destination
having count(*)>1
order by [cancellation_count]  desc
-- There is no specific route showing unusually high cancellations.


--Q7 Most preferred payment method?
select count(*) as [Method Count],payment_method
from new_ride1
group by payment_method
order by [Method Count] desc
-- No dominant payment preference and customers use all digital methods almost equally

--Q8 Average fare per service type?
select avg(ride_charge) as [Average charge],services
from new_ride1
group by services
order by [Average charge] desc
--Average charge of all the services is almost similer

--Q9 Average Fare charged per distance in each services?
select Round(avg((total_fare)/distance),2) as [price_by_distance],services
from new_ride1
group by services
Order by [price_by_distance] desc

--Q10 Which service is most popular during rush hours?
with cte2 as(
select *,
	Case
		when time between '05:00:00' and '11:59:59' then 'Morning'
		when time between '12:00:00' and '17:59:59' then 'Afternoon'
		when time between '18:00:00' and '23:59:59' then 'Evening'
		else 'MidNight'
    end as [Time_frame]
from new_ride1
) 
select count(*) as [services_count],services
from cte2
where [Time_frame] = (
	select top 1 Time_frame
	from cte2
	group by Time_frame
	order by count(*) desc
)
group by services
order by [services_count]



/* Final Insight
Bike service is the most preferred and highest revenue-generating ride option in Bangalore.
Morning hours show the highest ride demand as well as the highest cancellations, indicating peak commuting activity. 
Cancellation rates are comparatively higher for bike and cab economy services, while payment methods are used
almost equally across customers. Overall, the analysis highlights strong demand for economical ride services 
and opportunities to improve ride completion efficiency during peak hours.*/


