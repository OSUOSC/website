# scroll to top button
$ ->
  revealScrollToTop()



revealScrollToTop = ->
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
