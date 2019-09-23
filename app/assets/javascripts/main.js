$(function(){
  $(".left-btn").on("click", function(){
    $(".active").removeClass("active");

    var clickIndex = $("left-btn").index($(this))

    $(".top").eq(clickIndex).addClass("active");
  })


  $(".right-btn").on("click", function(){
    $(".active").removeClass("active");

    var clickIndex = $("right-btn").index($(this))
    
    $(".top").eq(clickIndex).addClass("active");
  })
});
