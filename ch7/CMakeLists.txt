cmake_minimum_required(VERSION 2.8)
project(vo1)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_BUILD_TYPE "Release")
add_definitions("-DENABLE_SSE")
set(CMAKE_CXX_FLAGS "-O2 ${SSE_FLAGS} -msse4")
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
#set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

#find_package(OpenCV 3 REQUIRED)
#find_package(OpenCV 4 REQUIRED COMPONENTS opencv_core opencv_imgproc opencv_imgcodecs CONFIG )
find_package(OpenCV 4 REQUIRED)
MESSAGE("G2O_ROOT_PRE: ${G2O_ROOT}")
find_package(G2O REQUIRED)
find_package(Sophus REQUIRED)
find_package(FMT REQUIRED)


MESSAGE("G2O_ROOT: ${G2O_ROOT}")
include_directories(
        ${OpenCV_INCLUDE_DIRS}
        ${G2O_INCLUDE_DIR}
        ${Sophus_INCLUDE_DIR}
        "/usr/include/eigen3/"
        "/usr/local/fmt/include"
        "/usr/local/fmt"
)
MESSAGE("Sophus_FOUND:${Sophus_FOUND}")
MESSAGE("G2O_INCLUDE_DIR: ${G2O_INCLUDE_DIR}")
MESSAGE("OpenCV_INCLUDE_DIRS: ${OpenCV_INCLUDE_DIRS}")
MESSAGE("Sophus_INCLUDE_DIR: ${Sophus_INCLUDE_DIR}")
MESSAGE("OpenCV_LIBS: ${OpenCV_LIBS}")
MESSAGE("G2O_CORE_LIBRARY: ${G2O_CORE_LIBRARY}")
MESSAGE("FMT_FOUND: ${FMT_FOUND}")

add_executable(orb_cv orb_cv.cpp)
target_link_libraries(orb_cv ${OpenCV_LIBS})

add_executable(orb_self orb_self.cpp)
target_link_libraries(orb_self ${OpenCV_LIBS})

# add_executable( pose_estimation_2d2d pose_estimation_2d2d.cpp extra.cpp ) # use this if in OpenCV2 
add_executable(pose_estimation_2d2d pose_estimation_2d2d.cpp)
target_link_libraries(pose_estimation_2d2d ${OpenCV_LIBS})

# # add_executable( triangulation triangulation.cpp extra.cpp) # use this if in opencv2
add_executable(triangulation triangulation.cpp)
target_link_libraries(triangulation ${OpenCV_LIBS})

link_directories("/usr/local/fmt/lib")
add_executable(pose_estimation_3d2d pose_estimation_3d2d.cpp)
target_link_libraries(pose_estimation_3d2d
        ${G2O_CORE_LIBRARY} ${G2O_STUFF_LIBRARY} fmt
        ${OpenCV_LIBS})

link_directories("/usr/local/fmt/lib")
add_executable(pose_estimation_3d3d pose_estimation_3d3d.cpp)
target_link_libraries(pose_estimation_3d3d
        ${G2O_CORE_LIBRARY} ${G2O_STUFF_LIBRARY} fmt
        ${OpenCV_LIBS})
