#cloud animations

$(document).ready ->
  moveClouds()

moveClouds = (e, s, d) ->
  $(e).css 'right', '-20%'
  wait = window.setTimeout((->
    $(e).animate { right: '120%' }, s, 'linear', ->
      moveClouds e, s, d
      return
    return
  ), d)
  return
