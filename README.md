# Fake Stack Exchange redirect

This extension automatically redirects the user from websites displaying translated Stack Exchange questions to the corresponding Stack Exchange forum (e.g. Stack Overflow), on the original question page.

These websites are filled with advertisements and they just collect Stack Exchange questions in bulk to translate them automatically in various languages. Only a few of these fake websites mention the original source, so it's sometimes difficult to find the real Stack Exchange page. Moreover, the link that redirects to the original page is often not working properly.

Successfully tested on Firefox 96 and Edge 97.

Currently, only QA Stack is supported. Compatibility will be extended to more websites soon.

## Download and install

Download this extension from [Firefox Add-ons](https://addons.mozilla.org/firefox/addon/fake-stackexchange-redirect/)

For other browsers (chromium-based), the extension (unsigned ZIP file) is also available in the [releases](https://github.com/y0lopix/fake-stackexchange-redirect/releases/latest). To install it, go to `chrome://extensions`, toggle the developer mode on and drag the ZIP file on the page. Note that it only seems to work on Linux. The extension will be available soon on the Chrome Web Store.

## Build instructions

### Prerequisites

Provided versions are for reference only, you can probably use any version of these programs.

- GNU Make 4.3
- [Oxipng](https://github.com/shssoichiro/oxipng) 5.0.1 (to optimize icons)
- Inkscape 1.1.1 (to create PNG icons for Chromium browsers)
- Info-ZIP's Zip 3.0 (to pack files in a zip file)
- [terser](https://github.com/terser/terser) 5.10.0 (to minify JS files)
- [jq](https://github.com/stedolan/jq) 1.6 (to minify JSON files)

### Build the extension

```sh
make all
```

Each variant of the extension extension will be built to `out/fake-stackexchange-redirect-VARIANT.zip`.
