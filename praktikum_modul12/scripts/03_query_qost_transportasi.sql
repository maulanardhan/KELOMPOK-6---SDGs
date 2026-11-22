--- 1. Database transport_db
------------------------------------------
-- A. Query 1 – JOIN tabel TRIPS dan ROUTES
-- 1. SELECT
SELECT
    t.trip_id,
    t.route_id,
    r.route_name,
    t.started_at,
    t.status
FROM TRIPS t
JOIN ROUTES r
    ON t.route_id = r.route_id
WHERE t.route_id = 12
    AND t.started_at >= '2026-11-01';

-- 2. EXPLAIN
EXPLAIN
SELECT
    t.trip_id,
    t.route_id,
    r.route_name,
    t.started_at,
    t.status
FROM TRIPS t
JOIN ROUTES r
    ON t.route_id = r.route_id
WHERE t.route_id = 12
    AND t.started_at >= '2026-11-01';

-- 3. EXPLAIN ANALYZE
EXPLAIN ANALYZE
SELECT
    t.trip_id,
    t.route_id,
    r.route_name,
    t.started_at,
    t.status
FROM TRIPS t
JOIN ROUTES r
    ON t.route_id = r.route_id
WHERE t.route_id = 12
    AND t.started_at >= '2026-11-01';

-- B. Query 2 – JOIN dengan Subquery
-- 1. SELECT
SELECT
    t.trip_id,
    t.route_id,
    r.route_name,
    t.started_at,
    t.status
FROM (
    SELECT *
    FROM TRIPS
    WHERE route_id = 12
        AND started_at >= '2026-11-01'
) t
JOIN ROUTES r
    ON t.route_id = r.route_id;

-- 2. EXPLAIN
EXPLAIN
SELECT
    t.trip_id,
    t.route_id,
    r.route_name,
    t.started_at,
    t.status
FROM (
    SELECT *
    FROM TRIPS
    WHERE route_id = 12
        AND started_at >= '2026-11-01'
) t
JOIN ROUTES r
    ON t.route_id = r.route_id;

-- 3. EXPLAIN ANALYZE
EXPLAIN ANALYZE
SELECT
    t.trip_id,
    t.route_id,
    r.route_name,
    t.started_at,
    t.status
FROM (
    SELECT *
    FROM TRIPS
    WHERE route_id = 12
        AND started_at >= '2026-11-01'
) t
JOIN ROUTES r
    ON t.route_id = r.route_id;
