-- 1st Question
SELECT * FROM cd.facilities

-- 2nd Question
SELECT name, membercost FROM cd.facilities

-- 3rd Question
SELECT * FROM cd.facilities WHERE membercost> 0

-- 4th Question
SELECT facid, name, membercost, monthlymaintenance FROM cd.facilities  
WHERE (membercost < monthlymaintenance/50) AND membercost >0

-- 5th Question
SELECT * FROM cd.facilities WHERE name ILIKE '%Tennis%'

-- 6th Question
SELECT * FROM cd.facilities WHERE facid IN(1,5)

-- 7th Question
SELECT memid, surname, firstname, joindate  FROM cd.members WHERE joindate > '2012-09-01'

-- 8th Question
SELECT DISTINCT(surname) FROM cd.members ORDER BY surname LIMIT 10

-- 9th Question
SELECT MAX(joindate) AS latest_signup FROM cd.members;

-- 10th Question
SELECT COUNT(*) FROM cd.facilities WHERE guestcost >=10

-- 11th Question
SELECT facid, SUM(slots) AS total_slots FROM cd.bookings WHERE TO_CHAR(starttime, 'mm-yyyy') = '09-2012' GROUP BY facid ORDER BY SUM(slots)

-- 12th Question
SELECT facid, SUM(slots) AS total_slots FROM cd.bookings GROUP BY facid HAVING SUM(slots)> 1000 ORDER BY facid

-- 13th Question
SELECT starttime as start, name FROM cd.bookings
INNER  JOIN cd.facilities 
ON cd.bookings.facid = cd.facilities.facid
WHERE name ILIKE 'Tennis%' AND TO_CHAR(starttime, 'yyyy-mm-dd') = '2012-09-21' 
ORDER BY starttime

-- 14th Question
SELECT starttime FROM cd.bookings WHERE memid IN (
  SELECT memid FROM cd.members WHERE surname = 'Farrell' AND firstname = 'David')
--OR
SELECT starttime FROM cd.bookings 
INNER JOIN cd.members ON 
cd.members.memid = cd.bookings.memid 
WHERE firstname='David' AND surname='Farrell';

