cmake_minimum_required(VERSION 3.10)

project(gobject C)

find_package(GTK2 COMPONENTS gtk REQUIRED)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

add_executable(gobject WIN32 main.c)
target_link_libraries(gobject GTK2::gobject)
