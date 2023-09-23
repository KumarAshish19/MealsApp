import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals/Others/categorydummydata.dart';
import 'package:meals/Screens/Filters.dart';
import 'package:meals/Screens/Meals.dart';
import 'package:meals/Screens/category.dart';
import 'package:meals/widgets/sidedrawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favouritesprovider.dart';
import 'package:meals/providers/filtersprovider.dart';

const kinitialfilters={
  Filters.glutenfree: false,
    Filters.lactosefree: false,
    Filters.vegetarian: false,
    Filters.vegan: false,
};

class Tabscreen extends ConsumerStatefulWidget {
  const Tabscreen({super.key});

  @override
  ConsumerState<Tabscreen> createState() {
    return _Tabscreen();
  }
}

class _Tabscreen extends ConsumerState<Tabscreen> {
  int _selectedpageindex = 0;


  void setscreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'Filters') {
      await Navigator.of(context).push<Map<Filters,bool>>(
        MaterialPageRoute(
          builder: (ctx) => Filterscreen(),
        ),
      );
    }
  }

  
  void _selectpage(int index) {
    setState(() {
      _selectedpageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final availablemeals=ref.watch(filteredmealsprovider);

    Widget activepage = categoriesscreen(
      availablemeals: availablemeals,
    );
    var activepagetitle = 'Categories';
    if (_selectedpageindex == 1) {
      final favouritemeals= ref.watch(favouritemealsprovider);
      activepage = MealsScreen(
        meals: favouritemeals,
      );
      activepagetitle = "Favourites";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activepagetitle),
      ),
      drawer: SideDrawer(
        onselectscreen: setscreen,
      ),
      body: activepage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
        currentIndex: _selectedpageindex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
    );
  }
}
