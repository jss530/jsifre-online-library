$(function() {
  $("a.all_comments").on("click", function(e) {
    $.ajax({
     method: "GET",
     url: `${this.href}.json`
    }).done(function(response){
      const result = response.filter(resp => resp.body.length > 4)

      $("div.comments").html(result.map(resp => {
        return `<p><strong> ${resp.user.username} </strong>: ${resp.body} </p>`
      }))
     })
    e.preventDefault();
  })
});

// const result = words.filter(word => word.length > 6);

$(function() {
  $("a.show_genre").on("click", function(e){
    $.ajax({
     method: "GET",
     url: `${this.href}.json`
    }).done(function(response){
      $("div.show_books").html(response.books.map(resp => {
        return `<h3><strong> ${resp.title} </strong></h3>
                <p> by ${resp.author}</p>
                <a href="books/${resp.id}">View book</a>`
      }))
    })
    e.preventDefault();
  })
});

$(function() {
  $('#carousel-text').slick({
    centerMode: true,
    centerPadding: '60px',
    slidesToShow: 3,
    responsive: [
      {
        breakpoint: 768,
        settings: {
          arrows: false,
          centerMode: true,
          centerPadding: '40px',
          slidesToShow: 3
        }
      },
      {
        breakpoint: 480,
        settings: {
          arrows: false,
          centerMode: true,
          centerPadding: '40px',
          slidesToShow: 1
        }
      }
    ]
  });
})

function Comment(json) {
  this.id = json.id
  this.body = json.body
}

Comment.prototype.renderP = function() {

   return "<p>" + this.body + "</p>"

}

$(function() {
  $("form#new_comment").on("submit", function(e) {
    e.preventDefault();
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

      var comment = new Comment(json)

      var commentP = comment.renderP()

      $(".new").append(commentP)

     })
    .error(function(response) {
      console.log("error!", response)
    })
  })
})
