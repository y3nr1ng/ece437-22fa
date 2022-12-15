import os

os.environ["OKFP_ROOT"] = "C:/Users/sean9/Downloads/FrontPanelUSB"

import PySide2

dirname = os.path.dirname(PySide2.__file__)
plugin_path = os.path.join(dirname, 'plugins', 'platforms')
os.environ['QT_QPA_PLATFORM_PLUGIN_PATH'] = plugin_path

import logging
import sys
from ece437.ok import OKFrontPanel
from ece437.app import MainWindow
from PySide2.QtWidgets import QApplication


def main():
    logger = logging.getLogger()
    logger.handlers.clear()

    # format
    formatter = logging.Formatter("[%(asctime)s] [%(levelname)s] %(message)s")

    # add stream handler
    handler = logging.StreamHandler(sys.stdout)
    handler.setFormatter(formatter)
    logger.addHandler(handler)

    # enable all logging level
    logger.setLevel(logging.INFO)

    path = "C:/Users/sean9/ECE437/Final/Final.runs/impl_1/final_top.bit"
    fp = OKFrontPanel(firmware_path=path)

    with fp:
        app = QApplication(sys.argv)
        w = MainWindow(fp)
        w.show()
        app.exec_()


if __name__ == "__main__":
    main()
