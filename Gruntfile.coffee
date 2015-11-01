'use strict'

module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-bower-task'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-csslint'
  grunt.loadNpmTasks 'grunt-bower-task'
  grunt.loadNpmTasks 'grunt-exec'
  grunt.initConfig
    csslint: test:
      options: import: 2
      expand: true
      cwd: '_site/assets/'
      src: '*.css'
    bower:
      install: options: [ {
        targetDir: './lib'
        bowerOptions: forceLatest:true
      } ]
    copy:
      jquery: files: [ {
        expand: true
        cwd: 'lib/jquery/dist/'
        src: 'jquery.min.js'
        dest: 'vendor/js/'
      } ]
      normalize: files: [ {
        expand: true
        cwd: 'lib/normalize-scss/'
        src: 'normalize.css'
        dest: 'vendor/css/'
      } ]
      animate: files: [ {
        expand: true
        cwd: 'lib/animate.css/'
        src: 'animate.min.css'
        dest: 'vendor/css/'
      } ]
      fontawesome: files: [ {
        expand: true
        cwd: 'lib/font-awesome/css/'
        src: 'font-awesome.min.css'
        dest: 'vendor/css/'
      },
      {
        expand: true
        cwd: 'lib/font-awesome/fonts/'
        src: '*'
        dest: 'vendor/fonts/'
      } ]
      opensans: files: [ {
        expand: true
        cwd: 'lib/open-sans-fontface/'
        src: 'open-sans.css'
        dest: 'vendor/css/'
      } ]
      raleway: files: [ {
        expand: true
        cwd: 'lib/raleway-fontface/css'
        src: 'raleway-fontface.css'
        dest: 'vendor/css/'
      } ]
      ubuntu: files: [ {
        expand: true
        cwd: 'lib/ubuntu-fontface/'
        src: 'ubuntu.css'
        dest: 'vendor/css/'
      } ]
    exec:
      bundler: cmd: 'bundle install'
      jekyll: cmd: 'jekyll build --trace'
      new_post: cmd: 'bash _helper/new-post.sh'
      status: cmd: "clear && echo the site is now accessible at http://localhost:<%= connect.server.options.port %>"
    watch:
      options: livereload: false
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
      livereload: false
  grunt.registerTask 'build', [
    'exec:bundler'
    'bower'
    'copy'
    'exec:jekyll'
  ]
  grunt.registerTask 'serve', [
    'build'
    'connect:server'
    'exec:status'
    'watch'
  ]
  grunt.registerTask 'test', [ 'csslint' ]
  grunt.registerTask 'new', [ 'exec:new_post' ]
  grunt.registerTask 'default', [ 'serve' ]
