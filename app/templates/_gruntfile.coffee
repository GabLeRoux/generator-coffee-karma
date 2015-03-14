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
          "dist/<%= slug %>.js": ["src/coffee/classes/*.coffee", "src/coffee/*.coffee"]
    },

    uglify: {
      my_target:
        files:
          "dist/<%= slug %>.min.js": ["dist/<%= slug %>.js"]
    },

    bump: {
      options:
        commitFiles: <%= pkg_template_files %>,
        commitMessage: 'Release v%VERSION%',
        tagMessage: 'Version %VERSION%',
        pushTo: '<%= githubUrl %>/<%= slug %>.git'
    },

    shell: {
      git_add:
        command: 'git add -A'
    },

    watch: {
      coffee:
        files: ['src/coffee/**/*.coffee'],
        tasks: ['coffee']

      uglify:
        files: ['dist/**/*.js'],
        task:  ['uglify']
    }
  }

  #    Load the plugin
  grunt.loadNpmTasks('grunt-karma')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-shell')
  grunt.loadNpmTasks('grunt-bump')
  grunt.loadNpmTasks('grunt-contrib-watch')

  #   Default task
  grunt.registerTask( 'default', [
    'coffee',
    'uglify',
  ])

  grunt.registerTask( 'patch', [
    'coffee',
    'uglify',
    'shell:git_add',
    'bump:patch'
  ])

  grunt.registerTask( 'minor', [
    'coffee',
    'uglify',
    'shell:git_add',
    'bump:minor'
  ])

  grunt.registerTask( 'major', [
    'coffee',
    'uglify',
    'shell:git_add',
    'bump:major'
  ])