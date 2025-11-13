Operators
=========

Arithmetic Operators
--------------------

STARCH supports the standard arithmetic operators:

.. code-block:: starch
    
    var sum = 5 + 3;        # Addition
    var diff = 10 - 2;      # Subtraction
    var product = 4 * 7;    # Multiplication
    var quotient = 20 / 4;  # Division
    var power = 2 ^ 8;      # Exponentation
    var remainder = 10 % 3; # Modulo

Comparison Operators
--------------------

.. code-block:: starch

   var is_equal = (5 == 5);      # Equal to
   var not_equal = (3 != 4);     # Not equal to
   var less = (2 < 5);           # Less than
   var greater = (10 > 3);       # Greater than
   var less_eq = (5 <= 5);       # Less than or equal
   var greater_eq = (7 >= 2);    # Greater than or equal

In addition to these standard comparison operators, STARCH also supports the approximately equal operator.

.. code-block:: starch

    var approx = (50 ≈ 54); # This is true

For strings, the comparison is case insensitive. For numbers, the answer is ``true`` if the numbers are within 10% of each other.

Logical Operators
-----------------

STARCH has all the traditional boolean operators:

.. code-block:: starch

    var _and = true and true; # AND
    var _or = true or false   # OR
    var _not = not false      # NOT

Pipeline Operator
-----------------

The pipeline operator (``~>``) is STARCH's signature feature. It passes the result of the left-hand expression as the first argument to the right-hand function:

.. code-block:: starch

    /* Traditional function nesting
    This IS still supported */
    print(process(get_data("hello")));

    // Pipeline style
    "hello" ~> get_data() ~> process ~> print;

This enables fluid, readable data transformation.
You can also use it with members:

.. code-block:: starch

    var text: str = "   Hello world   ";

    // Traditional
    print(text.trim().upper().replace(" ", "_"));

    // Pipeline
    text ~> .trim() ~> .upper() ~> .replace(" ", "_") ~> print();
    // You can also use tabs for readability
    text
        ~> .trim()
        ~> .upper()
        ~> .replace(" ", "_")
        ~> print();

Range Operator
--------------

The range operator (``..``) is used to generate numerical lists.

.. code-block:: starch
    
    /* Output:
    1 2 3 4 5 */
    for i in [1..5] {
        print(i);
    }
    
    /* Output:
    2 4 6 8 10 */
    for i in [2..10..2] { # Step of 2
        print(i);
    }

Concatenation
-------------

Use ``~`` to concatenate strings:

.. code-block:: starch

   var greeting = "Hello" ~ ", " ~ "World!";
   print(greeting);  # "Hello, World!"

Assignment Operators
--------------------

.. code-block:: starch

   var x = 10;
   x += 5;   # x = x + 5
   x -= 3;   # x = x - 3
   x *= 2;   # x = x * 2
   x /= 4;   # x = x / 4