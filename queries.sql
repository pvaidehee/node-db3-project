-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT p.ProductName, c.CategoryName
FROM product AS p 
JOIN category AS c
ON p.categoryid = c.id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT shipper.CompanyName, [order].id, [order].OrderDate
FROM [order]
JOIN shipper 
ON [order].ShipVia = shipper.Id
WHERE [order].orderDate < '2012-08-09'; 

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT product.ProductName, orderDetail.id, orderDetail.Quantity
FROM product
JOIN OrderDetail
ON product.id = orderDetail.ProductId
WHERE OrderDetail.orderId = 10251
ORDER BY product.ProductName; 

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT [order].id AS OrderId, Customer.CompanyName AS Company, Employee.LastName EmployeeLastName
FROM [order]
JOIN Employee 
    ON [order].employeeId = Employee.Id
JOIN Customer 
    ON [order].CustomerId = Customer.Id;