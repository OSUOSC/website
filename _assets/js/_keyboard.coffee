hasResults = if $('#search-results a').length > 0 then true else false

currentSelection = $("#search-results a.selected")

results = $('#search-results')


traverseUp = ->
  console.log 'up arrow pressed'
  return


traverseDown = ->
  console.log 'down arrow pressed'
  $("#search-results a.selected").removeClass('selected').next().addClass('selected')
  # return


hoverSelection = ->
  # TODO Refactor, currently it's very redundant
  query = $('#search-results a')
  $(query).on 'mouseenter', () -> $(this).addClass 'selected'
  $(query).on 'mouseleave', () -> $(this).removeClass 'selected'
  return

arrayEqual = (a, b) ->
  a.length is b.length and a.every (elem, i) -> elem is b[i]


highlightSelection = ->
  target = document.querySelector('#search-results')

  # create an observer instance
  observer = new MutationObserver((mutations) ->

    oldResults = []

    if $('#search-results a').index() != -1
      $('#search-results a').each (index, element) ->
        url = $(this).attr('href')
        oldResults.push url
        return

    console.log 'old results: ' + oldResults
    console.log 'oldResults count: ' + $(oldResults).length

    i = 0
    len = mutations.length
    newResults = []
    while i < len
      resultsList = mutations[0].target

      if i < mutations[0].length - 1
        url = resultsList.querySelectorAll('a')[i].pathname
        newResults.push url

        $('#search-results a').each (index, element) ->
          $(this).addClass 'selected' if index == 0
      i++

    $('#search-results a').each (index, element) ->
      # FIXME
      # this is "reseting" the selector to the top each time
      if index == 0
        console.log 'index = 0'
        $(this).addClass 'selected'
      return
  )

  # configuration of the observer:
  config =
    childList: true
    subtree: true

  # pass in the target node, as well as the observer options
  observer.observe target, config


  $('#search-posts').keydown (e) ->
    if e.which == 40 # if the down arrow is pressed . . .
      e.preventDefault()

      endOfList =
        $("#search-results a.selected").index() + 1 == $("#search-results").children().length

      observer.disconnect()
      traverseDown() unless endOfList

    else if e.which == 38 # if the up arrow is pressed . . .
      e.preventDefault()
      
      observer.disconnect()
      traverseUp()

  $('#search-posts').keyup (e) ->
    # once the up or down arrow is released . . .
    if e.which == 40 or e.which == 38
      observer.observe target, config
  return


$(document).ready ->
  highlightSelection()
  hoverSelection()

  Mousetrap.bind 'enter', (e) ->
    if e.preventDefault
      e.preventDefault()
    else
      e.returnValue = false
    window.open $('#search-results a.selected').attr('href'), '_self'


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


  #Work in Progress

  # Mousetrap.bind 'r o o t', ->
  #   $('body').children().toggle()
  #   $('body').toggleClass('term')
  #   a = "<p class='term-cmd'>The future ain't what it used to be</p>"
  #   b = "<p class='term-cmd'>It's so crowded, nobody comes here anymore</p>"
  #   c = "<p class='term-cmd'>I really didn't say everything I said</p>"
  #   $('.term').append(a,b,c)

  return
