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

function makePinAjaxCall(event){
  debugger;
  var id = $('body').attr('id')
  $.ajax({
    url: `/users/${id}/pins`,
    dataType: 'json',
    method: 'GET',
    success: function(data){
      debugger;
      loadPins(data);
    }
  })
}


function loadPins(data){
  debugger;
  $('.all_pins').html(" ")
  if(data.length === 0){
    $('.all_pins').html("You do not have any Pins")
    $('.small.modal').modal('show');
  }

  data.forEach((pin) =>{
    var newPin = new Pin(pin.id, pin.user, pin.status, pin.post)
    var post = new Post(pin.post.avatar, pin.post.car_rental, pin.post.climate, pin.post.content, pin.post.diet, pin.post.flight, pin.post.id, pin.post.title, pin.post.total_cost);
    if(newPin.status === true){
      $('.small.modal').modal('show');
      debugger;
      $('ul.pinned_pins').append(newPin.appendPins())
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
