%dw 2.0
output application/csv separator = '^'
---
payload map (item) -> {
	"Account__r.Account_Number__c": item."CustomerNumber",
	"Customer_Number__c": item."CustomerNumber",
	"Name": item."CustomerName" replace /['\r\n|"']/ with ""
}
  