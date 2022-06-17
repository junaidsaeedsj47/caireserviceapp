import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CheckBookingStatusViewModel extends ChangeNotifier{
  Completer<GoogleMapController> controller = Completer();
  final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition kLake = CameraPosition(
      target: LatLng(37.43296265331129, -122.08832357078792),
      );
  initialize(BuildContext context){}
}