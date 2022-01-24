NAME := fake-stackexchange-redirect

$(NAME).zip: icon-16.png icon-48.png icon-96.png icon-128.png manifest.json rules.json _locales/en/messages.json _locales/fr/messages.json
	zip -9FS $@ $^

icon-%.png: icon-%_unoptimized.png
	oxipng -o max --strip all -Z --out $@ $<

icon-128_unoptimized.png: icon-96_unoptimized.png
	convert $< -gravity center -background transparent -extent 128x128 $@

icon-%_unoptimized.png: icon.svg
	inkscape -w $* -h $* -o $@ $<
