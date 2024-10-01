LIB = my_library

check: lint typecheck test doctest

build: typecheck test
	python -m build

lint:
	ruff check $(LIB)

format:
	ruff format $(LIB)

test:
	pytest --disable-warnings

typecheck:
	mypy $(LIB)/ --config-file pyproject.toml

doctest:
	pytest --doctest-modules $(LIB)

coverage: 
	pytest --cov-report html --cov=$(LIB) tests/

docs: FORCE
	mkdocs build

FORCE: