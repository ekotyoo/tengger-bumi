import 'package:latlong2/latlong.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as mp;
import 'package:tetenger_bumi/common/models/position.dart';

extension MapsToolkitExt on mp.LatLng {
  LatLng toLatLng2() => LatLng(latitude, longitude);
}

extension LatLng2Ext on LatLng {
  mp.LatLng toMpLatLng() => mp.LatLng(latitude, longitude);
}

extension PositionExt on Position {
  LatLng toLatLng() => LatLng(latitude, longitude);
}