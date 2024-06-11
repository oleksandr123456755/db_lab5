// 3) Знайти всі Orders конкретного Customer
MATCH (customer:Customer {id: 1})-[:BOUGHT]->(order:Order)
RETURN order;