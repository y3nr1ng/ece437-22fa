from abc import ABCMeta
from PySide2.QtCore import QObject

class AbstractQObject(type(QObject), ABCMeta):
    """
    Wrapper for QObject that includes ABC definitions.
    
    Reference:
        - [can't use ABC with PySide2](https://bugreports.qt.io/browse/PYSIDE-1434)
    """
