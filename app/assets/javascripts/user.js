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
  $(".rating").rating();

  $('#nested').on('click', function(event){
    $('.ui.modal').modal('show')
    $(".error").hide()
  })

  if($(".all-posts").length){
    allBlogs()
  }

  $('.ui.icon.input').on('input', function() {
    $('.ui.search').search({
      source: content
    })
  });

  if($(".devise_component").length || $(".login-box").length){
    $("#footer").remove()
    $("body").css({
      "background-image":  "url(../././assets/428242.jpg)",
      'background-size': 'cover'
    })
  }

  if($(".devise_component").length){
    $('.root_page_content').html(" ")
  }

  if($(".heroSlideShow").length){
    displayDesImages()
  }

  $('form.new_post').on('submit', function(event){
    event.preventDefault();
    var form = $('form.new_post')[0];
    debugger;
    var formData = new FormData(form);
    $.ajax({
      url: '/posts',
      method: 'POST',
      dataType: "json",
      data: formData,
      contentType: false,
      processData: false,
      success: function(data){
        if($(".blog-posts").length){
          destinationPosts(data);
          $('.ui.modal').modal('hide')
        }else{
          $('.ui.modal').modal('hide')
        }
      },
      error: function(err){
        $('.list').html("")
        $(".error").show()
        err.responseJSON.forEach(function(e){
          var error = "<li>"+ e +"</li>"
          document.getElementById("submit_form").disabled = false;
          $('.list').append(error)
        })
      }
    })
  })
});

function makeCall(){
  $(".blog-posts").html("")
  if($(".blog-posts").length){
    id = $('body').attr('id')
    $.ajax({
      url: "/users/"+ id + ".json",
      method: 'GET',
      success: function(data){
          data.posts.forEach(function(post){
          var userPost = new Post(post.avatar, post.car_rental, post.climate, post.content, post.diet, post.flight, post.id, post.title, post.total_cost, post.destination, post.user, post.pins)
           $(".blog-posts").append(userPost.appendImage())
        });
      }
    });
  }
}

function makeDestinationCall(){
  $.ajax({
    url: "/destinations",
    method: "GET",
    success: function(data){
    content = data.map(function(dest) {
      return {title: dest.name, url: "/destinations/" + dest.id}
    })
    }
  })
}
