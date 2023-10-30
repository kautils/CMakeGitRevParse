macro(CMakeGitRevParse __hash)
    
    set(${PROJECT_NAME}_m_evacu ${m})
    set(m ${PROJECT_NAME}.CMakeGitRevParse)
    cmake_parse_arguments(${m} "" "VALUE;DIR" "" ${ARGN})
    list(APPEND ${m}_unsetter ${m}_VALUE ${m}_DIR)
    
    if(NOT DEFINED ${m}_DIR)
        set(${m}_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
    endif()
    
    list(APPEND ${m}_unsetter ${m}_res ${m}_err ${m}_out)
    execute_process(
        COMMAND git rev-parse "${${m}_VALUE}"
        RESULT_VARIABLE ${m}_res
        OUTPUT_VARIABLE ${__hash}
        ERROR_VARIABLE ${m}_err
        WORKING_DIRECTORY "${${m}_DIR}"
    )
    if(NOT ${${m}_res} EQUAL 0)
        message(FATAL_ERROR "fail to fetch commit hash of current HEAD")
    endif()

    # because the size of return value is 41, and this caused error when passing c/c++ via compile definition. 
    string(SUBSTRING "${${__hash}}" 0 40 ${__hash})

    foreach(__v ${${m}_unsetter})
        unset(${__v})
    endforeach()
    unset(${m}_unsetter)
    set(m ${${PROJECT_NAME}_m_evacu})
    
endmacro()
