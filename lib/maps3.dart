// ignore_for_file: camel_case_types, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class maps3 extends StatefulWidget {
  const maps3({super.key});
  @override
  State<maps3> createState() => _maps3State();
}

class _maps3State extends State<maps3> {
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(32.033431, 44.403403),
    zoom: 14.4746,
  );

  Set<Circle> circles = {
    const Circle(
      circleId: CircleId("1"),
      center: LatLng(32.033431, 44.403403),
      radius: 1000,
      strokeColor: Colors.purple,
      strokeWidth: 3,
    ),
  };

  final List<Polyline> polyLine = [];

  @override
  void initState() {
    super.initState();
    LatLng locationA = const LatLng(32.029215, 44.400528);
  LatLng locationB = const LatLng(32.033431, 44.403403);


    polyLine.add(Polyline(
        polylineId: const PolylineId("route1"),
        color: Colors.blue,
        patterns: [
          PatternItem.dash(30.0),
          PatternItem.gap(10),
        ],
        width: 3,
        points: [
         locationA,
       locationB,

        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        circles: circles,
        polylines: Set<Polyline>.of(polyLine),
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {},
      ),
    );
  }
}
