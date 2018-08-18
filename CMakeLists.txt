cmake_minimum_required(VERSION 3.0)

project(cmake_project_template)

if (MSVC)
  if(CMAKE_CXX_FLAGS MATCHES "/W[0-4]")
    string(REGEX REPLACE "/W[0-4]" "/W4" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
  else()
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4")
  endif()
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /std:c++latest /WX /EHsc /nologo /Zc:wchar_t /Zc:forScope /Zc:inline /GS /D \"_UNICODE\" /D \"UNICODE\"")
    set(CMAKE_CXX_FLAGS_DEBUG "/Od /Zi /MTd /D \"_DEBUG\"")
    set(CMAKE_CXX_FLAGS_RELEASE "/O2 /Oi /MT /D \"NDEBUG\"")
else()
    set(CMAKE_CXX_FLAGS "-std=c++1z -Wall -Wextra -Werror")
    set(CMAKE_CXX_FLAGS_DEBUG "-O0 -g")
    set(CMAKE_CXX_FLAGS_RELEASE "-O2")
endif()

if (MSVC)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ../../bin)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ../../bin)
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG ../../lib)
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG ../../lib)
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE ../../lib)
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE ../../lib)
else()
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ../bin)
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ../lib)
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ../lib)
endif()

set(CMAKE_DEBUG_POSTFIX "d")

add_library(calc STATIC calc.cpp)

add_executable(cmake_project_template main.cpp)

target_link_libraries(cmake_project_template calc)
