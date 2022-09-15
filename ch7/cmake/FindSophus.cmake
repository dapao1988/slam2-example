# Find the header files
SET(Sophus_ROOT /usr/local/Sophus)

FIND_PATH(Sophus_INCLUDE_DIR sophus/se3.hpp
  ${Sophus_ROOT}/include
  $ENV{Sophus_ROOT}/include
  $ENV{Sophus_ROOT}
  /usr/local/include
  /usr/include
  /opt/local/include
  /sw/local/include
  /sw/include
  NO_DEFAULT_PATH
  )

# Macro to unify finding both the debug and release versions of the
# libraries; this is adapted from the OpenSceneGraph FIND_LIBRARY
# macro.

MACRO(FIND_Sophus_LIBRARY MYLIBRARY MYLIBRARYNAME)

  FIND_LIBRARY("${MYLIBRARY}_DEBUG"
    NAMES "Sophus_${MYLIBRARYNAME}_d"
    PATHS
    ${Sophus_ROOT}/lib/Debug
    ${Sophus_ROOT}/lib
    $ENV{Sophus_ROOT}/lib/Debug
    $ENV{Sophus_ROOT}/lib
    NO_DEFAULT_PATH
    )

  FIND_LIBRARY("${MYLIBRARY}_DEBUG"
    NAMES "Sophus_${MYLIBRARYNAME}_d"
    PATHS
    ~/Library/Frameworks
    /Library/Frameworks
    /usr/local/lib
    /usr/local/lib64
    /usr/lib
    /usr/lib64
    /opt/local/lib
    /sw/local/lib
    /sw/lib
    )
  
  FIND_LIBRARY(${MYLIBRARY}
    NAMES "Sophus_${MYLIBRARYNAME}"
    PATHS
    ${Sophus_ROOT}/lib/Release
    ${Sophus_ROOT}/lib
    $ENV{Sophus_ROOT}/lib/Release
    $ENV{Sophus_ROOT}/lib
    NO_DEFAULT_PATH
    )

  FIND_LIBRARY(${MYLIBRARY}
    NAMES "Sophus_${MYLIBRARYNAME}"
    PATHS
    ~/Library/Frameworks
    /Library/Frameworks
    /usr/local/lib
    /usr/local/lib64
    /usr/lib
    /usr/lib64
    /opt/local/lib
    /sw/local/lib
    /sw/lib
    )
  
  IF(NOT ${MYLIBRARY}_DEBUG)
    IF(MYLIBRARY)
      SET(${MYLIBRARY}_DEBUG ${MYLIBRARY})
    ENDIF(MYLIBRARY)
  ENDIF( NOT ${MYLIBRARY}_DEBUG)
  
ENDMACRO(FIND_Sophus_LIBRARY LIBRARY LIBRARYNAME)

# Find the core elements
FIND_Sophus_LIBRARY(Sophus_STUFF_LIBRARY stuff)

SET(Sophus_FOUND "NO")
IF(Sophus_INCLUDE_DIR)
  SET(Sophus_FOUND "YES")
ENDIF(Sophus_INCLUDE_DIR)
MESSAGE("FindSophus.cmake Sophus_FOUND:${Sophus_FOUND}, Sophus_INCLUDE_DIR:${Sophus_INCLUDE_DIR}")
