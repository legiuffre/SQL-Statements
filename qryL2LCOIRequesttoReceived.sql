SELECT
		 month_name(sh."Modified Time"),
		 year(sh."Modified Time"),
		 sh."Stage",
		 avg(sh."Stage Duration (Calendar Days)"),
		 concat_ws('/', left_string(month_name(sh."Modified Time"), 3), year(sh."Modified Time")) as "Month/Year"
FROM  "Stage History (Zoho CRM)" sh
RIGHT JOIN "Proposals (Zoho CRM)" prop ON prop."Id"  = sh."Proposal Name"  
WHERE	 sh."Stage"  = 'COI'
 AND	sh."Stage Duration (Calendar Days)"  > 0
 AND	upper_case(prop."Account Name")  NOT LIKE 'ZZ_%'
GROUP BY month_name(sh."Modified Time"),
	 year(sh."Modified Time"),
	 sh."Stage",
	  concat_ws('/', left_string(month_name(sh."Modified Time"), 3), year(sh."Modified Time")) 
