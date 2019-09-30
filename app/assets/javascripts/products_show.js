// var slideWidth = $('.detail-slide').outerWidth();// .slideの幅を取得して代入
// var slideNum = $('.detail-slide').length;  // .slideの数を取得して代入

// var slideSetWidth = slideWidth * slideNum; // .slideの幅×数で求めた値を代入
// $('.details-slides').css('width', slideSetWidth); // .slideSetのスタイルシートにwidth: slideSetWidthを指定

// // アニメーションを実行する独自関数
// var sliding = function(){
//   // slideCurrentが0以下だったら
//   if( slideCurrent < 0 ){
//     slideCurrent = slideNum - 1;
//   // slideCurrentがslideNumを超えたら
//   }else if( slideCurrent > slideNum - 1){
//     slideCurrent = 0;
//   }
//   $('.details-slides').stop().animate({
//     left: slideCurrent * -slideWidth
//   });
// }
// // ----------------------------------
// // 前へボタンが押されたとき
// $('.index-thumbs').hover(function(){
//   slideCurrent--;
//   sliding();
// });
// // 次へボタンが押されたとき
// $('.index-thumbs').hover(function(){
//   slideCurrent++;
//   sliding();
// });
// ====================================




//にんじゃわんこカスタム
$(function() {
  $('.index-thumbs').hover(function() {
      $('.active').removeClass('.active');
        // 変数hoveredIndexを定義し、hoverさせた写真のインデックス番号を拾う。
        var hoveredIndex = $('.index-thumbs').index($(this));
        // eqの引数に、上記のhoverさせた写真のインデックス番号を代入する。
        $('.detail-slide').eq(hoveredIndex).addClass('active');
      },// =================================================
      slidingWidth = hoverdIndex * '-300px',
      console.log(slidingWidth),
        function(){$('.details-slides').animate({'left':'-300px'}, 100);},
        // function(){$('.active').animate({'margin': '0px'}, 300);},
      );
    }
  );




