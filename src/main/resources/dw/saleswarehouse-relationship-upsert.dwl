%dw 2.0
output application/csv separator = '^'
---
payload map (item) -> {
	"Account_Name__r.External_Unique_ID__c": item."Account_Name_c",
	"Branch__r.External_ID__c": item."Name",
	"Branch_ID__c": item."Branch_ID_c",
	"Name": item."Name"
}