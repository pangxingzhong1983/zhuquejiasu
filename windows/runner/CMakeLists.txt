cmake_minimum_required(VERSION 3.14)
project(runner LANGUAGES CXX)

# Define the application target. To change its name, change BINARY_NAME in the
# top-level CMakeLists.txt, not the value here, or `flutter run` will no longer
# work.
#
# Any new source files that you add to the application should be added here.


add_executable(${BINARY_NAME} WIN32
  "flutter_window.cpp"
  "main.cpp"
  "utils.cpp"
  "win32_window.cpp"
  "${FLUTTER_MANAGED_DIR}/generated_plugin_registrant.cc"
  "Runner.rc"
  "runner.exe.manifest"
)

# Apply the standard set of build settings. This can be removed for applications
# that need different build settings.
apply_standard_settings(${BINARY_NAME})
# Add preprocessor definitions for the build version.
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION=\"${FLUTTER_VERSION}\"")
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION_MAJOR=${FLUTTER_VERSION_MAJOR}")
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION_MINOR=${FLUTTER_VERSION_MINOR}")
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION_PATCH=${FLUTTER_VERSION_PATCH}")
target_compile_definitions(${BINARY_NAME} PRIVATE "FLUTTER_VERSION_BUILD=${FLUTTER_VERSION_BUILD}")

# Disable Windows macros that collide with C++ standard library functions.
target_compile_definitions(${BINARY_NAME} PRIVATE "NOMINMAX")

# Add dependency libraries and include directories. Add any application-specific
# dependencies here.
target_link_libraries(${BINARY_NAME} PRIVATE flutter flutter_wrapper_app)
target_link_libraries(${BINARY_NAME} PRIVATE "dwmapi.lib")
target_include_directories(${BINARY_NAME} PRIVATE "${CMAKE_SOURCE_DIR}")

# Run the Flutter tool portions of the build. This must not be removed.
add_dependencies(${BINARY_NAME} flutter_assemble)

if(MSVC)
  set(_msvc_runtime_candidates)
  if(DEFINED ENV{VCToolsRedistDir} AND EXISTS "$ENV{VCToolsRedistDir}")
    file(GLOB _msvc_runtime_candidates
      "$ENV{VCToolsRedistDir}/x64/Microsoft.VC*.CRT/*.dll")
  else()
    set(_vswhere "C:/Program Files (x86)/Microsoft Visual Studio/Installer/vswhere.exe")
    if(EXISTS "${_vswhere}")
      execute_process(
        COMMAND "${_vswhere}" -latest -products * -property installationPath
        OUTPUT_VARIABLE _vs_install_path
        OUTPUT_STRIP_TRAILING_WHITESPACE
      )
      if(_vs_install_path)
        file(GLOB _msvc_runtime_candidates
          "${_vs_install_path}/VC/Redist/MSVC/*/x64/Microsoft.VC*.CRT/*.dll")
      endif()
    endif()
  endif()

  set(_msvc_runtime_names
    vcruntime140.dll
    vcruntime140_1.dll
    msvcp140.dll
    concrt140.dll
    vcomp140.dll
  )

  foreach(_runtime_name IN LISTS _msvc_runtime_names)
    set(_runtime_path "")
    foreach(_candidate IN LISTS _msvc_runtime_candidates)
      if(_candidate MATCHES "/${_runtime_name}$")
        set(_runtime_path "${_candidate}")
        break()
      endif()
    endforeach()

    if(NOT _runtime_path AND DEFINED ENV{SystemRoot})
      set(_candidate "$ENV{SystemRoot}/System32/${_runtime_name}")
      if(EXISTS "${_candidate}")
        set(_runtime_path "${_candidate}")
      endif()
    endif()

    if(_runtime_path)
      add_custom_command(
        TARGET ${BINARY_NAME} POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_if_different
          "${_runtime_path}"
          "$<TARGET_FILE_DIR:${BINARY_NAME}>"
      )
    else()
      message(WARNING "MSVC runtime ${_runtime_name} not found; installer may miss this dependency.")
    endif()
  endforeach()
endif()
