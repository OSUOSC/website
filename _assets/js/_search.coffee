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
    noResultsText: '<li>No results found</li>'
    limit: 10
    fuzzy: false
  return
