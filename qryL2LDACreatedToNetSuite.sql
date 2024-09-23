SELECT
		 qsh."Quote Stage" as "qsh.Quote Stage",
		 qsh."Id" as "qsh.Id",
		 qsh."Subject" as "qsh.Quote ID",
		 qsh."Modified Time" as "qsh.Modified Time",
		 qsh."Email" as "qsh.Email",
		 qsh."Duration (Days)" as "qsh.Duration",
		 qte."Account Name" as "Account Name",
		 so."Created Time" as "so.Created Time",
		 concat_ws('/', left_string(month_name(qsh."Modified Time"), 3), year(qsh."Modified Time")) as "Month/Year"
FROM  "Quote Stage History (Zoho CRM)" qsh
JOIN "Quotes (Zoho CRM)" qte ON qte."Id"  = qsh."Subject" 
JOIN "Sales Orders (Zoho CRM)" so ON so."Account Name"  = qte."Account Name"
	 AND	qsh."Quote Stage"  = 'Client Accepted'  
WHERE	 upper_case(qte."Account Name")  NOT LIKE 'ZZ_%'
 AND	qsh."Duration (Days)"  >= 0
ORDER BY qte."Id",
	 qsh."Modified Time" ASC 
