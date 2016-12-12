class User{

  constructor(email, posts, pins){
    this.name = email;
    this.posts = posts;
    this.pins = pins;
  }
}

var result;
var modal = document.getElementById('myModal');
var btn = document.getElementById("myBtn");
var span = document.getElementsByClassName("close")[0];



// span.onclick = function() {
//   modal.style.display = "none";
// }
//
// window.onclick = function(event) {
//   if (event.target == modal) {
//       modal.style.display = "none";
//   }
// }



$(document).ready(function(){
  makeCall();
  $('.button_to').on('click', function(event){
    event.preventDefault();
    makePinAjaxCall(event);
  })

  $('#myBtn').on('click', function(event){
    event.preventDefault();
    var modal = document.getElementById('myModal');
    var span = document.getElementsByClassName("close")[0];
    debugger;
    modal.style.display = "block";
    debugger;

    span.onclick = function() {
      modal.style.display = "none";
    }
  })
});

//
function makeCall(){
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
      loadPins(data);

    }
  })

}
