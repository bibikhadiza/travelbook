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

  // $('.nav_selection').on('click', function(e){
  //   debugger;
  //   var ins = $(e.target).text()
  //   makePostTypeCall(ins)
  // })

  $('#nested').on('click', function(event){
    $('.ui.modal').modal('show')
    $(".error").hide()
  })

  // $('.pin_it').on('click', function(){
  //   makePinAjaxCall()
  // })

  if($(".all-posts").length){
    allBlogs()
  }

  $('.ui.icon.input').on('input', function() {
    $('.ui.search').search({
      source: content
    })
  });


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
        err.responseJSON.forEach((e) => {
          var error = `<li>${e}</li>`
          document.getElementById("submit_form").disabled = false;
          $('.list').append(error)
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

function makeDestinationCall(){
  $.ajax({
    url: "/destinations",
    method: "GET",
    success: function(data){
    content = data.map(function(dest) {
      return {title: dest.name, url: `/destinations/${dest.id}`}
    })
    }
  })
}
