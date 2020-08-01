$(function(){
  $("#delete").on('click', function(){
      if(window.confirm("データを削除しますがよろしいですか？")) {
          location.href = $(this).attr('href');
      } else {
          return false;
      }
  });
});