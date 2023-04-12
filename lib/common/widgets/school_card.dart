import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SchoolCard extends StatefulWidget {
  const SchoolCard({super.key});

  @override
  State<SchoolCard> createState() => _SchoolCardState();
}

class _SchoolCardState extends State<SchoolCard> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      width: double.infinity,
      child: Placeholder(),
    );
  }
}
