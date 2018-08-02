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
    var eventsMapID = $('#eventsMap')

    console.log(eventsMapID.length);

    //initMap call google api to displau the makp
    function initMap(){
        eventMap();
        eventsMap();
        function eventMap() {
            //event map
            if (eventMapID.length > 0) {
                // latLong is a hash that contain the latitude and longitude for the map.
                var eventMap = new google.maps.Map(document.getElementById('map'), {
                center: eventlatLong,
                zoom: 18
                });
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
                zoom: 11
                });
                drop(eventsLatLongClass, eventsMap)

        };
        }
    }//initMap function done!

    //mapMarker creates markers
    function mapMarker(map, latLong, title) {
        marker= new google.maps.Marker({
        map: map,
        draggable: false,
        animation: google.maps.Animation.DROP,
        position: latLong,
        title: "test",
        });
        return marker;
    };
    //toggleBounce making the marker to bounce
    function toggleBounce(mapMarker) {
        if (mapMarker.getAnimation() !== null) {
            mapMarker.setAnimation(null);
        } else {
            mapMarker.setAnimation(google.maps.Animation.BOUNCE);
        }
    }
    // make marker to bounce
    function addMarkerWithTimeout(position, map, timeout) {
       window.setTimeout(function() {
         markers.push(new google.maps.Marker({
           position: position,
           map: map,
           animation: google.maps.Animation.DROP
         }));
       }, timeout);
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
           var position = {lat: parseFloat(cordinatesArray[i].attributes[1].value), lng: parseFloat(cordinatesArray[i].attributes[2].value)};
         addMarkerWithTimeout(position, map, i * 200);
         infoWindow('<h1>'+eventName.innerHTML+'</h1>').open(eventMap, this);
       }
    }

    initMap()

});
