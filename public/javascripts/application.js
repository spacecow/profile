function add_fields(link, association, content){
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_"+association,"g")
  //$(link).parent().before(content.replace(regexp,new_id));
  $(link).parent().before(content.replace(regexp,new_id));
}

$(function(){
  $("a.thumbnail").mouseover(function() {
    var url = $(this).attr("data-url");
    $("div#picture").html("<img src=\"" + url + "\"");
  });
});

