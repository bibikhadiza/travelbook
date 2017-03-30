class Destination{

  constructor(name, id, posts, pictures){
    this.name = name;
    this.id = id;
    this.posts = posts;
    this.pictures = pictures
  }
}

function displayDesImages(){
  var id = $('.heroSlideShow').attr('id')
  $.ajax({
    url: `/destinations/${id}.json`,
    method: 'GET',
    success: function(data){
      if( data.destination.posts.length < 3){
        data.destination.pictures.forEach((p, i) => {
          if(i == 0){
            var result = `<img class="active" src=./../assets/${p.split("/")[9]} height="400" width="400">`} else {
            var result = `<img src=./../assets/${p.split("/")[9]} height="400" width="400">`
          }
          $(".fade-group").append(result)
          $('.fade-group h2').html(data.destination.name)
        })
        slideShow()
        } else {
          data.destination.posts.forEach((p, i ) => {
            if(i == 0){
              var result = `<img class="active" src=./../${p.avatar.url} height="400" width="400">`} else {
                var result = `<img src=./../${p.avatar.url} height="400" width="400">`
            }
          $(".fade-group").append(result)
          $('.fade-group h2').html(data.destination.name)
          slideShow()
          })
      }

      if(data.destination.posts.length > 0){
        $(".show_cards").html(" ");
        data.destination.posts.forEach((p) => {
          var post = new Post(p.avatar, p.car_rental, p.climate, p.content, p.diet, p.flight, p.id, p.title, p.total_cost, p.destination, p.user, p.pins, p.created_at)
          $(".show_cards").append(post.postCards())
        })
      }
    }
  })
}

function slideShow(){
  setInterval(function(){
  var active = $('.fade-group .active')
    if (active.next().length > 0){
      var next = active.next()
    }else {
      var next = $('.fade-group img:first')
    }
    next.css('z-index', '2');
    active.fadeOut(1000, function(){
      active.css("z-index", '1').show().removeClass('active')
      next.css('z-index', '3').addClass('active')
    })
  }, 3000)
}
