class User{

  constructor(email, id, posts, pins){
    this.name = email;
    this.id = id;
    this.posts = posts;
    this.pins = pins;
  }
}

var result;
var id;

$(document).ready(function(){
  makeCall();
  $('.button_to').on('click', function(event){
    event.preventDefault();
    makePinAjaxCall(event);

  })

  $('.form').on('submit', function(event){
    debugger;
    event.preventDefault();
    event.stopPropagation();
    debugger;
  var form = $('form')[0];
  debugger;
  var formData = new FormData(form);
  debugger;
  $.ajax({
    url: '/posts',
    method: 'POST',
    dataType: "json",
    data: formData,
    contentType: false,
    processData: false,
    success: function(data){
      debugger;
      destinationPosts(data);
    }
})
})





});


function makeCall(){
  if($('.button_to').length){
result = $('body').attr('id')
$.ajax({
  url: `/users/${result}`,
  dataType: 'json',
  method: 'GET',
  success: function(data){
      data.user.posts.forEach((post) => {
      var userPost = new Post(post.avatar, post.car_rental, post.climate, post.content, post.diet, post.flight, post.id, post.title, post.total_cost)
      var result = $('ul').append(userPost.appendImage())
    })
  }
})
}
}
//
//
