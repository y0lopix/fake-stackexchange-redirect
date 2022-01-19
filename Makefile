NAME=fake-stackexchange-redirect
OUT_DIR=out
CONTENTS=$(addprefix $(OUT_DIR)/, manifest.json main.js icon-48.png icon-96.png)

.PHONY: clean check build
.SECONDARY: $(OUT_DIR)/icon-48_unoptimized.png $(OUT_DIR)/icon-96_unoptimized.png

build: $(OUT_DIR)/$(NAME).zip

$(OUT_DIR)/$(NAME).zip: $(CONTENTS)
	zip -FSj $@ $^
	
$(OUT_DIR)/icon-%_unoptimized.png: icon.svg $(OUT_DIR)
	inkscape -w $* -h $* -o $@ $<

$(OUT_DIR)/icon-%.png: $(OUT_DIR)/icon-%_unoptimized.png
	oxipng -o max --strip all -Z --out $@ $<

$(OUT_DIR)/%.js: %.js $(OUT_DIR)
	terser -cm --mangle-props --toplevel -o $@ $<

$(OUT_DIR)/%.json: %.json $(OUT_DIR)
	jq -c . < $< > $@

$(OUT_DIR):
	mkdir $@

clean:
	rm -rf $(OUT_DIR)
	
check:
	web-ext lint
