$(function() {
  $('.comments').click(function() {
    var $comment = $(this).find('.comment-box');
    if($comment.hasClass('open')) {
      $comment.removeClass('open');
      $comment.slideUp();
      $(this).find('span').text('+');
    } else {
      $comment.addClass('open');
      $comment.slideDown();
      $(this).find('span').text('-');
    }
  });

  $('#new-comment').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
  })

});