import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:school_watch_semeru/common/widgets/shimmer_container.dart';

import '../../../../utils/string_extension.dart';
import '../../domain/report.dart';
import '../../../../common/constants/constant.dart';
import '../../../../common/widgets/category_chip.dart';
import '../../../../common/widgets/loading_image.dart';

class ReportCard extends StatelessWidget {
  ReportCard({
    super.key,
    required this.report,
    this.onTap,
    this.onLiked,
    this.onDisliked,
    this.onDeleted,
    this.onEdited,
    this.showInteractionBar = true,
    this.showMenu = false,
    this.deleting = false,
  });

  final Report report;
  final VoidCallback? onTap;
  final VoidCallback? onLiked;
  final VoidCallback? onDisliked;
  final VoidCallback? onDeleted;
  final VoidCallback? onEdited;
  final bool showInteractionBar;
  final bool showMenu;
  final bool deleting;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context, report),
          const SizedBox(height: SWSizes.s8),
          _buildImage(context, report),
          const SizedBox(height: SWSizes.s8),
          // _buildCategoryList(context, report),
          _buildPlantTitle(context, report.school),
          const SizedBox(height: SWSizes.s4),
          _buildCaption(context, report.description),
          const SizedBox(height: SWSizes.s2),
          _buildTime(context, report.createdAt),
          const SizedBox(height: SWSizes.s8),
          if (showInteractionBar)
            _buildInteractionBar(
              context,
              report: report,
              onLiked: onLiked,
              onDisliked: onDisliked,
            ),
        ],
      ),
    );
  }

  // _buildHeader(BuildContext context, Report report) {
  //   final author = report.author;
  //
  //   return Row(
  //     children: [
  //       CircleAvatar(
  //         foregroundImage:
  //             author.avatar != null ? NetworkImage(author.avatar!) : null,
  //         backgroundColor: kColorPrimary50,
  //         child: const Icon(Icons.person, color: kColorPrimary100),
  //       ),
  //       const SizedBox(width: SWSizes.s8),
  //       Expanded(
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Row(
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 Text(
  //                   author.name,
  //                   overflow: TextOverflow.ellipsis,
  //                   style: Theme.of(context)
  //                       .textTheme
  //                       .bodyMedium
  //                       ?.copyWith(fontWeight: FontWeight.bold),
  //                 ),
  //                 const SizedBox(width: SWSizes.s8),
  //                 Container(
  //                   width: SWSizes.s4,
  //                   height: SWSizes.s4,
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(SWSizes.s2),
  //                     color: kColorNeutral900,
  //                   ),
  //                 ),
  //                 const SizedBox(width: SWSizes.s8),
  //                 Expanded(
  //                   child: Text(
  //                     '${report.school} - ${report.room}',
  //                     overflow: TextOverflow.ellipsis,
  //                     style: Theme.of(context)
  //                         .textTheme
  //                         .bodySmall
  //                         ?.copyWith(color: kColorNeutral200),
  //                   ),
  //                 )
  //               ],
  //             ),
  //             Text(
  //               DateFormat("HH:mm - EE, d MMMM yyyy", "id_ID")
  //                   .format(report.createdAt),
  //               overflow: TextOverflow.ellipsis,
  //               style: Theme.of(context)
  //                   .textTheme
  //                   .bodySmall
  //                   ?.copyWith(color: kColorNeutral200),
  //             ),
  //           ],
  //         ),
  //       ),
  //       if (showMenu && !deleting)
  //         PopupMenuButton(
  //           icon: const Icon(Icons.more_vert),
  //           iconSize: SWSizes.s24,
  //           splashRadius: SWSizes.s16,
  //           padding: EdgeInsets.zero,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(SWSizes.s8),
  //           ),
  //           itemBuilder: (context) => [
  //             PopupMenuItem(
  //               onTap: onEdited,
  //               child: const Text(SWStrings.labelEditPost),
  //             ),
  //             PopupMenuItem(
  //               onTap: onDeleted,
  //               child: const Text(SWStrings.labelDeletePost),
  //             ),
  //           ],
  //         ),
  //       if (deleting) _buildLoadingIndicator(context)
  //     ],
  //   );
  // }
  _buildHeader(BuildContext context, Report report) {
    final author = report.author;

    return Row(
      children: [
        CircleAvatar(
          foregroundImage:
          author.avatar != null ? NetworkImage(author.avatar!) : null,
          backgroundColor: kColorPrimary50,
          child: const Icon(Icons.person, color: kColorPrimary100),
        ),
        const SizedBox(width: SWSizes.s8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                author.name,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      '${report.school} - ${report.room}',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: kColorNeutral200),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        if (showMenu && !deleting)
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            iconSize: SWSizes.s24,
            splashRadius: SWSizes.s16,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(SWSizes.s8),
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: onEdited,
                child: const Text(SWStrings.labelEditPost),
              ),
              PopupMenuItem(
                onTap: onDeleted,
                child: const Text(SWStrings.labelDeletePost),
              ),
            ],
          ),
        if (deleting) _buildLoadingIndicator(context)
      ],
    );
  }

  _buildLoadingIndicator(BuildContext context) {
    return const SizedBox(
      height: SWSizes.s24,
      width: SWSizes.s24,
      child: CircularProgressIndicator(strokeWidth: SWSizes.s2),
    );
  }

  final _pageController = PageController(viewportFraction: 1.1);

  _buildImage(BuildContext context, Report report) {
    return AspectRatio(
      aspectRatio: 5 / 4,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemBuilder: (context, index) => FractionallySizedBox(
              key: ValueKey(report.images[index]),
              widthFactor: 1 / _pageController.viewportFraction,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(SWSizes.s8),
                child: LoadingImage(
                  url: report.images[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            itemCount: report.images.length,
          ),
          // Positioned(
          //   top: SWSizes.s8,
          //   right: SWSizes.s16,
          //   child: CategoryChip(
          //     label: report.isActive ? 'Aktif' : 'Tidak Aktif',
          //     backgroundColor: report.isActive ? kColorSuccess300 : kColorNeutral40,
          //     foregroundColor: report.isActive ? kColorNeutral0 : kColorNeutral600,
          //   ),
          // ),
        ],
      ),
    );
  }

  _buildCategoryList(BuildContext context, Report report) {
    final categories = [
      report.category.type.capitalize(),
      report.category.name,
    ];


    return SizedBox(
      height: SWSizes.s32,
      child: ListView.separated(
        itemBuilder: (context, index) => CategoryChip(label: categories[index]),
        separatorBuilder: (context, index) => const SizedBox(width: SWSizes.s8),
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
  _buildPlantTitle(BuildContext context, String text){
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: Theme.of(context)
          .textTheme
          .headlineLarge
          ?.copyWith(color: kColorNeutral200),
    );
  }

  _buildCaption(BuildContext context, String text) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(color: kColorNeutral200),
    );
  }

  _buildTime(BuildContext context, DateTime date){
    return Text(
      DateFormat("EE, d MMMM yyyy - HH:mm", "id_ID")
          .format(date),
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context)
          .textTheme
          .bodySmall
          ?.copyWith(color: kColorNeutral200),
    );
  }

  _buildInteractionButton(
    BuildContext context, {
    required IconData icon,
    required int count,
    Color? color,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
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

  _buildInteractionBar(
    BuildContext context, {
    required Report report,
    VoidCallback? onLiked,
    VoidCallback? onDisliked,
  }) {
    return Row(
      children: [
        _buildInteractionButton(
          context,
          icon: Icons.thumb_up_rounded,
          count: report.likesCount,
          color: report.liked == true
              ? Theme.of(context).primaryColor
              : kColorNeutral200,
          onTap: onLiked,
        ),
        const SizedBox(width: SWSizes.s16),
        _buildInteractionButton(
          context,
          icon: Icons.thumb_down_rounded,
          count: report.dislikesCount,
          color: report.liked == false
              ? Theme.of(context).primaryColor
              : kColorNeutral200,
          onTap: onDisliked,
        ),
        const SizedBox(width: SWSizes.s16),
        _buildInteractionButton(
          context,
          icon: Icons.comment_rounded,
          count: report.commentsCount,
          color: kColorNeutral200,
        ),
      ],
    );
  }
}

class ReportCardShimmer extends StatelessWidget {
  const ReportCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ShimmerContainer(
              height: 40,
              width: 40,
              borderRadius: 20,
            ),
            SizedBox(width: SWSizes.s8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerContainer(
                  height: SWSizes.s16,
                  width: 100,
                ),
                SizedBox(height: SWSizes.s4),
                ShimmerContainer(
                  height: SWSizes.s16 - 2,
                  width: 150,
                ),
              ],
            ),
            Spacer(),
            ShimmerContainer(
              height: 40,
              width: SWSizes.s16,
            ),
          ],
        ),
        SizedBox(height: SWSizes.s8),
        AspectRatio(
          aspectRatio: 5 / 4,
          child: ShimmerContainer(),
        ),
        SizedBox(height: SWSizes.s8),
        Row(
          children: [
            ShimmerContainer(
              height: SWSizes.s24,
              width: SWSizes.s64,
            ),
            SizedBox(width: SWSizes.s8),
            ShimmerContainer(
              height: SWSizes.s24,
              width: SWSizes.s64,
            ),
            Spacer(),
            ShimmerContainer(
              height: SWSizes.s24,
              width: SWSizes.s64,
            ),
          ],
        ),
        SizedBox(height: SWSizes.s8),
        ShimmerContainer(
          height: SWSizes.s16 - 2,
          width: 150,
        ),
      ],
    );
  }
}
