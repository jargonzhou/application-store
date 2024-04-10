CREATE VIEW devops.widened AS
SELECT
ev."event" AS "event",
ev."timestamp" AS "timestamp",
ev."customer.id" AS "customer.id",
ev."customer.is_vip" AS "customer.is_vip",
c."name" AS "customer.name",
c."zip_code" AS "customer.zip_code",
ev."employee.id" AS "employee.id",
ev."employee.job_role" AS "employee.job_role",
e."name" AS "employee.name",
e."dob" AS "employee.dob",
ev."location.latitude" AS "location.latitude",
ev."location.longitude" AS "location.longitude",
ev."location.elevation" AS "location.elevation",
ev."package.id" AS "package.id",
p."weight" AS "package.weight",
ev."vehicle.vin" AS "vehicle.vin",
ev."vehicle.mileage" AS "vehicle.mileage",
v."make" AS "vehicle.make",
v."model" AS "vehicle.model",
v."year" AS "vehicle.year"
FROM devops.events AS ev
LEFT JOIN devops.vehicles AS v ON ev."vehicle.vin" = v.vin
LEFT JOIN devops.employees AS e ON ev."employee.id" = e.id
LEFT JOIN devops.packages AS p ON ev."package.id" = p.id
LEFT JOIN devops.customers AS c ON ev."customer.id" = c.id;

SELECT * FROM devops.widened WHERE event='DRIVER_MISSES_CUSTOMER' LIMIT 1;