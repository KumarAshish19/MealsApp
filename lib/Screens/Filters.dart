import 'package:flutter/material.dart';
import 'package:meals/Screens/tabs.dart';
import 'package:meals/widgets/sidedrawer.dart';
import 'package:meals/providers/filtersprovider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Filterscreen extends ConsumerWidget {
  const Filterscreen({super.key,});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final activefilters=ref.watch(filtersprovider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters!"),
      ),
      
      body: Column(
          children: [
            SwitchListTile(
              value: activefilters[Filters.glutenfree]!,
              onChanged: (isChecked) {
                ref.read(filtersprovider.notifier).setfilter(Filters.glutenfree, isChecked);
              },
              title: Text(
                "Gluten Free!",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include fluten-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            const SizedBox(
              height: 10,
            ),
            SwitchListTile(
              value: activefilters[Filters.lactosefree]!,
              onChanged: (isChecked) {
                ref.read(filtersprovider.notifier).setfilter(Filters.lactosefree, isChecked);
              },
              title: Text(
                "Lactose Free!",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include Lactose-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            const SizedBox(
              height: 10,
            ),
           SwitchListTile(
              value: activefilters[Filters.vegetarian]!,
              onChanged: (isChecked) {
                ref.read(filtersprovider.notifier).setfilter(Filters.vegetarian, isChecked);
              },
              title: Text(
                "Vegetarian!",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include Vegetarian meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            const SizedBox(
              height: 10,
            ),
            SwitchListTile(
              value: activefilters[Filters.vegan]!,
              onChanged: (isChecked) {
                ref.read(filtersprovider.notifier).setfilter(Filters.vegan, isChecked);
              },
              title: Text(
                "Vegan!",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              subtitle: Text(
                'Only include Vegan meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
    );
  }
}