# a simple test case
cmake_minimum_required(VERSION 3.10)
project (OutOfSource)

add_subdirectory(SubDir)

get_directory_property(ANIMAL DIRECTORY OutOfSourceSubdir DEFINITION WEASELS)
get_directory_property(ANIMALREL DIRECTORY SubDir/../OutOfSourceSubdir DEFINITION WEASELS)
if(NOT "${ANIMAL}" STREQUAL "${ANIMALREL}")
  message(FATAL_ERROR "GET_DIRECTORY_PROPERTY does not seem to collapse paths.")
endif()

configure_file(
  ${OutOfSource_SOURCE_DIR}/testdp.h.in
  ${OutOfSource_BINARY_DIR}/SubDir/OutOfSourceSubdir/testdp.h
  )

set(KEN 1)

configure_file(SubInBuildCMakeLists.cmake ${CMAKE_CURRENT_BINARY_DIR}/SubInBuild/CMakeLists.txt COPYONLY)
add_subdirectory(${CMAKE_CURRENT_BINARY_DIR}/SubInBuild ${CMAKE_CURRENT_BINARY_DIR}/SubInBuild/Build)
