import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/constants/constant.dart';
import '../../common/routing/routes.dart';
import '../../common/widgets/app_logo.dart';
import '../../common/widgets/category_chip.dart';
import '../../common/widgets/post_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(SWStrings.labelReportTimeline),
          actions: const [AppLogo()],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: SWSizes.s16),
            SizedBox(
              height: SWSizes.s32,
              child: Row(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: 20,
                      padding:
                          const EdgeInsets.symmetric(horizontal: SWSizes.s16),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: SWSizes.s8),
                      itemBuilder: (context, index) => SelectChip(
                        label: 'Category-$index',
                        selected: index == 0,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: SWSizes.s8),
                      child: const Center(child: Icon(Icons.more_vert_rounded)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: SWSizes.s16),
            const Expanded(
              child: PostFeed(),
            ),
          ],
        ),
      ),
    );
  }
}

class PostFeed extends StatefulWidget {
  const PostFeed({super.key});

  @override
  State<PostFeed> createState() => _PostFeedState();
}

class _PostFeedState extends State<PostFeed> {
  final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: () => Future.delayed(const Duration(seconds: 2)),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        padding: const EdgeInsets.symmetric(horizontal: SWSizes.s16),
        itemBuilder: (context, index) => PostCard(
          onTap: () => context.pushNamed(Routes.reportDetail),
        ),
        separatorBuilder: (context, index) =>
            const SizedBox(height: SWSizes.s16),
      ),
    );
  }
}
