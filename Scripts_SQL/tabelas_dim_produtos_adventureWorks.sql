-- tabelas com dados de produtos

use AdventureWorksLT2019;
SELECT 
	p.ProductID as 'Codigo Produto',
	TRIM(p.Name) as 'Nome produto',

	-- Funciona como uma agregacao concatenado
	-- STRING_AGG(COALESCE(p.Color, 'Sem cor definida'), ', ') WITHIN GROUP (ORDER BY p.Color) AS Cor,
	COALESCE(TRIM(p.Color), 'Sem cor definido') as Cor,
	COALESCE(TRIM(c.Name) ,'Sem Categoria') as 'Categoria',
	COALESCE(TRIM(m.Name) , 'Sem Modelo')   as 'Modelo',

	p.ListPrice as 'lista de preco',

	-- tratamento de Data
	p.SellStartDate as 'Data Inicio',
	p.SellEndDate   as 'Data Fim',

	--Ano de lancamento e Descontinuado
	YEAR(p.SellStartDate) as 'Ano lancamento',
	YEAR(p.SellEndDate)   as 'Ano Descontinuado',
	DATEDIFF(DAY , p.SellStartDate, COALESCE(p.SellEndDate, GETDATE())) as 'Dias Ativo',

	-- Logica produtos com data de fim estao descontinuados
	CASE 
		 WHEN p.SellEndDate is null THEN 'Ativo'
		 ELSE 'Descontinuado'
	END AS 'Status Produto'

FROM SalesLT.Product as p 
left join SalesLT.ProductCategory as c on p.ProductCategoryID = c.ProductCategoryID
left join SalesLT.ProductModel as m on p.ProductModelID = m.ProductModelID
ORDER BY p.Name