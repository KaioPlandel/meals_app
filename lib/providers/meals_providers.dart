import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/DummyData.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});