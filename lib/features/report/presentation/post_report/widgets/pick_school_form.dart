import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../common/constants/constant.dart';
import '../../../../../common/widgets/option_item.dart';
import '../../../../../common/widgets/title_with_caption.dart';

class SchoolOption extends Equatable {
  const SchoolOption({required this.id, required this.name});

  final int id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}

class PickSchoolForm extends StatelessWidget {
  const PickSchoolForm({
    super.key,
    required this.schools,
    this.selectedSchool,
    required this.onSchoolSelected,
    this.isLoading = false,
  });

  final List<SchoolOption> schools;
  final SchoolOption? selectedSchool;
  final Function(SchoolOption) onSchoolSelected;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    const loadingWidget = Center(
      child: CircularProgressIndicator(),
    );

    const emptyWidget = Center(
      child: Text(SWStrings.descSchoolNotAvailable),
    );

    return Column(
      children: [
        const TitleWithCaption(
          title: SWStrings.labelChooseSchool,
          caption: 'Anda belum menjadi anggota sekolah manapun. Silahkan pilih sekolah untuk menjadi member sekolah tersebut.',
        ),
        const SizedBox(height: SWSizes.s16),
        Expanded(
          child: isLoading ? loadingWidget : schools.isEmpty ? emptyWidget : ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final school = schools[index];
              return OptionItem(
                label: school.name,
                selected: school == selectedSchool,
                onTap: () => onSchoolSelected(school),
              );
            },
            separatorBuilder: (context, index) =>
                const SizedBox(height: SWSizes.s8),
            itemCount: schools.length,
          ),
        ),
      ],
    );
  }
}
