var longitude;
var latitude;
document.addEventListener("DOMContentLoaded", function(){
    longitude = document.getElementById('longitude');
    latitude = document.getElementById('latitude');
longitude  = parseFloat(longitude.textContent)
latitude = parseFloat(latitude.textContent)


});

function initMap(){
  console.log(longitude);
  console.log(latitude);
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: latitude, lng:longitude},
    zoom: 17
  });

}
