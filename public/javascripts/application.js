// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//
function remove_fields(link) {
  $(link).prev("input[type=hidden]").val = "1";
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().before(content.replace(regexp, new_id));
}

function toggle_div(id) {
  $(id).toggle('fold','',500);
};

$(function() {
  $("#search_stripped_name_contains").autocomplete({
    source: '/dcis/stripped_names.js',
    minLength: 2
  });
});

$(function() {
  $("#search_classe_therapeutiques_stripped_name_contains").autocomplete({
    source: '/classe_therapeutiques/stripped_names.js',
    minLength: 2
  });
});
