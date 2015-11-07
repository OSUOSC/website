$(document).ready ->
  $('#scroll-indicator').addClass('animated bounce').removeClass 'hidden'
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
