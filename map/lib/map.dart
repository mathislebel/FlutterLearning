import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _controller;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _fetchMarkers();
  }

  Future<void> _fetchMarkers() async {
    final response = await http.get(Uri.parse('https://example.com/api/markers'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        _markers = data.map((item) {
          return Marker(
            markerId: MarkerId(item['id'].toString()),
            position: LatLng(item['latitude'], item['longitude']),
            infoWindow: InfoWindow(
              title: item['name'],
              snippet: item['description'],
            ),
          );
        }).toSet();
      });
    } else {
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Example'),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          _controller = controller;
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194), // Example coordinates
          zoom: 10,
        ),
        markers: _markers,
      ),
    );
  }
}
