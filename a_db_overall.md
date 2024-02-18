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
CREATE TABLE test_environment.customer (
    customer_id SERIAL PRIMARY KEY, -- Unique identifier for each customer
    first_name VARCHAR(50) NOT NULL, -- First name of the customer
    last_name VARCHAR(50) NOT NULL, -- Last name of the customer
    phone_number VARCHAR(20), -- Phone number of the customer
    note TEXT, -- Additional notes about the customer
    location VARCHAR(100) -- Location of the customer
);

-- Table to store information about services offered
CREATE TABLE test_environment.service (
    service_id SERIAL PRIMARY KEY, -- Unique identifier for each service
    title VARCHAR(100), -- Title of the service
    description TEXT, -- Description of the service
    category VARCHAR(50), -- Category of the service
    type VARCHAR(50), -- Type of the service
    availability BOOLEAN, -- Availability of the service
    price DECIMAL(10, 2), -- Price of the service
    cost_per_service DECIMAL(10, 2), -- Cost per service
    profit DECIMAL(10, 2), -- Profit from the service
    margin DECIMAL(5, 2) -- Margin of the service
);

-- Table to store information about products offered
CREATE TABLE test_environment.product (
    product_id SERIAL PRIMARY KEY, -- Unique identifier for each product
    title VARCHAR(100), -- Title of the product
    description TEXT, -- Description of the product
    availability BOOLEAN, -- Availability of the product
    price DECIMAL(10, 2), -- Price of the product
    cost_per_product DECIMAL(10, 2), -- Cost per product
    profit DECIMAL(10, 2), -- Profit from the product
    margin DECIMAL(5, 2) -- Margin of the product
);

-- Table to store information about different locations
CREATE TABLE test_environment.location (
    location_id SERIAL PRIMARY KEY, -- Unique identifier for each location
    location_name VARCHAR(100) -- Name of the location
);

-- Table to store inventory of products at different locations
CREATE TABLE test_environment.inventory (
    inventory_id SERIAL PRIMARY KEY, -- Unique identifier for each inventory entry
    product_id INT REFERENCES product(product_id), -- Foreign key referencing the product in inventory
    location_id INT REFERENCES location(location_id), -- Foreign key referencing the location of the inventory
    quantity INT, -- Quantity of the product in inventory
    CONSTRAINT unique_product_location UNIQUE (product_id, location_id) -- Constraint to ensure uniqueness of product and location combination
);

-- Table to store information about staff members
CREATE TABLE test_environment.staff (
    staff_id SERIAL PRIMARY KEY, -- Unique identifier for each staff member
    first_name VARCHAR(50) NOT NULL, -- First name of the staff member
    last_name VARCHAR(50) NOT NULL, -- Last name of the staff member
    username VARCHAR(50) UNIQUE, -- Unique username for the staff member
    email VARCHAR(100) UNIQUE, -- Unique email address of the staff member
    phone VARCHAR(20), -- Phone number of the staff member
    staff_permissions BOOLEAN, -- Permissions granted to the staff member
    admin_permissions BOOLEAN -- Admin permissions granted to the staff member
);

-- Table to store information about transactions made by customers
CREATE TABLE test_environment.transaction (
    transaction_id SERIAL PRIMARY KEY, -- Unique identifier for each transaction
    customer_id INT REFERENCES customer(customer_id), -- Foreign key referencing the customer associated with this transaction
    notes TEXT, -- Additional notes about the transaction
    discount DECIMAL(10, 2), -- Discount applied to the transaction
    total DECIMAL(10, 2), -- Total amount of the transaction
    status VARCHAR(10) CHECK (status IN ('Paid', 'Due')) -- Status of the transaction (Paid or Due)
);

-- Table to store items purchased in each transaction
CREATE TABLE test_environment.transaction_item (
    transaction_item_id SERIAL PRIMARY KEY, -- Unique identifier for each transaction item
    transaction_id INT REFERENCES transaction(transaction_id), -- Foreign key referencing the transaction associated with this item
    product_id INT REFERENCES product(product_id), -- Foreign key referencing the product purchased
    quantity INT -- Quantity of the product purchased
);

-- Table to store services added to each transaction
CREATE TABLE test_environment.transaction_service (
    transaction_service_id SERIAL PRIMARY KEY, -- Unique identifier for each transaction service
    transaction_id INT REFERENCES transaction(transaction_id), -- Foreign key referencing the transaction associated with this service
    service_id INT REFERENCES service(service_id), -- Foreign key referencing the service added to the transaction
    quantity INT, -- Quantity of the service added
    total DECIMAL(10, 2) -- Total amount of the service
);

-- Table to store custom products added to transactions
CREATE TABLE test_environment.custom_product (
    custom_product_id SERIAL PRIMARY KEY, -- Unique identifier for each custom product
    transaction_id INT REFERENCES transaction(transaction_id), -- Foreign key referencing the transaction associated with this custom product
    custom_name VARCHAR(100), -- Name of the custom product
    price DECIMAL(10, 2), -- Price of the custom product
    quantity INT, -- Quantity of the custom product
    total DECIMAL(10, 2) -- Total amount of the custom product
);
```