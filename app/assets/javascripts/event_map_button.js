document.addEventListener("DOMContentLoaded", function(){

  var mapButton = document.querySelector('#map-button');
  var mapDisplay = document.querySelector('#eventsMap');

  mapButton.addEventListener("click", function(e) {
    $('#eventsMap').toggleClass('hidden');
    $('#map').toggleClass('hidden');

  });








});
