.DEFAULT_GOAL := all

check-xml:
	xmllint --schema INSA.xsd $(BASE_NAME).xml

xml:
	@$(MAKE) BASE_NAME=Departements check-xml > /dev/null

all: xml
