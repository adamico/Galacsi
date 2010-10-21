// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//
function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().before(content.replace(regexp, new_id));
  source_autocomplete();
}

function toggle_div(id) {
  $(id).toggle('fold','',500);
};

// credits to http://jquery-howto.blogspot.com/2009/09/get-url-parameters-values-with-jquery.html
$.extend({
  getUrlVars: function(){
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for(var i = 0; i < hashes.length; i++)
    {
      hash = hashes[i].split('=');
      vars.push(hash[0]);
      vars[hash[0]] = hash[1];
    }
    return vars;
  },
  getUrlVar: function(name){
    return $.getUrlVars()[name];
  }
});

$(function() {
  var nom_demande = $.getUrlVar('nom_demande')
  $("#demande_name").val(nom_demande);
  var type_demande = $.getUrlVar('type_demande')
  $("#demande_nature").selectOptions(type_demande);
});

var source_autocomplete = function() {
  $(".source_autocomplete").autocomplete({
    source: '/sources/names.js',
    minLength: 2
  });
};

$(function() {
  source_autocomplete();
  $("#search_stripped_name_like").autocomplete({
    source: '/dcis/stripped_names.js',
    minLength: 2
  });
  $("#search_specialites_stripped_name_like").autocomplete({
    source: '/specialites/stripped_names.js',
    minLength: 2
  });
});
