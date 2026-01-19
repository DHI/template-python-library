# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a template Python library repository designed to be forked/used as a starting point for new Python packages. The library uses modern Python packaging standards with `hatchling` as the build backend.

**Important naming distinction:**
- **Package name** (used in imports): `my_library` (defined in `pyproject.toml` under `tool.hatch.build.targets.wheel.packages`)
- **PyPI project name** (used for pip install): Can be different from package name (defined in `project.name`)

## Development Commands

### Testing and Quality Checks

```bash
# Run linting (uses ruff)
make lint

# Format code (uses ruff)
make format

# Run type checking (uses mypy)
make typecheck

# Run all tests
make test

# Run docstring tests (examples in docstrings)
make doctest

# Run all checks (lint, typecheck, test, doctest)
make check

# Generate coverage report (creates htmlcov/ directory)
make coverage
```

### Building and Documentation

```bash
# Build the package (runs typecheck and test first)
make build

# Build documentation (uses mkdocs)
make docs

# Clean build artifacts
make clean
```

### Running Individual Tests

```bash
# Run a single test file
pytest tests/test_basic.py

# Run a specific test function
pytest tests/test_basic.py::test_module_docstring

# Run with coverage for specific module
pytest --cov=my_library tests/
```

## Code Quality Standards

### Before Committing

1. **Run ruff check** to catch linting errors that would fail CI:
   ```bash
   ruff check .
   ```

2. **Run ruff format** if the project uses ruff for formatting:
   ```bash
   ruff format .
   ```

### Ruff Configuration

- Configured in `pyproject.toml` under `[tool.ruff]`
- Long lines (E501) are ignored

### Type Checking

- Uses mypy with Python 3.11 target
- Configuration in `pyproject.toml` under `[tool.mypy]`
- `ignore_missing_imports = true` is set
- Run via `make typecheck` or `mypy my_library/`

## Package Structure

```
my_library/          # Main package code
├── __init__.py     # Package initialization and docstring
└── simulation.py   # Example module with Simulator class

tests/              # Test suite
├── __init__.py
├── test_basic.py   # Basic tests
└── data/           # Test data files

docs/               # MkDocs documentation
notebooks/          # Jupyter notebooks
```

## Documentation

- Uses **MkDocs** with **Material theme**
- Configured via `mkdocs.yml`
- Uses **mkdocstrings** plugin for API documentation from docstrings
- **Docstring style: NumPy** (not Google)
- Docstrings should include executable examples that are tested with `make doctest`

## CI/CD

### GitHub Actions Workflows

1. **full_test.yml**: Runs on push/PR to main
   - Tests on Ubuntu and Windows
   - Tests Python 3.11
   - Runs: ruff linting, typecheck, pytest, doctest
   - Uses `make` commands for consistency

2. **docs.yml**: Builds and publishes documentation

3. **python_publish.yml** and **python_publish_test.yml**: Package publishing workflows

## Python Version Support

- **Minimum Python version**: 3.11 (defined in `requires-python`)
- CI tests on Python 3.11 only

## Dependencies

- **Runtime**: numpy
- **Development**: build, pytest, ruff, mypy, mkdocs, mkdocstrings, mkdocs-material
- **Testing**: pytest, pytest-cov, mypy
- **Notebooks**: jupyter

Install development dependencies:
```bash
pip install -e .[dev]
```
