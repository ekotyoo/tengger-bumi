import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/constants/constant.dart';
import '../../../../common/models/regency.dart';
import '../../../../common/widgets/title_with_caption.dart';
import '../../domain/category.dart';
import '../report_feed/report_feed_controller.dart';

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
  String _query = '';
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController(text: _query);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(getCategoriesProvider);
    final reportQuery = ref.watch(reportFilterStateProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SWSizes.s16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: SWSizes.s16),
          TitleWithCaption(title: widget.label),
          const SizedBox(height: SWSizes.s16),
          TextField(
            controller: _searchController,
            maxLines: 1,
            enabled: categoriesAsync.when(
              data: (data) => true,
              error: (error, stackTrace) => false,
              loading: () => false,
            ),
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: const InputDecoration(
              hintText: SWStrings.labelSearchPlant,
              suffixIcon: Icon(Icons.search_rounded),
            ),
            onChanged: (value) {
              setState(() {
                _query = value;
              });
            },
          ),
          const SizedBox(height: SWSizes.s16),
          categoriesAsync.when(
            data: (data) {
              List<Category> filteredCategories = data
                  .where((element) => element.name.toLowerCase().contains(_query.toLowerCase()))
                  .toList();
              return Expanded(
                child: ListView.separated(
                  itemCount: filteredCategories.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      ref
                          .read(reportFilterStateProvider.notifier)
                          .updateFilterState(
                            reportQuery.copyWith(
                              category: reportQuery.category ==
                                      filteredCategories[index]
                                  ? null
                                  : filteredCategories[index],
                            ),
                          );
                      context.pop();
                    },
                    child: Container(
                      color: reportQuery.category == filteredCategories[index]
                          ? Theme.of(context).splashColor
                          : null,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          filteredCategories[index].name,
                        ),
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: SWSizes.s8),
                ),
              );
            },
            error: (error, stackTrace) => Center(child: Text(error.toString())),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}


class PlantingAreaFilterList extends ConsumerStatefulWidget {
  const PlantingAreaFilterList({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  ConsumerState<PlantingAreaFilterList> createState() => _PlantingAreaFilterListState();
}

class _PlantingAreaFilterListState extends ConsumerState<PlantingAreaFilterList> {
  String _query = '';
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController(text: _query);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final regenciesAsync = ref.watch(getAllRegenciesProvider);
    final reportQuery = ref.watch(reportFilterStateProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SWSizes.s16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: SWSizes.s16),
          TitleWithCaption(title: widget.label),
          const SizedBox(height: SWSizes.s16),
          TextField(
            controller: _searchController,
            maxLines: 1,
            enabled: regenciesAsync.when(
              data: (data) => true,
              error: (error, stackTrace) => false,
              loading: () => false,
            ),
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: const InputDecoration(
              hintText: SWStrings.labelSearchPlant,
              suffixIcon: Icon(Icons.search_rounded),
            ),
            onChanged: (value) {
              setState(() {
                _query = value;
              });
            },
          ),
          const SizedBox(height: SWSizes.s16),
          regenciesAsync.when(
            data: (data) {
              List<Regency> filteredCategories = data
                  .where((element) => element.name.toLowerCase().contains(_query.toLowerCase()))
                  .toList();
              return Expanded(
                child: ListView.separated(
                  itemCount: filteredCategories.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      ref
                          .read(reportFilterStateProvider.notifier)
                          .updateFilterState(
                        reportQuery.copyWith(
                          regency: reportQuery.regency ==
                              filteredCategories[index]
                              ? null
                              : filteredCategories[index],
                        ),
                      );
                      context.pop();
                    },
                    child: Container(
                      color: reportQuery.regency == filteredCategories[index]
                          ? Theme.of(context).splashColor
                          : null,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          filteredCategories[index].name,
                        ),
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                  const SizedBox(height: SWSizes.s8),
                ),
              );
            },
            error: (error, stackTrace) => Center(child: Text(error.toString())),
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}