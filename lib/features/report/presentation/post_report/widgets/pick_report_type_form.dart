import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../common/constants/constant.dart';
import '../../../../../common/widgets/option_item.dart';
import '../../../../../common/widgets/title_with_caption.dart';

class ReportType extends Equatable {
  const ReportType({
    required this.name,
    required this.description,
    required this.color,
  });

  final String name;
  final String description;
  final Color color;

  @override
  List<Object?> get props => [name, description, color];
}

class PickReportTypeForm extends StatelessWidget {
  const PickReportTypeForm({
    super.key,
    required this.types,
    required this.onTypeSelected,
    this.selectedType,
  });

  final List<ReportType> types;
  final Function(ReportType) onTypeSelected;
  final ReportType? selectedType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleWithCaption(
          title: SWStrings.labelChooseReportType,
          caption: 'Silahkan memilih jenis laporan yang sesuai dengan deskripsi.',
        ),
        const SizedBox(height: SWSizes.s16),
        Expanded(
          child: ListView.separated(
            itemCount: types.length,
            itemBuilder: (context, index) {
              final type = types[index];
              return OptionItem(
                label: type.name,
                onTap: () => onTypeSelected(type),
                caption: type.description,
                selected: type == selectedType,
                backgroundColor: type.color,
              );
            },
            separatorBuilder: (context, index) =>
                const SizedBox(height: SWSizes.s8),
          ),
        ),
      ],
    );
  }
}
