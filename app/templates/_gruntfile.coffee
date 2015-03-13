module.exports = (grunt) ->

  #    Project configuration.
    grunt.initConfig {
      pkg: grunt.file.readJSON('package.json'),
      karma: {
        unit:
          configFile: 'karma.config.coffee'
      },
      coffee: {
        compile:
          files:
            "src/javascript/classes/example.classes.js": "src/coffee/classes/*.coffee",
            "src/javascript/<%= slug %>.js": "src/coffee/*.coffee"
      },
      uglify: {
        my_target:
          files:
            "dist/<%= slug %>.min.js": ["src/javascript/classes/example.classes.js", "src/javascript/<%= slug %>.js"]
      },
      bump: {
        options: {
          commitFiles: '<%= pkg.files %>',
          commitMessage: 'Release v%VERSION%',
          tagMessage: 'Version %VERSION%',
          pushTo: '<%= githubUrl %>/<%= slug %>.git'
        }
      },
      requirejs: {
        compile: {
          options: {
            baseUrl: '',
            out: "dist/<%= slug %>requirejs.min.js",
            uglify: {
              toplevel: true,
              ascii_only: true,
              beautify: true,
              max_line_length: 1000,

#            //How to pass uglifyjs defined symbols for AST symbol replacement,
#            //see "defines" options for ast_mangle in the uglifys docs.
              defines: {
                DEBUG: ['name', 'false']
              },

#            //Custom value supported by r.js but done differently
#            //in uglifyjs directly:
#            //Skip the processor.ast_mangle() part of the uglify call (r.js 2.0.5+)
              no_mangle: true
            }
          }
        }
      },
      watch: {
        coffee: {
          files: ['src/coffee/**/*.coffee'],
          tasks: ['coffee']
        }
      }
    }

  #    Load the plugin
    grunt.loadNpmTasks('grunt-karma')
    grunt.loadNpmTasks('grunt-contrib-coffee')
    grunt.loadNpmTasks('grunt-contrib-uglify')
    grunt.loadNpmTasks('grunt-bump')
    grunt.loadNpmTasks('grunt-contrib-requirejs')
    grunt.loadNpmTasks('grunt-contrib-watch')

  #   Default task
    grunt.registerTask( 'default', [
      'coffee',
      'uglify',
      'bump:patch'
    ])

    grunt.registerTask( 'minor', [
      'coffee',
      'uglify',
      'bump:minor'
    ])

    grunt.registerTask( 'major', [
      'coffee',
      'uglify',
      'bump:major'
    ])