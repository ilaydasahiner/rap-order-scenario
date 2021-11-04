CLASS zcl_demo_data_is DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_demo_data_is IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    "Customer Data
    DELETE FROM zis_customer.

    INSERT zis_customer FROM (
      SELECT
        FROM   /dmo/customer AS customer
        FIELDS
         customer~customer_id   AS customer_id,
         customer~first_name    AS first_name,
         customer~last_name     AS last_name,
         customer~phone_number  AS phone_number,
         customer~email_address AS email_address
      ORDER BY customer_id UP TO 20 ROWS
).

    COMMIT WORK.
    out->write( 'Customer demo data inserted.').

*----------------------------------------------------------------------------------------------------------------------------

    "Products Data
    DATA : lt_product TYPE TABLE OF zis_product.

    lt_product = VALUE #(
        ( client = '100' product_id = '000001' productname = 'Cordless Mouse' description = 'Cordless Optical USB MI, Laptop, Color: Black' unit_price = '9' currency_code = 'EUR' status = 'A')
        ( client = '100' product_id = '000002' productname = 'Blaster Extreme' description = 'PC multimedia speakers - 10 Watt (Total) - 2-way' unit_price = '26' currency_code = 'EUR' status = 'A')
        ( client = '100' product_id = '000003' productname = 'Surround Sound' description = 'PC multimedia speakers - 5 Watt (Total)' unit_price = '39' currency_code = 'EUR' status = 'O')
        ( client = '100' product_id = '000004' productname = 'Pocket Mouse' description = 'Portable pocket Mouse with retracting cord' unit_price = '23' currency_code = 'EUR' status = 'D')
        ( client = '100' product_id = '000005' productname = 'Internet Keyboard' description = 'Corded Keyboard with special keys' unit_price = '16' currency_code = 'EUR' status = 'D')
        ( client = '100' product_id = '000006' productname = 'Media Keyboard' description = 'Corded Ergonomic Keyboard with special keys for Media Usability' unit_price = '26.99' currency_code = 'USD' status = 'A')
        ( client = '100' product_id = '000007' productname = 'Copymaster' description = 'Copymaster' unit_price = '1499' currency_code = 'EUR' status = 'A')
        ( client = '100' product_id = '000008' productname = 'Jet Scan Professional' description = 'Flatbed scanner - Letter - 2400 dpi x 2400 dpi - 216 x 297 mm - add-on module' unit_price = '169' currency_code = 'EUR' status = 'A')
        ( client = '100' product_id = '000009' productname = 'Gaming Monster' description = '3,4 Ghz quad core, 8 GB DDR3 SDRAM, 2000 GB Hard Disc, Graphic Card: Gladiator MX, Windows 8' unit_price = '1200' currency_code = 'EUR' status = 'A')
        ( client = '100' product_id = '000010' productname = 'Hurricane GX' description = 'PCI-E 691 GFLOPS game-optimized' unit_price = '101.2' currency_code = 'USD' status = 'A')
        ( client = '100' product_id = '000011' productname = 'Benda Laptop 1408' description = 'Flexible Laptop with 2,5 GHz Dual Core, 14" HD+ TN' unit_price = '976' currency_code = 'EUR' status = 'O')
        ( client = '100' product_id = '000012' productname = 'Astro Laptop 1516' description = 'Flexible Laptop with 2,5 GHz Quad Core, 15" HD TN' unit_price = '989.45' currency_code = 'EUR' status = 'A')
        ( client = '100' product_id = '000013' productname = 'Smart Games' description = 'Complete package, 1 User, various games for amusement, logic, action, jump&run' unit_price = '55' currency_code = 'EUR' status = 'O')
        ( client = '100' product_id = '000014' productname = 'Smart Design' description = 'Complete package, 1 User, Image editing, processing' unit_price = '79.90' currency_code = 'EUR' status = 'A')
        ( client = '100' product_id = '000015' productname = 'Mini Tablet' description = ' inch 1280x800 HD display (216 ppi), Quad-core processor' unit_price = '833' currency_code = 'EUR' status = 'A')
    ).

    DELETE FROM zis_product.

    INSERT zis_product FROM TABLE @lt_product.
    COMMIT WORK.
    out->write( 'Product demo data inserted.').

*----------------------------------------------------------------------------------------------------------------------------

    "Orders Data
    DATA : lt_order TYPE TABLE OF zis_order.

    lt_order = VALUE #(
        ( client = '100' order_id = '000001' customer_id = '000001' order_date = '20210205' total_price = '9' currency_code = 'EUR' product_count = '1' status = 'D')
        ( client = '100' order_id = '000002' customer_id = '000001' order_date = '20210316' total_price = '52' currency_code = 'EUR' product_count = '2' status = 'S')
        ( client = '100' order_id = '000003' customer_id = '000002' order_date = '20210101' total_price = '26.99' currency_code = 'USD' product_count = '1' status = 'C')
        ( client = '100' order_id = '000004' customer_id = '000005' order_date = '20200928' total_price = '101.2' currency_code = 'USD' product_count = '1' status = 'D')
        ( client = '100' order_id = '000005' customer_id = '000012' order_date = '20210621' total_price = '1226' currency_code = 'EUR' product_count = '2' status = 'D')
    ).

    DELETE FROM zis_order.

    INSERT zis_order FROM TABLE @lt_order.
    COMMIT WORK.
    out->write( 'Order demo data inserted.').

*----------------------------------------------------------------------------------------------------------------------------

    "Order Items Data
    DATA : lt_order_item TYPE TABLE OF zis_order_item.

    lt_order_item = VALUE #(
        ( client = '100' order_id = '000001' product_id = '000001' quantity = '1' unit = 'ST' )
        ( client = '100' order_id = '000002' product_id = '000002' quantity = '2' unit = 'ST')
        ( client = '100' order_id = '000003' product_id = '000006' quantity = '1' unit = 'ST' )
        ( client = '100' order_id = '000004' product_id = '000010' quantity = '1' unit = 'ST' )
        ( client = '100' order_id = '000005' product_id = '000002' quantity = '1' unit = 'ST' )
        ( client = '100' order_id = '000005' product_id = '000009' quantity = '1' unit = 'ST' )
    ).

    DELETE FROM zis_order_item.

    INSERT zis_order_item FROM TABLE @lt_order_item.
    COMMIT WORK.
    out->write( 'Order item demo data inserted.').

  ENDMETHOD.

ENDCLASS.
