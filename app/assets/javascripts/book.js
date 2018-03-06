$(function() {
  $("a.all_comments").on("click", function(e){
    $.ajax({
     method: "GET",
     url: this.href
    }).done(function(response){
      $("div.comments").html(response)
      })
    e.preventDefault();
  })
});

$(function() {
  $("a.show_genre").on("click", function(e){
    $.ajax({
     method: "GET",
     url: this.href
    }).done(function(response){
      $("div.show_books").html(response)
      })
    e.preventDefault();
  })
});

$(function() {
  $("#new_comment").on("submit", function(e) {
    url = this.action

    data = $(this).serialize();

    $.ajax({
      type: "POST",
      url: url,
      data: data,
      success: function(response) {
        $("#comment_body").val("");
        var $ol = $("div.comments ol")
        $ol.append(response);
      }
    });
    e.preventDefault()
  })
});
