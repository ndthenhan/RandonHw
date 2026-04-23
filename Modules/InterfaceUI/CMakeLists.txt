add_library(userinterface STATIC
    #Src/itm.c
    Src/ConsoleInterface.c
    #Src/printUART.c

)

target_link_libraries(userinterface PUBLIC 
stm32cubemx
utilities
)


target_include_directories(userinterface PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/Inc
)