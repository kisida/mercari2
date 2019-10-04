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


//leftボタンを押した時、写真①が表示される。
//rightボタンを押した時、写真②が表示される。
//left-btnを押した時、一回だけ発火するけど次行こうactiveが動かない。

// ===========================================
var loop = setInterval(function() {
  var clone = $(".main-slider-frame li:first").clone(true);
  $(".main-slider-frame li:first").animate({
  marginLeft : "-1400px"
  }, {
  duration : 700,
  complete : function() {
      //処理完了時に先頭要素を削除
      $(".main-slider-frame li:first").remove();
      //クローンをliの最後に追加
      clone.clone(true).insertAfter($(".main-slider-frame li:last"));
  }
  });
}, 1500);

  // ======================================