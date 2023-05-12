import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import '../constants/constant.dart';

class OpenStreetMapAttribution extends StatelessWidget {
  const OpenStreetMapAttribution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AttributionWidget(
      attributionBuilder: (context) {
        return const Padding(
          padding: EdgeInsets.all(SWSizes.s8),
          child: Text('©OpenStreetMap'),
        );
      },
    );
  }
}
