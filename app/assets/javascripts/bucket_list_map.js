function BucketListMap(latitude, longitude, zoom_level){
  this.center = new google.maps.LatLng(latitude,longitude);
  this.zoom_level = zoom_level;
}

var map;

BucketListMap.prototype.drawMap = function(id){

  var mapOptions = {
    center: this.center,
    zoom: this.zoom_level
  };

  var mapCanvas = $('#map-canvas')[0];
  this.map = new google.maps.Map(mapCanvas, mapOptions);
}

BucketListMap.prototype.addMarker = function(latitude,longitude,title, image_url){
  var modalContent = '<div id="description">'+'<h1>' + title + '</h1>'+'<img src="'+ image_url + '",alt=""/>'+'</div>'

  var modal = new google.maps.InfoWindow({
      content: modalContent
  });

  var marker = new google.maps.Marker({
    position: new google.maps.LatLng(latitude, longitude),
    map: this.map,
    title: title
  });

  google.maps.event.addListener(marker, 'click', function(){
    modal.open(this.map,marker)
  });
}

BucketListMap.prototype.loadMarkers = function(travellerId){
  var latLngArray = $('#map-canvas').data("activities");
  var _this = this;
  $.ajax ({
    url: '/activities',
    type: 'GET',
    data: {
      travellerId: travellerId
    },
    success: function(){
      for (i = 0; i < latLngArray.length; i++) {
        _this.addMarker(latLngArray[i].latitude, latLngArray[i].longitude, latLngArray[i].name, latLngArray[i].image_url);
        if(_this.map.getBounds().contains(new google.maps.LatLng(parseFloat(latLngArray[i].latitude),parseFloat(latLngArray[i].longitude)))){
          $('#show-current-marker').append('<p>' + latLngArray[i].name + '</p>');
        }
      };
    }
  })
}
