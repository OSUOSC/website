# define #page-content-wrapper width

$ ->
  setWidth()

setWidth = ->
  `var contentWrapperWidth`
  # TODO
  # i know this is shitty, it needs to be rewritten
  if $(window).width() < 1200
    # $('.navbar').css 'width', 'inherit'
    if $('.sidebar').is('.active')
      if $(window).width() < 750
        contentWrapperWidth = $(window).width()
      else
        contentWrapperWidth = 'inherit'
        $('.navbar').css 'width', $('#page-content-wrapper').width
    else
      contentWrapperWidth = 'inherit'
  else
    contentWrapperWidth = $(window).width() - $('.sidebar').width()
    $('.navbar').css 'width', contentWrapperWidth unless $(window).width() < 750
  $('#page-content-wrapper').css 'width', contentWrapperWidth
  return

$(window).resize ->
  setWidth()
  return
