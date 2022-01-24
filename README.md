# Fake Stack Exchange redirect

This extension automatically redirects the user from websites displaying translated Stack Exchange questions to the corresponding Stack Exchange forum (e.g. Stack Overflow), on the original question page.

These websites are filled with advertisements and they just collect Stack Exchange questions in bulk to translate them automatically in various languages. Only a few of these fake websites mention the original source, so it's sometimes difficult to find the real Stack Exchange page. Moreover, the link that redirects to the original page is often not working properly.

Successfully tested on Chromium 97.

Currently, only QA Stack is supported. Compatibility will be extended to more websites soon.

## Download and install

- For Firefox: download this extension from [Firefox Add-ons](https://addons.mozilla.org/firefox/addon/fake-stackexchange-redirect/)

- For other browsers (Chrome, Edge, Brave, Opera...): download this extension from the [Chrome Web Store](https://chrome.google.com/webstore/detail/hcgeihlgddmbcpjogjegnknjapcfhjnb)

## Build instructions

### Prerequisites

Provided versions are for reference only, you can probably use any version of these programs.

- GNU Make 4.3
- [Oxipng](https://github.com/shssoichiro/oxipng) 5.0.1 (to optimize icons)
- Inkscape 1.1.1 (to create PNG icons for Chromium browsers)
- Info-ZIP's Zip 3.0 (to pack files in a zip file)
- ImageMagick (to add padding to the 128px icon)

### Build the extension

```sh
make
```

The extension will be built as `fake-stackexchange-redirect.zip`
