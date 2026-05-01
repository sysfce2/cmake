# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file LICENSE.rst or https://cmake.org/licensing for details.

include (Platform/Windows-PellesC)
__windows_compiler_pellesc(C)

set(CMAKE_C_COMPILE_OBJECT
  "<CMAKE_C_COMPILER> <DEFINES> <INCLUDES> <FLAGS> -Fo<OBJECT> -c <SOURCE>")

string(APPEND CMAKE_C_FLAGS_DEBUG_INIT " -Zi -Ob0")
string(APPEND CMAKE_C_FLAGS_RELEASE_INIT " -Ot -Ob2 -DNDEBUG=1")
string(APPEND CMAKE_C_FLAGS_RELWITHDEBINFO_INIT " -Zi -Ot -Ob1 -DNDEBUG=1")
string(APPEND CMAKE_C_FLAGS_MINSIZEREL_INIT " -Os -Ob1 -DNDEBUG=1")
