-- There are 4 cities (a, b, c and d) (see the picture Cities.png) and arcs
-- between them with the cost ((a,b) = (b,a)). Create a table with name nodes by
-- using structure {point1, point2, cost} and fill data based on a picture
-- (remember there are direct and reverse paths between 2 nodes). Write one SQL
-- statement that returns all tours (aka paths) with minimal traveling cost if
-- we will start from city "a". Just remember, you need to find the cheapest way
-- of visiting all the cities and returning to your starting point. For example,
-- the tour looks like that a -> b -> c -> d -> a.
CREATE TABLE nodes (
    point1 VARCHAR NOT NULL,
    point2 VARCHAR NOT NULL,
    cost INT NOT NULL
);
INSERT INTO nodes
VALUES ('a', 'b', 10),
    ('b', 'a', 10),
    ('a', 'c', 15),
    ('c', 'a', 15),
    ('a', 'd', 20),
    ('d', 'a', 20),
    ('b', 'c', 35),
    ('c', 'b', 35),
    ('b', 'd', 25),
    ('d', 'b', 25),
    ('c', 'd', 30),
    ('d', 'c', 30);
CREATE VIEW v_tsp AS WITH RECURSIVE toures AS (
    --first query is the starting point in the city 'a'
    SELECT point1 AS tour,
        point1 AS START,
        point2 AS next,
        cost AS total_cost,
        1 AS length
    FROM nodes
    WHERE point1 = 'a'
    UNION ALL
    --second query is the recursive part to add all the possible unique
    --combinations and sum the cost
    SELECT concat(t.tour, ',', n.point1),
        t.start,
        n.point2,
        t.total_cost + n.cost,
        t.length + 1
    FROM toures AS t
        JOIN nodes AS n ON n.point1 = t.next
    WHERE t.tour NOT LIKE concat('%', n.point1, '%')
)
SELECT total_cost,
    concat('{', tour, ',', next, '}') AS tour
FROM toures
WHERE toures.start = toures.next
    AND toures.length = (
        SELECT max(length)
        FROM toures
    );
SELECT *
FROM v_tsp
WHERE total_cost = (
        SELECT MIN(total_cost)
        FROM v_tsp
    )
ORDER BY total_cost,
    tour;