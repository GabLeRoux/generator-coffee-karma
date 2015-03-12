module.exports = (grunt) ->

    projectName = 'template'

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
            "src/javascript/classes/<%= pkg.name %>.classes.js": "src/coffee/classes/*.coffee",
            "src/javascript/<%= pkg.name %>.js": "src/coffee/*.coffee"
      },
      uglify: {
        my_target:
          files:
            "dist/<%= pkg.name %>-v<%= pkg.version %>.min.js": ["src/javascript/classes/<%= pkg.name %>.classes.js", "src/javascript/<%= pkg.name %>.js"]
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
    grunt.loadNpmTasks('grunt-contrib-watch')

  #   Default task to run on > grunt
    grunt.registerTask( 'default', ['watch'])