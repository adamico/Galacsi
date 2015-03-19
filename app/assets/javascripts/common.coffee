$ = jQuery

$ ->
  attachDciTypeahead()
  attachSpecialiteTypeahead()
  attachSourceTypeahead()

  $('#sources').on 'cocoon:after-insert', ->
    attachSourceTypeahead()

  attachAlternativeTokenizer()

attachDciTypeahead = () ->
  dcis = new Bloodhound
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name')
    queryTokenizer: Bloodhound.tokenizers.whitespace
    remote: '/dcis.json?q=%QUERY'

  dcis.initialize()

  $('#q_dci_name_start').typeahead null,
    displayKey: 'name'
    source: dcis.ttAdapter()

attachSpecialiteTypeahead = () ->
  specialites = new Bloodhound
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name')
    queryTokenizer: Bloodhound.tokenizers.whitespace
    remote: '/specialites.json?q=%QUERY'

  specialites.initialize()

  $('#q_dci_specialites_name_start').typeahead null,
    displayKey: 'name'
    source: specialites.ttAdapter()

attachSourceTypeahead = () ->
  sources = new Bloodhound
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name')
    queryTokenizer: Bloodhound.tokenizers.whitespace
    remote: '/sources.json?q=%QUERY'

  sources.initialize()

  $('.source-typeahead').typeahead null,
    displayKey: 'name'
    source: sources.ttAdapter()

attachAlternativeTokenizer = () ->
  alternatives = new Bloodhound
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name')
    queryTokenizer: Bloodhound.tokenizers.whitespace
    remote: '/dcis.json?q=%QUERY'

  alternatives.initialize()

  $('#fiche_alternative_names').tokenfield
    typeahead: [null, { displayKey: 'name', source: alternatives.ttAdapter() }]
