
function initMap(){

  var mapPlaceholder = $('#map');
  // latLong is a hash that contain the latitude and longitude for the map.
  var latLong = {lat: mapPlaceholder.data('latitude') , lng: mapPlaceholder.data('longitude') };

  map = new google.maps.Map(document.getElementById('map'), {
    center: latLong,
    zoom: 15,
    mapTypeControl: false
  });

var mapMarker = document.getElementById('eventName');

//mapMarker  variable contrain the marker on the map.
  var mapMarker = new google.maps.Marker({
      map: map,
      draggable: false,
      animation: google.maps.Animation.DROP,
      position: latLong,
      title: mapMarker.innerHTML,
    });
    mapMarker.addListener('click', toggleBounce);

//toggleBounce function is the animation for the maker.
    function toggleBounce() {
       if (mapMarker.getAnimation() !== null) {
         mapMarker.setAnimation(null);
       } else {
         mapMarker.setAnimation(google.maps.Animation.BOUNCE);
       }

     };
}


// var longitude;
// var latitude;
// document.addEventListener("DOMContentLoaded", function(){
//     longitude = document.getElementById('longitude');
//     latitude = document.getElementById('latitude');
// longitude  = parseFloat(longitude.textContent)
// latitude = parseFloat(latitude.textContent)
//
//
// });
