# Projecto – Power BI Report Service

Este não é exatamente um projecto, mas sim uma **nota prática** sobre a organização de dados de uma empresa utilizando serviços do **Power BI em ambiente local (on-premises)**.  
A partir dessa necessidade, surgiu a ideia de criar um **cenário corporativo seguro**, utilizando:

- Power BI Desktop (for Report Server)
- Power BI Report Server (PBIRS)
- SQL Server

---

## Objectivo do Projecto

A ideia principal deste projecto é utilizar os dados de exemplo do **AdventureWorks 2019** para simular um ambiente corporativo real.

O processo consiste em:

1. Tratar os dados de **clientes, produtos e vendas** no **SQL Server**;
2. Carregar esses dados no **Power BI Desktop for Report Server**;
3. Criar relatórios e dashboards no Power BI;
4. Publicar os relatórios no **Power BI Report Server**, instalado localmente no servidor;
5. Configurar permissões de acesso para os utilizadores.

Os utilizadores finais poderão **visualizar e consumir os relatórios**, mas **não terão permissões para editar ou transformar os dados**.  
Toda a gestão, modelação e controlo dos dados permanece sob responsabilidade do **administrador do relatório**, garantindo **segurança, controlo e integridade da informação**.

---

## Tecnologias Utilizadas

- SQL Server
- AdventureWorks 2019 (banco de dados)
- Power BI Desktop for Report Server
- Power BI Report Server (PBIRS)

