# current page indicator on sidebar
$ ->
  setNavigation()
  revealNavigation()

$(window).resize ->
  revealNavigation()

setNavigation = ->
  baseUrl = "/open-source-club-website" # github repo name
  p = window.location.pathname # p = url path
  u = window.location.host.indexOf("github.io") # u = site url

  if u > -1
    # baseUrl is defined in main.coffee
    # strips the baseUrl from the path
    p = p.replace(baseUrl, "")

  p = p.replace(/\/$/, '') # remove initial '/' from path

  $('#main-nav>a').each ->
    href = $(this).attr('href')

    if p.substring(0, href.length) == href
      if href.length > 1
        $(this).addClass 'active'
    else if href.length == 1
      # if on the root of the domain ...
      $(this).addClass 'active'
    return

  return

revealNavigation = ->
  width = $(window).width()
  height = $(window).height()

  $('#page-content-wrapper').scroll ->
    if $('#page-content-wrapper').scrollTop() > $('.landing').height() and width > height and height <= 1000
      $('.navbar').css 'display', 'none'
      $('#page-content-wrapper').css({'margin-top' : '0', 'height' : '100%'})
      $('.menu-toggle').css({
        'margin': '1rem 0 0 1rem',
        'background' : 'rgba(75,75,75,.35)',
        'box-shadow': '0 1px 1px 0 rgba(0,0,0,.45)'
      })

    else
      $('.navbar').css 'display', ''
      $('#page-content-wrapper').css({'margin-top' : '', 'height' : ''})
      $('.menu-toggle').css({
        'margin' : '',
        'background' : '',
        'box-shadow': ''
      })
    return
  return


