cmake_minimum_required(VERSION 3.10)
project(Lpk)
add_executable(Lpk lpk.c)
find_package(LAPACK)
