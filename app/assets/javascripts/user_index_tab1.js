jQuery(function($){
  $('.top-tab').click(function(){
    $('.is-active').removeClass('is-active');
    $(this).addClass('is-active');
    $('.is-show').removeClass('is-show');
// クリックしたタブからインデックス番号を取得
    const index = $(this).index();
// クリックしたタブと同じインデックス番号をもつコンテンツを表示
    $('.top-panel').eq(index).addClass('is-show');
  });
});

// jQuery(function($){
//   $('.bottom-tab').click(function(){
//     $('.active').removeClass('active');
//     $(this).addClass('active');
//     $('.show').removeClass('show');
// // クリックしたタブからインデックス番号を取得
//     const index = $(this).index();
// // クリックしたタブと同じインデックス番号をもつコンテンツを表示
//     $('.bottom-panel').eq(index).addClass('show');
//   });
// });