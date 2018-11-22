.DEFAULT_GOAL := all

check-xml:
	xmllint --schema $(BASE_NAME).xsd $(BASE_NAME).xml

xml:
	@$(MAKE) BASE_NAME=Departements check-xml > /dev/null

all: xml
