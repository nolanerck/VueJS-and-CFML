var elixir = require( 'coldbox-elixir' );
var del 	= require( 'del' );
var gulp 	= require( 'gulp' );
var shell 	= require( 'gulp-shell' );

/*********************************************************************************/
/* 								Gulp TASKS 										 */
/*********************************************************************************/

gulp.task( 'cleanup', function(){
	del.sync( [
	    'includes/css',
	    'includes/js',
	    'includes/fonts'
	] );
});

gulp.task( 'tests', shell.task( 'box testbox run reporter="mintext"' ) );
gulp.watch( [ 'handlers/**', 'tests/**/*.cfc', 'models/**/*.cfc' ], [ 'tests' ]  );

/*********************************************************************************/
/* 								Elixir TASKS 									 */
/*********************************************************************************/

elixir( function( mix ){
	mix.task( "cleanup" )
		// Font Awesome
		.copy( "bower_components/font-awesome-sass/assets/fonts", "includes/fonts" )
		.copy( "bower_components/bootstrap-sass/assets/fonts", "includes/fonts" )
		// Vendor Scripts
		.scripts( 
			[ 
				"jquery/dist/jquery.min.js", 
				"bootstrap-sass/assets/javascripts/bootstrap.min.js",
				"vue/dist/vue.min.js",
				"vue-resource/dist/vue-resource.min.js"
			], // concatenated + minified files
			"includes/js/vendor.min.js", // ouput file
			"bower_components" // base dir
		)
		// Dev Vendor Scripts : Great for local development
		.scripts( 
			[ 
				"jquery/dist/jquery.min.js", 
				"bootstrap-sass/assets/javascripts/bootstrap.min.js",
				"vue/dist/vue.js",
				"vue-resource/dist/vue-resource.js"
			], // concatenated + minified files
			"includes/js/vendor-dev.js", // ouput file
			"bower_components" // base dir
		)
		// Mix App styles
		.sass( "App.scss" )
		// Mix JS
		.scripts( "App.js" );
} );
