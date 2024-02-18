| dbms       | table_catalog | table_schema     | table_name          | column_name                 | ordinal_position | data_type                   | character_maximum_length | constraint_type |
| ---------- | ------------- | ---------------- | ------------------- | --------------------------- | ---------------- | --------------------------- | ------------------------ | --------------- |
| postgresql | postgres      | auth             | users               | id                          | 2                | uuid                        |                          | PRIMARY KEY     |
| postgresql | postgres      | auth             | refresh_tokens      | id                          | 2                | bigint                      |                          | PRIMARY KEY     |
| postgresql | postgres      | auth             | instances           | id                          | 1                | uuid                        |                          | PRIMARY KEY     |
| postgresql | postgres      | auth             | audit_log_entries   | id                          | 2                | uuid                        |                          | PRIMARY KEY     |
| postgresql | postgres      | auth             | schema_migrations   | version                     | 1                | character varying           | 255                      | PRIMARY KEY     |
| postgresql | postgres      | storage          | buckets             | id                          | 1                | text                        |                          | PRIMARY KEY     |
| postgresql | postgres      | auth             | users               | id                          | 18               | uuid                        |                          | FOREIGN KEY     |
| postgresql | postgres      | storage          | objects             | id                          | 1                | uuid                        |                          | PRIMARY KEY     |
| postgresql | postgres      | storage          | buckets             | id                          | 2                | text                        |                          | FOREIGN KEY     |
| postgresql | postgres      | storage          | migrations          | id                          | 1                | integer                     |                          | PRIMARY KEY     |
| postgresql | postgres      | storage          | migrations          | name                        | 2                | character varying           | 100                      | UNIQUE          |
| postgresql | postgres      | pgsodium         | key                 | id                          | 1                | uuid                        |                          | PRIMARY KEY     |
| postgresql | postgres      | pgsodium         | key                 | id                          | 12               | uuid                        |                          | FOREIGN KEY     |
| postgresql | postgres      | pgsodium         | key                 | name                        | 8                | text                        |                          | UNIQUE          |
| postgresql | postgres      | vault            | secrets             | id                          | 1                | uuid                        |                          | PRIMARY KEY     |
| postgresql | postgres      | pgsodium         | key                 | id                          | 5                | uuid                        |                          | FOREIGN KEY     |
| postgresql | postgres      | auth             | users               | id                          | 1                | uuid                        |                          | FOREIGN KEY     |
| postgresql | postgres      | test_environment | customers           | customerid                  | 1                | integer                     |                          | PRIMARY KEY     |
| postgresql | postgres      | test_environment | services            | serviceid                   | 1                | integer                     |                          | PRIMARY KEY     |
| postgresql | postgres      | test_environment | products            | productid                   | 1                | integer                     |                          | PRIMARY KEY     |
| postgresql | postgres      | test_environment | transactions        | transactionid               | 1                | integer                     |                          | PRIMARY KEY     |
| postgresql | postgres      | test_environment | customers           | customerid                  | 2                | integer                     |                          | FOREIGN KEY     |
| postgresql | postgres      | test_environment | transactionitems    | transactionitemid           | 1                | integer                     |                          | PRIMARY KEY     |
| postgresql | postgres      | test_environment | transactions        | transactionid               | 2                | integer                     |                          | FOREIGN KEY     |
| postgresql | postgres      | test_environment | products            | productid                   | 3                | integer                     |                          | FOREIGN KEY     |
| postgresql | postgres      | test_environment | transactionservices | transactionserviceid        | 1                | integer                     |                          | PRIMARY KEY     |
| postgresql | postgres      | test_environment | transactions        | transactionid               | 2                | integer                     |                          | FOREIGN KEY     |
| postgresql | postgres      | test_environment | services            | serviceid                   | 3                | integer                     |                          | FOREIGN KEY     |
| postgresql | postgres      | test_environment | customproducts      | customproductid             | 1                | integer                     |                          | PRIMARY KEY     |
| postgresql | postgres      | test_environment | transactions        | transactionid               | 2                | integer                     |                          | FOREIGN KEY     |
| postgresql | postgres      | test_environment | locations           | locationid                  | 1                | integer                     |                          | PRIMARY KEY     |
| postgresql | postgres      | test_environment | inventory           | inventoryid                 | 1                | integer                     |                          | PRIMARY KEY     |
| postgresql | postgres      | test_environment | inventory           | productid                   | 2                | integer                     |                          | UNIQUE          |
| postgresql | postgres      | test_environment | inventory           | locationid                  | 3                | integer                     |                          | UNIQUE          |
| postgresql | postgres      | test_environment | products            | productid                   | 2                | integer                     |                          | FOREIGN KEY     |
| postgresql | postgres      | test_environment | locations           | locationid                  | 3                | integer                     |                          | FOREIGN KEY     |
| postgresql | postgres      | test_environment | staff               | staffid                     | 1                | integer                     |                          | PRIMARY KEY     |
| postgresql | postgres      | test_environment | staff               | username                    | 4                | character varying           | 50                       | UNIQUE          |
| postgresql | postgres      | test_environment | staff               | email                       | 5                | character varying           | 100                      | UNIQUE          |
| postgresql | postgres      | test_environment | products            | productid                   | 3                | integer                     |                          | FOREIGN KEY     |
| postgresql | postgres      | test_environment | services            | serviceid                   | 3                | integer                     |                          | FOREIGN KEY     |
| postgresql | postgres      | test_environment | transactions        | transactionid               | 2                | integer                     |                          | FOREIGN KEY     |
| postgresql | postgres      | test_environment | customers           | customerid                  | 2                | integer                     |                          | FOREIGN KEY     |
| postgresql | postgres      | test_environment | products            | productid                   | 2                | integer                     |                          | FOREIGN KEY     |
| postgresql | postgres      | test_environment | locations           | locationid                  | 3                | integer                     |                          | FOREIGN KEY     |
| postgresql | postgres      | public           | chuan_employees     | id                          | 18               | uuid                        |                          | PRIMARY KEY     |
| postgresql | postgres      | public           | chuan_employees     | email                       | 4                | character varying           |                          | UNIQUE          |
| postgresql | postgres      | auth             | users               | id                          | 2                | uuid                        |                          | FOREIGN KEY     |
| postgresql | postgres      | auth             | refresh_tokens      | token                       | 3                | character varying           | 255                      | UNIQUE          |
| postgresql | postgres      | auth             | sessions            | id                          | 1                | uuid                        |                          | PRIMARY KEY     |
| postgresql | postgres      | auth             | users               | id                          | 2                | uuid                        |                          | FOREIGN KEY     |
| postgresql | postgres      | auth             | sessions            | id                          | 9                | uuid                        |                          | FOREIGN KEY     |
| postgresql | postgres      | auth             | mfa_factors         | id                          | 1                | uuid                        |                          | PRIMARY KEY     |
| postgresql | postgres      | auth             | users               | id                          | 2                | uuid                        |                          | FOREIGN KEY     |
| postgresql | postgres      | auth             | mfa_challenges      | id                          | 1                | uuid                        |                          | PRIMARY KEY     |
| postgresql | postgres      | auth             | mfa_factors         | id                          | 2                | uuid                        |                          | FOREIGN KEY     |
| postgresql | postgres      | auth             | mfa_amr_claims      | session_id                  | 1                | uuid                        |                          | UNIQUE          |
| postgresql | postgres      | auth             | mfa_amr_claims      | authentication_method       | 4                | text                        |                          | UNIQUE          |
| postgresql | postgres      | auth             | sessions            | id                          | 1                | uuid                        |                          | FOREIGN KEY     |
| postgresql | postgres      | auth             | mfa_amr_claims      | id                          | 5                | uuid                        |                          | PRIMARY KEY     |
| postgresql | postgres      | auth             | sso_providers       | id                          | 1                | uuid                        |                          | PRIMARY KEY     |
| postgresql | postgres      | auth             | sso_domains         | id                          | 1                | uuid                        |                          | PRIMARY KEY     |
| postgresql | postgres      | auth             | sso_providers       | id                          | 2                | uuid                        |                          | FOREIGN KEY     |
| postgresql | postgres      | auth             | saml_providers      | id                          | 1                | uuid                        |                          | PRIMARY KEY     |
| postgresql | postgres      | auth             | saml_providers      | entity_id                   | 3                | text                        |                          | UNIQUE          |
| postgresql | postgres      | auth             | sso_providers       | id                          | 2                | uuid                        |                          | FOREIGN KEY     |
| postgresql | postgres      | auth             | saml_relay_states   | id                          | 1                | uuid                        |                          | PRIMARY KEY     |
| postgresql | postgres      | auth             | sso_providers       | id                          | 2                | uuid                        |                          | FOREIGN KEY     |
| postgresql | postgres      | auth             | users               | phone                       | 22               | text                        |                          | UNIQUE          |
| postgresql | postgres      | auth             | flow_state          | id                          | 1                | uuid                        |                          | PRIMARY KEY     |
| postgresql | postgres      | auth             | flow_state          | id                          | 9                | uuid                        |                          | FOREIGN KEY     |
| postgresql | postgres      | auth             | identities          | id                          | 9                | uuid                        |                          | PRIMARY KEY     |
| postgresql | postgres      | auth             | identities          | provider_id                 | 1                | text                        |                          | UNIQUE          |
| postgresql | postgres      | auth             | identities          | provider                    | 4                | text                        |                          | UNIQUE          |
| postgresql | postgres      | public           | chuan_products      | product_id                  | 1                | bigint                      |                          | PRIMARY KEY     |
| postgresql | postgres      | public           | chuan_users         | id                          | 1                | uuid                        |                          | PRIMARY KEY     |
| postgresql | postgres      | public           | chuan_employees     | employee_first_name         | 6                | text                        |                          |                 |
| postgresql | postgres      | auth             | audit_log_entries   | created_at                  | 4                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | auth             | saml_relay_states   | created_at                  | 7                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | auth             | flow_state          | created_at                  | 9                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | test_environment | products            | profit                      | 7                | numeric                     |                          |                 |
| postgresql | postgres      | test_environment | customers           | lastname                    | 3                | character varying           | 50                       |                 |
| postgresql | postgres      | auth             | mfa_factors         | factor_type                 | 4                | USER-DEFINED                |                          |                 |
| postgresql | postgres      | test_environment | customproducts      | quantity                    | 5                | integer                     |                          |                 |
| postgresql | postgres      | public           | chuan_employees     | employee_hire_date          | 13               | date                        |                          |                 |
| postgresql | postgres      | test_environment | products            | availability                | 4                | boolean                     |                          |                 |
| postgresql | postgres      | vault            | secrets             | name                        | 2                | text                        |                          |                 |
| postgresql | postgres      | test_environment | customproducts      | customname                  | 3                | character varying           | 100                      |                 |
| postgresql | postgres      | auth             | users               | recovery_token              | 11               | character varying           | 255                      |                 |
| postgresql | postgres      | auth             | flow_state          | auth_code                   | 3                | text                        |                          |                 |
| postgresql | postgres      | test_environment | services            | title                       | 2                | character varying           | 100                      |                 |
| postgresql | postgres      | auth             | sso_providers       | updated_at                  | 4                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | storage          | objects             | version                     | 10               | text                        |                          |                 |
| postgresql | postgres      | test_environment | services            | profit                      | 9                | numeric                     |                          |                 |
| postgresql | postgres      | auth             | users               | email_confirmed_at          | 7                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | auth             | sessions            | aal                         | 6                | USER-DEFINED                |                          |                 |
| postgresql | postgres      | public           | chuan_employees     | employee_role               | 9                | USER-DEFINED                |                          |                 |
| postgresql | postgres      | test_environment | products            | costperproduct              | 6                | numeric                     |                          |                 |
| postgresql | postgres      | test_environment | services            | availability                | 6                | boolean                     |                          |                 |
| postgresql | postgres      | auth             | sso_providers       | resource_id                 | 2                | text                        |                          |                 |
| postgresql | postgres      | public           | chuan_users         | is_admin                    | 3                | boolean                     |                          |                 |
| postgresql | postgres      | auth             | instances           | updated_at                  | 5                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | test_environment | products            | title                       | 2                | character varying           | 100                      |                 |
| postgresql | postgres      | storage          | migrations          | hash                        | 3                | character varying           | 40                       |                 |
| postgresql | postgres      | auth             | users               | deleted_at                  | 34               | timestamp with time zone    |                          |                 |
| postgresql | postgres      | auth             | users               | raw_app_meta_data           | 17               | jsonb                       |                          |                 |
| postgresql | postgres      | auth             | sessions            | ip                          | 10               | inet                        |                          |                 |
| postgresql | postgres      | storage          | objects             | path_tokens                 | 9                | ARRAY                       |                          |                 |
| postgresql | postgres      | auth             | users               | phone_confirmed_at          | 23               | timestamp with time zone    |                          |                 |
| postgresql | postgres      | auth             | instances           | uuid                        | 2                | uuid                        |                          |                 |
| postgresql | postgres      | auth             | sessions            | refreshed_at                | 8                | timestamp without time zone |                          |                 |
| postgresql | postgres      | test_environment | transactionservices | total                       | 5                | numeric                     |                          |                 |
| postgresql | postgres      | auth             | users               | phone_change_token          | 25               | character varying           | 255                      |                 |
| postgresql | postgres      | auth             | flow_state          | provider_access_token       | 7                | text                        |                          |                 |
| postgresql | postgres      | auth             | mfa_challenges      | ip_address                  | 5                | inet                        |                          |                 |
| postgresql | postgres      | storage          | buckets             | owner                       | 3                | uuid                        |                          |                 |
| postgresql | postgres      | auth             | sso_domains         | created_at                  | 4                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | auth             | sso_domains         | domain                      | 3                | text                        |                          |                 |
| postgresql | postgres      | auth             | refresh_tokens      | updated_at                  | 7                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | auth             | saml_providers      | created_at                  | 7                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | storage          | objects             | created_at                  | 5                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | auth             | users               | email                       | 5                | character varying           | 255                      |                 |
| postgresql | postgres      | auth             | refresh_tokens      | instance_id                 | 1                | uuid                        |                          |                 |
| postgresql | postgres      | public           | chuan_employees     | created_at                  | 2                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | pgsodium         | key                 | status                      | 2                | USER-DEFINED                |                          |                 |
| postgresql | postgres      | auth             | users               | email_change                | 14               | character varying           | 255                      |                 |
| postgresql | postgres      | test_environment | transactions        | discount                    | 4                | numeric                     |                          |                 |
| postgresql | postgres      | storage          | buckets             | name                        | 2                | text                        |                          |                 |
| postgresql | postgres      | public           | chuan_products      | product_category            | 4                | USER-DEFINED                |                          |                 |
| postgresql | postgres      | vault            | secrets             | description                 | 3                | text                        |                          |                 |
| postgresql | postgres      | auth             | audit_log_entries   | instance_id                 | 1                | uuid                        |                          |                 |
| postgresql | postgres      | pgsodium         | key                 | raw_key                     | 10               | bytea                       |                          |                 |
| postgresql | postgres      | test_environment | customers           | note                        | 5                | text                        |                          |                 |
| postgresql | postgres      | pgsodium         | key                 | user_data                   | 14               | text                        |                          |                 |
| postgresql | postgres      | auth             | saml_relay_states   | updated_at                  | 8                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | public           | chuan_users         | created_at                  | 2                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | auth             | flow_state          | updated_at                  | 10               | timestamp with time zone    |                          |                 |
| postgresql | postgres      | auth             | users               | email_change_token_new      | 13               | character varying           | 255                      |                 |
| postgresql | postgres      | auth             | mfa_factors         | secret                      | 8                | text                        |                          |                 |
| postgresql | postgres      | auth             | instances           | created_at                  | 4                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | auth             | instances           | raw_base_config             | 3                | text                        |                          |                 |
| postgresql | postgres      | auth             | flow_state          | provider_refresh_token      | 8                | text                        |                          |                 |
| postgresql | postgres      | public           | chuan_employees     | employee_last_name          | 8                | text                        |                          |                 |
| postgresql | postgres      | test_environment | customproducts      | price                       | 4                | numeric                     |                          |                 |
| postgresql | postgres      | auth             | users               | email_change_confirm_status | 29               | smallint                    |                          |                 |
| postgresql | postgres      | auth             | users               | raw_user_meta_data          | 18               | jsonb                       |                          |                 |
| postgresql | postgres      | test_environment | transactions        | notes                       | 3                | text                        |                          |                 |
| postgresql | postgres      | auth             | sso_providers       | created_at                  | 3                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | public           | chuan_employees     | employee_bday               | 10               | date                        |                          |                 |
| postgresql | postgres      | auth             | identities          | email                       | 8                | text                        |                          |                 |
| postgresql | postgres      | auth             | sessions            | user_agent                  | 9                | text                        |                          |                 |
| postgresql | postgres      | pgsodium         | key                 | raw_key_nonce               | 11               | bytea                       |                          |                 |
| postgresql | postgres      | test_environment | transactionitems    | quantity                    | 4                | integer                     |                          |                 |
| postgresql | postgres      | storage          | buckets             | owner_id                    | 10               | text                        |                          |                 |
| postgresql | postgres      | pgsodium         | key                 | key_context                 | 7                | bytea                       |                          |                 |
| postgresql | postgres      | auth             | users               | is_sso_user                 | 33               | boolean                     |                          |                 |
| postgresql | postgres      | auth             | users               | confirmed_at                | 27               | timestamp with time zone    |                          |                 |
| postgresql | postgres      | auth             | users               | confirmation_sent_at        | 10               | timestamp with time zone    |                          |                 |
| postgresql | postgres      | pgsodium         | key                 | comment                     | 13               | text                        |                          |                 |
| postgresql | postgres      | pgsodium         | key                 | key_id                      | 6                | bigint                      |                          |                 |
| postgresql | postgres      | auth             | saml_providers      | attribute_mapping           | 6                | jsonb                       |                          |                 |
| postgresql | postgres      | public           | chuan_products      | created_at                  | 2                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | public           | chuan_products      | product_type                | 5                | USER-DEFINED                |                          |                 |
| postgresql | postgres      | storage          | objects             | updated_at                  | 6                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | test_environment | staff               | firstname                   | 2                | character varying           | 50                       |                 |
| postgresql | postgres      | public           | chuan_employees     | employee_username           | 3                | text                        |                          |                 |
| postgresql | postgres      | auth             | saml_providers      | metadata_xml                | 4                | text                        |                          |                 |
| postgresql | postgres      | auth             | refresh_tokens      | parent                      | 8                | character varying           | 255                      |                 |
| postgresql | postgres      | pgsodium         | key                 | key_type                    | 5                | USER-DEFINED                |                          |                 |
| postgresql | postgres      | test_environment | services            | category                    | 4                | character varying           | 50                       |                 |
| postgresql | postgres      | test_environment | inventory           | quantity                    | 4                | integer                     |                          |                 |
| postgresql | postgres      | storage          | buckets             | public                      | 6                | boolean                     |                          |                 |
| postgresql | postgres      | auth             | refresh_tokens      | created_at                  | 6                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | auth             | saml_relay_states   | for_email                   | 4                | text                        |                          |                 |
| postgresql | postgres      | auth             | sso_domains         | updated_at                  | 5                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | auth             | users               | email_change_token_current  | 28               | character varying           | 255                      |                 |
| postgresql | postgres      | auth             | saml_providers      | updated_at                  | 8                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | storage          | buckets             | file_size_limit             | 8                | bigint                      |                          |                 |
| postgresql | postgres      | vault            | secrets             | secret                      | 4                | text                        |                          |                 |
| postgresql | postgres      | public           | chuan_employees     | employee_middle_name        | 7                | text                        |                          |                 |
| postgresql | postgres      | public           | chuan_employees     | employee_contact            | 12               | text                        |                          |                 |
| postgresql | postgres      | test_environment | customers           | location                    | 6                | character varying           | 100                      |                 |
| postgresql | postgres      | auth             | sessions            | not_after                   | 7                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | auth             | identities          | updated_at                  | 7                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | auth             | users               | role                        | 4                | character varying           | 255                      |                 |
| postgresql | postgres      | auth             | sessions            | updated_at                  | 4                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | storage          | migrations          | executed_at                 | 4                | timestamp without time zone |                          |                 |
| postgresql | postgres      | test_environment | services            | description                 | 3                | text                        |                          |                 |
| postgresql | postgres      | auth             | mfa_factors         | friendly_name               | 3                | text                        |                          |                 |
| postgresql | postgres      | public           | chuan_employees     | employee_salary             | 14               | numeric                     |                          |                 |
| postgresql | postgres      | auth             | users               | invited_at                  | 8                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | storage          | objects             | owner                       | 4                | uuid                        |                          |                 |
| postgresql | postgres      | storage          | buckets             | allowed_mime_types          | 9                | ARRAY                       |                          |                 |
| postgresql | postgres      | test_environment | customers           | firstname                   | 2                | character varying           | 50                       |                 |
| postgresql | postgres      | storage          | buckets             | created_at                  | 4                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | test_environment | products            | description                 | 3                | text                        |                          |                 |
| postgresql | postgres      | vault            | secrets             | updated_at                  | 8                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | pgsodium         | key                 | created                     | 3                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | public           | chuan_products      | product_price               | 6                | numeric                     |                          |                 |
| postgresql | postgres      | auth             | flow_state          | code_challenge              | 5                | text                        |                          |                 |
| postgresql | postgres      | auth             | users               | created_at                  | 20               | timestamp with time zone    |                          |                 |
| postgresql | postgres      | auth             | saml_providers      | metadata_url                | 5                | text                        |                          |                 |
| postgresql | postgres      | test_environment | services            | price                       | 7                | numeric                     |                          |                 |
| postgresql | postgres      | auth             | identities          | last_sign_in_at             | 5                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | test_environment | products            | margin                      | 8                | numeric                     |                          |                 |
| postgresql | postgres      | storage          | objects             | metadata                    | 8                | jsonb                       |                          |                 |
| postgresql | postgres      | auth             | flow_state          | user_id                     | 2                | uuid                        |                          |                 |
| postgresql | postgres      | auth             | audit_log_entries   | payload                     | 3                | json                        |                          |                 |
| postgresql | postgres      | auth             | mfa_factors         | status                      | 5                | USER-DEFINED                |                          |                 |
| postgresql | postgres      | test_environment | transactions        | total                       | 5                | numeric                     |                          |                 |
| postgresql | postgres      | test_environment | customers           | phonenumber                 | 4                | character varying           | 20                       |                 |
| postgresql | postgres      | auth             | mfa_amr_claims      | created_at                  | 2                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | auth             | mfa_factors         | updated_at                  | 7                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | auth             | saml_relay_states   | redirect_to                 | 5                | text                        |                          |                 |
| postgresql | postgres      | auth             | users               | reauthentication_token      | 31               | character varying           | 255                      |                 |
| postgresql | postgres      | public           | chuan_employees     | employee_password           | 5                | character varying           |                          |                 |
| postgresql | postgres      | test_environment | products            | price                       | 5                | numeric                     |                          |                 |
| postgresql | postgres      | test_environment | services            | margin                      | 10               | numeric                     |                          |                 |
| postgresql | postgres      | auth             | saml_relay_states   | from_ip_address             | 6                | inet                        |                          |                 |
| postgresql | postgres      | test_environment | services            | costperservice              | 8                | numeric                     |                          |                 |
| postgresql | postgres      | public           | chuan_employees     | employee_address            | 11               | text                        |                          |                 |
| postgresql | postgres      | auth             | sessions            | tag                         | 11               | text                        |                          |                 |
| postgresql | postgres      | auth             | sessions            | created_at                  | 3                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | auth             | identities          | identity_data               | 3                | jsonb                       |                          |                 |
| postgresql | postgres      | test_environment | transactions        | status                      | 6                | character varying           | 10                       |                 |
| postgresql | postgres      | storage          | objects             | owner_id                    | 11               | text                        |                          |                 |
| postgresql | postgres      | vault            | secrets             | nonce                       | 6                | bytea                       |                          |                 |
| postgresql | postgres      | auth             | users               | aud                         | 3                | character varying           | 255                      |                 |
| postgresql | postgres      | storage          | objects             | last_accessed_at            | 7                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | auth             | identities          | created_at                  | 6                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | auth             | users               | last_sign_in_at             | 16               | timestamp with time zone    |                          |                 |
| postgresql | postgres      | public           | chuan_products      | product_info                | 3                | text                        |                          |                 |
| postgresql | postgres      | auth             | users               | recovery_sent_at            | 12               | timestamp with time zone    |                          |                 |
| postgresql | postgres      | storage          | buckets             | updated_at                  | 5                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | auth             | users               | phone_change_sent_at        | 26               | timestamp with time zone    |                          |                 |
| postgresql | postgres      | auth             | refresh_tokens      | user_id                     | 4                | character varying           | 255                      |                 |
| postgresql | postgres      | auth             | sessions            | factor_id                   | 5                | uuid                        |                          |                 |
| postgresql | postgres      | vault            | secrets             | created_at                  | 7                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | test_environment | customproducts      | total                       | 6                | numeric                     |                          |                 |
| postgresql | postgres      | auth             | flow_state          | provider_type               | 6                | text                        |                          |                 |
| postgresql | postgres      | storage          | buckets             | avif_autodetection          | 7                | boolean                     |                          |                 |
| postgresql | postgres      | auth             | users               | phone_change                | 24               | text                        |                          |                 |
| postgresql | postgres      | auth             | users               | confirmation_token          | 9                | character varying           | 255                      |                 |
| postgresql | postgres      | auth             | flow_state          | authentication_method       | 11               | text                        |                          |                 |
| postgresql | postgres      | auth             | mfa_challenges      | created_at                  | 3                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | pgsodium         | key                 | expires                     | 4                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | auth             | users               | updated_at                  | 21               | timestamp with time zone    |                          |                 |
| postgresql | postgres      | storage          | objects             | name                        | 3                | text                        |                          |                 |
| postgresql | postgres      | auth             | users               | reauthentication_sent_at    | 32               | timestamp with time zone    |                          |                 |
| postgresql | postgres      | auth             | users               | encrypted_password          | 6                | character varying           | 255                      |                 |
| postgresql | postgres      | test_environment | staff               | lastname                    | 3                | character varying           | 50                       |                 |
| postgresql | postgres      | auth             | refresh_tokens      | revoked                     | 5                | boolean                     |                          |                 |
| postgresql | postgres      | auth             | saml_relay_states   | request_id                  | 3                | text                        |                          |                 |
| postgresql | postgres      | auth             | mfa_challenges      | verified_at                 | 4                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | auth             | users               | email_change_sent_at        | 15               | timestamp with time zone    |                          |                 |
| postgresql | postgres      | auth             | users               | instance_id                 | 1                | uuid                        |                          |                 |
| postgresql | postgres      | auth             | users               | banned_until                | 30               | timestamp with time zone    |                          |                 |
| postgresql | postgres      | test_environment | locations           | locationname                | 2                | character varying           | 100                      |                 |
| postgresql | postgres      | auth             | audit_log_entries   | ip_address                  | 5                | character varying           | 64                       |                 |
| postgresql | postgres      | auth             | flow_state          | code_challenge_method       | 4                | USER-DEFINED                |                          |                 |
| postgresql | postgres      | test_environment | staff               | phone                       | 6                | character varying           | 20                       |                 |
| postgresql | postgres      | test_environment | transactionservices | quantity                    | 4                | integer                     |                          |                 |
| postgresql | postgres      | test_environment | staff               | adminpermissions            | 8                | boolean                     |                          |                 |
| postgresql | postgres      | test_environment | services            | type                        | 5                | character varying           | 50                       |                 |
| postgresql | postgres      | auth             | mfa_factors         | created_at                  | 6                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | auth             | mfa_amr_claims      | updated_at                  | 3                | timestamp with time zone    |                          |                 |
| postgresql | postgres      | pgsodium         | key                 | associated_data             | 9                | text                        |                          |                 |
| postgresql | postgres      | auth             | users               | is_super_admin              | 19               | boolean                     |                          |                 |
| postgresql | postgres      | test_environment | staff               | staffpermissions            | 7                | boolean                     |                          |                 |