// 8) Знайти всі Items переглянуті (view) конкретним Customer
MATCH (:Customer {id: 1})-[:VIEW]->(item:Item)
RETURN item;