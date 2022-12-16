import os

os.environ["OKFP_ROOT"] = "C:/Users/sean9/Downloads/FrontPanelUSB"

import logging
import sys
from ece437.ok import OKFrontPanel
from ece437.presets import CMV300_SPI_ENDPOINTS, CMV300_DATA_ENDPOINTS
from ece437.spi import SPIController
from ece437.sensor import CMV300
import cv2

def setup_logger(level=logging.WARNING):
    logger = logging.getLogger()
    logger.handlers.clear()

    # format
    formatter = logging.Formatter("[%(asctime)s] [%(levelname)s] %(message)s")

    # add stream handler
    handler = logging.StreamHandler(sys.stdout)
    handler.setFormatter(formatter)
    logger.addHandler(handler)

    # enable all logging level
    logger.setLevel(level)


def main():
    setup_logger(logging.DEBUG)

    path = "C:/Users/sean9/ECE437/Final/Final.runs/impl_1/final_top.bit"
    fp = OKFrontPanel(firmware_path=path)

    with fp:
        spi = SPIController(fp, CMV300_SPI_ENDPOINTS)
        camera = CMV300(fp, spi, CMV300_DATA_ENDPOINTS)

        with spi, camera:
            while True:
                frame = camera.get_image_array()
                cv2.imshow('Frame', frame)

                if cv2.waitKey(25) & 0xFF == ord('q'):
                    break
            cv2.destroyAllWindows()

if __name__ == "__main__":
    main()
