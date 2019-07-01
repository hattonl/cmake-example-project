# 这一行功能在确定目前使用的 CMake 版本符合需求，
# 当版本不满足最低需求时会发出错误讯息。
cmake_minimum_required(VERSION 2.6)

set(CMAKE_VERBOSE_MAKEFILE ON)

# 这一行指定专案的名称，指定专案名称最主要的目的在于启用几个和环境相关的变数，另外也会在 
# makefile 增加对应的 target。在这个简单的专案里并不会去利用这些变数，
# 所以对建置没有任何影响。
project(ex2)

# 这一行告诉 CMake 加入一个名为 ex2 之执行档 target，而且此执行档是由 main.c 和 
# calc.c 所编译成。在同一个 CMakeLists 里面可以加入多个不同的target，也不一定要 
# 和 project 同名。
# 当一个执行档所需的源代码很多时，可以透过变数在前面收集源代码列表，之后再用 
# add_executable() 加入。
# 如果加入了 EXCLUDE_FROM_ALL 表示此 target 不会在 make all 时主动建置，
# 必须在 make 时手工指明或者是当其他 target 提出依赖需求时才会被建置。
add_executable(ex2 main.c calc.c)


