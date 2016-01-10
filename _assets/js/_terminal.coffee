$lines = $('.term>.term-cmd')

$ ->
  $lines.hide()
  terminal()




terminal = ->
  skip = 0
  lineContents = new Array
  typeLine = (idx) ->
    idx == null and (idx = 0)
    element = $lines.eq(idx)
    content = lineContents[idx]
    if typeof content == 'undefined'
      $('.skip').hide()
      return
    charIdx = 0

    typeChar = ->
      rand = Math.round(Math.random() * 150) + 25
      setTimeout (->
        char = content[charIdx++]
        element.append char
        if typeof char != 'undefined'
          typeChar()
        else
          element.append '<br/><span class="term-output">' + element.text().slice(9, -1) + '</span>'
          element.removeClass 'term-active'
          typeLine ++idx
        return
      ), if skip then 0 else rand
      return

    content = 'echo "' + content + '"'
    element.append('~$ ').addClass 'term-active'
    typeChar()
    return

  $lines.each (i) ->
    lineContents[i] = $(this).text()
    $(this).text('').show()
    return
  typeLine()
  return
