import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals/Others/foodcategory.dart';
import 'package:meals/Others/meal.dart';
import 'package:meals/Screens/mealdetail.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  MealsScreen({this.title, required this.meals, super.key,});

  final String? title;
  final List<Meal> meals;
  
  void showmealdetail(BuildContext context,Meal meal)
  {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> mealdetail(meal: meal,)));
  }
  @override
  Widget build(BuildContext context) {
    Widget content =
        ListView.builder(itemCount: meals.length,itemBuilder: (ctx, index) => MealItem(meal: meals[index],onselectmeal:(meal){showmealdetail(context,meal);} ,),);
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Uh oh ... nothing here! ",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Try selecting a different Food Category",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ],
        ),
      );
    }
    if(title==null)
    {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
