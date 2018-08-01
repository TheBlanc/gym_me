
  document.addEventListener("DOMContentLoaded", function(){
   function initMap(){
     //for event#show
     var mapPlaceholder = $('#map');
    if (mapPlaceholder.length > 0){
       // latLong is a hash that contain the latitude and longitude for the map.
        var latLong = {lat: mapPlaceholder.data('latitude') , lng: mapPlaceholder.data('longitude') };
        // creates the map
        var map = new google.maps.Map(document.getElementById('map'), {
        center: latLong,
        zoom: 18
        });
        //eventName gets the marker name .
        var eventName = document.getElementById('eventName');
        //mapMarker creates the marker on the map.
        var mapMarker = new google.maps.Marker({
        map: map,
        draggable: false,
        animation: google.maps.Animation.DROP,
        position: latLong,
        title: eventName.innerHTML,
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


     //Events map
          var discoverLatLong = $('.discoverLatLong');
          if (discoverLatLong.length > 0){
            // latLong is a hash that contain the latitude and longitude for the map.
            var discovercenter = {lat: discoverLatLong.data('latitude') , lng: discoverLatLong.data('longitude') };
            var discovermap = new google.maps.Map(document.getElementById('discovermap'), {
             center: discovercenter,
             zoom: 11
             });
          }
          var eventmarkertitle = $('.eventmarkertitle')
          // var eventMarkers = []
          for (var i = 0; i < discoverLatLong.length; i++) {
            // console.log(discoverLatLong[i].attributes[1].value);
            // console.log(discoverLatLong[i].attributes[2].value);
            // console.log({lat: parseFloat(discoverLatLong[i].attributes[1].value), lng: parseFloat(discoverLatLong[i].attributes[2].value) });
            // console.log(eventmarkertitle[i].attributes[1].value);
            var contentString = eventmarkertitle[i].attributes[1].value
            var infowindow = new google.maps.InfoWindow({
              content: contentString
            });

            var eventmapMarker = new google.maps.Marker({
            map: discovermap,
            draggable: false,
            animation: google.maps.Animation.DROP,
            position: {lat: parseFloat(discoverLatLong[i].attributes[1].value), lng: parseFloat(discoverLatLong[i].attributes[2].value) },
            title: eventmarkertitle[i].attributes[1].value,
            });

            }


            eventmapMarker.addListener('click', toggleBounce);
          //toggleBounce function is the animation for the maker.
      function toggleBounce() {
        if (eventmapMarker.getAnimation() !== null) {
            eventmapMarker.setAnimation(null);
        } else {
            eventmapMarker.setAnimation(google.maps.Animation.BOUNCE);
            infowindow.open(discovermap, eventmapMarker);
        }
      };

    }
    initMap();
  });
