SELECT
		 month_name(soh."Modified Time"),
		 year(soh."Modified Time"),
		 soh."Status",
		 soh."Moved To",
		 AVG(soh."Duration (Days)"),
		 concat_ws('/', left_string(month_name(soh."Modified Time"), 3), year(soh."Modified Time")) as "Month/Year"
FROM  "Sales Orders (Zoho CRM)" so
LEFT JOIN "Sales Orders Status History (Zoho CRM)" soh ON soh."Subject"  = so."Id"  
WHERE	 soh."Status"  = 'Create PandaDoc Lease'
 AND	soh."Moved To"  = 'Ready for NetLessor Lease'
 AND	soh."Duration (Days)"  > 0
 AND	upper_case(so."Account Name")  NOT LIKE 'ZZ_%'
GROUP BY month_name(soh."Modified Time"),
	 year(soh."Modified Time"),
	 soh."Status",
	 soh."Moved To",
	  concat_ws('/', left_string(month_name(soh."Modified Time"), 3), year(soh."Modified Time")) 
