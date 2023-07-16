import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../common/constants/constant.dart';
import '../report_feed/report_feed_controller.dart';

part 'filter_list.g.dart';

@riverpod
class PlantCategoryQuery extends _$PlantCategoryQuery {
  @override
  String? build() {
    return null;
  }

  void updateFilterQuery(String? value) => state = value;
}

class CategoryFilterList extends ConsumerStatefulWidget {
  const CategoryFilterList({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  ConsumerState<CategoryFilterList> createState() => _CategoryFilterListState();
}

class _CategoryFilterListState extends ConsumerState<CategoryFilterList> {
  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(getCategoriesProvider);
    final reportQuery = ref.watch(reportFilterStateProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SWSizes.s16),
      child: Column(
        children: [
          const SizedBox(height: SWSizes.s16),
          TextField(
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: const InputDecoration(
              hintText: SWStrings.labelSearchPlant,
              suffixIcon: Icon(Icons.search_rounded),
            ),
            onChanged: (value) {
              ref.read(plantCategoryQueryProvider.notifier).updateFilterQuery(value);
            },
          ),
          const SizedBox(height: SWSizes.s16),
          categoriesAsync.when(
            data: (data) => Expanded(
              child: ListView.separated(
                itemCount: data.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    ref
                        .read(reportFilterStateProvider.notifier)
                        .updateFilterState(
                      reportQuery.copyWith(
                        category:
                        reportQuery.category == data[index]
                            ? null
                            : data[index],
                      ),
                    );
                    context.pop();
                  },
                  child: Container(
                    color: reportQuery.category == data[index]
                        ? Theme.of(context).splashColor
                        : null,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        data[index].name,
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) =>
                const SizedBox(height: SWSizes.s8),
              ),
            ),
            error: (error, stackTrace) => Center(child: Text(error.toString())),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
