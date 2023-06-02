import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class NearestPharmacyPage extends StatefulWidget {
  @override
  _NearestPharmacyPageState createState() => _NearestPharmacyPageState();
}

class _NearestPharmacyPageState extends State<NearestPharmacyPage> {
  LocationData? _currentLocation;
  Set<Marker> _markers = Set<Marker>();

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    Location location = Location();
    LocationData? currentLocation;

    try {
      currentLocation = await location.getLocation();
    } catch (e) {
      currentLocation = null;
    }

    if (mounted) {
      setState(() {
        _currentLocation = currentLocation;
      });
      _setMarkers();
    }
  }

  void _setMarkers() {
    if (_currentLocation != null) {
      _markers.add(
        Marker(
          markerId: const MarkerId('pharmacy'),
          position:
              LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
          infoWindow: const InfoWindow(title: 'Sağlık Kuruluşları'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('En Yakın Sağlık Kuruluşu'),
      ),
      body: _currentLocation != null
          ? GoogleMap(
              myLocationEnabled: true,
              onMapCreated: (controller) {
                setState(() {});
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(
                    _currentLocation!.latitude!, _currentLocation!.longitude!),
                zoom: 20,
              ),
              markers: _markers,
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
