//create and relate
MATCH (n)
DETACH DELETE n;

CREATE (i1:Item {id: 1, name: "Phone", price: 400}),
       (i2:Item {id: 2, name: "Tablet", price: 1000}),
       (i3:Item {id: 3, name: "Headphones", price: 200});

CREATE (c1:Customer {id: 1, name: "Oleksandr"}),
       (c2:Customer {id: 2, name: "Diana"}),
       (c3:Customer {id: 3, name: "Olha"});

CREATE (o1:Order {id: 1, date: date("2024-05-01")}),
       (o2:Order {id: 2, date: date("2024-05-02")}),
       (o3:Order {id: 3, date: date("2024-05-03")});

MATCH (c1:Customer {id: 1}), (o1:Order {id: 1})
MERGE (c1)-[:BOUGHT]->(o1);

MATCH (c1:Customer {id: 1}), (o2:Order {id: 2})
MERGE (c1)-[:BOUGHT]->(o2);

MATCH (c2:Customer {id: 2}), (o3:Order {id: 3})
MERGE (c2)-[:BOUGHT]->(o3);

MATCH (i1:Item {id: 1}), (o1:Order {id: 1})
MERGE (i1)-[:CONTAINS]->(o1);

MATCH (i2:Item {id: 2}), (o1:Order {id: 1})
MERGE (i2)-[:CONTAINS]->(o1);

MATCH (i2:Item {id: 2}), (o2:Order {id: 2})
MERGE (i2)-[:CONTAINS]->(o2);

MATCH (i3:Item {id: 3}), (o3:Order {id: 3})
MERGE (i3)-[:CONTAINS]->(o3);

MATCH (c1:Customer {id: 1}), (i1:Item {id: 1})
MERGE (c1)-[:VIEW]->(i1);

MATCH (c1:Customer {id: 1}), (i3:Item {id: 3})
MERGE (c1)-[:VIEW]->(i3);

CREATE (o4:Order {id: 4, date: date("2024-05-04")})
WITH o4
MATCH (i:Item)
MERGE (i)-[:CONTAINS]->(o4)
WITH o4
MATCH (c2:Customer {id: 2})
MERGE (c2)-[:BOUGHT]->(o4)
RETURN o4;

