document.addEventListener("DOMContentLoaded", function(){

  var mapButton = document.querySelector('#map-button');

  mapButton.addEventListener("click", function(e) {
    $('#eventsMap').slideToggle();
    $('#showText').toggleClass('hidden');
    $('#hideText').toggleClass('hidden');
    $('#hide-map-desc').toggleClass('hidden');
    $('#show-map-desc').toggleClass('hidden');

  });








});
