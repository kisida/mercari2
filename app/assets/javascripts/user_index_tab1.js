$(function($){
  $('.top-tab').click(function(){
    $('.is-active').removeClass('is-active');
    var selectedTab = $('.top-tab').index($(this));
    $('.top-tab').eq(selectedTab).addClass('is-active');
    $('.is-show').removeClass('is-show');
    // const index = $(this).index();
    $('.top-panel').eq(selectedTab).addClass('is-show');
  });
});


jQuery(function($){
	$('.bottom-tab').click(function(){
		$('.active-btn').removeClass('active-btn');
		$(this).addClass('active-btn');
		$('.show-btn').removeClass('show-btn');
        // クリックしたタブからインデックス番号を取得
		const index = $(this).index();
        // クリックしたタブと同じインデックス番号をもつコンテンツを表示
		$('.bottom-panel').eq(index).addClass('show-btn');
	});
});

//is-active　＝＞　active
//is-show => show
