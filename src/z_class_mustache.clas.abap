CLASS z_class_mustache DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    types: Begin of ty_shop_item,
           name type string,
           price type p length 15 decimals 2,
           end of ty_shop_item,

        ty_shop_item_tt type standard table of ty_shop_item with default key,

        Begin of ty_shop,
        shop_name type string,
        items type ty_shop_item_tt,
        end of ty_shop.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_class_mustache IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
  data: lo_mustache type ref to zcl_mustache.
  data: lt_my_data type standard table of ty_shop with default key.
  data: lr_data type ref to ty_shop.

        append INITIAL LINE TO lt_my_data reference into lr_data.
        lr_data->shop_name = 'Coffe Day'.
        lr_data->items = value ty_shop_item_tt( ( name = 'Cappuccino' price = '98.00' )
                                                 ( name = 'Espresso' price = '78.00')
                                                 ( name = 'Latte' price = '80.00' ) ).

  lo_mustache = zcl_mustache=>create(
  'Welcome to {{shop_name}}!' && cl_abap_char_utilities=>newline &&
  '{{#items}}'                && cl_abap_char_utilities=>newline &&
  '* {{name}} - ${{price}}'   && cl_abap_char_utilities=>newline &&
  '{{/items}}'
   ).

   out->write( lo_mustache->render( lt_my_data ) ).
  ENDMETHOD.
ENDCLASS.
