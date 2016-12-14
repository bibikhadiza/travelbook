class Pin{
  constructor(id, user, status, post){
    this.id = id;
    this.user = user;
    this.status = status;
    this.post = post;
  }


  appendPins(){
    return `<li>${this.post.title}<br><a href=/posts/${this.post.id}><img src=${this.post.avatar.url} style="max-height: 200px; max-width: 200px;"></a><button type="button" onclick=locationsVisited(${this.id});>Visited Location</button></li>`
  }

}
  // function Pin(attributes){
  //   this.id = attributes.id;
  //   this.user = attributes.user;
  //   this.status = attributes.status;
  //   this.post = attributes.post;
  // }
  //
  // Pin.prototype.appendPins() = function(){
  //   return `<li>${this.post.title}<br><a href=/posts/${this.post.id}><img src=${this.post.avatar.url} style="max-height: 200px; max-width: 200px;"></a><button type="button" onclick=locationsVisited(${this.id});>Visited Location</button></li>`
  // }
  //
  // var alex = new Pin(2, { }, "hey", { })
  // alex.appendPins()





function makePinAjaxCall(event){
  var id = $('body').attr('id')
  $.ajax({
    url: `/users/${id}/pins`,
    dataType: 'json',
    method: 'GET',
    success: function(data){
      loadPins(data);

    }
  })
}


function loadPins(data){
  $('ul').html(" ")
  if(data.length === 0){
    $('h3').html("You do not have any Pins")
  }

  data.forEach((pin) =>{
    var newPin = new Pin(pin.id, pin.user, pin.status, pin.post)
    var post = new Post(pin.post.avatar, pin.post.car_rental, pin.post.climate, pin.post.content, pin.post.diet, pin.post.flight, pin.post.id, pin.post.title, pin.post.total_cost);
    if(newPin.status === true){
      $('h3').html("My Active Pins")
      $('ul').append(newPin.appendPins())
  }
  })
}

function locationsVisited(id){
  $.ajax({
    url: `/pins/${id}`,
    dataType: 'json',
    method: 'PATCH'
  }).done(function(){
    makePinAjaxCall();
  })
}
