class Destination{

  constructor(name, id, posts, pictures){
    this.name = name;
    this.id = id;
    this.posts = posts;
    this.pictures = pictures
  }
}

function getDestinationImages(destination){
  var des = destination.replace(/\b\w/g, l => l.toUpperCase())
  debugger;
}
