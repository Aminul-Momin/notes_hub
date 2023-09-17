<details><summary style="font-size:18px;color:Orange;text-align:left">SQL, DBMS and RDBMS?</summary>

DBMSs are software applications that help you build and maintain databases. RDBMS is a subset of DBMS, and it is a database management system based on the relational model of the DBMS.

A Relational Database Management System (RDBMS) is a software system that manages and organizes data in a structured manner using the principles of the relational model. It's designed to store, retrieve, and manage large amounts of data while ensuring data integrity, consistency, and security. Here's an in-depth explanation of the terms and concepts associated with RDBMS:

-   `Database`: A collection of related data organized in tables, schemas, and other structures for efficient storage and retrieval.

-   `Schema`: A schema is a logical container or namespace that holds a collection of database objects, including tables, views, indexes, functions, and procedures. Defining the structure, relationships, and constraints of the database, it provides a way to organize and manage these objects within a database. If you have an e-commerce database, you might have schemas like "Sales," "Products," and "Customers", each containing tables and other objects relevant to those areas.
-
-   `Table`: A fundamental structure in an RDBMS that represents a collection of related data. It consists of rows (records) and columns (fields). In the "Sales" schema of an e-commerce database, you might have a "Orders" table, a "Customers" table, and a "Products" table to store information about orders, customers, and products, respectively.

-   `Row (Record)`: A single data entry within a table, representing a specific entity or instance. Each column stores a specific attribute of the entity.

-   `Column (Field)`: A single data element within a table that represents an attribute of the entity. Columns have a specified data type and store values.

-   `Primary Key`: A column or set of columns that uniquely identifies each row in a table. It enforces entity integrity and ensures data uniqueness.

-   `Foreign Key`: A column that establishes a link between two tables by referencing the primary key of another table. It enforces referential integrity, maintaining data consistency.

-   `Index`: A data structure that enhances data retrieval speed by creating a sorted reference to the table's data. It speeds up queries but may slightly slow down updates.

-   `Normalization`: A process to organize data in a way that minimizes data redundancy, reduces anomalies, and ensures data integrity. It involves decomposing tables into smaller, related tables.

    -   `Normalization Forms`: A set of rules that guide the process of database normalization. Examples include First Normal Form (1NF), Second Normal Form (2NF), and Third Normal Form (3NF).

-   `Denormalization`: The opposite of normalization, where redundant data is intentionally introduced to improve read performance at the expense of some update performance.

-   `ACID Properties`: A set of properties that guarantee reliable transaction processing: Atomicity (transactions are all or nothing), Consistency (maintaining data integrity), Isolation (transactions don't interfere), Durability (changes survive system failures).

-   `Transaction`: A sequence of one or more SQL statements executed as a single unit of work. It's used to maintain data integrity during database updates.

-   `Query Language (SQL)`: Structured Query Language is a standardized language used to interact with RDBMS. It includes commands like SELECT, INSERT, UPDATE, and DELETE for data manipulation.

-   `View`: A virtual table created by a query, displaying selected data from one or more tables. It simplifies data access and can enforce data security.

-   `Trigger`: A stored procedure that is automatically executed when a specific event (e.g., insert, update, delete) occurs in the database.

-   `Stored Procedure`: A precompiled set of SQL statements that can be executed as a single unit. They enhance security, reusability, and maintainability.

-   `Backup and Recovery`: Processes and strategies to create copies of the database and restore it in case of data loss, corruption, or system failures.

-   `Joins`: Combining data from two or more tables based on a related column to retrieve meaningful information.

RDBMS systems like MySQL, PostgreSQL, Oracle Database, Microsoft SQL Server, and SQLite are widely used for various applications, ranging from small-scale web applications to large-scale enterprise systems. They provide a structured and efficient way to store, manage, and retrieve data while ensuring data integrity and security.

#### What are the subsets of SQL?

SQL (Structured Query Language) is a standardized programming language used for managing and manipulating relational databases. SQL encompasses a wide range of operations and statements, but we can categorize it into several subsets, each serving a specific purpose. Here are the key subsets of SQL, explained in detail:

-   `Data Query Language (DQL)`:

    -   `Purpose`: DQL is used to retrieve data from a database. It includes SQL SELECT statements that allow you to query data based on specified criteria.

    ```sql
    SELECT first_name, last_name FROM employees WHERE department = 'HR';
    ```

-   `Data Definition Language (DDL)`: In the context of SQL, data definition or data description language (DDL) is a syntax for creating and modifying database objects such as tables, indices, and users. DDL statements are similar to a computer programming language for defining data structures, especially database schemas. Common examples of DDL statements include `CREATE`, `ALTER`, and `DROP`.

    -   `Purpose`: DDL is used for defining and managing the structure of a database. It includes statements for creating, altering, and deleting database objects like tables, indexes, and views.

    ```sql
    CREATE TABLE customers (
        customer_id INT PRIMARY KEY,
        first_name VARCHAR(50),
        last_name VARCHAR(50)
    );
    ```

-   `Data Manipulation Language (DML)`: DML includes the most common SQL statements to store, modify, delete, and retrieve data. They are SELECT, UPDATE, INSERT, and DELETE.

    -   `Purpose`: DML is used for adding, modifying, and deleting data within a database. It includes statements such as INSERT, UPDATE, and DELETE.

    -   Inserting data:

        ```sql
        INSERT INTO employees (first_name, last_name) VALUES ('John', 'Doe');
        ```

    -   Updating data:

        ```sql
        UPDATE products SET price = 25.99 WHERE product_id = 101;
        ```

    -   Deleting data:

        ```sql
        DELETE FROM orders WHERE order_id = 123;
        ```

    -   `Purpose`: DCL statements are used for managing access to data within a database. They include commands like `GRANT` (to provide permissions) and `REVOKE` (to revoke permissions).

        ```sql
        GRANT SELECT, INSERT ON employees TO user1;
        ```

    -   `Purpose`: TCL statements are used to manage transactions within a database. They include commands like COMMIT (to save changes) and ROLLBACK (to undo changes).

        ```sql
        BEGIN TRANSACTION;
        -- SQL statements here
        COMMIT;
        ```

-   `Data Query and Manipulation Functions`:

    -   `Purpose`: SQL includes a wide range of built-in functions that can be used within SELECT and DML statements. These functions perform operations on data, such as mathematical calculations, string manipulations, date/time operations, and more.

    -   Mathematical function:

        ```sql
        SELECT AVG(salary) FROM employees;
        ```

    -   String function:

        ```sql
        SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM customers;
        ```

-   `Database System-Specific Extensions`:

    -   Purpose: Different database management systems (e.g., MySQL, PostgreSQL, Oracle) often provide their own extensions and functionalities that are not part of the SQL standard. These extensions are used for database-specific tasks.

    -   MySQL-specific extension for auto-incrementing columns:

        ```sql
        CREATE TABLE products (
        product_id INT AUTO_INCREMENT PRIMARY KEY,
        product_name VARCHAR(100)
        );
        ```

-   `Data Definition Extensions (e.g., Triggers, Constraints)`:

    -   `Purpose`: SQL allows the creation of advanced database structures, such as triggers and constraints, to enforce data integrity rules and automate actions in response to data changes.

    -   Creating a trigger that fires when a row is updated:

        ```sql
        CREATE TRIGGER update_log
        AFTER UPDATE ON employees
        FOR EACH ROW
        INSERT INTO change_log (employee_id, change_description)
        VALUES (OLD.employee_id, 'Employee data updated');
        ```

SQL is a versatile language with many features and subsets that cater to different aspects of database management and manipulation. Depending on your needs, you can utilize the appropriate subset to perform tasks such as data retrieval, database design, access control, and transaction management.

</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">JOIN in SQL</summary>

A join is used to query data from multiple tables based on the relationship between the fields. There are four types of joins:

-   `Inner Join`: Rows are returned when there is at least one match of rows between the tables.

    ```sql
    select first_name, last_name, order_date, order_amount
    from customers c
    inner join orders o
    on c.customer_id = o.customer_id
    /*   customers and orders are two tables. Data will be displayed from the two tables where the customer_id from customer table matches
    The customer_id from the orders table.   */
    ```

-   `Right Join` : Right join returns all rows from the right table and those which are shared between the tables. If there are no matching rows in the left table, it will still return all the rows from the right table.

    ```sql
    select first_name, last_name, order_date, order_amount
    from customers c
    right join orders o
    on c.customer_id = o.customer_id
    /*   customers and orders are two tables.   All rows from the Orders table is returned with matching rows from the Customers table if any  */
    ```

-   `Left Join`: Left join returns all rows from the Left table and those which are shared between the tables. If there are no matching rows in the right table, it will still return all the rows from the left table.

    ```sql
    select first_name, last_name, order_date, order_amount
    from customers c
    left join orders o
    on c.customer_id = o.customer_id
    /*   customers and orders are two tables.   All rows from the customers table is returned with matching rows from the orders table if any  */
    ```

-   `Full Join`: Full join return rows when there are matching rows in any one of the tables. This means it returns all the rows from the left-hand side table and all the rows from the right-hand side table.

    ```sql
    select first_name, last_name, order_date, order_amount
    from customers c
    full join orders o
    on c.customer_id = o.customer_id
    /*   customers and orders are two tables.   All rows from the Orders table and customer table are returned  */
    ```

#### What is the MERGE statement?

-   The statement enables conditional updates or inserts into the table. It updates the row if it exists or inserts the row if it does not exist.

#### What is a UNION operator?

-   The UNION operator combines the results of two or more Select statements by removing duplicate rows. The columns and the data types must be the same in the SELECT statements.

    ```sql
    SELECT City FROM Customers
    UNION
    SELECT City FROM Suppliers
    ORDER BY City;
    ```

</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">SQL Constraints</summary>

-   Constraints are used to specify the rules of data type in a table.
-   They can be specified while creating and altering the table.
-   The following are the constraints in SQL:

    -   `NOT NULL`: Restricts NULL value from being inserted into a column.
    -   `CHECK`: Verifies that all values in a field satisfy a condition.
    -   `DEFAULT`: Automatically assigns a default value if no value has been specified for the field.
    -   `UNIQUE`: Ensures unique values to be inserted into the field.
    -   `INDEX`: Indexes a field providing faster retrieval of records.
    -   `PRIMARY KEY`: Uniquely identifies each record in a table.
    -   `FOREIGN KEY`: Ensures referential integrity for a record in another table.

-   Create Employees table with constraints

    ```sql
    CREATE TABLE Employees (
        EmployeeID INT PRIMARY KEY,
        FirstName VARCHAR(50) NOT NULL,
        LastName VARCHAR(50) NOT NULL,
        Age INT,
        DepartmentID INT,
        Email VARCHAR(100) UNIQUE,
        Salary DECIMAL(10, 2) DEFAULT 50000.00,
        CONSTRAINT fk_department FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
        INDEX idx_department (DepartmentID) -- Creating INDEX constraint
    );
    ```

#### What is a composite key?

When more than one column is used to define the primary key, it is called a composite key.
Here is a SQL syntax to create a composite key in MySQL

```sql
CREATE TABLE SAMPLE_TABLE
(COL1 integer,
COL2 varchar(30),
COL3 varchar(50),
PRIMARY KEY (COL1, COL2));
```

</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">Normalization</summary>

Normalization is a process in database design to minimize data redundancy and dependency. The database is divided into two or more tables, and relationships are defined between them.

-   `First Normal Form`: Every record is unique in a table and is identified by a primary or a composite key
    ```txt
    | StudiD | Name  | Phonenum              |
    | ------ | ----- | --------------------- |
    | 1      | John  | 9176612345,9176645698 |
    | 2      | Susie | 9176645789            |
    | 3      | Jim   | 9176696325            |
    ```
-   In the above table the field ‘phonenum’ is a multi-valued attribute, so it is not in 1NF.
-   Below Table is in 1NF as there is no multi-valued attribute
    ```txt
    | StudiD | Name  | Phonenum   |
    | ------ | ----- | ---------- |
    | 1      | John  | 9176612345 |
    | 1      | John  | 9176645698 |
    | 2      | Susie | 9176645789 |
    | 3      | Jim   | 9176696325 |
    ```
-   `Second Normal Form`: The table must be in First Normal Form, and it should have a single column as its primary key. 2NF tries to reduce the redundant data getting stored in memory. To bring the above table in 2NF we split the table into two tables

    ```txt
    | StudiD | Name   |
    | ------ | ------ |
    | 1      | . John |
    | 2      | Susie  |
    | 2      | . Jim  |

    | StudiD | Phonenum   |
    | ------ | ---------- |
    | 1      | 9176612345 |
    | 1      | 9176645698 |
    | 2      | 9176645789 |
    | 3      | 9176696325 |
    ```

-   `Third Normal Form`: The table must be in Second Normal Form and must have no transitive functional dependencies. I.e., a non-key column must not be dependent on another non-key column within the same table.'

    -   Consider the `EMPLOYEE_DETAIL` table: This table is not in the third normal form because the fields `emp_state` and `emp_city` depend on `emp_zip` and not on the primary key `emp_id`.

        ```txt
        | EMP_ID | EMP_NAME | EMP_ZIP | EMP_STATE | EMP_CITY |
        | ------ | -------- | ------- | --------- | -------- |
        | 222    | Harry    | 201010  | CT        | Monroe   |
        | 333    | Stephan  | 02228   | TX        | Dallas   |
        | 444    | Lan      | 060007  | IL        | Chicago  |
        ```

    -   The above table is split into 2 tables and now the tables are in the third normal form.

    -   EMPLOYEE table:

        ```txt
        | EMP_ID | EMP_NAME | EMP_ZIP |
        | ------ | -------- | ------- |
        | 222    | Harry    | 201010  |
        | 333    | Stephan  | 02228   |
        | 444    | Lan      | 060007  |
        ```

    -   EMPLOYEE_ZIP table:

        ```txt
        | EMP_ZIP | EMP_STATE | EMP_CITY |
        | ------- | --------- | -------- |
        | 201010  | CT        | Monroe   |
        | 02228   | TX        | Dallas   |
        | 060007  | IL        | Chicago  |
        ```

#### What is de-normalization, and when do you go for it?

De-normalization is a technique sometimes used to improve performance so the table design allows redundant data to avoid complex joins. If the application involves heavy read operations, then de-normalization is used at the expense of the write operations performance.

</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">Important Concepts</summary>

#### Can we use TRUNCATE with a WHERE clause?

No, we cannot use TRUNCATE with the WHERE clause.

#### Distinguish between BETWEEN and IN conditional operators.

BETWEEN- Displays the rows based on range of values
IN- Checks for values contained in a specific set of values.
Example:

```sql
SELECT * FROM Students where ROLL_NO BETWEEN 10 AND 50;
SELECT * FROM students where ROLL_NO IN (8,15,25);
```

#### Define COMMIT

When a COMMIT is used in a transaction all changes made in the transaction are written into the database permanently.

    ```sql
    BEGIN TRANSACTION;
    DELETE FROM HumanResources.JobCandidate
    WHERE JobCandidateID = 13;
    COMMIT TRANSACTION;
    ```

    - The above example deletes a job candidate in a SQL server.

</details>

---

<details><summary style="font-size:18px;color:Orange;text-align:left">Definitions</summary>

#### DB Properties:

-   **Atomicity**: a transaction happens as a whole or not at all
-   **Consistency**: a transaction must be valid according to defined rules
-   **Isolation**: read and write to multiple tables at the same time
-   **Durability**: completed transactions are recorded even in the case of a system failure (e.g., power outage or crash)

#### Transactions:

In the context of Relational Database Management Systems (RDBMS), a transaction is a logical unit of work that consists of one or more SQL operations (queries, updates, inserts, deletes) executed as a single, atomic unit. Transactions are used to ensure the integrity, consistency, and reliability of data within a database. They follow the principles of the ACID properties: Atomicity, Consistency, Isolation, and Durability. Here's an explanation of the key aspects of transactions in terms of RDBMS:

-   `Atomicity`: The atomicity property ensures that a transaction is treated as a single, indivisible unit of work. All the operations within a transaction are either completed successfully, making all changes permanent, or none of them are applied at all. If any part of a transaction fails, the entire transaction is rolled back, ensuring that the database remains in a consistent state.

-   `Consistency`: The consistency property ensures that a transaction brings the database from one valid state to another. This means that the database must satisfy all integrity constraints and business rules before and after the transaction. In other words, the transaction should not violate any predefined rules or constraints.

-   `Isolation`: The isolation property ensures that transactions execute independently and in isolation from each other. Even if multiple transactions are executed concurrently, their effects should not interfere with each other. Isolation prevents one transaction from accessing or modifying data being processed by another transaction until it's complete.

-   `Durability`: The durability property guarantees that once a transaction is successfully completed, its changes are permanent and will survive system failures or crashes. The changes made by committed transactions are stored in non-volatile storage (usually disk) and remain even after the system restarts.

-   Transactions are crucial in maintaining data integrity and preventing anomalies that might arise due to concurrent access and updates to the database. Without transactions, databases could end up in inconsistent states or lost data due to system failures.

-   In practical terms, using transactions involves starting a transaction (BEGIN), executing one or more SQL statements, and then either committing the changes (COMMIT) to make them permanent or rolling back (ROLLBACK) the entire transaction if any part of it fails.

-   Example of a simple transaction using SQL:

    ```sql
    BEGIN; -- Start the transaction
    UPDATE Accounts SET Balance = Balance - 100 WHERE AccountID = 123; -- Deduct $100
    UPDATE Transactions SET Status = 'Completed' WHERE TransactionID = 456; -- Mark the transaction as completed

    COMMIT; -- Commit the changes
    ```

#### Partition:

Partitioning in RDBMS (Relational Database Management System) refers to the process of splitting a large table into smaller, more manageable pieces called partitions. Each partition is treated as a separate table by the database system, and may be stored on different disk drives or even on different servers, depending on the partitioning strategy.
Partitioning is a useful technique for managing large tables in an RDBMS, but it requires careful consideration of the partitioning strategy, as well as ongoing monitoring and maintenance to ensure that partitions continue to perform as expected.

-   Partitioning has several benefits, including:

    -   `Increased query performance`: By partitioning a large table into smaller pieces, queries that access only a subset of the data can be processed more quickly.

    -   `Improved manageability`: Partitioning makes it easier to manage large tables by breaking them into smaller, more manageable pieces.

    -   `Reduced downtime`: By partitioning a table, database maintenance operations, such as backups and index rebuilds, can be performed on individual partitions rather than on the entire table, reducing downtime.

    -   `Enhanced scalability`: Partitioning allows for easier scaling of a database by allowing new partitions to be added as needed.

-   There are different types of partitioning techniques available in RDBMS, including:

    -   `Range partitioning`': This involves partitioning a table based on a range of values in a particular column, such as dates or numeric values.

    -   `List partitioning`': This involves partitioning a table based on a list of discrete values in a particular column.

    -   `Hash partitioning`': This involves partitioning a table based on the results of applying a hash function to the values in a particular column.

    -   `Composite partitioning`': This involves partitioning a table using a combination of range, list, and/or hash partitioning techniques.

#### How to save RDBM Transactions for later use?

Saving RDBMS transactions for later use involves capturing the SQL statements and data changes within a transaction and then storing them in a persistent form, such as a file or a separate table, for future execution. Here's how you can do it:

Capture SQL Statements:
As you execute SQL statements within a transaction, capture those statements in a script or a data structure in your programming language.

Data Serialization:
Serialize the captured data into a format that can be stored and later deserialized for execution. Common formats include JSON, XML, or plain text.

File Storage:
Save the serialized data into a file on your file system. Choose an appropriate naming convention to identify the file as a stored transaction.

Database Table:
Create a separate table in your database to store transaction scripts. This table can have columns for transaction ID, timestamp, and the serialized script.

Logging and Auditing:
Optionally, you can log the fact that a transaction script was saved, along with metadata like the user who initiated the transaction.

Ensure that saved transacton scripts are stored securely and only accessible to authorized users to prevent unauthorized changes.

Indexing and Retrieval:
If you're storing scripts in a database table, consider adding indexes to facilitate retrieval based on criteria like transaction ID or timestamp.

Execution Mechanism:
To execute a saved transaction, you'll need a mechanism to deserialize the script and execute the SQL statements within it using the appropriate database connection.

Here's a simplified example of saving and later executing a transaction script using Python and SQLite:

```python
import json
import sqlite3

# Simulated captured SQL statements
transaction_data = {
    "transaction_id": 123,
    "timestamp": "2023-08-01 10:00:00",
    "sql_statements": [
        "INSERT INTO Orders (CustomerID, OrderDate) VALUES (456, '2023-08-01')",
        "INSERT INTO OrderItems (OrderID, ProductID, Quantity) VALUES (LAST_INSERT_ROWID(), 789, 2)"
    ]
}

# Serialize data to JSON
serialized_data = json.dumps(transaction_data)

# Save to a file
with open("saved_transaction.json", "w") as f:
    f.write(serialized_data)

# Later, retrieve and execute the saved transaction
with open("saved_transaction.json", "r") as f:
    retrieved_data = json.load(f)

# Execute the SQL statements using SQLite connection
conn = sqlite3.connect("your_database.db")
for sql_statement in retrieved_data["sql_statements"]:
    conn.execute(sql_statement)
conn.commit()
conn.close()

```

#### What is a trigger?

Triggers are stored programs that get automatically executed when an event such as INSERT, DELETE, UPDATE(DML) statement occurs. Triggers can also be evoked in response to Data definition statements(DDL) and database operations, for example, SERVER ERROR, LOGON.

```sql
create trigger dbtrigger
on database
for
create_table,alter_table,drop_table
as
print'you can not create ,drop and alter table in this database'
rollback;
```

```sql
create trigger emptrigger
on emp
for
insert,update,delete
as
print'you can not insert,update and delete this table i'
rollback;
```

#### What is SAVEPOINT in transaction control?

A SAVEPOINT is a point in a transaction when you can roll the transaction back to a certain point without rolling back the entire transaction.

```sql
SQL> SAVEPOINT A
SQL> INSERT INTO TEST VALUES (1,'Savepoint A');
1 row inserted.
SQL> SAVEPOINT B
SQL> INSERT INTO TEST VALUES (2,'Savepoint B');
1 row inserted.
SQL> ROLLBACK TO B;
Rollback complete.
SQL> SELECT \* FROM TEST;
ID MSG

---

1 Savepoint A
```

#### What is a cursor, and when do you use it?

A cursor is a database object which is used to manipulate data by traversing row by row in a result set. A cursor is used when you need to retrieve data, one row at a time from a result set and when you need to update records one row at a time.

```sql
     DECLARE @CustomerId INT
                ,@Name VARCHAR(100)
                 ,@Country VARCHAR(100)
     --DECLARE AND SET COUNTER.
     DECLARE @Counter INT
     SET @Counter = 1
     --DECLARE THE CURSOR FOR A QUERY.
     DECLARE PrintCustomers CURSOR READ_ONLY
     FOR
     SELECT CustomerId, Name, Country
      FROM Customers
     --OPEN CURSOR.
      OPEN PrintCustomers
     --FETCH THE RECORD INTO THE VARIABLES.
     FETCH NEXT FROM PrintCustomers INTO
      @CustomerId, @Name, @Country
     --LOOP UNTIL RECORDS ARE AVAILABLE.
     WHILE @@FETCH_STATUS = 0
     BEGIN
                IF @Counter = 1
                BEGIN
                       PRINT 'CustomerID' + CHAR(9) + 'Name' + CHAR(9) + CHAR(9) + CHAR(9) + 'Country'
                       PRINT '------------------------------------'
                END
                 --PRINT CURRENT RECORD.                 PRINT CAST(@CustomerId AS VARCHAR(10)) + CHAR(9) + CHAR(9) + CHAR(9) + @Name + CHAR(9) + @Country
                --INCREMENT COUNTER.
                SET @Counter = @Counter + 1
                --FETCH THE NEXT RECORD INTO THE VARIABLES.
                FETCH NEXT FROM PrintCustomers INTO
                @CustomerId, @Name, @Country
      END
     --CLOSE THE CURSOR.
     CLOSE PrintCustomers
      DEALLOCATE PrintCustomers
```

</details>
