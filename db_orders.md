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
