'use strict'

module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-csslint'
  grunt.loadNpmTasks 'grunt-html'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-jsonmin'
  grunt.loadNpmTasks 'grunt-exec'

  currentEnvironment =
    grunt.config 'env',
    grunt.option('env') or process.env.GRUNT_ENV or 'development'

  env =
    development:
      baseurl: '"\'\'"'

    staging:
      baseurl: '/website'

    production:
      baseurl: '"\'\'"'

  grunt.initConfig
    envBaseUrl: null

    csslint:
      development:
        options: [ {
          import: 2
          expand: true
          cwd: 'build/dist/css/'
          src: '*.css'
        } ]

    htmllint:
      options:
        force: true
      all:
        src: ['build/**/*.html']

    coffee:
      production:
        options: [ {
          sourceMap: false
          join: true
          joinExt: '.coffee'
        } ]
        files: [ {
          'build/dist/js/app.js': 'source/_assets/js/*.coffee'
        } ]

      staging:
        options: [ {
          sourceMap: false
          join: true
          joinExt: '.coffee'
        } ]
        files: [ {
          'build/dist/js/app.js': 'source/_assets/js/*.coffee'
        } ]

      development:
        options: [ {
          sourceMap: false
          join: true
          joinExt: '.coffee'
        } ]
        files: [ {
          'build/dist/js/app.js': 'source/_assets/js/*.coffee'
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
          cwd: 'source/_assets/css/'
          src: ['*.sass']
          dest: 'build/dist/css/'
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
          cwd: 'source/_assets/css/'
          src: ['*.sass']
          dest: 'build/dist/css/'
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
          cwd: 'source/_assets/css/'
          src: ['*.sass']
          dest: 'build/dist/css/'
          ext: '.css'
        } ]


    uglify:
      production:
        files: [ {
          expand: true
          cwd: 'build/'
          src: ['**/*.js']
          dest: 'build/'
          ext: '.min.js'
        } ]

      staging:
        files: [ {
          expand: true
          cwd: 'build/'
          src: ['**/*.js']
          dest: 'build/'
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
          cwd: 'build/'
          src: ['**/*.js']
          dest: 'build/'
          ext: '.min.js'
        } ]

    cssmin:
      production:
        files: [ {
          expand: true
          cwd: 'build/'
          src: ['**/*.css']
          dest: 'build/'
          ext: '.min.css'
        } ]

      staging:
        files: [ {
          expand: true
          cwd: 'build/'
          src: ['**/*.css']
          dest: 'build/'
          ext: '.min.css'
        } ]

      development:
        files: [ {
          expand: true
          cwd: 'build/'
          src: ['**/*.css']
          dest: 'build/'
          ext: '.min.css'
        } ]

    jsonmin:
      build:
        files: [ {
          expand: true
          cwd: 'build/'
          src: ['**/*.json']
          dest: 'build/'
          ext: '.json'
        } ]

    copy:
      image:
        files: [ {
          stdout: false
          expand: true
          cwd: 'source/_assets/img/'
          src: '*'
          dest: 'build/dist/img/'
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
          dest: 'build/vendor/js/'
        } ]

      css:
        files: [ {
          stdout: false
          expand: true
          filter: 'isFile'
          flatten: true
          cwd: 'bower_components/'
          src: [ '**/*.css', '!**/*.min.css', '!**/normalize.css' ]
          dest: 'build/vendor/css/'
        } ]

      scss:
        files: [ {
          stdout: false
          expand: true
          filter: 'isFile'
          flatten: true
          cwd: 'bower_components/normalize-scss/'
          src: [ '**/*.scss' ]
          dest: 'source/_assets/css/'
        } ]

      opensans:
        files: [ {
          stdout: false
          expand: true
          filter: 'isFile'
          cwd: 'bower_components/open-sans-fontface/'
          src: [ '**/*.woff', '**/*.woff2', '**/*.ttf' ]
          dest: 'build/vendor/css/'
        } ]

      fontawesome:
        files: [ {
          stdout: false
          expand: true
          filter: 'isFile'
          flatten: true
          cwd: 'bower_components/fontawesome/'
          src: [ '**/*.woff', '**/*.svg','**/*.otf', '**/*.eot', '**/*.woff2', '**/*.ttf' ]
          dest: 'build/vendor/fonts'
        } ]

      ubuntu:
        files: [ {
          stdout: false
          expand: true
          filter: 'isFile'
          cwd: 'bower_components/ubuntu-fontface/'
          src: [ '**/*.woff', '**/*.svg','**/*.otf', '**/*.eot', '**/*.woff2', '**/*.ttf' ]
          dest: 'build/vendor/css/'
        } ]


    exec:

      options: [ {
        stdout: false
      } ]

      purge:
        cmd: 'rm -rf build/*'

      jekyll:
        cmd: 'bundle exec jekyll build'

      aliasFeed:
        cmd: 'cp build/atom.xml build/rss.xml'

      # new_post:
      #   cmd: './helpers/new-post.sh'

      status:
        cmd: "clear && echo the site is now accessible at http://localhost:<%= connect.server.options.port %>"

      baseurl:
        cmd: 'ruby helpers/setBaseurl.rb' + ' ' + "<%= envBaseUrl %>"


    watch:
      options:
        livereload: true

      # TODO
      # add image

      sass:
        files: 'source/_assets/**/*.sass'
        tasks: [ 'sass:' + currentEnvironment, 'cssmin:' + currentEnvironment ]

      coffee:
        files: 'source/_assets/**/*.coffee'
        tasks: [ 'coffee:' + currentEnvironment, 'uglify:' + currentEnvironment ]

      source:
        files: [
          'source/_includes/**/*'
          'source/_layouts/**/*'
          'source/_posts/**/*'
          'source/_assets/img/*'
          'source/_config.yml'
          'source/*.html'
          'source/*.md'
        ]

        tasks: [ 'exec:purge', 'build' ]

    connect:
      server:
        options:
          port: 4040
          base: 'build'
          livereload: false
          useAvailablePort: true


  grunt.registerTask 'build', [
    'set_environment'
    'exec:baseurl'
    'copy:scss'
    'exec:jekyll'
    'exec:aliasFeed'
    'copy:js'
    'copy:css'
    'copy:image'
    'copy:opensans'
    'copy:fontawesome'
    'copy:ubuntu'
    'sass:' + currentEnvironment
    'coffee:' + currentEnvironment
    'uglify:' + currentEnvironment
    'jsonmin'
    'cssmin:' + currentEnvironment
  ]
  grunt.registerTask 'serve', [
    'build'
    'connect:server'
    'exec:status'
    'watch'
  ]
  grunt.registerTask 'test', [ 'csslint', 'htmllint' ]
  # grunt.registerTask 'new', [ 'exec:new_post' ]
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
