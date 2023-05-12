CLASS z_class_1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  METHODS: challenge Importing Value(greeting) Type String
  RETURNING VALUE(result) Type String.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_class_1 IMPLEMENTATION.
METHOD challenge.
greeting = 'Hello ABAP...!'.
result = greeting.
ENDMETHOD.
ENDCLASS.
