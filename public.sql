-- Supabase AI is experimental and may produce incorrect answers
-- Always verify the output before executing

create table
  location (
    location_id bigint primary key generated always as identity,
    location_name text
  );

create table
  product (
    product_id bigint primary key generated always as identity,
    title text,
    description text,
    availability boolean,
    price numeric not null,
    cost_per_product numeric not null,
    profit numeric not null,
    margin numeric not null
  );

create table
  inventory (
    inventory_id bigint primary key generated always as identity,
    product_id bigint,
    location_id bigint,
    quantity int,
    constraint unique_product_location unique (product_id, location_id),
    foreign key (product_id) references product (product_id),
    foreign key (location_id) references location (location_id)
  );

create table
  service (
    service_id bigint primary key generated always as identity,
    title text,
    description text,
    category text,
    type text,
    availability boolean,
    price numeric not null,
    cost_per_service numeric not null,
    profit numeric not null,
    margin numeric not null
  );

create table
  customer (
    customer_id bigint primary key generated always as identity,
    first_name text not null,
    last_name text not null,
    phone_number text,
    note text,
    location text
  );

create table
  staff (
    staff_id bigint primary key generated always as identity,
    first_name text not null,
    last_name text not null,
    username text unique,
    email text unique,
    phone text,
    staff_permissions boolean,
    admin_permissions boolean
  );

create table
  transaction (
    transaction_id bigint primary key generated always as identity,
    customer_id bigint,
    notes text,
    discount numeric not null,
    total numeric not null,
    status text check (status in ('Paid', 'Due')),
    foreign key (customer_id) references customer (customer_id)
  );

create table
  transaction_item (
    transaction_item_id bigint primary key generated always as identity,
    transaction_id bigint,
    product_id bigint,
    quantity int,
    foreign key (transaction_id) references transaction (transaction_id),
    foreign key (product_id) references product (product_id)
  );

create table
  transaction_service (
    transaction_service_id bigint primary key generated always as identity,
    transaction_id bigint,
    service_id bigint,
    quantity int,
    total numeric not null,
    foreign key (transaction_id) references transaction (transaction_id),
    foreign key (service_id) references service (service_id)
  );

create table
  custom_product (
    custom_product_id bigint primary key generated always as identity,
    transaction_id bigint,
    custom_name text,
    price numeric not null,
    quantity int,
    total numeric not null,
    foreign key (transaction_id) references transaction (transaction_id)
  );