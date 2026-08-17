# Repository Guidelines

## Project Structure & Module Organization

This is a C++17 computer vision playground project built with CMake. Public headers live under `include/visionlab/`, implementation files live in `src/`, and unit tests live in `test/src/`. CMake helper modules are in `cmake/`, with test registration in `test/CMakeLists.txt`. GitHub Actions workflows for Linux, macOS, Windows, and releases are under `.github/workflows/`.

Keep public APIs in `include/visionlab/` and put private implementation details in `src/`. When adding new source or header files, update `cmake/SourcesAndHeaders.cmake` so CMake includes them.

## Build, Test, and Development Commands

- `cmake -B build` configures a default Debug build.
- `cmake --build build --config Debug` builds the library and `visionlab` app.
- `./build/bin/Debug/visionlab` runs the local executable after a Debug build.
- `cmake -B build -Dvisionlab_ENABLE_UNIT_TESTING=1` configures tests.
- `cmake --build build --config Release && cd build && ctest -C Release -VV` builds and runs tests.
- `make test` performs a clean Release test run.
- `make format` runs the CMake `clang-format` target.
- `make docs` generates Doxygen HTML documentation.

## Coding Style & Naming Conventions

Use C++17 and follow the repository `.clang-format` configuration: Google base style, Allman braces, 2-space indentation, no short one-line functions, and a 125-column limit. Run formatting before submitting changes.

Use snake_case for files and directories. Public headers should use the project include path, for example `#include "visionlab/tmp.hpp"`. Prefer small, testable functions and keep namespace usage explicit.

## Testing Guidelines

Tests use GoogleTest by default. Place tests in `test/src/` and name files with a `_test.cpp` suffix, such as `tmp_test.cpp`. Each test source is converted into a CTest entry by `test/CMakeLists.txt`; use descriptive `TEST(SuiteName, CaseName)` names.

Add or update tests for behavior changes. For coverage locally, run `make coverage` with GCC-compatible coverage tools installed.

## Commit & Pull Request Guidelines

Recent commits use short Conventional Commit-style prefixes, such as `feat:`, `docs:`, and `chore:`. Keep messages imperative and scoped to one logical change.

Pull requests should describe the change, why it is needed, how it was tested, and any linked issue. Include screenshots only for user-visible UI or documentation rendering changes. Ensure CI-relevant commands, especially tests and formatting, pass before requesting review.

## Agent-Specific Instructions

Do not overwrite unrelated local changes. Keep edits focused, avoid in-source CMake builds, and prefer existing CMake options and helper modules over adding parallel build logic.
