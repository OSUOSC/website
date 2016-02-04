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

  if width > height and height <= 1000
    console.log 'foooo'
    $('#page-content-wrapper').scroll ->
      if $('#page-content-wrapper').scrollTop() > $('.landing').height()
        $('.navbar').css 'display', 'none'
        $('#page-content-wrapper').css('margin-top', '0')
      else
        $('.navbar').css 'display', ''
        $('#page-content-wrapper').css('margin-top', '')
      return
  return


