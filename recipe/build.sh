#!/bin/bash
set -eo pipefail

cmake ${CMAKE_ARGS} -S . -B build -DCMAKE_INSTALL_PREFIX="${PREFIX}"
cmake --build build --parallel "${CPU_COUNT}"
cmake --install build

# The Python module is a plain directory; upstream doesn't install it.
mkdir -p "${SP_DIR}/RooUnfold"
cp -r python/. "${SP_DIR}/RooUnfold/"
find "${SP_DIR}/RooUnfold" -name __pycache__ -prune -exec rm -rf {} +
