$(function() {
  $("a.all_comments").on("click", function(){
    $.ajax({
      method: "GET",
      url: this.href
    }).done(function(response){
      $("div.comments").html(response)
    })

  })
});
