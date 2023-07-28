enum Complexity {
  simple,
  medium,
  difficult,
}

enum Cost {
  cheap,
  fair,
  expensive,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final Complexity complexity;
  final Cost cost;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.complexity,
    required this.cost,
  });

    Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categories': categories,
      'title': title,
      'imageUrl': imageUrl,
      'ingredients': ingredients,
      'steps': steps,
      'duration': duration,
      'isGlutenFree': isGlutenFree ? 1 : 0,
      'isLactoseFree': isLactoseFree ? 1 : 0,
      'isVegan': isVegan ? 1 : 0,
      'isVegetarian': isVegetarian ? 1 : 0,
      'complexity': complexity.toString(),
      'cost': cost.toString(),
    };
  }

   factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['id'],
      categories: List<String>.from(map['categories']),
      title: map['title'],
      imageUrl: map['imageUrl'],
      ingredients: List<String>.from(map['ingredients']),
      steps: List<String>.from(map['steps']),
      duration: map['duration'],
      isGlutenFree: map['isGlutenFree'] == 1,
      isLactoseFree: map['isLactoseFree'] == 1,
      isVegan: map['isVegan'] == 1,
      isVegetarian: map['isVegetarian'] == 1,
      complexity: Complexity.values.firstWhere((c) => c.toString() == map['complexity']),
      cost: Cost.values.firstWhere((c) => c.toString() == map['cost']),
    );
  }

}
