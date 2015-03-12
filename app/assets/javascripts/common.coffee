$ = jQuery

$ ->
  attachDciTypeahead()
  attachSpecialiteTypeahead()

attachDciTypeahead = () ->
  dcis = new Bloodhound
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name')
    queryTokenizer: Bloodhound.tokenizers.whitespace
    remote: '/dcis.json?q=%QUERY'

  dcis.initialize()

  $('#q_dci_stripped_name_start').typeahead null,
    displayKey: 'name'
    source: dcis.ttAdapter()

attachSpecialiteTypeahead = () ->
  specialites = new Bloodhound
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name')
    queryTokenizer: Bloodhound.tokenizers.whitespace
    remote: '/specialites.json?q=%QUERY'

  specialites.initialize()

  $('#q_dci_specialites_stripped_name_start').typeahead null,
    displayKey: 'name'
    source: specialites.ttAdapter()
