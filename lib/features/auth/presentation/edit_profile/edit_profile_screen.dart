import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tetenger_bumi/features/auth/presentation/models/name_text_input.dart';
import '../../../../common/widgets/title_with_caption.dart';
import '../../../../utils/snackbar_utils.dart';
import 'edit_profile_controller.dart';

import '../../domain/auth_user.dart';
import '../../../../common/widgets/sw_text_field.dart';
import '../../../../common/constants/constant.dart';
import '../../../../common/widgets/sw_button.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({Key? key, required this.user}) : super(key: key);

  final SignedIn user;

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  late ImagePicker _imagePicker;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  void _pickImageFromGallery(WidgetRef ref) async {
    try {
      final image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1080,
        maxHeight: 1920,
        imageQuality: 80,
      );
      if (image != null) {
        ref
            .read(editProfileControllerProvider(widget.user).notifier)
            .onNewAvatarChange(image);
      }
      if (context.mounted) context.pop();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _pickImageFromCamera(WidgetRef ref) async {
    try {
      final image = await _imagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1080,
        maxHeight: 1920,
        imageQuality: 80,
      );
      if (image != null) {
        ref
            .read(editProfileControllerProvider(widget.user).notifier)
            .onNewAvatarChange(image);
      }
      if (context.mounted) context.pop();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(editProfileControllerProvider(widget.user));

    ref.listen(
      editProfileControllerProvider(widget.user).select((value) => value.errorMessage),
          (previous, next) {
        if (next != null && context.mounted) {
          showSnackbar(context, message: next, type: SnackbarType.error);
        }
        ref.read(editProfileControllerProvider(widget.user).notifier).setErrorMessage(null);
      },
    );

    ref.listen(
      editProfileControllerProvider(widget.user).select((value) => value.successMessage),
          (previous, next) {
        if (next != null && context.mounted) {
          showSnackbar(context, message: next);
          context.pop();
        }
        ref.read(editProfileControllerProvider(widget.user).notifier).setSuccessMessage(null);
      },
    );

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(SWStrings.labelEditProfile),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(SWSizes.s16),
          child: Column(
            children: [
              EditableAvatar(
                avatar: state.avatar,
                newAvatar: state.newAvatar,
                onEdit: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(SWSizes.s32),
                        topRight: Radius.circular(SWSizes.s32),
                      ),
                    ),
                    builder: (context) {
                      return Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(SWSizes.s16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const TitleWithCaption(title: 'Foto Profil'),
                                const SizedBox(height: SWSizes.s16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () =>
                                          _pickImageFromCamera(ref),
                                      icon: const Icon(
                                        Icons.camera_alt_outlined,
                                        color: kColorNeutral50,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: SWSizes.s16),
                                      height: SWSizes.s32,
                                      width: SWSizes.s2,
                                      color: kColorNeutral50,
                                    ),
                                    IconButton(
                                      onPressed: () => _pickImageFromGallery(ref),
                                      icon: const Icon(
                                        Icons.image,
                                        color: kColorNeutral50,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: SWSizes.s16),
                                      height: SWSizes.s32,
                                      width: SWSizes.s2,
                                      color: kColorNeutral50,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        if (state.newAvatar != null) {
                                          ref
                                              .read(
                                                  editProfileControllerProvider(
                                                          widget.user)
                                                      .notifier)
                                              .onNewAvatarChange(null);
                                          context.pop();
                                        } else if (state.avatar != null) {
                                          ref
                                              .read(
                                                  editProfileControllerProvider(
                                                          widget.user)
                                                      .notifier)
                                              .onAvatarChange(null);
                                          context.pop();
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.delete_outline_rounded,
                                        color: kColorNeutral50,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: SWSizes.s32),
              SWTextField(
                hint: SWStrings.labelEmail,
                initialText: widget.user.email,
                enabled: false,
              ),
              const SizedBox(height: SWSizes.s16),
              SWTextField(
                hint: SWStrings.labelName,
                initialText: widget.user.name,
                errorText: (state.nameTextInput as NameTextInput).isPure
                    ? null
                    : (state.nameTextInput as NameTextInput)
                        .error
                        ?.getErrorMessage(),
                onChanged: (value) {
                  ref
                      .read(editProfileControllerProvider(widget.user).notifier)
                      .onNameChange(value);
                },
              ),
              const Spacer(),
              SWButton(
                label: SWStrings.labelSave,
                loading: state.isSubmitting,
                disabled: !state.validated,
                onPressed: () {
                  ref
                      .read(editProfileControllerProvider(widget.user).notifier)
                      .onSubmit();
                },
              ),
              const SizedBox(height: SWSizes.s32),
            ],
          ),
        ),
      ),
    );
  }
}

class EditableAvatar extends StatelessWidget {
  const EditableAvatar({
    Key? key,
    this.avatar,
    this.newAvatar,
    this.onEdit,
  }) : super(key: key);

  final String? avatar;
  final XFile? newAvatar;
  final VoidCallback? onEdit;

  @override
  Widget build(BuildContext context) {
    ImageProvider? foregroundImage;

    if (avatar != null) {
      foregroundImage = NetworkImage(avatar!);
    }

    if (newAvatar != null) {
      foregroundImage = FileImage(File(newAvatar!.path));
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: SWSizes.s56,
          foregroundImage: foregroundImage,
          backgroundColor: kColorPrimary50,
          child: const Icon(
            Icons.person,
            color: kColorPrimary100,
            size: SWSizes.s56,
          ),
        ),
        Positioned(
          bottom: SWSizes.s4,
          right: SWSizes.s4,
          child: GestureDetector(
            onTap: () {
              onEdit?.call();
            },
            child: Container(
              padding: const EdgeInsets.all(SWSizes.s4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SWSizes.s32),
                color: kColorNeutral20,
              ),
              child: const Icon(
                Icons.edit,
                color: kColorNeutral400,
              ),
            ),
          ),
        )
      ],
    );
  }
}
