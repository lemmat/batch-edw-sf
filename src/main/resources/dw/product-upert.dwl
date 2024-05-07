%dw 2.0
output application/csv separator = '^'
---
payload map (item) -> {
	"External_ID__c": item."ProductID" replace /['\r\n|"']/ with "",
	"Description": item."ProductDescription" replace /['\r\n|"']/ with "",
	"Family": item."PCAT" replace /['\r\n|"']/ with "",
	"Name": item."ProductID" replace /['\r\n|"']/ with "",
	"StockKeepingUnit": item."ProductID" replace /['\r\n|"']/ with "",
	"QuantityUnitOfMeasure": item."QuantityUnitOfMeasure",
	"Non_RA_Hierarchy_Code__c": item."AD_HierarchyCode",
	"RA_Hierarchy_Code__c": item."RA_HierarchyCode",
	"Product_Line__c": item."ProductLine",
	"Vendor__r.Vendor_External_ID__c": item."VendorNumber",
	"Price_Type__c": item."PriceType",
	"IsActive": true
}