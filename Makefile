################################################################################
#                               rstats-logreader                               #
#   Parse RStats logfiles, display bandwidth usage, convert to other formats   #
#                       (C) 2016, 2019-2020 Jeremy Brown                       #
#       Released under version 3.0 of the Non-Profit Open Source License       #
################################################################################

.POSIX:

CI_OPTIONS="--cov-report xml --hypothesis-profile ci"

.PHONY: test ci-test build

clean:
	rm -rf .coverage coverage.xml .eggs/ .hypothesis/ .pytest_cache/ *egg-info/ dist/ build/
	find . -name __pycache__ -exec rm -rf {} +
	find . -name *.pyc -exec rm -rf {} +

test:
	python -B setup.py test

ci-test:
	python setup.py test --addopts ${CI_OPTIONS}

build:
	python -m pep517.build -sb .
