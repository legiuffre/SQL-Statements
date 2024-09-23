SELECT
		 tt."Actual Del - Dealer" as "Actual Del - Dealer",
		 tt."Est Del Dealer" as "Est Del Dealer",
		 tt."Cost per Mile - (Maint)" as "Cost per Mile - (Maint)",
		 tt."Del Change Counter" as "Del Change Counter",
		 tt."Truck In Service Date" as "In Service Date",
		 tt."MPG" as "MPG",
		 tt."Non-Zonar" as "Non-Zonar",
		 tt."Original Del Dealer" as "Original Del Dealer",
		 tt."testyr1" as "testyr1",
		 tt."Truck Make" as "Truck Make",
		 tt."Truck Model" as "Truck Model",
		 tt."Truck Status" as "Truck Status",
		 tt."Truck VIN" as "Truck VIN",
		 tt."Truck Year" as "Truck Year",
		 tt."Id" as "Id",
		 tt."Weekly Payment" as "Weekly Payment",
		 pt."Truck Type" as "Truck Type",
		 pt."Fiscal Year" as "Fiscal Year",
		 pt."Manufacturer" as "Manufacturer",
		 pt."Product Category" as "Product Category",
		 pt."Re-Lease" as "Re-Lease",
		 pt."Sales Start Date" as "Sales Start Date",
		 pt."Unit Cost" as "Unit Cost",
		 pt."Id" as "ptId",
		 if(tt."Truck Type"  = 'Team', round(((tt."Weekly Payment" * 52) / 200000), 2), round(((tt."Weekly Payment" * 52) / 100000), 2)) as "Financial Cost"
FROM  "Trucks (Zoho CRM)" tt
RIGHT JOIN "Products (Zoho CRM)" pt ON tt."Product Name"  = pt."id"  
WHERE	 tt."Contract Status"  = 'Leased'
 AND	pt."Product Name"  is not null
 AND	tt."Zonar GPS ID"  IS NOT NULL
 AND	tt."MPG"  > 0
 AND	tt."MPG"  <= 15
 AND	tt."Cost per Mile - (Maint)"  > 0
ORDER BY "Manufacturer" 
