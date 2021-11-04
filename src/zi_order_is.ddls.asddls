@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Order View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_ORDER_IS
  as select from    zis_order                                                       as Ordr
    left outer join DDCDS_CUSTOMER_DOMAIN_VALUE_T(p_domain_name:'ZIS_ORDER_STATUS') as dval on dval.value_low = Ordr.status
  composition [0..*] of ZI_ORDER_ITEM_IS as _Oitem
  //    association [1..*] to zis_order_item as _Oitem    on $projection.OrderID = _Oitem.order_id
  association [0..1] to zis_customer     as _Customer on $projection.CustomerID = _Customer.customer_id
  association [0..1] to I_Currency       as _Currency on $projection.CurrencyCode = _Currency.Currency

{
  key Ordr.order_id      as OrderID,
      Ordr.customer_id   as CustomerID,
      
      concat_with_space(_Customer.first_name, _Customer.last_name,1) as CustomerName,
      
      Ordr.order_date    as OrderDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Ordr.total_price   as TotalPrice,

      case
       when Ordr.total_price < 50 then 2 --yellow
       when Ordr.total_price > 50 and Ordr.total_price < 100 then 3 --green
       when Ordr.total_price > 100 then 1 --red
       else 0
      end                as TotalPriceCriticality,

      Ordr.currency_code as CurrencyCode,
      Ordr.product_count as ProductCount,
      Ordr.status        as Status,
      dval.text          as StatusText,

      case Ordr.status
        when 'C'  then 1
        when 'D'  then 3
        when 'S'  then 2
                  else 0
      end                as StatusCriticality,

      /* associations */
      _Oitem,
      _Customer,
      _Currency
}
