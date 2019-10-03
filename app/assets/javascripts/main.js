$(function(){
  $(".left-btn").click(function(){
    $(".active").removeClass("active");
    var clickIndex = $("left-btn").index($(this))
    $(".top").eq(clickIndex).addClass("active");
  })


  $(".right-btn").click(function(){
    $(".active").removeClass("active");
    var clickIndex = $("right-btn").index($(this))
    $(".top").eq(clickIndex).addClass("active");
  })
});



// ===================================

var slideCurrent = 0;  // 現在地を示す変数

// アニメーションを実行する独自関数
var sliding = function(){
  // slideCurrentが0以下だったら
  if( slideCurrent < 0 ){
    slideCurrent = slideNum - 1;

  // slideCurrentがslideNumを超えたら
  }else if( slideCurrent > slideNum - 1){ // slideCUrrent >= slideNumでも可
    slideCurrent = 0;
  }

  $('.slideSet').animate({
    left: slideCurrent * -slideWidth
  });
}