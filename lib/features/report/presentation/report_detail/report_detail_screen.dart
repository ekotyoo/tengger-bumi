import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../utils/snackbar_utils.dart';
import '../../domain/report_detail.dart';
import '../../../../common/widgets/category_chip.dart';
import '../../../../common/constants/constant.dart';
import '../../../../common/widgets/loading_image.dart';
import '../../domain/author.dart';
import '../../domain/comment.dart';
import 'report_detail_controller.dart';

class ReportDetailScreen extends ConsumerStatefulWidget {
  const ReportDetailScreen({
    Key? key,
    required this.reportId,
  }) : super(key: key);

  final String reportId;

  @override
  ConsumerState createState() => _ReportDetailScreenState();
}

class _ReportDetailScreenState extends ConsumerState<ReportDetailScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1.1);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reportAsync =
        ref.watch(reportDetailControllerProvider(widget.reportId));

    ref.listen(
      reportDetailControllerProvider(widget.reportId).selectAsync(
        (data) => data.errorMessage,
      ),
      (previous, next) async {
        final errorMessage = await next;
        if (errorMessage != null && context.mounted) {
          showSnackbar(context,
              message: errorMessage, type: SnackbarType.error);
        }
        await Future.delayed(kDurationLong);
        ref
            .read(reportDetailControllerProvider(widget.reportId).notifier)
            .setErrorMessage(null);
      },
    );

    ref.listen(
      reportDetailControllerProvider(widget.reportId).selectAsync(
        (data) => data.successMessage,
      ),
      (previous, next) async {
        final successMessage = await next;
        if (successMessage != null && context.mounted) {
          showSnackbar(context,
              message: successMessage, type: SnackbarType.success);
        }
        await Future.delayed(kDurationLong);
        ref
            .read(reportDetailControllerProvider(widget.reportId).notifier)
            .setErrorMessage(null);
      },
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detail Laporan'),
          centerTitle: true,
        ),
        body: reportAsync.when(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stackTrace) => Text('$error'),
          data: (state) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: SWSizes.s16),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      const SizedBox(height: SWSizes.s16),
                      _buildImage(context, state.report.images),
                      const SizedBox(height: SWSizes.s16),
                      _buildAuthorSection(context,
                          author: state.report.author,
                          createdAt: state.report.createdAt,
                          isActive: state.report.isActive),
                      const SizedBox(height: SWSizes.s8),
                      _buildCaption(context, state.report.description),
                      const SizedBox(height: SWSizes.s8),
                      _buildInteractionBar(context, state.report),
                      const SizedBox(height: SWSizes.s16),
                      _buildInfoSection(context, state.report),
                      const SizedBox(height: SWSizes.s8),
                      const Divider(),
                      const SizedBox(height: SWSizes.s8),
                      _buildAdditionalInfoTile(context),
                      const SizedBox(height: SWSizes.s8),
                      const Divider(),
                      const SizedBox(height: SWSizes.s8),
                      _buildCommentList(state.report.comments),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: SWSizes.s16),
                  child: CommentInput(
                    isLoading: state.commentLoading,
                    onSubmit: (value) {
                      ref
                          .read(reportDetailControllerProvider(
                            widget.reportId,
                          ).notifier)
                          .addComment(value);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildInteractionButton(
    BuildContext context, {
    required IconData icon,
    required int count,
    Color? color,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: SWSizes.s16, color: color),
          const SizedBox(width: SWSizes.s8),
          Text(
            '$count',
            style:
                Theme.of(context).textTheme.bodySmall?.copyWith(color: color),
          ),
        ],
      ),
    );
  }

  _buildInteractionBar(BuildContext context, ReportDetail report) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildInteractionButton(
          context,
          icon: Icons.thumb_up_rounded,
          count: report.likesCount,
          color: report.liked ? Theme.of(context).primaryColor : kColorNeutral200,
          onTap: () {
            ref
                .read(reportDetailControllerProvider(widget.reportId).notifier)
                .toggleLike();
          },
        ),
        const SizedBox(width: SWSizes.s16),
        _buildInteractionButton(
          context,
          icon: Icons.thumb_down_rounded,
          count: report.dislikesCount,
          color: report.disliked ? Theme.of(context).primaryColor : kColorNeutral200,
          onTap: () {
            ref
                .read(reportDetailControllerProvider(widget.reportId).notifier)
                .toggleDislike();
          },
        ),
      ],
    );
  }

  _buildImage(BuildContext context, List<String> images) {
    return SizedBox(
      height: 1.5 * SWSizes.s160,
      width: double.infinity,
      child: PageView.builder(
        itemCount: images.length,
        controller: _pageController,
        itemBuilder: (context, index) => FractionallySizedBox(
          widthFactor: 1 / _pageController.viewportFraction,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(SWSizes.s8),
            child: LoadingImage(
              url: images[index],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  _buildAuthorSection(
    BuildContext context, {
    required Author author,
    required DateTime createdAt,
    required bool isActive,
  }) {
    return Row(
      children: [
        AuthorSection(
          name: author.name,
          subtitle: createdAt.toString(),
          avatar: author.avatar,
        ),
        const Spacer(),
        CategoryChip(
          label: isActive ? 'Aktif' : 'Tidak Aktif',
          backgroundColor: kColorSuccess300,
          foregroundColor: kColorNeutral0,
        ),
      ],
    );
  }

  _buildCaption(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodySmall
          ?.copyWith(color: kColorNeutral200),
    );
  }

  _buildInfoSection(BuildContext context, ReportDetail report) {
    final icons = [
      Icons.category_outlined,
      Icons.insert_drive_file_outlined,
      Icons.school_outlined,
      Icons.location_on_outlined
    ];

    final infos = {
      'Jenis Laporan': report.reportType,
      'Kategori': report.reportCategory,
      'Sekolah': report.school,
      'Lokasi': report.room,
    };

    return AlignedGridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      itemCount: infos.length,
      mainAxisSpacing: SWSizes.s16,
      crossAxisSpacing: SWSizes.s16,
      itemBuilder: (context, index) => _buildInfoTile(
        context,
        label: infos.keys.toList()[index],
        value: infos.values.toList()[index],
        icon: icons[index],
      ),
    );
  }

  _buildInfoTile(
    BuildContext context, {
    required String label,
    required String value,
    required IconData icon,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(SWSizes.s8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SWSizes.s8),
            color: kColorPrimary50,
          ),
          child: Icon(icon, color: kColorNeutral900),
        ),
        const SizedBox(width: SWSizes.s8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: SWSizes.s4),
            Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ],
    );
  }

  _buildAdditionalInfoTile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Informasi Lain',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: SWSizes.s16),
        _buildInfoTile(
          context,
          label: 'label',
          value: 'value',
          icon: Icons.info_outline_rounded,
        ),
      ],
    );
  }

  _buildCommentList(List<Comment> comments) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${comments.length} Komentar',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: SWSizes.s16),
        ListView.separated(
          itemCount: comments.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) =>
              const SizedBox(height: SWSizes.s16),
          itemBuilder: (context, index) =>
              CommentTile(comment: comments[index]),
        ),
      ],
    );
  }
}

class AuthorSection extends StatelessWidget {
  const AuthorSection({
    Key? key,
    required this.name,
    required this.subtitle,
    this.avatar,
  }) : super(key: key);

  final String name;
  final String subtitle;
  final String? avatar;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: avatar != null ? NetworkImage(avatar!) : null,
        ),
        const SizedBox(width: SWSizes.s8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: SWSizes.s8),
            Text(
              subtitle,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: kColorNeutral200),
            ),
          ],
        ),
      ],
    );
  }
}

class CommentInput extends StatefulWidget {
  const CommentInput({
    Key? key,
    this.isLoading = false,
    this.onSubmit,
  }) : super(key: key);

  final Function(String)? onSubmit;
  final bool isLoading;

  @override
  State<CommentInput> createState() => _CommentInputState();
}

class _CommentInputState extends State<CommentInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            maxLines: 1,
            controller: _controller,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: const InputDecoration(
              hintText: SWStrings.labelWriteComment,
            ),
          ),
        ),
        const SizedBox(width: SWSizes.s8),
        widget.isLoading
            ? _buildLoadingIndicator(context)
            : GestureDetector(
                onTap: () {
                  if (_controller.text.isEmpty) return;
                  widget.onSubmit?.call(_controller.text);
                  _controller.clear();
                },
                child: const SizedBox(
                  height: SWSizes.s32,
                  width: SWSizes.s32,
                  child: Icon(Icons.send),
                ),
              ),
      ],
    );
  }

  _buildLoadingIndicator(BuildContext context) {
    return const SizedBox(
      height: SWSizes.s32,
      width: SWSizes.s32,
      child: CircularProgressIndicator(strokeWidth: SWSizes.s4),
    );
  }
}

class CommentTile extends StatelessWidget {
  const CommentTile({
    Key? key,
    required this.comment,
  }) : super(key: key);

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(backgroundImage: NetworkImage(comment.author.avatar)),
        const SizedBox(width: SWSizes.s8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    comment.author.name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: SWSizes.s8),
                  Container(
                    width: SWSizes.s4,
                    height: SWSizes.s4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(SWSizes.s2),
                      color: kColorNeutral900,
                    ),
                  ),
                  const SizedBox(width: SWSizes.s8),
                  Text(
                    comment.createdAt.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: kColorNeutral200),
                  )
                ],
              ),
              Text(
                comment.comment,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: kColorNeutral200),
              ),
            ],
          ),
        ),
      ],
    );
  }
}