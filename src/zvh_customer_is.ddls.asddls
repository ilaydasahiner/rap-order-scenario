@AbapCatalog.sqlViewName: 'ZICUSTOMERIS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Customer Value Help'
define view ZVH_CUSTOMER_IS
  as select from zis_customer
{
      @ObjectModel.text.element: ['CustomerName']
  key customer_id   as CustomerID,
      first_name    as FirstName,
      last_name     as LastName,
      @Semantics.text: true
      concat_with_space(first_name, last_name,1) as CustomerName,
      phone_number  as PhoneNumber,
      email_address as EmailAddress
}
