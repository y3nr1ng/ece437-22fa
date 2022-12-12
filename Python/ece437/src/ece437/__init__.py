import os
import sys

# attempt to discover fp api
OKFP_ROOT_DEFAULT = 'C:/Program Files/Opal Kelly/FrontPanelUSB'
OKFP_ROOT = os.environ.get('OKFP_ROOT', OKFP_ROOT_DEFAULT)
OKFP_PYTHON_ROOT = OKFP_ROOT + '/API/Python/3.6/x64'
if not os.path.exists(OKFP_PYTHON_ROOT):
    raise RuntimeError(f'unable to find FrontPanel API')
sys.path.append(OKFP_PYTHON_ROOT)
try:
    import ok
except ImportError:
    raise RuntimeError('unable to load FrontPanel API')