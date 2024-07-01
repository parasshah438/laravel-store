<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Store</title>
    <style>
        #map {
            height: 700px;
            width: 100%;
        }
    </style>
    <div class="row">
        <div class="col-md-6">
            <div class="left-section">
                <h2>Nearby Stores</h2>
                <ol id="nearbyStoresList">
                </ol>
            </div>
        </div>
        <div class="col-md-6">
            <div class="right-section">
                <h2>All Store Details</h2>
                <ol id="allStoresList">
                </ol>
            </div>
        </div>
        <div class="col-md-12">
            <h2>Map</h2>
            <div id="map"></div>
        </div>
    </div>
</head>
<body>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        $(document).ready(function() {
            //getstores
            getUserLocation();
        });

        function getDistance(lat1, lon1, lat2, lon2) {
            var R = 6371;
            var dLat = (lat2 - lat1) * (Math.PI / 180);
            var dLon = (lon2 - lon1) * (Math.PI / 180);
            var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) + Math.cos(lat1 * (Math.PI / 180)) * 
            Math.cos(lat2 * (Math.PI / 180)) *
            Math.sin(dLon / 2) * Math.sin(dLon / 2);
            var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
            var distance = R * c;
            return distance.toFixed(2);
        }

        function displayStores(stores, containerId, userLatitude, userLongitude) {
            var $container = $("#" + containerId);
            $container.empty();
            stores.sort(function(a, b) {
                var distanceX = getDistance(userLatitude, userLongitude, a.geometry.location.lat, a.geometry
                    .location.lng);
                var distanceY = getDistance(userLatitude, userLongitude, b.geometry.location.lat, b.geometry
                    .location.lng);
                console.log(distanceX);
                return distanceX - distanceY;
            });
            $.each(stores, function(index, store) {
                var distance = getDistance(
                    userLatitude,
                    userLongitude,
                    store.geometry.location.lat,
                    store.geometry.location.lng
                );
                var listItem =
                    '<li>' +
                    '<strong>' + store.name + '</strong>' +
                    '<p>Address: ' + store.vicinity + '</p>' +
                    '<p>Distance: ' + distance + ' km away</p>' +
                    '</li>';
                $container.append(listItem);
            });
        }

        function initMap(stores) {
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 14,
                center: {
                    lat: stores[0].geometry.location.lat,
                    lng: stores[0].geometry.location.lng
                }
            });
            stores.forEach(function(store) {
                var marker = new google.maps.Marker({
                    position: store.geometry.location,
                    map: map,
                    title: store.name
                });
                var infowindow = new google.maps.InfoWindow({
                    content: '<div><strong>' + store.name + '</strong><br>' + store.vicinity + '</div>'
                });
                marker.addListener('click', function() {
                    map.setCenter(marker.getPosition());
                    map.setZoom(17);
                    infowindow.open(map, marker);
                });
            });
        }

        function getUserLocation() {
            navigator.geolocation.getCurrentPosition(
                function(position) {
                    var userLatitude = position.coords.latitude;
                    var userLongitude = position.coords.longitude;
                    $.ajax({
                        url: '/nearest-stores',
                        method: 'GET',
                        data: {
                            user_latitude: userLatitude,
                            user_longitude: userLongitude,
                            radius: 5000
                        },
                        success: function(response) {
                            console.log(response.stores);
                            displayStores(response.stores, 'nearbyStoresList', userLatitude, userLongitude);
                            displayStores(response.stores, 'allStoresList', userLatitude, userLongitude);
                            initMap(response.stores);
                        },
                        error: function(error) {
                            console.error(error);
                        }
                    });
                },
                function(error) {
                    console.error(error);
                }
            );
        }
    </script>
    <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCG39EpX8oGAXWTHK-CPU_uZgtyFRkERRU&libraries=places&callback=initMap"
        async defer></script>
</body>
</html>
