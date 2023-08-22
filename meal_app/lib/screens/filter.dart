import 'package:flutter/material.dart';
import 'package:meal_app/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key, });
  // final Map<Filter, bool> actualFilters;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: 
      // WillPopScope(
      //   onWillPop: ()  async {
      //     ref.read(filterProvider.notifier).setFilters({
      //       Filter.glutenFree: _gluttenFree,
      //       Filter.lactoseFree: _lactoseFree,
      //       Filter.vegetarian: _vegetarian,
      //       Filter.vegan: _vegan,
      //     });
      //     // Navigator.of(context).pop({
      //     //   Filter.glutenFree: _gluttenFree,
      //     //   Filter.lactoseFree: _lactoseFree,
      //     //   Filter.vegetarian: _vegetarian,
      //     //   Filter.vegan: _vegan,
      //     // });
      //     return true;
          
      //   },
        Column(
          children: [
            SwitchListTile(
              value: activeFilters[Filter.glutenFree]!,
              onChanged: (ischecked) {
                ref.read(filterProvider.notifier).toggle(Filter.glutenFree, ischecked);
                // setState(() {
                //   _gluttenFree = ischecked;
                // });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include gluten-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
      
            SwitchListTile(
              value: activeFilters[Filter.lactoseFree]!,
              onChanged: (ischecked) {
                ref.read(filterProvider.notifier).toggle(Filter.lactoseFree, ischecked);

                // setState(() {
                //   _lactoseFree = ischecked;
                // });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include lactose-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
      
            SwitchListTile(
              value: activeFilters[Filter.vegetarian]!,
              onChanged: (ischecked) {
                ref.read(filterProvider.notifier).toggle(Filter.vegetarian, ischecked);

                // setState(() {
                //   _vegetarian = ischecked;
                // });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include vegetarian meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),

            SwitchListTile(
              value: activeFilters[Filter.vegan]!,
              onChanged: (ischecked) {
                ref.read(filterProvider.notifier).toggle(Filter.vegan, ischecked);

                // setState(() {
                //   _vegan = ischecked;
                // });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include vegan meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      );
  }
}
