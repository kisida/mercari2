// =========野口コードログ=============================
// $(function(){
//   $(".slider-prev").click(function(){
//     $(".active").removeClass("active");
//     var clickIndex = $("slider-prev").index($(this))
//     $(".top").eq(clickIndex).addClass("active");
//     console.log(clickIndex);
//   })

//   $(".slider-next").click(function(){
//     $(".active").removeClass("active");
//     var clickIndex = $("slider-next").index($(this))
//     $(".top").eq(clickIndex).addClass("active");
//   })
// });


// =========以下関口自作=============================
// var slideCurrent = 0; // 現在地を示す変数

// var loop = setInterval(function() {
//   var clone = $(".main-slider-frame li:first").clone(true);
//   $(".main-slider-frame li:first").animate({
//   marginLeft : "-1400px"
//   },{
//   duration : 500,
//   complete : function() {
//       $(".main-slider-frame li:first").remove();
//       clone.clone(true).insertAfter($(".main-slider-frame li:last"));
//     }
//   });
// }, 3000);

////バナーにマウスオーバーしたら止まるコード・・・・・・
// $(function(){
//   $(".main-slider-countainer").hover(function(){
//     clearInterval(loop);                //クリアインターバル解除をどうするか
//   },function(){
//     loop = setInterval(function() {
//       var clone = $(".main-slider-frame li:first").clone(true);
//       $(".main-slider-frame li:first").animate({
//       marginLeft : "-1400px"
//       },{
//       duration : 500,
//       complete : function() {
//       $(".main-slider-frame li:first").remove();
//       clone.clone(true).insertAfter($(".main-slider-frame li:last"));
//         }
//       });
//     }, 3000);//
//   });
// });

//ボタンを押したら進む(一応動いている)・・・・・・
// $(function(){
//   $('.slider-prev').click(function(){
//     $(".main-slider-frame").animate({
//       marginleft: "1430px"
//       //ここを変えればええ感じになるはず
//     });
//   });
//     $('.slider-next').click(function(){  //なぜか動かない
//       $(".main-slider-frame").animate({
//         marginleft : "1430px"
//     });
//   });
// });

// 以下 Slick================================
$(document).ready(function(){
  $('.main-slider-frame').slick({
    autoplay:true,
    dots:false,
    arrows: true,
    pauseOnHover: true,
    prevArrow:'<i class="fa fa-angle-left arrow arrow-left"></i>',
    nextArrow:'<i class="fa fa-angle-right arrow arrow-right"></i>',
  });

  $('.slick-dots li').on('mouseover', function() {
    $('.slider').slick('goTo', $(this).index());
  });
});
