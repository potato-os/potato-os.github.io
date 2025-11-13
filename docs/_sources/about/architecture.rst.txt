Architecture
============

PotatoOS utilizes a novel **Parasite OS** architecture, built on a unique stack designed for maximum portability and simplicity. The system operates as a high-level abstraction layer that runs entirely within a host application, leveraging the underlying operating system for low-level resource management.

Design Stack
------------

The PotatoOS architecture is composed of four distinct layers:

1.  **Host Operating System (Base Layer):**
    The lowest layer is the host OS (Windows, macOS, Linux, etc.). It provides fundamental services that PotatoOS *does not* implement, including kernel management, device drivers, and core networking stacks.

2.  **Godot Runtime (The Container):**
    PotatoOS is built and packaged using the Godot Engine. The Godot runtime serves as the **virtual kernel**, managing resources like threading, graphics rendering, user input, and providing the sandboxed environment that ensures portability.

3.  **STARCH Interpreter & Core System:**
    This layer is the engine of the OS. It includes the STARCH interpreter, the core libraries, the window manager, and the system APIs (System Calls). All PotatoOS logic runs here, executed as STARCH code.

4.  **User Experience (Top Layer):**
    This includes the **Mash** shell (the primary command-line interface) and all bundled applications. These components are written in STARCH and communicate directly with the underlying STARCH System APIs.

File System Structure (PotatoFS)
--------------------------------

The file system, **PotatoFS**, is a virtual structure encapsulated within the host's file system (typically stored under a single Godot application directory like ``user://potatofs/``). This structure provides a familiar, Unix-like environment while maintaining ease of management.

All paths within PotatoOS begin at the virtual root (`/`). There are only two primary top-level directories, which are further subdivided for organization:

**1. /system**

This directory is critical and generally read-only for standard users.

* ``/system/bin``: Core executable STARCH scripts and the main **Mash** shell binary.
* ``/system/lib``: Core shared libraries, modules, and the STARCH Standard Library files necessary for execution.
* ``/system/etc``: System-wide configuration files (e.g., user profiles, system preferences).
* ``/system/app``: Pre-installed, bundled system applications (e.g., text editor, file browser).
* ``/system/host``: Non-STARCH executables that communicate with the host OS.

**2. /users**

This is the primary area for user-specific data, profiles, and local installations.

* ``/users/[username]``: The home directory for a specific user, including user-specific configuration.
* ``/users/[username]/desktop``: Files and shortcuts displayed on the user's graphical desktop.
* ``/users/[username]/apps``: Data, configuration, and local installs for user-specific applications.

Data Redirection
----------------

One of the most critical architectural components is **data redirection**.

When a STARCH program attempts a low-level operation (e.g., opening a file or creating a network socket) using a **STARCH System Call**, the call is intercepted by the STARCH interpreter. The interpreter then translates this high-level command into a native operation within the Godot runtime, which in turn interacts with the Host OS's file system or networking stack. This mechanism allows PotatoOS to manage its internal, encapsulated state while safely utilizing the hardware resources provided by the host.