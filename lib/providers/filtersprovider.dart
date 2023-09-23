import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';

enum Filters {
  glutenfree,
  lactosefree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filters, bool>> {
  FiltersNotifier()
      : super({
          Filters.glutenfree: false,
          Filters.lactosefree: false,
          Filters.vegetarian: false,
          Filters.vegan: false,
        });

  void setfilter(Filters filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
  void setfilters(Map<Filters,bool> chosenfilters)
  {
    state=chosenfilters;
  }
}

final filtersprovider =
    StateNotifierProvider<FiltersNotifier, Map<Filters, bool>>(
        (ref) => FiltersNotifier());

final filteredmealsprovider=Provider((ref) {
  final mealresult= ref.watch(mealsprovider);
  final activefilters=ref.watch(filtersprovider);
  return mealresult.where((meal) {
      if(activefilters[Filters.glutenfree]! && !meal.isGlutenFree)
      {
        return false;
      }
      if(activefilters[Filters.lactosefree]! && !meal.isLactoseFree)
      {
        return false;
      }
      if(activefilters[Filters.vegetarian]! && !meal.isVegetarian)
      {
        return false;
      }
      if(activefilters[Filters.vegan]! && !meal.isVegan)
      {
        return false;
      }
      return true;
    } ).toList();
});