%dw 2.0
output application/csv separator = '^'
---
payload map (item) -> {
	"Account_Manager1__r.External_ID__c": item."slsrepid",
	"Account_Name__r.External_Unique_ID__c": item."CustomerNumber",
	"External_ID__c": item."AMR_ID",
	"Ship_To__r.External_ID__c": item."ShipTo",
	"Name": item."AccountManagerName"
}