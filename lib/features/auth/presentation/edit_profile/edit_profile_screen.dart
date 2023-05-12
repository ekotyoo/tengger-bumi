import 'package:flutter/material.dart';

import '../../../../common/constants/constant.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(SWStrings.labelEditProfile),
          centerTitle: true,
        ),
        body: const Placeholder(),
      ),
    );
  }
}
