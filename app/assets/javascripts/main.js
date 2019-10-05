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
// ===========================================
var loopBanner = setInterval(function() {
  var clone = $(".main-slider-frame li:first").clone(true);
  $(".main-slider-frame li:first").animate({
  marginLeft : "-1400px"
  },{
  duration : 500,
  complete : function() {
      $(".main-slider-frame li:first").remove();
      clone.clone(true).insertAfter($(".main-slider-frame li:last"));
    }
  });
}, 3000);

////バナーにマウスオーバーしたら止まる===================
$(function(){
  $(".main-slider-countainer").hover(function(){
    clearInterval(loopBanner);                //クリアインターバル解除をどうするか
  },function(){
    loopBanner = setInterval(function() {
      var clone = $(".main-slider-frame li:first").clone(true);
      $(".main-slider-frame li:first").animate({
      marginLeft : "-1400px"
      },{
      duration : 500,
      complete : function() {
      $(".main-slider-frame li:first").remove();
      clone.clone(true).insertAfter($(".main-slider-frame li:last"));
        }
      });
    }, 3000);
  });
});


//ボタンを押したら進む(一応動いている)===============
$(function(){
  $('.slider-prev').click(function(){
    $(".main-slider-frame").animate({
      marginleft: "1430px"
      //ここを変えればええ感じになるはず
    });
  });
    $('.slider-next').click(function(){  //なぜか動かない
      $(".main-slider-frame").animate({
        marginleft : "1430px"
    });
  });
});
// ======================================
