# results = $('#search-results')

searchSubmit = () ->
  btn = document.querySelector('.search-submit')
  btn.click () ->
    selected = document.querySelector('#search-results a.selected')
    url = selected.getAttribute('href') if selected
    window.open url, '_self'
    return
  return

traverseUp = ->
  # console.log 'up arrow pressed'
  $("#search-results a.selected").removeClass('selected').prev().addClass('selected')
  return

traverseDown = ->
  # console.log 'down arrow pressed'
  $("#search-results a.selected").removeClass('selected').next().addClass('selected')
  return

# hoverSelection = ->
#   results = $('#search-results>a')
#   $(results).on 'mouseenter', () -> $(this).addClass 'selected'
#   $(results).on 'mouseleave', () -> $(this).removeClass 'selected'
#   return

highlightSelection = () ->
  $('#search-posts').off 'keydown'
  $('#search-posts').on 'keydown', (e) ->
    if e.which == 40 # if the down arrow is pressed . . .
      if e.preventDefault
        e.preventDefault()
      else
        e.returnValue = false

      endOfList =
        $("#search-results a.selected").index() + 1 == $("#search-results").children().length

      traverseDown() unless endOfList

    else if e.which == 38 # if the up arrow is pressed . . .
      if e.preventDefault
        e.preventDefault()
      else
        e.returnValue = false

      topOfList =
        $("#search-results a.selected").index() == 0

      traverseUp() unless topOfList

    else if e.which == 13
      if e.preventDefault
        e.preventDefault()
      else
        e.returnValue = false
      window.open $('#search-results a.selected').attr('href'), '_self'

  return false

$(document).ready ->
  highlightSelection()
  return
