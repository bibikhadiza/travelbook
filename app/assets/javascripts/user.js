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

$(document).on('turbolinks:load', function(){
  makeCall();
  $('#my_pins').on('click', function(event){
    event.preventDefault();
    makePinAjaxCall(event);

  })


  $('.form').on('submit', function(event){
    event.preventDefault();
  var form = $('form')[0];
  var formData = new FormData(form);
  $.ajax({
    url: '/posts',
    method: 'POST',
    dataType: "json",
    data: formData,
    contentType: false,
    processData: false,
    success: function(data){
      destinationPosts(data);
    }
})
})
});


function makeCall(){
  if($('.button_to').length){
id = $('body').attr('id')
$.ajax({
  url: `/users/${id}`,
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
