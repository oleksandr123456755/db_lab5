// 11) Знайти для певного Customer(а) товари, які він переглядав, але не купив
MATCH (customer:Customer {id: 1})-[:VIEW]-(item:Item)
WHERE NOT EXISTS {
    MATCH (customer)-[:BOUGHT]-(:Order)-[:CONTAINS]-(item)
}
RETURN DISTINCT item;
