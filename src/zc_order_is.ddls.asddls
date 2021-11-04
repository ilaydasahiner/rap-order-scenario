@EndUserText.label: 'Order Projection View'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.semanticKey: ['OrderID']
define root view entity ZC_ORDER_IS
  as projection on ZI_ORDER_IS 
{
      @EndUserText.label: 'Order Number'
      @Search.defaultSearchElement: true
      @Consumption.valueHelpDefinition: [{ entity : {name : 'ZVH_ORDER_IS', element : 'OrderID' } }]
  key OrderID,

      @Consumption.valueHelpDefinition: [{ entity : {name : 'ZVH_CUSTOMER_IS', element : 'CustomerID' } }]
      @EndUserText.label: 'Customer'
      @Search.defaultSearchElement: true
      @ObjectModel.text.element: ['CustomerName']
      CustomerID,
      CustomerName,
            
      @EndUserText.label: 'Order Date'
      OrderDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      TotalPriceCriticality,

      @Consumption.valueHelpDefinition: [{ entity : {name : 'I_Currency', element : 'Currency' } }]
      CurrencyCode,

      @EndUserText.label: 'Number of Products'
      ProductCount,

      @EndUserText.label: 'Order Status'
      @Consumption.valueHelpDefinition: [{ entity : {name : 'ZVH_ORDER_STATUS_IS', element : 'Status' } }]
      @ObjectModel.text.element: ['StatusText']
      Status,
      StatusText,
      StatusCriticality,


      /* Associations */
      _Oitem : redirected to composition child ZC_ORDER_ITEM_IS,
      _Currency,
      _Customer
      
}
