// ignore_for_file: camel_case_types, sort_child_properties_last, non_constant_identifier_names, avoid_types_as_parameter_names, unused_local_variable, deprecated_member_use, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class maps2 extends StatefulWidget {
  const maps2({super.key});
  @override
  State<maps2> createState() => _maps2State();
}

class _maps2State extends State<maps2> {
  late GoogleMapController _mycontroller;
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(52.033431, 44.403403),
    zoom: 14.4746,
  );

  Set<Marker> MY_markers = {
    Marker(
      draggable: true,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
        markerId: const MarkerId("1"),
        position: const LatLng(32.029215, 44.400528),
        infoWindow:
            const InfoWindow(title: "fadak", snippet: "hello for all one")),
  };

  @override
  void initState() {
    super.initState();
    _loadCustomMarker();
  }

  void _loadCustomMarker() async {
    final BitmapDescriptor customIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(48, 48)),
      'images/2.png',
    );

    setState(() {
      MY_markers.add(Marker(
        draggable: true,
          markerId: const MarkerId("marker by user"),
          position: const LatLng(32.020220, 44.400030),
          icon: customIcon,
          infoWindow: const InfoWindow(
              title: "marker_of_IRAQ", snippet: "This is a custom marker")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: GoogleMap(

              onTap: (LatLng) {
                MY_markers.remove(const Marker(markerId: MarkerId("3")));
                MY_markers.add(
                    Marker(markerId: const MarkerId("2"), position: LatLng));
                setState(() {});
              },
              markers: MY_markers,
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _mycontroller = controller;
              },
            ),
            width: MediaQuery.of(context).size.width,
            height: 600,
          ),
          ElevatedButton(
              onPressed: () {
                LatLng latLng = const LatLng(32.029215, 44.400528);
                _mycontroller.animateCamera(CameraUpdate.newLatLng(latLng));
              },
              child: const Text("MOVE"))
        ],
      ),
    );
  }
}
