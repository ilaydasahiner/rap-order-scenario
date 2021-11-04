@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Product View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_PRODUCT_IS
  as select from    zis_product                                               as Product
    left outer join DDCDS_CUSTOMER_DOMAIN_VALUE_T(p_domain_name:'ZIS_STATUS') as dval on dval.value_low = Product.status
    association [1..*] to ZI_ORDER_ITEM_IS as _OrderItem on $projection.ProductID = _OrderItem.ProductID
    association [0..1] to I_Currency       as _Currency on $projection.CurrencyCode = _Currency.Currency
{
  key Product.product_id    as ProductID,
      Product.productname   as ProductName,
      Product.description   as Description,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      Product.unit_price    as UnitPrice,
      Product.currency_code as CurrencyCode,
      Product.status        as Status,
      dval.text             as StatusText,
      
      _OrderItem,
      _Currency
}
