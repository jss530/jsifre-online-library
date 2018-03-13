function Comment(json) {
  debugger
  this.body = json.name
}

Comment.prototype.renderLI = function() {
   "<li>" + Comment + "</li>"
}
 // need to define a comment class, establish what a comment instance is (constructor)
 // check AJAX syntax

$(function() {
  $("form#new_comment").on("submit", function(e) {
    e.preventDefault;
    var $form = $(this);
    var action = $form.attr("action");
    var params = $form.serialize();

    $.ajax({
      url: action,
      data: params,
      dataType: "json",
      method: "POST"
      })
      .done(function(json) {
      debugger
      var comment = new Comment(json)

      var commentLI = comment.renderLI()

      $(".comments").append(commentLI)
     })
    })
    .error(function(response) {
      debugger
      console.log("error!", response)
    })
  })
})
