.DEFAULT_GOAL := all

check-xml:
	xmllint --schema INSA.xsd $(BASE_NAME).xml

xml:
	@$(MAKE) BASE_NAME=Personnes check-xml > /dev/null
	@$(MAKE) BASE_NAME=Departements check-xml > /dev/null
	@$(MAKE) BASE_NAME=Epreuves check-xml > /dev/null
	@$(MAKE) BASE_NAME=Cours check-xml > /dev/null
	@$(MAKE) BASE_NAME=UF check-xml > /dev/null
	@$(MAKE) BASE_NAME=Semestres check-xml > /dev/null
	@$(MAKE) BASE_NAME=Epreuves check-xml > /dev/null

all: xml
