import os
import sys
from pathlib import Path

# add app module to the system path
sys.path.append(Path(__file__).parent)

# set secret key environment variable
os.environ['SECRET_KEY'] = 'test'