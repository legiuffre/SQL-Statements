SELECT
		 outersql."lt.Manufacturer",
		 outersql."lt.Truck Year",
		 outersql."lt.Truck Make",
		 outersql."lt.Truck Model",
		 outersql."lt.Truck VIN",
		 outersql."lt.Unit Cost",
		 lag(outersql."lt.Unit Cost") over(ORDER BY outersql."lt.Truck Year",
			 outersql."lt.Truck Make",
			 outersql."lt.Truck Model" ) as "Previous Unit Cost",
		 (outersql."lt.Unit Cost" -lag(outersql."lt.Unit Cost") over(ORDER BY outersql."lt.Truck Year",
			 outersql."lt.Truck Make",
			 outersql."lt.Truck Model",
			 outersql."lt.Truck VIN" )) as "Year/Year Difference",
		 avg(volvo."lt.Unit Cost") over(ORDER BY volvo."lt.Truck Year",
			 volvo."lt.Truck Make",
			 volvo."lt.Truck Model",
			 volvo."lt.Truck VIN" ) /*avg_if(max(outersql."lt.Truck Year")='2023',outersql."lt.Unit Cost") as "3 Year Avg",
		 days_between(outersql."cf.In-Shop Date/Time", outersql."cf.Out-Shop Date/Time") as "Days Between Out/In"*/ as "Volvo Average"
FROM  "qryCombinedLeasedTrucksAndCases" outersql
INNER JOIN "qryCombinedLeasedTrucksAndCases" volvo ON volvo."lt.Manufacturer"  = 'Volvo'  
ORDER BY outersql."lt.Manufacturer",
	 outersql."lt.Truck Year",
	 outersql."lt.Truck Make",
	 outersql."lt.Truck Model",
	 outersql."lt.Truck VIN",
	 outersql."lt.Unit Cost" 
