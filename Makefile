TYPST ?= typst
ENTRY ?= report.typ
OUTPUT_DIR ?= output
OUTPUT ?= $(OUTPUT_DIR)/report.pdf

.PHONY: all compile prepare watch help

all: compile

prepare:
	@command -v $(TYPST) >/dev/null 2>&1 || { echo "Error: Typst is not installed or not on PATH."; exit 1; }
	@mkdir -p $(OUTPUT_DIR)
	@find "$(OUTPUT_DIR)" -mindepth 1 -maxdepth 1 -exec rm -rf -- {} +

compile: prepare
	@echo "Compiling"
	@$(TYPST) compile $(ENTRY) $(OUTPUT)
	@echo "Done: $(OUTPUT)"

watch: prepare
	@$(TYPST) watch $(ENTRY) $(OUTPUT)

help:
	@echo "make           Compile the report"
	@echo "make compile   Compile the report"
	@echo "make watch     Recompile whenever a source file changes"
	@echo "make ENTRY=... Compile a different Typst entry point"
