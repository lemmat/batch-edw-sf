%dw 2.0
output application/csv separator = '^'
---
payload map (item) -> {
	"Ship_To_Name__r.External_Unique_ID__c": item.'CustomerNumber',
	"Customer_Number__r.Customer_Number__c": item.'CustomerNumber',
	"Account_Manager__r.External_ID__c": item.'salesrepid',
	"Sales_Warehouse__r.External_ID__c": item.'SalesWhse_ExternalID',
	"External_ID__c": item.'shipto',
	"Name": item.'name' replace /['"']/ with "",
	"Ship_To_Address_1__c": item.'ShipToAddress1' replace /['\r\n|"']/ with "",
	"Ship_To_Address_2__c": item.'ShipToAddress2' replace /['\r\n|"']/ with "",
	"Ship_To_Address_3__c": item.'ShipToAddress3' replace /['\r\n|"']/ with "",
	"Ship_To_City__c": item.'City',
	"Ship_To_State__c": item.'State',
	"Ship_To_Zip__c": item.'Zip',
	"Ship_To_Country__c": item.'Country',
	"Job_Type__c": item.'jobdesc',
	"General_Contractor__c": item.'generalcontractor',
	"Project_Owner__c": item.'JobOwner',
	"Lender__c": item.'lendername',
	"Job_Start_date__c": item.'jobstartdate' as Date default null,
	"Estimated_Completion_Date__c": item.'EstimatedCompletionDate'  as Date default null,
	"Owner_Name__c": item.'JobOwner',
	"Owner_Address_1__c": item.'OwnerAddress1',
	"Owner_Address_2__c": item.'OwnerAddress2',
	"Owner_City__c": item.'OwnerCity',
	"Owner_State__c": item.'OwnerState',
	"Owner_Zip_Code__c": item.'OwnerZip',
	"Lender_Name__c": item.'lendername',
	"Lender_Address_1__c": (item.LenderAddress1 default "") ++ (item.LenderAddress2 default ""),
	"Lender_City__c": item.'LenderCity',
	"Lender_State__c": item.'LenderState',
	"Lender_Zip__c": item.'LenderZip',
	"Hide_From_View__c": item.'ShowShipto',
	"Ship_To_Code__c": item.'ShipToName' replace /['\r\n|"']/ with "",
	"General_Contractor_Address_1__c": (item.generalcontractor_address1 default "") ++ (item.generalcontractor_address2 default ""),
	"General_Contractor_City__c": item.'generalcontractor_city',
	"General_Contractor_State__c": item.'generalcontractor_state',
	"General_Contractor_Zip__c": item.'generalcontractor_zip'
}