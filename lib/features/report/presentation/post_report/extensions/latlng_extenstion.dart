import 'package:latlong2/latlong.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as mp;

extension MapsToolkitExt on mp.LatLng {
  LatLng toLatLng2() => LatLng(latitude, longitude);
}

extension LatLng2Ext on LatLng {
  mp.LatLng toMpLatLng() => mp.LatLng(latitude, longitude);
}