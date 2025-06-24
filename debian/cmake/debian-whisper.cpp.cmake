# install common
install(DIRECTORY ${CMAKE_BINARY_DIR}/examples/ DESTINATION lib/${CMAKE_LIBRARY_ARCHITECTURE}/whisper.cpp/common FILES_MATCHING PATTERN "libcommon*.a" )
install(DIRECTORY ${CMAKE_SOURCE_DIR}/examples/ DESTINATION include/whisper.cpp/common FILES_MATCHING PATTERN "common*.h" )

