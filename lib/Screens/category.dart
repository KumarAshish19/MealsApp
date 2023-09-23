import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals/Others/categorydummydata.dart';
import 'package:meals/Others/meal.dart';
import 'package:meals/Screens/Meals.dart';
import 'package:meals/Screens/categoryitems.dart';
import 'package:meals/Others/foodcategory.dart';

class categoriesscreen extends StatefulWidget {
  categoriesscreen({super.key, required this.availablemeals});
  final List<Meal> availablemeals;

  @override
  State<categoriesscreen> createState() => _categoriesscreenState();
}

class _categoriesscreenState extends State<categoriesscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  void _selectedcategory(BuildContext context, foodcategory category) {
    final filteredmeals = widget.availablemeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredmeals,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (final category in availableCategories)
            Categoryitems(
              category: category,
              onselectcategory: () {
                _selectedcategory(context, category);
              },
            )
        ],
      ),
      builder: (context, child) => SlideTransition(
        position: Tween(
            begin: const Offset(0, 0.3),
            end: const Offset(0, 0),
          ).animate(CurvedAnimation(parent: animationController, curve: Curves.easeInOut)),
        child: child,
    ),
    );
  }
}
