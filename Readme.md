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
// npm install gulp gulp-sass browser-sync --save-dev

var gulp = require('gulp'),
    sass = require('gulp-sass'),
    browserSync = require('browser-sync').create();

    // Static Server + watching scss/html files
    gulp.task('serve', ['sass'], function() {

    	browserSync.init({
    		proxy: 'http://bs4:8888/',
    		files: [
    			// Patterns for static files to watch.
    			// We're watching js and php files within the app folder
    			// and SilverStripe template files within themes
    			"app/**/*.php",
                "public/css/*.css",
    			"themes/bs4/templates/**/*.ss"
    		],
            notify: false,
    		browser: "google chrome",
    		port: 3003,
            open: "local",
            online: false
    	});

    	gulp.watch("./themes/bs4/scss/*.scss", ["sass"]);
    	gulp.watch("./themes/bs4/templates/**/*.ss").on('change', browserSync.reload);
    	gulp.watch("./app/**.*").on('change', browserSync.reload);
        gulp.watch("./public/css/*.css").on('change', browserSync.reload);
    });

    // Compile sass into CSS & auto-inject into browsers
    gulp.task('sass', function() {
    	return gulp.src([
            "./themes/bs4/scss/main.scss",
            "./themes/bs4/scss/editor.scss"
        ])
    		.pipe(sass().on('error', sass.logError))
    		.pipe(gulp.dest("./public/css"))
    		.pipe(browserSync.stream());
    });

    gulp.task('default', ['serve']);
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
* SS 4.1 & Bootstrap 4.1.1
* First release with bootstrap#v4.0.0-alpha.5

## License
[MIT](LICENSE)
