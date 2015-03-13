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

BucketListMap.prototype.addMarker = function(latitude,longitude,title){
  var modal = new google.maps.InfoWindow({
      content: '<p>Hello!<p>'
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
  var _this = this
  var latLngArray = $('#map-canvas').data("activities");
  $.ajax ({
    url: '/activities',
    type: 'GET',
    data: {
      travellerId: travellerId
    },
    success: function(){
      for (i = 0; i < latLngArray.length; i++) {
        _this.addMarker(latLngArray[i].latitude, latLngArray[i].longitude, latLngArray[i].name);
      };
    }
  })
}

// new google.maps.LatLng(latitude, longitude)
