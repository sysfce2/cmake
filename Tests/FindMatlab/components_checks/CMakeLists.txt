
cmake_minimum_required(VERSION 3.10)
enable_testing()
project(component_checks)

set(MATLAB_FIND_DEBUG TRUE)

if(NOT "${MCR_ROOT}" STREQUAL "")
    set(Matlab_ROOT_DIR "${MCR_ROOT}")
    if(NOT EXISTS "${MCR_ROOT}")
        message(FATAL_ERROR "MCR does not exist ${MCR_ROOT}")
    endif()
endif()

# the success of the following command is dependent on the current configuration:
# - on 32bits builds (cmake is building with 32 bits), it looks for 32 bits Matlab
# - on 64bits builds (cmake is building with 64 bits), it looks for 64 bits Matlab
find_package(Matlab REQUIRED COMPONENTS ENG_LIBRARY MAT_LIBRARY
                    OPTIONAL_COMPONENTS MAIN_PROGRAM)

message(STATUS "FindMatlab libraries: ${Matlab_LIBRARIES}")

matlab_add_mex(
    # target name
    NAME cmake_matlab_test_wrapper1
    # output name
    OUTPUT_NAME cmake_matlab_mex1
    SRC ${CMAKE_CURRENT_SOURCE_DIR}/../matlab_wrapper1.cpp
    DOCUMENTATION ${CMAKE_CURRENT_SOURCE_DIR}/../help_text1.m.txt
    LINK_TO ${Matlab_LIBRARIES}
    )
