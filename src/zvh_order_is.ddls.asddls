@AbapCatalog.sqlViewName: 'ZVH_ORDR_IS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Order Value Help'
define view ZVH_ORDER_IS as select from ZI_ORDER_IS
inner join zis_customer as Customer on Customer.customer_id = CustomerID
 {
    @EndUserText.label: 'Order Number'
    key OrderID,
    @EndUserText.label: 'Customer Number'
    CustomerID,
    @EndUserText.label: 'Customer Name'
    concat_with_space(Customer.first_name, Customer.last_name,1) as CustomerName,
    @EndUserText.label: 'Order Date'
    OrderDate
}
