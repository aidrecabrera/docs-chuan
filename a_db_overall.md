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
-- Table to store information about customers
CREATE TABLE test_environment.Customers (
    CustomerID SERIAL PRIMARY KEY, -- Unique identifier for each customer
    FirstName VARCHAR(50) NOT NULL, -- First name of the customer
    LastName VARCHAR(50) NOT NULL, -- Last name of the customer
    PhoneNumber VARCHAR(20), -- Phone number of the customer
    Note TEXT, -- Additional notes about the customer
    Location VARCHAR(100) -- Location of the customer
);

-- Table to store information about services offered
CREATE TABLE test_environment.Services (
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
CREATE TABLE test_environment.Products (
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
CREATE TABLE test_environment.Locations (
    LocationID SERIAL PRIMARY KEY, -- Unique identifier for each location
    LocationName VARCHAR(100) -- Name of the location
);

-- Table to store inventory of products at different locations
CREATE TABLE test_environment.Inventory (
    InventoryID SERIAL PRIMARY KEY, -- Unique identifier for each inventory entry
    ProductID INT REFERENCES Products(ProductID), -- Foreign key referencing the product in inventory
    LocationID INT REFERENCES Locations(LocationID), -- Foreign key referencing the location of the inventory
    Quantity INT, -- Quantity of the product in inventory
    CONSTRAINT unique_product_location UNIQUE (ProductID, LocationID) -- Constraint to ensure uniqueness of product and location combination
);

-- Table to store information about staff members
CREATE TABLE test_environment.Staff (
    StaffID SERIAL PRIMARY KEY, -- Unique identifier for each staff member
    FirstName VARCHAR(50) NOT NULL, -- First name of the staff member
    LastName VARCHAR(50) NOT NULL, -- Last name of the staff member
    Username VARCHAR(50) UNIQUE, -- Unique username for the staff member
    Email VARCHAR(100) UNIQUE, -- Unique email address of the staff member
    Phone VARCHAR(20), -- Phone number of the staff member
    StaffPermissions BOOLEAN, -- Permissions granted to the staff member
    AdminPermissions BOOLEAN -- Admin permissions granted to the staff member
);

-- Table to store information about transactions made by customers
CREATE TABLE test_environment.Transactions (
    TransactionID SERIAL PRIMARY KEY, -- Unique identifier for each transaction
    CustomerID INT REFERENCES Customers(CustomerID), -- Foreign key referencing the customer associated with this transaction
    Notes TEXT, -- Additional notes about the transaction
    Discount DECIMAL(10, 2), -- Discount applied to the transaction
    Total DECIMAL(10, 2), -- Total amount of the transaction
    Status VARCHAR(10) CHECK (Status IN ('Paid', 'Due')) -- Status of the transaction (Paid or Due)
);

-- Table to store items purchased in each transaction
CREATE TABLE test_environment.TransactionItems (
    TransactionItemID SERIAL PRIMARY KEY, -- Unique identifier for each transaction item
    TransactionID INT REFERENCES Transactions(TransactionID), -- Foreign key referencing the transaction associated with this item
    ProductID INT REFERENCES Products(ProductID), -- Foreign key referencing the product purchased
    Quantity INT -- Quantity of the product purchased
);

-- Table to store services added to each transaction
CREATE TABLE test_environment.TransactionServices (
    TransactionServiceID SERIAL PRIMARY KEY, -- Unique identifier for each transaction service
    TransactionID INT REFERENCES Transactions(TransactionID), -- Foreign key referencing the transaction associated with this service
    ServiceID INT REFERENCES Services(ServiceID), -- Foreign key referencing the service added to the transaction
    Quantity INT, -- Quantity of the service added
    Total DECIMAL(10, 2) -- Total amount of the service
);

-- Table to store custom products added to transactions
CREATE TABLE test_environment.CustomProducts (
    CustomProductID SERIAL PRIMARY KEY, -- Unique identifier for each custom product
    TransactionID INT REFERENCES Transactions(TransactionID), -- Foreign key referencing the transaction associated with this custom product
    CustomName VARCHAR(100), -- Name of the custom product
    Price DECIMAL(10, 2), -- Price of the custom product
    Quantity INT, -- Quantity of the custom product
    Total DECIMAL(10, 2) -- Total amount of the custom product
);
```