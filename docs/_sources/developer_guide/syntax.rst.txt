Language Syntax
===============

STARCH is a gradually-typed language, and all statements must end in a semicolon.

Comments
--------

Stop code from running by using comments. STARCH has many types of comments:

.. code-block:: starch
    
    // JavaScript-style line comment
    /* JavaScript-style
    block comment */

    # Python-style line comment
    <!-- HTML-style
    block comment -->

Variable Declaration
--------------------

Variables in STARCH are created using the ``var`` or ``const`` keywords.

**The** ``const`` **keyword**
Use ``const`` to definite immutable variables, which cannot be re-assigned after initialisation.

.. code-block:: starch

    # A constant
    const PI: float = 3.14159;

    # This will cause an error
    PI = 0;

**The** ``var`` **keyword**
Use ``var`` to declare variables that **can** be re-assigned to a different value of the same type later in the scope.

.. code-block:: starch

    # A mutable integer
    var progress: int = 0;
    progress = 50 // Valid

    # This will cause an error
    progress = "Finished"

**Type annotation**

Although typing is optional, you may want to assign a type to a variable using a colon (``:``) followed by the type name. This is often reccommended for clearer function signatures.

.. code-block:: starch

    # This is specifically a string
    var text: str = "Hello, World!";
    # This works too
    var other_text = "How are you?";

Data Types
----------

STARCH provides eight data types:

* ``int``: A 64-bit signed integer. Examples: ``123``, ``-5``, ``0xDEADBEEF``.
* ``float``: A 64-bit IEEE-754 floating-point number. Examples: ``3.14159``, ``2.0``, ``1e-6``
* ``bool``: A boolean value, either ``true`` or ``false``. Must be written in all lowercase.
* ``str``: A sequence of Unicode characters. Examples: ``"Hello, World!"``, ``"C:/Users"``
* ``list``: An array of untyped objects. Lists are indexed starting at 0. Example: ``[1, 2, 3]``
* ``dict``: An unordered, mutable collection of key-value pairs. Example: ``{"greeting": "hello"}``
* ``void``: ``null``. No data.