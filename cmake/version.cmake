find_package (Git)

if (GIT_FOUND)
	message("git found: ${GIT_EXECUTABLE} in version ${GIT_VERSION_STRING}")
	execute_process(
		COMMAND ${GIT_EXECUTABLE} describe --tags --abbrev=0
		OUTPUT_VARIABLE LAST_TAG)

	string (REGEX MATCHALL "([^/]+)[\^{}]\n" TEMP ${LAST_TAG})
	string (REGEX REPLACE "\n" ""  LAST_TAG ${TEMP})

	execute_process(
	    COMMAND ${GIT_EXECUTABLE} rev-parse --short HEAD
	    OUTPUT_VARIABLE COMMIT_HASH)

	string (REGEX MATCHALL "([^/]+)[\^{}]\n" TEMP ${COMMIT_HASH})
	string (REGEX REPLACE "\n" ""  COMMIT_HASH ${TEMP})

	message("git : ${LAST_TAG} @ ${COMMIT_HASH}")
	add_definitions(-D_GIT_HASH_=\"${COMMIT_HASH}\")
	add_definitions(-D_GIT_TAG_=\"${LAST_TAG}\" )
else()
	add_definitions(-DCOMMIT_HASH=hz)
	add_definitions(-DLAST_TAG=hz)
endif (GIT_FOUND)


string(TIMESTAMP _TIMESTAMP_)
add_definitions(-D_TIMESTAMP_=\"${_TIMESTAMP_}\" )

if(WIN32)
	set(OS_NAME WIN)
else()
	set(OS_NAME ${CMAKE_SYSTEM_NAME})
endif()

set(BIT_PLATFORM ${CMAKE_HOST_SYSTEM_PROCESSOR})

set(FULL_VERSION_NAME remcu-${MCU_NAME_LIB}-${MCU_VERSION_LIB}-${OS_NAME}-${BIT_PLATFORM}-${LAST_TAG}-${COMMIT_HASH}-${LICENSE_TYPE})