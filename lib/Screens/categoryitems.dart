import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals/Others/foodcategory.dart';

class Categoryitems extends StatelessWidget {
  Categoryitems({super.key, required this.category,required this.onselectcategory});

  final foodcategory category;
  final void Function() onselectcategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onselectcategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(category.title,style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),),
      ),
    );
  }
}
