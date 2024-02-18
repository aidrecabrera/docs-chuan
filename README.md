<p align="center">
  <a href="https://github.com/aidrecabrera/docs-chuan">
    <img alt="docsify" src="./img/chuan-white.png" width="250">
  </a>
</p>

<h1 align="center" >
  Chuan Specialized System
</h1>


<div align="center">
<a href="https://www.facebook.com/chuanspaDigosCity/">
    <img alt="Static Badge" src="https://img.shields.io/badge/client-0048fa?style=for-the-badge&logo=facebook&link=https%3A%2F%2Fwww.facebook.com%2FchuanspaDigosCity">
</a>
<a href="https://aidrecabrera-portfolio.vercel.app">
    <img alt="Static Badge" src="https://img.shields.io/badge/author-0048fa?style=for-the-badge&logo=github&link=https%3A%2F%2Faidrecabrera-portfolio.vercel.app%2F">
</a>
<a href="https://github.com/aidrecabrera/docs-chuan/">
    <img alt="Static Badge" src="https://img.shields.io/badge/docs-0048fa?style=for-the-badge&logo=github&link=https%3A%2F%2Fgithub.com/docs-chuan%2F">
</a>
</div>

# Problem
### Background
Chuan Spa Clinic is a business offering spa services and products. Their operations involve various aspects such as booking, billing, inventory management, employee management, reporting, and loyalty incentives. Currently, these operations might be manual or fragmented across different systems, leading to inefficiencies and potential errors.

### The Problem
- The current manual or fragmented systems for managing daily transactions, employee management, inventory tracking, reporting, and loyalty incentives can lead to inefficiencies, errors, and difficulties in scaling the business. This lack of automation and integration hampers productivity and can affect the overall customer experience.
- Efficient management of operations directly impacts the user experience. Streamlining processes such as booking, billing, and inventory management can lead to faster service delivery and improved customer satisfaction. Additionally, accurate reporting and analytics enable informed decision-making, while loyalty incentives can enhance customer retention.
- An analysis of current processes may reveal instances of inefficiencies, errors, or delays. Customer feedback, employee input, and operational metrics such as booking times, inventory turnover, and employee productivity can provide evidence of areas needing improvement.

### Our Approach
The solution involves developing a comprehensive cloud-based POS system tailored for Chuan Spa Clinic. This system will automate and streamline operations such as booking, billing, inventory management, employee management, reporting, and loyalty incentives. Integration with existing systems and platforms will ensure smooth transitions and minimal disruptions.

# Goals & Success
- **What are the goals?**
    - Automate and streamline daily operations
    - Improve efficiency and accuracy in transactions and reporting
    - Enhance customer experience and loyalty
    - Enable scalability for potential expansion to multiple branches
- **How do we define success and what metrics will we use to measure it?**
    - Reduction in transaction processing time
    - Decrease in errors or discrepancies in billing and inventory management
    - Increase in customer satisfaction scores
    - Growth in loyalty program participation
    - Ability to seamlessly scale operations to accommodate business expansion

# Solution
### Features
1. **Booking Management**: Allow customers to book appointments online, with real-time availability updates.
2. **Billing Integration**: Integrate payment gateways for secure and seamless transactions.
3. **Inventory Tracking**: Track inventory levels in real-time, automate reordering processes.
4. **Employee Management**: Manage schedules, track performance, and handle payroll.
5. **Reporting and Analytics**: Generate customized reports on sales, inventory, and employee performance.
6. **Loyalty Incentives**: Implement a loyalty program with rewards and incentives for repeat customers.
7. **Scalability**: Design the system architecture to accommodate potential expansion to multiple branches.
8. **Security and Compliance**: Implement robust security measures to protect customer data and ensure compliance with regulations.

# User Flows & Mocks

The system design depicted in the provided images appears to be inspired by Shopify POS (Point of Sale). Shopify POS is a system designed to facilitate retail transactions, inventory management, and customer engagement in physical retail environments. It provides a comprehensive platform for businesses to manage sales, accept payments, track inventory, and analyze customer data.

---
![sys-chuan: Login UI](https://github.com/aidrecabrera/docs-chuan/assets/61798731/803291c8-fa0b-4cd3-9c7a-af8583b6bc32)
---
![Admin Sitemap](./img/admin_sitemap.svg)
---
![Admin Flow](./img/admin_flow.svg)
---
### Technical Architecture
- **Data Model**: Design a comprehensive data model to capture and organize information related to bookings, billing, inventory, employees, customers, and transactions.
- **System Architecture**: Implement a scalable and resilient system architecture leveraging cloud infrastructure to ensure high availability, reliability, and performance.

### Open and Closed Questions
- **What remains to be discussed?**
    - Specific requirements for each feature
    - Integration points with existing systems
    - Timeline and milestones for development and deployment
    - Training and support for staff during and after implementation
- **What have we already discussed and decided on?**
    - Choice of starting technologies: React, Supabase, and TailwindCSS
    - High-level features and recommendations for enhancing functionality
    - Goals and metrics for measuring success
    - Importance of scalability and security in the system architecture

---

# Database System Design

## Transactions

### Transactions Table

| Field         | Description                                             |
|---------------|---------------------------------------------------------|
| TransactionID | Unique identifier for each transaction.                |
| CustomerID    | Identifier linking this transaction to a customer.      |
| Notes         | Additional notes about the transaction.                |
| Discount      | Any discount applied to the transaction.               |
| Total         | Total amount of the transaction.                       |
| Status        | Status of the transaction ('Paid' or 'Due').           |

### What to Input:

#### Transaction Information
- Customer: Select or input the customer associated with the transaction.
- Notes: Add any additional notes or comments related to the transaction.

#### Item List
- Each list has:
    - Product Information (From the products): Select or input the product details.
    - Quantity: Enter the quantity of each product included in the transaction.

#### Service List
- Each list has:
    - Service Information (From the services): Select or input the service details.
    - Quantity: Enter the quantity of each service included in the transaction.
    - Total: The total price for each service in this transaction.

#### Custom Product
- Custom Name: Enter the name of the custom product.
- Price: Specify the price of the custom product.
- Quantity: Enter the quantity of the custom product in this transaction.
- Total: The total price for the custom product in this transaction.

#### Payment (For all products that are added in the transaction)
- Discount: Specify any discount applied to the transaction.
- Total: The total amount to be paid for the transaction.
- Status (Paid, Due): Select the status of the transaction, whether it's 'Paid' or 'Due'.

---

## Customers

### Customers Table

| Field         | Description                                             |
|---------------|---------------------------------------------------------|
| CustomerID    | Unique identifier for each customer.                    |
| FirstName     | First name of the customer.                             |
| LastName      | Last name of the customer.                              |
| PhoneNumber   | Phone number of the customer.                           |
| Note          | Additional notes about the customer.                   |
| Location      | Location where the customer is associated.             |

### What to Input:

#### Customer Overview
- First Name: Enter the first name of the customer.
- Last Name: Enter the last name of the customer.
- Phone Number: Enter the phone number of the customer.
- Note (Notes are private and won't be shared with the customer.): Add any relevant notes about the customer.
- Location (What location they are.): Specify the location associated with the customer.

---

## Service

### Services Table

| Field             | Description                                             |
|-------------------|---------------------------------------------------------|
| ServiceID         | Unique identifier for each service.                      |
| Title             | Title of the service.                                    |
| Description       | Description of the service.                              |
| Category          | Category of the service.                                 |
| Type              | Type of the service.                                     |
| Availability      | Availability status of the service.                      |
| Price             | Selling price of the service.                            |
| CostPerService    | Cost incurred for providing the service.                 |
| Profit            | Profit margin for the service.                           |
| Margin            | Profit margin percentage.                                |

### What to Input:

#### Service Information
- Title: Enter the title of the service.
- Description: Provide a brief description of the service.
- Category: Specify the category to which the service belongs.
- Type: Specify the type of the service.
- Availability: Indicate whether the service is available or not.

#### Service Pricing
- Price: Specify the selling price of the service.
- Cost per product: Enter the cost incurred for providing each unit of the service.
- Profit: Specify the profit margin for the service.
- Margin: Enter the profit margin percentage.

---

## Item

### Products Table

| Field             | Description                                             |
|-------------------|---------------------------------------------------------|
| ProductID         | Unique identifier for each product.                      |
| Title             | Title of the product.                                    |
| Description       | Description of the product.                              |
| Availability      | Availability status of the product.                      |
| Price             | Selling price of the product.                            |
| CostPerProduct    | Cost incurred for each unit of the product.              |
| Profit            | Profit margin for the product.                           |
| Margin            | Profit margin percentage.                                |

### What to Input:

#### Item Information
- Title: Enter the title of the product.
- Description: Provide a brief description of the product.
- Availability: Indicate whether the product is available or not.

#### Item Pricing
- Price: Specify the selling price of the product.
- Cost per product: Enter the cost incurred for each unit of the product.
- Profit: Specify the profit margin for the product.
- Margin: Enter the profit margin percentage.

#### Item Inventory
- Add Locations (Configure what locations must be added for stock): Specify the locations where the product is stored.
- Quantity (If multiple locations, each location quantity must be given): Enter the quantity of the product available at each specified location.

---

## Locations

### Locations Table

| Field         | Description                                             |
|---------------|---------------------------------------------------------|
| LocationID    | Unique identifier for each location.                    |
| LocationName  | Name of the location.                                   |

---

## Inventory

| Field        | Description                                             |
|--------------|---------------------------------------------------------|
| InventoryID  | Unique identifier for each inventory entry.             |
| ProductID    | Identifier linking this entry to a product.            |
| LocationID   | Identifier linking this entry to a location.           |
| Quantity     | Quantity of the product available at the specified location. |

### What to Input:

- InventoryID: Automatic unique identifier (if applicable).
- ProductID: Link to the product associated with the inventory entry.
- LocationID: Link to the location where the product is stored.
- Quantity: Enter the quantity of the product available at the specified location.

---

## Staff

### Staff Table

| Field            | Description                                             |
|------------------|---------------------------------------------------------|
| StaffID          | Unique identifier for each staff member.                |
| FirstName        | First name of the staff member.                         |
| LastName         | Last name of the staff member.                          |
| Username         | Username used for login.                                 |
| Email            | Email address of the staff member.                       |
| Phone            | Phone number of the staff member.                       |
| StaffPermissions | Boolean indicating whether the staff has staff-level permissions. |
| AdminPermissions | Boolean indicating whether the staff has admin-level permissions. |

### What to Input:

#### Adding Staff
- Contact Information
    - First Name: Enter the first name of the staff member.
    - Last Name: Enter the last name of the staff member.
    - Username: Enter the username used for login.
    - Email: Enter the email address of the staff member.
    - Phone: Enter the phone number of the staff member.
- System Access
    - Permissions
        - Staff Permissions: Select or specify if the staff member has staff-level permissions.
        - Admin Permissions: Select or specify if the staff member has admin-level permissions.

---

## PostgreSQL Schema

```postgres
-- Table to store information about customers
CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY, -- Unique identifier for each customer
    FirstName VARCHAR(50) NOT NULL, -- First name of the customer
    LastName VARCHAR(50) NOT NULL, -- Last name of the customer
    PhoneNumber VARCHAR(20), -- Phone number of the customer
    Note TEXT, -- Additional notes about the customer
    Location VARCHAR(100) -- Location of the customer
);

-- Table to store information about transactions made by customers
CREATE TABLE Transactions (
    TransactionID SERIAL PRIMARY KEY, -- Unique identifier for each transaction
    CustomerID INT REFERENCES Customers(CustomerID), -- Foreign key referencing the customer associated with this transaction
    Notes TEXT, -- Additional notes about the transaction
    Discount DECIMAL(10, 2), -- Discount applied to the transaction
    Total DECIMAL(10, 2), -- Total amount of the transaction
    Status VARCHAR(10) CHECK (Status IN ('Paid', 'Due')) -- Status of the transaction (Paid or Due)
);

-- Table to store items purchased in each transaction
CREATE TABLE TransactionItems (
    TransactionItemID SERIAL PRIMARY KEY, -- Unique identifier for each transaction item
    TransactionID INT REFERENCES Transactions(TransactionID), -- Foreign key referencing the transaction associated with this item
    ProductID INT REFERENCES Products(ProductID), -- Foreign key referencing the product purchased
    Quantity INT -- Quantity of the product purchased
);

-- Table to store services added to each transaction
CREATE TABLE TransactionServices (
    TransactionServiceID SERIAL PRIMARY KEY, -- Unique identifier for each transaction service
    TransactionID INT REFERENCES Transactions(TransactionID), -- Foreign key referencing the transaction associated with this service
    ServiceID INT REFERENCES Services(ServiceID), -- Foreign key referencing the service added to the transaction
    Quantity INT, -- Quantity of the service added
    Total DECIMAL(10, 2) -- Total amount of the service
);

-- Table to store custom products added to transactions
CREATE TABLE CustomProducts (
    CustomProductID SERIAL PRIMARY KEY, -- Unique identifier for each custom product
    TransactionID INT REFERENCES Transactions(TransactionID), -- Foreign key referencing the transaction associated with this custom product
    CustomName VARCHAR(100), -- Name of the custom product
    Price DECIMAL(10, 2), -- Price of the custom product
    Quantity INT, -- Quantity of the custom product
    Total DECIMAL(10, 2) -- Total amount of the custom product
);

-- Table to store information about services offered
CREATE TABLE Services (
    ServiceID SERIAL PRIMARY KEY, -- Unique identifier for each service
    Title VARCHAR(100), -- Title of the service
    Description TEXT, -- Description of the service
    Category VARCHAR(50), -- Category of the service
    Type VARCHAR(50), -- Type of the service
    Availability BOOLEAN, -- Availability of the service
    Price DECIMAL(10, 2), -- Price of the service
    CostPerService DECIMAL(10, 2), -- Cost per service
    Profit DECIMAL(10, 2), -- Profit from the service
    Margin DECIMAL(5, 2) -- Margin of the service
);

-- Table to store information about products offered
CREATE TABLE Products (
    ProductID SERIAL PRIMARY KEY, -- Unique identifier for each product
    Title VARCHAR(100), -- Title of the product
    Description TEXT, -- Description of the product
    Availability BOOLEAN, -- Availability of the product
    Price DECIMAL(10, 2), -- Price of the product
    CostPerProduct DECIMAL(10, 2), -- Cost per product
    Profit DECIMAL(10, 2), -- Profit from the product
    Margin DECIMAL(5, 2) -- Margin of the product
);

-- Table to store information about different locations
CREATE TABLE Locations (
    LocationID SERIAL PRIMARY KEY, -- Unique identifier for each location
    LocationName VARCHAR(100) -- Name of the location
);

-- Table to store inventory of products at different locations
CREATE TABLE Inventory (
    InventoryID SERIAL PRIMARY KEY, -- Unique identifier for each inventory entry
    ProductID INT REFERENCES Products(ProductID), -- Foreign key referencing the product in inventory
    LocationID INT REFERENCES Locations(LocationID), -- Foreign key referencing the location of the inventory
    Quantity INT, -- Quantity of the product in inventory
    CONSTRAINT unique_product_location UNIQUE (ProductID, LocationID) -- Constraint to ensure uniqueness of product and location combination
);

-- Table to store information about staff members
CREATE TABLE Staff (
    StaffID SERIAL PRIMARY KEY, -- Unique identifier for each staff member
    FirstName VARCHAR(50) NOT NULL, -- First name of the staff member
    LastName VARCHAR(50) NOT NULL, -- Last name of the staff member
    Username VARCHAR(50) UNIQUE, -- Unique username for the staff member
    Email VARCHAR(100) UNIQUE, -- Unique email address of the staff member
    Phone VARCHAR(20), -- Phone number of the staff member
    StaffPermissions BOOLEAN, -- Permissions granted to the staff member
    AdminPermissions BOOLEAN -- Admin permissions granted to the staff member
);
```

---