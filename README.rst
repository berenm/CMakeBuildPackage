Automatic build script for modern CMake and modern C/C++
===============================================================================

CONVENTION OVER CONFIGURATION
-------------------------------------------------------------------------------

This script assumes a conventional source tree for C++ projects:

- All sources to be compiled are assumed to be found in an ``src`` folder.

- All public header files to be installed are assumed to be found in an
  ``include`` folder.

- All source files that contains a main function are assumed to be compiled
  to executables of the same name as the source file.

- All other sources are assumed to be compiled together to a library of the
  name of the folder containing them, or the name of the package itself.


USAGE
-------------------------------------------------------------------------------

1. Download or update CMakeBuildPackage.cmake:

.. code:: bash

  wget https://git.io/CMakeBuildPackage.cmake

2. Download a sample CMakeLists.txt file:

.. code:: bash

  wget https://git.io/CMakeLists.txt

2. (bis) Or add the required lines to your CMakeLists.txt:

.. code:: cmake

  list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}")
  include(CMakeBuildPackage)
  build_package(NAME foo VERSION x.x.x)

3. Commit both files, as well as the automatically generated
   ``<package>-config.cmake`` and ``<package>-config-version.cmake``.


LICENSE
-------------------------------------------------------------------------------

 This is free and unencumbered software released into the public domain.

 See accompanying file UNLICENSE or copy at http://unlicense.org/UNLICENSE
