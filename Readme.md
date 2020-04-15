# ssBootstrap4

A [Bootstrap 4](http://getbootstrap.com/) / [HTML5 Boilerplate](http://html5boilerplate.com/) sticky footer theme for [SilverStripe 4](http://www.silverstripe.org/).  Uses [Sass](http://sass-lang.com/documentation/_index.html) for CSS and [Bower](http://bower.io) to upgrade libraries.

## Aims
* to be able to upgrade Bootstrap and other javascript libraries to the latest version using Bower
* to use the Sass for the generation of CSS (including customisations)
* to minimise bloat by commenting out Bootstrap's javascript and Sass files

## Instructions
1. Download and copy the `bs4` folder, under themes, into your `themes` folder
2. Set the theme to `'bs4'` in your `themes.yml` file
3. Open `app/PageController.php` and add
```php
    use SilverStripe\View\Requirements;
    ...
    Requirements::css("public/css/main.css");

    Requirements::combine_files(
        'combine.js',
        [
            'thirdparty/bower_components/jquery/dist/jquery.js',
            'thirdparty/bower_components/popper.js/dist/umd/popper.min.js',
            'thirdparty/bower_components/bootstrap/js/dist/alert.js',
            'thirdparty/bower_components/bootstrap/js/dist/button.js',
            'thirdparty/bower_components/bootstrap/js/dist/carousel.js',
            'thirdparty/bower_components/bootstrap/js/dist/collapse.js',
            'thirdparty/bower_components/bootstrap/js/dist/dropdown.js',
            'thirdparty/bower_components/bootstrap/js/dist/modal.js',
            'thirdparty/bower_components/tether/dist/js/tether.js',
            'thirdparty/bower_components/bootstrap/js/dist/tooltip.js', // requires tether
            'thirdparty/bower_components/bootstrap/js/dist/popover.js', // requires tooltip
            'thirdparty/bower_components/bootstrap/js/dist/scrollspy.js',
            'thirdparty/bower_components/bootstrap/js/dist/tab.js',
            'thirdparty/bower_components/bootstrap/js/dist/toast.js',
            'thirdparty/bower_components/bootstrap/js/dist/util.js'
        ]
    );
```
4. At the command line cd to `/public/thirdparty/` and `bower install bootstrap tether popper.js jquery --save`
5. Run `/dev/build`.
6. Optional
 * Favicon/icon: upload your icon through http://realfavicongenerator.net/ and copy the generated icons to your project root.

## Requirements
Use software to convert Sass into CSS.  Gulp example below includes browser-sync for page reloading.
```js
// npm install gulp gulp-sass gulp-sourcemaps gulp-if gulp-autoprefixer browser-sync --save-dev

const { gulp, watch, series, parallel, src, dest } = require('gulp');
const sass = require('gulp-sass');
const sourcemaps = require("gulp-sourcemaps");
const gulpif = require('gulp-if');
const autoprefixer = require('gulp-autoprefixer');

// Browser Sync (https://www.browsersync.io/docs/gulp)
const browserSync = require('/usr/local/lib/node_modules/browser-sync').create();

/**
 * Static Server + watching scss/html files
 */
function serve() {

	// Serve files from the root of this project
	// https://www.browsersync.io/docs/options
	browserSync.init({
		proxy: PROXY_URL,
		files: [
			// Patterns for static files to watch.
			// We're watching js and php files within mysite
			// and SilverStripe template files within themes
            "app/**/*.*",
            "public/css/*.css",
            "public/javascript/*.js",
			"themes/bs4/**/*.**"
		],
		notify: false,
		browser: "google chrome",
		port: 3003,
        open: "local",
        online: false
	});

    watch("./themes/bs4/scss/*.scss", sassTask);
	watch("./themes/bs4/templates/**/*.ss").on('change', browserSync.reload);
    watch("./app/src/**/*.php").on('change', browserSync.reload);
	watch("./public/javascript/dist/*.js").on('change', browserSync.reload);
};

/**
 * [sassTask description]
 * @return {function} [description]
 */
function sassTask() {
	return src(["./themes/bs4/scss/main.scss"])
		.pipe(gulpif(!isLive, sourcemaps.init()))
		.pipe(sass().on('error', sass.logError))
		.pipe(autoprefixer({
            browsers: [
                "IE >= 11",
                "Edge >= 16",
                "chrome >= 49",
                "firefox >= 58",
                "safari >= 11",
                "ios_saf >= 10.3",
                "samsung >= 4",
                "and_chr >= 64",
                "and_uc >= 11.8"
            ]
        }))
		.pipe(gulpif(!isLive, sourcemaps.write()))
		.pipe(dest("./public/css"))
		.pipe(browserSync.stream());
};

exports.sass = series(sassTask);
exports.serve = series(sassTask, serve);
```

## Structure of the theme's Sass files
* Bootstrap's base variables are overridden by `custom.scss`.
* File `main.scss` adds additional customisations

## Useful Pattern
 A pattern that can be used is to copy Bootstrap's style, in a new class, and customise.  Example below.
 ```css
    .current {
        @extend .active;
    }
 ```

## Changelog
* Upgraded Bootstrap to 4.4
* SS 4.1 & Bootstrap 4.1.1
* First release with bootstrap#v4.0.0-alpha.5

## License
[MIT](LICENSE)
