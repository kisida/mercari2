// 商品詳細のjQuery作ってみたけど多分使わない（最終デプロイ直前でジャッジ）
$(function(){
  var page = 0;
  var lastPage = parseInt($(".thumbnail").length-1);
  $(".thumbnail").css("display","none");
    $(".thumbnail").eq(page).css("display","block");
  function changePage(){
        $(".thumbnail").fadeOut(1000);
        $(".thumbnail").eq(page).fadeIn(1000);
  };

  var Timer;
  function startTimer(){
  Timer = setInterval(function(){
    If(page === lastPage){
        page = 0;
        changePage();
    }else{
        page ++;
        changePage();
    };
  },5000);
}

function stopTimer(){
clearInterval(Timer);
}

startTimer();


});