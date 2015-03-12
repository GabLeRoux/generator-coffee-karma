module.exports = (grunt) ->

#    Project configuration.
    grunt.initConfig {
      pkg: grunt.file.readJSON('package.json'),
      karma: {
        unit:
          configFile: 'karma.config.coffee'
      }
    }

#    Load the plugin
    grunt.loadNpmTasks('grunt-karma')