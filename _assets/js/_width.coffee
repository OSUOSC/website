# define #page-content-wrapper width

$ ->
  setWidth()

setWidth = ->
  `var contentWrapperWidth`
  # TODO
  # i know this is shitty, it needs to be rewritten
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

$(window).resize ->
  setWidth()
  return
