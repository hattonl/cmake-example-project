project (camera)

include_directories ("${CMAKE_CURRENT_SOURCE_DIR}/include")
aux_source_directory (./src DIR_SRCS)
add_library (camera ${DIR_SRCS})
target_link_libraries (camera pthread)


add_executable (camera_unit_test camera_unit_test.c)
target_link_libraries (camera_unit_test camera pthread)
