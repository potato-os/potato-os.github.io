Design Philosophy
=================

PotatoOS was designed around a set of core principles that prioritize developer experience, portability, and simplicity over traditional low-level hardware control. These principles explain the *why* behind the architecture and the role of the STARCH language.

The Three Pillars
-----------------

The entire design of PotatoOS rests on three foundational pillars:

1. **Maximum Portability, Minimum Effort**
    We fundamentally rejected the complexity of bare-metal operating system development. By running on the **Godot Engine**, PotatoOS inherits cross-platform compatibility, meaning it runs wherever Godot does (Windows, macOS, Linux, etc.) without requiring complex kernel recompilation or device drivers. The goal is an **instant, zero-friction** environment.

2. **Simplicity through Abstraction**
    We aim to eliminate traditional OS complexity for both the user and the developer.
    
    * **For Users:** Installation is reduced to running a single application file, and the file system (PotatoFS) is clean, familiar, and fully self-contained.
    * **For Developers:** We abstract away low-level C and assembly code by making the **STARCH language** the exclusive interface. Developers interact with the system via a consistent set of high-level STARCH System Calls, removing the need to manage complex threads, memory, and hardware protocols.

3. **STARCH-Native Consistency**
    The entire operating system—from the core shell (Mash) to the system utilities—is built using STARCH. This commitment ensures a single, unified codebase and guarantees that any STARCH program benefits from **deep, native integration** with all PotatoOS services and APIs. The language is not a secondary choice; it is the **defining feature** of the development environment.

Design Decisions Explained
--------------------------

These philosophies led to specific technical choices:

* **The Parasite Model:** Running within a host application (the "Parasite OS" model) provides inherent **sandboxing**. While PotatoOS applications can access files safely via data redirection, they cannot directly compromise the host's kernel, making the system safer by design.
* **The Mash Shell:** The command-line environment is designed for **familiarity and extension**. It will adopt a largely Bash-compatible syntax to ease migration for power users, while also offering direct execution of STARCH scripts for advanced system configuration and scripting.
* **The File System:** **Potatofs** (``/system`` and ``/users``) is intentionally sparse and encapsulated. It avoids the clutter of standard Unix systems (like ``/dev`` or ``/proc``) because the host OS handles those low-level responsibilities, keeping the PotatoOS structure clean and focused on application data and configuration.