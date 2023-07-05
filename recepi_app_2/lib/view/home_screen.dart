import 'package:flutter/material.dart';
import 'package:recepi_app_2/model/recipe.api.dart';
import 'package:recepi_app_2/view/widget/recepi_card.dart';

import '../model/recipe.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Recipe> _recipes;

  bool _isLoading = true;

  // initstate
  @override
  void initState() {
    super.initState();

    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecepi();

    setState(() {
      _isLoading = false;
    });

    // print(_recipes);
    print("Name : ${_recipes[0].name}");
    print("Rating : ${_recipes[0].rating.toString()}");
    print("Total Time : ${_recipes[0].totalTime}");
    print("Image : ${_recipes[0].images}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.restaurant_menu, size: 30),
            SizedBox(width: 10),
            Text(
              "Recepi App",
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _recipes.length,
              itemBuilder: (context, index) {
                return RecipeCard(
                    title: _recipes[index].name,
                    cookTime: _recipes[index].totalTime,
                    rating: _recipes[index].rating.toString(),
                    thumbnailUrl: _recipes[index].images);
              },
            ),
    );
  }
}
