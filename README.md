#fcbResponsive

Responsive framework for FarCry

## CSS & JS Preprocessing

### CSS

We use SASS & [COMPASS](http://compass-style.org/).

To compile the scss to css, navigate to the root folder for the project and run the following in your CLI:

	sass --compass --sourcemap --watch scss/fcbResponsive.scss:css/fcbResponsive.css

This will generate a css sourcemap for chrome.

### JS

We use [FUSE](https://github.com/smebberson/fuse)

To compile the javascript files, navigate to the /js folder and run:


	fuse -i fcbResponsive.js -o fcbResponsive.min.js
