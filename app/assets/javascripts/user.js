class User{

  constructor(email, id, posts, pins){
    this.name = email;
    this.id = id;
    this.posts = posts;
    this.pins = pins;
  }
}

var result;


$(document).ready(function(){
  makeCall();
  $('.button_to').on('click', function(event){
    event.preventDefault();
    makePinAjaxCall(event);
  })

});

//




function makeCall(){
  debugger;
  if($('.button_to').length){
var gettingId = $('.button_to').attr('action')
result = gettingId.split("/")[2];
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


function makePinAjaxCall(event){
  debugger;
  $.ajax({
    url: `/users/${result}/pins`,
    dataType: 'json',
    method: 'GET',
    success: function(data){
      debugger;
      loadPins(data);

    }
  })

}
