SELECT TOP 10 * FROM trnsact ORDER BY orgprice DESC;  
--

SELECT count ( distinct state ) from strinfo;  
--
SELECT * FROM deptinfo WHERE deptdesc like 'e%';  
--

SELECT top 10 (orgprice-sprice) AS margin, saledate
FROM trnsact
WHERE sprice NOT= orgprice
ORDER BY saledate asc, margin DESC;
--
SELECT (sprice), register
FROM trnsact 
WHERE (saledate>'2004-08-01') AND (saledate < '2004-08-11')
ORDER BY orgprice desc, sprice desc;
--
SELECT distinct brand
FROM skuinfo
WHERE brand like '%liz%';
--
SELECT *
FROM store_msa
WHERE city IN ('little rock', 'memphis', 'tulsa')
ORDER by store;

