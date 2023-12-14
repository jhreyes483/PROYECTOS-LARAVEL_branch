const mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel applications. By default, we are compiling the CSS
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.js('resources/js/app.js', 'public/js')
    .postCss('resources/css/app.css', 'public/css', [
        require('postcss-import'),
        require('tailwindcss'),
    ])
    .webpackConfig(require('./webpack.config'));
mix.styles([
    'resources/skote/css/bootstrap.min.css', //recursos a compilar
    'resources/skote/css/icons.min.css', //recursos a compilar
    'resources/skote/css/app.min.css', //recursos a compilar
    'resources/skote/css/dataTables.bootstrap4.min.css',
    'resources/skote/css/buttons.bootstrap4.min.css',
    'resources/skote/css/responsive.bootstrap4.min.css'
],'public/css/app.css' /* nombre del arvchivo final con todos los recursos comprimidos*/)
    .scripts([
        'resources/skote/js/jquery.min.js',
        'resources/skote/js/bootstrap.bundle.min.js',
        'resources/skote/js/metisMenu.min.js',
        'resources/skote/js/simplebar.min.js',
        'resources/skote/js/waves.min.js',
        'resources/skote/js/apexcharts.min.js',
        'resources/skote/js/dashboard.init.js',
        'resources/skote/js/app.js',
        'resources/skote/js/jquery.dataTables.min.js',
        'resources/skote/js/dataTables.bootstrap4.min.js',
        'resources/skote/js/dataTables.buttons.min.js',
        'resources/skote/js/buttons.bootstrap4.min.js',
        'resources/skote/js/jszip.min.js',
        'resources/skote/js/pdfmake.min.js',
        'resources/skote/js/vfs_fonts.js',
        'resources/skote/js/buttons.html5.min.js',
        'resources/skote/js/buttons.print.min.js',
        'resources/skote/js/buttons.colVis.min.js',
        'resources/skote/js/dataTables.responsive.min.js',
        'resources/skote/js/responsive.bootstrap4.min.js',
        'resources/skote/js/datatables.init.js'
    ],'public/js/app.js');
