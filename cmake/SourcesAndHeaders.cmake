set(sources
    src/core/version_info.cpp
)

set(exe_sources
    src/main.cpp
    ${sources}
)

set(headers
    include/visionlab/version_info.hpp
)

set(test_sources
  src/version_test.cpp
)
