'use strict'

module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-bower-task'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-csslint'
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

    bower:
      install: options: [ {
        targetDir: './lib'
        bowerOptions: forceLatest: true
      } ]

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
      compile:
        options: [ {
          data:
            debug: false
        } ]
        files: [ {
          expand: true
          cwd: '_includes/'
          src: ['**/*.jade']
          dest: '_includes/.'
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
          cwd: '_site/dist/js/'
          src: ['*.js']
          dest: '_site/dist/js/'
          ext: '.min.js'
        } ]

    cssmin:
      target:
        files: [ {
          expand: true
          cwd: '_site/dist/css/'
          src: ['*.css']
          dest: '_site/dist/css/'
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

      jquery: files: [ {
        stdout: false
        expand: true
        cwd: 'lib/jquery/dist/'
        src: 'jquery.min.js'
        dest: 'vendor/js/'
      } ]

      simpleSearch: files: [ {
        stdout: false
        expand: true
        cwd: 'bower_components/simple-jekyll-search/dest/'
        src: '*.js'
        dest: 'vendor/js/'
      } ]

      normalize: files: [ {
        stdout: false
        expand: true
        cwd: 'lib/normalize-scss/'
        src: 'normalize.css'
        dest: 'vendor/css/'
      } ]

      fontawesome: files: [ {
        stdout: false
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
        stdout: false
        expand: true
        cwd: 'lib/open-sans-fontface/'
        src: 'open-sans.css'
        dest: 'vendor/css/'
      } ]

      raleway: files: [ {
        stdout: false
        expand: true
        cwd: 'lib/raleway-fontface/css'
        src: 'raleway-fontface.css'
        dest: 'vendor/css/'
      } ]

      ubuntu: files: [ {
        stdout: false
        expand: true
        cwd: 'lib/ubuntu-fontface/'
        src: 'ubuntu.css'
        dest: 'vendor/css/'
      } ]

    exec:
      bundler: cmd: 'bundle install --quiet'
      remove: cmd: 'rm -rf _site/*'
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
          'exec:remove'
          'exec:jekyll'
        ]
    connect: server: options:
      port: 4040
      base: '_site'
      livereload: false
  grunt.registerTask 'build', [
    'exec:bundler'
    'bower'
    'copy'
    'jade'
    'exec:jekyll'
    'sass'
    'coffee'
    'uglify'
    'cssmin'
    'copy:image'
  ]
  grunt.registerTask 'serve', [
    'exec:lo_baseurl'
    'build'
    'connect:server'
    'exec:status'
    'watch'
  ]
  grunt.registerTask 'test', [ 'csslint' ]
  grunt.registerTask 'new', [ 'exec:new_post' ]
  grunt.registerTask 'default', [ 'serve' ]
