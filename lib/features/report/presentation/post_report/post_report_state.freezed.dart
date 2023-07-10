// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_report_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostReportState {
  ReportDetail? get reportDetail => throw _privateConstructorUsedError;
  FormType get formType => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  SchoolOption? get selectedSchool => throw _privateConstructorUsedError;
  RoomUiModel? get selectedRoom => throw _privateConstructorUsedError;
  SchoolDetail? get selectedSchoolData => throw _privateConstructorUsedError;
  List<SchoolOption> get schools => throw _privateConstructorUsedError;
  bool get firstFormLoading => throw _privateConstructorUsedError;
  bool get infoFormLoading => throw _privateConstructorUsedError;
  bool get finalFormSubmitting => throw _privateConstructorUsedError;
  ReportType? get selectedReportType => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  List<Category> get categories => throw _privateConstructorUsedError;
  DescriptionTextInput get descriptionInput =>
      throw _privateConstructorUsedError;
  CategoryOptionInput get categoryInput => throw _privateConstructorUsedError;
  LocationPickInput get locationInput => throw _privateConstructorUsedError;
  ImagePickInput get imageInput => throw _privateConstructorUsedError;
  List<AdditionalInfoInputWrapper> get additionalInfoInputs =>
      throw _privateConstructorUsedError;
  List<String> get deletedImages => throw _privateConstructorUsedError;
  bool get validated => throw _privateConstructorUsedError;
  String? get successMessage => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostReportStateCopyWith<PostReportState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostReportStateCopyWith<$Res> {
  factory $PostReportStateCopyWith(
          PostReportState value, $Res Function(PostReportState) then) =
      _$PostReportStateCopyWithImpl<$Res, PostReportState>;
  @useResult
  $Res call(
      {ReportDetail? reportDetail,
      FormType formType,
      int currentPage,
      SchoolOption? selectedSchool,
      RoomUiModel? selectedRoom,
      SchoolDetail? selectedSchoolData,
      List<SchoolOption> schools,
      bool firstFormLoading,
      bool infoFormLoading,
      bool finalFormSubmitting,
      ReportType? selectedReportType,
      bool? isActive,
      List<Category> categories,
      DescriptionTextInput descriptionInput,
      CategoryOptionInput categoryInput,
      LocationPickInput locationInput,
      ImagePickInput imageInput,
      List<AdditionalInfoInputWrapper> additionalInfoInputs,
      List<String> deletedImages,
      bool validated,
      String? successMessage,
      String? errorMessage});

  $ReportDetailCopyWith<$Res>? get reportDetail;
  $SchoolDetailCopyWith<$Res>? get selectedSchoolData;
}

/// @nodoc
class _$PostReportStateCopyWithImpl<$Res, $Val extends PostReportState>
    implements $PostReportStateCopyWith<$Res> {
  _$PostReportStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportDetail = freezed,
    Object? formType = null,
    Object? currentPage = null,
    Object? selectedSchool = freezed,
    Object? selectedRoom = freezed,
    Object? selectedSchoolData = freezed,
    Object? schools = null,
    Object? firstFormLoading = null,
    Object? infoFormLoading = null,
    Object? finalFormSubmitting = null,
    Object? selectedReportType = freezed,
    Object? isActive = freezed,
    Object? categories = null,
    Object? descriptionInput = null,
    Object? categoryInput = null,
    Object? locationInput = null,
    Object? imageInput = null,
    Object? additionalInfoInputs = null,
    Object? deletedImages = null,
    Object? validated = null,
    Object? successMessage = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      reportDetail: freezed == reportDetail
          ? _value.reportDetail
          : reportDetail // ignore: cast_nullable_to_non_nullable
              as ReportDetail?,
      formType: null == formType
          ? _value.formType
          : formType // ignore: cast_nullable_to_non_nullable
              as FormType,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      selectedSchool: freezed == selectedSchool
          ? _value.selectedSchool
          : selectedSchool // ignore: cast_nullable_to_non_nullable
              as SchoolOption?,
      selectedRoom: freezed == selectedRoom
          ? _value.selectedRoom
          : selectedRoom // ignore: cast_nullable_to_non_nullable
              as RoomUiModel?,
      selectedSchoolData: freezed == selectedSchoolData
          ? _value.selectedSchoolData
          : selectedSchoolData // ignore: cast_nullable_to_non_nullable
              as SchoolDetail?,
      schools: null == schools
          ? _value.schools
          : schools // ignore: cast_nullable_to_non_nullable
              as List<SchoolOption>,
      firstFormLoading: null == firstFormLoading
          ? _value.firstFormLoading
          : firstFormLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      infoFormLoading: null == infoFormLoading
          ? _value.infoFormLoading
          : infoFormLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      finalFormSubmitting: null == finalFormSubmitting
          ? _value.finalFormSubmitting
          : finalFormSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedReportType: freezed == selectedReportType
          ? _value.selectedReportType
          : selectedReportType // ignore: cast_nullable_to_non_nullable
              as ReportType?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      descriptionInput: null == descriptionInput
          ? _value.descriptionInput
          : descriptionInput // ignore: cast_nullable_to_non_nullable
              as DescriptionTextInput,
      categoryInput: null == categoryInput
          ? _value.categoryInput
          : categoryInput // ignore: cast_nullable_to_non_nullable
              as CategoryOptionInput,
      locationInput: null == locationInput
          ? _value.locationInput
          : locationInput // ignore: cast_nullable_to_non_nullable
              as LocationPickInput,
      imageInput: null == imageInput
          ? _value.imageInput
          : imageInput // ignore: cast_nullable_to_non_nullable
              as ImagePickInput,
      additionalInfoInputs: null == additionalInfoInputs
          ? _value.additionalInfoInputs
          : additionalInfoInputs // ignore: cast_nullable_to_non_nullable
              as List<AdditionalInfoInputWrapper>,
      deletedImages: null == deletedImages
          ? _value.deletedImages
          : deletedImages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      validated: null == validated
          ? _value.validated
          : validated // ignore: cast_nullable_to_non_nullable
              as bool,
      successMessage: freezed == successMessage
          ? _value.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReportDetailCopyWith<$Res>? get reportDetail {
    if (_value.reportDetail == null) {
      return null;
    }

    return $ReportDetailCopyWith<$Res>(_value.reportDetail!, (value) {
      return _then(_value.copyWith(reportDetail: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SchoolDetailCopyWith<$Res>? get selectedSchoolData {
    if (_value.selectedSchoolData == null) {
      return null;
    }

    return $SchoolDetailCopyWith<$Res>(_value.selectedSchoolData!, (value) {
      return _then(_value.copyWith(selectedSchoolData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PostReportStateCopyWith<$Res>
    implements $PostReportStateCopyWith<$Res> {
  factory _$$_PostReportStateCopyWith(
          _$_PostReportState value, $Res Function(_$_PostReportState) then) =
      __$$_PostReportStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ReportDetail? reportDetail,
      FormType formType,
      int currentPage,
      SchoolOption? selectedSchool,
      RoomUiModel? selectedRoom,
      SchoolDetail? selectedSchoolData,
      List<SchoolOption> schools,
      bool firstFormLoading,
      bool infoFormLoading,
      bool finalFormSubmitting,
      ReportType? selectedReportType,
      bool? isActive,
      List<Category> categories,
      DescriptionTextInput descriptionInput,
      CategoryOptionInput categoryInput,
      LocationPickInput locationInput,
      ImagePickInput imageInput,
      List<AdditionalInfoInputWrapper> additionalInfoInputs,
      List<String> deletedImages,
      bool validated,
      String? successMessage,
      String? errorMessage});

  @override
  $ReportDetailCopyWith<$Res>? get reportDetail;
  @override
  $SchoolDetailCopyWith<$Res>? get selectedSchoolData;
}

/// @nodoc
class __$$_PostReportStateCopyWithImpl<$Res>
    extends _$PostReportStateCopyWithImpl<$Res, _$_PostReportState>
    implements _$$_PostReportStateCopyWith<$Res> {
  __$$_PostReportStateCopyWithImpl(
      _$_PostReportState _value, $Res Function(_$_PostReportState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reportDetail = freezed,
    Object? formType = null,
    Object? currentPage = null,
    Object? selectedSchool = freezed,
    Object? selectedRoom = freezed,
    Object? selectedSchoolData = freezed,
    Object? schools = null,
    Object? firstFormLoading = null,
    Object? infoFormLoading = null,
    Object? finalFormSubmitting = null,
    Object? selectedReportType = freezed,
    Object? isActive = freezed,
    Object? categories = null,
    Object? descriptionInput = null,
    Object? categoryInput = null,
    Object? locationInput = null,
    Object? imageInput = null,
    Object? additionalInfoInputs = null,
    Object? deletedImages = null,
    Object? validated = null,
    Object? successMessage = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$_PostReportState(
      reportDetail: freezed == reportDetail
          ? _value.reportDetail
          : reportDetail // ignore: cast_nullable_to_non_nullable
              as ReportDetail?,
      formType: null == formType
          ? _value.formType
          : formType // ignore: cast_nullable_to_non_nullable
              as FormType,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      selectedSchool: freezed == selectedSchool
          ? _value.selectedSchool
          : selectedSchool // ignore: cast_nullable_to_non_nullable
              as SchoolOption?,
      selectedRoom: freezed == selectedRoom
          ? _value.selectedRoom
          : selectedRoom // ignore: cast_nullable_to_non_nullable
              as RoomUiModel?,
      selectedSchoolData: freezed == selectedSchoolData
          ? _value.selectedSchoolData
          : selectedSchoolData // ignore: cast_nullable_to_non_nullable
              as SchoolDetail?,
      schools: null == schools
          ? _value._schools
          : schools // ignore: cast_nullable_to_non_nullable
              as List<SchoolOption>,
      firstFormLoading: null == firstFormLoading
          ? _value.firstFormLoading
          : firstFormLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      infoFormLoading: null == infoFormLoading
          ? _value.infoFormLoading
          : infoFormLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      finalFormSubmitting: null == finalFormSubmitting
          ? _value.finalFormSubmitting
          : finalFormSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedReportType: freezed == selectedReportType
          ? _value.selectedReportType
          : selectedReportType // ignore: cast_nullable_to_non_nullable
              as ReportType?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      descriptionInput: null == descriptionInput
          ? _value.descriptionInput
          : descriptionInput // ignore: cast_nullable_to_non_nullable
              as DescriptionTextInput,
      categoryInput: null == categoryInput
          ? _value.categoryInput
          : categoryInput // ignore: cast_nullable_to_non_nullable
              as CategoryOptionInput,
      locationInput: null == locationInput
          ? _value.locationInput
          : locationInput // ignore: cast_nullable_to_non_nullable
              as LocationPickInput,
      imageInput: null == imageInput
          ? _value.imageInput
          : imageInput // ignore: cast_nullable_to_non_nullable
              as ImagePickInput,
      additionalInfoInputs: null == additionalInfoInputs
          ? _value._additionalInfoInputs
          : additionalInfoInputs // ignore: cast_nullable_to_non_nullable
              as List<AdditionalInfoInputWrapper>,
      deletedImages: null == deletedImages
          ? _value._deletedImages
          : deletedImages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      validated: null == validated
          ? _value.validated
          : validated // ignore: cast_nullable_to_non_nullable
              as bool,
      successMessage: freezed == successMessage
          ? _value.successMessage
          : successMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_PostReportState implements _PostReportState {
  const _$_PostReportState(
      {this.reportDetail,
      this.formType = FormType.post,
      this.currentPage = 0,
      this.selectedSchool,
      this.selectedRoom,
      this.selectedSchoolData,
      final List<SchoolOption> schools = const [],
      this.firstFormLoading = true,
      this.infoFormLoading = true,
      this.finalFormSubmitting = false,
      this.selectedReportType,
      this.isActive,
      final List<Category> categories = const [],
      this.descriptionInput = const DescriptionTextInput.pure(),
      this.categoryInput = const CategoryOptionInput.pure(),
      this.locationInput = const LocationPickInput.pure(),
      this.imageInput = const ImagePickInput.pure(),
      final List<AdditionalInfoInputWrapper> additionalInfoInputs = const [],
      final List<String> deletedImages = const [],
      this.validated = false,
      this.successMessage,
      this.errorMessage})
      : _schools = schools,
        _categories = categories,
        _additionalInfoInputs = additionalInfoInputs,
        _deletedImages = deletedImages;

  @override
  final ReportDetail? reportDetail;
  @override
  @JsonKey()
  final FormType formType;
  @override
  @JsonKey()
  final int currentPage;
  @override
  final SchoolOption? selectedSchool;
  @override
  final RoomUiModel? selectedRoom;
  @override
  final SchoolDetail? selectedSchoolData;
  final List<SchoolOption> _schools;
  @override
  @JsonKey()
  List<SchoolOption> get schools {
    if (_schools is EqualUnmodifiableListView) return _schools;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_schools);
  }

  @override
  @JsonKey()
  final bool firstFormLoading;
  @override
  @JsonKey()
  final bool infoFormLoading;
  @override
  @JsonKey()
  final bool finalFormSubmitting;
  @override
  final ReportType? selectedReportType;
  @override
  final bool? isActive;
  final List<Category> _categories;
  @override
  @JsonKey()
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  @JsonKey()
  final DescriptionTextInput descriptionInput;
  @override
  @JsonKey()
  final CategoryOptionInput categoryInput;
  @override
  @JsonKey()
  final LocationPickInput locationInput;
  @override
  @JsonKey()
  final ImagePickInput imageInput;
  final List<AdditionalInfoInputWrapper> _additionalInfoInputs;
  @override
  @JsonKey()
  List<AdditionalInfoInputWrapper> get additionalInfoInputs {
    if (_additionalInfoInputs is EqualUnmodifiableListView)
      return _additionalInfoInputs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_additionalInfoInputs);
  }

  final List<String> _deletedImages;
  @override
  @JsonKey()
  List<String> get deletedImages {
    if (_deletedImages is EqualUnmodifiableListView) return _deletedImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deletedImages);
  }

  @override
  @JsonKey()
  final bool validated;
  @override
  final String? successMessage;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'PostReportState(reportDetail: $reportDetail, formType: $formType, currentPage: $currentPage, selectedSchool: $selectedSchool, selectedRoom: $selectedRoom, selectedSchoolData: $selectedSchoolData, schools: $schools, firstFormLoading: $firstFormLoading, infoFormLoading: $infoFormLoading, finalFormSubmitting: $finalFormSubmitting, selectedReportType: $selectedReportType, isActive: $isActive, categories: $categories, descriptionInput: $descriptionInput, categoryInput: $categoryInput, locationInput: $locationInput, imageInput: $imageInput, additionalInfoInputs: $additionalInfoInputs, deletedImages: $deletedImages, validated: $validated, successMessage: $successMessage, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostReportState &&
            (identical(other.reportDetail, reportDetail) ||
                other.reportDetail == reportDetail) &&
            (identical(other.formType, formType) ||
                other.formType == formType) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.selectedSchool, selectedSchool) ||
                other.selectedSchool == selectedSchool) &&
            (identical(other.selectedRoom, selectedRoom) ||
                other.selectedRoom == selectedRoom) &&
            (identical(other.selectedSchoolData, selectedSchoolData) ||
                other.selectedSchoolData == selectedSchoolData) &&
            const DeepCollectionEquality().equals(other._schools, _schools) &&
            (identical(other.firstFormLoading, firstFormLoading) ||
                other.firstFormLoading == firstFormLoading) &&
            (identical(other.infoFormLoading, infoFormLoading) ||
                other.infoFormLoading == infoFormLoading) &&
            (identical(other.finalFormSubmitting, finalFormSubmitting) ||
                other.finalFormSubmitting == finalFormSubmitting) &&
            (identical(other.selectedReportType, selectedReportType) ||
                other.selectedReportType == selectedReportType) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.descriptionInput, descriptionInput) ||
                other.descriptionInput == descriptionInput) &&
            (identical(other.categoryInput, categoryInput) ||
                other.categoryInput == categoryInput) &&
            (identical(other.locationInput, locationInput) ||
                other.locationInput == locationInput) &&
            (identical(other.imageInput, imageInput) ||
                other.imageInput == imageInput) &&
            const DeepCollectionEquality()
                .equals(other._additionalInfoInputs, _additionalInfoInputs) &&
            const DeepCollectionEquality()
                .equals(other._deletedImages, _deletedImages) &&
            (identical(other.validated, validated) ||
                other.validated == validated) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        reportDetail,
        formType,
        currentPage,
        selectedSchool,
        selectedRoom,
        selectedSchoolData,
        const DeepCollectionEquality().hash(_schools),
        firstFormLoading,
        infoFormLoading,
        finalFormSubmitting,
        selectedReportType,
        isActive,
        const DeepCollectionEquality().hash(_categories),
        descriptionInput,
        categoryInput,
        locationInput,
        imageInput,
        const DeepCollectionEquality().hash(_additionalInfoInputs),
        const DeepCollectionEquality().hash(_deletedImages),
        validated,
        successMessage,
        errorMessage
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostReportStateCopyWith<_$_PostReportState> get copyWith =>
      __$$_PostReportStateCopyWithImpl<_$_PostReportState>(this, _$identity);
}

abstract class _PostReportState implements PostReportState {
  const factory _PostReportState(
      {final ReportDetail? reportDetail,
      final FormType formType,
      final int currentPage,
      final SchoolOption? selectedSchool,
      final RoomUiModel? selectedRoom,
      final SchoolDetail? selectedSchoolData,
      final List<SchoolOption> schools,
      final bool firstFormLoading,
      final bool infoFormLoading,
      final bool finalFormSubmitting,
      final ReportType? selectedReportType,
      final bool? isActive,
      final List<Category> categories,
      final DescriptionTextInput descriptionInput,
      final CategoryOptionInput categoryInput,
      final LocationPickInput locationInput,
      final ImagePickInput imageInput,
      final List<AdditionalInfoInputWrapper> additionalInfoInputs,
      final List<String> deletedImages,
      final bool validated,
      final String? successMessage,
      final String? errorMessage}) = _$_PostReportState;

  @override
  ReportDetail? get reportDetail;
  @override
  FormType get formType;
  @override
  int get currentPage;
  @override
  SchoolOption? get selectedSchool;
  @override
  RoomUiModel? get selectedRoom;
  @override
  SchoolDetail? get selectedSchoolData;
  @override
  List<SchoolOption> get schools;
  @override
  bool get firstFormLoading;
  @override
  bool get infoFormLoading;
  @override
  bool get finalFormSubmitting;
  @override
  ReportType? get selectedReportType;
  @override
  bool? get isActive;
  @override
  List<Category> get categories;
  @override
  DescriptionTextInput get descriptionInput;
  @override
  CategoryOptionInput get categoryInput;
  @override
  LocationPickInput get locationInput;
  @override
  ImagePickInput get imageInput;
  @override
  List<AdditionalInfoInputWrapper> get additionalInfoInputs;
  @override
  List<String> get deletedImages;
  @override
  bool get validated;
  @override
  String? get successMessage;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_PostReportStateCopyWith<_$_PostReportState> get copyWith =>
      throw _privateConstructorUsedError;
}
