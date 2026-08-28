TYPST ?= typst
ENTRY ?= report.typ
OUTPUT_DIR ?= output
OUTPUT ?= $(OUTPUT_DIR)/report.pdf

.PHONY: all compile watch help

all: compile

compile:
	@command -v $(TYPST) >/dev/null 2>&1 || { echo "Error: Typst is not installed or not on PATH."; exit 1; }
	@mkdir -p $(OUTPUT_DIR)
	@echo "Compiling"
	@$(TYPST) compile $(ENTRY) $(OUTPUT)
	@echo "Done: $(OUTPUT)"


watch:
	@command -v $(TYPST) >/dev/null 2>&1 || { echo "Error: Typst is not installed or not on PATH."; exit 1; }
	@mkdir -p $(OUTPUT_DIR)
	@$(TYPST) watch $(ENTRY) $(OUTPUT)

help:
	@echo "make           Compile the report"
	@echo "make compile   Compile the report"
	@echo "make watch     Recompile whenever a source file changes"
	@echo "make ENTRY=... Compile a different Typst entry point"
