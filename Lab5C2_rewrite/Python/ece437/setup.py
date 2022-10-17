"""As of time of writing (06-2022), editable mode rquires a setuptools-based build."""
from setuptools import setup
setup(
    name = 'ece437',
    description = "Ensemble of tools for ECE437",
    version = "0.0.1",
    packages = ['ece437'],
    package_dir = {'': 'src'}
)