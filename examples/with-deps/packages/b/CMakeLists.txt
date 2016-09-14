cmake_minimum_required(VERSION 3.4)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}")
include(CMakeBuildPackage)

build_package(REQUIRES a)
