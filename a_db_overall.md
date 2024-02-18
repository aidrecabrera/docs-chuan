# Transactions

- Transactions Table: This table stores information about each transaction.
    - TransactionID: A unique identifier for each transaction.
    - CustomerID: The identifier linking this transaction to a customer in the Customers table.
    - Notes: Additional notes about the transaction.
    - Discount: Any discount applied to the transaction.
    - Total: The total amount of the transaction.
    - Status: The status of the transaction, whether it's 'Paid' or 'Due'.

- TransactionItemsTable: This table stores information about products included in each transaction.
    - TransactionItemID: A unique identifier for each transaction item.
    - TransactionID: The identifier linking this transaction item to a transaction in the Transactions table.
    - ProductID: The identifier linking this transaction item to a product in the Products table.
    - Quantity: The quantity of the product in this transaction.

- TransactionServicesTable: This table stores information about services included in each transaction.
    - TransactionServiceID: A unique identifier for each transaction service.
    - TransactionID: The identifier linking this transaction service to a transaction in the Transactions table.
    - ServiceID: The identifier linking this transaction service to a service in the Services table.
    - Quantity: The quantity of the service in this transaction.
    - Total: The total price for the service in this transaction.

- CustomProductsTable: This table stores information about custom products included in each transaction.
    - CustomProductID: A unique identifier for each custom product.
    - TransactionID: The identifier linking this custom product to a transaction in the Transactions table.
    - CustomName: The name of the custom product.
    - Price: The price of the custom product.
    - Quantity: The quantity of the custom product in this transaction.
    - Total: The total price for the custom product in this transaction.

This allows the staff or admin to create transaction and invoices. These are the information that will be inputted in the creating transation process:

# New Transaction

### Transaction Information
- Customer
- Notes

### Item List
- Each list have:
    - Product Information (From the products)
    - Quantity


### Service List
- Each list have:
    - Service Information (From the products)
    - Quantity
    - Total

### Custom Product
- Custom Name
- Price
- Quantity
- Total

### Payment (For all products that are added in the transaction)
- Discount
- Total
- Status (Paid, Due)


# Customers

To store information about customers, we can create a Customers table with fields for the specified information.

- Customers Table: This table stores information about each customer.
    - CustomerID: A unique identifier for each customer.
    - FirstName: The first name of the customer.
    - LastName: The last name of the customer.
    - PhoneNumber: The phone number of the customer.
    - Note: Additional notes about the customer (private and internal).
    - Location: The location where the customer is associated. This field is assumed to be a string for simplicity.

The admin and staff will be able to import, save, and view customers. These are the information when they add a new customer:

## Customer Overview
- First Name
- Last Name
- Phone Number
- Note (Notes are private and won't be shared with the customer.)
- Location (What location they are.)

## Service

To accommodate the information for services and their pricing, we can create a separate table for services and adjust the pricing schema accordingly.

- Services Table: This table stores information about each service.
- ServiceID: A unique identifier for each service.
- Title: The title of the service.
- Description: A description of the service.
- Category: The category of the service.
- Type: The type of the service.
- Availability: A boolean value indicating whether the service is available or not.
- Price: The selling price of the service.
- CostPerService: The cost incurred for providing the service.
- Profit: The profit margin for the service.
- Margin: The profit margin percentage.

When adding a service, the staff must put the following information:

### Service Information
- Title 
- Description
- Category
- Type
- Availability

### Service Pricing
- Price
- Cost per product
- Profit
- Margin

## Item

This table stores information about each product along with pricing and inventory details.

- ProductID: A unique identifier for each product.
- Title: The title of the product.
- Description: A description of the product.
- Availability: A boolean value indicating whether the product is available or not.
- Price: The selling price of the product.
- CostPerProduct: The cost incurred for each unit of the product.
- Profit: The profit margin for the product.
- Margin: The profit margin percentage.
- LocationID: A foreign key referencing the location where the product is stored.
- Quantity: The quantity of the product available at the specified location.

When adding an item, the staff must put the following information:

### Item Information
- Title 
- Description
- Availability

### Item Pricing
- Price
- Cost per product
- Profit
- Margin

### Item Inventory
- Add Locations (Configure what locations must be added ofr stock)
- Quantity (If multiple location, each location quantity must be given)

---

# Locations
This table stores information about different inventory locations where products are stored.

- LocationID: A unique identifier for each location.
- LocationName: The name of the location.

# Inventory

- InventoryID: A unique identifier for each inventory entry (optional if each product has a single entry).
- ProductID: The identifier linking this inventory entry to a product in the Products table.
- LocationID: The identifier linking this inventory entry to a location in the Locations table.
- Quantity: The quantity of the product available in the inventory at the specified location.

This will refer from the product's information. The following information that are needed:

- InventoryID
- ProductID
- LocationID
- Quantity

# Staff

- Staff Table: This table stores information about staff members.
 - StaffID: A unique identifier for each staff member.
 - FirstName: The first name of the staff member.
 - LastName: The last name of the staff member.
 - Username: The username used for login.
 - Email: The email address of the staff member.
 - Phone: The phone number of the staff member (optional).
 - StaffPermissions: A boolean indicating whether the staff member has staff-level permissions.
 - AdminPermissions: A boolean indicating whether the staff member has admin-level permissions.

The admin can only see this. Once they navigate through the staff section, they can do the  - following:

### Actions
- Add Staff

#### Adding Staff
- Contact Information
    - First Name
    - Last Name
    - Username
    - Email
    - Phone
- System Access
    - Permissions
        - Staff Permissions
        - Admin Permissions


# PostgreSQL Schema

```postgres
CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(20),
    Note TEXT,
    Location VARCHAR(100)
);

CREATE TABLE Transactions (
    TransactionID SERIAL PRIMARY KEY,
    CustomerID INT REFERENCES Customers(CustomerID),
    Notes TEXT,
    Discount DECIMAL(10, 2),
    Total DECIMAL(10, 2),
    Status VARCHAR(10) CHECK (Status IN ('Paid', 'Due'))
);

CREATE TABLE TransactionItems (
    TransactionItemID SERIAL PRIMARY KEY,
    TransactionID INT REFERENCES Transactions(TransactionID),
    ProductID INT REFERENCES Products(ProductID),
    Quantity INT
);

CREATE TABLE TransactionServices (
    TransactionServiceID SERIAL PRIMARY KEY,
    TransactionID INT REFERENCES Transactions(TransactionID),
    ServiceID INT REFERENCES Services(ServiceID),
    Quantity INT,
    Total DECIMAL(10, 2)
);

CREATE TABLE CustomProducts (
    CustomProductID SERIAL PRIMARY KEY,
    TransactionID INT REFERENCES Transactions(TransactionID),
    CustomName VARCHAR(100),
    Price DECIMAL(10, 2),
    Quantity INT,
    Total DECIMAL(10, 2)
);

CREATE TABLE Services (
    ServiceID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Description TEXT,
    Category VARCHAR(50),
    Type VARCHAR(50),
    Availability BOOLEAN,
    Price DECIMAL(10, 2),
    CostPerService DECIMAL(10, 2),
    Profit DECIMAL(10, 2),
    Margin DECIMAL(5, 2)
);

CREATE TABLE Products (
    ProductID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Description TEXT,
    Availability BOOLEAN,
    Price DECIMAL(10, 2),
    CostPerProduct DECIMAL(10, 2),
    Profit DECIMAL(10, 2),
    Margin DECIMAL(5, 2)
);

CREATE TABLE Locations (
    LocationID SERIAL PRIMARY KEY,
    LocationName VARCHAR(100)
);

CREATE TABLE Inventory (
    InventoryID SERIAL PRIMARY KEY,
    ProductID INT REFERENCES Products(ProductID),
    LocationID INT REFERENCES Locations(LocationID),
    Quantity INT,
    CONSTRAINT unique_product_location UNIQUE (ProductID, LocationID)
);

CREATE TABLE Staff (
    StaffID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Username VARCHAR(50) UNIQUE,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20),
    StaffPermissions BOOLEAN,
    AdminPermissions BOOLEAN
);
```