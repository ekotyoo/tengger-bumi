import 'package:flutter/material.dart';

import '../constants/constant.dart';
import 'category_chip.dart';
import 'loading_image.dart';

class PostCard extends StatelessWidget {
  PostCard({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          _buildHeader(context),
          const SizedBox(height: SWSizes.s8),
          _buildImage(context),
          const SizedBox(height: SWSizes.s8),
          _buildCategoryList(context),
          const SizedBox(height: SWSizes.s8),
          _buildCaption(context),
          const SizedBox(height: SWSizes.s8),
          _buildInteractionBar(context),
        ],
      ),
    );
  }

  _buildHeader(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(),
        const SizedBox(width: SWSizes.s8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Eko Prasetyo',
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
                  '12 Jan 2023, 14:00',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: kColorNeutral200),
                )
              ],
            ),
            Text(
              'SD Negeri 2 Sidomulyo',
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

  _buildImage(BuildContext context) {
    return SizedBox(
      height: 1.5 * SWSizes.s160,
      width: double.infinity,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) => FractionallySizedBox(
          widthFactor: 1 / _pageController.viewportFraction,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(SWSizes.s8),
            child: const LoadingImage(
              url: 'https://picsum.photos/200/300',
              fit: BoxFit.cover,
            ),
          ),
        ),
        itemCount: 3,
      ),
    );
  }

  _buildCategoryList(BuildContext context) {
    return SizedBox(
      height: SWSizes.s32,
      child: ListView.separated(
        itemBuilder: (context, index) => CategoryChip(label: 'Category-$index'),
        separatorBuilder: (context, index) => const SizedBox(width: SWSizes.s8),
        itemCount: 3,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  _buildCaption(BuildContext context) {
    return Text(
      SWStrings.dummyLongText,
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

  _buildInteractionBar(BuildContext context) {
    return Row(
      children: [
        _buildInteractionButton(context,
            icon: Icons.thumb_up_rounded, count: 20, color: kColorNeutral200),
        const SizedBox(width: SWSizes.s16),
        _buildInteractionButton(context,
            icon: Icons.thumb_down_rounded, count: 20, color: kColorNeutral200),
        const SizedBox(width: SWSizes.s16),
        _buildInteractionButton(context,
            icon: Icons.comment_rounded, count: 20, color: kColorNeutral200),
      ],
    );
  }
}
