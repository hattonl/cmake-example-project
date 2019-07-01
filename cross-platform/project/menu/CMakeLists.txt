project (menu)

include_directories ("${CMAKE_CURRENT_SOURCE_DIR}/include")
aux_source_directory (./src DIR_SRCS)
add_library (menu ${DIR_SRCS})
target_link_libraries (menu pthread)


#add_executable (menu_server_test menu_server_test.c)
#target_link_libraries (menu_server_test menu pthread)
