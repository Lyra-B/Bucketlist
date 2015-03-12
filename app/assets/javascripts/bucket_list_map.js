function BucketListMap(latitude, longitude, zoom_level){
  this.center = new google.maps.LatLng(latitude,longitude);
  this.zoom_level = zoom_level;
}
var map;
BucketListMap.prototype.drawMap = function(id){
  // var millLatLng = new google.maps.LatLng(52.1512817, -0.3153073)

  var mapOptions = {
    center: this.center,
    zoom: this.zoom_level
  };

  var mapCanvas = $('#map-canvas')[0];
  this.map = new google.maps.Map(mapCanvas, mapOptions);
}

BucketListMap.prototype.addMarker = function(latitude,longitude,title){
  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(latitude, longitude),
    map: this.map,
    title: title
  })

  google.maps.event.addListener(marker, 'click', function(){
    console.log("clicked");
  })
}

// new google.maps.LatLng(latitude, longitude)