import logging
from PySide2.QtWidgets import QWidget, QVBoxLayout
from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg
import matplotlib.pyplot as plt
import numpy as np
from typing import Tuple

__all__ = ["MplCanvasWidget", "MplImageWidget"]

logger = logging.getLogger(__name__)


class MplCanvasWidget(QWidget):
    """
    A widget with matplotlib figure and a pair of empty axes.
    
    Args:
        dpi (int, optional): DPI of the figure
    """

    def __init__(self, shape: Tuple[int, int]=(4, 3), dpi: int = 100) -> None:
        super().__init__()

        self.figure = plt.Figure(figsize=shape, dpi=dpi)
        self.axes = plt.Axes(self.figure, (0, 0) + shape[::-1])
        self.axes.set_aspect(aspect=1)
        self.figure.add_axes(self.axes)

        # add everything to this widget
        self.canvas = FigureCanvasQTAgg(self.figure)
        layout = QVBoxLayout(self)
        layout.addWidget(self.canvas)


class MplImageWidget(MplCanvasWidget):
    def __init__(self, *args, cmap: str = "gray", **kwargs) -> None:
        super().__init__(*args, **kwargs)

        # do not show ticks and border
        self.axes.set_axis_off()

        empty_image_data = np.zeros((1, 1), np.uint8)
        self.image = self.axes.imshow(empty_image_data)
        self.image.set_cmap(cmap)
        self.image.set_clim(0, 255)