$(function() {
  $('.area-h3').click(function() {
    var $area = $(this).find('.area-p');
    if($area.hasClass('open')) {
      $area.removeClass('open');
      $area.slideUp();
      $(this).find('span').text('+');
    } else {
      $area.addClass('open');
      $area.slideDown();
      $(this).find('span').text('-');
    }
  });
});