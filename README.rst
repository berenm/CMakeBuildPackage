Automatic build script for modern CMake and modern C/C++
===============================================================================

INTRODUCTION
-------------------------------------------------------------------------------

This script assumes a conventional source tree for C++ projects:

- All sources to be compiled are assumed to be found in an ``src`` folder.

- All public header files to be installed are assumed to be found in an
  ``include`` folder.

- All source files that contains a main function are assumed to be compiled
  to executables of the same name as the source file.

- All other sources are assumed to be compiled together to a library of the
  name of the folder containing them, or the name of the package itself.

- All other packages that one package depend on should be located in a
  ``packages`` folder.

BOOTSTRAP
-------------------------------------------------------------------------------

For a new package named *foo*:

.. code:: bash

  mkdir -p foo
  wget -Pfoo https://git.io/CMakeBuildPackage.cmake
  wget -Pfoo https://git.io/CMakeLists.txt
  cmake -Bfoo/build -Hfoo && cmake --build foo/build

The project is now ready to be committed:

.. code:: bash

  git init foo
  echo 'build/' > foo/.gitignore
  git -C foo add '*.cmake' 'CMakeLists.txt' '.gitignore'
  git -C foo commit -m 'Initial commit'

You can also edit the `CMakeLists.txt` to set the package name, version and
dependencies.

.. code:: cmake

  list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}")
  include(CMakeBuildPackage)

  build_package(NAME foo VERSION 1.0.6
    REQUIRES
      "boo"
      "bar>=1.2.3"
      "baz==3.2.1"
  )

OPTIONS
-------------------------------------------------------------------------------

Some package may offer build-time customization by defining compile time
options. Boolean options, as well as multi-value options are supported.

Options are passed the preprocessor as macros with the expected values, and the
prebuilt versions of the package will remember the options and their values,
and will expose them in the package public interface.

.. code:: cmake

  list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}")
  include(CMakeBuildPackage)

  build_package(NAME foo VERSION 1.0.6
    OPTIONS
      OPTION FOO_ENABLE_EXPERIMENTAL "Enable super experimental feature" OFF
      OPTION FOO_BACKEND             "Backend to compile for"            BAR "BAR;BAZ;BOO"
  )


UPDATE
-------------------------------------------------------------------------------

Download `CMakeBuildPackage.cmake` from the same URL as above, and rebuild once
before committing the changes:

.. code:: bash

  rm foo/CMakeBuildPackage.cmake
  wget -Pfoo https://git.io/CMakeBuildPackage.cmake
  cmake -Bfoo/build -Hfoo && cmake --build foo/build

  git -C foo add -u 'CMakeBuildPackage.cmake' 'foo-config*.cmake'
  git -C foo commit -m 'Update CMakeBuildPackage'


SYSTEM INTEGRATION
-------------------------------------------------------------------------------

Integration with system libraries and third-party libraries that are not using
CMakeBuildPackage is possible, but the implementation is still experimental.

An experimental meta-package is available in the `packages/system` folder, which
will be automatically included when available. This meta-package provides the
required bridges to make several system libraries available as requirements.

As a starting point, the https://github.com/berenm/cmake-build-package-system
repository can be used as a submodule in packages/system to bridge a few
libraries of your system into the packaging mechanism.

For example, assuming the `system` meta-package is correctly located, it should
be possible to import the *zlib*, *libpng* and some *Boost* libraries with
something like:

.. code:: cmake

  build_package(NAME foo VERSION 1.0.6
    REQUIRES
      "system" # to pull the bridges into the search scope
      "zlib"
      "libpng>=1.2.3"
      "boost==1.62.0"
      "boost::filesystem==1.62.0"
      "boost::atomic==1.62.0"
  )


LICENSE
-------------------------------------------------------------------------------

 This is free and unencumbered software released into the public domain.

 See accompanying file UNLICENSE or copy at http://unlicense.org/UNLICENSE
