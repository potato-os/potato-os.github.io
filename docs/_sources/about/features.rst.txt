Features
========

PotatoOS isn't a traditional operating system, which allows it to offer a distinct set of features focused on **portability, simplicity, and safety**. Our unique architecture, built on the Godot Engine and powered by the STARCH language, delivers capabilities that differentiate us from conventional OS installations.

Platform & Portability
----------------------

These features stem directly from the **Parasite OS** architecture:

* **Extreme Portability:** PotatoOS runs wherever the underlying Godot Engine can run (Windows, macOS, Linux, BSD, etc.). There are no complex bootloaders or virtualization requirements.
* **Simple Installation:** Installation is reduced to running a single application on the host system. This makes PotatoOS quick to set up, easy to update, and simple to remove.
* **Safety and Isolation:** By executing within the confines of a host application sandbox, PotatoOS cannot directly access or corrupt the host system's kernel or core files, offering an inherent layer of security.
* **Host System Integration:** PotatoOS safely interacts with the host machine's file system and peripherals, allowing users to access their existing data and hardware from within the PotatoOS environment.

The STARCH & Mash Ecosystem
----------------------------

These features highlight the core developer and user tools:

* **Native STARCH API:** The STARCH language is tightly integrated, providing a single, high-level programming interface (the STARCH System Calls) that translates complex OS tasks (like I/O and process management) into simple function calls.
* **Modern Language Design:** STARCH provides a familiar, C-styled syntax that is optimized for lightweight scripting within the OS environment.
* **The Mash Shell:** A powerful command-line interface intended for power users. It will feature familiar Bash-like syntax while leveraging STARCH scripting for advanced automation and system configuration.
* **Integrated Development Environment:** PotatoOS is planned to ship with everything needed to immediately start writing, testing, and running native STARCH applications.

User Experience
---------------

These are the expected qualities of the user interface:

* **Consistent Window Management:** A dedicated graphical environment for managing multiple application windows and views.
* **Virtual File System:** A logical, familiar Unix-like file structure (e.g., ``/home``, ``/bin``) that abstracts and maps cleanly to the host's actual storage locations.
* **Intuitive Configuration:** Simple tools or accessible configuration files for customizing the look, feel, and functionality of the OS.