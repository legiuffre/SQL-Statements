SELECT DISTINCT
		 "Week Ending",
		 "VIN",
		 round(SUM("Miles") OVER(PARTITION BY "VIN" , "Week Ending"  ORDER BY "Week Ending" )) AS 'Combined Miles'
FROM  "tblMilesDrivenInAWeekImport" 
ORDER BY "VIN",
	 "Week Ending" 
