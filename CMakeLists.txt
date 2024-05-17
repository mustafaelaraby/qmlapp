cmake_minimum_required(VERSION 3.16)

project(poolwheel VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

file(GLOB_RECURSE SRC_FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp)
file(GLOB_RECURSE HEADER_FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/*.h)

message("========================================================")

message("Source files:")
set(SRC_COUNTER 1)
foreach(FILE ${SRC_FILES})
    message("${SRC_COUNTER}. ${FILE}")
    math(EXPR SRC_COUNTER "${SRC_COUNTER} + 1")
endforeach()

message("--------------------------------------------------------")

message("Header files:")
set(HEADER_COUNTER 1)
foreach(FILE ${HEADER_FILES})
    message("${HEADER_COUNTER}. ${FILE}")
    math(EXPR HEADER_COUNTER "${HEADER_COUNTER} + 1")
endforeach()

message("========================================================")

# Set the desired output directory for executables
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin)

list(APPEND CMAKE_PREFIX_PATH "D:\\Resources\\Qt\\6.7.1\\mingw_64")

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)


qt_add_executable(${PROJECT_NAME}
    MANUAL_FINALIZATION
    main.cpp ${SRC_FILES} resources.qrc
    ) 
    
# qt_policy(SET QTP0001 NEW)
# qt_add_qml_module(${PROJECT_NAME}
#     URI poolwheel
#     VERSION 1.0
#     QML_FILES
#         qml/main.qml
# )

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(${PROJECT_NAME} PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.apppoolwheel
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(${PROJECT_NAME}
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS ${PROJECT_NAME}
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

if(QT_VERSION_MAJOR EQUAL 6)
    qt_finalize_executable(${PROJECT_NAME})
endif()
