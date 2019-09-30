$(function() {
  $('.index-thumbs').hover(function() {
      $('.active').removeClass('.active');
        // 変数hoveredIndexを定義し、hoverさせた写真のインデックス番号を拾う。
        var hoveredIndex = $('.index-thumbs').index($(this));
        // eqの引数に、上記のhoverさせた写真のインデックス番号を代入。
        $('.detail-slide').eq(hoveredIndex).addClass('active');
        //横並びの写真の箱を
        $('.details-slides').stop().animate({'left':-300*hoveredIndex+"px"}, 300);
      },
      );
    }
  );




