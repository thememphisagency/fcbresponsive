#fcbResponsive

Responsive framework for FarCry

## Buildtools

### CSS

We're using [COMPASS][compass]. Make sure you have compass installed before getting started.

If you recieve an error when compiling with compass about not finding the modular-scale package, please run this command in your command panel.

	gem install modular-scale

### JS

We're using [FUSE][fuse] to compile JavaScript. Make sure you have Fuse installed before getting started.

### Building fcbresponsive

You can issue the following lines on your terminal (individual terminal sessions):

	compass watch
	fuse -i ./js/fcbResponsive.js -o ./js/fcbResponsive.min.js

OR

You can use cake with coffeescript and run one command:

	cake build

This will start both compass and fuse, and output any messages from either program to the console. Please note, you must have node.js installed, and also have the [coffee-script][csp] package installed and setup (global mode).

[csp]: https://npmjs.org/package/coffee-script
[compass]: http://compass-style.org/
[fuse]: https://github.com/smebberson/fuse