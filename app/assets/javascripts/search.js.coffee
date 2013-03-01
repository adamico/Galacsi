$ = jQuery

$ ->
  $("#q_dci_name_eq").typeahead
    source: (query, process) ->
      $.get "/dcis.json", {q: query}, (data) =>
        process(item.text for item in data)
    items: 10
    minLength: 2

  $("#q_dci_specialites_name_eq").typeahead
    source: (query, process) ->
      $.get "/specialites.json", {q: query}, (data) =>
        process(item.text for item in data)
    items: 10
    minLength: 2

