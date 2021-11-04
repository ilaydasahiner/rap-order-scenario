@AbapCatalog.sqlViewName: 'ZVH_ORDERSTAT_IS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Order Status Value Help'
define view ZVH_ORDER_STATUS_IS
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name:'ZIS_ORDER_STATUS' )
{
      @ObjectModel.text.element: ['StatusText']
  key value_low as Status,
      @Semantics: {language: true }
      @UI.hidden: true
  key language,
      text      as StatusText
}
