CMake Experimental Features Guide
*********************************

The following is a guide to CMake experimental features that are
under development and not yet included in official documentation.
See documentation on `CMake Development`_ for more information.

.. _`CMake Development`: README.rst

Features are gated behind ``CMAKE_EXPERIMENTAL_`` variables which must be set
to specific values in order to enable their gated behaviors. Note that the
specific values will change over time to reinforce their experimental nature.
When used, a warning will be generated to indicate that an experimental
feature is in use and that the affected behavior in the project is not part of
CMake's stability guarantees.

Export Package Dependencies
===========================

In order to activate support for this experimental feature, set

* variable ``CMAKE_EXPERIMENTAL_EXPORT_PACKAGE_DEPENDENCIES`` to
* value ``1942b4fa-b2c5-4546-9385-83f254070067``.

This UUID may change in future versions of CMake.  Be sure to use the value
documented here by the source tree of the version of CMake with which you are
experimenting.

When activated, this experimental feature provides the following:

* The ``install(EXPORT)`` and ``export(EXPORT)`` commands have experimental
  ``EXPORT_PACKAGE_DEPENDENCIES`` arguments to generate ``find_dependency``
  calls automatically.

* Details of the calls may be configured using the ``export(SETUP)``
  command's ``PACKAGE_DEPENDENCY`` argument.

* The package name associated with specific targets may be specified
  using the ``CMAKE_EXPORT_FIND_PACKAGE_NAME`` variable and/or
``EXPORT_FIND_PACKAGE_NAME`` target property.

Export |CPS| Package Information
================================

In order to activate support for this experimental feature, set

* variable ``CMAKE_EXPERIMENTAL_EXPORT_PACKAGE_INFO`` to
* value ``b80be207-778e-46ba-8080-b23bba22639e``.

This UUID may change in future versions of CMake.  Be sure to use the value
documented here by the source tree of the version of CMake with which you are
experimenting.

When activated, this experimental feature provides the following:

* The experimental ``install(PACKAGE_INFO)`` command is available to export
  package information in the |CPS|_ format.

Find/Import |CPS| Packages
==========================

In order to activate support for this experimental feature, set

* variable ``CMAKE_EXPERIMENTAL_FIND_CPS_PACKAGES`` to
* value ``e82e467b-f997-4464-8ace-b00808fff261``.

This UUID may change in future versions of CMake.  Be sure to use the value
documented here by the source tree of the version of CMake with which you are
experimenting.

When activated, this experimental feature provides the following:

* The :command:`find_package` command will also search for packages which are
  described using |CPS|_. Refer to the :command:`find_package` documentation
  for details.

C++ ``import std`` support
==========================

In order to activate support for ``import std`` in C++23 and newer targets,
set

* variable ``CMAKE_EXPERIMENTAL_CXX_IMPORT_STD`` to
* value ``d0edc3af-4c50-42ea-a356-e2862fe7a444``.

This UUID may change in future versions of CMake.  Be sure to use the value
documented here by the source tree of the version of CMake with which you are
experimenting.  It must be set before the ``CXX`` toolchain is discovered by
CMake, usually as part of a :command:`project` call.

When activated, this experimental feature provides the following:

* The :prop_tgt:`CXX_MODULE_STD` target property and its initializing variable
  :variable:`CMAKE_CXX_MODULE_STD`.

* Targets with the property set to a true value and at least ``cxx_std_23``
  may use ``import std;`` in any scanned C++ source file.

.. _CPS: https://cps-org.github.io/cps/
.. |CPS| replace:: Common Package Specification

Build database support
======================

In order to activate support for exporting build databases, set

* variable ``CMAKE_EXPERIMENTAL_EXPORT_BUILD_DATABASE`` to
* value ``73194a1d-c0b5-41b9-9190-a4512925e192``.

This UUID may change in future versions of CMake.  Be sure to use the value
documented here by the source tree of the version of CMake with which you are
experimenting.

When activated, this experimental feature provides the following:

* The :prop_tgt:`EXPORT_BUILD_DATABASE` target property and its initializing
  variable :variable:`CMAKE_EXPORT_BUILD_DATABASE` and environment variable
  :envvar:`CMAKE_EXPORT_BUILD_DATABASE`.

* Targets with the property set to a true value will have their C++ build
  information exported to the build database.

Instrumentation
===============

In order to activate support for the :command:`cmake_instrumentation` command,
set

* variable ``CMAKE_EXPERIMENTAL_INSTRUMENTATION`` to
* value ``d16a3082-c4e1-489b-b90c-55750a334f27``.

To enable instrumentation at the user-level, files should be placed under
either
``<CMAKE_CONFIG_DIR>/instrumentation-d16a3082-c4e1-489b-b90c-55750a334f27`` or
``<CMAKE_BINARY_DIR>/.cmake/instrumentation-d16a3082-c4e1-489b-b90c-55750a334f27``.

To include instrumentation data in CTest XML files (for submission to CDash),
you need to set the following environment variables:

* ``CTEST_USE_INSTRUMENTATION=1``
* ``CTEST_EXPERIMENTAL_INSTRUMENTATION=d16a3082-c4e1-489b-b90c-55750a334f27``
