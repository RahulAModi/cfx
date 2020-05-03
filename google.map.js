var default_lat = 19.125362;
var default_lng = 72.999199;
var default_zoom = 17;
var pns;
var global_lat;
var global_lng;
if(global_lat!=0 && global_lng!=0){
 default_lat = global_lat;
 default_lng = global_lng;
}
var lat = null;
var lng = null;
var map = null;
var geocoder = null;
var marker = null;
var myListener = null;
var map;
var infowindow;
var pincode; 
var orgCity;
var orgState;
var bounds;
function initMap() {
	  
	var latLng = new google.maps.LatLng(default_lat, default_lng);
	geocoder = new google.maps.Geocoder();
	 bounds  = new google.maps.LatLngBounds();
	 
    map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: default_lat, lng: default_lng},
      zoom: default_zoom,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });
    
    var infowindow = new google.maps.InfoWindow();
   	
    if(global_lat==0 && global_lng==0){
    	// Try HTML5 geolocation.
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
            latLng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
            marker = new google.maps.Marker({
	    	    map: map,
	    	    position: latLng,
	    	    draggable: true
	    	});
			bounds.extend(latLng);
            var latlng = {lat: position.coords.latitude, lng: position.coords.longitude};
            pincode = document.getElementById(pns+'organizationPincode').value; 
            geocoder.geocode({'location': latlng}, function(results, status) {
            	console.log("1");
            	//getCensus(latlng.lat, latlng.lng);
               
            });
            
            
            google.maps.event.addListener(marker, 'dragend', function() {
            	latLng = new google.maps.LatLng(marker.getPosition().lat(), marker.getPosition().lng());
            	bounds.extend(latLng);
				//console.log("if: 'dragend': latlng" + marker.getPosition().lat() + " : " + marker.getPosition().lng() + " : "+ pin + " : " + pincode);
	    	    pincode = document.getElementById(pns+'organizationPincode').value; 
	    	    var latlng = {lat: marker.getPosition().lat(), lng: marker.getPosition().lng()};
                geocoder.geocode({'location': latlng}, function(results, status) {
                	console.log("2");
                	getCensus(latlng.lat, latlng.lng);
                   
                  });
	    	    
	    	});

            google.maps.event.addListener(map, 'click', function(event) {
               marker.setPosition(event.latLng);
               //console.log("if : 'click" + marker.getPosition().lat() + " : "+ marker.getPosition().lng());
			   latLng = new google.maps.LatLng(marker.getPosition().lat(), marker.getPosition().lng());
			   bounds.extend(latLng);
	    	   pincode = document.getElementById(pns+'organizationPincode').value;
	    	   var latlng = {lat: marker.getPosition().lat(), lng: marker.getPosition().lng()};
                geocoder.geocode({'location': latlng}, function(results, status) {
                	
                	console.log("3");
                	getCensus(latlng.lat, latlng.lng);
                    
                  });
	    	   
	    	});
            
          }, function() {
            handleLocationError(true, infowindow, map.getCenter());
          });
        } else {
          // Browser doesn't support Geolocation
          handleLocationError(false, infowindow, map.getCenter());
        }
    	
    }else{
    	consol.log("else")
    	var pos = {
                  lat: default_lat,
                  lng: default_lng
        };
    	latLng = new google.maps.LatLng(default_lat, default_lng);
           marker = new google.maps.Marker({
    	    map: map,
    	    position: latLng,
    	    draggable: true
    	});
		bounds.extend(latLng);
        var latlng = {lat: default_lat, lng: default_lng};
        geocoder.geocode({'location': latlng}, function(results, status) {
        	console.log("4");
        	//getCensus(latlng.lat, latlng.lng);
        	
         });
           
         google.maps.event.addListener(marker, 'dragend', function() {
        	latLng = new google.maps.LatLng(marker.getPosition().lat(), marker.getPosition().lng());
			bounds.extend(latLng);
        	//console.log("else : 'dragend': latlng" + marker.getPosition().lat() + " : "+ marker.getPosition().lng());
        	pincode = document.getElementById(pns+'organizationPincode').value;
    	    var latlng = {lat: marker.getPosition().lat(), lng: marker.getPosition().lng()};
            geocoder.geocode({'location': latlng}, function(results, status) {
            	console.log("5");
            	getCensus(latlng.lat, latlng.lng);
            	
            });
    	    
    	});
           
        google.maps.event.addListener(map, 'click', function(event) {
          marker.setPosition(event.latLng);
          latLng = new google.maps.LatLng(marker.getPosition().lat(), marker.getPosition().lng());
		  bounds.extend(latLng);
          //console.log("else : 'click'"+ marker.getPosition().lat() + " : "+ marker.getPosition().lng());
          pincode = document.getElementById(pns+'organizationPincode').value;
    	   var latlng = {lat: marker.getPosition().lat(), lng: marker.getPosition().lng()};
            geocoder.geocode({'location': latlng}, function(results, status) {
            	console.log("6");
            	getCensus(latlng.lat, latlng.lng);
            	
            	
              });
    	   
    	});
    }
   	
	function handleLocationError(browserHasGeolocation, infoWindow, pos) {
		infoWindow = new google.maps.InfoWindow({map: map});
		infoWindow.setPosition(pos);
		infoWindow.setContent(browserHasGeolocation ? 'Error: The Geolocation service failed.' : 'Error: Your browser doesn\'t support geolocation.');
	}

}
  
function updateMarkerPosition(latitude, langitude, gisPincode) {
	  var pos = {
              lat: latitude,
              lng: langitude
	  };
	 var latLng = new google.maps.LatLng(latitude, langitude);

	 var infowindow = new google.maps.InfoWindow();
	 infowindow.setPosition(pos);
	 var latlng = {lat: latitude, lng: langitude};
	 pincode = document.getElementById(pns+'organizationPincode').value;
	 geocoder.geocode({'location': latlng}, function(results, status) {
		 

			map.setZoom(default_zoom);
			//add code for error
			if(latlng){
				marker.setPosition(latlng);
			}
			
			pos = {
				  lat: marker.getPosition().lat(),
				  lng: marker.getPosition().lng()
				};
      var pin = gisPincode;
      
      console.log("update : 'location': latlng " + latitude + " : "+ langitude + " : " + pin + " : " + pincode);
     
      if(pin == pincode){
          pos = {
				  lat: latitude,
				  lng: langitude
				};
          var latLng = new google.maps.LatLng(latitude, langitude);
			 bounds.extend(latLng);
      }else if (pin === undefined){
     	 latitude = marker.getPosition().lat();
          langitude = marker.getPosition().lng();
          pos = {
				  lat: marker.getPosition().lat(),
				  lng: marker.getPosition().lng()
				};
          var latLng = new google.maps.LatLng(latitude, langitude);
          bounds.extend(latLng);
      }else{
      	pos = confirmPinCodeChange(marker, pin, pincode);
      }
			map.setCenter(marker.position);
			map.panTo(marker.position);
		 
     });
}

function confirmPinCodeChange(marker, pin, pincode){
	var pos = {
			  lat: marker.getPosition().lat(),
			  lng: marker.getPosition().lng()
			};
	map.setCenter(marker.position);
	map.panTo(marker.position);
	return pos;
}

function displayPostcode(address) {
  var pin;
  for (p = address.length-1; p >= 0; p--) {
    if (address[p].types.indexOf("postal_code") != -1) {
       pin = address[p].long_name;
    }
  }
  return pin;
}

function setMapCenter(latitude, langitude){
	var pos = {
            lat: latitude,
            lng: langitude
	};
	map.setCenter(pos);
}

function setPlaceDetails(placeId){
	geocoder.geocode({'placeId': placeId}, function(results, status) {

        if (status == google.maps.GeocoderStatus.OK) {
        	map.setZoom(default_zoom);
            map.setCenter(results[0].geometry.location);
            marker.setPosition(results[0].geometry.location)
        }else{
        	console.log('Geocoder failed due to: ' + status);
        }
        
      });
	
	return marker;
}