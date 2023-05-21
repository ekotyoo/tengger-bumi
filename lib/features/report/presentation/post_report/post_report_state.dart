import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:school_watch_semeru/features/report/presentation/post_report/post_report_screen.dart';
import 'package:school_watch_semeru/features/school/domain/school_detail.dart';
import 'package:school_watch_semeru/features/school/presentation/models/room_ui_model.dart';

import '../../domain/report_detail.dart';
import 'widgets/pick_report_type_form.dart';
import 'widgets/pick_school_form.dart';
import '../../domain/category.dart';
import '../models/additional_info_input_wrapper.dart';
import '../models/category_option_input.dart';
import '../models/description_text_input.dart';
import '../models/image_pick_input.dart';
import '../models/location_pick_input.dart';

part 'post_report_state.freezed.dart';

@freezed
class PostReportState with _$PostReportState {
  const factory PostReportState({
    ReportDetail? reportDetail,
    @Default(FormType.post) FormType formType,
    @Default(0) int currentPage,
    SchoolOption? selectedSchool,
    RoomUiModel? selectedRoom,
    SchoolDetail? selectedSchoolData,
    @Default([]) List<SchoolOption> schools,
    @Default(true) bool firstFormLoading,
    @Default(true) bool infoFormLoading,
    @Default(false) bool finalFormSubmitting,
    ReportType? selectedReportType,
    @Default([]) List<Category> categories,
    @Default(DescriptionTextInput.pure()) DescriptionTextInput descriptionInput,
    @Default(CategoryOptionInput.pure()) CategoryOptionInput categoryInput,
    @Default(LocationPickInput.pure()) LocationPickInput locationInput,
    @Default(ImagePickInput.pure()) ImagePickInput imageInput,
    @Default([]) List<AdditionalInfoInputWrapper> additionalInfoInputs,
    @Default(false) bool validated,
    String? successMessage,
    String? errorMessage,
  }) = _PostReportState;
}
