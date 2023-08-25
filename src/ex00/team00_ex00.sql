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
WITH RECURSIVE toures AS (
    --first query is the starting point in the city 'a'
    SELECT point1 AS tour,
        point2 AS next,
        cost AS total_cost,
        1 AS length
    FROM nodes
    WHERE point1 = 'a'
    UNION ALL
    --second query is the recursive part to add all the possible unique
    --combinations and sum the cost
    SELECT concat(t.tour, ',', n.point1),
        n.point2,
        t.total_cost + n.cost,
        t.length + 1
    FROM toures AS t
        JOIN nodes AS n ON n.point1 = t.next
    WHERE t.tour NOT LIKE concat('%', n.point1, '%')
),
-- select only the full toures that go back to the starting point
correct_toures AS (
    SELECT tour,
        next,
        total_cost
    FROM toures
    WHERE next = 'a' -- return to the starting point
        AND length = (
            SELECT MAX(length)
            FROM toures
        )
)
SELECT total_cost, concat('{', tour, ',', next, '}') AS tour
FROM correct_toures
WHERE total_cost = (SELECT MIN(total_cost) from correct_toures)
ORDER BY total_cost, tour;