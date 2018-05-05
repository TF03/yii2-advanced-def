var gulp = require('gulp'),
    minifyCss = require('gulp-minify-css'),
    renameFile = require('gulp-rename'),
    sass = require('gulp-sass'),
    combineMq = require('gulp-combine-mq'),
    autoPrefix = require('gulp-autoprefixer'),
    jsmin = require('gulp-uglify'),
    mainBowerFiles = require('main-bower-files'),
    addsrc = require('gulp-add-src'),
    modifyCssUrls = require('gulp-modify-css-urls'),
    sprite = require('gulp.spritesmith'),
    changed = require('gulp-changed'),
    imagemin = require('gulp-imagemin'),
    concat = require('gulp-concat');


var scssSrc = 'components/**/*.scss';
var cssDist = '../_css';

var jsSrc = 'components/**/*.js';
var jsLocalLibsSrc = 'components/_js-libs/*.js';
var jsDist = '../_js';

var imageminSrc = 'uploads/**/*';
var imageminDist = 'uploads_opt';


/* Call while working with project */
gulp.task('default', ['watch']);

/* Call at first start, after changes in bower.json or in gulp.js */
gulp.task('build', ['cssbuild', 'libs', 'jsbuild', 'font', 'img']);


/* Watch command */
gulp.task('watch', function(){
  gulp.watch(scssSrc, ['css']);
  gulp.watch(jsSrc, ['js']);
});


/* CSS production file packaging */
gulp.task('css', function(){

  /* Bower css libraries. You can config list of files in bower.json */
  var bowerCss = mainBowerFiles('**/*.css');

  return gulp.src('components/final.scss')
    .pipe(sass({
      precision: 10,
      includePaths: require('node-bourbon').includePaths
    }).on('error', sass.logError))
    .pipe(addsrc.append(bowerCss))
    .pipe(concat('final.min.css'))
    .pipe(modifyCssUrls({
      'modify': function(url, filePath){
        var distUrl = url,
            fonts = ['.eot','.svg','.ttf','.woff','.woff2'],
            imgs = ['.jpg', '.jpeg', '.png', '.gif', '.bmp'],
            pathEnd,
            fileName;

        /* Extraction file name from URL in css file */
        pathEnd = url.lastIndexOf('/')+1;
        fileName = url.substring(pathEnd);

        /* Extraction fonts from css urls */
        fonts.forEach(function(e){
          if(fileName.indexOf(e) > 0)
            distUrl = '../_font/' + fileName;
        });

        /* Extraction images from css urls */
        imgs.forEach(function(e){
          if(fileName.indexOf(e) > 0)
            distUrl = '../_img/' + fileName;
        });

        return distUrl;
      }
    }))
    .pipe(gulp.dest(cssDist))
    .pipe(gulp.dest(cssDist));
});


/* CSS production file packaging */
gulp.task('cssbuild', function(){

  /* Bower css libraries. You can config list of files in bower.json */
  var bowerCss = mainBowerFiles('**/*.css');

  return gulp.src('components/final.scss')
    .pipe(sass({
      precision: 10,
      includePaths: require('node-bourbon').includePaths
    }).on('error', sass.logError))
    .pipe(addsrc.append(bowerCss))
    .pipe(concat('final.min.css'))
    .pipe(modifyCssUrls({
      'modify': function(url, filePath){
        var distUrl = url,
            fonts = ['.eot','.svg','.ttf','.woff','.woff2'],
            imgs = ['.jpg', '.jpeg', '.png', '.gif', '.bmp'],
            pathEnd,
            fileName;

        /* Extraction file name from URL in css file */
        pathEnd = url.lastIndexOf('/')+1;
        fileName = url.substring(pathEnd);

        /* Extraction fonts from css urls */
        fonts.forEach(function(e){
          if(fileName.indexOf(e) > 0)
            distUrl = '../_font/' + fileName;
        });

        /* Extraction images from css urls */
        imgs.forEach(function(e){
          if(fileName.indexOf(e) > 0)
            distUrl = '../_img/' + fileName;
        });

        return distUrl;
      }
    }))    
    .pipe(gulp.dest(cssDist))
    .pipe(combineMq())
    .pipe(minifyCss({"keepSpecialComments": 0}))
    .pipe(gulp.dest(cssDist));
});


/* JS production file packaging */
gulp.task('js', function(){

  /* Packaging all js files into one minified file */
  return gulp.src([jsLocalLibsSrc, jsSrc])
  .pipe(concat('final.min.js'))
  .pipe(gulp.dest(jsDist));
});


/* JS project scripts minimize */
gulp.task('jsbuild', function(){
  return gulp.src([jsLocalLibsSrc, jsSrc])
  .pipe(concat('final.min.js'))
  .pipe(jsmin())
  .pipe(gulp.dest(jsDist));
});


/* JS production file packaging */
gulp.task('libs', function(){

  /* Bower js libraries. You can config list of files in bower.json */
  var bowerJs = mainBowerFiles('**/*.js');

  /* Packaging all js files into one minified file */
  return gulp.src(bowerJs)
  .pipe(concat('vendor.min.js'))
  .pipe(jsmin())
  .pipe(gulp.dest(jsDist));
});


/* Fonts production file packaging */
gulp.task('font', function(){
  var bowerFonts = mainBowerFiles(['**/*.eot', '**/*.svg', '**/*.ttf', '**/*.woff', '**/*.woff2']);

  return gulp.src(bowerFonts)
    .pipe(gulp.dest('../_font'))
});


/* Images production file packaging */
gulp.task('img', function(){
  var bowerFonts = mainBowerFiles(['**/*.jpg', '**/*.jpeg', '**/*.png', '**/*.gif', '**/*.bmp']);

  return gulp.src(bowerFonts)
    .pipe(gulp.dest('../_img'))
});


/* Sprite */
gulp.task('sprite', function(){

  // Generate our spritesheet
  return gulp.src('components/icons/img/**/*.png')
  .pipe(sprite({
    imgName: 'sprite.png',
    cssName: 'sprite.scss'
  }))
  .pipe(gulp.dest('../_img'))
  .pipe(gulp.dest('components/icons/'));

});


/* Optimize images. Require uploads folder in _assets folder */
gulp.task('imagemin', function(){
  return gulp.src(imageminSrc)
  .pipe(imagemin({
     progressive: true,
     optimizationLevel: 3
    }))
  .pipe(gulp.dest(imageminDist));
})
