SHELL=bash

remove-virtualenvs:
	./scripts/remove-virtualenvs.sh

install-virtualenvs:
	./scripts/install-virtualenvs.sh development production testing

install-common-deps:
	sudo -E apt-get -y update
	sudo -E apt-get -y install python python-pip python-virtualenv python-dev apache2-utils
	
install-dev-deps: install-common-deps
install-prod-deps: install-common-deps
install-test-deps: install-common-deps

purge: clean remove-virtualenvs

clean:

run-dev:
	python MODULE/app.py
	
run-prod:
	uwsgi --wsgi-file MODULE/app.py --callable app --http :8000 --processes 10
	
test-pytest:
	py.test tests
	
test-tox:
	tox
	
doc:
	(sphinx-apidoc -o docs/api ./MODULE)
	(cd docs && make html)
	
doc-clean:
	(cd docs && make clean)
	(cd docs && rm -rf api)
