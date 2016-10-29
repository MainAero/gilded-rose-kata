install: 
	pip install -r requirements.txt
test:
	coverage run --source '.' -m behave
test-with-coverage: test
	coverage report	
codeclimate: 
	codeclimate-test-reporter
codeclimate-dev:
	codeclimate analyze
