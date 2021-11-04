@EndUserText.label: 'Order Item Projection View'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity ZC_ORDER_ITEM_IS
  as projection on ZI_ORDER_ITEM_IS 
{
      @Search.defaultSearchElement: true
  key OrderID,
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['ProductName']
//      @Consumption.valueHelpDefinition: [{entity: {name: 'DDCDS_CUSTOMER_DOMAIN_VALUE_T', element: 'text'}}]
  key ProductID,
      _Product.productname as ProductName,
      @Semantics.quantity.unitOfMeasure : 'Unit'
      Quantity,
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_UnitOfMeasure', element: 'UnitOfMeasure' }}]
      Unit,


      /* Associations */
      _Order : redirected to parent ZC_ORDER_IS,
      _Product,
      _Unit
}
