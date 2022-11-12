SELECT *
FROM olympic_games..athletes_event_results


SELECT TOP 1000 ID, Name, Sex, Age, Height, Weight, NOC, Games, City, Sport, Event, Medal
FROM olympic_games..athletes_event_results


SELECT ID, Name AS  'Competitor Name', 
CASE WHEN Sex='M' THEN 'Male' ELSE 'Female' END AS Sex,
CASE WHEN Age < 18 THEN 'Under 18'
     WHEN Age BETWEEN 18 AND 25 THEN '18-25'
	 WHEN Age BETWEEN 25 AND 30 THEN '25-30'
	 WHEN Age > 30 THEN 'Over 30' END AS Age,
Height,
Weight,
NOC AS 'Nation Code',
LEFT(Games, CHARINDEX(' ', Games)-1) AS 'Year',
--RIGHT(Games, CHARINDEX(' ', REVERSE(Games))-1) AS 'Season',
Sport,
Event,
CASE WHEN Medal='NA' THEN 'Not registered' ELSE Medal END AS Medal
FROM olympic_games..athletes_event_results
WHERE RIGHT(Games, CHARINDEX(' ', REVERSE(Games))-1) = 'Summer'