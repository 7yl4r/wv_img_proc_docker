#!/usr/bin/env bash
set -e

cd imagery_utils
ln -s /testdata tests/testdata

echo "python version:"
python --version
echo "gdal version:"
gdal-config --version

# PGC imagery_utils tests
# ==================================================================
# === publically-runnable tests
# ==================================================================
python tests/unit_test_taskhandler.py
# ==================================================================
# ==================================================================
# === (disabled) tests that require (non-public) `./tests/testdata/`
# ==================================================================
python tests/func_test_mosaic.py
python tests/func_test_ndvi.py
python tests/func_test_ortho.py
python tests/func_test_pansharpen.py
python tests/unit_test_mosaic.py
python tests/unit_test_ndvi.py
python tests/unit_test_ortho_functions.py
python tests/unit_test_pansharpen.py
python tests/unit_test_utils.py
# ==================================================================
