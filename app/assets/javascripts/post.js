class Post{

  constructor(avatar, car_rental, climate, content, diet, flight, id, title, total_cost, destination, user, pins){
    this.avatar = avatar;
    this.car_rental = car_rental;
    this.climate = climate;
    this.content = content;
    this.diet = diet;
    this.flight = flight;
    this.id = id;
    this.title = title;
    this.total_cost = total_cost;
    this.destination = destination;
    this.user = user;
    this.pins = pins
  }



  appendImage(){
    return `<a href=/posts/${this.id} onClick=selectedImage(event)><img src=${this.avatar.url} style="max-height: 200px; max-width: 200px;"></a>`
  }

  appendPostDetail(){
    if(this.user.id == result){
    return `<h2> Title of Entry: ${this.title}</h2><h3> Trip to: ${this.destination.name}</h3><br>Cost of Trip : ${this.total_cost}<br>
    <h3>Ratings for Trip Factors</h3><br>Flight: ${this.flight}<br>Climate: ${ this.climate}<br>Car_rental: ${this.car_rental}<br>Food: ${this.diet}<br>
    Content: ${this.content}<br></br><img src=${this.avatar.url} style="max-height: 200px; max-width: 200px;">
    <a href='/posts/${this.id}/edit'>Update Post</a>`

  }else{
    this.pins.forEach((pin)=>{
      if(pin.user_id == result && this.user.id != result){
        return `<h2> Title of Entry: ${this.title}</h2><h3> Trip to: ${this.destination.name}</h3><br>Cost of Trip : ${this.total_cost}<br>
        <h3>Ratings for Trip Factors</h3><br>Flight: ${this.flight}<br>Climate: ${ this.climate}<br>Car_rental: ${this.car_rental}<br>Food: ${this.diet}<br>
        Content: ${this.content}<br></br><img src=${this.avatar.url} style="max-height: 200px; max-width: 200px;"><a href=/posts/${this.id}/pins>Pin Post</a>`
      }
    })
  }
}

  appendPostImage(){
    return `<a href=/posts/${this.id} ><img src=${this.avatar.url} style="max-height: 200px; max-width: 200px;"></a>`
  }

  appendDestinationPost(){
    var id = $('body').attr('id')
    if(this.user.id == id){
      return `<a href=/posts/${this.id} ><img src=${this.avatar.url} style="max-height: 200px; max-width: 200px;"></a>`
    }
  }
}


function selectedImage(event){
  event.preventDefault();
  var url = event.srcElement.parentNode.pathname
  $.ajax({
    url: url,
    dataType: 'json',
    method: 'GET',
    success: function(data){
      debugger;

      var user = new User(data.post.user.email, data.post.user.id, data.post, data.post.pins)
      var post = new Post(data.post.avatar, data.post.car_rental, data.post.climate, data.post.content, data.post.diet, data.post.flight, data.post.id, data.post.title, data.post.total_cost, data.post.destination, data.post.user, data.post.pins)
      $(".post_image").html(" ")
      $(".post_details").append(post.appendPostDetail())
    }
  })

}

// function displayPost(data){
//   var object = data.post
//   var post = new Post(object.avatar, object.car_rental, object.climate, object.content, object.diet, object.flight, object.id, object.title, object.total_cost, object.destination, object.user, object.pins)
//   $('#post_show').html(post.appendPostDetail())
// }


function destinationPosts(data){
  var id = $('body').attr('id')
  $('.form').html(" ")
  data.posts.forEach((object)=>{
    var post = new Post(object.avatar, object.car_rental, object.climate, object.content, object.diet, object.flight, object.id, object.title, object.total_cost, object.destination, object.user, object.pins)
    $('.form').html(post.appendDestinationPost())
  })
}
