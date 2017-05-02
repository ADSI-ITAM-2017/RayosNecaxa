(function() {
  var doSlideshow, images, nextimage;

  document.onscroll = function() {
    if ($(window).scrollTop() > $('.titulo').height()) {
      $('nav > div.navbar').removeClass('navbar-static-top').addClass('navbar-fixed-top');
    } else {
      $('nav > div.navbar').removeClass('navbar-fixed-top').addClass('navbar-static-top');
    }
  };

  images = new Array('jascha-huisman-74571.jpg', 'jason-briscoe-104292.jpg', 'kari-shea-109894.jpg');

  nextimage = 0;

  doSlideshow = function() {
    if (nextimage >= images.length) {
      nextimage = 0;
    }
    $('.titulo').css('background-image', 'image-url("' + images[nextimage++] + '")').fadeIn(500, function() {
      setTimeout(doSlideshow, 1000);
    });
  };

  doSlideshow();

  $(".ulNav").find("#linkComo").click(function(e) {
    var section;
    e.preventDefault();
    section = $(this).attr("href");
    return $("html, body").animate({
      scrollTop: $(section).offset().top
    });
  });

}).call(this);
