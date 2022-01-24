### VARIABLES

NAME := fake-stackexchange-redirect
OUT_DIR := out

# The list of all buildable variants
ALL_VARIANTS := firefox chromium

# Supported locales
LOCALES = en fr

# The files that should be the same for all variants
CONTENTS_BASE := main.js _locales/en/messages.json _locales/fr/messages.json

### TARGETS
.PHONY: clean check build all

# Make all variants
all: $(addprefix $(OUT_DIR)/$(NAME)-, $(addsuffix .zip, $(ALL_VARIANTS) ) )
	
# Final output ZIP: Firefox
$(OUT_DIR)/$(NAME)-firefox.zip: $(CONTENTS_BASE) icon.svg $(OUT_DIR)/firefox/manifest.json | _locales/en _locales/fr
	zip -9FS $@ $^

# Final output ZIP: Chromium (manifest v2 and v3)
$(OUT_DIR)/$(NAME)-chromium.zip: $(CONTENTS_BASE) $(OUT_DIR)/chromium/icon-48.png $(OUT_DIR)/chromium/icon-96.png $(OUT_DIR)/chromium/manifest.json
	zip -9FS $@ $^

# Specific manifest
$(OUT_DIR)/%/manifest.json: manifest.json manifest-%.json | $(OUT_DIR)/%
	jq -cs '.[0] * .[1]' $^ > $@

# PNG icons for Chromium
$(OUT_DIR)/chromium/icon-%.png: icon.svg
	inkscape -w $* -h $* -o $@ $<
	oxipng -o max --strip all -Z $@

# Minify JS
$(OUT_DIR)/%.js: %.js
	terser -cm --mangle-props --toplevel -o $@ $<
	
# Minify other JSON files
$(OUT_DIR)/%.json: %.json
	jq -c . < $< > $@

$(CONTENTS_BASE): | $(OUT_DIR) $(addprefix $(OUT_DIR)/_locales/, $(LOCALES))

# Directories
$(OUT_DIR) $(addprefix $(OUT_DIR)/, $(ALL_VARIANTS)) $(addprefix $(OUT_DIR)/_locales/, $(LOCALES)):
	mkdir -p $@

clean:
	rm -rf $(OUT_DIR)
