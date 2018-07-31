document.addEventListener("DOMContentLoaded", function(){

//Autocomplete to Events search location
var input = document.getElementById('search');
  if(input!== null){
    var autocomplete = new google.maps.places.Autocomplete(input);
    autocomplete.setFields(
      ['address_components', 'geometry', 'icon', 'name']);
  }
  //
  var event_address = document.getElementById('event_address');
    if(event_address!== null){
      var autocomplete = new google.maps.places.Autocomplete(event_address);
      autocomplete.setFields(
        ['address_components', 'geometry', 'icon', 'name']);
    }
    var event_address = document.getElementById('location');
      if(event_address!== null){
        var autocomplete = new google.maps.places.Autocomplete(location);
        autocomplete.setFields(
          ['address_components', 'geometry', 'icon', 'name']);
      }
});
