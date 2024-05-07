%dw 2.0
output application/csv separator = ','
---
payload map ((item, index) -> {
  "Product__r.External_ID__c": item."Shipprod" replace /['\r\n|"']/ with "",
  "Quantity_Shipped__c": item."QuantityShipped",
  "Name": item."LineNumber",
  "Shipment__r.External_ID__c": item."OrderNumber",
  "Tracking_Number__c": item."Tracking_Number",
  "Tracking_URL__c": item."Tracking_URL",
  "External_ID__c": item."LineItemID",
  "Sales_Warehouse__r.External_ID__c": item."SalesWhse",
  "Customer_Number__r.Customer_Number__c": item."CustomerNumber",
  "Line_Type__c": item."LineType",
  "Rebate_Type__c": item."RebateType",
  "Cost__c": item."Cost",
  "Margin__c": item."MarginPct",
  "Rebated_Cost__c": item."RebatedCost",
  "Price_UOM__c": item."UOM"
})