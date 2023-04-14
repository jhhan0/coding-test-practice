-- 주문량이 많은 아이스크림들 조회하기
SELECT FLAVOR 
FROM (
    SELECT F.FLAVOR, FLAVOR_ORDER_SUM + TOTAL_ORDER AS TOTAL
    FROM FIRST_HALF AS F
    LEFT JOIN (
        SELECT FLAVOR, SUM(TOTAL_ORDER) AS FLAVOR_ORDER_SUM
        FROM JULY
        GROUP BY FLAVOR
    ) AS J
    ON J.FLAVOR = F.FLAVOR
    ORDER BY TOTAL DESC
) AS T
LIMIT 3