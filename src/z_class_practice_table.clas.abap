CLASS z_class_practice_table DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES z2ui5_if_app.

    TYPES:
      BEGIN OF ty_flight,
        carrid TYPE string,
        connid TYPE string,
        fldate TYPE d,
      END OF ty_flight.
    DATA: gt_flight TYPE STANDARD TABLE OF ty_flight.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_class_practice_table IMPLEMENTATION.

METHOD z2ui5_if_app~main.

    SELECT carrid connid fldate  FROM sflight INTO TABLE gt_flight.

    DATA(page) = z2ui5_cl_xml_view=>factory( )->page(
     title          = 'Flight Details Table'
            )->scroll_container( height = '70%' vertical = abap_true
                )->table(
                 items = client->_bind_one( gt_flight )
                )->columns(
                    )->column( )->text( 'Carrid' )->get_parent(
                    )->column( )->text( 'Connid' )->get_parent(
                    )->column( )->text( 'Fldate' )->get_parent(
                )->get_parent(
                )->items( )->column_list_item( type = 'Navigation' )->cells(
                    )->text( '{CARRID}'
                    )->text( '{CONNID}'
                    )->text( '{FLDATE}').

    client->set_next( VALUE #( xml_main = page->get_root( )->xml_get( ) )  ).

  ENDMETHOD.

ENDCLASS.
