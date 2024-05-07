%dw 2.0
output application/csv separator='^'
---
payload map (item) -> {
	"Name": item."VendorName" replace /['"']/ with "",
	"RecordTypeId": p('record.vendor'),
	"Vendor_External_ID__c": item."VendorNumber" replace /['\r\n|"']/ with "",
	"BillingStreet": item."Address1" replace /['\r\n|"']/ with "",
	"BillingCity": item."City",
	"BillingState": item."State",
	"BillingCountry": item."Country",
	"BillingPostalCode": item."Zip",
	"Terms__c": item."TermsType",
	"Vendor_Type__c": item."VendorType"
} 