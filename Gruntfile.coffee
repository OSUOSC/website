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

  currentEnvironment =
    grunt.config 'env',
    grunt.option('env') or process.env.GRUNT_ENV or 'development'

  env =
    development:
      baseurl: '"\'\'"'

    staging:
      baseurl: '/open-source-club-website'

    production:
      baseurl: '"\'\'"'

  grunt.initConfig
    envBaseUrl: null

    csslint:
      development:
        options: [ {
          import: 2
          expand: true
          cwd: '_site/dist/css/'
          src: '*.css'
        } ]

    htmllint:
      options:
        force: true
      all:
        src: ['_site/**/*.html']

    coffee:
      production:
        options: [ {
          sourceMap: false
          join: true
          joinExt: '.coffee'
        } ]
        files: [ {
          '_site/dist/js/app.js': '_assets/js/*.coffee'
        } ]

      staging:
        options: [ {
          sourceMap: false
          join: true
          joinExt: '.coffee'
        } ]
        files: [ {
          '_site/dist/js/app.js': '_assets/js/*.coffee'
        } ]

      development:
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
      production:
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

      staging:
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

      development:
        options: [ {
          sourcemap: 'none'
          style: 'expanded'
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
      production:
        files: [ {
          expand: true
          cwd: '_site/'
          src: ['**/*.js']
          dest: '_site/'
          ext: '.min.js'
        } ]

      staging:
        files: [ {
          expand: true
          cwd: '_site/'
          src: ['**/*.js']
          dest: '_site/'
          ext: '.min.js'
        } ]

      development:
        options: [ {
          compress: false
          beautify: true
          mangle: false
        } ]
        files: [ {
          expand: true
          cwd: '_site/'
          src: ['**/*.js']
          dest: '_site/'
          ext: '.min.js'
        } ]

    cssmin:
      production:
        files: [ {
          expand: true
          cwd: '_site/'
          src: ['**/*.css']
          dest: '_site/'
          ext: '.min.css'
        } ]

      staging:
        files: [ {
          expand: true
          cwd: '_site/'
          src: ['**/*.css']
          dest: '_site/'
          ext: '.min.css'
        } ]

      development:
        files: [ {
          expand: true
          cwd: '_site/'
          src: ['**/*.css']
          dest: '_site/'
          ext: '.min.css'
        } ]

    copy:
      image:
        files: [ {
          stdout: false
          expand: true
          cwd: '_assets/img/'
          src: '*'
          dest: '_site/dist/img/'
        } ]

      js:
        files: [ {
          stdout: false
          expand: true
          filter: 'isFile'
          flatten: true
          cwd: 'bower_components/'
          src: [
            'jquery/dist/*.js'
            'simple-jekyll-search/dest/*.js'
            'mousetrap/mousetrap.js'
            '!**/*.min.js'
          ]
          dest: '_site/vendor/js/'
        } ]

      css:
        files: [ {
          stdout: false
          expand: true
          filter: 'isFile'
          flatten: true
          cwd: 'bower_components/'
          src: [ '**/*.css', '!**/*.min.css' ]
          dest: '_site/vendor/css/'
        } ]

      fonts:
        files: [ {
          stdout: false
          expand: true
          filter: 'isFile'
          flatten: true
          cwd: 'bower_components/'
          src: [ '**/*.woff', '**/*.woff2', '**/*.ttf' ]
          dest: '_site/vendor/fonts/'
        } ]


    exec:

      options: [ {
        stdout: false
      } ]

      bundler:
        cmd: 'bundle install'

      bower:
        cmd: 'bower install'

      purge:
        cmd: 'rm -rf _site/*'

      jekyll:
        cmd: 'bundle exec jekyll build'

      new_post:
        cmd: 'bash _helpers/new-post.sh'

      status:
        cmd: "clear && echo the site is now accessible at http://localhost:<%= connect.server.options.port %>"

      baseurl:
        cmd: 'bash _helpers/set-baseurl.sh' + ' ' + "<%= envBaseUrl %>"


    watch:
      options:
        livereload: true

      # TODO
      # add image

      sass:
        files: '_assets/**/*.sass'
        tasks: [ 'sass', 'cssmin' ]

      coffee:
        files: '_assets/**/*.coffee'
        tasks: [ 'coffee', 'uglify' ]

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

        tasks: [ 'exec:purge', 'build' ]

    connect:
      server:
        options:
          port: 4040
          base: '_site'
          livereload: false
          useAvailablePort: true


  grunt.registerTask 'build', [
    'set_environment'
    'exec:baseurl'
    'exec:bundler'
    'exec:bower'
    'jade'
    'exec:jekyll'
    'copy'
    'sass:' + currentEnvironment
    'coffee:' + currentEnvironment
    'uglify:' + currentEnvironment
    'cssmin:' + currentEnvironment
  ]
  grunt.registerTask 'serve', [
    'build'
    'connect:server'
    'exec:status'
    'watch'
  ]
  grunt.registerTask 'test', [ 'csslint', 'htmllint' ]
  grunt.registerTask 'new', [ 'exec:new_post' ]
  grunt.registerTask 'default', [ 'serve' ]

  grunt.registerTask 'set_environment', ->
    isDevelopment =
      currentEnvironment == 'development'

    isStaging =
      currentEnvironment == 'staging'

    isProduction =
      currentEnvironment == 'production'

    if isDevelopment == true
      baseurl = env.development.baseurl

    else if isStaging == true
      baseurl = env.staging.baseurl

    else if isProduction == true
      baseurl = env.production.baseurl

    grunt.config.set 'envBaseUrl', baseurl

    console.log 'environment: ' + currentEnvironment
    console.log 'baseurl: ' + baseurl
    return
