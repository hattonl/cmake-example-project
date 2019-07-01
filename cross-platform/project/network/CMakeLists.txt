project (network)

include_directories ("${CMAKE_CURRENT_SOURCE_DIR}/include")

include_directories ("${CMAKE_CURRENT_SOURCE_DIR}/../menu/include")
# include_directories (${CMAKE_CURRENT_SOURCE_DIR}/../menu)

aux_source_directory (./src DIR_SRCS)
add_library (network ${DIR_SRCS})
target_link_libraries (network pthread menu)
