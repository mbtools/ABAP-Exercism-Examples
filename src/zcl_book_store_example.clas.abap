CLASS zcl_book_store_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    "! ID of book to buy from 1 to 5
    TYPES book_id TYPE i.

    TYPES basket_type TYPE SORTED TABLE OF book_id WITH NON-UNIQUE KEY table_line.

    TYPES total TYPE p LENGTH 3 DECIMALS 2.

    "! @parameter basket | E.g., buying two copies of the first book and one copy of the second book
    "!                     is equivalent to ( ( 1 ) ( 1 ) ( 2 ) )
    METHODS calculate_total
      IMPORTING
        basket       TYPE basket_type
      RETURNING
        VALUE(total) TYPE total.

  PROTECTED SECTION.
  PRIVATE SECTION.

    CONSTANTS price_per_book TYPE i VALUE 8.

    TYPES:
      BEGIN OF ty_count,
        book  TYPE book_id,
        count TYPE i,
      END OF ty_count,
      ty_counts TYPE TABLE OF ty_count WITH KEY book.

    TYPES:
      BEGIN OF ty_discount,
        books  TYPE i,
        amount TYPE total,
      END OF ty_discount,
      ty_discounts TYPE TABLE OF ty_discount WITH KEY books.

ENDCLASS.



CLASS zcl_book_store_example IMPLEMENTATION.


METHOD calculate_total.

    DATA costs TYPE total.

    DATA(discounts) = VALUE ty_discounts(
      ( books = 5 amount = '0.75' )
      ( books = 4 amount = '0.80' )
      ( books = 3 amount = '0.90' )
      ( books = 2 amount = '0.95' )
      ( books = 1 amount = '1.00' ) ).

    total = 999.

    DATA(counter) = VALUE ty_counts(
      ( book = 1 )
      ( book = 2 )
      ( book = 3 )
      ( book = 4 )
      ( book = 5 ) ).

    LOOP AT basket INTO DATA(book).
      counter[ book = book ]-count += 1.
    ENDLOOP.

    DATA(size) = 5.
    WHILE size > 0.

      DATA(volumes) = counter.
      costs = 0.

      LOOP AT discounts INTO DATA(discount) WHERE books <= size.
        DO.
          DATA(remaining_books) = 0.
          LOOP AT volumes INTO DATA(volume) WHERE count > 0.
            remaining_books += 1.
          ENDLOOP.
          IF remaining_books < discount-books.
            EXIT.
          ENDIF.

          SORT volumes BY count DESCENDING.
          DO discount-books TIMES.
            volumes[ sy-index ]-count -= 1.
          ENDDO.

          costs += price_per_book * discount-books * discount-amount.
        ENDDO.
      ENDLOOP.

      total = nmin( val1 = total val2 = costs ).
      size -= 1.

    ENDWHILE.

  ENDMETHOD.
ENDCLASS.
