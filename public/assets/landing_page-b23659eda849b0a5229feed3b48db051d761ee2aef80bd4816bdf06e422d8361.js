(function() {
  var cycleBackgrounds, scrollOnClickComo, scrollOnClickQue;

  $(function() {
    var offs, offset, scroll_start, startch, startchange;
    offset = void 0;
    scroll_start = void 0;
    startchange = void 0;
    startch = void 0;
    offs = void 0;
    scroll_start = 0;
    startchange = $('#que');
    startch = $('#como');
    offset = startchange.offset();
    offs = startch.offset();
    if (startchange.length && startch.length) {
      $(document).scroll(function() {
        scroll_start = $(this).scrollTop();
        if (scroll_start > offset.top - 1) {
          $('.navbar-default').css('background-color', '#131f28');
          $('.navbar-default .navbar-nav>.open>a, .navbar-default .navbar-nav>.open>a:focus, .navbar-default .navbar-nav>.open>a:hover').css({
            'background-color': '#131f28',
            'color': '#eee'
          });
          if (scroll_start < offs.top - 5) {
            $('#liInicio').removeClass('active');
            $('#liQue').addClass('active');
            $('#liComo').removeClass('active');
          } else {
            $('#liInicio').removeClass('active');
            $('#liQue').removeClass('active');
            $('#liComo').addClass('active');
          }
        } else {
          $('.navbar-default').css('background-color', 'transparent');
          $('.navbar-default .navbar-nav>.open>a, .navbar-default .navbar-nav>.open>a:focus, .navbar-default .navbar-nav>.open>a:hover').css({
            'background-color': 'transparent',
            'color': '#eee'
          });
          $('#liInicio').addClass('active');
          $('#liQue').removeClass('active');
          $('#liComo').removeClass('active');
        }
      });
    }
  });

  $(function() {
    $(document).scroll();
  });

  cycleBackgrounds = function() {
    var $imageEls, index;
    index = 0;
    $imageEls = $('.toggle-image');
    setInterval((function() {
      index = index + 1 < $imageEls.length ? index + 1 : 0;
      $imageEls.eq(index).addClass('show');
      $imageEls.eq(index - 1).removeClass('show');
    }), 10000);
  };

  $(function() {
    cycleBackgrounds();
  });

  scrollOnClickQue = function() {
    var offset;
    offset = void 0;
    offset = 0;
    $('html, body').animate({
      scrollTop: $('#que').offset().top + offset
    }, 1400);
  };

  $(function() {
    return $('#linkQue, #flechitaL').on('click', function() {
      scrollOnClickQue();
    });
  });

  scrollOnClickComo = function() {
    var offset;
    offset = void 0;
    offset = 125;
    $('html, body').animate({
      scrollTop: $('#como').offset().top + offset
    }, 1400);
  };

  $(function() {
    return $('#linkComo').on('click', function() {
      scrollOnClickComo();
    });
  });

}).call(this);
