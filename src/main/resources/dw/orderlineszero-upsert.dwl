%dw 2.0
output application/csv separator = '^'
---
payload map ((item, index) -> {
	"Order.External_ID__c": item."OrderNumber",
	"Product2Id": p('record.productzeroline'),
	"Quantity": 1,
	"UnitPrice": if ( isEmpty(item."price") ) 0 else (item."price" as Number default 0),
	"External_ID__c": item."OrderNumber",
	"PricebookEntryId": p('record.zeropricebookentryId')
})