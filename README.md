# EDW-DB-SYS-API - README

## Introduction

The **EDW-DB-SYS-API** facilitates seamless data integration between multiple internal and external systems and the enterprise data warehouse (EDW) through MuleSoft. It handles data from systems such as **Xngage**, **Salesforce**, and **Salesforce Pardot**, ensuring proper processing, transformation, storage, and integration with the EDW. The API supports both **real-time** and **scheduled** data flows.

---

## Overview of the API

The primary goal of the EDW-DB-SYS-API is to manage and integrate data from EDW into **Salesforce**, **Salesforce pardot integration** and integration of **Salesforce pub/sub** events with external service (**Xngage**) handling different types of data to keep organizational information accurate and up-to-date.

### Primary Functionality
- This API allows for the:
     - Integration of data from **EDW** to **Salesforce**
     - **Salesforce Pardot** integration
     - Integration of **Salesforce Pub/Sub** events with **Xngage**
- **Supports Real-Time and Scheduled Flows:** Ensures that data is synchronized both in real-time and on a schedule to maintain data accuracy and timeliness.

### Key Features
- **Data Integration:** Facilitates data flow from EDW to the external system .
- **Data Types Managed:** Includes customer numbers, ship-to details, vendor master records, quotes, credit application statuses, lead and market profiles, and more from the relevant systems.
- **Scheduling & Real-Time Flows:** Supports scheduled synchronization and real-time synchronization for **Salesforce** and **Salesforce Pardot** data.

---

## Target Audience

This API is intended for:
- **Developers:** Integrating customer management and data synchronization functions into their applications.
- **System Administrators:** Overseeing data flow and ensuring proper integration.
- **Data Engineers:** Managing data pipelines and ensuring data accuracy.
- **Business Analysts:** Understanding data flows for reporting and analysis.

---

## Integration and Dependencies

- **MuleSoft:** The central integration platform for facilitating data flow between external systems and the EDW.
- **Salesforce & Salesforce Pardot:** Provide lead and market profile data and other related information.
- **Data Warehouse (EDW):** The central repository for all integrated data, ensuring centralized management and availability for analysis.

---

## Usage Context

The EDW-DB-SYS-API is utilized in several organizational scenarios:
- **Real-Time Updates:** Managing lead and marketing profile updates from **Salesforce Pardot**.
- **Scheduled Synchronization:** Synchronizing customer, vendor, and transaction data.
- **Data Integration Solutions:** Building solutions that ensure accurate and timely data updates across different systems.

---

## Versioning and Updates

- **Version:** 1.1
- **Future Updates:** Planned updates include performance enhancements, new integration points, and expanded data management features to meet evolving business needs.

---

## Implementation Flow

### Group 1: Account and Relationship Management Flows

#### Flows:
- Account Manager
- Sales Warehouse
- Customer Reference
- Vendor
- Sales Warehouse Relationship
- Customer Number
- ShipTo
- Account Manager Relationship

#### Description:
These flows handle and update various records related to accounts and relationships in **Salesforce**. The process is triggered by a scheduler based on a cron expression. The flow uses decision logic, retrieves data from database tables/views, processes it in batches, and maps database columns to **Salesforce** fields. Error handling is integrated to manage batch step failures and ensures the process proceeds smoothly.

#### Step-by-step Process:

1. **Scheduler Trigger:**
   - Component: `<scheduler>`
   - Description: The flow is triggered at specific times using a cron expression.

2. **Logging Job Start:**
   - Component: `<logger>`
   - Description: Logs a message indicating the start of the job.

3. **Set Job Variable:**
   - Component: `<set-variable>`
   - Description: Sets a job variable with the appropriate value.

4. **Set Current Update Date:**
   - Component: `<set-variable>`
   - Description: Sets the `currentUpdateDate` variable with the current timestamp in the correct time zone.

5. **Retrieve Last Update Date:**
   - Component: `<os:retrieve>`
   - Description: Retrieves the last update date from the object store. Defaults to 24 hours prior if not found.

6. **Determine SQL Statement:**
   - Component: `<choice>`
   - Description: Sets the SQL query variable based on specific conditions.

7. **Log SQL Statement and Dates:**
   - Component: `<db:select>`
   - Description: Executes the SQL query to retrieve records updated between `lastUpdateDate` and `currentUpdateDate`.

8. **Transform Payload:**
   - Component: `<ee:transform>`
   - Description: Transforms the retrieved data into the required format.

9. **Batch Job:**
   - Component: `<batch:job>`
   - Description: Processes records in batches, upserts them into **Salesforce**, and handles errors.

---

### Group 2: Product and Order Management Flows

#### Flows:
- Product
- Price Book Entry
- Order
- Order Line
- Invoice
- Invoice Line
- Shipment
- Shipment Line

#### Description:
These flows handle and update product and order records in **Salesforce**. They retrieve records from a database, process them in batches, and update **Salesforce**. Each flow runs at scheduled times and appropriately manages both successful and failed records.

#### Step-by-step Process:

1. **Scheduler Trigger:**
   - Component: `<scheduler>`
   - Description: Triggered at specific times defined by a cron expression.

2. **Logging Job Start:**
   - Component: `<logger>`
   - Description: Logs the start of the job.

3. **Set Job Variable:**
   - Component: `<set-variable>`
   - Description: Sets a variable named `job` with the appropriate value.

4. **Set Current Update Date:**
   - Component: `<set-variable>`
   - Description: Sets a `currentUpdateDate` variable with the current timestamp in the correct time zone.

5. **Retrieve Last Update Date:**
   - Component: `<os:retrieve>`
   - Description: Retrieves the last update date from the object store. Defaults to 24 hours before if not found.

6. **Determine SQL Statement:**
   - Component: `<choice>`
   - Description: Sets the SQL query based on specific conditions.

7. **Log SQL Statement and Dates:**
   - Component: `<db:select>`
   - Description: Executes the SQL query to retrieve updated records.

8. **Transform Payload:**
   - Component: `<ee:transform>`
   - Description: Transforms the retrieved data into the required format.

9. **Batch Job:**
   - Component: `<batch:job>`
   - Description: Processes records in batches, upserts them to **Salesforce**, and handles errors.

> **Note:** The **Price Book Entry Flow** includes an additional validation step to check for the existence of a record in the price book before attempting to upsert the record in **Salesforce**.

---

## Conclusion

The **EDW-DB-SYS-API** is designed for managing data integration across multiple systems, ensuring that data is accurately processed, transformed, and stored in real-time and on a scheduled basis. It supports various business functions and keeps data consistent across different organizational platforms.
