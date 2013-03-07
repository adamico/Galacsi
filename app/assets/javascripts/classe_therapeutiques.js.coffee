$ = jQuery

$ ->
  $("#classe_therapeutiques").on 'click', 'th a', ->
    $.getScript(@href)
    return false

  $("#classe_therapeutiques").on 'click', "#cancel-ct-edit", (e) ->
    e.preventDefault()
    $(@).parents("tr").find(".disabled").removeClass("disabled")
    $(@).parents("td").find("a:first-child").show()
    $(@).parent("form").remove()
