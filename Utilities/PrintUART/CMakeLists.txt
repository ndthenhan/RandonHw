add_library(uartrintf STATIC
    #Src/itm.c
    #Src/retarget.c
    Src/printUART.c

)

target_link_libraries(uartrintf PUBLIC stm32cubemx)

target_include_directories(uartrintf PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/Inc
)