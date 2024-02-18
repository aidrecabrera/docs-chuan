CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20),
    note TEXT,
    location VARCHAR(100)
);

CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    notes TEXT,
    discount DECIMAL(10, 2),
    total DECIMAL(10, 2),
    status VARCHAR(10) CHECK (status IN ('Paid', 'Due'))
);

CREATE TABLE transaction_items (
    transaction_item_id SERIAL PRIMARY KEY,
    transaction_id INT REFERENCES transactions(transaction_id),
    product_id INT REFERENCES products(product_id),
    quantity INT
);

CREATE TABLE transaction_services (
    transaction_service_id SERIAL PRIMARY KEY,
    transaction_id INT REFERENCES transactions(transaction_id),
    service_id INT REFERENCES services(service_id),
    quantity INT,
    total DECIMAL(10, 2)
);

CREATE TABLE custom_products (
    custom_product_id SERIAL PRIMARY KEY,
    transaction_id INT REFERENCES transactions(transaction_id),
    custom_name VARCHAR(100),
    price DECIMAL(10, 2),
    quantity INT,
    total DECIMAL(10, 2)
);

CREATE TABLE services (
    service_id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    description TEXT,
    category VARCHAR(50),
    type VARCHAR(50),
    availability BOOLEAN,
    price DECIMAL(10, 2),
    cost_per_service DECIMAL(10, 2),
    profit DECIMAL(10, 2),
    margin DECIMAL(5, 2)
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    description TEXT,
    availability BOOLEAN,
    price DECIMAL(10, 2),
    cost_per_product DECIMAL(10, 2),
    profit DECIMAL(10, 2),
    margin DECIMAL(5, 2)
);

CREATE TABLE locations (
    location_id SERIAL PRIMARY KEY,
    location_name VARCHAR(100)
);

CREATE TABLE inventory (
    inventory_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    location_id INT REFERENCES locations(location_id),
    quantity INT,
    CONSTRAINT unique_product_location UNIQUE (product_id, location_id)
);

CREATE TABLE staff (
    staff_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    username VARCHAR(50) UNIQUE,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    staff_permissions BOOLEAN,
    admin_permissions BOOLEAN
);