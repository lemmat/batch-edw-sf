%dw 2.0
output application/csv separator='^'
---
payload map (item) -> {
    "Name": item."branch",
    "Region__c": item."Region",
	"Sales_Warehouse_Name__c": item."saleswhse_name",
	"External_ID__c": item."saleswhse_name",
	"Sales_Warehouse_Code__c": item."branch"
}