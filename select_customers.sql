--table Customers (CustomerId, RegistrationDateTime), table Purchases (CustomerId, PurchaiseDatetime, ProductName)
--Напишите SQL запрос, который выберет клиентов, которые когда-либо покупали молоко, но не покупали сметану за последний месяц.

select c.id from Customers c
join Purchases p on (c.id = p.CustomerId)
where p.ProductName like '%молоко%' and (p.ProductName not like '%сметана%' and p.PurchaiseDatetime between (DATEADD(m, DATEDIFF(m, 0, GETDATE()) - 1, 0)) and  (DATEADD(s, -1, DATEADD(m, DATEDIFF(m, 0, GETDATE()), 0))))
group by c.id