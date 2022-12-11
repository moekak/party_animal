
document.addEventListener("turbolinks:load",
function() {
  $('.faq-list-item').click(function() {
    var $answer = $(this).find('.answer');
    if($answer.hasClass('open')) {
      $answer.removeClass('open');
      $answer.slideUp();
      $(this).find('span').text('+');

    } else {
      $answer.addClass('open');
      $answer.slideDown();
      $(this).find('span').text('-');

    }
  });
     var count = 70;
 $('.post_description').each(function() {
     var thisText = $(this).text();
      var textLength = thisText.length;
       if (textLength > count) {
          var showText = thisText.substring(0, count);
          var insertText = showText += '…';
          $(this).html(insertText);
      };
  });
 $('.post_description_second').each(function() {
     var thisText = $(this).text();
      var textLength = thisText.length;
       if (textLength > count) {
          var showText = thisText.substring(0, count);
          var insertText = showText += '…';
          $(this).html(insertText);
      };
  });
   var count = 20;
  $('.post_title').each(function() {
     var thisText = $(this).text();
      var textLength = thisText.length;
       if (textLength > count) {
          var showText = thisText.substring(0, count);
          var insertText = showText += '…';
          $(this).html(insertText);
      };
  });
  $('.post_title_second').each(function() {
     var thisText = $(this).text();
       var textLength = thisText.length;
       if (textLength > count) {
          var showText = thisText.substring(0, count);
          var insertText = showText += '…';
          $(this).html(insertText);
      };
  });
  $("#join_events").slick({
    slidesToShow: 3,
    responsive: [
      {
        breakpoint: 1300, // 1300px以下のサイズに適用
        settings: {
          slidesToShow: 2,
        },
      },
      {
        breakpoint: 991, //1300-991px以下のサイズに適用
        settings: {
          slidesToShow: 2,
        },
      },
      {
        breakpoint: 650, // 〜650px以下のサイズに適用
        settings: {
          slidesToShow: 1,
        },
      },
    ],
  });
  $("#bookmark_events").slick({
    slidesToShow: 3,
    responsive: [
      {
        breakpoint: 1300, // 1300px以下のサイズに適用
        settings: {
          slidesToShow: 2,
        },
      },
      {
        breakpoint: 991, // 1300〜991px以下のサイズに適用
        settings: {
          slidesToShow: 2,
        },
      },
      {
        breakpoint: 650, // 〜650px以下のサイズに適用
        settings: {
          slidesToShow: 1,
        },
      },
    ],
  });
  $("#events_created").slick({
    slidesToShow: 3,
    responsive: [
      {
        breakpoint: 1300, // 1300px以下のサイズに適用
        settings: {
          slidesToShow: 2,
        },
      },
      {
        breakpoint: 991, // 1300〜991px以下のサイズに適用
        settings: {
          slidesToShow: 2,
        },
      },
      {
        breakpoint: 650, // 〜650px以下のサイズに適用
        settings: {
          slidesToShow: 1,
        },
      },
    ],
  });
}
);