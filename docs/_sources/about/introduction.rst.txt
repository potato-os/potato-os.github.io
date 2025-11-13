Introduction
============

Welcome to the official documentation for PotatoOS, a "parasite" Operating System.

PotatoOS is a novel platform that provides a complete, modern desktop experience within the environment of your existing host operating system (Windows, macOS, Linux, etc.).

What is a "Parasite OS"?
------------------------

Unlike a traditional operating system that runs directly on bare hardware (bare-metal) or within a strictly isolated virtual machine (VM), **PotatoOS** runs as a single, full-screen application built using the `Godot Engine <https://godotengine.org>`_.

* Fullscreen Environment: PotatoOS takes over your screen, providing a cohesive desktop, window management, and application framework.
* Host Integration: It leverages the stability, drivers, and capabilities of your underlying host OS to handle low-level tasks like hardware access and networking.
* Safety & Simplicity: This architecture allows PotatoOS to be highly portable, easy to install, and reduces the complexity typically associated with low-level OS development.

Powered by STARCH
-----------------

The entire PotatoOS ecosystem, including the shell, system utilities, and core applications, is built and driven by the STARCH programming language.

STARCH is a modern, C-styled scripting language optimized for performance within the Godot runtime. Its primary function is to act as the native programming interface for PotatoOS, providing seamless, high-level access to all system functions (the STARCH System APIs).

Before you start
----------------

This documentation is organized to serve both **users** who want to use PotatoOS, and **developers** who want to build for it.

* Users: We recommend starting with the **Getting Started** section to learn how to install and navigate the system.
* Developers: Visit the **Developer Guide** to begin learning the STARCH language and interacting with the native PotatoOS System APIs.

In case you have trouble or want to connect with others, you can find help on the official `Discord <https://discord.gg/nxCDJM849e>`_ server 

PotatoOS is completely free and `open-source <https://github.com/the-potato-corp/potato-os>`_.