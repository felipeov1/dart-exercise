import '../reads.dart';

class Cook {
  final int cookCode;
  String name;
  Cook(this.cookCode, this.name);
}

class Ingredient {
  final int ingredientCode;
  String description;
  Ingredient(this.ingredientCode, this.description);
}

class Recipe {
  final int recipeCode;
  String recipeName;
  double calories;
  final int cookCode;

  Recipe(this.recipeCode, this.recipeName, this.calories, this.cookCode);
}

class RecipeIngredient {
  final int ingredientCode;
  final int recipeCode;
  double quantity;
  String unitOfMeasure;

  RecipeIngredient(this.ingredientCode, this.recipeCode, this.quantity,
      this.unitOfMeasure);
}

List<Cook> cooks = [];
List<Ingredient> ingredients = [];
List<Recipe> recipes = [];
List<RecipeIngredient> recipeIngredients = [];

const int maxCooks = 3;
const int maxIngredients = 15;
const int maxRecipes = 20;
const int maxIngredientsPerRecipe = 3;

int findCook(int code) {
  for (int i = 0; i < cooks.length; i++) {
    if (cooks[i].cookCode == code) return i;
  }
  return -1;
}

String getCookName(int code) {
  int index = findCook(code);
  return (index == -1) ? "Unknown" : cooks[index].name;
}

int findIngredient(int code) {
  for (int i = 0; i < ingredients.length; i++) {
    if (ingredients[i].ingredientCode == code) return i;
  }
  return -1;
}

int findRecipe(int code) {
  for (int i = 0; i < recipes.length; i++) {
    if (recipes[i].recipeCode == code) return i;
  }
  return -1;
}

void addCooks() {
  for (int i = cooks.length; i < maxCooks; i++) {
    int code = readInt("write cook code ${i + 1}: ");
    if (findCook(code) != -1) {
      print("Cook code exists.");
      i--;
      continue;
    }
    String name = readString("write cook name: ");
    cooks.add(Cook(code, name));
  }
  print("cooks added.");
}

void addIngredients() {
  while (ingredients.length < maxIngredients) {
    int code = readInt("write ingredient code (or -1 to stop): ");
    if (code == -1) break;
    if (findIngredient(code) != -1) {
      print("Ingredient code exists.");
      continue;
    }
    String desc = readString("write ingredient description: ");
    ingredients.add(Ingredient(code, desc));
  }
  print("${ingredients.length} ingredients registered.");
}

void addRecipe() {
  if (cooks.isEmpty) {
    print("Register cooks first (Option 1).");
    return;
  }
  if (ingredients.isEmpty) {
    print("Register ingredients first (Option 2).");
    return;
  }
  if (recipes.length >= maxRecipes) {
    print("Max recipes (20) already registered.");
    return;
  }

  int recipeCode = readInt("write recipe code: ");
  if (findRecipe(recipeCode) != -1) {
    print("Recipe code exists.");
    return;
  }

  String recipeName = readString("write recipe name: ");
  double calories = readDouble("write calories per 100g: ");

  int cookCode = readInt("write cook code: ");
  if (findCook(cookCode) == -1) {
    print("Cook not found.");
    return;
  }

  recipes.add(Recipe(recipeCode, recipeName, calories, cookCode));

  print("Add max to 3 ingredients for this recipe.");
  int ingredientCount = 0;
  while (ingredientCount < maxIngredientsPerRecipe) {
    int ingCode = readInt("write ingredient code (or -1 to stop): ");
    if (ingCode == -1) break;

    if (findIngredient(ingCode) == -1) {
      print("Ingredient not found.");
      continue;
    }

    double qty = readDouble("write quantity: ");
    String unit = readString("write unit: ");

    recipeIngredients.add(RecipeIngredient(ingCode, recipeCode, qty, unit));
    ingredientCount++;
  }
  print("Recipe added.");
}

void reportRecipesByCook() {
  int cookCode = readInt("write cook code: ");
  int index = findCook(cookCode);
  if (index == -1) {
    print("Cook not found.");
    return;
  }

  print("Recipes by ${cooks[index].name}:");
  bool found = false;
  for (Recipe r in recipes) {
    if (r.cookCode == cookCode) {
      print("Code: ${r.recipeCode}, Name: ${r.recipeName}, Cals: ${r.calories}");
      found = true;
    }
  }
  if (!found) {
    print("No recipes found for this cook.");
  }
}

void reportRecipesByCalories() {
  double minCal = readDouble("write min calories: ");
  double maxCal = readDouble("write max calories: ");

  print("Recipes between $minCal and $maxCal calories:");
  bool found = false;
  for (Recipe r in recipes) {
    if (r.calories >= minCal && r.calories <= maxCal) {
      print("Code: ${r.recipeCode}, Name: ${r.recipeName}, Cals: ${r.calories}");
      found = true;
    }
  }
  if (!found) {
    print("No recipes found in this range.");
  }
}

void reportRecipeCountPerCook() {
  print("Recipe count per cook:");
  for (Cook c in cooks) {
    int count = 0;
    for (Recipe r in recipes) {
      if (r.cookCode == c.cookCode) {
        count++;
      }
    }
    print("${c.name}: $count recipe(s)");
  }
}

void main() {
  int option = 0;
  do {
    print("1. Add Cooks (3 total)");
    print("2. Add Ingredients (max 15)");
    print("3. Add Recipe (max 20)");
    print("4. Report: Recipes by Cook");
    print("5. Report: Recipes by Calories");
    print("6. Report: Count by Cook");
    print("7. Exit");
    option = readInt("Choose an option: ");

    switch (option) {
      case 1:
        addCooks();
        break;
      case 2:
        addIngredients();
        break;
      case 3:
        addRecipe();
        break;
      case 4:
        reportRecipesByCook();
        break;
      case 5:
        reportRecipesByCalories();
        break;
      case 6:
        reportRecipeCountPerCook();
        break;
      case 7:
        print("Exited");
        break;
      default:
        print("Invalid option.");
    }
  } while (option != 7);
}