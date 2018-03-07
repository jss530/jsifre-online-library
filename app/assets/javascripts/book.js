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

    data = {
      'authenticity_token': $("input[name='authenticity_token']").val(),
      'comment': {
          'body': $("#comment_body").val()
      }
    };

    $.ajax({
      type: "POST",
      url: url,
      data: data,
      success: function(response) {
        $("#comment_body").val("")
        var $ol = $("div.comments ol")
        var $new = $("div.new_comment")
        $ol.append(response);
        $new.append(response);
      }
    });

    e.preventDefault();
  })
});

$(function() {
  $("a.add_book").on("click", function(e){
    $.ajax({
     method: "GET",
     url: this.href
    }).done(function(response){
      $("div.new_book_form").html(response)
      })
    e.preventDefault();
  })
});

// $(function() {
//   $("#new_book").on("submit", function(e) {
//     url = this.action
//
//     data = {
//       'authenticity_token': $("input[name='authenticity_token']").val(),
//       'book': {
//           'book_image': $("#book_image").val(),
//           'book_title': $("#book_title").val(),
//           'book_author': $("#book_author").val(),
//           'book_year': $("#book_year").val(),
//           'book_description': $("#book_description").val(),
//           'book_genre_id_1': $("#book_genre_id_1").val(),
          // 'book_genre_id_2': $("#book_genre_id_2").val(),
          // 'book_genre_id_3': $("#book_genre_id_3").val(),
          // 'book_genre_id_4': $("#book_genre_id_4").val(),
          // 'book_genre_id_5': $("#book_genre_id_5").val(),
          // 'book_genre_id_6': $("#book_genre_id_6").val(),
          // 'book_genre_id_7': $("#book_genre_id_7").val(),
          // 'book_genre_id_8': $("#book_genre_id_8").val(),
          // 'book_genre_id_9': $("#book_genre_id_9").val(),
          // 'book_genre_id_10': $("#book_genre_id_10").val(),
//       }
//     };
//
//     $.ajax({
//       type: "POST",
//       url: url,
//       data: data,
//       success: function(response) {
//         $("#book_image").val(""),
//         var $ol = $("div.comments ol")
//         $ol.append(response);
//       }
//     });
//
//     e.preventDefault();
//   })
// });
