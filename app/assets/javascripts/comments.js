function Comment(attributes) {
  this.body = attributes.name;
  this.id = attributes.id
}

Comment.prototype.renderLI = function() {
  
}

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
    .success(function(json) {
      var comment = new Comment(json)

      var commentLI = comment.renderLI()

      $(".comments").append(commentLI)
    })
    .error(function(response) {
      console.log("error!", response)
    })
  })
})
