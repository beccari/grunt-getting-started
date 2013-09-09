module.exports = (grunt) ->
  
    grunt.initConfig

        # property declaration here
        pkg: grunt.file.readJSON 'package.json'
        
        clean:
            all:
                src: ['out', 'dist']
                
        coffee:
            compile:
                files:
                    'out/result.js': ['src/*.coffee']
        uglify:
            options:
          	    banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'


            min:
                files:
                    'dist/<%=pkg.name%>.min.js': ['src/*.js', 'out/*.js']
          	    
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    # Load the plugin that provides the "uglify" task
    grunt.loadNpmTasks 'grunt-contrib-uglify'

    grunt.loadNpmTasks 'grunt-contrib-clean'

    
    # Default task(s)
    grunt.registerTask 'default', ['clean', 'coffee', 'uglify']
    
