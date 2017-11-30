$(function(){
  $('.comments-link').click(function(e){
    e.preventDefault();
    var postId = $(this).data('post-id'); 
    $('.comments-section[data-post-id=' + postId + ']').fadeToggle(); 
  })
});
