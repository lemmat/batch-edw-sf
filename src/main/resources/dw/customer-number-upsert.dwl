%dw 2.0
output application/csv separator = '^'
---
payload map (item) -> {
	"Account__r.External_Unique_ID__c": item."CustomerNumber",
	"Customer_Number__c": item."CustomerNumber",
	"Name": item."CustomerName" replace /['\r\n|"']/ with ""
}
  