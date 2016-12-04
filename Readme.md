# ssBootstrap4

A [Bootstrap 4](http://getbootstrap.com/) / [HTML5 Boilerplate](http://html5boilerplate.com/) sticky footer theme for [SilverStripe 4](http://www.silverstripe.org/).  Uses [Sass](http://sass-lang.com/documentation/_index.html) for CSS and [Bower](http://bower.io) to upgrade libraries.

## Aims
* to be able to upgrade Bootstrap and other javascript libraries to the latest version using Bower
* to use the Sass for the generation of CSS (including customisations)
* to minimise bloat by commenting out Bootstrap's javascript and Sass files

## Instructions
1. Download and copy the `bs4` folder, under themes, into your `themes` folder
2. Set `theme: 'bs4'` in your `config.yml` file
3. Open `mysite/Page.php` and add
```php
    use SilverStripe\View\Requirements;
    ...
    Requirements::combine_files(
        'combined.css',
         array(
            THEMES_DIR . '/bs4/css/main.css'
        )
    );

    Requirements::combine_files(
        'combine.js',
        [
            // jquery required for bs javascript
            'mysite/thirdparty/bower_components/jquery/dist/jquery.js',
            'mysite/thirdparty/bower_components/bootstrap/js/dist/alert.js',
            'mysite/thirdparty/bower_components/bootstrap/js/dist/button.js',
            'mysite/thirdparty/bower_components/bootstrap/js/dist/carousel.js',
            'mysite/thirdparty/bower_components/bootstrap/js/dist/collapse.js',
            'mysite/thirdparty/bower_components/bootstrap/js/dist/dropdown.js',
            'mysite/thirdparty/bower_components/bootstrap/js/dist/modal.js',
            'mysite/thirdparty/bower_components/tether/dist/js/tether.js',
            'mysite/thirdparty/bower_components/bootstrap/js/dist/tooltip.js', // requires tether
            'mysite/thirdparty/bower_components/bootstrap/js/dist/popover.js', // requires tooltip
            'mysite/thirdparty/bower_components/bootstrap/js/dist/scrollspy.js',
            'mysite/thirdparty/bower_components/bootstrap/js/dist/tab.js',
            'mysite/thirdparty/bower_components/bootstrap/js/dist/util.js'
        ]
    ); 
```
4. At the command line cd to `{project root}/mysite/thirdparty/` and `bower install bootstrap#{version number} --save`
5. Run `/dev/build`.
6. Optional
 * Favicon/icon: upload your icon through http://realfavicongenerator.net/ and copy the generated icons to your project root.  Note that the tile colour for Windows 8 will need to be changed `<meta name="msapplication-TileColor" content="#fff">` in Page.ss.
 * Enable search in config `SilverStripe\ORM\Search\FulltextSearchable::enable();` (see http://doc.silverstripe.org/framework/en/tutorials/4-site-search)
 * For older browsers see [Support for ie8](http://v4-alpha.getbootstrap.com/getting-started/browsers-devices/#supporting-internet-explorer-8)

## Requirements
Use software to convert Sass into CSS.  Gulp example below includes browser-sync:
```js
// [sudo] npm install gulp --save-dev
// [sudo] npm install gulp-sass --save-dev
// [sudo] npm install browser-sync --save-dev

var gulp = require('gulp'),
    sass = require('gulp-sass'),
    browserSync = require('browser-sync').create();

// Static Server + watching scss/html files
gulp.task('serve', ['sass'], function() {
    browserSync.init({
        proxy: 'http://bs4:8888/',
        files: [
            // Patterns for static files to watch.
            // We're watching js and php files within mysite
            // and SilverStripe template files within themes
            "mysite/**/*.js",
            "mysite/**/*.php",
            "themes/**/*.ss"
        ],
        notify: false,
        browser: "google chrome",
        reloadOnRestart: false
    });

    gulp.watch("./themes/bs4/scss/*.scss", ["sass"]);
    gulp.watch("./themes/bs4/templates/**/*.ss").on('change', browserSync.reload);
    gulp.watch("./mysite/**.*").on('change', browserSync.reload);
});

gulp.task('sass2', function() {
    return gulp.src(["./themes/bs4/scss/main.scss", "./themes/bs4/scss/editor.scss"])
        .pipe(sass().on('error', sass.logError))
        .pipe(gulp.dest("./themes/bs4/css"));
});

// Compile sass into CSS & auto-inject into browsers
gulp.task('sass', function() {
    return gulp.src(["./themes/bs4/scss/main.scss", "./themes/bs4/scss/editor.scss"])
        .pipe(sass().on('error', sass.logError))
        .pipe(gulp.dest("./themes/bs4/css"))
        .pipe(browserSync.stream());
});

gulp.task('default', ['serve']);
``` 

## Structure of the Sass files
Bootstrap's base variables are overridden by `custom.scss`.  The file `main.scss` adds additional customisations after Bootstrap's Sass variables, your overriding variables, & Sass files have been loaded.

## Useful Pattern 
 A pattern that can be used is to copy Bootstrap's style, in a new class, and customise.  Example below.
 ```css
    .current {
        @extend .active;
    }
 ```

## ToDo
* There's probably a better way to reference a file location in the Less files than `@import "../../../mysite/thirdparty/bower_components/bootstrap/less/variables.less";`
* Blog Module needs testing

## Browser Support
Does not support ie8 and below, however, there are polyfills.

## Changelog
* First release with bootstrap#v4.0.0-alpha.5

## License
[MIT](LICENSE)
