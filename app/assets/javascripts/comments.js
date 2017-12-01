$(function(){
  $('.comments-link').click(function(e){
    e.preventDefault();
    var postId = $(this).data('post-id');
    $('.post[data-post-id=' + postId + '] .comments-section').fadeToggle();
  })
});
