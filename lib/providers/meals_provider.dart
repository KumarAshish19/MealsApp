import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/Others/categorydummydata.dart';

final mealsprovider=Provider((ref){
  return dummyMeals;
});