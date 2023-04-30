import 'package:flutter/material.dart';

import '../../features/report/domain/report.dart';
import '../constants/constant.dart';
import 'category_chip.dart';
import 'loading_image.dart';

class ReportCard extends StatelessWidget {
  ReportCard({super.key, required this.report});

  final Report report;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context, report),
          const SizedBox(height: SWSizes.s8),
          _buildImage(context, report),
          const SizedBox(height: SWSizes.s8),
          _buildCategoryList(context, report),
          const SizedBox(height: SWSizes.s8),
          _buildCaption(context, report.description),
          const SizedBox(height: SWSizes.s8),
          _buildInteractionBar(context, report),
        ],
      ),
    );
  }

  _buildHeader(BuildContext context, Report report) {
    final author = report.author;

    return Row(
      children: [
        CircleAvatar(backgroundImage: NetworkImage(author.avatar)),
        const SizedBox(width: SWSizes.s8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  author.name,
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
                  report.createdAt.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: kColorNeutral200),
                )
              ],
            ),
            Text(
              report.school,
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

  final _pageController = PageController(viewportFraction: 1.1);

  _buildImage(BuildContext context, Report report) {
    return SizedBox(
      height: 1.5 * SWSizes.s160,
      width: double.infinity,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) => FractionallySizedBox(
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
    );
  }

  _buildCategoryList(BuildContext context, Report report) {
    final categories = [report.reportCategory, report.reportType];

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

  _buildCaption(BuildContext context, String text) {
    return Text(
      text,
      textAlign: TextAlign.justify,
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
  }) {
    return Row(
      children: [
        Icon(icon, size: SWSizes.s16, color: color),
        const SizedBox(width: SWSizes.s8),
        Text(
          '$count',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: color),
        ),
      ],
    );
  }

  _buildInteractionBar(BuildContext context, Report report) {
    return Row(
      children: [
        _buildInteractionButton(
          context,
          icon: Icons.thumb_up_rounded,
          count: report.likesCount,
          color: kColorNeutral200,
        ),
        const SizedBox(width: SWSizes.s16),
        _buildInteractionButton(
          context,
          icon: Icons.thumb_down_rounded,
          count: report.dislikesCount,
          color: kColorNeutral200,
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
