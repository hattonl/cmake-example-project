cmake_minimum_required (VERSION 2.8)
project (faw_hwio_test)

message (STATUS "this cmake source dir is ${CMAKE_SOURCE_DIR}")


####detail
set (CMAKE_VERBOSE_MAKEFILE OFF)


###################### config define #######################
option (DEBUG_ON "Open debug mode" OFF)
if (DEBUG_ON)
add_definitions (-DDEBUG_ON)
endif (DEBUG_ON)


###################### compiler flags #######################
set (CMAKE_C_FLAGS "${CMAKE_CXX_FLAGS} -Wall -fno-strict-aliasing -Wno-deprecated-declarations -Wno-unused-local-typedefs -O3 -pthread -fopenmp")
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -fno-strict-aliasing -Wno-deprecated-declarations -Wno-unused-local-typedefs -std=c++11 -O3 -pthread -fopenmp")

if (CMAKE_CROSSCOMPILING)
    message (STATUS "use ${CMAKE_CXX_COMPILER}")
    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=armv8-a -mcpu=cortex-a53 -ftree-vectorize -ffast-math")
else ()
    message (STATUS "use ${CMAKE_CXX_COMPILER}")
endif ()


###################### sub dir #######################
# add_subdirectory (${CMAKE_SOURCE_DIR}/client)
add_subdirectory (${CMAKE_SOURCE_DIR}/project)


