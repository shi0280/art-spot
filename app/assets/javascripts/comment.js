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
});