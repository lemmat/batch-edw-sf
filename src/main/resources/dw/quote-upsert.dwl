%dw 2.0
output application/csv separator = '^'
---
payload map (item) ->  {
	"Account_Name__r.Account_Number__c": item."CustomerNumber",
	"Name": item."OrderNumber",
	"External_ID__c": item."OrderNumber",
	"Tax__c": item."TotalTax",
	"Total_Price__c": item."OrderAmount",
	"Quote_Number__c": item."OrderNumber",
	"Customer_Number__r.Customer_Number__c": item."CustomerNumber",
	"Ship_To__r.External_ID__c": item."ShipTo",
	"Sales_Warehouse__r.External_ID__c": item."SalesWhse",
	"Customer_PO__c": item."CustomerPO" replace /['\r\n|"']/ with "",
	"Salesrep_IN__c": item."SalesRepIn",
	"Salesrep_OUT__c": item."SalesRepOut",
	"Taken_by__c": item."TakenBy",
	"Placed_by__c": item."PlacedBy" replace /['\r\n|"']/ with "",
	"Entered_Date__c": item."EnterDate" as Date default null,
	"Stage__c": item."Stage",
	"Origin_code__c": item."OriginCode",
	"TBD_Name__c": item."OEEH_User4_PlaceHolder",
	"Account_Manager__r.External_ID__c": item."SalesRepOut" default null,
	//"Date__c": item."ActualDeliveryDate" as Date default null,
	"Line_Count__c": item."LineCount"
}