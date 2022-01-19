# Fake Stack Exchange redirect

This extension automatically redirects the user from websites displaying translated Stack Exchange questions to the corresponding Stack Exchange forum (e.g. StackOverflow), on the original question page.

These websites are filled with advertisements and they just collect Stack Exchange questions in bulk to translate them automatically in various languages. Only a few of these fake websites mention the original source, so it's sometimes difficult to find the real Stack Exchange page. Moreover, the link that redirects to the original page is often not working properly.

Successfully tested on Firefox 96 and Edge 97.

Currently, only QA Stack is supported. Compatibility will be extended to more websites soon.

## Download and install

Download this extension from [Firefox Add-ons](https://addons.mozilla.org/firefox/addon/fake-stackexchange-redirect/)

For other browsers, the unsigned extension is also available in the [releases](https://github.com/y0lopix/fake-stackexchange-redirect/releases/latest).


## Build

### Prerequisites

- GNU Make
- [Oxipng](https://github.com/shssoichiro/oxipng) (to optimize icons)
- Inkscape (to create PNG icons for Chromium browsers)
- Info-ZIP's Zip (to pack files in a zip file)
- web-ext (to check the validity of the source)

### Build the extension

```sh
make
```

The extension will be built in the `out` folder.
