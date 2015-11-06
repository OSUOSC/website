# icon flat shadows
!((e) ->
  t = new Array('#1ABC9C', '#2ecc71', '#3498db', '#9b59b6', '#34495e', '#f1c40f', '#e67e22', '#e74c3c')
  n = new Array('NE', 'SE', 'SW', 'NW')
  i =
    fade: false
    color: 'random'
    boxShadow: false
    angle: 'random'

  s = (e, t) ->
    e = e.replace('#', '')
    r = parseInt(e.substring(0, 2), 16)
    g = parseInt(e.substring(2, 4), 16)
    b = parseInt(e.substring(4, 6), 16)
    result = 'rgba(' + r + ',' + g + ',' + b + ',' + t / 100 + ')'
    result

  o = (e, t) ->
    `var i`
    `var n`
    e = String(e).replace(/[^0-9a-f]/gi, '')
    if e.length < 6
      e = e[0] + e[0] + e[1] + e[1] + e[2] + e[2]
    t = t or 0
    n = '#'
    r = undefined
    i = undefined
    while i < 3
      r = parseInt(e.substr(i * 2, 2), 16)
      r = Math.round(Math.min(Math.max(0, r + r * t), 255)).toString(16)
      n += ('00' + r).substr(r.length)
      i++
    n

  e.fn.flatshadow = (r) ->
    u = e.extend({}, i, r)
    @each ->
      `var p`
      `var p`
      `var h`
      `var p`
      `var p`
      `var h`
      `var p`
      `var p`
      `var h`
      `var p`
      `var p`
      `var h`
      `var p`
      `var p`
      `var h`
      `var p`
      `var p`
      `var h`
      `var p`
      `var p`
      `var h`
      `var p`
      `var c`
      `var a`
      `var a`
      `var i`
      `var i`
      `var i`
      `var r`
      el = e(this)
      if u.fade == true
        width = Math.round(el.outerWidth() / 3)
        height = Math.round(el.outerHeight() / 3)
      else
        width = Math.round(el.outerWidth())
        height = Math.round(el.outerHeight())
      if u.boxShadow != false
        r = u.boxShadow
      if u.color != 'random' and !el.attr('data-color')
        i = u.color
      else
        i = t[Math.floor(Math.random() * t.length)]
        if el.attr('data-color')
          i = el.attr('data-color')
      if u.angle != 'random' and !el.attr('data-angle')
        a = u.angle
      else
        a = n[Math.floor(Math.random() * n.length)]
        if el.attr('data-angle')
          a = el.attr('data-angle')
      f = o(i, -.3)
      l = ''
      if u.boxShadow != false
        c = ''
      else
        c = 'none'
      switch a
        when 'N'
          h = 1
          while h <= height
            if u.boxShadow != false
              c += '0px ' + h * 2 * -1 + 'px 0px ' + s(r, 50 - (h / height * 100))
            if u.fade != false
              p = s(f, 100 - (h / height * 100))
            else
              p = f
            l += '0px ' + h * -1 + 'px 0px ' + p
            if h != height
              l += ', '
              c += ', '
            h++
        when 'NE'
          h = 1
          while h <= height
            if u.boxShadow != false
              c += h * 2 + 'px ' + h * 2 * -1 + 'px 0px ' + s(r, 50 - (h / height * 100))
            if u.fade != false
              p = s(f, 100 - (h / height * 100))
            else
              p = f
            l += h + 'px ' + h * -1 + 'px 0px ' + p
            if h != height
              l += ', '
              c += ', '
            h++
        when 'E'
          h = 1
          while h <= width
            if u.boxShadow != false
              c += h * 2 + 'px ' + '0px 0px ' + s(r, 50 - (h / width * 100))
            if u.fade != false
              p = s(f, 100 - (h / height * 100))
            else
              p = f
            l += h + 'px ' + '0px 0px ' + p
            if h != width
              l += ', '
              c += ', '
            h++
        when 'SE'
          h = 0.1
          while h <= height
            if u.boxShadow != false
              c += h * 2 + 'px ' + h * 2 + 'px 0px ' + s(r, 50 - (h / height * 100))
            if u.fade != false
              p = s(f, 100 - (h / height * 100))
            else
              p = f
            l += h + 'px ' + h + 'px 0px ' + p
            if h != height
              l += ', '
              c += ', '
            h++
        when 'S'
          h = 1
          while h <= height
            if u.boxShadow != false
              c += '0px ' + h * 2 + 'px 0px ' + s(r, 50 - (h / height * 100))
            if u.fade != false
              p = s(f, 100 - (h / height * 100))
            else
              p = f
            l += '0px ' + h + 'px 0px ' + p
            if h != height
              l += ', '
              c += ', '
            h++
        when 'SW'
          h = 1
          while h <= height
            if u.boxShadow != false
              c += h * 2 * -1 + 'px ' + h * 2 + 'px 0px ' + s(r, 50 - (h / height * 100))
            if u.fade != false
              p = s(f, 100 - (h / height * 100))
            else
              p = f
            l += h * -1 + 'px ' + h + 'px 0px ' + p
            if h != height
              l += ', '
              c += ', '
            h++
        when 'W'
          h = 1
          while h <= height
            if u.boxShadow != false
              c += h * 2 * -1 + 'px ' + '0px 0px ' + s(r, 50 - (h / height * 100))
            if u.fade != false
              p = s(f, 100 - (h / height * 100))
            else
              p = f
            l += h * -1 + 'px ' + '0px 0px ' + p
            if h != height
              l += ', '
              c += ', '
            h++
        when 'NW'
          h = 1
          while h <= height
            if u.boxShadow != false
              c += h * 2 * -1 + 'px ' + h * 2 * -1 + 'px 0px ' + s(r, 50 - (h / height * 100))
            if u.fade != false
              p = s(f, 100 - (h / height * 100))
            else
              p = f
            l += h * -1 + 'px ' + h * -1 + 'px 0px ' + p
            if h != height
              l += ', '
              c += ', '
            h++
      el.css 'text-shadow': l
      return

  return
  )(window.jQuery)



$(document).ready ->
  RandHexVal = '#' + ('000000' + (Math.random() * 16777215 << 0).toString(16)).slice(-6)
  $('[class*=\'flat\']').flatshadow
    color: '#c0392b'
    angle: 'SE'
    fade: false
    boxShadow: '#222'
  $('.flat-blue').flatshadow
    color: '#34495e'
    angle: 'SE'
    fade: false
    boxShadow: '#333'
  $('.flat-turq').flatshadow
    color: '#3498db'
    angle: 'SE'
    fade: false
    boxShadow: '#333'
  $('.flat-grey').flatshadow
    color: '#ccc'
    angle: 'SE'
    fade: false
    boxShadow: '#333'
  $('.flat-pink').flatshadow
    color: '#8e44ad'
    angle: 'SE'
    fade: false
    boxShadow: '#333'
  $('.flat-orange').flatshadow
    color: '#e67e22'
    angle: 'SE'
    fade: false
    boxShadow: '#333'
  $('.flat-green').flatshadow
    color: '#2ecc71'
    angle: 'SE'
    fade: false
    boxShadow: '#333'
  $('.flat-random').flatshadow
    color: RandHexVal
    angle: 'SE'
    fade: false
    boxShadow: '#333'
  return
