Introduction to STARCH
======================

Welcome to the **STARCH** development environment. STARCH is the high-level, C-styled programming language that powers all native applications and services within PotatoOS. Its design prioritizes consistency, simplicity, and deep integration with the core operating system kernel.

The STARCH Development Workflow
-------------------------------

.. warning::
   These features are planned, and are subject to change. 

All development on PotatoOS follows a unified, three-step workflow utilizing the built-in system tools:

1. **Write:** Use the graphical **Text Editor** (or a command-line editor like ``sted``) to create your application source file. All STARCH files use the ``.starch`` extension.
2. **Execute:** Execute the script directly using the **Mash** shell. The shell automatically invokes the **STARCH Interpreter** to execute your code.
3. **Debug:** Output, errors, and system warnings are handled by the **console** module and routed to the primary Mash terminal or a system log.

Example Execution from Mash:

.. code-block:: mash

    /users/alice/myscript.starch arg1 arg2
    /system/app/calculator

Core Concepts: Modularity and I/O
---------------------------------

Unlike traditional scripting languages with global I/O functions (like ``print()``), STARCH is built on a modular design, even for basic operations. This promotes cleaner code and better separation of concerns, especially for future graphical applications.

.. code-block:: starch
    
    using console;
    
    function main() {
        console.print("Welcome to STARCH!");
        let name = console.input("What is your name? ");
        console.print("Hello, " + name + ".");
    }

    main();

Next Steps
----------

The next page provides a detailed look at the fundamental building blocks of the language: :doc:`Language Syntax <syntax>`.