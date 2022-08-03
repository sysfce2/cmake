try_run(RUN_RESULT COMPILE_RESULT
  ${CMAKE_CURRENT_BINARY_DIR}/CMakeTmp ${CMAKE_CURRENT_SOURCE_DIR}/src.c
  RUN_OUTPUT_VARIABLE RUN_OUTPUT
  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/CMakeTmp/workdir
  )

if(RUN_RESULT)
  message(SEND_ERROR "try run failed with result: ${RUN_RESULT}")
endif()
