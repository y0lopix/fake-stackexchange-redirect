NAME := fake-stackexchange-redirect
OUT_DIR := out
CONTENTS := $(addprefix $(OUT_DIR)/, main.js manifest.json icon-48.png icon-96.png)

.PHONY: clean check build

build: $(OUT_DIR)/$(NAME).zip

$(OUT_DIR)/$(NAME).zip: $(CONTENTS)
	zip -9FSj $@ $^
	
$(OUT_DIR)/icon-%_unoptimized.png: icon.svg
	inkscape -w $* -h $* -o $@ $<

$(OUT_DIR)/icon-%.png: $(OUT_DIR)/icon-%_unoptimized.png
	oxipng -o max --strip all -Z --out $@ $<

$(OUT_DIR)/%.js: %.js
	terser -cm --mangle-props --toplevel -o $@ $<

$(OUT_DIR)/%.json: %.json
	jq -c . < $< > $@
	
$(CONTENTS): | $(OUT_DIR)

$(OUT_DIR):
	mkdir $@

clean:
	rm -rf $(OUT_DIR)
	
check:
	web-ext lint
