// 画像のドロップ出力の処理
$(function(){

  function handleFileSelect(evt) {
      var files = evt.target.files; 
  
      for (var i = 0, f; f = files[i]; i++) {
          if (!f.type.match('image.*')) {
              continue;
          }
  
          var reader = new FileReader();
  
          reader.onload = (function(theFile) {

              return function(e) {
                  var $html = ['<img class="get-image" src="', e.target.result,'" title="', escape(theFile.name), '">'].join('');
                  $('.image-out').append($html);
              };
          })(f);
  
          reader.readAsDataURL(f);
      }
  }
  
  
  if (window.File && window.FileReader && window.FileList && window.Blob) {
      $('#files').on('change', handleFileSelect);
  } else {
      alert('お使いのブラウザはサポートしておりません');
  }

});


//  販売価格入力欄の計算処理
$(function($){
  var $lil_yen =`¥`
  var $big_yen =`<h5 class="big-yen">¥</h5>`


  $('.field-name-exp').keyup(function(){

    var input = $('.field-name-exp').val();

    input = parseInt(input);
    

    if(!input){

      $('.price-profits').val('');
      return false;
    };

    var num_fee = $('.price-fee').val(input / 10);
    var num = $('.price-profits').val(input * 0.9)
  });
  

  $('.field-name-exp').one("keyup", function(){
  $('.price-fee').before($lil_yen)
  $('.price-profits').before($big_yen)
  })
});
