SET_SOURCE_FILES_PROPERTIES(
  ${MCU_OBJECT_FILE}
  PROPERTIES
  EXTERNAL_OBJECT true
  GENERATED true
  )


include(${REMCU_VM_PATH}/ir_test/IrTest.cmake)

SET_SOURCE_FILES_PROPERTIES(
  ${IR_TEST_OBJECT_FILE}
  PROPERTIES
  EXTERNAL_OBJECT true
  GENERATED true
  )

add_library(remcu SHARED ${MCU_OBJECT_FILE} ${IR_TEST_OBJECT_FILE} $<TARGET_OBJECTS:remcu_object>)

add_dependencies(remcu MCU_LIB)
add_dependencies(remcu IR_TEST_OBJ)
add_dependencies(remcu remcu_object)

set(ARCHIVE_FILES $<TARGET_FILE_NAME:remcu> 
  ${CMAKE_CURRENT_BINARY_DIR}/REMCU_LICENSE.txt ${ALL_INCLUDE_DIR} 
  ${CMAKE_CURRENT_BINARY_DIR}/README.txt)

file(INSTALL ${CMAKE_CURRENT_SOURCE_DIR}/README.txt
      DESTINATION ${CMAKE_CURRENT_BINARY_DIR}
      )

if (CMAKE_BUILD_TYPE STREQUAL "Release")
  add_custom_command(TARGET remcu POST_BUILD
      COMMAND ${STRIP_COMMAND} --strip-all $<TARGET_FILE_NAME:remcu>
      COMMAND ${CMAKE_COMMAND} -E tar cf ${FULL_ARCHIVE_NAME}.${ARCHIVE_SUFFIX} --format=${ARCHIVE_FORMAT} --
      ${ARCHIVE_FILES}
      WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
      COMMENT "--------------------------- Archive lib ---------------------------"
  )
endif()

if(WIN32)
  #target_compile_definitions(remcu PRIVATE _CRT_SECURE_NO_WARNINGS)
  target_link_libraries(remcu ws2_32)
endif()
