part of './post_report_controller.dart';

class PostReportState extends Equatable {
  const PostReportState({
    this.currentPage = 0,
    this.selectedSchool,
    this.selectedReportType,
    this.categories = const [],
    this.descriptionInput = const DescriptionTextInput.pure(),
    this.categoryInput = const CategoryOptionInput.pure(),
    this.locationInput = const LocationPickInput.pure(),
    this.additionalInfoInputs = const [],
    this.imageInput = const ImagePickInput.pure(),
  });

  final int currentPage;
  final SchoolOption? selectedSchool;
  final ReportType? selectedReportType;
  final List<Category> categories;
  final DescriptionTextInput descriptionInput;
  final CategoryOptionInput categoryInput;
  final LocationPickInput locationInput;
  final List<AdditionalInfoInputWrapper> additionalInfoInputs;
  final ImagePickInput imageInput;

  PostReportState copyWith({
    int? currentPage,
    SchoolOption? selectedSchool,
    ReportType? selectedReportType,
    List<Category>? categories,
    DescriptionTextInput? descriptionInput,
    CategoryOptionInput? categoryInput,
    LocationPickInput? locationInput,
    List<AdditionalInfoInputWrapper>? additionalInfoInputs,
    ImagePickInput? imageInput,
  }) {
    return PostReportState(
      currentPage: currentPage ?? this.currentPage,
      selectedSchool: selectedSchool ?? this.selectedSchool,
      selectedReportType: selectedReportType ?? this.selectedReportType,
      categories: categories ?? this.categories,
      descriptionInput: descriptionInput ?? this.descriptionInput,
      categoryInput: categoryInput ?? this.categoryInput,
      locationInput: locationInput ?? this.locationInput,
      additionalInfoInputs: additionalInfoInputs ?? this.additionalInfoInputs,
      imageInput: imageInput ?? this.imageInput,
    );
  }

  @override
  List<Object?> get props => [currentPage, selectedSchool, selectedReportType];
}
