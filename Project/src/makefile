.DEFAULT_GOAL := all
.PHONY: check-xml xsd generate-xsl xsl-to-html clean all

# Generates a unique XML file and validates it.
validates-xml:
	@xmllint --xinclude INSA.xml > INSA.generated.xml
	@xmllint --schema INSA.xsd INSA.generated.xml > /dev/null

# Generates the HTML file associated to the given XSL file.
# This target is called by `generate-all-html`.
HTML_DIR=html
xsl-to-html:
	mkdir -p $(HTML_DIR)
	xsltproc -o $(HTML_DIR)/$(BASE_NAME).html $(BASE_NAME).xsl INSA.generated.xml
	firefox $(HTML_DIR)/$(BASE_NAME).html

# Generate all HTML files using available XSL files.
XSL_FILES=$(wildcard *.xsl)
generate-all-html:
	@echo "Generation of HTML files"
	@$(foreach file, $(XSL_FILES), $(MAKE) BASE_NAME=$(basename $(file)) xsl-to-html > /dev/null;)

clean:
	@rm -rf $(HTML_DIR) INSA.generated.xml

all: clean validates-xml generate-all-html
