import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocalisationPage extends StatefulWidget {
  @override
  _LocalisationPageState createState() => _LocalisationPageState();
}

class _LocalisationPageState extends State<LocalisationPage> {
  late GoogleMapController mapController;
  late LocationData currentLocation = LocationData.fromMap({
    "latitude": 34.75734289086922,
    "longitude": 10.77214426712859,
  });
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void _getLocation() async {
    var location = Location();
    try {
      currentLocation = await location.getLocation();
      _updateMapCamera();
      _updateMarker();
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  void _updateMapCamera() {
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            currentLocation.latitude ?? 0.0,
            currentLocation.longitude ?? 0.0,
          ),
          zoom: 16.0,
        ),
      ),
    );
  }

  void _updateMarker() {
    setState(() {
      markers.clear();
      markers.add(
        Marker(
          markerId: MarkerId('currentLocation'),
          position: LatLng(
            currentLocation.latitude ?? 0.0,
            currentLocation.longitude ?? 0.0,
          ),
          infoWindow: InfoWindow(title: 'My Localisation'),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Current Localisation'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            currentLocation.latitude ?? 34.75734289086922,
            currentLocation.longitude ?? 10.77214426712859,
          ),
          zoom: 12.0,
        ),
        markers: markers,
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getLocation();
        },
        child: Icon(Icons.my_location),
      ),
    );
  }
}