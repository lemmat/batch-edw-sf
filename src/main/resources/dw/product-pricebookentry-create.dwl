%dw 2.0
output application/json
---
payload map (item) -> {
	"Product2.External_ID__c": item."ProductID" replace /['\r\n|"']/ with "",
	"IsActive": true,
	"UnitPrice": 0,
	"Pricebook2Id": p('pricebook.standard'),
	"UseStandardPrice": false
}