# AUTOGENERATED
if (TARGET simple::simple)
  return()
endif()
add_subdirectory("${CMAKE_CURRENT_LIST_DIR}"
  "${CMAKE_BINARY_DIR}/packages/simple" EXCLUDE_FROM_ALL)
message(STATUS "Found simple ${simple_VERSION} (source)")
