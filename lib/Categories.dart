import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/Meals.dart';
import 'package:meals_app/data/DummyData.dart';
import 'package:meals_app/models/Categories.dart';
import 'package:meals_app/widgets/CategoryGridItem.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  void selectedCategory(BuildContext context, Category category) {
    var meals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(title: category.title, meals: meals),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              selectedCategory(context, category);
            },
          )
      ],
    );
  }
}
