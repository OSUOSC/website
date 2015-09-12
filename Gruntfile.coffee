'use strict'

module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-bower-task'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-exec'
  grunt.initConfig
    copy:
      jquery: files: [ {
        expand: true
        cwd: 'bower_components/jquery/dist/'
        src: 'jquery.min.js'
        dest: 'vendor/js/'
      } ]
      trianglify: files: [ {
        expand: true
        cwd: 'bower_components/trianglify/dist/'
        src: 'trianglify.min.js'
        dest: 'vendor/js/'
      } ]
      normalize: files: [ {
        expand: true
        cwd: 'bower_components/normalize-scss/'
        src: 'normalize.css'
        dest: 'vendor/css/'
      } ]
      fontawesome: files: [ {
        expand: true
        cwd: 'bower_components/font-awesome/css/'
        src: 'font-awesome.min.css'
        dest: 'vendor/css/'
      } ]
      opensans: files: [ {
        expand: true
        cwd: 'bower_components/open-sans-fontface/'
        src: 'open-sans.css'
        dest: 'vendor/css/'
      } ]
      raleway: files: [ {
        expand: true
        cwd: 'bower_components/raleway-fontface/css'
        src: 'raleway-fontface.css'
        dest: 'vendor/css/'
      } ]
      skeleton: files: [ {
        expand: true
        cwd: 'bower_components/skeleton/css'
        src: 'skeleton.css'
        dest: 'vendor/css/'
      } ]
    exec: jekyll: cmd: 'jekyll build --trace'
    watch:
      options: livereload: true
      source:
        files: [
          '_drafts/**/*'
          '_includes/**/*'
          '_layouts/**/*'
          '_posts/**/*'
          '_assets/**/*'
          '_config.yml'
          '*.html'
          '*.md'
        ]
        tasks: [ 'exec:jekyll' ]
    connect: server: options:
      port: 4040
      base: '_site'
      livereload: true
  grunt.registerTask 'build', [
    'copy'
    'exec:jekyll'
  ]
  grunt.registerTask 'serve', [
    'build'
    'connect:server'
    'watch'
  ]
  grunt.registerTask 'default', [ 'serve' ]
