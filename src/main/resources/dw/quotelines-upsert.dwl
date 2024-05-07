%dw 2.0
output application/csv separator = '^'
---
payload map ((item, index) ->  {
	"Line_Description__c": item."LineDescription" replace /['\r\n|"']/ with "",
	"Product__r.External_ID__c": item."Shipprod"  replace /['\r\n|"']/ with "",
	"Quantity__c": item."qtyord",
	"Quote_Line_Number__c": item."LineItemID",
	"Name": item."OrderNumber",
	"Quote__r.External_ID__c": item."OrderNumber",
	"Unit_Price__c": item."price",
	"Total_Price__c": item."Sales",
	"Line_Type__c": item."LineType",
	"Rebate_Type__c": item."RebateType",
	"Contract_Number__c": item."ContractNo",
	"Cost__c": item."Cost",
	"Margin__c": item."MarginPct",
	"Rebated_Cost__c": item."RebatedCost",
	"Price_UOM__c": item."UOM",
	"Line_Number__c": item."LineNumber",
	"Status__c": item."Status"
})