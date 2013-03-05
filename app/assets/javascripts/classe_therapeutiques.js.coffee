$ = jQuery

$ ->
  $("#classe_therapeutiques").on 'click', 'th a', ->
    $.getScript(@href)
    return false
