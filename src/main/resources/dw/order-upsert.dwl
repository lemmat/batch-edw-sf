%dw 2.0
output application/csv separator='^'
---
payload map (item) -> {
	"Name": (item."OrderNumber" as String  default ""),
	"Account.External_Unique_ID__c": item."CustomerNumber",
	"EndDate": item."duedate" as Date  default null,
	"EffectiveDate": item."EnterDate"  as Date  default null,
	"Type": item."TransType",
	// ("OriginalOrder.External_ID__c": item."OriginalOrder") if((not isEmpty(item."OriginalOrder")) and  item."OriginalOrder" != 0),
	"Pricebook2Id": p('pricebook.standard'),
	"ShippingStreet": (trim((item."ShiptoAddress1"  default "") ++ " " ++ (item."ShiptoAddress2"  default "") ++ " " ++ (item."ShiptoAddress3" default ""))) replace /['\r\n|"']/ with "",
	"Shippingcity": item."ShiptoCity",
	"Shippingstate": item."ShiptoState",
	"ShippingPostalCode": item."shiptoZip",
	"Shippingcountry": item."ShiptoCountry",
	"External_ID__c": item."OrderNumber",
	"Customer_Number_Lookup__r.Customer_Number__c": item."CustomerNumber",
	"Customer_PO__c": item."CustomerPO" replace /['\r\n|"']/ with "",
	"Ship_To__r.External_ID__c": item."ShipTo",
	"Ship_To_Name__c": item."ShipToName" replace /['\r\n|"']/ with "",
	"Stage__c": item."Stage",
	"Sales_Warehouse__r.External_ID__c": item."SalesWhse",
	"Salerep_In__c": item."SalesRepIn",
	"Salesrep_Out__c": item."SalesRepOut",
	"Taken_By__c": item."TakenBy",
	"Placed_By__c": item."PlacedBy" replace /['\r\n|"']/ with "",
	"Entered_Date__c": item."EnterDate",
	"Disposition__c": item."Disposition",
	"Ship_Via__c": item."ShipVia",
	"Origin_Code__c": item."OriginCode",
	"Origin_Name__c": item."OriginName",
	"Status": "Draft"
}