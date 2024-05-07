%dw 2.0
output application/csv separator = '^'
---
payload map (item) -> {
	"Actual_Delivery_Date__c": item."ActualDeliveryDate" as Date default null,
	"Name": item."OrderNumber",
	"Ship_To__r.External_ID__c": item."ShipTo",
	"Order__r.External_ID__c": item."OrderNumber",
	//"Invoice__r.External_ID__c": item."OrderNumber",
	"Ship_To_Address_1__c": item."ShiptoAddress1" replace /['\r\n|"']/ with "",
	"Ship_To_Address_2__c": item."ShiptoAddress2" replace /['\r\n|"']/ with "",
	"Ship_To_Address_3__c": item."ShiptoAddress3" replace /['\r\n|"']/ with "",
	"Ship_To_City__c": item."ShiptoCity",
	"Ship_To_Country__c": item."ShiptoCountry",
	"Ship_To_Name__c": item."ShipToName" replace /['\r\n|"']/ with "",
	"Ship_To_Zip_Postal_Code__c": item."shiptoZip",
	"Ship_To_State__c": item."ShiptoState",
	"External_ID__c": item."OrderNumber",
	//"Ship_Date__c": item."ShipDate" as Date default null,
	"Customer_Number__r.Customer_Number__c": item."CustomerNumber",
	"Stage__c": "Shipment",
	"Sales_Warehouse__r.External_ID__c": item."SalesWhse",
	"Sales_Rep_In__c": item."SalesRepIn",
	"Sales_Rep_Out__c": item."SalesRepOut",
	"Taken_By__c": item."TakenBy",
	"Placed_By__c": item."PlacedBy",
	"Entered_Date__c": item."EnterDate" as Date default null,
	"Disposition__c": item."Disposition",
	"Ship_Via__c": item."ShipVia",
	"Origin_Code__c": item."OriginCode",
	"Origin_Name__c": item."OriginName",
	"Customer_PO__c": item."CustomerPO",
	"Account__r.External_Unique_ID__c": item."CustomerNumber"
}