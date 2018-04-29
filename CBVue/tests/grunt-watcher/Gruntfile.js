module.exports = function( grunt ){

	// Default
	grunt.registerTask( "default", [ "watch" ] );

	// Config
	grunt.initConfig( {
		// read configs
		pkg : grunt.file.readJSON( "package.json" ),

		// Node Runner
		exec : {
			node_tests : {
				cwd : "../../",
				command : 'testbox-runner'
			},
			box_tests : {
				cwd : "../../",
				command : 'box testbox run reporter="mintext"'
			}
		},

		// Watch
		watch : {
			tests : {
				files : [ 
					'../tests/specs/**/*.cfc', 
					'../../models/**/*.cfc',
					'../../handlers/**/*.cfc' 
				],
				tasks : [  "exec:box_tests" ],
				options : {
					livereload : true
				}
			}
		}

	} );

	// Load Tasks
	require( 'matchdep' )
		.filterDev( 'grunt-*' )
		.forEach( grunt.loadNpmTasks );
};