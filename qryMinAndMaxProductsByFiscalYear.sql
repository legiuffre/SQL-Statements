SELECT
		 pt."Fiscal Year" as "Fiscal Year",
		 pt."Manufacturer" as "Manufacturer",
		 pt."Product Category" as "Product Category",
		 pt."Sales Start Date" as "Sales Start Date",
		 pt."Unit Cost" as "Unit Cost",
		 pt."Product Name" as "Product Name",
		 pt."Truck Type" as "Truck Type",
		 pt."Truck SubType" as "Truck SubType",
		 pt."Id" as "Product ID",
		 pt."Truck Model" as "Truck Model",
		 pt."Model Year" as "Model Year",
		 min(pt."Unit Cost") OVER(PARTITION BY pt."Fiscal Year" , pt."Manufacturer" , pt."Truck Type" , pt."Truck SubType"  ) as "Min Unit Cost",
		 max(pt."Unit Cost") OVER(PARTITION BY pt."Fiscal Year" , pt."Manufacturer" , pt."Truck Type" , pt."Truck SubType"  ) as "Max Unit Cost"
FROM  "Products (Zoho CRM)" pt 
WHERE	 pt."Product Category"  = 'Truck'
 AND	pt."Truck Model"  NOT LIKE '%CA116%'
 AND	pt."Re-Lease"  != true
 AND	pt."Re-Finance"  != true
GROUP BY pt."Fiscal Year",
	 pt."Manufacturer",
	 pt."Product Category",
	 pt."Sales Start Date",
	 pt."Unit Cost",
	 pt."Product Name",
	 pt."Truck Type",
	 pt."Truck SubType",
	 pt."Truck Model",
	 pt."Model Year",
	  pt."Id" 
ORDER BY "Manufacturer",
	 "Fiscal Year" 
