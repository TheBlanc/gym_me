document.addEventListener("DOMContentLoaded", function(){
    var markers = [];
    var contentString;
    //events map
    var eventName = document.getElementById('eventName');
    var eventMapID = $('#map');
    var eventlatLong = { lat: eventMapID.data('latitude'), lng: eventMapID.data('longitude') };
    //event show page map
    var eventsLatLongClass = $('.eventsLatLong');
    var eventsCoordinates = {lat: eventsLatLongClass.data('latitude') , lng: eventsLatLongClass.data('longitude') };
    var eventsMapID = $('#eventsMap');
    var eventsMarkerTitle = document.getElementsByClassName('eventsMarkerTitle');


    // document.querySelector('#eventsMap').className += "show"
    document.querySelector('#eventsMap').style.height = "300px"
    console.log(eventsMarkerTitle[0].attributes[1].value);

    // console.log(eventsMarkerTitle[0].attributes[1].value);


    //initMap call google api to display the map
    function initMap(){
        eventMap();
        eventsMap();
        function eventMap() {
            //event map
            if (eventMapID.length > 0) {
                // latLong is a hash that contain the latitude and longitude for the map.
                var eventMap = new google.maps.Map(document.getElementById('map'), {
                center: eventlatLong,
                mapTypeControl: false,
                zoom: 12
                });

                // Map start off as hidden for mobile
                eventMap.className += "hidden";
                eventMap.style.height = "500px";


                var eventMapMarker = mapMarker(eventMap, eventlatLong)
                    eventMapMarker.addListener('click', function(){
                    toggleBounce(this);
                    infoWindow('<h1>'+eventName.innerHTML+'</h1>').open(eventMap, this);

                });
            }
        }
        //evetns map
        function eventsMap() {

            if (eventsMapID.length > 0){
                var eventsMap = new google.maps.Map(document.getElementById('eventsMap'), {
                center: eventsCoordinates,
                mapTypeControl: false,
                zoom: 11
                });
                drop(eventsLatLongClass, eventsMap);

                // Map start off as hidden for mobile
                eventsMap.className += "hidden";

        };
        }
    }//initMap function done!

    //mapMarker creates markers
    function mapMarker(map, latLong, title) {
        marker = new google.maps.Marker({
        map: map,
        draggable: false,
        animation: google.maps.Animation.DROP,
        position: latLong,
        title: "test",
        });
        return marker;
    };

    function addMarkerWithTimeout(position, name, map) {
       window.setTimeout(function() {
           var marker = new google.maps.Marker({
             position: position,
             map: map,
            });
            marker.addListener('click', function(){
                infoWindow('<h1>' + name + '</h1>').open(map, this);
            });
           // infoWindow('<h1>'+eventName.innerHTML+'</h1>').open(eventMap, this);
         markers.push(marker);
       });
    }
     function infoWindow(contentString) {
         var infoWindow = new google.maps.InfoWindow({
               content: contentString
             });
             return infoWindow;
    }
     function clearMarkers() {
       for (var i = 0; i < markers.length; i++) {
         markers[i].setMap(null);
       }
       markers = [];
    }
    function drop(cordinatesArray, map) {
       clearMarkers();
       for (var i = 0; i < cordinatesArray.length; i++) {
           var name = eventsMarkerTitle[i].attributes[1].value;
           var position = {lat: parseFloat(cordinatesArray[i].attributes[1].value), lng: parseFloat(cordinatesArray[i].attributes[2].value)};
         addMarkerWithTimeout(position, name, map, i * 200);
       }
    }

    initMap()

});
