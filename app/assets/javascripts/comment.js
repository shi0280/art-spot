$(function() {
  // $('.comments').click(function() {
  //   var $comment = $(this).find('.comment-box');
  //   if($comment.hasClass('open')) {
  //     $comment.removeClass('open');
  //     $comment.slideUp();
  //     $(this).find('span').text('+');
  //   } else {
  //     $comment.addClass('open');
  //     $comment.slideDown();
  //     $(this).find('span').text('-');
  //   }
  // });
  
    function buildHTML(comment){
      let html = `<div class="comment-box">
                    <p class="comment-name"> ${comment.user_name} </p>
                    <p class="comment-text"> ${comment.text} </p>
                  </div>`
      return html;
    }
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
    .done(function(data){
      console.log(data)
      let html = buildHTML(data);
      $('.comments').append(html);
      $('.comments').animate({ scrollTop: $('.comments')[0].scrollHeight});
      $('.comment-form').val('');
      $('.comment-submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
});