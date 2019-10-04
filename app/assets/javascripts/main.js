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


//leftボタンを押した時、写真①が表示される。
//rightボタンを押した時、写真②が表示される。
//left-btnを押した時、一回だけ発火するけど次行こうactiveが動かない。

