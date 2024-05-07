%dw 2.0
output application/csv separator='^'
---
payload map (item) -> {
	"Name": item."AccountManagerName",
	"Email__c": (item."AccountManagerEmail"splitBy  ";"[0]),
	"Email2__c":(item."AccountManagerEmail" splitBy  ";"[1]),
	"External_ID__c": item."SalesrepID"
}