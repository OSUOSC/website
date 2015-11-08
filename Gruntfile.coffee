'use strict'

module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-csslint'
  grunt.loadNpmTasks 'grunt-html'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-exec'
  grunt.initConfig

    csslint: test:
      options: import: 2
      expand: true
      cwd: '_site/dist/css/'
      src: '*.css'

    htmllint:
      options:
        force: true
      all:
        src: ['_site/**/*.html']

    coffee:
      dist:
        options: [ {
          sourceMap: false
          join: true
          joinExt: '.coffee'
        } ]
        files: [ {
          '_site/dist/js/app.js': '_assets/js/*.coffee'
        } ]

    jade:
      jekyll_includes:
        options: [ {
          data:
            debug: false
        } ]
        files: [ {
          expand: true
          cwd: '_includes/jade/'
          src: ['**/*.jade']
          dest: '_includes/html/.'
          ext: '.html'
        } ]

      jekyll_layouts:
        options: [ {
          data:
            debug: false
        } ]
        files: [ {
          expand: true
          cwd: '_layouts/jade/'
          src: ['**/*.jade']
          dest: '_layouts/html/.'
          ext: '.html'
        } ]

    sass:
      dist:
        options: [ {
          sourcemap: 'none'
          style: 'compressed'
          bundleExec: true
        } ]
        files: [ {
          expand: true
          cwd: '_assets/css/'
          src: ['*.sass']
          dest: '_site/dist/css/'
          ext: '.css'
        } ]

    uglify:
      my_target:
        options:
          quoteStyle: 3
        files: [ {
          expand: true
          cwd: '_site/'
          src: ['**/*.js']
          dest: '_site/'
          ext: '.min.js'
        } ]

    cssmin:
      target:
        files: [ {
          expand: true
          cwd: '_site/'
          src: ['**/*.css']
          dest: '_site/'
          ext: '.min.css'
        } ]

    copy:
      image: files: [ {
        stdout: false
        expand: true
        cwd: '_assets/img/'
        src: '*'
        dest: '_site/dist/img/'
      } ]

      js: files: [ {
        stdout: false
        expand: true
        filter: 'isFile'
        flatten: true
        cwd: 'bower_components/'
        src: [
          '**/*.js'
          '!**/*/*.js'
          '!**/*.min.js'
        ]
        dest: '_site/vendor/js/'
      } ]

      css: files: [ {
        stdout: false
        expand: true
        filter: 'isFile'
        flatten: true
        cwd: 'bower_components/'
        src: [
          '**/*.css'
          '!**/*.min.css'
        ]
        dest: '_site/vendor/css/'
      } ]

      fonts: files: [ {
        stdout: false
        expand: true
        filter: 'isFile'
        flatten: true
        cwd: 'bower_components/'
        src: [
          '**/*.woff'
          '**/*.woff2'
          '**/*.ttf'
        ]
        dest: '_site/vendor/fonts/'
      } ]


    exec:
      bundler: cmd: 'bundle install --quiet'
      bower: cmd: 'bower install --quiet'
      purge: cmd: 'rm -rf _site/*'
      lo_baseurl: cmd: 'bash _helpers/set-baseurl.sh "\'\'"'
      gh_baseurl: cmd: 'bash _helpers/set-baseurl.sh /open-source-club-website'
      jekyll: cmd: 'bundle exec jekyll build --quiet'
      new_post: cmd: 'bash _helpers/new-post.sh'
      status: cmd: "clear && echo the site is now accessible at http://localhost:<%= connect.server.options.port %>"

    watch:
      options: livereload: true

      # TODO
      # add image

      sass:
        files: '_assets/**/*.sass'
        tasks: [ 'sass' ]

      coffee:
        files: '_assets/**/*.coffee'
        tasks: [ 'coffee' ]

      jade:
        files: '_includes/**/*.jade'
        tasks: [ 'jade' ]

      source:
        files: [
          '_drafts/**/*'
          '_includes/**/*'
          '_layouts/**/*'
          '_posts/**/*'
          '_assets/img/*'
          '_config.yml'
          '*.html'
          '*.md'
        ]
        tasks: [
          'exec:purge'
          'exec:jekyll'
        ]
    connect: server: options:
      port: 4040
      base: '_site'
      livereload: false
  grunt.registerTask 'build', [
    'exec:bundler'
    'exec:bower'
    'jade'
    'exec:jekyll'
    'copy'
    'sass'
    'coffee'
    'uglify'
    'cssmin'
  ]
  grunt.registerTask 'serve', [
    'exec:lo_baseurl'
    'build'
    'connect:server'
    'exec:status'
    'watch'
  ]
  grunt.registerTask 'test', [
    'csslint'
    'htmllint'
  ]
  grunt.registerTask 'new', [ 'exec:new_post' ]
  grunt.registerTask 'default', [ 'serve' ]
