%dw 2.0
output application/csv separator = '^'
---
payload map ((item, index) -> {
	"RecordTypeId": p('record.spatask'),
	"Description": "SPA Task",
	"Subject": "SPA Task",
	"Status": "Not Started",
	"Type__c": "SPA Task",
	"ActivityDate": item.EndDate as Date default null,
	"Vendor__r.Vendor_External_ID__c": item."VendorNo",
	"Contract_No__c": item."ContractNo",
	"Customer_Number__r.Customer_Number__c": if(item."CustomerNo" != 0) item."CustomerNo" else "",
	"Rebate_Amount__c": item."Pending_RebateAmt",
	"Sales__c": item."Last12_RebateAmt",
	"Account_Manager_Name__c": item."AccountManager_Name",
	"Load_Date__c": item."LoadDate" as Date default null,
	"Sales_Rep_Initials__c": item."SlsRepID",
	"Last_Updated__c": item."LastUpdated"
})