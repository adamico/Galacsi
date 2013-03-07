$ = jQuery

toggle_div = (id) ->
  $(id).toggle('fold','',500)

$ ->
  nom_demande = $.getUrlVar('nom_demande')
  $("#demande_name").val(decodeURIComponent(nom_demande))
  type_demande = $.getUrlVar('type_demande')
  $("#demande_nature").selectOptions(type_demande)

  $(".content-wrap").on 'click', ".cancel-edit", (e) ->
    e.preventDefault()
    $(@).parents("tr").find(".disabled").removeClass("disabled")
    $(@).parents("td").find("a:first-child").show()
    $(@).parent("form").remove()

  $(".content-wrap").on 'click', ".cancel-new", (e) ->
    e.preventDefault()
    $(@).parents("p").find("a:first-child").show()
    $(@).parent("form").remove()

# credits to http://jquery-howto.blogspot.com/2009/09/get-url-parameters-values-with-jquery.html
$.extend
  getUrlVars: ->
    vars = {}
    hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&')

    for hash in hashes
      param = hash.split("=")
      vars[param[0]] = param[1]
    return vars
  getUrlVar: (name) ->
    return $.getUrlVars()[name]

