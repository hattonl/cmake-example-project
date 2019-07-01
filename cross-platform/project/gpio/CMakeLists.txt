project (gpio)

include_directories ("${CMAKE_CURRENT_SOURCE_DIR}/include")
aux_source_directory (./src DIR_SRCS)

add_library (gpio ${DIR_SRCS})
target_link_libraries (gpio pthread)
