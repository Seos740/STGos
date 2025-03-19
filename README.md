# StanleyOS

Welcome to StanleyOS, an operating system built around the power and simplicity of low-mode and high-mode scripting. StanleyOS is designed to give you full control over hardware with low-mode while providing simplicity and flexibility with high-mode scripts, all tailored to the unique **Stanley the Great** experience.

## Overview

StanleyOS is a pre-built custom operating system that comes with two modes:
- **Low-mode**: Direct access to the hardware with full control over the system's resources. Ideal for users who need precise hardware manipulation.
- **High-mode**: A more user-friendly environment that abstracts low-level complexities, allowing for easier development with high-level commands. High-mode scripts are automatically converted to low-mode for maximum control when necessary.

The high-mode interpreter is built within low-mode, making it easy to transition between the two as needed.

## Features

- **Low-mode for hardware control**: Direct access to the system’s hardware for advanced users.
- **High-mode for simplicity**: Write high-level scripts for easier development. These can be automatically converted into low-level operations.
- **Dual-mode conversion**: High-mode scripts can be converted to low-mode for efficient performance.
- **Pre-built OS**: StanleyOS is already built and ready to go, so you can start exploring immediately.

## Getting Started

To get started with StanleyOS, follow these simple steps:

### Prerequisites

- A x64 environment (bare-metal or emulator).
- An emulator like **QEMU** or **Bochs**.
- The **StanleyOS** disk image file.

### Running StanleyOS

StanleyOS is pre-built and ready to run! To get started, you simply need to boot from the pre-built image.

1. Download the `stanleyos.img` file from the releases page.
2. Run the OS on your preferred emulator (e.g., **QEMU**, **Bochs**) or create a bootable USB drive.

To run StanleyOS in **QEMU**, use the following command:

qemu-system-x86_64 -drive file=stanleyos.img,format=raw


This will boot into the system, where you can begin running **low-mode** and **high-mode** scripts.

## Writing Scripts

### Low-mode Script (Assembly)

Low-mode scripts are written directly in assembly and are ideal for advanced users who want control over hardware. 

High-mode Script (StanleyScript)
High-mode scripts are written in StanleyScript, a custom language designed for simplicity. Below is an example of printing "Hello, Stanley!" to the screen:


print("Hello, Stanley!")

High-mode scripts are converted to low-mode for execution when needed, combining the ease of high-level scripting with the power of low-level hardware control.

Contributing
Feel free to contribute to the development of StanleyOS by submitting bug reports, feature requests, or pull requests. You can find open issues and more information about contributing in the Issues section of the repository.

Code of Conduct
We expect all contributors to adhere to the StanleyOS Code of Conduct (CODE_OF_CONDUCT.md).

License
StanleyOS is released under the MIT License. See the LICENSE file for details.










