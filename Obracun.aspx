<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Obracun.aspx.cs" Inherits="Obracun" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta charset="UTF-8"/>
		<link rel="stylesheet" type="text/css" href="style.css" />
		<title>Obračun potnih stroškov</title>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" ></script>

		<script src="https://maps.googleapis.com/maps/api/js"></script>
		<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&amp;libraries=places"></script>
		<script type="text/javascript" src="/skripte.js"></script>



		<script>

		var geocoder = null;
		function initialize() {
				autocomplete1 = new google.maps.places.Autocomplete((document.getElementById('autocomplete1')),{
					types: ['geocode'] });

				autocomplete2 = new google.maps.places.Autocomplete((document.getElementById('autocomplete2')),{
					types: ['geocode'] });



       		var mapCanvas = document.getElementById('map_canvas');
        	var mapOptions = {
         		center: new google.maps.LatLng(46.056292, 14.504399),
          		zoom: 8,
          		mapTypeId: google.maps.MapTypeId.ROADMAP
        	}
        	var map = new google.maps.Map(mapCanvas, mapOptions);
        	geocoder = new google.maps.Geocoder();

      	}
      	google.maps.event.addDomListener(window, 'load', initialize);


		function geolocate() {
  			if (navigator.geolocation) {
    			navigator.geolocation.getCurrentPosition(function(position) {
      			var geolocation = new google.maps.LatLng(
          		position.coords.latitude, position.coords.longitude);
      			//autocomplete.setBounds(new google.maps.LatLngBounds(geolocation,geolocation));
    			});
  			}
		}

		function getAddress(){
			var fromPlace = document.getElementById("autocomplete1");
			var toPlace = document.getElementById("autocomplete2");
			geocoder.geocode({'address': fromPlace}, callback(results,status));
			geocoder.geocode({'address': toPlace}, callback(results,status));
		}

		function callback(response, status){
			if(status != google.maps.DistanceMatrixStatus.OK){
				alert("Error was: " + status);
			} else {
				var responseElements = response.rows[0].elements;
				var result = results[0].distance.text;
				document.getElementById('distance').value = result;

			}
		}


		</script>

</head>
<body>



		<header>

				<h1>Obračun potnih stroškov</h1>

		</header>
		<div id="menu">
			<ul>
				<li>
					<a href="/home.aspx">
						<img src="images/home.png" alt="Domov"/>
					</a>
				</li>
				<li>
					<a href="/Obracun.aspx">
						<img src="images/calculator.png" alt="Obračun"/>
					</a>
				</li>
				<li>
					<a href="/Zgodovina.aspx">
						<img src="images/images.png" alt="Zgodovina"/>
					</a>
				</li>
				<li>
					<a href="/About.aspx">
						<img src="images/question-mark.png" alt="About"/>
					</a>
				</li>
				<li>
					<a id="loginclick" href="#">
						<img src="images/login.png" alt="Login"/>
					</a>
				</li>
				<li>
					<a href="/Register.aspx">
						<img src="images/register.png" alt="Register"/>
					</a>
				</li>
			</ul>

		</div>

		<div id="input">
		<form>
			<strong>Začetek:</strong><br/>
			
			<input id="autocomplete1" name="from" placeholder="Enter your address"
              type="text"/>
            
			<br/>
			<strong>Konec:</strong><br/>
			<input id="autocomplete2" placeholder="Enter your address"
              type="text"/><br/>
			<strong>Poraba goriva:</strong><br/>
			<input type="text" name="poraba" id="poraba"/><br/>
			<button id="izracunaj" type="button">Izračun</button><br/>
			<strong>Rezultat:</strong><br/>
			<textarea id="rezultat" rows="1" cols="20"></textarea>
			<p id="distance"></p>
		</form>
		</div>

		<div id="map_canvas"></div>


		<div id="login">
			<strong>e-mail:</strong><br/>
			<input id="loginEMail" type="text"/><br/>
			<strong>Password:</strong><br/>
			<input id="loginPassword" type="password"/><br/>
			<button id="IWannaLogin" type="button">Login</button>
		</div>




		<footer>
			<p id="MadeBy">Made by: Rok Dukič</p>
		</footer>

	    <script type="text/javascript">
	       window.onload = assignListeners();
		</script>
</body>

<script>
    /*window.onload = function(){
		document.getElementById('loginclick').addEventListener('click',toggleVisibility);
	}*/

    $(document).ready(function () {
        var CookieSet = $.cookie('loggedIn', 'true');
        if (CookieSet == null) {
            document.getElementById('login').style.visibility = "visible";
        }
        $("#loginclick").click(function () {
            toggleVisibility();
        });

        $("#IWannaLogin").click(function () {
            $lEMail = $('#loginEMail').val();
            $lPass = $('#loginPassword').val();
            $.ajax({
                url: 'vpis.php',
                type: 'post',
                data: {
                    'funkcija': 'vpis',
                    'logEMail': $lEMail,
                    'logPass': $lPass
                },
                success: function (response) { alert("something" + response); }
            });
        });
    });
	</script>
</html>
