import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../../common/constants/constant.dart';
import '../../../../../common/widgets/title_with_caption.dart';

class SchoolFloorPlanForm extends StatelessWidget {
  const SchoolFloorPlanForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleWithCaption(
          title: SWStrings.labelSchoolFloorPlan,
          caption: SWStrings.dummyText,
        ),
        const SizedBox(height: SWSizes.s16),
        Expanded(
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(SWSizes.s8),
            dashPattern: const [5, 4],
            strokeWidth: 1.5,
            strokeCap: StrokeCap.round,
            color: kColorNeutral200,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.add_location_alt_outlined),
                  Text(SWStrings.labelCreateFloorPlan),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
