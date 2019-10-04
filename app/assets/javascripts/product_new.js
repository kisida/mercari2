// 画像のドロップ出力の処理
$(function(){
  
  function handleFileSelect(e) {
      var files = e.target.files; 
  
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
// ----------------------------------
// ----------------------------------


//  販売価格入力欄の計算処理
$(function($){
  var $big_yen =`<h5 class="big-yen">¥</h5>`

  $('.field-name-exp').keyup(function(){
    var input = $('.field-name-exp').val();

    input = parseInt(input);
    
    if(!input){
      $('.price-profits').val('')
      $('.price-fee').val('')
      return false;
    };

    $('.price-fee').val(Math.round(input / 10));
    $('.price-profits').val(Math.round(input * 0.9))
  });

  
  $('.field-name-exp').one("keyup", function(){
  $('.price-fee').before("¥")
  $('.price-profits').before($big_yen)
  })
});
// ----------------------------------
// ----------------------------------


// カテゴリー習得機能
$(function(){

  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  };
  
  // 子カテゴリーの追加HTML要素
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='sell__select-text' id= 'children'>
                          <select class="listing-select__box--select" id="child_category" name="category_id" >
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          <select>
                      </div>`;
    $('.append_category').append(childSelectHtml);
  }

  // 孫カテゴリーの追加HTML要素
  function appendGrandChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='sell__select-text' id= 'grandchildren'>
                          <select class="listing-select__box--select" id="grandchild_category" name="category_id">
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          <select>
                      </div>`;
    $('.append_category').append(childSelectHtml);
  }

//  子カテゴリーの習得
  $("#item_category").change(function(){
    var category_id = document.getElementById("item_category").value;
    if (category_id != ""){

    $.ajax({
      type: "GET",
      url: "get_children",
      data: {parent_name: category_id},
      dataType: "json"
    })
    


    .done(function(data){
      $('#children').remove();
      $('#grandchildren').remove();
      var insertHTML = '';
      data.forEach(function(child){
        insertHTML += appendOption(child);
      })

      appendChidrenBox(insertHTML);
    })

    .fail(function(){
      alert("エラー出たらごめん")
    })

    }else{
      $('#children').remove();
      $('#grandchildren').remove();
    }
  });
// ----------------------------------------
// ----------------------------------------


//  孫カテゴリーの習得（ajax）
  $('.append_category').on('change', '#child_category', function(){
    var child_category = $('#child_category option:selected').data('category');
    if (child_category != "---" ){
      
    $.ajax({
      type: "GET",
      url: "get_grand_children",
      data: {child_id: child_category},
      dataType: "json"
    })


    .done(function(data){
      $("#grandchildren").remove();
      var insertHTML = "";
      data.forEach(function(child){
        insertHTML += appendOption(child);
      })
      appendGrandChidrenBox(insertHTML);
    })

    .fail(function(){
      alert("エラー出たらごめん");
    })

    }else{
      $("#grandchildren").remove();
    }
  });
});
// ----------------------------------------
// ----------------------------------------
