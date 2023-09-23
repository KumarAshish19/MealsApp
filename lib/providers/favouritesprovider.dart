import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/Others/meal.dart';


class favouritemealsnotifier extends StateNotifier<List<Meal>>
{
  favouritemealsnotifier() : super([]);
  bool  togglemealfavoritestatus(Meal meal)
  {
    final mealisfavourite=state.contains(meal);
    if(mealisfavourite)
    {
      state=state.where((m) =>m.id!=meal.id).toList();
      return false;
    }
    else
    {
      state=[...state, meal];
      return true;
    }
  }
}

final favouritemealsprovider = StateNotifierProvider<favouritemealsnotifier,List<Meal>>((ref){
  return favouritemealsnotifier();
});