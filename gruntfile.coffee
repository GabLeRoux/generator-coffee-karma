module.exports = (grunt) ->

  #    Project configuration.
    grunt.initConfig {
      pkg: grunt.file.readJSON('package.json'),
      bump: {
        options: {
          commitFiles: '<%= pkg.files %>',
          commitMessage: 'Release v%VERSION%',
          tagMessage: 'Version %VERSION%',
          pushTo: 'https://github.com/lesleyduyndam/generator-coffeescript-karma.git'
        }
      }
    }

  #    Load the plugin
    grunt.loadNpmTasks('grunt-bump')