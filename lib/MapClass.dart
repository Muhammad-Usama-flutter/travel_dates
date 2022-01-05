import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TabMapPage extends StatefulWidget {
  const TabMapPage({Key? key}) : super(key: key);

  @override
  _TabMapPageState createState() => _TabMapPageState();
}

class _TabMapPageState extends State<TabMapPage> {
  Completer<GoogleMapController> _controller = Completer();
  BitmapDescriptor? bitmapDescriptor;
  Set<Marker> _markers = {};


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     setDiscriptor();
  }


  void setDiscriptor()async{
    bitmapDescriptor = await BitmapDescriptor.fromAssetImage(ImageConfiguration(),
        'assets/images/upcoming_icon.png');
  }


  void _onMapCrated(GoogleMapController controller){
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('id-1'),
          position: LatLng(31.418715, 73.079109),
          infoWindow: InfoWindow(
            title: 'Faisalabad',
            snippet: 'Industrial City'
          )
        ),

      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        zoomControlsEnabled: false,
        initialCameraPosition: CameraPosition(
          target: LatLng(31.418715, 73.079109),
          zoom: 15,
        ),
        markers: _markers,
        onMapCreated: _onMapCrated,
      ),
    );
  }
}
