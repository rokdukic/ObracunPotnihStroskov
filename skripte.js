window.toggleVisibility = function () {
    var l = document.getElementById("login");
    if (l.style.visibility == "hidden") {
        l.style.visibility = "visible";
    } else {
        l.style.visibility = "hidden";
    }
}


window.sum = function () {
    var skupaj = 0;
    var razdalja = 0;
    var zac, kon, pGoriva;
    zac = document.getElementById("autocomplete1").value;
    kon = document.getElementById("autocomplete2").value;
    pGoriva = document.getElementById("poraba").value;
    /*skupaj = (parseFloat(kon) - parseFloat(zac)) * parseFloat(pGoriva);
	document.getElementById("rezultat").value = skupaj;*/
    var coordsOd = getAddress(zac);
    var origin1 = new google.maps.LatLng(coordsOd[0], coordsOd[1]);
    var coordsDo = getAddress(kon);
    var destinationB = new google.maps.LatLng(coordsDo[0], coordsDo[1]);
    var service = new google.maps.DistanceMatrixService();
    var results = service.getDistanceMatrix({
        origins: [origin1, zac],
        destinations: [kon, destinationB],
        travelMode: google.maps.TravelMode.DRIVING,
        unitSystem: google.maps.UnitSystem.METRIC,
        avoidHighways: false,
        avoidTolls: false
    });

    callback(results, google.maps.DistanceMatrixStatus.OK);

    razdalja = document.getElementById("distance").value;
    skupaj = razdalja / pGoriva;
    document.getElementById("rezultat").value = skupaj;
}


window.assignListeners = function () {
    document.getElementById('loginclick').addEventListener('click', toggleVisibility, false);
    //	document.getElementById('izracunaj').addEventListener('click',sum);
    document.getElementById('autocomplete1').addEventListener('focus', geolocate, false);
    document.getElementById('autocomplete2').addEventListener('focus', geolocate, false);
    document.getElementById('izracunaj').onclick = function () {
        sum();
        saveToTable();
    }
    //alert('done assigning listeners');
}
