class Post{
  constructor(avatar, car_rental, climate, content, diet, flight, id, title, total_cost){
    this.avatar = avatar;
    this.car_rental = car_rental;
    this.climate = climate;
    this.content = content;
    this.diet = diet;
    this.flight = flight;
    this.id = id;
    this.title = title;
    this.total_cost = total_cost;
  }


  appendImage(){
    return `<a href=/posts/${this.id}><img src=${this.avatar.url} style="max-height: 200px; max-width: 200px;"></a>`
  }

//
//
// }
