document.addEventListener("DOMContentLoaded", function(){

//Autocomplete to Events#index search location
var input = document.getElementById('search');
  if(input!== null){
    var autocomplete = new google.maps.places.Autocomplete(input);
    autocomplete.setFields(
      ['address_components', 'geometry', 'icon', 'name']);
  }
  //Autocomplete when creating event#show 
  var event_address = document.getElementById('event_address');
    if(event_address!== null){
      var autocomplete = new google.maps.places.Autocomplete(event_address);
      autocomplete.setFields(
        ['address_components', 'geometry', 'icon', 'name']);
    }
    //Autocomplete for user#edit page
    var event_address = document.getElementById('postal_code');
      if(event_address!== null){
        var autocomplete = new google.maps.places.Autocomplete(postal_code);
        autocomplete.setFields(
          ['address_components', 'geometry', 'icon', 'name']);
      }
});
