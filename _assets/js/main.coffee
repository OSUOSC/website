# current page indicator

setNavigation = ->
  path = window.location.pathname
  path = path.replace(/\/$/, '')
  $('#main-nav>a').each ->
    href = $(this).attr('href')
    if path.substring(0, href.length) == href
      if href.length > 1
        $(this).addClass 'active'
    else if href.length == 1
      $(this).addClass 'active'
    return
  return

# define #page-content-wrapper width

setWidth = ->
  `var contentWrapperWidth`
  `var contentWrapperWidth`
  `var contentWrapperWidth`
  # TODO
  # i know this is shitty, needs to be rewritten
  if $(window).width() < 1200
    $('.navbar').css 'width', '100%'
    if $('.sidebar').is('.active')
      if $(window).width() < 750
        contentWrapperWidth = $(window).width() - $('.sidebar').width()
      else
        contentWrapperWidth = 'inherit'
    else
      contentWrapperWidth = 'inherit'
  else
    contentWrapperWidth = $(window).width() - $('.sidebar').width()
    $('.navbar').css 'width', contentWrapperWidth
  $('#page-content-wrapper').css 'max-width', contentWrapperWidth
  return

# clouds

moveClouds = (e, s, d) ->
  $(e).css 'right', '-20%'
  wait = window.setTimeout((->
    $(e).animate { right: '120%' }, s, 'linear', ->
      moveClouds e, s, d
      return
    return
  ), d)
  return

$(document).ready ->
  # $('#heading').addClass('animated fadeIn').removeClass('hidden');
  # $('.landing>#button').addClass('animated slideInRight').removeClass('hidden');
  # $('#heading a#button').addClass('animated slideInUp').removeClass('hidden');
  $('#scroll-indicator').addClass('animated bounce').removeClass 'hidden'
  $('#mc_embed_signup').find('form').ajaxChimp()
  $('body').addClass 'js'
  $menu = $('.sidebar')
  $menulink = $('.menu-toggle')
  $menulink.click ->
    $menulink.toggleClass 'active'
    $menu.toggleClass 'active'
    $('#page-content-wrapper').toggleClass 'active'
    if $(window).width() >= 750 and $(window).width() < 1200
      setWidth()
    false
  return
$ ->
  setNavigation()
  setWidth()
  SimpleJekyllSearch
    searchInput: document.getElementById('search-posts')
    resultsContainer: document.getElementById('search-results')
    json: '/search.json'
    searchResultTemplate: '<a href="{url}"><li>{title}</li></a>'
    noResultsText: '<li>No results found</li>'
    limit: 10
    fuzzy: false
  return
$(window).resize ->
  setWidth()
  return
# scroll to top button
$(document).ready ->
  $('#page-content-wrapper').scroll ->
    if $('#page-content-wrapper').scrollTop() > 300
      $('.scrollToTop').css 'display', 'initial'
    else
      $('.scrollToTop').css 'display', 'none'
    return
  #Click event to scroll to top
  $('.scrollToTop').click ->
    $('#page-content-wrapper').animate { scrollTop: 0 }, 800
    false
  return
# mailchimp
(($) ->
  'use strict'
  $.ajaxChimp =
    responses:
      'We have sent you a confirmation email': 0
      'Please enter a valid email': 1
      'An email address must contain a single @': 2
      'The domain portion of the email address is invalid (the portion after the @: )': 3
      'The username portion of the email address is invalid (the portion before the @: )': 4
      'This email address looks fake or invalid. Please enter a real email address': 5
    translations: 'en': null
    init: (selector, options) ->
      $(selector).ajaxChimp options
      return

  $.fn.ajaxChimp = (options) ->
    $(this).each (i, elem) ->
      form = $(elem)
      email = form.find('input[type=email]')
      label = form.find('.info')
      settings = $.extend({
        'url': form.attr('action')
        'language': 'en'
      }, options)
      url = settings.url.replace('/post?', '/post-json?').concat('&c=?')
      form.attr 'novalidate', 'true'
      email.attr 'name', 'EMAIL'
      form.submit ->
        msg = undefined
        data = {}
        dataArray = form.serializeArray()

        successCallback = (resp) ->
          `var i`
          if resp.result == 'success'
            msg = 'We have sent you a confirmation email'
            label.removeClass('error').addClass 'valid'
            email.removeClass('error').addClass 'valid'
          else
            email.removeClass('valid').addClass 'error'
            label.removeClass('valid').addClass 'error'
            index = -1
            try
              parts = resp.msg.split(' - ', 2)
              if parts[1] == undefined
                msg = resp.msg
              else
                i = parseInt(parts[0], 10)
                if i.toString() == parts[0]
                  index = parts[0]
                  msg = parts[1]
                else
                  index = -1
                  msg = resp.msg
            catch e
              index = -1
              msg = resp.msg
          # Translate and display message
          if settings.language != 'en' and $.ajaxChimp.responses[msg] != undefined and $.ajaxChimp.translations and $.ajaxChimp.translations[settings.language] and $.ajaxChimp.translations[settings.language][$.ajaxChimp.responses[msg]]
            msg = $.ajaxChimp.translations[settings.language][$.ajaxChimp.responses[msg]]
          label.html msg
          label.show 2000
          if settings.callback
            settings.callback resp
          return

        $.each dataArray, (index, item) ->
          data[item.name] = item.value
          return
        $.ajax
          url: url
          data: data
          success: successCallback
          dataType: 'jsonp'
          error: (resp, text) ->
            console.log 'mailchimp ajax submit error: ' + text
            return
        # Translate and display submit message
        submitMsg = 'Submitting...'
        if settings.language != 'en' and $.ajaxChimp.translations and $.ajaxChimp.translations[settings.language] and $.ajaxChimp.translations[settings.language]['submit']
          submitMsg = $.ajaxChimp.translations[settings.language]['submit']
        label.html(submitMsg).show 2000
        false
      return
    this

  return
) jQuery
# icon flat shadows
!((e) ->
  t = new Array('#1ABC9C', '#2ecc71', '#3498db', '#9b59b6', '#34495e', '#f1c40f', '#e67e22', '#e74c3c')
  n = new Array('NE', 'SE', 'SW', 'NW')
  i =
    fade: false
    color: 'random'
    boxShadow: false
    angle: 'random'

  s = (e, t) ->
    e = e.replace('#', '')
    r = parseInt(e.substring(0, 2), 16)
    g = parseInt(e.substring(2, 4), 16)
    b = parseInt(e.substring(4, 6), 16)
    result = 'rgba(' + r + ',' + g + ',' + b + ',' + t / 100 + ')'
    result

  o = (e, t) ->
    `var i`
    `var n`
    e = String(e).replace(/[^0-9a-f]/gi, '')
    if e.length < 6
      e = e[0] + e[0] + e[1] + e[1] + e[2] + e[2]
    t = t or 0
    n = '#'
    r = undefined
    i = undefined
    while i < 3
      r = parseInt(e.substr(i * 2, 2), 16)
      r = Math.round(Math.min(Math.max(0, r + r * t), 255)).toString(16)
      n += ('00' + r).substr(r.length)
      i++
    n

  e.fn.flatshadow = (r) ->
    u = e.extend({}, i, r)
    @each ->
      `var p`
      `var p`
      `var h`
      `var p`
      `var p`
      `var h`
      `var p`
      `var p`
      `var h`
      `var p`
      `var p`
      `var h`
      `var p`
      `var p`
      `var h`
      `var p`
      `var p`
      `var h`
      `var p`
      `var p`
      `var h`
      `var p`
      `var c`
      `var a`
      `var a`
      `var i`
      `var i`
      `var i`
      `var r`
      el = e(this)
      if u.fade == true
        width = Math.round(el.outerWidth() / 3)
        height = Math.round(el.outerHeight() / 3)
      else
        width = Math.round(el.outerWidth())
        height = Math.round(el.outerHeight())
      if u.boxShadow != false
        r = u.boxShadow
      if u.color != 'random' and !el.attr('data-color')
        i = u.color
      else
        i = t[Math.floor(Math.random() * t.length)]
        if el.attr('data-color')
          i = el.attr('data-color')
      if u.angle != 'random' and !el.attr('data-angle')
        a = u.angle
      else
        a = n[Math.floor(Math.random() * n.length)]
        if el.attr('data-angle')
          a = el.attr('data-angle')
      f = o(i, -.3)
      l = ''
      if u.boxShadow != false
        c = ''
      else
        c = 'none'
      switch a
        when 'N'
          h = 1
          while h <= height
            if u.boxShadow != false
              c += '0px ' + h * 2 * -1 + 'px 0px ' + s(r, 50 - (h / height * 100))
            if u.fade != false
              p = s(f, 100 - (h / height * 100))
            else
              p = f
            l += '0px ' + h * -1 + 'px 0px ' + p
            if h != height
              l += ', '
              c += ', '
            h++
        when 'NE'
          h = 1
          while h <= height
            if u.boxShadow != false
              c += h * 2 + 'px ' + h * 2 * -1 + 'px 0px ' + s(r, 50 - (h / height * 100))
            if u.fade != false
              p = s(f, 100 - (h / height * 100))
            else
              p = f
            l += h + 'px ' + h * -1 + 'px 0px ' + p
            if h != height
              l += ', '
              c += ', '
            h++
        when 'E'
          h = 1
          while h <= width
            if u.boxShadow != false
              c += h * 2 + 'px ' + '0px 0px ' + s(r, 50 - (h / width * 100))
            if u.fade != false
              p = s(f, 100 - (h / height * 100))
            else
              p = f
            l += h + 'px ' + '0px 0px ' + p
            if h != width
              l += ', '
              c += ', '
            h++
        when 'SE'
          h = 0.1
          while h <= height
            if u.boxShadow != false
              c += h * 2 + 'px ' + h * 2 + 'px 0px ' + s(r, 50 - (h / height * 100))
            if u.fade != false
              p = s(f, 100 - (h / height * 100))
            else
              p = f
            l += h + 'px ' + h + 'px 0px ' + p
            if h != height
              l += ', '
              c += ', '
            h++
        when 'S'
          h = 1
          while h <= height
            if u.boxShadow != false
              c += '0px ' + h * 2 + 'px 0px ' + s(r, 50 - (h / height * 100))
            if u.fade != false
              p = s(f, 100 - (h / height * 100))
            else
              p = f
            l += '0px ' + h + 'px 0px ' + p
            if h != height
              l += ', '
              c += ', '
            h++
        when 'SW'
          h = 1
          while h <= height
            if u.boxShadow != false
              c += h * 2 * -1 + 'px ' + h * 2 + 'px 0px ' + s(r, 50 - (h / height * 100))
            if u.fade != false
              p = s(f, 100 - (h / height * 100))
            else
              p = f
            l += h * -1 + 'px ' + h + 'px 0px ' + p
            if h != height
              l += ', '
              c += ', '
            h++
        when 'W'
          h = 1
          while h <= height
            if u.boxShadow != false
              c += h * 2 * -1 + 'px ' + '0px 0px ' + s(r, 50 - (h / height * 100))
            if u.fade != false
              p = s(f, 100 - (h / height * 100))
            else
              p = f
            l += h * -1 + 'px ' + '0px 0px ' + p
            if h != height
              l += ', '
              c += ', '
            h++
        when 'NW'
          h = 1
          while h <= height
            if u.boxShadow != false
              c += h * 2 * -1 + 'px ' + h * 2 * -1 + 'px 0px ' + s(r, 50 - (h / height * 100))
            if u.fade != false
              p = s(f, 100 - (h / height * 100))
            else
              p = f
            l += h * -1 + 'px ' + h * -1 + 'px 0px ' + p
            if h != height
              l += ', '
              c += ', '
            h++
      el.css 'text-shadow': l
      return

  return
)(window.jQuery)
$(document).ready ->
  RandHexVal = '#' + ('000000' + (Math.random() * 16777215 << 0).toString(16)).slice(-6)
  $('[class*=\'flat\']').flatshadow
    color: '#c0392b'
    angle: 'SE'
    fade: false
    boxShadow: '#222'
  $('.flat-blue').flatshadow
    color: '#34495e'
    angle: 'SE'
    fade: false
    boxShadow: '#333'
  $('.flat-turq').flatshadow
    color: '#3498db'
    angle: 'SE'
    fade: false
    boxShadow: '#333'
  $('.flat-grey').flatshadow
    color: '#ccc'
    angle: 'SE'
    fade: false
    boxShadow: '#333'
  $('.flat-pink').flatshadow
    color: '#8e44ad'
    angle: 'SE'
    fade: false
    boxShadow: '#333'
  $('.flat-orange').flatshadow
    color: '#e67e22'
    angle: 'SE'
    fade: false
    boxShadow: '#333'
  $('.flat-green').flatshadow
    color: '#2ecc71'
    angle: 'SE'
    fade: false
    boxShadow: '#333'
  $('.flat-random').flatshadow
    color: RandHexVal
    angle: 'SE'
    fade: false
    boxShadow: '#333'
  return
