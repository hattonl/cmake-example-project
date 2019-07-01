cmake_minimum_required(VERSION 2.6)
 
project(calc)
include_directories(${CMAKE_SOURCE_DIR})

# build

add_library(calc SHARED calc.c)
set_target_properties(calc
    PROPERTIES
    PUBLIC_HEADER "calc.h"
    )
   
add_library(calc-static STATIC calc.c)
set_target_properties(calc-static
    PROPERTIES
    OUTPUT_NAME   "calc"
    PREFIX        "lib"
    PUBLIC_HEADER "calc.h"
    )


# install
 
install(TARGETS calc calc-static
    RUNTIME DESTINATION calc/bin
    LIBRARY DESTINATION calc/lib
    ARCHIVE DESTINATION calc/lib
    PUBLIC_HEADER DESTINATION calc/include
    )

install(DIRECTORY ../src/ DESTINATION calc
    FILES_MATCHING PATTERN "*.txt"
    PATTERN "CMakeLists.txt" EXCLUDE
    )
