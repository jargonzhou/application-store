# SQL Server
* https://learn.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker
* https://learn.microsoft.com/en-us/sql/linux/sql-server-linux-docker-container-configure
* https://hub.docker.com/r/microsoft/mssql-server

# Books
* Dewson, Robin. **Beginning SQL Server 2012 for Developers**. 2012, 3. edition. Apress.

# Client

* [SSMS: SQL Server Management Studio](https://learn.microsoft.com/zh-cn/ssms/install/install)
* [SQL Server JDBC connection URL](https://learn.microsoft.com/en-us/sql/connect/jdbc/building-the-connection-url): `jdbc:sqlserver://192.168.0.101:1433;encrypt=no;user=sa`
  * [Error message "The server selected protocol version TLS10 is not accepted by client preferences"](https://stackoverflow.com/questions/67246010/error-message-the-server-selected-protocol-version-tls10-is-not-accepted-by-cli)
* more: [sqlserver.ipynb](./sqlserver.ipynb)

## Examples
* more: [sqlserver.sql](./sqlserver.sql)

```sql
-- create database: TestDB

-- create table: Inventory
CREATE TABLE TestDB.dbo.Inventory (id int NOT NULL, name nvarchar(50) NOT NULL, quantity int NOT NULL);

-- insert data
INSERT INTO TestDB.dbo.Inventory VALUES (1, 'banana', 150);
INSERT INTO TestDB.dbo.Inventory VALUES (2, 'orange', 154);

-- query data
SELECT * FROM TestDB.dbo.Inventory WHERE quantity > 152;
-- id          name                                               quantity
-- ----------- -------------------------------------------------- -----------
-- 2           orange                                             154

-- (1 row affected)
```