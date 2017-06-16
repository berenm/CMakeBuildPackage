cmake_minimum_required(VERSION 3.4)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}")
include(CMakeBuildPackage)

build_package(NAME a)
add_package_options(a
  OPTION A_ENABLE_FEATURE   "Super feature disabled by default" OFF
  OPTION A_FEATURE_RENDERER "Internal switch for the feature"   "ONE" "ONE;TWO;THREE"
)
