Control Flow
============

All blocks must be wrapped in curly braces (``{}``).

If Statements
-------------

Use the ``if`` keyword to create an if statement. You can also use brackets. Additionally, you can use ``elif`` and ``else`` to create branches.

.. code-block:: starch

    // This is in Celcius

    if temperature > 30 {
        return "It's hot!";
    }
    elif (temperature < 20) {
        return "It's cold!";
    }
    else {
        return "Nice temperature!"
    }

Loops
-----

**For Loops**

To create a for loop, use the ``for`` keyword (Pretty intuitive, huh?). Then use a variable and ``in`` to iterate over a list. You don't need brackets.

.. code-block:: starch

    for i in [1..3] {
        print(i);
    }

**While Loops**

A while loop repeats until a condition is false. Use the ``while`` keyword and a value to create one.

.. code-block:: starch

    var condition: bool = true;
    var counter: int = 0;

    while condition {
        counter += 1;

        print("Looping!")
        if counter >= 10 {
            condition = false;
            # You can also use break
        }
    }


Functions
---------

To define a function, use ``function``. Arguments are in a comma delimited list, and you can supply defaults using ``or``:

.. code-block:: starch

    function main(text: str or "Hello, World!") -> void { # returns null
        print(text);
    }

Classes
-------

Classes are created with the ``class`` keyword. If the function _init is defined, it will be called on instantiation. Create self-references using ``this``. Use a colon (``:``) for inheritance.

.. code-block:: starch

    class Human {
        var name: str = "";
        
        function _init(name: str) -> void {
            this.name = name;
        }
    }

    var john: Human = Human("John");
    print(john.name); # John

    class Programmer : Human {
        var routine: array = [];
        
        function _init(name: str, routine: array) -> void {
            super(name); # Call _init for the parent class
            this.routine = routine;
        }
    }

    var alice: Programmer = Programmer("Alice", ["code", "sleep"]);
    print(alice.name); # Alice