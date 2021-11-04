@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Order Item View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_ORDER_ITEM_IS
  as select from zis_order_item

  association        to parent ZI_ORDER_IS as _Order    on $projection.OrderID = _Order.OrderID
  //  association [1..1] to ZI_ORDER_IS     as _Order   on $projection.OrderID = _Order.OrderID
  association [1..1] to zis_product        as _Product on $projection.ProductID = _Product.product_id
  association [0..1] to I_UnitOfMeasure    as _Unit    on $projection.Unit = _Unit.UnitOfMeasure

{

  key order_id   as OrderID,
  key product_id as ProductID,
      @Semantics.quantity.unitOfMeasure : 'Unit'
      quantity   as Quantity,
      unit       as Unit,


      /* associations */
      _Order,
      _Product,
      _Unit
}
