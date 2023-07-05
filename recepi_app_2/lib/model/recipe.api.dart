import 'dart:convert';
import 'package:recepi_app_2/model/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecepi() async {
    // uri
    var uri = Uri.https(
        'yummly2.p.rapidapi.com', '/feeds/list', {'limit': '21', 'start': '0'});

    // response
    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': 'd02817346fmsh8c3db43d94fb760p1a3fd5jsn706ca0e27efc',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
      'useQueryString': 'true'
    });

    print(response.statusCode);

    // Maping
    Map data = jsonDecode(response.body);
    List _detailDataMenu = [];
    List _displayData = [];

    for (var i in data['feed']) {
      _detailDataMenu.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_detailDataMenu);
  }
}
