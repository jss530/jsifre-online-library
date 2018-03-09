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
