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
  $('#my-pins').on('click', function(){
    makePinAjaxCall(event);
  })

  $('#nested').on('click', function(event){
    event.preventDefault()
    $('.ui.modal').modal('show')
    $(".error").hide()
  })

  $('form.new_post').on('submit', function(event){
    event.preventDefault();
    var form = $('form.new_post')[0];
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
      },
      error: function(err){
        debugger;
        $('.list').html("")
        $(".error").show()
        err.responseJSON.forEach((e) => {
          var error = `<li>${e}</li>`
          $('.list').append(error)
          document.getElementById("submit_form").disabled = false;
        })
      }
    })
  })
});

function rand(min, max) {
  return Math.floor(Math.random() * max) + min;
}

// document.querySelectorAll('.post:not(.featured)').forEach((post) => {
//   post.querySelector('.image').style.backgroundImage = `url("https://unsplash.it/300/300/?image=${rand(100, 1000)}")`;
// });


function makeCall(){
  if($(".post_image").length){
    id = $('body').attr('id')
    $.ajax({
      url: `/users/${id}.json`,
      method: 'GET',
      success: function(data){
          data.posts.forEach((post) => {
          var userPost = new Post(post.avatar, post.car_rental, post.climate, post.content, post.diet, post.flight, post.id, post.title, post.total_cost)
           $('.post featured').append(userPost.appendImage())
        });
      }
    });
  }
}
