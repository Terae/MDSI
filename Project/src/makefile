.DEFAULT_GOAL := all

check-xml:
	@xmllint --xinclude INSA.xml > INSA.generated.xml
	@xmllint --schema INSA.xsd INSA.generated.xml > /dev/null

xsd:
	@$(MAKE) BASE_NAME=INSA check-xml > /dev/null
	@$(MAKE) BASE_NAME=Personnes check-xml > /dev/null
	@$(MAKE) BASE_NAME=Departements check-xml > /dev/null
	@$(MAKE) BASE_NAME=Epreuves check-xml > /dev/null
	@$(MAKE) BASE_NAME=Cours check-xml > /dev/null
	@$(MAKE) BASE_NAME=Semestres check-xml > /dev/null
	@$(MAKE) BASE_NAME=Epreuves check-xml > /dev/null
	@$(MAKE) BASE_NAME=Specialites check-xml > /dev/null
	@$(MAKE) BASE_NAME=UF check-xml > /dev/null
	@$(MAKE) BASE_NAME=Competence check-xml > /dev/null

generate-xsl:
	xsltproc $(BASE_NAME).xml -output $(BASE_NAME).html
	firefox $(BASE_NAME).html

xsl:
	@$(MAKE) BASE_NAME=INSA generate-xsl > /dev/null

all: check-xml xsl
