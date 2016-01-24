$ ->

  $baseUrl = '/open-source-club-website'
  $u = window.location.host.indexOf('github.io')
  if $u == -1
    $baseUrl = ''

  SimpleJekyllSearch
    searchInput: document.getElementById('search-posts')
    resultsContainer: document.getElementById('search-results')
    json: $baseUrl + '/search.json'
    searchResultTemplate: '<a href="{url}"><li><div class="primary">{title}</div><div class="secondary">{date}</div></li></a>'
    noResultsText: '<li class="no-results">No results found</li>'
    limit: 15
    fuzzy: false
    templateMiddleware:
      () ->
        # TODO
        # this is super inefficent because it gets executed on EVERY match
        result = document.querySelector('#search-results>a')
        if result? and result.classList.length == 0
          result.classList.add 'selected'

  if $('#search-results').children('.no-results').length > 0
    $('#search-results').css('max-height', 'inherit')

  if $('#search-posts').val().length > 0
    isSelected = true
  else
    isSelected = false

  $('#search-results').hover (->
    isSelected = true
    return
  ), ->
    isSelected = false
    return

  $('.search-submit').hover (->
    isSelected = true
    $('.search-submit').click () ->
      selected = document.querySelector('#search-results a.selected')
      url = selected.getAttribute('href') if selected
      window.open url, '_self'
      return
    return
  ), ->
    isSelected = false
    return

  $('#search-posts').focusout ->
    if !isSelected and $('#search-posts').val().length > 0
      $('#search-results').css('display', 'none')
    else
      $('#search-results').css('display', '')
    return

  $('#search-posts').focusin ->
    if $('#search-results').css('display') == 'none'
      $('#search-results').css('display', '')
    return

  return










