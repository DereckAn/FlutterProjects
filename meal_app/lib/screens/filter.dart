import 'package:flutter/material.dart';
import 'package:meal_app/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key, });
  // final Map<Filter, bool> actualFilters;

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  var _gluttenFree = false;
  var _vegetarian = false;
  var _lactoseFree = false;
  var _vegan = false;

  @override
  void initState() {
    super.initState();
    final actualFilters = ref.read(filterProvider);
    _gluttenFree = actualFilters[Filter.glutenFree]!;
    _lactoseFree = actualFilters[Filter.lactoseFree]!;
    _vegetarian = actualFilters[Filter.vegetarian]!;
    _vegan = actualFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (iden) {
      //     Navigator.of(context).pop();
      //     if (iden == 'meals') {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(
      //           builder: (context) => const TabsScreen(),
      //         ),
      //       );
      //     }
      //   },
      // ),
      body: WillPopScope(
        onWillPop: ()  async {
          ref.read(filterProvider.notifier).setFilters({
            Filter.glutenFree: _gluttenFree,
            Filter.lactoseFree: _lactoseFree,
            Filter.vegetarian: _vegetarian,
            Filter.vegan: _vegan,
          });
          // Navigator.of(context).pop({
          //   Filter.glutenFree: _gluttenFree,
          //   Filter.lactoseFree: _lactoseFree,
          //   Filter.vegetarian: _vegetarian,
          //   Filter.vegan: _vegan,
          // });
          return true;
          
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _gluttenFree,
              onChanged: (ischecked) {
                setState(() {
                  _gluttenFree = ischecked;
                });
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
              value: _lactoseFree,
              onChanged: (ischecked) {
                setState(() {
                  _lactoseFree = ischecked;
                });
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
              value: _vegetarian,
              onChanged: (ischecked) {
                setState(() {
                  _vegetarian = ischecked;
                });
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
              value: _vegan,
              onChanged: (ischecked) {
                setState(() {
                  _vegan = ischecked;
                });
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
      ),
    );
  }
}
