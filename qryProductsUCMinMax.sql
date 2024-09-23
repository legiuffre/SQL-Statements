SELECT
		 "Manufacturer",
		 "Truck Model",
		 "Truck SubType",
		 "Model Year",
		 "Sales Start Date",
		 "Unit Cost",
		 min("Unit Cost") OVER(PARTITION BY "Manufacturer" , "Truck Model" , "Truck SubType"  ORDER BY "Manufacturer",
			 "Truck Model",
			 "Truck SubType",
			 "Model Year",
			 "Sales Start Date",
			 "Unit Cost" ) as "Min Unit Cost",
		 max("Unit Cost") OVER(PARTITION BY "Manufacturer" , "Truck Model" , "Truck SubType"  ORDER BY "Manufacturer",
			 "Truck Model",
			 "Truck SubType",
			 "Model Year",
			 "Sales Start Date",
			 "Unit Cost" ) as "Max Unit Cost"
FROM  "Products (Zoho CRM)" 
WHERE	 "Product Category"  = 'Truck'
 AND	"Re-Finance"  = 'No'
 AND	"Re-Lease"  = 'No'
 AND	"Truck Model"  != 'Cascadia CA116'
 AND	"Model Year"  > '2020' /* This is a sample SQL SELECT Query */
/*Use "Control + Space Bar" to see other keywords*/

