#!/usr/bin/env bash
set -e

cd imagery_utils
ln -s /testdata tests/testdata

echo "test data setup:"
tree -lh tests/testdata

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
# You will need to run the func tests to generate the output data needed for
# the unit tests. Run the NDVI test last, as it needs ortho and pansharpened
# imagery to create NDVI products

# func_test_mosaic.py, func_test_pansharpen.py, and func_test_ndvi.py, passed without any issues.
python tests/func_test_mosaic.py
python tests/func_test_pansharpen.py
python tests/func_test_ndvi.py

# func_test_ortho.py will pass, but does fail orthorectification on Ikonos images without a DEM, level 2A, and level 3* input images, which is expected. I now see there are a couple of DEMs hard-coded into PGC-specific paths, so any test looking for 'gimpdem_v2_30m.tif' or 'RAMPv2_wgs84_200m.tif' will fail. I can provide those if needed.
#python tests/func_test_ortho.py

# unit_test_ndvi.py, unit_test_taskhandler.py and unit_test_pansharpen.py passed without any issues.
python tests/unit_test_ndvi.py
python tests/unit_test_utils.py
python tests/unit_test_pansharpen.py

python tests/unit_test_mosaic.py

#unit_test_ortho_functions.py fails all of the TestOutputDataValues tests. Looking at the data, the output_static imagery has a jagged border, where the new output I generated with the latest code base does not. I clumsily did not save the logfile of the output_static images, so I am unsure of when these were generated. Regardless, the newer version is what we expect the output to look like, not like the output_static.
# python tests/unit_test_ortho_functions.py

# ==================================================================
