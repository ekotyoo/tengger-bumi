import 'package:flutter/material.dart';

import '../../../../common/constants/constant.dart';
import '../../../../common/widgets/loading_image.dart';
import '../../../../common/widgets/title_with_caption.dart';

class ReportInfoForm extends StatelessWidget {
  const ReportInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleWithCaption(
          title: SWStrings.labelCompleteReport,
          caption: SWStrings.dummyText,
        ),
        ..._buildFormInputFields(context),
        _buildSelectedImageList(context),
        const SizedBox(height: SWSizes.s8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              child: const Icon(
                Icons.camera_alt_outlined,
                color: kColorNeutral80,
              ),
              onTap: () {},
            ),
            const SizedBox(width: SWSizes.s8),
            GestureDetector(
              child: const Icon(
                Icons.image,
                color: kColorNeutral80,
              ),
              onTap: () {},
            )
          ],
        ),
      ],
    );
  }

  _buildFormInputFields(BuildContext context) {
    return [
      const SizedBox(height: SWSizes.s16),
      const TextField(
        decoration: InputDecoration(hintText: 'Tulis Deskripsi'),
      ),
      const SizedBox(height: SWSizes.s16),
      Container(
        height: SWSizes.s56,
        decoration: BoxDecoration(
          color: kColorPrimary50,
          borderRadius: BorderRadius.circular(SWSizes.s8),
        ),
        child: Center(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton(
              onChanged: (value) {},
              isExpanded: true,
              borderRadius: BorderRadius.circular(SWSizes.s8),
              dropdownColor: kColorPrimary50,
              underline: Container(),
              style: Theme.of(context).textTheme.bodyMedium,
              hint: const Text('Kategori'),
              items: List.generate(
                5,
                (index) => DropdownMenuItem(
                  value: index,
                  child: Text('Kategori-${index + 1}'),
                ),
              ),
            ),
          ),
        ),
      ),
      const SizedBox(height: SWSizes.s16),
      const TextField(
        decoration: InputDecoration(hintText: 'Lokasi/Koordinat'),
      ),
      const SizedBox(height: SWSizes.s16),
      const TextField(
        decoration: InputDecoration(hintText: 'Informasi Tambahan'),
      ),
      const SizedBox(height: SWSizes.s16),
    ];
  }

  _buildSelectedImageList(BuildContext context) {
    return SizedBox(
      height: SWSizes.s80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Stack(
          children: [
            SizedBox(
              height: SWSizes.s80,
              width: SWSizes.s80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(SWSizes.s8),
                child: const LoadingImage(
                  url: 'https://picsum.photos/80/80',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: SWSizes.s4,
              right: SWSizes.s4,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(SWSizes.s2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(SWSizes.s8),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: const Icon(
                    Icons.delete_outlined,
                    size: 18,
                  ),
                ),
              ),
            )
          ],
        ),
        separatorBuilder: (context, index) => const SizedBox(width: SWSizes.s8),
        itemCount: 3,
      ),
    );
  }
}
