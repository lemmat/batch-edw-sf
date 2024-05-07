%dw 2.0
fun getId(value) = (vars.pricebookEntry default [] filter ($.Name == trim(value)))[0].Id default null
output application/csv separator = '^'
---
payload map ((item, index) -> {
	"EndDate": item."EnterDate" as Date default null,
	"Description": item."LineDescription" replace /['\r\n|"']/ with "",
	// "ListPrice": item."price",
	"Order.External_ID__c": item."OrderNumber",
	"Product2.External_ID__c": item."Shipprod" replace /['\r\n|"']/ with "",
	"PricebookEntryId": getId((item."Shipprod" replace /['\r\n|"']/ with "") default ""),
	"Quantity": item."qtyord",
	"ServiceDate": item."EnterDate" as Date default null,
	// "TotalPrice": item."Sales",
	"UnitPrice": item."price",
	"External_ID__c": item."LineItemID",
	"Line_Type__c": item."LineType",
	"Rebate_Type__c": item."RebateType",
	"Cost__c": item."Cost",
	"Margin__c": item."MarginPct",
	"Contract_Number__c": item."ContractNo",
	"Rebated_Cost__c": item."RebatedCost",
	"Price_UOM__c": item."UOM" as String,
	"Quantity_shipped__c": item."QuantityShipped",
	"Line_Number__c": item."LineNumber",
	"Gross_Profit__c": item."GrossProfit",
	"Status__c": item."Status"
})