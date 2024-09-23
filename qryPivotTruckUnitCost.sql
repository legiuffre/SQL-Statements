SELECT *
FROM (	SELECT
			 "Products (Zoho CRM)"."Manufacturer" as "Manufacturer",
			 "Products (Zoho CRM)"."Fiscal Year" as "Fiscal Year",
			 "Products (Zoho CRM)"."Truck Type" as "Truck Type",
			 "Products (Zoho CRM)"."Unit Cost" as "Unit Cost"
	FROM  "Products (Zoho CRM)" 
	WHERE	 "Truck Model"  not like '%CA116%'
	 AND	"Re-Lease"  != 'Yes'
	 AND	"Re-Finance"  != 'Yes'
) /* split the unique values of a row into columns  and asign an aggregate column to get the value for the columns*/ AS  "pivot-source"
pivot
(MAX("pivot-source"."Unit Cost") FOR "pivot-source"."Fiscal Year"  in ( "2020"  , "2021"  , "2022"  , "2023"  )
) AS Pivottable 
