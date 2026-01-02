-- Construcao da tabela FactoVendas

use AdventureWorksLT2019;

SELECT
	od.SalesOrderDetailID as id_detalhes_vendas,
	o.SalesOrderID as id_pedidos,
	CAST(o.OrderDate AS DATE) as DataPedido,
	CAST(o.ShipDate AS DATE)  as DataEnvio,

	-- Tratamento de datas (essas data resolveram me ferar a vida dentro do report service nao convertendo)

	REPLACE(CAST(o.OrderDate AS DATE) ,'-' ,'') as codigo_data_pedido,
	REPLACE(CAST(o.ShipDate AS DATE) ,'-' ,'')  as codigo_data_envio,

	-- Tratamento de envio caso houver data envio null
	CASE 
		WHEN o.ShipDate IS NULL THEN NULL
		ELSE DATEDIFF(DAY, o.OrderDate, o.ShipDate) 
	END as 'Dias Envio',

	o.CustomerID as 'Codigo Cliente',
	od.ProductID as 'Codigo Produto',
	od.OrderQty  as 'Quantidade',
	od.UnitPrice as 'Preco',
	od.UnitPriceDiscount as 'Desconto',
	(od.OrderQty * od.UnitPrice) as 'Valor Bruto',
	(od.OrderQty * od.UnitPrice ) * od.UnitPriceDiscount as 'Valor Desconto'
FROM SalesLT.SalesOrderHeader as o 
LEFT JOIN SalesLT.SalesOrderDetail as od on o.SalesOrderID = od.SalesOrderID;