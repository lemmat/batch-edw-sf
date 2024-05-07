%dw 2.0
output application/csv separator = '^'
---
payload map ((item, index) ->{
	"External_ID__c": item."LineItemID",
	"Invoice__r.External_ID__c": item."OrderNumber",
	"Name": item."OrderNumber",
	"Product__r.External_ID__c": item."Shipprod" replace /['\r\n|"']/ with "",
	"Quantity__c": item."qtyord",
	"Tax_Effective_Date__c": item."InvoiceDate" as Date default null,
	"Unit_Price__c": item."price",
	"Invoice_Line_ID__c": item."LineItemID",
	"Line_Number__c": item."LineNumber",
	"Extended_Amount__c": item."Sales",
	"Order_Number__r.External_ID__c": item."OrderNumber",
	"Line_Type__c": item."LineType",
	"Rebate_Type__c": item."RebateType",
	"Cost__c": item."Cost",
	"Margin__c": item."MarginPct",
	"Contract_Number__c": item."ContractNo",
	"Rebated_Cost__c": item."RebatedCost",
	"Price_UOM__c": item."UOM",
	"Quantity_shipped__c": item."QuantityShipped",
	"Margin_dollars__c": item."GrossProfit"
})