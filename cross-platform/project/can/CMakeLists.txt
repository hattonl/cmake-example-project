project (can)

include_directories ("${CMAKE_CURRENT_SOURCE_DIR}/include")

# include_directories ("${CMAKE_CURRENT_SOURCE_DIR}/../menu/include")
# include_directories (${CMAKE_CURRENT_SOURCE_DIR}/../menu)

aux_source_directory (./src DIR_SRCS)
add_library (can ${DIR_SRCS})
target_link_libraries (can pthread menu)


#add_executable (can_unit_test can_unit_test.c)
#target_link_libraries (can_unit_test can pthread)