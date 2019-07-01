project (cmake_test)

###################### sub dir #######################
add_subdirectory (${CMAKE_CURRENT_SOURCE_DIR}/menu)
add_subdirectory (${CMAKE_CURRENT_SOURCE_DIR}/network)
add_subdirectory (${CMAKE_CURRENT_SOURCE_DIR}/camera)
add_subdirectory (${CMAKE_CURRENT_SOURCE_DIR}/can)
add_subdirectory (${CMAKE_CURRENT_SOURCE_DIR}/gpio)

###################### include dir #######################
# include_directories (${CMAKE_CURRENT_SOURCE_DIR}/include)
include_directories (${CMAKE_CURRENT_SOURCE_DIR}/menu/include)
include_directories (${CMAKE_CURRENT_SOURCE_DIR}/network/include)
include_directories (${CMAKE_CURRENT_SOURCE_DIR}/camera/include)
include_directories (${CMAKE_CURRENT_SOURCE_DIR}/can/include)
include_directories (${CMAKE_CURRENT_SOURCE_DIR}/gpio/include)

###################### lib #######################
#set (LIB_LIST pthread network)
#set (LIB_LIST pthread camera)
#set (LIB_LIST pthread can)
#set (LIB_LIST pthread gpio)
set (LIB_LIST pthread network camera can gpio menu)

###################### main #######################
add_executable (cmake_test cmake_test.c)
target_link_libraries (cmake_test ${LIB_LIST})
