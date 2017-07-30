.PHONY: docs

run-tests:
	pipenv run pytest tests
init:
	python setup.py install
	pipenv install --dev
docs:
	cd docs && make html
	cd docs && make man
release: docs
	mkdir man
	cp docs/_build/man/pipenv.1 man
	python setup.py publish

