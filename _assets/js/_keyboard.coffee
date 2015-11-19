$(document).ready ->
  search = $("#search-results")

  # search.on 'mouseover', 'li', ->
  #   search.children('a').removeClass('selected')
  #   $(this).parent('a').addClass 'selected'
  #   $(this).mouseout -> $(this).parent('a').removeClass 'selected'

  Mousetrap.bind 'down', (e) ->
    if e.preventDefault
      e.preventDefault()
    else
      e.returnValue = false
    console.log 'next'
    if $("#search-results a.selected").index() + 1 == $("#search-results").children().length
      console.log 'end of list'
    else if !$('#search-results a').hasClass('selected')
      $("#search-results a").first().addClass("selected")
      console.log 'first first first'
    else
      $("#search-results a.selected").removeClass("selected").next().addClass('selected')
      console.log 'down down down'


  Mousetrap.bind 'up', (e) ->
    if e.preventDefault
      e.preventDefault()
    else
      e.returnValue = false
    console.log 'previous'

    if $("#search-results a.selected").index() == 0
      console.log 'end of list'
    else
      $("#search-results a.selected").removeClass("selected").prev().addClass('selected')

  Mousetrap.bind 'enter', (e) ->
    if e.preventDefault
      e.preventDefault()
    else
      e.returnValue = false
    window.open $('#search-results a.selected').attr('href'), '_self'

  Mousetrap.prototype.stopCallback = ->
     return false

  Mousetrap.bind 'o h', ->
    console.log 'io'

  Mousetrap.bind 'l i n u x', ->
    console.log 'GNU/Linux'

  Mousetrap.bind 'j i f', ->
    console.log 'gif'

  Mousetrap.bind 'b u g', ->
    console.log 'feature'

  Mousetrap.bind 'v i m', ->
    console.log 'did you mean: emacs'

  Mousetrap.bind 'e m a c s', ->
    console.log 'did you mean: vim'

  return
