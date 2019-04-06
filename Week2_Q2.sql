SELECT * FROM trnsact LIMIT 10 ORDER BY orgprice DESC;  
--

SELECT COUNT(DISTINCT state) FROM strinfo;  
--
SELECT * FROM deptinfo WHERE deptdesc LIKE 'e%';  
--

SELECT (orgprice-sprice) AS margin, saledate
FROM trnsact
WHERE sprice NOT= orgprice
ORDER BY saledate ASC, margin DESC;
--
SELECT (sprice), register
FROM trnsact 
WHERE (saledate>'2004-08-01') AND (saledate < '2004-08-11')
ORDER BY orgprice DESC, sprice DESC;
--
SELECT DISTINCT brand
FROM skuinfo
WHERE brand LIKE '%liz%';
--
SELECT *
FROM store_msa
WHERE city IN ('little rock', 'memphis', 'tulsa')
ORDER BY store;

