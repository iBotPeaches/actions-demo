import tempfile

import nox


nox.options.sessions = "lint", "mypy", "tests"

locations = "src", "tests", "noxfile.py"
