cmake_minimum_required(VERSION 3.14)

project(Tutorial LANGUAGES CXX )

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

option( strict_compile
    "Treat all warnings as errors." ON
    )

set( common_flags "-Wall" "-Wextra" "-Wpedantic" )
set( strict_flags "-Werror" "-Wno-unknown-warning-option" )
set( release_flags "-O3" )
set( debug_flags "-O0" "-g" )

configure_file(TutorialConfig.h.in TutorialConfig.h)
add_executable(Tutorial tutorial.cxx)
target_compile_options( Tutorial PRIVATE
	${common_flags}
	$<$<BOOL:${strict_compile}>:${strict_flags}>
	$<$<CONFIG:DEBUG>:${debug_flags}>
	$<$<CONFIG:RELEASE>:${release_flags}>
)
target_include_directories(Tutorial PUBLIC "${PROJECT_BINARY_DIR}")
