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

  $('#blogs').on('click', function(event){
    event.preventDefault()
    allBlogs()
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

function makeCall(){
  if($(".blog-posts").length){
    id = $('body').attr('id')
    $.ajax({
      url: `/users/${id}.json`,
      method: 'GET',
      success: function(data){
          data.posts.forEach((post) => {
          var userPost = new Post(post.avatar, post.car_rental, post.climate, post.content, post.diet, post.flight, post.id, post.title, post.total_cost, post.destination, post.user, post.pins)
           $(".blog-posts").append(userPost.appendImage())
        });
      }
    });
  }
}
