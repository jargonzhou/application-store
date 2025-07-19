# Liquibase
* https://www.liquibase.com/
* with Docker:
  * [image](https://hub.docker.com/r/liquibase/liquibase)
  * [doc](https://docs.liquibase.com/workflows/liquibase-community/using-liquibase-and-docker.html)
* [lpm - Liquibase package manager](https://github.com/liquibase/liquibase-package-manager): lpm is experimental and not officially supported.

## Concepts

SQL model (.sql files), platform-agnostic model (.xml, .yaml, and .json files)
* [Changelogs](https://docs.liquibase.com/concepts/changelogs/home.html)
  * [Changesets](https://docs.liquibase.com/concepts/changelogs/changeset.html)
  * Preconditions: control the execution of an update based on the state of DB.
  * [Property substitution](https://docs.liquibase.com/concepts/changelogs/property-substitution.html): changelog `<property>`, `${property-name}` to refer.
* [Change Types](https://docs.liquibase.com/change-types/home.html): entities, constraints, data, ...
* Labels, Context: `--label-filter` for feature or version, `--context-filter` for environment.

Commands
* [Liquibase Command List](https://docs.liquibase.com/commands/command-list.html)
  * `update`, `rollback`, `status`, `snapshot`, `diff`, `generate-changelog`, ...
* Parameters: command parameters, `liquibase.properties`.

## Databases

### MySQL

```shell
docker build . -f mysql.Dockerfile -t liquibase-mysql:4.32
```

## Commands

* [Liquibase Parameters](https://docs.liquibase.com/parameters/home.html)
  * command line arguments
  * [Create and Configure a liquibase.properties File](https://docs.liquibase.com/concepts/connections/creating-config-properties.html)
  * flow file action argument
  * `JAVA_OPTS` variable to run Liquibase
  * environment variables
  
- `init project`
```shell
liquibase@44bb84dbd7e7:~/changelog$ liquibase init project
Starting Liquibase at 08:11:47 using Java 21.0.7 (version 4.32.0 #8159 built at 2025-05-19 23:00+0000)
Liquibase Version: 4.32.0
Liquibase Open Source 4.32.0 by Liquibase
Setup new liquibase.properties, flowfile, and sample changelog? Enter (Y)es with defaults, yes with (C)ustomization, or (N)o. [Y]: 
C
Enter a relative path to desired project directory [./]: 

Enter name for sample changelog file to be created or (s)kip [example-changelog]: 

Enter your preferred changelog format (options: sql, xml, json, yml, yaml) [sql]: 
yml
Enter name for defaults file to be created or (s)kip [liquibase.properties]: 

Enter the JDBC url without username or password to be used (What is a JDBC url? <url>) [jdbc:h2:tcp://localhost:9090/mem:dev]: 
jdbc:sqlserver://192.168.0.101:1433;encrypt=no
Enter username to connect to JDBC url [dbuser]: 
sa
Enter password to connect to JDBC url [letmein]: 
admin123!
Setting up new Liquibase project in '/liquibase/changelog/.'...

Created example changelog file '/liquibase/changelog/example-changelog.yml'
Created example defaults file '/liquibase/changelog/liquibase.properties'
Created example flow file '/liquibase/changelog/liquibase.advanced.flowfile.yaml'
Created example flow file '/liquibase/changelog/liquibase.flowvariables.yaml'
Created example flow file '/liquibase/changelog/liquibase.endstage.flow'
Created example flow file '/liquibase/changelog/liquibase.flowfile.yaml'
Created example checks package '/liquibase/changelog/liquibase.checks-package.yaml'

To use the new project files make sure your database is active and accessible and run "liquibase update".
For more details, visit the Getting Started Guide at https://docs.liquibase.com/start/home.html
Liquibase command 'init project' was executed successfully.
```

- `generate-changelog`
```shell
# generate specific catalog/database, schema
liquibase@44bb84dbd7e7:~/changelog$ liquibase generate-changelog --changelog-file=gen.yml --author=zjg --driver-properties-file=liquibase.properties --default-catalog-name=TestDB --default-schema-name=dbo
Generated changelog written to gen.yml
Liquibase command 'generate-changelog' was executed successfully.
```

- `snapshot`
```shell
liquibase@44bb84dbd7e7:~/changelog$ liquibase snapshot --output-file=snapshot.yml --driver-properties-file=liquibase.properties --default-catalog-name=TestDB --default-schema-name=dbo --snapshot-format=YAML
Output saved to snapshot.yml
Liquibase command 'snapshot' was executed successfully.
```

- `update-sql`, `update`
```shell
liquibase@44bb84dbd7e7:~/changelog$ liquibase update-sql --changelog-file=gen.yml --driver-properties-file=liquibase.properties --default-catalog-name=TestDB --default-schema-name=dbo
...
USE TestDB;
GO

-- Changeset gen.yml::1752913915426-1::zjg
CREATE TABLE Inventory (id int NOT NULL, name nvarchar(50) NOT NULL, quantity int NOT NULL);
GO
...

liquibase@44bb84dbd7e7:~/changelog$ liquibase update-sql --changelog-file=add_column/inventory_description.yml --driver-properties-file=liquibase.properties --default-catalog-name=TestDB --default-schema-name=dbo
-- *********************************************************************
-- Update Database Script
-- *********************************************************************
-- Change Log: add_column/inventory_description.yml
-- Ran at: 7/19/25, 8:50 AM
-- Against: sa@jdbc:sqlserver://192.168.0.101:1433;...
...
-- Liquibase version: 4.32.0
-- *********************************************************************

USE TestDB;
GO

-- Changeset add_column/inventory_description.yml::1::zjg
-- example-comment
ALTER TABLE Inventory ADD description varchar(200);
GO
...

liquibase@44bb84dbd7e7:~/changelog$ liquibase update --changelog-file=add_column/inventory_description.yml --driver-properties-file=liquibase.properties --default-catalog-name=TestDB --default-schema-name=dbo
Running Changeset: add_column/inventory_description.yml::1::zjg

UPDATE SUMMARY
Run:                          1
Previously run:               0
Filtered out:                 0
-------------------------------
Total change sets:            1

Liquibase: Update has been successful. Rows affected: 1
Liquibase command 'update' was executed successfully.
```

- `history`
```shell
liquibase@44bb84dbd7e7:~/changelog$ liquibase history --driver-properties-file=liquibase.properties --default-catalog-name=TestDB --default-schema-name=dbo
...
+---------------+------------------+--------------------------------------+------------------+--------------+-----+
| Deployment ID | Update Date      | Changelog Path                       | Changeset Author | Changeset ID | Tag |
+---------------+------------------+--------------------------------------+------------------+--------------+-----+
| 2915407293    | 7/19/25, 8:56 AM | add_column/inventory_description.yml | zjg              | 1            |     |
+---------------+------------------+--------------------------------------+------------------+--------------+-----+

Liquibase command 'history' was executed successfully.
```

- `rollback-count-sql`, `rollback-count`
```shell
liquibase@44bb84dbd7e7:~/changelog$ liquibase rollback-count-sql --count=1 --changelog-file=add_column/inventory_description.yml --driver-properties-file=liquibase.properties --default-catalog-name=TestDB --default-schema-name=dbo
...
USE TestDB;
GO

-- Rolling Back ChangeSet: add_column/inventory_description.yml::1::zjg
DECLARE @sql [nvarchar](MAX)
SELECT @sql = N'ALTER TABLE Inventory DROP CONSTRAINT ' + QUOTENAME([df].[name]) FROM [sys].[columns] AS [c] INNER JOIN [sys].[default_constraints] AS [df] ON [df].[object_id] = [c].[default_object_id] WHERE [c].[object_id] = OBJECT_ID(N'Inventory') AND [c].[name] = N'description'
EXEC sp_executesql @sql
GO

ALTER TABLE Inventory DROP COLUMN description
GO
...

liquibase@44bb84dbd7e7:~/changelog$ liquibase rollback-count --count=1 --changelog-file=add_column/inventory_description.yml --driver-properties-file=liquibase.properties --default-catalog-name=TestDB --default-schema-name=dbo
Rolling Back Changeset: add_column/inventory_description.yml::1::zjg
Liquibase command 'rollback-count' was executed successfully.

# check
...
liquibase@44bb84dbd7e7:~/changelog$ liquibase history --driver-properties-file=liquibase.properties --default-catalog-name=TestDB --default-schema-name=dbo
...
No changesets deployed
Liquibase command 'history' was executed successfully.
```

more: `tag`, `rollback`, `validate`, ...