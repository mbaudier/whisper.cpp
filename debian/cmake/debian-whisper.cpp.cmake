cmake_minimum_required(VERSION 3.14) # for add_link_options and implicit target directories.

include(GNUInstallDirs)
include(CMakePackageConfigHelpers)

# GGML dependencies
if (NOT TARGET ggml)
# libggml-base as external library
find_library(GGML_BASE_LOCATION ggml-base)
message (STATUS "Found GGML base library: ${GGML_BASE_LOCATION}") 
add_library(ggml-base SHARED IMPORTED GLOBAL)
set_target_properties(ggml-base PROPERTIES IMPORTED_LOCATION ${GGML_BASE_LOCATION})

# libggml as external library
# defines GGML as target so that it is disabled in whisper.cpp build
find_library(GGML_LOCATION ggml)
message (STATUS "Found GGML library: ${GGML_LOCATION}") 
add_library(ggml SHARED IMPORTED GLOBAL)
set_target_properties(ggml PROPERTIES IMPORTED_LOCATION ${GGML_LOCATION})
# transitive dependency
target_link_libraries(ggml INTERFACE ${GGML_BASE_LOCATION})
endif()

add_compile_definitions(NDEBUG)


# install common
install(DIRECTORY ${CMAKE_BINARY_DIR}/examples/ DESTINATION lib/${CMAKE_LIBRARY_ARCHITECTURE}/whisper.cpp/common FILES_MATCHING PATTERN "libcommon*.a" )
install(DIRECTORY ${CMAKE_SOURCE_DIR}/examples/ DESTINATION include/whisper.cpp/common FILES_MATCHING PATTERN "common*.h" )

