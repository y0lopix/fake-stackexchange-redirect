NAME=fake-stackexchange-redirect
OUT_DIR=out
CONTENTS=manifest.json main.js icon-48.png icon-96.png 
.PHONY: clean check

$(OUT_DIR)/$(NAME).zip: $(CONTENTS) $(OUT_DIR)
	zip -FSj $@ $^
	
icon-%_unoptimized.png: icon.svg
	inkscape -w $* -h $* $< -o $@

icon-%.png: icon-%_unoptimized.png
	oxipng -o max --strip all -Z --out $@ $<

$(OUT_DIR):
	mkdir $@

clean:
	rm -rf $(OUT_DIR)
	rm icon-*.png
	
check:
	web-ext lint
