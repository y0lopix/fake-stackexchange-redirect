### VARIABLES

NAME := fake-stackexchange-redirect
OUT_DIR := out

# The list of all buildable variants
ALL_VARIANTS := firefox chromium-v3 chromium-v2

# The files that should be the same for all variants
CONTENTS_BASE := $(OUT_DIR)/main.js

### TARGETS
.PHONY: clean check build all

# Make all variants
all: $(addprefix $(OUT_DIR)/$(NAME)-, $(addsuffix .zip, $(ALL_VARIANTS) ) )
	
# Final output ZIP: Firefox
$(OUT_DIR)/$(NAME)-firefox.zip: $(CONTENTS_BASE) icon.svg $(OUT_DIR)/firefox/manifest.json
	zip -9FSj $@ $^

# Final output ZIP: Chromium (manifest v2 and v3)
$(OUT_DIR)/$(NAME)-chromium%.zip: $(CONTENTS_BASE) $(OUT_DIR)/icon-48.png $(OUT_DIR)/icon-96.png $(OUT_DIR)/chromium%/manifest.json
	zip -9FSj $@ $^

# Specific manifest
$(OUT_DIR)/%/manifest.json: manifest.json manifest-%.json | $(OUT_DIR)/%
	jq -cs '.[0] * .[1]' $^ > $@

# PNG icons for Chromium
$(OUT_DIR)/icon-%.png: icon.svg
	inkscape -w $* -h $* -o $@ $<
	oxipng -o max --strip all -Z $@

# Minify JS
$(OUT_DIR)/%.js: %.js
	terser -cm --mangle-props --toplevel -o $@ $<

$(CONTENTS_BASE): | $(OUT_DIR)

$(OUT_DIR) $(addprefix $(OUT_DIR)/, $(ALL_VARIANTS)):
	mkdir $@

clean:
	rm -rf $(OUT_DIR)
