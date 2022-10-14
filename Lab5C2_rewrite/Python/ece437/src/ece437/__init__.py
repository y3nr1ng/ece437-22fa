import os
import sys

# attempt to discover fp api
OKFP_ROOT = 'C:/Program Files/Opal Kelly/FrontPanelUSB'
OKFP_PYTHON_ROOT = OKFP_ROOT + 'Python/3.4/x64'
if not os.path.exists(OKFP_PYTHON_ROOT):
    raise RuntimeError('unable to find FrontPanel API')
sys.path.append(OKFP_PYTHON_ROOT)
