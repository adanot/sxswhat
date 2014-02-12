<script src="http://maps.googleapis.com/maps/api/js?sensor=false&v=3.exp"></script>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.gmap.min.js"></script>
<script type="text/javascript">
jQuery(document).ready(function($) {
	$("#responsive_map").gMap({
		 maptype: google.maps.MapTypeId.ROADMAP, 
		 zoom: 14, 
		 markers: [{
			 latitude: -37.7990008672476, 
			 longitude: 145.05681728039553, 
			 html: "<img src='http://yava.ro/images/logo.png' width='147' height='29'><br/>Your address or description here.<br><strong>Drag the marker anywhere!</strong>", 
			 popup: true, 
			 flat: true, 
			 icon: { 
				 image: "icons/carwash.png", 
				 iconsize: [32, 37], 
				 iconanchor: [15, 30], 
				 shadow: "icons/icon-shadow.png", 
				 shadowsize: [32, 37], 
				 shadowanchor: null}
				} 
			], 
		 panControl: true, 
		 zoomControl: true, 
		 mapTypeControl: true, 
		 scaleControl: true, 
		 streetViewControl: true, 
		 scrollwheel: true, 
		 styles: [ { "stylers": [ { "hue": "#832bb4" }, { "gamma": 1.58 } ] } ], 
		 onComplete: function() {
			 // Resize and re-center the map on window resize event
			 var gmap = $("#responsive_map").data('gmap').gmap;
			 window.onresize = function(){
				 google.maps.event.trigger(gmap, 'resize');
				 $("#responsive_map").gMap('fixAfterResize');
			 };
		}
	});
});
</script>
<div id="responsive_map"></div>
<style type="text/css">
#responsive_map {height: 1080px; width: 100%;}
#responsive_map div {-webkit-border-radius: 10px; -moz-border-radius: 10px; border-radius: 10px;}
.gm-style-iw {max-width: none !important; min-width: none !important; max-height: none !important; min-height: none !important; overflow-y: hidden !important; overflow-x: hidden !important; line-height: normal !important; padding: 5px !important; }
</style>