
default:
		@echo; echo "Actions: test | lint | all"; echo
		
all: lint test

test:
		@./node_modules/.bin/vows --spec test/unit.js
      
lint:
		@./node_modules/.bin/jshint -c jshint.json lib/shortcode-parser.js test/unit.js
		
.PHONY: test