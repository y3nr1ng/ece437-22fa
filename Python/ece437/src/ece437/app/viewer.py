from .canvas import MplCanvas
import numpy as np
from ece437.ok import OKFrontPanel
from PySide2.QtWidgets import QWidget, QVBoxLayout
import matplotlib.pyplot as plt
from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg
import logging

__all__ = ["CameraViewerWidget"]

logger = logging.getLogger(__name__)


class MplCanvasWidget(QWidget):
    """
    A widget with matplotlib figure and a pair of empty axes.
    
    Args:
        dpi (int, optional): DPI of the figure
    """

    def __init__(self, dpi: int = 100) -> None:
        self.figure = plt.Figure(dpi=dpi)
        self.axes = plt.Axes(self.figure, [0, 0, 1, 1])
        self.figure.add_axes(self.axes)

        # add everything to this widget
        self.canvas = FigureCanvasQTAgg(self.figure)
        layout = QVBoxLayout(self)
        layout.addWidget(self.canvas)


class MplImageWidget(MplCanvas):
    def __init__(self, *args, cmap: str = "gray", **kwargs) -> None:
        super().__init__(*args, **kwargs)

        self.axes.axis("off")
        empty_image = np.zeros((1, 1), np.uint8)
        image_axes = self.axes.imshow(empty_image, aspect="equal")
        image_axes.set_cmap("gray")
        self.image_axes = image_axes


class CameraViewerWidget(MplImageWidget):
    """
    Args:
        fp (OKFrontPanel): the OK FP instance
        refresh_rate (float, optional): refresh rate in Hz
    """

    def __init__(
        self, fp: OKFrontPanel, *args, refresh_rate: float = 25, **kwargs
    ) -> None:
        super().__init__(*args, **kwargs)

        self._fp = fp

        self.setup_camera()

    def setup_camera(self) -> None:
        
