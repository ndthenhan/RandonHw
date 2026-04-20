# App/CMakeLists.txt
# High-level application layer

# 1. Add all submodules inside App/
add_subdirectory(Itm)
#add_subdirectory(App2)
# add_subdirectory(App3)
# add_subdirectory(App4)
# ...

# 2. Create a combined "app_layer" interface library
#    This represents the entire application layer.
add_library(utilities INTERFACE)

# 3. Link all App modules into the app_layer
target_link_libraries(utilities INTERFACE
    itmprintf
    # app2
    # app3
    # app4
)

# 4. Export include paths for the whole App layer (optional)
target_include_directories(utilities INTERFACE
    ${CMAKE_CURRENT_SOURCE_DIR}
)

# 5. Inherit HAL/CMSIS (optional but recommended)
target_link_libraries(utilities INTERFACE
    stm32cubemx
)