$(function() {

  let search_list = $(".post-box");

  function appendPost(post) {
    let html = `
               <div class="post">
                  <a href="/spots/${post.spot_id}/posts/${post.id}">
                    <img class="post-image" src='${post.image.url}'>
                  </a>
                  <div class="icons">
                    <a href="/users/${post.user_id}">
                      <h5>${post.name}</h5> 
                      <p>${post.title}</p>
                    </a> 
                    <a rel="nofollow" data-method="post" href="/spots/1/posts/2/favorites">
                      <i class="far fa-heart"></i>
                    </a>        
                    <p>1</p>
                    <i class="fas fa-comment fa-fw fa-lg "></i>
                    <p>2</p>
                  </div>
                </div>`;
    search_list.append(html);
  }

  function appendErrMsgToHTML(msg) {
    let html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }

  $(".search-input").on("keyup", function() {
    let input = $(".search-input").val();
    let url = $(this).attr('action');
    $.ajax({
      type: 'GET',
      url: url,
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(posts) {
      console.log(posts);
      search_list.empty();
      if (posts.length !== 0) {
        posts.forEach(function(post){
          appendPost(post);
        });
      }
      else {
        appendErrMsgToHTML("該当するスポットがありません");
      }
    })
    .fail(function() {
      alert('error');
    });
  });
});