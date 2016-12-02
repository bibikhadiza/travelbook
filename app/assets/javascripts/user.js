class User{

  constructor(email, posts, pins){
    this.name = email;
    this.posts = posts;
    this.pins = pins;
  }



}


  var result;

$(document).ready(function(){

  makeCall();


  // $('form.button_to').on('submit', function(event){
  //   event.preventDefault()
  //   loadPin(event);
  // })

});

//
function makeCall(){
var gettingId = $('.button_to').attr('action')
result = gettingId.split("/")[2];
$.ajax({
  url: `/users/${result}`,
  dataType: 'json',
  method: 'GET',
  success: function(data){
    data.user.posts.forEach((post) => {
      var userPost = new Post(post.avatar, post.car_rental, post.climate, post.content, post.diet, post.flight, post.id, post.title, post.total_cost)
      var result = $('.post_image').prepend(userPost.appendImage())

    })
  }
})
}
//
//
// // function loadPin(event){
// //   $.ajax({
// //     url: `/users/${result}/pins`,
// //     dataType: 'json',
// //     method: 'GET',
// //     success: function(data){
// //       debugger;
// //     }
// //   })
// //
// // }
