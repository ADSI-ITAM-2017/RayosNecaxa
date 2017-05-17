(function() {
  var registraSwipe;

  $(document).ready(function() {
    var $card, $cardLike, $cardReject, animating, cardsCounter, decisionVal, deg, numOfCards, pullChange, pullDeltaX, release;
    $card = void 0;
    $cardLike = void 0;
    $cardReject = void 0;
    animating = void 0;
    cardsCounter = void 0;
    decisionVal = void 0;
    deg = void 0;
    numOfCards = void 0;
    pullChange = void 0;
    pullDeltaX = void 0;
    release = void 0;
    animating = false;
    cardsCounter = 0;
    numOfCards = 6;
    decisionVal = 80;
    pullDeltaX = 0;
    deg = 0;
    $card = void 0;
    $cardReject = void 0;
    $cardLike = void 0;
    pullChange = function() {
      var likeOpacity, opacity, rejectOpacity;
      likeOpacity = void 0;
      opacity = void 0;
      rejectOpacity = void 0;
      animating = true;
      deg = pullDeltaX / 10;
      $card.css('transform', 'translateX(' + pullDeltaX + 'px) rotate(' + deg + 'deg)');
      opacity = pullDeltaX / 100;
      rejectOpacity = opacity >= 0 ? 0 : Math.abs(opacity);
      likeOpacity = opacity <= 0 ? 0 : opacity;
      $cardReject.css('opacity', rejectOpacity);
      $cardLike.css('opacity', likeOpacity);
    };
    release = function() {
      if (pullDeltaX >= decisionVal) {
        $card.addClass('to-right');
        registraSwipe();
      } else if (pullDeltaX <= -decisionVal) {
        $card.addClass('to-left');
      }
      if (Math.abs(pullDeltaX) >= decisionVal) {
        $card.addClass('inactive');
        setTimeout((function() {
          $card.addClass('below').removeClass('inactive to-left to-right');
          cardsCounter++;
          if (cardsCounter === numOfCards) {
            cardsCounter = 0;
            $('.demo__card').removeClass('below');
          }
        }), 300);
      }
      if (Math.abs(pullDeltaX) < decisionVal) {
        $card.addClass('reset');
      }
      setTimeout((function() {
        $card.attr('style', '').removeClass('reset').find('.demo__card__choice').attr('style', '');
        pullDeltaX = 0;
        animating = false;
      }), 300);
    };
    $(document).on('mousedown touchstart', '.demo__card:not(.inactive)', function(e) {
      var startX;
      startX = void 0;
      if (animating) {
        return;
      }
      $card = $(this);
      $cardReject = $('.demo__card__choice.m--reject', $card);
      $cardLike = $('.demo__card__choice.m--like', $card);
      startX = e.pageX || e.originalEvent.touches[0].pageX;
      $(document).on('mousemove touchmove', function(e) {
        var x;
        x = void 0;
        x = e.pageX || e.originalEvent.touches[0].pageX;
        pullDeltaX = x - startX;
        if (!pullDeltaX) {
          return;
        }
        pullChange();
      });
      $(document).on('mouseup touchend', function() {
        $(document).off('mousemove touchmove mouseup touchend');
        if (!pullDeltaX) {
          return;
        }
        release();
      });
    });
  });

  registraSwipe = function() {
    var arrId, propId;
    propId = $('#secretito').text();
    arrId = $('#secretito2').text();
    $.ajax({
      type: 'POST',
      url: '/likes',
      data: {
        like: {
          propiedad_id: propId,
          arrendatario_id: arrId,
          fechares: '2017-11-18'
        }
      },
      success: function(data) {},
      error: function(data) {}
    });
  };

}).call(this);
