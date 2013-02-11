#fcbResponsive

Responsive framework for FarCry

## CSS & JS Preprocessing

### CSS

We use [COMPASS](http://compass-style.org/).

To compile the scss to css, navigate to the root folder for the project:

	compass watch [DIRECTORY]

If you would like to compile the scss with with the debug info for easy css debuging in chrome

	compass watch [DIRECTORY] --debug-info

If you recieve an error when compiling with compass about not finding the modular-scale package, please run this command in your command panel.

	gem install modular-scale

### JS

We use [FUSE](https://github.com/smebberson/fuse)

To compile the javascript files, navigate to the /js folder and run:


	fuse -i fcbResponsive.js -o fcbResponsive.min.js
